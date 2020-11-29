Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 890272C7A16
	for <lists+linux-modules@lfdr.de>; Sun, 29 Nov 2020 17:50:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728185AbgK2QtO (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Sun, 29 Nov 2020 11:49:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52932 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728188AbgK2QtO (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Sun, 29 Nov 2020 11:49:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606668468;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Va0pzBP0WDRC54+jdQgx8b2/fG4XqgFxvXzJV2H9QVY=;
        b=Ms3aw4nKz5R8l15192I8DCKg7JDNPQdhD2lOO0DH1v6dXAfPbN9dOkOsO6mOGYkv+3g5xM
        1qfSAZjtbgMOu2Me2TCkMYZyPLVhk8Ifgm1YP5SOQbaXbqyBMPiQh0XO1M2YU/2kaA53NF
        hySYq6OzJNbam1QroioS3l7YbhVuVEw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-IU4LhKG2NX-6Owplt1jxhA-1; Sun, 29 Nov 2020 11:47:44 -0500
X-MC-Unique: IU4LhKG2NX-6Owplt1jxhA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 692D71E7EF;
        Sun, 29 Nov 2020 16:47:43 +0000 (UTC)
Received: from astarta.redhat.com (ovpn-112-95.ams2.redhat.com [10.36.112.95])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 33ABE5D9D2;
        Sun, 29 Nov 2020 16:47:39 +0000 (UTC)
From:   Yauheni Kaliuta <yauheni.kaliuta@redhat.com>
To:     linux-modules@vger.kernel.org
Cc:     lucas.de.marchi@gmail.com,
        Yauheni Kaliuta <yauheni.kaliuta@redhat.com>
Subject: [PATCH 1/3] libkmod: kmod_builtin_get_modinfo: free modinfo on error
Date:   Sun, 29 Nov 2020 18:47:35 +0200
Message-Id: <20201129164737.135866-1-yauheni.kaliuta@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

The function allocates array but on building it if get_string()
fails it returns the error leaving the array allocated. The caller
does not care about it in error case either.

Free it to fix memory leak.

Signed-off-by: Yauheni Kaliuta <yauheni.kaliuta@redhat.com>
---
 libkmod/libkmod-builtin.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/libkmod/libkmod-builtin.c b/libkmod/libkmod-builtin.c
index aaec5ddb0609..fc9a37644261 100644
--- a/libkmod/libkmod-builtin.c
+++ b/libkmod/libkmod-builtin.c
@@ -314,6 +314,7 @@ ssize_t kmod_builtin_get_modinfo(struct kmod_ctx *ctx, const char *modname,
 		offset = get_string(iter, pos, &line, &linesz);
 		if (offset <= 0) {
 			count = (offset) ? -errno : -EOF;
+			free(*modinfo);
 			goto fail;
 		}
 
-- 
2.29.2

