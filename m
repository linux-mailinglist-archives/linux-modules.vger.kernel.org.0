Return-Path: <linux-modules+bounces-2924-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 663FCA00F06
	for <lists+linux-modules@lfdr.de>; Fri,  3 Jan 2025 21:47:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 183FE164657
	for <lists+linux-modules@lfdr.de>; Fri,  3 Jan 2025 20:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B811F1CEAC2;
	Fri,  3 Jan 2025 20:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I7elvJyu"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DE61BD9D0
	for <linux-modules@vger.kernel.org>; Fri,  3 Jan 2025 20:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735937167; cv=none; b=S8k9yj/B+c34lJikHhR40yyj9AI/EY3/5gYnOitDyHFkefIY7OVdCEe0uMkuonlneXhoXrHhOrFgIzKYqkGgRFdOYRflGfIpdR6o21++B/eqzbe1kUIjrE4K/dNvLu/n5xa3qkavVVBZSx0uutrc/53SwpyewcHnu53K7hrH5cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735937167; c=relaxed/simple;
	bh=2I6+5mRVEzedj/9b4YFKht/No6clzeKuLkOFB8vBvoE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=J60g/InvKZGwLE3D3ZJrYIJRI4bk1Se1hgYdAnVeUu7CUtbQD0kWfJMNc75B1w8R5Zu9WRdTI8tNjQwb8lt37VzcfLn2QHr5DEslxJSu04o/+KD80RHmRx4CZYrluu860yAcQVHYy5FoUheWhrC3ujH1Ch8b/3SDmIGqY2O4VIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I7elvJyu; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ee6dccd3c9so17168157a91.3
        for <linux-modules@vger.kernel.org>; Fri, 03 Jan 2025 12:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735937153; x=1736541953; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jNqYHIW71u+6X/f8JmEopzkF7E1emF5oKVf/aI2D9uQ=;
        b=I7elvJyuwJ3f0/aGZiYx2Hmux+HjrJ0hyGSK5bicdju3EQHQTl/TAJwy3Gph541JOE
         k+KIP7LajvnhIHDo9ojXlNyhbzb2rNABLCzOk/6ltSBFzgaZDElOy0u2fO9v7Zwo2UcJ
         RrZ3jJkblUSYC8WYXEmrqoOcqeiW6gO6lZeK5q2btZw/F63IbOzItWCU7QzgjrRE/Dbx
         vXfkocTfHiJnmUk8e007E5834U/aBNKQ6wwZsLhOsehvy5XVvq7/xEyfxK8JUA0MBnEF
         AtQaE5L+T47W5mr8jAQ6M78gHRjipQs+eZtG4Z5YbmZ7oMNm4kK3U+g1XYkTMyGWQ3t2
         t9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735937153; x=1736541953;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jNqYHIW71u+6X/f8JmEopzkF7E1emF5oKVf/aI2D9uQ=;
        b=m2IBpwbhy8bUb/s4GiX8Qnt0tEHL8Hs7dHY7+KiwQUToqSzMI0LVYOd217OxW4gKoa
         E40/YLavXYcPh+7joCxidYBT6yzTCH3HTEqsomGNnrngOUu618z4fP5imQRSxNElls2T
         srGoFc0sIH/aE29NV2StnUJmUwiKIXxsm+oLHxI7IjGg3v4aBKAHE73FBzChJvFiY41+
         tZ+hdfgLv4Pq6F+/Pl7YI+QU5XIl0TxCr5bs8J8EzFoo0+se/XxdmUs/eiWDfO3ZVaAc
         TTIPeDMx4+lz3L7e0R0cnk3MlEWPYu8uAjbgDJNtcI/BdABb6y9/ARvoPwBglbhP0FgM
         /BFg==
X-Forwarded-Encrypted: i=1; AJvYcCUxehIC6l604Q94M5jdpeFhr8nkUzFO6xULI26rXeQUz9ZVeIef9QRY4nFv709s/LDm3AgZqb/swMt+8lOC@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ2BHblFCPW237uBV2blredNjiFbSPDiax6DGRw9UrUR6rkMl9
	yOuXv8hD23BNFKLquwA/UVXAXR0U/0aqQstSAN4MLvKW6Q0QkzTTR4X7MqhPXmrXN5Onak29jZ0
	jjfmL96N7POVn/1w28bQWFgSwJQ==
