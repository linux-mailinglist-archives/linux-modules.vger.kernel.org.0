Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C951709059
	for <lists+linux-modules@lfdr.de>; Fri, 19 May 2023 09:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbjESH2e (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Fri, 19 May 2023 03:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjESH2d (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Fri, 19 May 2023 03:28:33 -0400
X-Greylist: delayed 92441 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 19 May 2023 00:28:31 PDT
Received: from forward102c.mail.yandex.net (forward102c.mail.yandex.net [IPv6:2a02:6b8:c03:500:1:45:d181:d102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 861A8122
        for <linux-modules@vger.kernel.org>; Fri, 19 May 2023 00:28:31 -0700 (PDT)
Received: from mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net [IPv6:2a02:6b8:c08:1d21:0:640:c9e4:0])
        by forward102c.mail.yandex.net (Yandex) with ESMTP id 81DE46004C;
        Fri, 19 May 2023 10:28:29 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id HSYsawWDU4Y0-SABEbqK4;
        Fri, 19 May 2023 10:28:29 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1684481309;
        bh=rBUQlI8bBMJenHVs9JQCmmz+lgdbvOpn+4j7ku/coFA=;
        h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
        b=OY6Iv72lTckMR+zgsaWLH9LN6ZIqcs5L3POh6azcZ9edtIz6V2tS/Kq9o/VxF6iGX
         FyyYZgnGmJd39Kd8Be3FyuGXCh1Eu7xT59tGJsCj0pTiP3luWTn6cFOJ+E67FSeQG8
         rWUounpeeAWMNBwh994t5frnIS0mtV32NR3bTbx4=
Authentication-Results: mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From:   Dmitry Antipov <dmantipov@yandex.ru>
To:     linux-modules@vger.kernel.org
Cc:     Dmitry Antipov <dmantipov@yandex.ru>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] libkmod: prefer -ENODATA over -ENOENT if no section found
Date:   Fri, 19 May 2023 10:28:12 +0300
Message-Id: <20230519072812.400131-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <367517d8-5c71-c6e7-b929-2f3a2651de44@csgroup.eu>
References: <367517d8-5c71-c6e7-b929-2f3a2651de44@csgroup.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

When the module is definitely present but CONFIG_MODVERSIONS is
disabled, the following error message may be somewhat confusing:

modprobe --dump-modversions /path/to/module.ko.xz
modprobe: FATAL: could not get modversions of /path/to/module.ko.xz: No such file or directory

Choosing among the convenient errno values, I would suggest to use
ENODATA when the module lacks a particular ELF section (and vermagic
as well). So now it is expected to be:

modprobe: FATAL: could not get modversions of /path/to/module.ko.xz: No data available

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 libkmod/libkmod-elf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/libkmod/libkmod-elf.c b/libkmod/libkmod-elf.c
index ef4a8a3..fb2e3d9 100644
--- a/libkmod/libkmod-elf.c
+++ b/libkmod/libkmod-elf.c
@@ -392,7 +392,7 @@ static int elf_find_section(const struct kmod_elf *elf, const char *section)
 		return i;
 	}
 
-	return -ENOENT;
+	return -ENODATA;
 }
 
 int kmod_elf_get_section(const struct kmod_elf *elf, const char *section, const void **buf, uint64_t *buf_size)
@@ -422,7 +422,7 @@ int kmod_elf_get_section(const struct kmod_elf *elf, const char *section, const
 		return 0;
 	}
 
-	return -ENOENT;
+	return -ENODATA;
 }
 
 /* array will be allocated with strings in a single malloc, just free *array */
@@ -653,7 +653,7 @@ int kmod_elf_strip_vermagic(struct kmod_elf *elf)
 	}
 
 	ELFDBG(elf, "no vermagic found in .modinfo\n");
-	return -ENOENT;
+	return -ENODATA;
 }
 
 
-- 
2.40.1

