Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 100D5DC0F9
	for <lists+linux-modules@lfdr.de>; Fri, 18 Oct 2019 11:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409782AbfJRJcJ (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Fri, 18 Oct 2019 05:32:09 -0400
Received: from mail-vs1-f73.google.com ([209.85.217.73]:43770 "EHLO
        mail-vs1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409752AbfJRJcJ (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Fri, 18 Oct 2019 05:32:09 -0400
Received: by mail-vs1-f73.google.com with SMTP id x2so1211535vse.10
        for <linux-modules@vger.kernel.org>; Fri, 18 Oct 2019 02:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=w96IBFa+LbhPv1tMNCO5lO3g8Rc4+dCAyv83kBM1KbQ=;
        b=UuMXbS1VDXSrzg400/ZlVcUiZJtpa/YrjX2duCZgzlqBt37ATXDNGUA5Lomr2S98Zo
         gb89rsts8JNDeagiZNGwvA4LAFHapDI3AgZZAmjI9iKlB6pyzsvupyZySFMKdsIS/NPn
         QUflCT1aK2m7QD1JrVHDnJu5vafPXa78Qpt3/l9vgnkMPBXRGxIjOpJGiUV7JuUvGyiL
         1AwhI97fb6ohGuPxupLhHuFdjSYojeD1VNYTT5qZ/MJoy8TBwDXPWhS4UGC9lqjgq7Qa
         XVNJBhA9udIzTffkcorFGOIqcVKYHZwE4RWpMf9l8oEfVW8wczIZ0outmdoG9aU8++NR
         HduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=w96IBFa+LbhPv1tMNCO5lO3g8Rc4+dCAyv83kBM1KbQ=;
        b=i9DNIGjzqQ/2ibjLEPpjwGp0NVHWoZT/wmYnh4tH3EP9LlikvGR5E0/n4WD+nCXb+B
         Zn1yPRDxOw37sN0umj835GZ6aJX/OAfd2jve4l4zUIIadWCexECLkW5IRywFi1Isb6rk
         f9jMA18prbsnm3muZGgcADSzWUJVJrE90PqnTUp5LYArxW+x9ls6V+N/pyMiRL/xVDIN
         Lj+061PvQxJtcjG7amZr6t5IOLPXf2+5uGoxQDZ7YprcsJJGthym2lTEgwDnxQmEfGT5
         YAViSeqUz25FrgVGF8/SwhkDitnMkt5DJ1jWfW4aVZJwcp09h8J5yfLM3WyTW/G9drLJ
         qC/A==
X-Gm-Message-State: APjAAAUwZ/lvVo7S3syZk2VbDq1Hn5GdIIqmnmaQT+C8Uf1UY92va6kL
        qVFLN6YfVzQ2rQITPQmgiyK5CHs0pedcMA==
X-Google-Smtp-Source: APXvYqx0I59HdbOYdXZ8mLY4td8zpIb3GxCjwY5MOrKW1sOkSQ0BwBPKSyMC8VAXMcnGQ4CsxgRvSBIki69F7A==
X-Received: by 2002:a67:c50d:: with SMTP id e13mr4853730vsk.88.1571391125373;
 Fri, 18 Oct 2019 02:32:05 -0700 (PDT)
Date:   Fri, 18 Oct 2019 10:31:42 +0100
In-Reply-To: <20191018093143.15997-1-maennich@google.com>
Message-Id: <20191018093143.15997-4-maennich@google.com>
Mime-Version: 1.0
References: <20191010151443.7399-1-maennich@google.com> <20191018093143.15997-1-maennich@google.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
Subject: [PATCH v2 3/4] symbol namespaces: revert to previous __ksymtab name scheme
From:   Matthias Maennich <maennich@google.com>
To:     linux-kernel@vger.kernel.org
Cc:     kernel-team@android.com, maennich@google.com,
        Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Martijn Coenen <maco@android.com>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Shaun Ruffell <sruffell@sruffell.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org,
        Stefan Wahren <stefan.wahren@i2se.com>
Content-Type: text/plain; charset="UTF-8"
Sender: owner-linux-modules@vger.kernel.org
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

The introduction of Symbol Namespaces changed the naming schema of the
__ksymtab entries from __kysmtab__symbol to __ksymtab_NAMESPACE.symbol.

That caused some breakages in tools that depend on the name layout in
either the binaries(vmlinux,*.ko) or in System.map. E.g. kmod's depmod
would not be able to read System.map without a patch to support symbol
namespaces. A warning reported by depmod for namespaced symbols would
look like

  depmod: WARNING: [...]/uas.ko needs unknown symbol usb_stor_adjust_quirks

In order to address this issue, revert to the original naming scheme and
rather read the __kstrtabns_<symbol> entries and their corresponding
values from __ksymtab_strings to update the namespace values for
symbols. After having read all symbols and handled them in
handle_modversions(), the symbols are created. In a second pass, read
the __kstrtabns_ entries and update the namespaces accordingly.

Reported-by: Stefan Wahren <stefan.wahren@i2se.com>
Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Fixes: 8651ec01daed ("module: add support for symbol namespaces.")
Acked-by: Will Deacon <will@kernel.org>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Matthias Maennich <maennich@google.com>
---
 include/linux/export.h | 14 +++++---------
 scripts/mod/modpost.c  | 33 ++++++++++++++++++---------------
 scripts/mod/modpost.h  |  1 +
 3 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/include/linux/export.h b/include/linux/export.h
index 621158ecd2e2..941d075f03d6 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -18,8 +18,6 @@ extern struct module __this_module;
 #define THIS_MODULE ((struct module *)0)
 #endif
 
-#define NS_SEPARATOR "."
-
 #ifdef CONFIG_MODVERSIONS
 /* Mark the CRC weak since genksyms apparently decides not to
  * generate a checksums for some symbols */
@@ -48,11 +46,11 @@ extern struct module __this_module;
  * absolute relocations that require runtime processing on relocatable
  * kernels.
  */
-#define __KSYMTAB_ENTRY_NS(sym, sec, ns)				\
+#define __KSYMTAB_ENTRY_NS(sym, sec)					\
 	__ADDRESSABLE(sym)						\
 	asm("	.section \"___ksymtab" sec "+" #sym "\", \"a\"	\n"	\
 	    "	.balign	4					\n"	\
-	    "__ksymtab_" #ns NS_SEPARATOR #sym ":		\n"	\
+	    "__ksymtab_" #sym ":				\n"	\
 	    "	.long	" #sym "- .				\n"	\
 	    "	.long	__kstrtab_" #sym "- .			\n"	\
 	    "	.long	__kstrtabns_" #sym "- .			\n"	\
@@ -74,16 +72,14 @@ struct kernel_symbol {
 	int namespace_offset;
 };
 #else
-#define __KSYMTAB_ENTRY_NS(sym, sec, ns)				\
-	static const struct kernel_symbol __ksymtab_##sym##__##ns	\
-	asm("__ksymtab_" #ns NS_SEPARATOR #sym)				\
+#define __KSYMTAB_ENTRY_NS(sym, sec)					\
+	static const struct kernel_symbol __ksymtab_##sym		\
 	__attribute__((section("___ksymtab" sec "+" #sym), used))	\
 	__aligned(sizeof(void *))					\
 	= { (unsigned long)&sym, __kstrtab_##sym, __kstrtabns_##sym }
 
 #define __KSYMTAB_ENTRY(sym, sec)					\
 	static const struct kernel_symbol __ksymtab_##sym		\
-	asm("__ksymtab_" #sym)						\
 	__attribute__((section("___ksymtab" sec "+" #sym), used))	\
 	__aligned(sizeof(void *))					\
 	= { (unsigned long)&sym, __kstrtab_##sym, NULL }
@@ -115,7 +111,7 @@ struct kernel_symbol {
 	static const char __kstrtabns_##sym[]				\
 	__attribute__((section("__ksymtab_strings"), used, aligned(1)))	\
 	= #ns;								\
-	__KSYMTAB_ENTRY_NS(sym, sec, ns)
+	__KSYMTAB_ENTRY_NS(sym, sec)
 
 #define ___EXPORT_SYMBOL(sym, sec)					\
 	___export_symbol_common(sym, sec);				\
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 95b1eac656aa..0bf7eab80d9f 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -348,18 +348,11 @@ static enum export export_from_sec(struct elf_info *elf, unsigned int sec)
 		return export_unknown;
 }
 
-static char *sym_extract_namespace(const char **symname)
+static const char *namespace_from_kstrtabns(struct elf_info *info,
+					    Elf_Sym *kstrtabns)
 {
-	char *namespace = NULL;
-	char *ns_separator;
-
-	ns_separator = strchr(*symname, '.');
-	if (ns_separator) {
-		namespace = NOFAIL(strndup(*symname, ns_separator - *symname));
-		*symname = ns_separator + 1;
-	}
-
-	return namespace;
+	char *value = info->ksymtab_strings + kstrtabns->st_value;
+	return value[0] ? value : NULL;
 }
 
 static void sym_update_namespace(const char *symname, const char *namespace)
@@ -600,6 +593,10 @@ static int parse_elf(struct elf_info *info, const char *filename)
 			info->export_unused_gpl_sec = i;
 		else if (strcmp(secname, "__ksymtab_gpl_future") == 0)
 			info->export_gpl_future_sec = i;
+		else if (strcmp(secname, "__ksymtab_strings") == 0)
+			info->ksymtab_strings = (void *)hdr +
+						sechdrs[i].sh_offset -
+						sechdrs[i].sh_addr;
 
 		if (sechdrs[i].sh_type == SHT_SYMTAB) {
 			unsigned int sh_link_idx;
@@ -689,7 +686,6 @@ static void handle_modversions(struct module *mod, struct elf_info *info,
 	enum export export;
 	bool is_crc = false;
 	const char *name;
-	char *namespace;
 
 	if ((!is_vmlinux(mod->name) || mod->is_dot_o) &&
 	    strstarts(symname, "__ksymtab"))
@@ -762,10 +758,7 @@ static void handle_modversions(struct module *mod, struct elf_info *info,
 		/* All exported symbols */
 		if (strstarts(symname, "__ksymtab_")) {
 			name = symname + strlen("__ksymtab_");
-			namespace = sym_extract_namespace(&name);
 			sym_add_exported(name, mod, export);
-			sym_update_namespace(name, namespace);
-			free(namespace);
 		}
 		if (strcmp(symname, "init_module") == 0)
 			mod->has_init = 1;
@@ -2061,6 +2054,16 @@ static void read_symbols(const char *modname)
 		handle_moddevtable(mod, &info, sym, symname);
 	}
 
+	/* Apply symbol namespaces from __kstrtabns_<symbol> entries. */
+	for (sym = info.symtab_start; sym < info.symtab_stop; sym++) {
+		symname = remove_dot(info.strtab + sym->st_name);
+
+		if (strstarts(symname, "__kstrtabns_"))
+			sym_update_namespace(symname + strlen("__kstrtabns_"),
+					     namespace_from_kstrtabns(&info,
+								      sym));
+	}
+
 	// check for static EXPORT_SYMBOL_* functions && global vars
 	for (sym = info.symtab_start; sym < info.symtab_stop; sym++) {
 		unsigned char bind = ELF_ST_BIND(sym->st_info);
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 92a926d375d2..ad271bc6c313 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -143,6 +143,7 @@ struct elf_info {
 	Elf_Section  export_gpl_sec;
 	Elf_Section  export_unused_gpl_sec;
 	Elf_Section  export_gpl_future_sec;
+	char	     *ksymtab_strings;
 	char         *strtab;
 	char	     *modinfo;
 	unsigned int modinfo_len;
-- 
2.23.0.866.gb869b98d4c-goog