X-Google-Smtp-Source: AGHT+IGmLxBetaEDDRNB9ZIAmXbfVRra/1Gai3e1DX73ekAIbmb/DWcI6WN3SQ5GB/LUrutwOvxpOvkIjkr2Sae+Iv8=
X-Received: from pfbct11.prod.google.com ([2002:a05:6a00:f8b:b0:725:ceac:b484])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:35ca:b0:724:f86e:e3d9 with SMTP id d2e1a72fcca58-72abdecbdb4mr68020791b3a.14.1735937153616;
 Fri, 03 Jan 2025 12:45:53 -0800 (PST)
Date: Fri,  3 Jan 2025 20:45:34 +0000
In-Reply-To: <20250103204521.1885406-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250103204521.1885406-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=12907; i=samitolvanen@google.com;
 h=from:subject; bh=2I6+5mRVEzedj/9b4YFKht/No6clzeKuLkOFB8vBvoE=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOkVPulyH688n+a2UefoevtrQue+NujriIgf+tu+aW5Mz
 EyL0+JKHaUsDGIcDLJiiiwtX1dv3f3dKfXV5yIJmDmsTCBDGLg4BWAik5wY/ul/uDb3zJf3C/ZK
 GC/mvVv1flNhZ53+k5M+drGvfQpkbrow/OGrrX9TvJHH+rTpzjWeVwSudcw54uOkMXNa58b+1FL jQ2wA
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250103204521.1885406-32-samitolvanen@google.com>
Subject: [PATCH v8 12/18] gendwarfksyms: Add symbol versioning
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>, 
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Calculate symbol versions from the fully expanded type strings in
type_map, and output the versions in a genksyms-compatible format.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 scripts/gendwarfksyms/Makefile        |   2 +-
 scripts/gendwarfksyms/dwarf.c         |  25 +++++-
 scripts/gendwarfksyms/gendwarfksyms.c |  10 ++-
 scripts/gendwarfksyms/gendwarfksyms.h |  13 ++-
 scripts/gendwarfksyms/symbols.c       |  53 +++++++++++
 scripts/gendwarfksyms/types.c         | 122 +++++++++++++++++++++++++-
 6 files changed, 216 insertions(+), 9 deletions(-)

diff --git a/scripts/gendwarfksyms/Makefile b/scripts/gendwarfksyms/Makefile
index 6540282dc746..e889b958957b 100644
--- a/scripts/gendwarfksyms/Makefile
+++ b/scripts/gendwarfksyms/Makefile
@@ -8,4 +8,4 @@ gendwarfksyms-objs += dwarf.o
 gendwarfksyms-objs += symbols.o
 gendwarfksyms-objs += types.o
 
-HOSTLDLIBS_gendwarfksyms := -ldw -lelf
+HOSTLDLIBS_gendwarfksyms := -ldw -lelf -lz
diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index a9966a23167a..bdf899d60707 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -740,12 +740,33 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 /*
  * Exported symbol processing
  */
+static struct die *get_symbol_cache(struct state *state, Dwarf_Die *die)
+{
+	struct die *cache;
+
+	cache = die_map_get(die, DIE_SYMBOL);
+
+	if (cache->state != DIE_INCOMPLETE)
+		return NULL; /* We already processed a symbol for this DIE */
+
+	cache->tag = dwarf_tag(die);
+	return cache;
+}
+
 static void process_symbol(struct state *state, Dwarf_Die *die,
 			   die_callback_t process_func)
 {
+	struct die *cache;
+
+	symbol_set_die(state->sym, die);
+
+	cache = get_symbol_cache(state, die);
+	if (!cache)
+		return;
+
 	debug("%s", state->sym->name);
-	check(process_func(state, NULL, die));
-	state->sym->state = SYMBOL_MAPPED;
+	check(process_func(state, cache, die));
+	cache->state = DIE_SYMBOL;
 	if (dump_dies)
 		fputs("\n", stderr);
 }
diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksyms/gendwarfksyms.c
index 1d30f42cbd14..b0e13c37c6c2 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.c
+++ b/scripts/gendwarfksyms/gendwarfksyms.c
@@ -23,6 +23,8 @@ int dump_dies;
 int dump_die_map;
 /* Print out type strings (i.e. type_map) */
 int dump_types;
