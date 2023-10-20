Return-Path: <linux-modules+bounces-112-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D38D7D0A83
	for <lists+linux-modules@lfdr.de>; Fri, 20 Oct 2023 10:27:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDF70B21384
	for <lists+linux-modules@lfdr.de>; Fri, 20 Oct 2023 08:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D991095F;
	Fri, 20 Oct 2023 08:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-modules@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC32710955
	for <linux-modules@vger.kernel.org>; Fri, 20 Oct 2023 08:27:47 +0000 (UTC)
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 93682C0;
	Fri, 20 Oct 2023 01:27:44 -0700 (PDT)
Received: from localhost.localdomain (unknown [219.141.250.2])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 7861260327055;
	Fri, 20 Oct 2023 16:27:35 +0800 (CST)
X-MD-Sfrom: zhoujie@nfschina.com
X-MD-SrcIP: 219.141.250.2
From: ZhouJie <zhoujie@nfschina.com>
To: mcgrof@kernel.org
Cc: linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ZhouJie <zhoujie@nfschina.com>
Subject: [PATCH] =?UTF-8?q?module:=20main:=20Remove=20unnecessary=20?= =?UTF-8?q?=E2=80=980=E2=80=99=20values=20from=20err?=
Date: Fri, 20 Oct 2023 16:27:27 +0800
Message-Id: <20231020082727.10659-1-zhoujie@nfschina.com>
X-Mailer: git-send-email 2.18.2
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Remove redundant assignment .The variable 'err' was assigned a value
before its usage, making the initial assignment unnecessary. This commit
removes the redundant assignment, improving code clarity and efficiency.

Signed-off-by: ZhouJie <zhoujie@nfschina.com>
---
 kernel/module/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 98fedfdb8db52..a3c036eb7bcdb 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2830,7 +2830,7 @@ static int load_module(struct load_info *info, const char __user *uargs,
 {
 	struct module *mod;
 	bool module_allocated = false;
-	long err = 0;
+	long err;
 	char *after_dashes;
 
 	/*
-- 
2.18.2


