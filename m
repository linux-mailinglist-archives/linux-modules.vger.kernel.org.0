Return-Path: <linux-modules+bounces-2002-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 521FD97F076
	for <lists+linux-modules@lfdr.de>; Mon, 23 Sep 2024 20:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1A6B28532D
	for <lists+linux-modules@lfdr.de>; Mon, 23 Sep 2024 18:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4BA81A42AF;
	Mon, 23 Sep 2024 18:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VdlsTiJw"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5690D1A3AAF
	for <linux-modules@vger.kernel.org>; Mon, 23 Sep 2024 18:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727115573; cv=none; b=dbUH6FqqfceB7tVN+rcVhVuqmF1SVdX9TrL0EVHQeI0p+LPWeUWMo3DMN0Cd9uLwinQc3+6/9IDvxR2ehMyL6upL7+0k43DsKTcbaSgCSanY23JHnalYW3STTrG8f6WG8lKK4CQYYMTa5qY9fp0MinQuIZQ+axR0SUlIlOL0Cbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727115573; c=relaxed/simple;
	bh=1xKBkZXfOARYS2S1Jov+944NphE2QInUDswo5pK9/90=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NGjt9oWavLSY75g6/hVGMkjeNP1tEijvUInngokkWclM3KdIuUqZvn6tq1SCU7pdYjJ+k/yXPflmzoqylsrRIKnLLNLaC179uH6JvYSgzdsQfvkYSMnpPOCN0Z856fApBVQC0BE7wLso8/pNqXRWoWz2qPnxzKG5rp0bChZEBuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VdlsTiJw; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6d4f52a4069so81090747b3.3
        for <linux-modules@vger.kernel.org>; Mon, 23 Sep 2024 11:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727115569; x=1727720369; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f95D7vabrF97I5SuWiNeXKXt2St66qrVnN5xT1ayeds=;
        b=VdlsTiJwfccCXXmOHG0AJfrdEeqQeIx/+6/Mtxx0XNb/8GswdkiQ/NpON2tQ3UoBLW
         QskqqK6sA9r3tfcmHrlgTe9yeO/7nTFce3KaO7/gWutP6uuqW77HkZX0iawvKXQES/IC
         AFL3PHgVQpZhm9irGcSiHx7Sub/CIOVD+Amhm1Qpj1+FsFDvp2G7uRSLdrf+3u0dfbeK
         t+w4mjXX+aHNvXSQ+5y2Uflo6d87kr6qq/fwwNpUff6uBd77f45dFDQuTUQ84jjZZ7bT
         FvY+duP4bS/uy9JVRTQzsaqr6I98MDJopHoLaCYAkMAP6zUXUevu0ywshZ0yWGNhWp8k
         FDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727115569; x=1727720369;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f95D7vabrF97I5SuWiNeXKXt2St66qrVnN5xT1ayeds=;
        b=vVUxICRy9ukXeqyFejTEfcg7AMKDLCzVeGYbl1N/ViFa7/VgVdx7p3jQ9sYAp3VFPu
         NUw4akvHxMHXABw0kMaCgjQ+4LWfTrq7l5n7jYGIMEtn03lKs80rkSlLRjwvuMtiRBPx
         UwLvgXUujrWhbUN2y8yjQrN4nNjEuVwjZ/ZJppTPDG+AS+7zCsKt/w3Z/1KvQrFyK76k
         VpsRzomr0l/gpZG4bsbcOmkW/5LEy3IayW1UkSpkSOv0uVfaU+kkcYdDapVZSGvU8jF7
         MHwhzOKfU/POC01hb/kYXYmJrknncAgz/jL+2U9PO0esV30ZdUIjFhaUwwivZrs4qyy6
         R5Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUuKTt+QMFQ0KA7uLqYBkHZ0cypsLJfYIuSAwf0MmNfr1EACzQToMAm64qdPBM+qSj0/he9jQmIXSGrsZNj@vger.kernel.org
X-Gm-Message-State: AOJu0YzI5Oi/PGk33RiPFWYtQh+9Y04tbsjeO1vFJxePnuzeOq3Za3+8
	rONEmVWT3NUaqo2ogIKiaVg+jYoyFVHFy86HFvyVpb1qpOvcZ2gIxIAClshxigMhBDzndKHSAX3
	SAw9EOHKJ3XtNVcw7IOPCBgrlRw==