+/* Print out expanded type strings used for symbol versions */
+int dump_versions;
 /* Write a symtypes file */
 int symtypes;
 static const char *symtypes_file;
@@ -35,6 +37,7 @@ static void usage(void)
 	      "      --dump-dies      Dump DWARF DIE contents\n"
 	      "      --dump-die-map   Print debugging information about die_map changes\n"
 	      "      --dump-types     Dump type strings\n"
+	      "      --dump-versions  Dump expanded type strings used for symbol versions\n"
 	      "  -T, --symtypes file  Write a symtypes file\n"
 	      "  -h, --help           Print this message\n"
 	      "\n",
@@ -69,9 +72,10 @@ static int process_module(Dwfl_Module *mod, void **userdata, const char *name,
 	} while (cu);
 
 	/*
-	 * Use die_map to expand type strings and write them to `symfile`.
+	 * Use die_map to expand type strings, write them to `symfile`, and
+	 * calculate symbol versions.
 	 */
-	generate_symtypes(symfile);
+	generate_symtypes_and_versions(symfile);
 	die_map_free();
 
 	return DWARF_CB_OK;
@@ -93,6 +97,7 @@ int main(int argc, char **argv)
 		{ "dump-dies", 0, &dump_dies, 1 },
 		{ "dump-die-map", 0, &dump_die_map, 1 },
 		{ "dump-types", 0, &dump_types, 1 },
+		{ "dump-versions", 0, &dump_versions, 1 },
 		{ "symtypes", 1, NULL, 'T' },
 		{ "help", 0, NULL, 'h' },
 		{ 0, 0, NULL, 0 }
@@ -166,6 +171,7 @@ int main(int argc, char **argv)
 	if (symfile)
 		check(fclose(symfile));
 
+	symbol_print_versions();
 	symbol_free();
 
 	return 0;
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index 98d5b2315f21..203534abcd35 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -23,6 +23,7 @@ extern int debug;
 extern int dump_dies;
 extern int dump_die_map;
 extern int dump_types;
+extern int dump_versions;
 extern int symtypes;
 
 /*
@@ -95,6 +96,7 @@ static inline unsigned int addr_hash(uintptr_t addr)
 enum symbol_state {
 	SYMBOL_UNPROCESSED,
 	SYMBOL_MAPPED,
+	SYMBOL_PROCESSED
 };
 
 struct symbol_addr {
@@ -109,6 +111,7 @@ struct symbol {
 	struct hlist_node name_hash;
 	enum symbol_state state;
 	uintptr_t die_addr;
+	unsigned long crc;
 };
 
 typedef void (*symbol_callback_t)(struct symbol *, void *arg);
@@ -116,6 +119,10 @@ typedef void (*symbol_callback_t)(struct symbol *, void *arg);
 void symbol_read_exports(FILE *file);
 void symbol_read_symtab(int fd);
 struct symbol *symbol_get(const char *name);
+void symbol_set_die(struct symbol *sym, Dwarf_Die *die);
+void symbol_set_crc(struct symbol *sym, unsigned long crc);
+void symbol_for_each(symbol_callback_t func, void *arg);
+void symbol_print_versions(void);
 void symbol_free(void);
 
 /*
@@ -126,7 +133,8 @@ enum die_state {
 	DIE_INCOMPLETE,
 	DIE_UNEXPANDED,
 	DIE_COMPLETE,
-	DIE_LAST = DIE_COMPLETE
+	DIE_SYMBOL,
+	DIE_LAST = DIE_SYMBOL
 };
 
 enum die_fragment_type {
@@ -156,6 +164,7 @@ static inline const char *die_state_name(enum die_state state)
 	CASE_CONST_TO_STR(DIE_INCOMPLETE)
 	CASE_CONST_TO_STR(DIE_UNEXPANDED)
 	CASE_CONST_TO_STR(DIE_COMPLETE)
+	CASE_CONST_TO_STR(DIE_SYMBOL)
 	}
 
 	error("unexpected die_state: %d", state);
@@ -252,6 +261,6 @@ void process_cu(Dwarf_Die *cudie);
  * types.c
  */
 
