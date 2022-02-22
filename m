Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 827514BFB9D
	for <lists+linux-modules@lfdr.de>; Tue, 22 Feb 2022 16:02:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbiBVPC3 (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Tue, 22 Feb 2022 10:02:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232409AbiBVPCO (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Tue, 22 Feb 2022 10:02:14 -0500
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E841910E54F;
        Tue, 22 Feb 2022 07:00:49 -0800 (PST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4K32RH16x3z9sSP;
        Tue, 22 Feb 2022 16:00:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 9nm-bLXLl5IK; Tue, 22 Feb 2022 16:00:43 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4K32RF36Xfz9sSj;
        Tue, 22 Feb 2022 16:00:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 5AEB48B783;
        Tue, 22 Feb 2022 16:00:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id X_eqHHn1Zc4X; Tue, 22 Feb 2022 16:00:41 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.7.78])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id CD7248B781;
        Tue, 22 Feb 2022 16:00:40 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 21MF0ZBB1087080
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
        Tue, 22 Feb 2022 16:00:35 +0100
Received: (from chleroy@localhost)
        by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 21MF0ZSu1087079;
        Tue, 22 Feb 2022 16:00:35 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
To:     Luis Chamberlain <mcgrof@kernel.org>,
        Aaron Tomlin <atomlin@redhat.com>
Cc:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kgdb-bugreport@lists.sourceforge.net, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-modules@vger.kernel.org
Subject: [PATCH v5 5/6] module: Remove module_addr_min and module_addr_max
Date:   Tue, 22 Feb 2022 16:00:22 +0100
Message-Id: <1cdc55ee21e0ccff32e746b55c1f39463f8fb0bd.1645541930.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1645541930.git.christophe.leroy@csgroup.eu>
References: <cover.1645541930.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1645542019; l=1101; s=20211009; h=from:subject:message-id; bh=CTgBOa5qrQicMY8hpUbkUtC2QN5kexDH2AfKnFKX7Pc=; b=5zyJi6Gqro8lWhLtExkO1VTZ+bM6SknySI6yVOHqVs4aWGtxnYa0sq6w3+VUqOK0fi/3zTLkqC6d eFEe6GQlCnwvKDFGZ2910bqNFkhaA1fTok2wtghX+AjyE1AgJ1TJ
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

Replace module_addr_min and module_addr_max by
mod_tree.addr_min and mod_tree.addr_max

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 kernel/module/main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index f4d95a2ff08f..db503a212532 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -63,7 +63,7 @@
  * Mutex protects:
  * 1) List of modules (also safely readable with preempt_disable),
  * 2) module_use links,
- * 3) module_addr_min/module_addr_max.
+ * 3) mod_tree.addr_min/mod_tree.addr_max.
  * (delete and add uses RCU list operations).
  */
 DEFINE_MUTEX(module_mutex);
@@ -3006,14 +3006,14 @@ static void cfi_init(struct module *mod)
 		mod->exit = *exit;
 #endif
 
-	cfi_module_add(mod, module_addr_min);
+	cfi_module_add(mod, mod_tree.addr_min);
 #endif
 }
 
 static void cfi_cleanup(struct module *mod)
 {
 #ifdef CONFIG_CFI_CLANG
-	cfi_module_remove(mod, module_addr_min);
+	cfi_module_remove(mod, mod_tree.addr_min);
 #endif
 }
 
-- 
2.34.1