X-Google-Smtp-Source: AGHT+IE8X/XBPFl4/JAlN1dgkCWdxwJteJjEpwiYaKMbysPwi14YbpQnM3XVwDxBEeM0anMEH0CXnfTmDslc9co2GTc=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:690c:726:b0:690:d536:27e1 with
 SMTP id 00721157ae682-6dff27056c9mr334847b3.2.1727115569427; Mon, 23 Sep 2024
 11:19:29 -0700 (PDT)
Date: Mon, 23 Sep 2024 18:18:59 +0000
In-Reply-To: <20240923181846.549877-22-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240923181846.549877-22-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=17008; i=samitolvanen@google.com;
 h=from:subject; bh=1xKBkZXfOARYS2S1Jov+944NphE2QInUDswo5pK9/90=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDGkfN/JEXOQQ0vBdz7TZtMlF5gvDw/uF586FM9zRbRE6r
 /tuM4dRRykLgxgHg6yYIkvL19Vbd393Sn31uUgCZg4rE8gQBi5OAZjIlgWMDK89jt+ULTUtVC9b
 WeHcOtXUSKH5c+g+rUNhoSG6ofLL5jIy/ErmuS4v/vmY84ZS1UVlgUdCi3UVnG/s3dbg8nZR2DN WLgA=
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240923181846.549877-35-samitolvanen@google.com>
Subject: [PATCH v3 13/20] gendwarfksyms: Add symtypes output
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Add support for producing genksyms-style symtypes files. Process
die_map to find the longest expansions for each type, and use symtypes
references in type definitions. The basic file format is similar to
genksyms, with two notable exceptions:

  1. Type names with spaces (common with Rust) in references are
     wrapped in single quotes. E.g.:

     s#'core::result::Result<u8, core::num::error::ParseIntError>'

  2. The actual type definition is the simple parsed DWARF format we
     output with --dump-dies, not the preprocessed C-style format
     genksyms produces.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/gendwarfksyms/Makefile        |   1 +
 scripts/gendwarfksyms/die.c           |  11 +
 scripts/gendwarfksyms/dwarf.c         |   1 +
 scripts/gendwarfksyms/gendwarfksyms.c |  36 ++-
 scripts/gendwarfksyms/gendwarfksyms.h |  19 ++
 scripts/gendwarfksyms/symbols.c       |   4 +-
 scripts/gendwarfksyms/types.c         | 359 ++++++++++++++++++++++++++
 7 files changed, 428 insertions(+), 3 deletions(-)
 create mode 100644 scripts/gendwarfksyms/types.c

diff --git a/scripts/gendwarfksyms/Makefile b/scripts/gendwarfksyms/Makefile
index c06145d84df8..6540282dc746 100644
--- a/scripts/gendwarfksyms/Makefile
+++ b/scripts/gendwarfksyms/Makefile
@@ -6,5 +6,6 @@ gendwarfksyms-objs += cache.o
 gendwarfksyms-objs += die.o
 gendwarfksyms-objs += dwarf.o
 gendwarfksyms-objs += symbols.o
+gendwarfksyms-objs += types.o
 
 HOSTLDLIBS_gendwarfksyms := -ldw -lelf
diff --git a/scripts/gendwarfksyms/die.c b/scripts/gendwarfksyms/die.c
index 2829387fd815..df1ca3a032bb 100644
--- a/scripts/gendwarfksyms/die.c
+++ b/scripts/gendwarfksyms/die.c
@@ -22,6 +22,7 @@ static inline unsigned int die_hash(uintptr_t addr, enum die_state state)
 static void init_die(struct die *cd)
 {
 	cd->state = DIE_INCOMPLETE;
+	cd->mapped = false;
 	cd->fqn = NULL;
 	cd->tag = -1;
 	cd->addr = 0;
@@ -83,6 +84,16 @@ static void reset_die(struct die *cd)
 	init_die(cd);
 }
 
