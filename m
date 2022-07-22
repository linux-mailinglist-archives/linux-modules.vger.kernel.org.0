Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF51657D887
	for <lists+linux-modules@lfdr.de>; Fri, 22 Jul 2022 04:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234135AbiGVCYa (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Thu, 21 Jul 2022 22:24:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234059AbiGVCYa (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Thu, 21 Jul 2022 22:24:30 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1472974B1
        for <linux-modules@vger.kernel.org>; Thu, 21 Jul 2022 19:24:28 -0700 (PDT)
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A9D8D3F12F
        for <linux-modules@vger.kernel.org>; Fri, 22 Jul 2022 02:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1658456667;
        bh=kC/1kbVNZHVRXUTB9yhNq16+U5x50YJN/lTo/8it5RY=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=lYfuX5+o/z9WJDkS0R2uaFl5v14cyv/Aae2/+M1H7jlMig+LB8VpKmWkqS7ny+x/p
         DxGpNVEDFE5Qvn1amJ2wBDuJPfBWHtCwZj6X8wEfWOjnNonB3V7QRGSSiqf3DCavJg
         m2wcxuJZM/yz1SiPvSiGxLCnxD6gAeZvytoldMt/uculmbSeMOBEZqEOTopZBiubF3
         x4jYrMek3ZbnTEF7ovETO7nu44micoyxCu5XAWRsqruK9KGbx4QS0s8m7kVDti1vr0
         AVjrMf0gVQE9auy/HG1zdDjXZSB9UiAx3itxVTXKGOJl5KQtrB4ChaHkB24LcwjKA+
         GkSEfiIgvN4Qw==
Received: by mail-oo1-f70.google.com with SMTP id d22-20020a4a9196000000b00435761169daso270146ooh.10
        for <linux-modules@vger.kernel.org>; Thu, 21 Jul 2022 19:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kC/1kbVNZHVRXUTB9yhNq16+U5x50YJN/lTo/8it5RY=;
        b=p2XRRU/WOEn/SDwqliy3c5Ec2Dw5+0ZMKSf3Dsoma1ITC1MgENnGHBJ2RUhrpAx4nc
         lFhK5gdZ0V5RVwBDB2mHaIxt3rd+rNoAU6bLYHKfnh+Baf/Y64ZI3TmjLe8w4y+5hQJa
         Cxyr5KTpUYQtGNjHf3QG7bHzi5uld8hhEC6GxtKcqKyPDD3o6GlyiVt9VxqsTNEoKg1F
         MLe46PUNx4M0v1miN3pcsK9CRIWlOXSeIsDPGRwtrOJBrXprnrOqRiL5dZXDvxIalZw0
         SUPah/qi6IqBWbZzhiGjRwXuA7KyxEnfD3YBzSF4UIUk1IDQlkSqe0Y63CucLl8YMmNR
         anOQ==
X-Gm-Message-State: AJIora/WPRDoXliwJMbzxTqM4zMerfbt/Gr6zTtQQ4hL7ifdutk480iZ
        I8VWb3DM7iy9DKH7na0P92RDqYCzFmdQn4Go4sOHm4mF2pBJG3iUlrxwtOIgM5shcOTOWfUxCyc
        tppWNlP0Rp6Xqs71qODAboXpP9YuWs0y9vztsGZaA+l4=
X-Received: by 2002:a05:6870:e245:b0:de:9321:9ea3 with SMTP id d5-20020a056870e24500b000de93219ea3mr575012oac.79.1658456665401;
        Thu, 21 Jul 2022 19:24:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vz9CcL2MR+9ZDnXuSckB30ZyxqPrqbHamINT424fwyaT0j4I7PHNlLUoX0SQRnEXszDNhPPQ==
X-Received: by 2002:a05:6870:e245:b0:de:9321:9ea3 with SMTP id d5-20020a056870e24500b000de93219ea3mr574998oac.79.1658456665112;
        Thu, 21 Jul 2022 19:24:25 -0700 (PDT)
Received: from mfo-t470.. ([2804:14c:4e1:8732:c479:1206:16fb:ce1f])
        by smtp.gmail.com with ESMTPSA id k23-20020a056870959700b000f5f4ad194bsm1814528oao.25.2022.07.21.19.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 19:24:24 -0700 (PDT)
From:   Mauricio Faria de Oliveira <mfo@canonical.com>
To:     linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-fsdevel@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>
Subject: [RFC PATCH 1/6] modpost: factor out elf/arch-specific code from section_rel[a]()
Date:   Thu, 21 Jul 2022 23:24:11 -0300
Message-Id: <20220722022416.137548-2-mfo@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220722022416.137548-1-mfo@canonical.com>
References: <20220722022416.137548-1-mfo@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

There's elf/arch-specific code identical in both functions, with some
in section_rel() only.

In order to factor that out, generalize the different relocation types
Elf_Rela/Elf_Rel (relocation with/without an addend) with the Elf_Rela
type, that is just Elf_Rel with a '.r_addend' field.

Most of this code only uses Elf_Rel fields ('.r_offset' and '.r_info').
Make usage of '.r_addend' conditional on section header type SHT_RELA.

(Note, though, that '.r_addend' is used on SHT_REL in some archs/formats
for the _output_ relocation entry, but this is fine and existing code.)

This change also seems to help with readability of section_rel[a]().

Signed-off-by: Mauricio Faria de Oliveira <mfo@canonical.com>
---
 scripts/mod/modpost.c | 141 +++++++++++++++++++++++++-----------------
 1 file changed, 84 insertions(+), 57 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index a0f59d7a8875..4c1038dccae0 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1716,13 +1716,90 @@ static int addend_mips_rel(struct elf_info *elf, Elf_Shdr *sechdr, Elf_Rela *r)
 #define R_RISCV_SUB32		39
 #endif
 
+/*
+ * RelX: refers to usage of Elf_Rela or Elf_Rel interchangeably where possible.
+ *
+ * The usage of Elf_Rela (relocation with an addend) even for Elf_Rel (without)
+ * as an input parameter is possible for .r_offset and .r_info (same offset on
+ * both struct types) *BUT* .r_addend can ONLY be accessed on SHT_RELA headers
+ * (i.e., where it is valid in the input).
+ *
+ * Note: .r_addend on SHT_REL is calculated/accessed for the _output_ parameter,
+ * via the addend_ARCH_rel() functions, but that is fine, as it's not the input.
+ *
+ * Return value 1 indicates to skip further processing on this relocation entry.
+ *
+ * Output parameters:
+ * - 'r' is the relocation entry (i.e., replace data at 'r.r_offset' in section
+ * w/ header 'sechdr' w/ data from symbol w/ symbol table index in 'r.r_info',
+ * w/ possible relocation addend 'r.r_addend').
+ * - 'sym' is that symbol (a pointer to the symbol table + symbol table index).
+ */
+static int get_relx_sym(struct elf_info *elf, Elf_Shdr *sechdr, Elf_Rela *rela,
+			Elf_Rela *out_r, Elf_Sym **out_sym)
+{
+	Elf_Sym *sym;
+	Elf_Rela r;
+	unsigned int r_sym;
+
+	/* Get .r_offset/.r_info and r_sym */
+	r.r_offset = TO_NATIVE(rela->r_offset);
+#if KERNEL_ELFCLASS == ELFCLASS64
+	if (elf->hdr->e_machine == EM_MIPS) {
+		unsigned int r_typ;
+
+		r_sym = ELF64_MIPS_R_SYM(rela->r_info);
+		r_sym = TO_NATIVE(r_sym);
+		r_typ = ELF64_MIPS_R_TYPE(rela->r_info);
+		r.r_info = ELF64_R_INFO(r_sym, r_typ);
+	} else {
+		r.r_info = TO_NATIVE(rela->r_info);
+		r_sym = ELF_R_SYM(r.r_info);
+	}
+#else
+	r.r_info = TO_NATIVE(rela->r_info);
+	r_sym = ELF_R_SYM(r.r_info);
+#endif
+
+	/* Get .r_addend (only output on SHT_REL) */
+	if (sechdr->sh_type == SHT_RELA) {
+		r.r_addend = TO_NATIVE(rela->r_addend);
+	} else if (sechdr->sh_type == SHT_REL) {
+		r.r_addend = 0;
+		switch (elf->hdr->e_machine) {
+		case EM_386:
+			if (addend_386_rel(elf, sechdr, &r))
+				return 1;
+			break;
+		case EM_ARM:
+			if (addend_arm_rel(elf, sechdr, &r))
+				return 1;
+			break;
+		case EM_MIPS:
+			if (addend_mips_rel(elf, sechdr, &r))
+				return 1;
+			break;
+		}
+	}
+
+	sym = elf->symtab_start + r_sym;
+
+	/* Skip special sections */
+	if (is_shndx_special(sym->st_shndx))
+		return 1;
+
+	/* Done */
+	*out_r = r;
+	*out_sym = sym;
+	return 0;
+}
+
 static void section_rela(const char *modname, struct elf_info *elf,
 			 Elf_Shdr *sechdr)
 {
 	Elf_Sym  *sym;
 	Elf_Rela *rela;
 	Elf_Rela r;
-	unsigned int r_sym;
 	const char *fromsec;
 
 	Elf_Rela *start = (void *)elf->hdr + sechdr->sh_offset;
@@ -1735,23 +1812,9 @@ static void section_rela(const char *modname, struct elf_info *elf,
 		return;
 
 	for (rela = start; rela < stop; rela++) {
-		r.r_offset = TO_NATIVE(rela->r_offset);
-#if KERNEL_ELFCLASS == ELFCLASS64
-		if (elf->hdr->e_machine == EM_MIPS) {
-			unsigned int r_typ;
-			r_sym = ELF64_MIPS_R_SYM(rela->r_info);
-			r_sym = TO_NATIVE(r_sym);
-			r_typ = ELF64_MIPS_R_TYPE(rela->r_info);
-			r.r_info = ELF64_R_INFO(r_sym, r_typ);
-		} else {
-			r.r_info = TO_NATIVE(rela->r_info);
-			r_sym = ELF_R_SYM(r.r_info);
-		}
-#else
-		r.r_info = TO_NATIVE(rela->r_info);
-		r_sym = ELF_R_SYM(r.r_info);
-#endif
-		r.r_addend = TO_NATIVE(rela->r_addend);
+		if (get_relx_sym(elf, sechdr, rela, &r, &sym))
+			continue;
+
 		switch (elf->hdr->e_machine) {
 		case EM_RISCV:
 			if (!strcmp("__ex_table", fromsec) &&
@@ -1759,10 +1822,7 @@ static void section_rela(const char *modname, struct elf_info *elf,
 				continue;
 			break;
 		}
-		sym = elf->symtab_start + r_sym;
-		/* Skip special sections */
-		if (is_shndx_special(sym->st_shndx))
-			continue;
+
 		if (is_second_extable_reloc(start, rela, fromsec))
 			find_extable_entry_size(fromsec, &r);
 		check_section_mismatch(modname, elf, &r, sym, fromsec);
@@ -1775,7 +1835,6 @@ static void section_rel(const char *modname, struct elf_info *elf,
 	Elf_Sym *sym;
 	Elf_Rel *rel;
 	Elf_Rela r;
-	unsigned int r_sym;
 	const char *fromsec;
 
 	Elf_Rel *start = (void *)elf->hdr + sechdr->sh_offset;
@@ -1788,41 +1847,9 @@ static void section_rel(const char *modname, struct elf_info *elf,
 		return;
 
 	for (rel = start; rel < stop; rel++) {
-		r.r_offset = TO_NATIVE(rel->r_offset);
-#if KERNEL_ELFCLASS == ELFCLASS64
-		if (elf->hdr->e_machine == EM_MIPS) {
-			unsigned int r_typ;
-			r_sym = ELF64_MIPS_R_SYM(rel->r_info);
-			r_sym = TO_NATIVE(r_sym);
-			r_typ = ELF64_MIPS_R_TYPE(rel->r_info);
-			r.r_info = ELF64_R_INFO(r_sym, r_typ);
-		} else {
-			r.r_info = TO_NATIVE(rel->r_info);
-			r_sym = ELF_R_SYM(r.r_info);
-		}
-#else
-		r.r_info = TO_NATIVE(rel->r_info);
-		r_sym = ELF_R_SYM(r.r_info);
-#endif
-		r.r_addend = 0;
-		switch (elf->hdr->e_machine) {
-		case EM_386:
-			if (addend_386_rel(elf, sechdr, &r))
-				continue;
-			break;
-		case EM_ARM:
-			if (addend_arm_rel(elf, sechdr, &r))
-				continue;
-			break;
-		case EM_MIPS:
-			if (addend_mips_rel(elf, sechdr, &r))
-				continue;
-			break;
-		}
-		sym = elf->symtab_start + r_sym;
-		/* Skip special sections */
-		if (is_shndx_special(sym->st_shndx))
+		if (get_relx_sym(elf, sechdr, (Elf_Rela *)rel, &r, &sym)
 			continue;
+
 		if (is_second_extable_reloc(start, rel, fromsec))
 			find_extable_entry_size(fromsec, &r);
 		check_section_mismatch(modname, elf, &r, sym, fromsec);
-- 
2.25.1

