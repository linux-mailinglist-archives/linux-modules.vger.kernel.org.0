Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A68F4BF63D
	for <lists+linux-modules@lfdr.de>; Tue, 22 Feb 2022 11:40:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231314AbiBVKjs (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Tue, 22 Feb 2022 05:39:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231310AbiBVKjp (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Tue, 22 Feb 2022 05:39:45 -0500
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFFE51520E9;
        Tue, 22 Feb 2022 02:39:20 -0800 (PST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4K2wdd1GRcz9sT4;
        Tue, 22 Feb 2022 11:39:17 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id zEPSRavfLS7v; Tue, 22 Feb 2022 11:39:17 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4K2wdb6mXrz9sT2;
        Tue, 22 Feb 2022 11:39:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id D3E178B764;
        Tue, 22 Feb 2022 11:39:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id 66W3h899ZoQ9; Tue, 22 Feb 2022 11:39:15 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id A573F8B77A;
        Tue, 22 Feb 2022 11:39:15 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 21MAd7pD1076222
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
        Tue, 22 Feb 2022 11:39:07 +0100
Received: (from chleroy@localhost)
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 21MAd7B91076221;
        Tue, 22 Feb 2022 11:39:07 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
To:     Aaron Tomlin <atomlin@redhat.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        linux-modules@vger.kernel.org
Cc:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/6] module: Rework layout alignment to avoid BUG_ON()s
Date:   Tue, 22 Feb 2022 11:38:59 +0100
Message-Id: <dfd4aeb85da37632c0ecabdc1d978c6cd236b89c.1645526008.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1645526008.git.christophe.leroy@csgroup.eu>
References: <cover.1645526008.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1645526317; l=4076; s=20211009; h=from:subject:message-id; bh=CYUOt3ARLhIdcgn+cH3ZQO7m4/B5fdRfsQumL45ql/U=; b=H9lAZ2UAafA4WnlxO3PpmepqcWE/H+KiGkreefXl3K+25hBgbYivleAWwW1s/NzI1+F7KCmXhEDs SIs4Mtn+DZKkITli2SWxEItJqqLsZ4TxgEtPTulMFl0q1ngoZIw1
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

Perform layout alignment verification up front and WARN_ON()
and fail module loading instead of crashing the machine.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 kernel/module/internal.h   |  1 +
 kernel/module/main.c       |  5 +++++
 kernel/module/strict_rwx.c | 28 +++++++++++++++++++---------
 3 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index b80a746b2e5a..32add08e7895 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -187,6 +187,7 @@ void module_enable_nx(const struct module *mod);
 void module_enable_x(const struct module *mod);
 int module_enforce_rwx_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
 				char *secstrings, struct module *mod);
+bool module_check_misalignment(const struct module *mod);
 
 #ifdef CONFIG_MODULE_SIG
 int module_sig_check(struct load_info *info, int flags);
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 47addf849ef7..4876e2beb5b6 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2596,6 +2596,9 @@ static int complete_formation(struct module *mod, struct load_info *info)
 	/* This relies on module_mutex for list integrity. */
 	module_bug_finalize(info->hdr, info->sechdrs, mod);
 
+	if (module_check_misalignment(mod))
+		goto out_misaligned;
+
 	module_enable_ro(mod, false);
 	module_enable_nx(mod);
 	module_enable_x(mod);
@@ -2609,6 +2612,8 @@ static int complete_formation(struct module *mod, struct load_info *info)
 
 	return 0;
 
+out_misaligned:
+	err = -EINVAL;
 out:
 	mutex_unlock(&module_mutex);
 	return err;
diff --git a/kernel/module/strict_rwx.c b/kernel/module/strict_rwx.c
index b023cea06af0..3966198a4fc0 100644
--- a/kernel/module/strict_rwx.c
+++ b/kernel/module/strict_rwx.c
@@ -42,9 +42,6 @@ static void frob_text(const struct module_layout *layout,
 static void frob_rodata(const struct module_layout *layout,
 			int (*set_memory)(unsigned long start, int num_pages))
 {
-	BUG_ON(!PAGE_ALIGNED(layout->base));
-	BUG_ON(!PAGE_ALIGNED(layout->text_size));
-	BUG_ON(!PAGE_ALIGNED(layout->ro_size));
 	set_memory((unsigned long)layout->base + layout->text_size,
 		   (layout->ro_size - layout->text_size) >> PAGE_SHIFT);
 }
@@ -52,9 +49,6 @@ static void frob_rodata(const struct module_layout *layout,
 static void frob_ro_after_init(const struct module_layout *layout,
 			       int (*set_memory)(unsigned long start, int num_pages))
 {
-	BUG_ON(!PAGE_ALIGNED(layout->base));
-	BUG_ON(!PAGE_ALIGNED(layout->ro_size));
-	BUG_ON(!PAGE_ALIGNED(layout->ro_after_init_size));
 	set_memory((unsigned long)layout->base + layout->ro_size,
 		   (layout->ro_after_init_size - layout->ro_size) >> PAGE_SHIFT);
 }
@@ -62,13 +56,29 @@ static void frob_ro_after_init(const struct module_layout *layout,
 static void frob_writable_data(const struct module_layout *layout,
 			       int (*set_memory)(unsigned long start, int num_pages))
 {
-	BUG_ON(!PAGE_ALIGNED(layout->base));
-	BUG_ON(!PAGE_ALIGNED(layout->ro_after_init_size));
-	BUG_ON(!PAGE_ALIGNED(layout->size));
 	set_memory((unsigned long)layout->base + layout->ro_after_init_size,
 		   (layout->size - layout->ro_after_init_size) >> PAGE_SHIFT);
 }
 
+static bool layout_check_misalignment(const struct module_layout *layout)
+{
+	return WARN_ON(!PAGE_ALIGNED(layout->base)) ||
+	       WARN_ON(!PAGE_ALIGNED(layout->text_size)) ||
+	       WARN_ON(!PAGE_ALIGNED(layout->ro_size)) ||
+	       WARN_ON(!PAGE_ALIGNED(layout->ro_after_init_size)) ||
+	       WARN_ON(!PAGE_ALIGNED(layout->size));
+}
+
+bool module_check_misalignment(const struct module *mod)
+{
+	if (!IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
+		return false;
+
+	return layout_check_misalignment(&mod->core_layout) ||
+	       layout_check_misalignment(&mod->data_layout) ||
+	       layout_check_misalignment(&mod->init_layout);
+}
+
 void module_enable_x(const struct module *mod)
 {
 	if (!PAGE_ALIGNED(mod->core_layout.base) ||
-- 
2.34.1

