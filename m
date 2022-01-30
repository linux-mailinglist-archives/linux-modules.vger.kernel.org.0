Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D763D4A3A6B
	for <lists+linux-modules@lfdr.de>; Sun, 30 Jan 2022 22:32:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356660AbiA3Vcg (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Sun, 30 Jan 2022 16:32:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40752 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1347612AbiA3VcX (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Sun, 30 Jan 2022 16:32:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643578342;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CKFHu1mwRyMCd3tE6xfYJyy3RgbH1D0nAbWrHT5RWOU=;
        b=DCR9t5yrgdZX6WNYuCqMcBXxRvad9/or/d8ffkAF6kvly83Sr0fJEdiPq6B8xM9vonhxc5
        JbQ6D53K2+b3s3l8miFl3+Kc+FbToDwVCtq6BL1BofFpl0uBFBrjjkDDnRpzeZSh9+Fisn
        CwGam0xeAB78xp+RURLUrfV1hpJDH9g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-3EMdCXa1OnuJrFbiW22nkQ-1; Sun, 30 Jan 2022 16:32:21 -0500
X-MC-Unique: 3EMdCXa1OnuJrFbiW22nkQ-1
Received: by mail-wm1-f70.google.com with SMTP id s1-20020a1ca901000000b0034ece94dd8cso9356144wme.5
        for <linux-modules@vger.kernel.org>; Sun, 30 Jan 2022 13:32:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CKFHu1mwRyMCd3tE6xfYJyy3RgbH1D0nAbWrHT5RWOU=;
        b=YWMVwXvbo58pZMpEpJUVIRaCdT4FZk2bO5vmerUl4INVJWexujJdFYJgk60EXCJAL/
         MCpdmfNxJyLKQuzqmI0szCI00clspm6gmzqoyT5qFjyNmF9iSSTEi2ku9MgQXh/CDRG1
         Jant2QDaLXw2hdpGy+wWw+aNFTXou2JqcJCH1MOcUmDRPyfYwoyRCLocWQxI9x11jiE8
         S7U9Omhq1DnqjrgvHXr2ZGYsQqJX32TfyQWi0Ds6bStvMhtGBV790svjAutU9b7M+lqu
         Qa59Ce82G1p6KhUa3TTt0U6ptcS+3xrKZOlRM7i0eVvwNTPofTmOvaC3/KMmEN2LZamZ
         FANw==
X-Gm-Message-State: AOAM530HO7W9GkjlWGFys8kOB77GveWgeiet6pDOD89ekLdwv7NrGrY8
        7qZK4H0cVVYwBou9q5G+SAh9Dk/bZRdcaxSd3wTAWL8ClJZWV2f4byT5ujyoQBSjxWRkJr4IvCQ
        tKngijwPnJNhtlrcxnCkAXmvU
X-Received: by 2002:a05:6000:15ca:: with SMTP id y10mr15316707wry.523.1643578339935;
        Sun, 30 Jan 2022 13:32:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw17nLhSQySLDHIo8E6y8aoNvy6mIUxMDuspgSa/9hzx9TeehLqEPnw5LpcjcmIpptujoZxyA==
X-Received: by 2002:a05:6000:15ca:: with SMTP id y10mr15316693wry.523.1643578339742;
        Sun, 30 Jan 2022 13:32:19 -0800 (PST)
Received: from localhost (cpc111743-lutn13-2-0-cust979.9-3.cable.virginm.net. [82.17.115.212])
        by smtp.gmail.com with ESMTPSA id l11sm7075887wry.50.2022.01.30.13.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 13:32:19 -0800 (PST)
From:   Aaron Tomlin <atomlin@redhat.com>
To:     mcgrof@kernel.org
Cc:     cl@linux.com, pmladek@suse.com, mbenes@suse.cz,
        akpm@linux-foundation.org, jeyu@kernel.org,
        linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
        live-patching@vger.kernel.org, atomlin@atomlin.com,
        ghalat@redhat.com, allen.lkml@gmail.com, void@manifault.com,
        joe@perches.com
Subject: [RFC PATCH v4 02/13] module: Simple refactor in preparation for split
Date:   Sun, 30 Jan 2022 21:32:03 +0000
Message-Id: <20220130213214.1042497-3-atomlin@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130213214.1042497-1-atomlin@redhat.com>
References: <20220130213214.1042497-1-atomlin@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

No functional change.

This patch makes it possible to move non-essential code
out of core module code.

Signed-off-by: Aaron Tomlin <atomlin@redhat.com>
---
 kernel/module/internal.h | 22 ++++++++++++++++++++++
 kernel/module/main.c     | 23 ++---------------------
 2 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index 8c381c99062f..e3c593f8767f 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -7,6 +7,28 @@
 
 #include <linux/elf.h>
 #include <asm/module.h>
+#include <linux/mutex.h>
+
+#ifndef ARCH_SHF_SMALL
+#define ARCH_SHF_SMALL 0
+#endif
+
+/* If this is set, the section belongs in the init part of the module */
+#define INIT_OFFSET_MASK (1UL << (BITS_PER_LONG-1))
+/* Maximum number of characters written by module_flags() */
+#define MODULE_FLAGS_BUF_SIZE (TAINT_FLAGS_COUNT + 4)
+#define MODULE_SECT_READ_SIZE (3 /* "0x", "\n" */ + (BITS_PER_LONG / 4))
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
index d8c6269af6cf..fee64c4957f3 100644
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
@@ -1490,7 +1475,6 @@ struct module_sect_attrs {
 	struct module_sect_attr attrs[];
 };
 
-#define MODULE_SECT_READ_SIZE (3 /* "0x", "\n" */ + (BITS_PER_LONG / 4))
 static ssize_t module_sect_read(struct file *file, struct kobject *kobj,
 				struct bin_attribute *battr,
 				char *buf, loff_t pos, size_t count)
@@ -4555,9 +4539,6 @@ static void cfi_cleanup(struct module *mod)
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

