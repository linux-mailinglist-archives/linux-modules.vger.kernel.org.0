Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F30684C7EAC
	for <lists+linux-modules@lfdr.de>; Tue,  1 Mar 2022 00:45:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbiB1XpJ (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Mon, 28 Feb 2022 18:45:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231674AbiB1Xor (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Mon, 28 Feb 2022 18:44:47 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 69862FDF95
        for <linux-modules@vger.kernel.org>; Mon, 28 Feb 2022 15:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646091838;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8gs1h6MeNSrDRhQvsG3BFOK6Pi8aXzkhGBMLa9C27C0=;
        b=VLLtDCWQg0mVJj+xoD1kmxTAyR4Ymf63p9lvkTtkBPV0bNvruOxi//lEjuCRT9R2hzzpfx
        nd95eJuWpShpdCSH8M5H/yqpoBpTVF26emQ3lwMJuLqbWxMK307d5aZC0jzoyC+wAoYI8R
        thWoB5QDhvKQkTUmJVYGAiDEHi21t6o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-d8uEvpaPOZq3e8eiLcTFUA-1; Mon, 28 Feb 2022 18:43:56 -0500
X-MC-Unique: d8uEvpaPOZq3e8eiLcTFUA-1
Received: by mail-wr1-f72.google.com with SMTP id f11-20020a5d664b000000b001ef8a2c2e1fso1385724wrw.15
        for <linux-modules@vger.kernel.org>; Mon, 28 Feb 2022 15:43:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8gs1h6MeNSrDRhQvsG3BFOK6Pi8aXzkhGBMLa9C27C0=;
        b=Fv9/4Ni5QtBSBhelMWBgi/dyGAqTe4NMblsWvro10wZzG3N54DF66y55AWvk0577Qt
         MDf72L/CIcJoMp0JCbaPHymt6Wq78Su9cffrgYynQ0/047qn08EzN+jHSSmluB76kIaH
         9jAaAKlZmZC47SJgVGdqzF7L7YBuNWoAli6j+0aQUyOLwIMRP/40rPB0+lHkTUk7cRFa
         nhOwEQ4XGQxEYuf9RBV00hv7HHK98ULxev0sQaLISFtP6B6gJhS2u1du2Kd4HYYK5GAa
         E3d6VHEwwHOE2pux+Uunoe21t458U4uK2WobpfEASS6AEYAP3d6QnXzLb4/Bpx32i3TB
         VuYg==
X-Gm-Message-State: AOAM532417sxnwia2xWTq/jJoLAUKoQBfPtbnt0Q18HpA9FVPkLywsIV
        pfIWCsjFSHtwprjIHDCbJpLXdXXTGny6v+kk3wQPHTmZKjoBDa7GbANDng54+tGiauoj6TmNFd9
        8bK33rgPGvh/QNUaYEYjSHUEh
X-Received: by 2002:adf:db84:0:b0:1ed:d428:a944 with SMTP id u4-20020adfdb84000000b001edd428a944mr17729040wri.359.1646091835395;
        Mon, 28 Feb 2022 15:43:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2/f3AcsKvoKW2xnVSj/XYJvznFTiBRM8hUIuJM7K6VLARDbxQsGB8yW6bCtLpRoddd9CHMw==
X-Received: by 2002:adf:db84:0:b0:1ed:d428:a944 with SMTP id u4-20020adfdb84000000b001edd428a944mr17729010wri.359.1646091835030;
        Mon, 28 Feb 2022 15:43:55 -0800 (PST)
Received: from localhost (cpc111743-lutn13-2-0-cust979.9-3.cable.virginm.net. [82.17.115.212])
        by smtp.gmail.com with ESMTPSA id f11-20020a7bcc0b000000b0037e0c362b6dsm768089wmh.31.2022.02.28.15.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 15:43:53 -0800 (PST)
From:   Aaron Tomlin <atomlin@redhat.com>
To:     mcgrof@kernel.org, christophe.leroy@csgroup.eu, pmladek@suse.com
Cc:     cl@linux.com, mbenes@suse.cz, akpm@linux-foundation.org,
        jeyu@kernel.org, linux-kernel@vger.kernel.org,
        linux-modules@vger.kernel.org, void@manifault.com,
        atomlin@atomlin.com, allen.lkml@gmail.com, joe@perches.com,
        msuchanek@suse.de, oleksandr@natalenko.name,
        jason.wessel@windriver.com, daniel.thompson@linaro.org
Subject: [PATCH v9 14/14] module: Move version support into a separate file
Date:   Mon, 28 Feb 2022 23:43:22 +0000
Message-Id: <20220228234322.2073104-15-atomlin@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220228234322.2073104-1-atomlin@redhat.com>
References: <20220228234322.2073104-1-atomlin@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

No functional change.

This patch migrates module version support out of core code into
kernel/module/version.c. In addition simple code refactoring to
make this possible.

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Aaron Tomlin <atomlin@redhat.com>
---
 kernel/module/Makefile   |   1 +
 kernel/module/internal.h |  48 ++++++++++++
 kernel/module/main.c     | 156 ++-------------------------------------
 kernel/module/version.c  | 109 +++++++++++++++++++++++++++
 4 files changed, 166 insertions(+), 148 deletions(-)
 create mode 100644 kernel/module/version.c

diff --git a/kernel/module/Makefile b/kernel/module/Makefile
index cf8dcdc6b55f..a46e6361017f 100644
--- a/kernel/module/Makefile
+++ b/kernel/module/Makefile
@@ -17,3 +17,4 @@ obj-$(CONFIG_DEBUG_KMEMLEAK) += debug_kmemleak.o
 obj-$(CONFIG_KALLSYMS) += kallsyms.o
 obj-$(CONFIG_PROC_FS) += procfs.o
 obj-$(CONFIG_SYSFS) += sysfs.o
+obj-$(CONFIG_MODVERSIONS) += version.o
diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index 62d749ef695e..3fc139d5074b 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -70,7 +70,27 @@ struct load_info {
 	} index;
 };
 
+enum mod_license {
+	NOT_GPL_ONLY,
+	GPL_ONLY,
+};
+
+struct find_symbol_arg {
+	/* Input */
+	const char *name;
+	bool gplok;
+	bool warn;
+
+	/* Output */
+	struct module *owner;
+	const s32 *crc;
+	const struct kernel_symbol *sym;
+	enum mod_license license;
+};
+
 int mod_verify_sig(const void *mod, struct load_info *info);
+int try_to_force_load(struct module *mod, const char *reason);
+bool find_symbol(struct find_symbol_arg *fsa);
 struct module *find_module_all(const char *name, size_t len, bool even_unformed);
 int cmp_name(const void *name, const void *sym);
 long module_get_offset(struct module *mod, unsigned int *size, Elf_Shdr *sechdr,
@@ -225,3 +245,31 @@ static inline int mod_sysfs_setup(struct module *mod,
 static inline void mod_sysfs_teardown(struct module *mod) { }
 static inline void init_param_lock(struct module *mod) { }
 #endif /* CONFIG_SYSFS */
+
+#ifdef CONFIG_MODVERSIONS
+int check_version(const struct load_info *info,
+		  const char *symname, struct module *mod, const s32 *crc);
+void module_layout(struct module *mod, struct modversion_info *ver, struct kernel_param *kp,
+		   struct kernel_symbol *ks, struct tracepoint * const *tp);
+int check_modstruct_version(const struct load_info *info, struct module *mod);
+int same_magic(const char *amagic, const char *bmagic, bool has_crcs);
+#else /* !CONFIG_MODVERSIONS */
+static inline int check_version(const struct load_info *info,
+				const char *symname,
+				struct module *mod,
+				const s32 *crc)
+{
+	return 1;
+}
+
+static inline int check_modstruct_version(const struct load_info *info,
+					  struct module *mod)
+{
+	return 1;
+}
+
+static inline int same_magic(const char *amagic, const char *bmagic, bool has_crcs)
+{
+	return strcmp(amagic, bmagic) == 0;
+}
+#endif /* CONFIG_MODVERSIONS */
diff --git a/kernel/module/main.c b/kernel/module/main.c
index bcc4f7a82649..0749afdc34b5 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -86,6 +86,12 @@ struct mod_tree_root mod_tree __cacheline_aligned = {
 static unsigned long module_addr_min = -1UL, module_addr_max;
 #endif /* CONFIG_MODULES_TREE_LOOKUP */
 
+struct symsearch {
+	const struct kernel_symbol *start, *stop;
+	const s32 *crcs;
+	enum mod_license license;
+};
+
 /*
  * Bounds of module text, for speeding up __module_address.
  * Protected by module_mutex.
@@ -244,28 +250,6 @@ static __maybe_unused void *any_section_objs(const struct load_info *info,
 #define symversion(base, idx) ((base != NULL) ? ((base) + (idx)) : NULL)
 #endif
 
-struct symsearch {
-	const struct kernel_symbol *start, *stop;
-	const s32 *crcs;
-	enum mod_license {
-		NOT_GPL_ONLY,
-		GPL_ONLY,
-	} license;
-};
-
-struct find_symbol_arg {
-	/* Input */
-	const char *name;
-	bool gplok;
-	bool warn;
-
-	/* Output */
-	struct module *owner;
-	const s32 *crc;
-	const struct kernel_symbol *sym;
-	enum mod_license license;
-};
-
 static bool check_exported_symbol(const struct symsearch *syms,
 				  struct module *owner,
 				  unsigned int symnum, void *data)
@@ -327,7 +311,7 @@ static bool find_exported_symbol_in_section(const struct symsearch *syms,
  * Find an exported symbol and return it, along with, (optional) crc and
  * (optional) module which owns it.  Needs preempt disabled or module_mutex.
  */
-static bool find_symbol(struct find_symbol_arg *fsa)
+bool find_symbol(struct find_symbol_arg *fsa)
 {
 	static const struct symsearch arr[] = {
 		{ __start___ksymtab, __stop___ksymtab, __start___kcrctab,
@@ -1001,7 +985,7 @@ size_t modinfo_attrs_count = ARRAY_SIZE(modinfo_attrs);
 
 static const char vermagic[] = VERMAGIC_STRING;
 
-static int try_to_force_load(struct module *mod, const char *reason)
+int try_to_force_load(struct module *mod, const char *reason)
 {
 #ifdef CONFIG_MODULE_FORCE_LOAD
 	if (!test_taint(TAINT_FORCED_MODULE))
@@ -1013,115 +997,6 @@ static int try_to_force_load(struct module *mod, const char *reason)
 #endif
 }
 
-#ifdef CONFIG_MODVERSIONS
-
-static u32 resolve_rel_crc(const s32 *crc)
-{
-	return *(u32 *)((void *)crc + *crc);
-}
-
-static int check_version(const struct load_info *info,
-			 const char *symname,
-			 struct module *mod,
-			 const s32 *crc)
-{
-	Elf_Shdr *sechdrs = info->sechdrs;
-	unsigned int versindex = info->index.vers;
-	unsigned int i, num_versions;
-	struct modversion_info *versions;
-
-	/* Exporting module didn't supply crcs?  OK, we're already tainted. */
-	if (!crc)
-		return 1;
-
-	/* No versions at all?  modprobe --force does this. */
-	if (versindex == 0)
-		return try_to_force_load(mod, symname) == 0;
-
-	versions = (void *) sechdrs[versindex].sh_addr;
-	num_versions = sechdrs[versindex].sh_size
-		/ sizeof(struct modversion_info);
-
-	for (i = 0; i < num_versions; i++) {
-		u32 crcval;
-
-		if (strcmp(versions[i].name, symname) != 0)
-			continue;
-
-		if (IS_ENABLED(CONFIG_MODULE_REL_CRCS))
-			crcval = resolve_rel_crc(crc);
-		else
-			crcval = *crc;
-		if (versions[i].crc == crcval)
-			return 1;
-		pr_debug("Found checksum %X vs module %lX\n",
-			 crcval, versions[i].crc);
-		goto bad_version;
-	}
-
-	/* Broken toolchain. Warn once, then let it go.. */
-	pr_warn_once("%s: no symbol version for %s\n", info->name, symname);
-	return 1;
-
-bad_version:
-	pr_warn("%s: disagrees about version of symbol %s\n",
-	       info->name, symname);
-	return 0;
-}
-
-static inline int check_modstruct_version(const struct load_info *info,
-					  struct module *mod)
-{
-	struct find_symbol_arg fsa = {
-		.name	= "module_layout",
-		.gplok	= true,
-	};
-
-	/*
-	 * Since this should be found in kernel (which can't be removed), no
-	 * locking is necessary -- use preempt_disable() to placate lockdep.
-	 */
-	preempt_disable();
-	if (!find_symbol(&fsa)) {
-		preempt_enable();
-		BUG();
-	}
-	preempt_enable();
-	return check_version(info, "module_layout", mod, fsa.crc);
-}
-
-/* First part is kernel version, which we ignore if module has crcs. */
-static inline int same_magic(const char *amagic, const char *bmagic,
-			     bool has_crcs)
-{
-	if (has_crcs) {
-		amagic += strcspn(amagic, " ");
-		bmagic += strcspn(bmagic, " ");
-	}
-	return strcmp(amagic, bmagic) == 0;
-}
-#else
-static inline int check_version(const struct load_info *info,
-				const char *symname,
-				struct module *mod,
-				const s32 *crc)
-{
-	return 1;
-}
-
-static inline int check_modstruct_version(const struct load_info *info,
-					  struct module *mod)
-{
-	return 1;
-}
-
-static inline int same_magic(const char *amagic, const char *bmagic,
-			     bool has_crcs)
-{
-	return strcmp(amagic, bmagic) == 0;
-}
-#endif /* CONFIG_MODVERSIONS */
-
 static char *get_modinfo(const struct load_info *info, const char *tag);
 static char *get_next_modinfo(const struct load_info *info, const char *tag,
 			      char *prev);
@@ -3247,18 +3122,3 @@ void print_modules(void)
 		pr_cont(" [last unloaded: %s]", last_unloaded_module);
 	pr_cont("\n");
 }
-
-#ifdef CONFIG_MODVERSIONS
-/*
- * Generate the signature for all relevant module structures here.
- * If these change, we don't want to try to parse the module.
- */
-void module_layout(struct module *mod,
-		   struct modversion_info *ver,
-		   struct kernel_param *kp,
-		   struct kernel_symbol *ks,
-		   struct tracepoint * const *tp)
-{
-}
-EXPORT_SYMBOL(module_layout);
-#endif
diff --git a/kernel/module/version.c b/kernel/module/version.c
new file mode 100644
index 000000000000..adaedce1dc97
--- /dev/null
+++ b/kernel/module/version.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Module version support
+ *
+ * Copyright (C) 2008 Rusty Russell
+ */
+
+#include <linux/module.h>
+#include <linux/string.h>
+#include <linux/printk.h>
+#include "internal.h"
+
+static u32 resolve_rel_crc(const s32 *crc)
+{
+	return *(u32 *)((void *)crc + *crc);
+}
+
+int check_version(const struct load_info *info,
+		  const char *symname,
+			 struct module *mod,
+			 const s32 *crc)
+{
+	Elf_Shdr *sechdrs = info->sechdrs;
+	unsigned int versindex = info->index.vers;
+	unsigned int i, num_versions;
+	struct modversion_info *versions;
+
+	/* Exporting module didn't supply crcs?  OK, we're already tainted. */
+	if (!crc)
+		return 1;
+
+	/* No versions at all?  modprobe --force does this. */
+	if (versindex == 0)
+		return try_to_force_load(mod, symname) == 0;
+
+	versions = (void *)sechdrs[versindex].sh_addr;
+	num_versions = sechdrs[versindex].sh_size
+		/ sizeof(struct modversion_info);
+
+	for (i = 0; i < num_versions; i++) {
+		u32 crcval;
+
+		if (strcmp(versions[i].name, symname) != 0)
+			continue;
+
+		if (IS_ENABLED(CONFIG_MODULE_REL_CRCS))
+			crcval = resolve_rel_crc(crc);
+		else
+			crcval = *crc;
+		if (versions[i].crc == crcval)
+			return 1;
+		pr_debug("Found checksum %X vs module %lX\n",
+			 crcval, versions[i].crc);
+		goto bad_version;
+	}
+
+	/* Broken toolchain. Warn once, then let it go.. */
+	pr_warn_once("%s: no symbol version for %s\n", info->name, symname);
+	return 1;
+
+bad_version:
+	pr_warn("%s: disagrees about version of symbol %s\n", info->name, symname);
+	return 0;
+}
+
+int check_modstruct_version(const struct load_info *info,
+			    struct module *mod)
+{
+	struct find_symbol_arg fsa = {
+		.name	= "module_layout",
+		.gplok	= true,
+	};
+
+	/*
+	 * Since this should be found in kernel (which can't be removed), no
+	 * locking is necessary -- use preempt_disable() to placate lockdep.
+	 */
+	preempt_disable();
+	if (!find_symbol(&fsa)) {
+		preempt_enable();
+		BUG();
+	}
+	preempt_enable();
+	return check_version(info, "module_layout", mod, fsa.crc);
+}
+
+/* First part is kernel version, which we ignore if module has crcs. */
+int same_magic(const char *amagic, const char *bmagic,
+	       bool has_crcs)
+{
+	if (has_crcs) {
+		amagic += strcspn(amagic, " ");
+		bmagic += strcspn(bmagic, " ");
+	}
+	return strcmp(amagic, bmagic) == 0;
+}
+
+/*
+ * Generate the signature for all relevant module structures here.
+ * If these change, we don't want to try to parse the module.
+ */
+void module_layout(struct module *mod,
+		   struct modversion_info *ver,
+		   struct kernel_param *kp,
+		   struct kernel_symbol *ks,
+		   struct tracepoint * const *tp)
+{
+}
+EXPORT_SYMBOL(module_layout);
-- 
2.34.1

