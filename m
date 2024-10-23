Return-Path: <linux-modules+bounces-2340-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D44E19AD66D
	for <lists+linux-modules@lfdr.de>; Wed, 23 Oct 2024 23:14:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9161D283B64
	for <lists+linux-modules@lfdr.de>; Wed, 23 Oct 2024 21:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A1E71F12EA;
	Wed, 23 Oct 2024 21:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UBMraUEF"
X-Original-To: linux-modules@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867E91E7C28
	for <linux-modules@vger.kernel.org>; Wed, 23 Oct 2024 21:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729718065; cv=none; b=MQhFdJeiQeVMv89cXGVjvsePWJpcOJLu9YaUIz1E8gZ8dibO8pUQfUnd+Iaffzkud0GFjIdS0Lrz63n1skE2FHjCd9GXzUEUxhgUKeynO8nPH1UihqsXno8hh7QnFxRC08pRrvQMbzj/UKA2/la+Iii8KIfStXjBp0SUP7Sjp4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729718065; c=relaxed/simple;
	bh=8nQwDzRZMEEccD2/QDJcj2ANlOCR6o7eEanPcy3VeIc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=U01X4ZC5laFNex3kR8cLuBiRxXi4VwG6EryOumlC+61Myc+oz19r85uHTl+9LerzW8/jY44gskTYi2jDrhG7aXoYOGPMvx5Ghw8jRv+p/LOY69Zf+TlVZntaCEwK/vGf3LifQBS4gTStzBEY7LwFgf7QhP+uJMSGyw7XmKDEy4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UBMraUEF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729718062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EhHsFXeHGq8GrsrwQBQKdWbjYOo8uENaYKPAHKoXKFI=;
	b=UBMraUEFOXprJb8co9du5sFXPSXrKtF4Bqd/6d2keevdrh5N83L9MvW/0zi3+diZDCyfnU
	l00tpjflfviJLPXgOKI2fiDiaorRv21Twaw/Zb6cGOpwWAYheFwIFewrbVci17r97834Fc
	PXTKXwYHDBaWNtDrr2FlkIo9+bfK+70=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-528-0u1JrsP0MNW569a32udyUw-1; Wed,
 23 Oct 2024 17:14:19 -0400
X-MC-Unique: 0u1JrsP0MNW569a32udyUw-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5285F195609E;
	Wed, 23 Oct 2024 21:14:17 +0000 (UTC)
Received: from madcap2.tricolour.com (unknown [10.22.58.9])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C3D7E300018D;
	Wed, 23 Oct 2024 21:14:14 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@lists.linux-audit.osci.io>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-modules@vger.kernel.org,
	Linux Kernel Audit Mailing List <audit@vger.kernel.org>
Cc: Paul Moore <paul@paul-moore.com>,
	Eric Paris <eparis@parisplace.org>,
	Steve Grubb <sgrubb@redhat.com>,
	Richard Guy Briggs <rgb@redhat.com>
Subject: [PATCH v1] audit,module: restore audit logging in load failure case
Date: Wed, 23 Oct 2024 17:13:20 -0400
Message-ID: <999cdd694f951acd2f4ad665fe7ab97d0834e162.1729717542.git.rgb@redhat.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

The move of the module sanity check to earlier skipped the audit logging
call in the case of failure and to a place where the previously used
context is unavailable.

Add an audit logging call for the module loading failure case and get
the module name when possible.

Link: https://issues.redhat.com/browse/RHEL-52839
Fixes: 02da2cbab452 ("module: move check_modinfo() early to early_mod_check()")
Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 kernel/module/main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 49b9bca9de12..1f482532ef66 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -3057,8 +3057,10 @@ static int load_module(struct load_info *info, const char __user *uargs,
 	 * failures once the proper module was allocated and
 	 * before that.
 	 */
-	if (!module_allocated)
+	if (!module_allocated) {
+		audit_log_kern_module(info->name ? info->name : "(unavailable)");
 		mod_stat_bump_becoming(info, flags);
+	}
 	free_copy(info, flags);
 	return err;
 }
-- 
2.43.5