+void die_map_for_each(die_map_callback_t func, void *arg)
+{
+	struct hlist_node *tmp;
+	struct die *cd;
+
+	hash_for_each_safe(die_map, cd, tmp, hash) {
+		func(cd, arg);
+	}
+}
+
 void die_map_free(void)
 {
 	struct hlist_node *tmp;
diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index d2c6e91a7653..2f80c78e356e 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -725,6 +725,7 @@ static void process_symbol(struct state *state, Dwarf_Die *die,
 {
 	debug("%s", state->sym->name);
 	check(process_func(state, NULL, die));
+	state->sym->state = SYMBOL_MAPPED;
 	if (dump_dies)
 		fputs("\n", stderr);
 }
diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksyms/gendwarfksyms.c
index 83b7eb8226dd..c077c4c1d346 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.c
+++ b/scripts/gendwarfksyms/gendwarfksyms.c
@@ -21,6 +21,11 @@ int debug;
 int dump_dies;
 /* Print debugging information about die_map changes */
 int dump_die_map;
+/* Print out type strings (i.e. type_map) */
+int dump_types;
+/* Write a symtypes file */
+int symtypes;
+static const char *symtypes_file;
 
 static void usage(void)
 {
@@ -29,6 +34,8 @@ static void usage(void)
 	      "  -d, --debug          Print debugging information\n"
 	      "      --dump-dies      Dump DWARF DIE contents\n"
 	      "      --dump-die-map   Print debugging information about die_map changes\n"
+	      "      --dump-types     Dump type strings\n"
+	      "  -T, --symtypes file  Write a symtypes file\n"
 	      "  -h, --help           Print this message\n"
 	      "\n",
 	      stderr);
@@ -41,6 +48,7 @@ static int process_module(Dwfl_Module *mod, void **userdata, const char *name,
 	Dwarf_Die cudie;
 	Dwarf_CU *cu = NULL;
 	Dwarf *dbg;
+	FILE *symfile = arg;
 	int res;
 
 	debug("%s", name);
@@ -60,6 +68,10 @@ static int process_module(Dwfl_Module *mod, void **userdata, const char *name,
 		process_cu(&cudie);
 	} while (cu);
 
+	/*
+	 * Use die_map to expand type strings and write them to `symfile`.
+	 */
+	generate_symtypes(symfile);
 	die_map_free();
 
 	return DWARF_CB_OK;
@@ -72,22 +84,29 @@ static const Dwfl_Callbacks callbacks = {
 
 int main(int argc, char **argv)
 {
+	FILE *symfile = NULL;
 	unsigned int n;
 	int opt;
 
 	struct option opts[] = { { "debug", 0, NULL, 'd' },
 				 { "dump-dies", 0, &dump_dies, 1 },
 				 { "dump-die-map", 0, &dump_die_map, 1 },
+				 { "dump-types", 0, &dump_types, 1 },
+				 { "symtypes", 1, NULL, 'T' },
 				 { "help", 0, NULL, 'h' },
 				 { 0, 0, NULL, 0 } };
 
-	while ((opt = getopt_long(argc, argv, "dh", opts, NULL)) != EOF) {
+	while ((opt = getopt_long(argc, argv, "dT:h", opts, NULL)) != EOF) {
 		switch (opt) {
 		case 0:
 			break;
 		case 'd':
 			debug = 1;
 			break;
+		case 'T':
+			symtypes = 1;
+			symtypes_file = optarg;
+			break;
 		case 'h':
 			usage();
 			return 0;
@@ -107,6 +126,16 @@ int main(int argc, char **argv)
 
 	symbol_read_exports(stdin);
 
+	if (symtypes_file) {
+		symfile = fopen(symtypes_file, "w");
+
+		if (!symfile) {
+			error("fopen failed for '%s': %s", symtypes_file,
+			      strerror(errno));
+			return -1;
+		}
+	}
+
 	for (n = optind; n < argc; n++) {
 		Dwfl *dwfl;
 		int fd;
@@ -135,7 +164,7 @@ int main(int argc, char **argv)
 
 		dwfl_report_end(dwfl, NULL, NULL);
 
-		if (dwfl_getmodules(dwfl, &process_module, NULL, 0)) {
+		if (dwfl_getmodules(dwfl, &process_module, symfile, 0)) {
 			error("dwfl_getmodules failed for '%s'", argv[n]);
 			return -1;
 		}
@@ -143,5 +172,8 @@ int main(int argc, char **argv)
 		dwfl_end(dwfl);
 	}
 
+	if (symfile)
+		check(fclose(symfile));
+
 	return 0;
 }
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index c913a2421515..9fff30699d15 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -25,6 +25,8 @@
 extern int debug;
 extern int dump_dies;
 extern int dump_die_map;
+extern int dump_types;
+extern int symtypes;
 
 /*
  * Output helpers
@@ -93,6 +95,11 @@ static inline unsigned int addr_hash(uintptr_t addr)
 	return hash_ptr((const void *)addr);
 }
 
+enum symbol_state {
+	SYMBOL_UNPROCESSED,
+	SYMBOL_MAPPED,
+};
+
 struct symbol_addr {
 	uint32_t section;
 	Elf64_Addr address;
@@ -103,6 +110,8 @@ struct symbol {
 	struct symbol_addr addr;
 	struct hlist_node addr_hash;
 	struct hlist_node name_hash;
+	enum symbol_state state;
+	uintptr_t die_addr;
 };
 
 typedef void (*symbol_callback_t)(struct symbol *, void *arg);
@@ -155,6 +164,7 @@ static inline const char *die_state_name(enum die_state state)
 
 struct die {
 	enum die_state state;
+	bool mapped;
 	char *fqn;
 	int tag;
 	uintptr_t addr;
@@ -162,10 +172,13 @@ struct die {
 	struct hlist_node hash;
 };
 
+typedef void (*die_map_callback_t)(struct die *, void *arg);
+
 int __die_map_get(uintptr_t addr, enum die_state state, struct die **res);
 struct die *die_map_get(Dwarf_Die *die, enum die_state state);
 void die_map_add_string(struct die *pd, const char *str);
 void die_map_add_linebreak(struct die *pd, int linebreak);
+void die_map_for_each(die_map_callback_t func, void *arg);
 void die_map_add_die(struct die *pd, struct die *child);
 void die_map_free(void);
 
@@ -227,4 +240,10 @@ int process_die_container(struct state *state, struct die *cache,
 
 void process_cu(Dwarf_Die *cudie);
 
+/*
+ * types.c
+ */
+
+void generate_symtypes(FILE *file);
+
 #endif /* __GENDWARFKSYMS_H */
diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symbols.c
index d84b46675dd1..a89e4869925a 100644
--- a/scripts/gendwarfksyms/symbols.c
+++ b/scripts/gendwarfksyms/symbols.c
@@ -92,6 +92,7 @@ void symbol_read_exports(FILE *file)
 		sym = xcalloc(1, sizeof(struct symbol));
 		sym->name = name;
 		sym->addr.section = SHN_UNDEF;
+		sym->state = SYMBOL_UNPROCESSED;
 
 		hash_add(symbol_names, &sym->name_hash, hash_str(sym->name));
 		++nsym;
@@ -107,7 +108,8 @@ static void get_symbol(struct symbol *sym, void *arg)
 {
 	struct symbol **res = arg;
 
-	*res = sym;
+	if (sym->state == SYMBOL_UNPROCESSED)
+		*res = sym;
 }
 
 struct symbol *symbol_get(const char *name)
diff --git a/scripts/gendwarfksyms/types.c b/scripts/gendwarfksyms/types.c
new file mode 100644
index 000000000000..c05811299eba
--- /dev/null
+++ b/scripts/gendwarfksyms/types.c
@@ -0,0 +1,359 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 Google LLC
+ */
+
+#include "gendwarfksyms.h"
+
+static struct expansion_cache expansion_cache;
+
+/*
+ * A simple linked list of shared or owned strings to avoid copying strings
+ * around when not necessary.
+ */
+struct type_list_entry {
+	const char *str;
+	void *owned;
+	struct list_head list;
+};
+
+static void type_list_free(struct list_head *list)
+{
+	struct type_list_entry *entry;
+	struct type_list_entry *tmp;
+
+	list_for_each_entry_safe(entry, tmp, list, list) {
+		if (entry->owned)
+			free(entry->owned);
+		free(entry);
+	}
+
+	INIT_LIST_HEAD(list);
+}
+
+static int type_list_append(struct list_head *list, const char *s, void *owned)
+{
+	struct type_list_entry *entry;
+
+	if (!s)
+		return 0;
+
+	entry = xmalloc(sizeof(struct type_list_entry));
+	entry->str = s;
+	entry->owned = owned;
+	list_add_tail(&entry->list, list);
+
+	return strlen(entry->str);
+}
+
+static void type_list_write(struct list_head *list, FILE *file)
+{
+	struct type_list_entry *entry;
+
+	list_for_each_entry(entry, list, list) {
+		if (entry->str)
+			checkp(fputs(entry->str, file));
+	}
+}
+
+/*
+ * An expanded type string in symtypes format.
+ */
+struct type_expansion {
+	char *name;
+	size_t len;
+	struct list_head expanded;
+	struct hlist_node hash;
+};
+
+static void type_expansion_init(struct type_expansion *type)
+{
+	type->name = NULL;
+	type->len = 0;
+	INIT_LIST_HEAD(&type->expanded);
+}
+
+static inline void type_expansion_free(struct type_expansion *type)
+{
+	free(type->name);
+	type->name = NULL;
+	type->len = 0;
+	type_list_free(&type->expanded);
+}
+
+static void type_expansion_append(struct type_expansion *type, const char *s,
+				  void *owned)
+{
+	type->len += type_list_append(&type->expanded, s, owned);
+}
+
+/*
+ * type_map -- the longest expansions for each type.
+ *
+ * const char *name -> struct type_expansion *
+ */
+#define TYPE_HASH_BITS 16
+static HASHTABLE_DEFINE(type_map, 1 << TYPE_HASH_BITS);
+
+static int type_map_get(const char *name, struct type_expansion **res)
+{
+	struct type_expansion *e;
+
+	hash_for_each_possible(type_map, e, hash, hash_str(name)) {
+		if (!strcmp(name, e->name)) {
+			*res = e;
+			return 0;
+		}
+	}
+
+	return -1;
+}
+
+static void type_map_add(const char *name, struct type_expansion *type)
+{
+	struct type_expansion *e;
+
+	if (type_map_get(name, &e)) {
+		e = xmalloc(sizeof(struct type_expansion));
+		type_expansion_init(e);
+		e->name = xstrdup(name);
+
+		hash_add(type_map, &e->hash, hash_str(e->name));
+
+		if (dump_types)
+			debug("adding %s", e->name);
+	} else {
+		/* Use the longest available expansion */
+		if (type->len <= e->len)
+			return;
+
+		type_list_free(&e->expanded);
+
+		if (dump_types)
+			debug("replacing %s", e->name);
+	}
+
+	/* Take ownership of type->expanded */
+	list_replace_init(&type->expanded, &e->expanded);
+	e->len = type->len;
+
+	if (dump_types) {
+		checkp(fputs(e->name, stderr));
+		checkp(fputs(" ", stderr));
+		type_list_write(&e->expanded, stderr);
+		checkp(fputs("\n", stderr));
+	}
+}
+
+static void type_map_write(FILE *file)
+{
+	struct type_expansion *e;
+	struct hlist_node *tmp;
+
+	if (!file)
+		return;
+
+	hash_for_each_safe(type_map, e, tmp, hash) {
+		checkp(fputs(e->name, file));
+		checkp(fputs(" ", file));
+		type_list_write(&e->expanded, file);
+		checkp(fputs("\n", file));
+	}
+}
+
+static void type_map_free(void)
+{
+	struct type_expansion *e;
+	struct hlist_node *tmp;
+
+	hash_for_each_safe(type_map, e, tmp, hash) {
+		type_expansion_free(e);
+		free(e);
+	}
+
+	hash_init(type_map);
+}
+
+/*
+ * Type reference format: <prefix>#<name>, where prefix:
+ * 	s -> structure
+ * 	u -> union
+ * 	e -> enum
+ * 	t -> typedef
+ *
+ * Names with spaces are additionally wrapped in single quotes.
+ */
+static char get_type_prefix(int tag)
+{
+	switch (tag) {
+	case DW_TAG_class_type:
+	case DW_TAG_structure_type:
+		return 's';
+	case DW_TAG_union_type:
+		return 'u';
+	case DW_TAG_enumeration_type:
+		return 'e';
+	case DW_TAG_typedef_type:
+		return 't';
+	default:
+		return 0;
+	}
+}
+
+static char *get_type_name(struct die *cache)
+{
+	const char *quote;
+	char prefix;
+	char *name;
+
+	if (cache->state == DIE_INCOMPLETE) {
+		warn("found incomplete cache entry: %p", cache);
+		return NULL;
+	}
+	if (!cache->fqn || !*cache->fqn)
+		return NULL;
+
+	prefix = get_type_prefix(cache->tag);
+	if (!prefix)
+		return NULL;
+
+	/* Wrap names with spaces in single quotes */
+	quote = strstr(cache->fqn, " ") ? "'" : "";
+
+	/* <prefix>#<type_name>\0 */
+	if (asprintf(&name, "%c#%s%s%s", prefix, quote, cache->fqn, quote) < 0)
+		error("asprintf failed for '%s'", cache->fqn);
+
+	return name;
+}
+
+static void __type_expand(struct die *cache, struct type_expansion *type,
+			  bool recursive);
+
+static void type_expand_child(struct die *cache, struct type_expansion *type,
+			      bool recursive)
+{
+	struct type_expansion child;
+	char *name;
+
+	name = get_type_name(cache);
+	if (!name) {
+		__type_expand(cache, type, recursive);
+		return;
+	}
+
+	if (recursive && !__cache_was_expanded(&expansion_cache, cache->addr)) {
+		__cache_mark_expanded(&expansion_cache, cache->addr);
+		type_expansion_init(&child);
+		__type_expand(cache, &child, true);
+		type_map_add(name, &child);
+		type_expansion_free(&child);
+	}
+
+	type_expansion_append(type, name, name);
+}
+
+static void __type_expand(struct die *cache, struct type_expansion *type,
+			  bool recursive)
+{
+	struct die_fragment *df;
+	struct die *child;
+
+	list_for_each_entry(df, &cache->fragments, list) {
+		switch (df->type) {
+		case FRAGMENT_STRING:
+			type_expansion_append(type, df->data.str, NULL);
+			break;
+		case FRAGMENT_DIE:
+			/* Use a complete die_map expansion if available */
+			if (__die_map_get(df->data.addr, DIE_COMPLETE,
+					  &child) &&
+			    __die_map_get(df->data.addr, DIE_UNEXPANDED,
+					  &child))
+				error("unknown child: %" PRIxPTR,
+				      df->data.addr);
+
+			type_expand_child(child, type, recursive);
+			break;
+		case FRAGMENT_LINEBREAK:
+			/*
+			 * Keep whitespace in the symtypes format, but avoid
+			 * repeated spaces.
+			 */
+			if (list_is_last(&df->list, &cache->fragments) ||
+			    list_next_entry(df, list)->type !=
+				    FRAGMENT_LINEBREAK)
+				type_expansion_append(type, " ", NULL);
+			break;
+		default:
+			error("empty die_fragment in %p", cache);
+		}
+	}
+}
+
+static void type_expand(struct die *cache, struct type_expansion *type,
+			bool recursive)
+{
+	type_expansion_init(type);
+	__type_expand(cache, type, recursive);
+	cache_clear_expanded(&expansion_cache);
+}
+
+static void expand_type(struct die *cache, void *arg)
+{
+	struct type_expansion type;
+	char *name;
+
+	if (cache->mapped)
+		return;
+
+	cache->mapped = true;
+
+	/*
+	 * Skip unexpanded die_map entries if there's a complete
+	 * expansion available for this DIE.
+	 */
+	if (cache->state == DIE_UNEXPANDED &&
+	    !__die_map_get(cache->addr, DIE_COMPLETE, &cache)) {
+		if (cache->mapped)
+			return;
+
+		cache->mapped = true;
+	}
+
+	name = get_type_name(cache);
+	if (!name)
+		return;
+
+	debug("%s", name);
+	type_expand(cache, &type, true);
+	type_map_add(name, &type);
+
+	type_expansion_free(&type);
+	free(name);
+}
+
+void generate_symtypes(FILE *file)
+{
+	hash_init(expansion_cache.cache);
+
+	/*
+	 * die_map processing:
+	 *
+	 *   1. die_map contains all types referenced in exported symbol
+	 *      signatures, but can contain duplicates just like the original
+	 *      DWARF, and some references may not be fully expanded depending
+	 *      on how far we processed the DIE tree for that specific symbol.
+	 *
+	 *      For each die_map entry, find the longest available expansion,
+	 *      and add it to type_map.
+	 */
+	die_map_for_each(expand_type, NULL);
+
+	/*
+	 *   2. If a symtypes file is requested, write type_map contents to
+	 *      the file.
+	 */
+	type_map_write(file);
+	type_map_free();
+}
-- 
2.46.0.792.g87dc391469-goog


