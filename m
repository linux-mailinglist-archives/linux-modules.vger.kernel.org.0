Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FADC709081
	for <lists+linux-modules@lfdr.de>; Fri, 19 May 2023 09:41:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbjESHlX (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Fri, 19 May 2023 03:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230262AbjESHlW (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Fri, 19 May 2023 03:41:22 -0400
Received: from forward102b.mail.yandex.net (forward102b.mail.yandex.net [178.154.239.149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCC35198
        for <linux-modules@vger.kernel.org>; Fri, 19 May 2023 00:41:18 -0700 (PDT)
Received: from mail-nwsmtp-smtp-production-main-78.myt.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-78.myt.yp-c.yandex.net [IPv6:2a02:6b8:c12:1105:0:640:2966:0])
        by forward102b.mail.yandex.net (Yandex) with ESMTP id 9275B60038;
        Fri, 19 May 2023 10:41:16 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-78.myt.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id AfYBPfYDS4Y0-aWS0BRtJ;
        Fri, 19 May 2023 10:41:16 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1684482076;
        bh=P8ZSONbeRW+2HPFiCG6C8eaDnSmOiW2W91YDo36A0DQ=;
        h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
        b=V4fPqX178jX0LRHAjt2WE8O1ubMhf4B3nYDSoAEPIXbCecY345iMra+mLawMNqgSM
         K3gFd5kD8PgbLgo8zTYUSoy2iWuFNgBUEmedKjF7UM0z0yn5pg9taf11ZI8aoImPGu
         jI8co8XJOigwJguABZIvAEFpiuZn6VgF0vEDjSM4=
Authentication-Results: mail-nwsmtp-smtp-production-main-78.myt.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From:   Dmitry Antipov <dmantipov@yandex.ru>
To:     linux-modules@vger.kernel.org
Cc:     Dmitry Antipov <dmantipov@yandex.ru>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] shared: avoid passing {NULL, 0} array to bsearch()
Date:   Fri, 19 May 2023 10:41:08 +0300
Message-Id: <20230519074108.401180-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <926001fd-34bb-83ee-be77-ccbded164615@csgroup.eu>
References: <926001fd-34bb-83ee-be77-ccbded164615@csgroup.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

Fix the following warning reported by UBSan (as of gcc-13.1.1):

shared/hash.c:244:35: runtime error: null pointer passed as
argument 2, which is declared to never be null

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 shared/hash.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/shared/hash.c b/shared/hash.c
index 7fe3f80..f90e22d 100644
--- a/shared/hash.c
+++ b/shared/hash.c
@@ -241,12 +241,13 @@ void *hash_find(const struct hash *hash, const char *key)
 		.key = key,
 		.value = NULL
 	};
-	const struct hash_entry *entry = bsearch(
-		&se, bucket->entries, bucket->used,
-		sizeof(struct hash_entry), hash_entry_cmp);
-	if (entry == NULL)
+	if (bucket->entries) {
+		const struct hash_entry *entry =
+			bsearch(&se, bucket->entries, bucket->used,
+				sizeof(struct hash_entry), hash_entry_cmp);
+		return entry ? (void *)entry->value : NULL;
+	} else
 		return NULL;
-	return (void *)entry->value;
 }
 
 int hash_del(struct hash *hash, const char *key)
-- 
2.40.1