-void generate_symtypes(FILE *file);
+void generate_symtypes_and_versions(FILE *file);
 
 #endif /* __GENDWARFKSYMS_H */
diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symbols.c
index 0d2ce7284a53..4c499ba6c86d 100644
--- a/scripts/gendwarfksyms/symbols.c
+++ b/scripts/gendwarfksyms/symbols.c
@@ -66,6 +66,36 @@ static unsigned int for_each(const char *name, symbol_callback_t func,
 	return 0;
 }
 
+static void set_crc(struct symbol *sym, void *data)
+{
+	unsigned long *crc = data;
+
+	if (sym->state == SYMBOL_PROCESSED && sym->crc != *crc)
+		warn("overriding version for symbol %s (crc %lx vs. %lx)",
+		     sym->name, sym->crc, *crc);
+
+	sym->state = SYMBOL_PROCESSED;
+	sym->crc = *crc;
+}
+
+void symbol_set_crc(struct symbol *sym, unsigned long crc)
+{
+	if (for_each(sym->name, set_crc, &crc) == 0)
+		error("no matching symbols: '%s'", sym->name);
+}
+
+static void set_die(struct symbol *sym, void *data)
+{
+	sym->die_addr = (uintptr_t)((Dwarf_Die *)data)->addr;
+	sym->state = SYMBOL_MAPPED;
+}
+
+void symbol_set_die(struct symbol *sym, Dwarf_Die *die)
+{
+	if (for_each(sym->name, set_die, die) == 0)
+		error("no matching symbols: '%s'", sym->name);
+}
+
 static bool is_exported(const char *name)
 {
 	return for_each(name, NULL, NULL) > 0;
@@ -120,6 +150,16 @@ struct symbol *symbol_get(const char *name)
 	return sym;
 }
 
+void symbol_for_each(symbol_callback_t func, void *arg)
+{
+	struct hlist_node *tmp;
+	struct symbol *sym;
+
+	hash_for_each_safe(symbol_names, sym, tmp, name_hash) {
+		func(sym, arg);
+	}
+}
+
 typedef void (*elf_symbol_callback_t)(const char *name, GElf_Sym *sym,
 				      Elf32_Word xndx, void *arg);
 
@@ -246,6 +286,19 @@ void symbol_read_symtab(int fd)
 	elf_for_each_global(fd, elf_set_symbol_addr, NULL);
 }
 
+void symbol_print_versions(void)
+{
+	struct hlist_node *tmp;
+	struct symbol *sym;
+
+	hash_for_each_safe(symbol_names, sym, tmp, name_hash) {
+		if (sym->state != SYMBOL_PROCESSED)
+			warn("no information for symbol %s", sym->name);
+
+		printf("#SYMVER %s 0x%08lx\n", sym->name, sym->crc);
+	}
+}
+
 void symbol_free(void)
 {
 	struct hlist_node *tmp;
diff --git a/scripts/gendwarfksyms/types.c b/scripts/gendwarfksyms/types.c
index 21d7a34228eb..6c03265f4d10 100644
--- a/scripts/gendwarfksyms/types.c
+++ b/scripts/gendwarfksyms/types.c
@@ -6,6 +6,7 @@
 #define _GNU_SOURCE
 #include <inttypes.h>
 #include <stdio.h>
+#include <zlib.h>
 
 #include "gendwarfksyms.h"
 
@@ -178,6 +179,33 @@ static void type_map_free(void)
 	hash_init(type_map);
 }
 
+/*
+ * CRC for a type, with an optional fully expanded type string for
+ * debugging.
+ */
+struct version {
+	struct type_expansion type;
+	unsigned long crc;
+};
+
+static void version_init(struct version *version)
+{
+	version->crc = crc32(0, NULL, 0);
+	type_expansion_init(&version->type);
+}
+
+static void version_free(struct version *version)
+{
+	type_expansion_free(&version->type);
+}
+
+static void version_add(struct version *version, const char *s)
+{
+	version->crc = crc32(version->crc, (void *)s, strlen(s));
+	if (dump_versions)
+		type_expansion_append(&version->type, s, NULL);
+}
+
 /*
  * Type reference format: <prefix>#<name>, where prefix:
  * 	s -> structure
@@ -187,6 +215,12 @@ static void type_map_free(void)
  *
  * Names with spaces are additionally wrapped in single quotes.
  */
