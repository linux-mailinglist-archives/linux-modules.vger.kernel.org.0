Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73F354E401E
	for <lists+linux-modules@lfdr.de>; Tue, 22 Mar 2022 15:05:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236188AbiCVOFi (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Tue, 22 Mar 2022 10:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232856AbiCVOFc (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Tue, 22 Mar 2022 10:05:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EF56F2E094
        for <linux-modules@vger.kernel.org>; Tue, 22 Mar 2022 07:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647957838;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Zln+MaotO9F3OZWBQkZ8RRcCDDlcbIVRMz8zB5PgPNY=;
        b=c+2pDLinL/jDdG7lH1nRN37qPXLbR8BvdEmVxYejBzoT98MTE3BUxCT9TqP0LbYHuysQ5/
        U+B8YSofXi4quEW0KvyviiYtc68GDTv2bMkxKF6H8Z/hl3siS9OffOFNAp4K/u9fJ0kaKm
        HWmlOEtTtzKH7tdVtZiyBoU5jB2jXrY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-284-oL2kiyIVMUKMv-DavO1ZUw-1; Tue, 22 Mar 2022 10:03:56 -0400
X-MC-Unique: oL2kiyIVMUKMv-DavO1ZUw-1
Received: by mail-wm1-f71.google.com with SMTP id 12-20020a05600c24cc00b0038c6caa95f7so975917wmu.4
        for <linux-modules@vger.kernel.org>; Tue, 22 Mar 2022 07:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Zln+MaotO9F3OZWBQkZ8RRcCDDlcbIVRMz8zB5PgPNY=;
        b=pN6LaG1k5j6/5hYwRpuc0AVpq3gZjfGfEXOQ6gT/71KrfICQ/B5UtNIcP7lbwzMLDH
         9FE3WauI58s8j3wJ+6jwBGxzfA+plS4vVfuK8xDgmW7U7H3amSGnqw2TSMLO1vodLgoB
         1rL2iMODU7Ezh+XjsIO7+D4rIe7zk8IcSH4iVpjwBbvsToDQctCg6c47JlNyyck+NJKf
         DMaqJGDr2u0W2uphcCRjc4nFf+HAyij7LlWhxSHv/eYVbhaQA91u7RGCZTLXwPwy5p6h
         Zk+z+PSdHmhmrdpQRBACUIaHy9ktHPeiICRKgFX2vjhWaC7CzpWA8sADK+i1tkUETfIv
         RE2g==
X-Gm-Message-State: AOAM532uiTvksrzenM6gi0RaZ9zVuMoqiblAdqpS05B4ZIVeb44ZmQjq
        q0Ez0IhmP4GPRwsiAd94fN5sWtrtq0WLOjL2p15aiXFzIo0CUMfgjQvTKxIqYWgCT8eHIfLNPDN
        fcB7up/HkBrl9mijrUfLYD9ip
X-Received: by 2002:a05:600c:4fcb:b0:389:d27f:edc7 with SMTP id o11-20020a05600c4fcb00b00389d27fedc7mr3936828wmq.152.1647957835003;
        Tue, 22 Mar 2022 07:03:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzes7Z/7LjQffa4Pcqv0454a1B0zIkrswC981hpzvJTFu09/MN6p0Pc/aYtgMFEmsKbukjpFg==
X-Received: by 2002:a05:600c:4fcb:b0:389:d27f:edc7 with SMTP id o11-20020a05600c4fcb00b00389d27fedc7mr3936658wmq.152.1647957833214;
        Tue, 22 Mar 2022 07:03:53 -0700 (PDT)
Received: from localhost (cpc111743-lutn13-2-0-cust979.9-3.cable.virginm.net. [82.17.115.212])
        by smtp.gmail.com with ESMTPSA id 6-20020a05600c020600b0038cbb21fb00sm1098369wmi.39.2022.03.22.07.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 07:03:52 -0700 (PDT)
From:   Aaron Tomlin <atomlin@redhat.com>
To:     mcgrof@kernel.org, christophe.leroy@csgroup.eu
Cc:     cl@linux.com, mbenes@suse.cz, akpm@linux-foundation.org,
        jeyu@kernel.org, linux-kernel@vger.kernel.org,
        linux-modules@vger.kernel.org, void@manifault.com,
        atomlin@atomlin.com, allen.lkml@gmail.com, joe@perches.com,
        msuchanek@suse.de, oleksandr@natalenko.name,
        jason.wessel@windriver.com, pmladek@suse.com,
        daniel.thompson@linaro.org, hch@infradead.org
Subject: [PATCH v12 02/14] module: Simple refactor in preparation for split
Date:   Tue, 22 Mar 2022 14:03:32 +0000
Message-Id: <20220322140344.556474-3-atomlin@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220322140344.556474-1-atomlin@redhat.com>
References: <20220322140344.556474-1-atomlin@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

No functional change.

This patch makes it possible to move non-essential code
out of core module code.

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Aaron Tomlin <atomlin@redhat.com>
---
 kernel/module/internal.h | 21 +++++++++++++++++++++
 kernel/module/main.c     | 22 ++--------------------
 2 files changed, 23 insertions(+), 20 deletions(-)

diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index 8c381c99062f..ea8c4c02614c 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -7,6 +7,27 @@
 
 #include <linux/elf.h>
 #include <asm/module.h>
+#include <linux/mutex.h>
+
+#ifndef ARCH_SHF_SMALL
+#define ARCH_SHF_SMALL 0
+#endif
+
+/* If this is set, the section belongs in the init part of the module */
+#define INIT_OFFSET_MASK (1UL << (BITS_PER_LONG - 1))
+/* Maximum number of characters written by module_flags() */
+#define MODULE_FLAGS_BUF_SIZE (TAINT_FLAGS_COUNT + 4)
+
+extern struct mutex module_mutex;
+extern struct list_head modules;
+
+/* Provided by the linker */
+extern const struct kernel_symbol __start___ksymtab[];
+extern const struct kernel_symbol __stop___ksymtab[];
+extern const struct kernel_symbol __start___ksymtab_gpl[];
+extern const struct kernel_symbol __stop___ksymtab_gpl[];
+extern const s32 __start___kcrctab[];
+extern const s32 __start___kcrctab_gpl[];
 
 struct load_info {
 	const char *name;
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 34a2b0cf3c3e..5f5e21f972dd 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -63,10 +63,6 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/module.h>
 
-#ifndef ARCH_SHF_SMALL
-#define ARCH_SHF_SMALL 0
-#endif
-
 /*
  * Modules' sections will be aligned on page boundaries
  * to ensure complete separation of code and data, but
@@ -78,9 +74,6 @@
 # define debug_align(X) (X)
 #endif
 
-/* If this is set, the section belongs in the init part of the module */
-#define INIT_OFFSET_MASK (1UL << (BITS_PER_LONG-1))
-
 /*
  * Mutex protects:
  * 1) List of modules (also safely readable with preempt_disable),
@@ -88,8 +81,8 @@
  * 3) module_addr_min/module_addr_max.
  * (delete and add uses RCU list operations).
  */
-static DEFINE_MUTEX(module_mutex);
-static LIST_HEAD(modules);
+DEFINE_MUTEX(module_mutex);
+LIST_HEAD(modules);
 
 /* Work queue for freeing init sections in success case */
 static void do_free_init(struct work_struct *w);
@@ -408,14 +401,6 @@ static __maybe_unused void *any_section_objs(const struct load_info *info,
 	return (void *)info->sechdrs[sec].sh_addr;
 }
 
-/* Provided by the linker */
-extern const struct kernel_symbol __start___ksymtab[];
-extern const struct kernel_symbol __stop___ksymtab[];
-extern const struct kernel_symbol __start___ksymtab_gpl[];
-extern const struct kernel_symbol __stop___ksymtab_gpl[];
-extern const s32 __start___kcrctab[];
-extern const s32 __start___kcrctab_gpl[];
-
 #ifndef CONFIG_MODVERSIONS
 #define symversion(base, idx) NULL
 #else
@@ -4542,9 +4527,6 @@ static void cfi_cleanup(struct module *mod)
 #endif
 }
 
-/* Maximum number of characters written by module_flags() */
-#define MODULE_FLAGS_BUF_SIZE (TAINT_FLAGS_COUNT + 4)
-
 /* Keep in sync with MODULE_FLAGS_BUF_SIZE !!! */
 static char *module_flags(struct module *mod, char *buf)
 {
-- 
2.34.1

