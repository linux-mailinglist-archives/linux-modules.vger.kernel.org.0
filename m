Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 122A24E4009
	for <lists+linux-modules@lfdr.de>; Tue, 22 Mar 2022 15:05:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236177AbiCVOFf (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Tue, 22 Mar 2022 10:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236054AbiCVOFc (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Tue, 22 Mar 2022 10:05:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E4BE72ED63
        for <linux-modules@vger.kernel.org>; Tue, 22 Mar 2022 07:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647957837;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wTqJ9ZbJUCgx8VrF++WoBF0cwmRu2Y/rNRNUF4x8BCg=;
        b=EOK0hy5dYHrn74jDgP2bOkWosv3vanSClNNJvOB2Az7nL5UQTle+vJLsdqphGDe4H+qi7q
        YBIobjsLbJhf5QWQ4e0XEr7CwYWO6lXSd4xgKC/dxkl34q8fsMOarSdC4FHVlu3zLGSHNH
        Dq/Yv7jia9Ev2JEGH7Nn6vz0bI4TUz0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-zff0ooiEOb--SOLfR45jJQ-1; Tue, 22 Mar 2022 10:03:56 -0400
X-MC-Unique: zff0ooiEOb--SOLfR45jJQ-1
Received: by mail-wm1-f70.google.com with SMTP id r9-20020a1c4409000000b0038c15a1ed8cso1345221wma.7
        for <linux-modules@vger.kernel.org>; Tue, 22 Mar 2022 07:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wTqJ9ZbJUCgx8VrF++WoBF0cwmRu2Y/rNRNUF4x8BCg=;
        b=3leOn3QxvXNKQnpDj8kzyn3DuEh2Kf4l+5omInmNSGvO6D+VbpTbnIGl0db+uWey7/
         mG94qIO2fOYH4RdSNbVyoqSvpRYdCZXSZ4KfjnVRCCzxyAZNtNtd629UG+lv/OiB+pyM
         isk3k49/iSzJvO36QIGKzJfLrDlGuy3Q+B2MVzGdA7vlg793OGfaki7u2BsGvKSTkqDK
         gBng/hDVst89U6+d+/yY6K+Kij1oFwQ/LETNfuL+xBMiVrdkkgMgOFd2+MnFKqLArXs/
         P7NPnA3I2sdRzktFzh56fyAbjl7dX6epRKRt+S0tmFTaCVBunyJ2xDhpgih1VAc99+Oz
         jiHA==
X-Gm-Message-State: AOAM533CRtMVVd9+nNSuJB0ZmK+r4E7iDkfA0DTBbPAF8xJ3rl8nBYlj
        puJoCKqYmR7haQJHdutYnMUgtWDcj2Rm9HP/B12s0MJQFobK7lvz9VH89jCYd+vbpe5X/7JbElq
        JMhvn092Km5PHUEXmdLK185sH
X-Received: by 2002:adf:eec2:0:b0:203:f121:2994 with SMTP id a2-20020adfeec2000000b00203f1212994mr18949177wrp.250.1647957835694;
        Tue, 22 Mar 2022 07:03:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3QF6brUhwxPN8O4fbmdzobovVsKOZCaKS1YVCwkBUqyqZX3zSij5vogVhYKv9b3oJMx5otw==
X-Received: by 2002:adf:eec2:0:b0:203:f121:2994 with SMTP id a2-20020adfeec2000000b00203f1212994mr18949147wrp.250.1647957835515;
        Tue, 22 Mar 2022 07:03:55 -0700 (PDT)
Received: from localhost (cpc111743-lutn13-2-0-cust979.9-3.cable.virginm.net. [82.17.115.212])
        by smtp.gmail.com with ESMTPSA id p14-20020a5d59ae000000b00203dcc87d39sm25592207wrr.54.2022.03.22.07.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 07:03:54 -0700 (PDT)
From:   Aaron Tomlin <atomlin@redhat.com>
To:     mcgrof@kernel.org, christophe.leroy@csgroup.eu
Cc:     cl@linux.com, mbenes@suse.cz, akpm@linux-foundation.org,
        jeyu@kernel.org, linux-kernel@vger.kernel.org,
        linux-modules@vger.kernel.org, void@manifault.com,
        atomlin@atomlin.com, allen.lkml@gmail.com, joe@perches.com,
        msuchanek@suse.de, oleksandr@natalenko.name,
        jason.wessel@windriver.com, pmladek@suse.com,
        daniel.thompson@linaro.org, hch@infradead.org
Subject: [PATCH v12 03/14] module: Make internal.h and decompress.c more compliant
Date:   Tue, 22 Mar 2022 14:03:33 +0000
Message-Id: <20220322140344.556474-4-atomlin@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220322140344.556474-1-atomlin@redhat.com>
References: <20220322140344.556474-1-atomlin@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

This patch will address the following warning and style violations
generated by ./scripts/checkpatch.pl in strict mode:

  WARNING: Use #include <linux/module.h> instead of <asm/module.h>
  #10: FILE: kernel/module/internal.h:10:
  +#include <asm/module.h>

  CHECK: spaces preferred around that '-' (ctx:VxV)
  #18: FILE: kernel/module/internal.h:18:
  +#define INIT_OFFSET_MASK (1UL << (BITS_PER_LONG-1))

  CHECK: Please use a blank line after function/struct/union/enum declarations
  #69: FILE: kernel/module/internal.h:69:
  +}
  +static inline void module_decompress_cleanup(struct load_info *info)
						   ^
  CHECK: extern prototypes should be avoided in .h files
  #84: FILE: kernel/module/internal.h:84:
  +extern int mod_verify_sig(const void *mod, struct load_info *info);

  WARNING: Missing a blank line after declarations
  #116: FILE: kernel/module/decompress.c:116:
  +               struct page *page = module_get_next_page(info);
  +               if (!page) {

  WARNING: Missing a blank line after declarations
  #174: FILE: kernel/module/decompress.c:174:
  +               struct page *page = module_get_next_page(info);
  +               if (!page) {

  CHECK: Please use a blank line after function/struct/union/enum declarations
  #258: FILE: kernel/module/decompress.c:258:
  +}
  +static struct kobj_attribute module_compression_attr = __ATTR_RO(compression);

Note: Fortunately, the multiple-include optimisation found in
include/linux/module.h will prevent duplication/or inclusion more than
once.

Fixes: f314dfea16a ("modsign: log module name in the event of an error")
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Aaron Tomlin <atomlin@redhat.com>
---
 kernel/module/decompress.c | 3 +++
 kernel/module/internal.h   | 6 ++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/kernel/module/decompress.c b/kernel/module/decompress.c
index d14d6443225a..2fc7081dd7c1 100644
--- a/kernel/module/decompress.c
+++ b/kernel/module/decompress.c
@@ -113,6 +113,7 @@ static ssize_t module_gzip_decompress(struct load_info *info,
 
 	do {
 		struct page *page = module_get_next_page(info);
+
 		if (!page) {
 			retval = -ENOMEM;
 			goto out_inflate_end;
@@ -171,6 +172,7 @@ static ssize_t module_xz_decompress(struct load_info *info,
 
 	do {
 		struct page *page = module_get_next_page(info);
+
 		if (!page) {
 			retval = -ENOMEM;
 			goto out;
@@ -256,6 +258,7 @@ static ssize_t compression_show(struct kobject *kobj,
 {
 	return sysfs_emit(buf, "%s\n", __stringify(MODULE_COMPRESSION));
 }
+
 static struct kobj_attribute module_compression_attr = __ATTR_RO(compression);
 
 static int __init module_decompress_sysfs_init(void)
diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index ea8c4c02614c..e0775e66bcf7 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -6,7 +6,8 @@
  */
 
 #include <linux/elf.h>
-#include <asm/module.h>
+#include <linux/compiler.h>
+#include <linux/module.h>
 #include <linux/mutex.h>
 
 #ifndef ARCH_SHF_SMALL
@@ -54,7 +55,7 @@ struct load_info {
 	} index;
 };
 
-extern int mod_verify_sig(const void *mod, struct load_info *info);
+int mod_verify_sig(const void *mod, struct load_info *info);
 
 #ifdef CONFIG_MODULE_DECOMPRESS
 int module_decompress(struct load_info *info, const void *buf, size_t size);
@@ -65,6 +66,7 @@ static inline int module_decompress(struct load_info *info,
 {
 	return -EOPNOTSUPP;
 }
+
 static inline void module_decompress_cleanup(struct load_info *info)
 {
 }
-- 
2.34.1