+static inline bool is_type_prefix(const char *s)
+{
+	return (s[0] == 's' || s[0] == 'u' || s[0] == 'e' || s[0] == 't') &&
+	       s[1] == '#';
+}
+
 static char get_type_prefix(int tag)
 {
 	switch (tag) {
@@ -214,6 +248,8 @@ static char *get_type_name(struct die *cache)
 		warn("found incomplete cache entry: %p", cache);
 		return NULL;
 	}
+	if (cache->state == DIE_SYMBOL)
+		return NULL;
 	if (!cache->fqn || !*cache->fqn)
 		return NULL;
 
@@ -231,6 +267,39 @@ static char *get_type_name(struct die *cache)
 	return name;
 }
 
+static void __calculate_version(struct version *version, struct list_head *list)
+{
+	struct type_list_entry *entry;
+	struct type_expansion *e;
+
+	/* Calculate a CRC over an expanded type string */
+	list_for_each_entry(entry, list, list) {
+		if (is_type_prefix(entry->str)) {
+			check(type_map_get(entry->str, &e));
+
+			/*
+			 * It's sufficient to expand each type reference just
+			 * once to detect changes.
+			 */
+			if (cache_was_expanded(&expansion_cache, e)) {
+				version_add(version, entry->str);
+			} else {
+				cache_mark_expanded(&expansion_cache, e);
+				__calculate_version(version, &e->expanded);
+			}
+		} else {
+			version_add(version, entry->str);
+		}
+	}
+}
+
+static void calculate_version(struct version *version, struct list_head *list)
+{
+	version_init(version);
+	__calculate_version(version, list);
+	cache_free(&expansion_cache);
+}
+
 static void __type_expand(struct die *cache, struct type_expansion *type,
 			  bool recursive);
 
@@ -337,7 +406,49 @@ static void expand_type(struct die *cache, void *arg)
 	free(name);
 }
 
-void generate_symtypes(FILE *file)
+static void expand_symbol(struct symbol *sym, void *arg)
+{
+	struct type_expansion type;
+	struct version version;
+	struct die *cache;
+
+	/*
+	 * No need to expand again unless we want a symtypes file entry
+	 * for the symbol. Note that this means `sym` has the same address
+	 * as another symbol that was already processed.
+	 */
+	if (!symtypes && sym->state == SYMBOL_PROCESSED)
+		return;
+
+	if (__die_map_get(sym->die_addr, DIE_SYMBOL, &cache))
+		return; /* We'll warn about missing CRCs later. */
+
+	type_expand(cache, &type, false);
+
+	/* If the symbol already has a version, don't calculate it again. */
+	if (sym->state != SYMBOL_PROCESSED) {
+		calculate_version(&version, &type.expanded);
+		symbol_set_crc(sym, version.crc);
+		debug("%s = %lx", sym->name, version.crc);
+
+		if (dump_versions) {
+			checkp(fputs(sym->name, stderr));
+			checkp(fputs(" ", stderr));
+			type_list_write(&version.type.expanded, stderr);
+			checkp(fputs("\n", stderr));
+		}
+
+		version_free(&version);
+	}
+
+	/* These aren't needed in type_map unless we want a symtypes file. */
+	if (symtypes)
+		type_map_add(sym->name, &type);
+
+	type_expansion_free(&type);
+}
+
+void generate_symtypes_and_versions(FILE *file)
 {
 	cache_init(&expansion_cache);
 
@@ -355,7 +466,14 @@ void generate_symtypes(FILE *file)
 	die_map_for_each(expand_type, NULL);
 
 	/*
-	 *   2. If a symtypes file is requested, write type_map contents to
+	 *   2. For each exported symbol, expand the die_map type, and use
+	 *      type_map expansions to calculate a symbol version from the
+	 *      fully expanded type string.
+	 */
+	symbol_for_each(expand_symbol, NULL);
+
+	/*
+	 *   3. If a symtypes file is requested, write type_map contents to
 	 *      the file.
 	 */
 	type_map_write(file);
-- 
2.47.1.613.gc27f4b7a9f-goog


