Return-Path: <linux-modules+bounces-2787-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA179F86A5
	for <lists+linux-modules@lfdr.de>; Thu, 19 Dec 2024 22:12:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62EE11894F4C
	for <lists+linux-modules@lfdr.de>; Thu, 19 Dec 2024 21:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0AEB1FF1BF;
	Thu, 19 Dec 2024 21:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x/eb9/Il"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F34F1C305A
	for <linux-modules@vger.kernel.org>; Thu, 19 Dec 2024 21:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734642494; cv=none; b=suaBuxNDKYqSbymaGBLo/+a45MKu/jfGbZN0nRcri+7cUzgwvwnkl0NOuk/D1kiUPT6qAaUiNvJQgC90mNcpm62VJ5SZUISrLw+5XZBglUsWSxDRb6vNwJ59pbOUvyTykOd+PF85yfYeszl3g0tZvLtUMA7UTj1GCJYn85TR1RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734642494; c=relaxed/simple;
	bh=jDQKbg/it2lSQcMa4QhFOxem892cYQdK5o/DJi06Ji8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=F+2WlMQ/1AyX6TZJUg0aT/UIGZEfjX87FVTo1CyiATT+MwYgVbxa8ls8BtZXh+SGc2aSetRvMZKHoX4z2zo1CK8y0Pl1z1I0yb5cGWta4/BO8b7mKNuw6elwXRmJ0OPjESpYk45C+HhN/6Wy9IYI/n4VXvsaAfP2G9VczuS9jZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x/eb9/Il; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-725e3c6ad0dso1697251b3a.0
        for <linux-modules@vger.kernel.org>; Thu, 19 Dec 2024 13:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734642491; x=1735247291; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hdbZ+f1RHV1+aLyJkFOTreqSjkO/ig/SI3dMZwuF37I=;
        b=x/eb9/Il+kZrUaJ6exslF4x1/zIOFf/nIWoDRygIzDXuWBsyESTorwhwqDEaWoC3Y5
         O2nWSLNd4kPMIIqgq5pevWIyDUy8sNM7MezZ87xJ+XzJ4Dp3EUYpbWkNwu9p66CDctNJ
         8xEeE52DPf1TrOLhDMJCxlq7kUDNfRgoT/GFilp0IhxglWHr10ZzZEaX6kIVxbBggV5v
         WQyrZZRdehW/hj55E+OtEAJ6ukSctaee1wVP9gE8XiYtBa8PzKF7tV46fxRyfoHf2+OR
         bl/zMdpMS2TFAPpRemoiVV9ub5RzZOycRfkEBjxH0scuBIX400V05yUWQlB1d0RCzM+o
         BYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734642491; x=1735247291;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hdbZ+f1RHV1+aLyJkFOTreqSjkO/ig/SI3dMZwuF37I=;
        b=OETDLVMQpb6tJZHnYZiS/ASphejwsq58E2AOm7qwNTg++8025SMLVOPCBh/dfuSVW2
         XLZIkLrRSTJ1ghJrqLWl4B2SX/5IU1AGpTn1LMKZE965W8aKNqnd7YJAE2oqnBvaOhhh
         VtWpAHogOjHKkPeuy/WvXtACMqOEVrPyk/11dZIdMlPLc6MichXsnURYpNfMpzYpZKyD
         Iq6gXTL31BzHUsUuVL3FJwEIrrlHshgT6xqMWV34d9NQooCcVOBIgiqj0w8it39dUsS8
         mQ9gKqg0ifzbp7g3KK2C0xE720jAT2yUq0vl8OGNtgZsg1EO/mSJRMTtRMN6TxIsEn9j
         4/QA==
X-Forwarded-Encrypted: i=1; AJvYcCURgNpZh3KD11WqOjrbq860btYKbdM5+fPto1yNvxIjSnwbUU8juqaVneSgiQPiiy1l+zE77S6L6H9KSkRX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9LwyLWw/xryYwJPXS7HtHnpZQA1CUAUIf0pakokbA41DB1F7t
	fXkl4lP1T/q3s3xaXp9QFCmQB2Blo+Olge8N3+C5cqqABzbUqh8IJO5gdnHefHY+QerMD+hjAip
	eE1vM4OmL6Jy6vivE0GzrXNHdzw==
X-Google-Smtp-Source: AGHT+IEpxOiXRbDsTIVUOc26aPjRm985EW4mAOJN0rz4IQnn1aKdvOv6myjiU0nT+mg/1zDjiQ74cx/rc1xH2MRs9YA=
X-Received: from pfxa2.prod.google.com ([2002:a05:6a00:1d02:b0:725:eb13:8be8])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1144:b0:72a:8b8f:a0f1 with SMTP id d2e1a72fcca58-72abde8462dmr270764b3a.20.1734642491336;
 Thu, 19 Dec 2024 13:08:11 -0800 (PST)
Date: Thu, 19 Dec 2024 21:07:50 +0000
In-Reply-To: <20241219210736.2990838-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241219210736.2990838-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=21354; i=samitolvanen@google.com;
 h=from:subject; bh=jDQKbg/it2lSQcMa4QhFOxem892cYQdK5o/DJi06Ji8=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOkp3fKJ3u7+ev8FPkjFLq2KTEyvXXw0Nkn+xJcX3x0S1
 c8/X/aso5SFQYyDQVZMkaXl6+qtu787pb76XCQBM4eVCWQIAxenAExk6QGGf5bxVR5LokqVPhss
 2Ng5ha2IYfb8H7EZZ+/ZCq9cv1ng/S1GhsY7P3wUPBcwPZHuev3lQ3uejFew457EuVoeGl3r25s v8AIA
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241219210736.2990838-33-samitolvanen@google.com>
Subject: [PATCH v7 13/18] gendwarfksyms: Add support for kABI rules
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

Distributions that want to maintain a stable kABI need the ability
to make ABI compatible changes to kernel without affecting symbol
versions, either because of LTS updates or backports.

With genksyms, developers would typically hide these changes from
version calculation with #ifndef __GENKSYMS__, which would result
in the symbol version not changing even though the actual type has
changed.  When we process precompiled object files, this isn't an
option.

To support this use case, add a --stable command line flag that
gates kABI stability features that are not needed in mainline
kernels, but can be useful for distributions, and add support for
kABI rules, which can be used to restrict gendwarfksyms output.

The rules are specified as a set of null-terminated strings stored
in the .discard.gendwarfksyms.kabi_rules section. Each rule consists
of four strings as follows:

  "version\0type\0target\0value"

The version string ensures the structure can be changed in a
backwards compatible way. The type string indicates the type of the
rule, and target and value strings contain rule-specific data.

Initially support two simple rules:

  1. Declaration-only types

     A type declaration can change into a full definition when
     additional includes are pulled in to the TU, which changes the
     versions of any symbol that references the type. Add support
     for defining declaration-only types whose definition is not
     expanded during versioning.

  2. Ignored enumerators

     It's possible to add new enum fields without changing the ABI,
     but as the fields are included in symbol versioning, this would
     change the versions. Add support for ignoring specific fields.

  3. Overridden enumerator values

     Add support for overriding enumerator values when calculating
     versions. This may be needed when the last field of the enum
     is used as a sentinel and new fields must be added before it.

Add examples for using the rules under the examples/ directory.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/gendwarfksyms/Makefile           |   1 +
 scripts/gendwarfksyms/dwarf.c            |  25 +-
 scripts/gendwarfksyms/examples/kabi.h    |  70 +++++
 scripts/gendwarfksyms/examples/kabi_ex.c |  14 +
 scripts/gendwarfksyms/examples/kabi_ex.h |  64 +++++
 scripts/gendwarfksyms/gendwarfksyms.c    |  11 +-
 scripts/gendwarfksyms/gendwarfksyms.h    |  14 +
 scripts/gendwarfksyms/kabi.c             | 336 +++++++++++++++++++++++
 8 files changed, 531 insertions(+), 4 deletions(-)
 create mode 100644 scripts/gendwarfksyms/examples/kabi.h
 create mode 100644 scripts/gendwarfksyms/examples/kabi_ex.c
 create mode 100644 scripts/gendwarfksyms/examples/kabi_ex.h
 create mode 100644 scripts/gendwarfksyms/kabi.c

diff --git a/scripts/gendwarfksyms/Makefile b/scripts/gendwarfksyms/Makefile
index e889b958957b..6334c7d3c4d5 100644
--- a/scripts/gendwarfksyms/Makefile
+++ b/scripts/gendwarfksyms/Makefile
@@ -5,6 +5,7 @@ gendwarfksyms-objs += gendwarfksyms.o
 gendwarfksyms-objs += cache.o
 gendwarfksyms-objs += die.o
 gendwarfksyms-objs += dwarf.o
+gendwarfksyms-objs += kabi.o
 gendwarfksyms-objs += symbols.o
 gendwarfksyms-objs += types.o
 
diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index bdf899d60707..17f7e6b9a7ff 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -120,13 +120,16 @@ static bool is_definition_private(Dwarf_Die *die)
 	return !!res;
 }
 
-static bool is_kabi_definition(Dwarf_Die *die)
+static bool is_kabi_definition(struct die *cache, Dwarf_Die *die)
 {
 	bool value;
 
 	if (get_flag_attr(die, DW_AT_declaration, &value) && value)
 		return false;
 
+	if (kabi_is_declonly(cache->fqn))
+		return false;
+
 	return !is_definition_private(die);
 }
 
@@ -515,9 +518,10 @@ static void __process_structure_type(struct state *state, struct die *cache,
 	process(cache, " {");
 	process_linebreak(cache, 1);
 
-	expand = state->expand.expand && is_kabi_definition(die);
+	expand = state->expand.expand && is_kabi_definition(cache, die);
 
 	if (expand) {
+		state->expand.current_fqn = cache->fqn;
 		check(process_die_container(state, cache, die, process_func,
 					    match_func));
 	}
@@ -548,13 +552,26 @@ DEFINE_PROCESS_STRUCTURE_TYPE(union)
 static void process_enumerator_type(struct state *state, struct die *cache,
 				    Dwarf_Die *die)
 {
+	bool overridden = false;
 	Dwarf_Word value;
 
+	if (stable) {
+		/* Get the fqn before we process anything */
+		update_fqn(cache, die);
+
+		if (kabi_is_enumerator_ignored(state->expand.current_fqn,
+					       cache->fqn))
+			return;
+
+		overridden = kabi_get_enumerator_value(
+			state->expand.current_fqn, cache->fqn, &value);
+	}
+
 	process_list_comma(state, cache);
 	process(cache, "enumerator");
 	process_fqn(cache, die);
 
-	if (get_udata_attr(die, DW_AT_const_value, &value)) {
+	if (overridden || get_udata_attr(die, DW_AT_const_value, &value)) {
 		process(cache, " = ");
 		process_fmt(cache, "%" PRIu64, value);
 	}
@@ -620,6 +637,7 @@ static void process_cached(struct state *state, struct die *cache,
 static void state_init(struct state *state)
 {
 	state->expand.expand = true;
+	state->expand.current_fqn = NULL;
 	cache_init(&state->expansion_cache);
 }
 
@@ -627,6 +645,7 @@ static void expansion_state_restore(struct expansion_state *state,
 				    struct expansion_state *saved)
 {
 	state->expand = saved->expand;
+	state->current_fqn = saved->current_fqn;
 }
 
 static void expansion_state_save(struct expansion_state *state,
diff --git a/scripts/gendwarfksyms/examples/kabi.h b/scripts/gendwarfksyms/examples/kabi.h
new file mode 100644
index 000000000000..fcd0300e5b58
--- /dev/null
+++ b/scripts/gendwarfksyms/examples/kabi.h
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2024 Google LLC
+ *
+ * Example macros for maintaining kABI stability.
+ *
+ * This file is based on android_kabi.h, which has the following notice:
+ *
+ * Heavily influenced by rh_kabi.h which came from the RHEL/CENTOS kernel
+ * and was:
+ *	Copyright (c) 2014 Don Zickus
+ *	Copyright (c) 2015-2018 Jiri Benc
+ *	Copyright (c) 2015 Sabrina Dubroca, Hannes Frederic Sowa
+ *	Copyright (c) 2016-2018 Prarit Bhargava
+ *	Copyright (c) 2017 Paolo Abeni, Larry Woodman
+ */
+
+#ifndef __KABI_H__
+#define __KABI_H__
+
+/* Kernel macros for userspace testing. */
+#ifndef __aligned
+#define __aligned(x) __attribute__((__aligned__(x)))
+#endif
+#ifndef __used
+#define __used __attribute__((__used__))
+#endif
+#ifndef __section
+#define __section(section) __attribute__((__section__(section)))
+#endif
+#ifndef __PASTE
+#define ___PASTE(a, b) a##b
+#define __PASTE(a, b) ___PASTE(a, b)
+#endif
+#ifndef __stringify
+#define __stringify_1(x...) #x
+#define __stringify(x...) __stringify_1(x)
+#endif
+
+#define __KABI_RULE(hint, target, value)                             \
+	static const char __PASTE(__gendwarfksyms_rule_,             \
+				  __COUNTER__)[] __used __aligned(1) \
+		__section(".discard.gendwarfksyms.kabi_rules") =     \
+			"1\0" #hint "\0" #target "\0" #value
+
+/*
+ * KABI_DECLONLY(fqn)
+ *   Treat the struct/union/enum fqn as a declaration, i.e. even if
+ *   a definition is available, don't expand the contents.
+ */
+#define KABI_DECLONLY(fqn) __KABI_RULE(declonly, fqn, )
+
+/*
+ * KABI_ENUMERATOR_IGNORE(fqn, field)
+ *   When expanding enum fqn, skip the provided field. This makes it
+ *   possible to hide added enum fields from versioning.
+ */
+#define KABI_ENUMERATOR_IGNORE(fqn, field) \
+	__KABI_RULE(enumerator_ignore, fqn field, )
+
+/*
+ * KABI_ENUMERATOR_VALUE(fqn, field, value)
+ *   When expanding enum fqn, use the provided value for the
+ *   specified field. This makes it possible to override enumerator
+ *   values when calculating versions.
+ */
+#define KABI_ENUMERATOR_VALUE(fqn, field, value) \
+	__KABI_RULE(enumerator_value, fqn field, value)
+
+#endif /* __KABI_H__ */
diff --git a/scripts/gendwarfksyms/examples/kabi_ex.c b/scripts/gendwarfksyms/examples/kabi_ex.c
new file mode 100644
index 000000000000..799552ea6679
--- /dev/null
+++ b/scripts/gendwarfksyms/examples/kabi_ex.c
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * kabi_ex.c
+ *
+ * Copyright (C) 2024 Google LLC
+ *
+ * Examples for kABI stability features with --stable. See kabi_ex.h
+ * for details.
+ */
+
+#include "kabi_ex.h"
+
+struct s e0;
+enum e e1;
diff --git a/scripts/gendwarfksyms/examples/kabi_ex.h b/scripts/gendwarfksyms/examples/kabi_ex.h
new file mode 100644
index 000000000000..fca1e07c78e2
--- /dev/null
+++ b/scripts/gendwarfksyms/examples/kabi_ex.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * kabi_ex.h
+ *
+ * Copyright (C) 2024 Google LLC
+ *
+ * Examples for kABI stability features with --stable.
+ */
+
+/*
+ * The comments below each example contain the expected gendwarfksyms
+ * output, which can be verified using LLVM's FileCheck tool:
+ *
+ * https://llvm.org/docs/CommandGuide/FileCheck.html
+ *
+ * Usage:
+ *
+ * $ gcc -g -c examples/kabi_ex.c -o examples/kabi_ex.o
+ *
+ * $ nm examples/kabi_ex.o | awk '{ print $NF }' | \
+ * 	./gendwarfksyms --stable --dump-dies \
+ * 		examples/kabi_ex.o 2>&1 >/dev/null | \
+ * 	FileCheck examples/kabi_ex.h --check-prefix=STABLE
+ */
+
+#ifndef __KABI_EX_H__
+#define __KABI_EX_H__
+
+#include "kabi.h"
+
+/*
+ * Example: kABI rules
+ */
+
+struct s {
+	int a;
+};
+
+KABI_DECLONLY(s);
+
+/*
+ * STABLE:      variable structure_type s {
+ * STABLE-NEXT: }
+ */
+
+enum e {
+	A,
+	B,
+	C,
+	D,
+};
+
+KABI_ENUMERATOR_IGNORE(e, B);
+KABI_ENUMERATOR_IGNORE(e, C);
+KABI_ENUMERATOR_VALUE(e, D, 123456789);
+
+/*
+ * STABLE:      variable enumeration_type e {
+ * STABLE-NEXT:   enumerator A = 0 ,
+ * STABLE-NEXT:   enumerator D = 123456789
+ * STABLE-NEXT: } byte_size(4)
+ */
+
+#endif /* __KABI_EX_H__ */
diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksyms/gendwarfksyms.c
index fd2429ea198f..25865d9eab56 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.c
+++ b/scripts/gendwarfksyms/gendwarfksyms.c
@@ -25,6 +25,8 @@ int dump_die_map;
 int dump_types;
 /* Print out expanded type strings used for symbol versions */
 int dump_versions;
+/* Support kABI stability features */
+int stable;
 /* Write a symtypes file */
 int symtypes;
 static const char *symtypes_file;
@@ -38,6 +40,7 @@ static void usage(void)
 	      "      --dump-die-map   Print debugging information about die_map changes\n"
 	      "      --dump-types     Dump type strings\n"
 	      "      --dump-versions  Dump expanded type strings used for symbol versions\n"
+	      "  -s, --stable         Support kABI stability features\n"
 	      "  -T, --symtypes file  Write a symtypes file\n"
 	      "  -h, --help           Print this message\n"
 	      "\n",
@@ -97,17 +100,21 @@ int main(int argc, char **argv)
 				 { "dump-die-map", 0, &dump_die_map, 1 },
 				 { "dump-types", 0, &dump_types, 1 },
 				 { "dump-versions", 0, &dump_versions, 1 },
+				 { "stable", 0, NULL, 's' },
 				 { "symtypes", 1, NULL, 'T' },
 				 { "help", 0, NULL, 'h' },
 				 { 0, 0, NULL, 0 } };
 
-	while ((opt = getopt_long(argc, argv, "dT:h", opts, NULL)) != EOF) {
+	while ((opt = getopt_long(argc, argv, "dsT:h", opts, NULL)) != EOF) {
 		switch (opt) {
 		case 0:
 			break;
 		case 'd':
 			debug = 1;
 			break;
+		case 's':
+			stable = 1;
+			break;
 		case 'T':
 			symtypes = 1;
 			symtypes_file = optarg;
@@ -148,6 +155,7 @@ int main(int argc, char **argv)
 			      strerror(errno));
 
 		symbol_read_symtab(fd);
+		kabi_read_rules(fd);
 
 		dwfl = dwfl_begin(&callbacks);
 		if (!dwfl)
@@ -164,6 +172,7 @@ int main(int argc, char **argv)
 			error("dwfl_getmodules failed for '%s'", argv[n]);
 
 		dwfl_end(dwfl);
+		kabi_free();
 	}
 
 	if (symfile)
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index 203534abcd35..c0207ca10e19 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -24,6 +24,7 @@ extern int dump_dies;
 extern int dump_die_map;
 extern int dump_types;
 extern int dump_versions;
+extern int stable;
 extern int symtypes;
 
 /*
@@ -232,6 +233,7 @@ static inline bool cache_was_expanded(struct cache *cache, void *addr)
 
 struct expansion_state {
 	bool expand;
+	const char *current_fqn;
 };
 
 struct state {
@@ -263,4 +265,16 @@ void process_cu(Dwarf_Die *cudie);
 
 void generate_symtypes_and_versions(FILE *file);
 
+/*
+ * kabi.c
+ */
+
+bool kabi_is_enumerator_ignored(const char *fqn, const char *field);
+bool kabi_get_enumerator_value(const char *fqn, const char *field,
+			       unsigned long *value);
+bool kabi_is_declonly(const char *fqn);
+
+void kabi_read_rules(int fd);
+void kabi_free(void);
+
 #endif /* __GENDWARFKSYMS_H */
diff --git a/scripts/gendwarfksyms/kabi.c b/scripts/gendwarfksyms/kabi.c
new file mode 100644
index 000000000000..66f01fcd1607
--- /dev/null
+++ b/scripts/gendwarfksyms/kabi.c
@@ -0,0 +1,336 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 Google LLC
+ */
+
+#define _GNU_SOURCE
+#include <errno.h>
+#include <stdio.h>
+
+#include "gendwarfksyms.h"
+
+#define KABI_RULE_SECTION ".discard.gendwarfksyms.kabi_rules"
+#define KABI_RULE_VERSION "1"
+
+/*
+ * The rule section consists of four null-terminated strings per
+ * entry:
+ *
+ *   1. version
+ *      Entry format version. Must match KABI_RULE_VERSION.
+ *
+ *   2. type
+ *      Type of the kABI rule. Must be one of the tags defined below.
+ *
+ *   3. target
+ *      Rule-dependent target, typically the fully qualified name of
+ *      the target DIE.
+ *
+ *   4. value
+ *      Rule-dependent value.
+ */
+#define KABI_RULE_MIN_ENTRY_SIZE                                  \
+	(/* version\0 */ 2 + /* type\0 */ 2 + /* target\0" */ 1 + \
+	 /* value\0 */ 1)
+#define KABI_RULE_EMPTY_VALUE ""
+
+/*
+ * Rule: declonly
+ * - For the struct/enum/union in the target field, treat it as a
+ *   declaration only even if a definition is available.
+ */
+#define KABI_RULE_TAG_DECLONLY "declonly"
+
+/*
+ * Rule: enumerator_ignore
+ * - For the enum_field in the target field, ignore the enumerator.
+ */
+#define KABI_RULE_TAG_ENUMERATOR_IGNORE "enumerator_ignore"
+
+/*
+ * Rule: enumerator_value
+ * - For the fqn_field in the target field, set the value to the
+ *   unsigned integer in the value field.
+ */
+#define KABI_RULE_TAG_ENUMERATOR_VALUE "enumerator_value"
+
+enum kabi_rule_type {
+	KABI_RULE_TYPE_UNKNOWN,
+	KABI_RULE_TYPE_DECLONLY,
+	KABI_RULE_TYPE_ENUMERATOR_IGNORE,
+	KABI_RULE_TYPE_ENUMERATOR_VALUE,
+};
+
+#define RULE_HASH_BITS 7
+
+struct rule {
+	enum kabi_rule_type type;
+	const char *target;
+	const char *value;
+	struct hlist_node hash;
+};
+
+/* { type, target } -> struct rule */
+static HASHTABLE_DEFINE(rules, 1 << RULE_HASH_BITS);
+
+static inline unsigned int rule_values_hash(enum kabi_rule_type type,
+					    const char *target)
+{
+	return hash_32(type) ^ hash_str(target);
+}
+
+static inline unsigned int rule_hash(const struct rule *rule)
+{
+	return rule_values_hash(rule->type, rule->target);
+}
+
+static inline const char *get_rule_field(const char **pos, ssize_t *left)
+{
+	const char *start = *pos;
+	size_t len;
+
+	if (*left <= 0)
+		error("unexpected end of kABI rules");
+
+	len = strnlen(start, *left) + 1;
+	*pos += len;
+	*left -= len;
+
+	return start;
+}
+
+void kabi_read_rules(int fd)
+{
+	GElf_Shdr shdr_mem;
+	GElf_Shdr *shdr;
+	Elf_Data *rule_data = NULL;
+	Elf_Scn *scn;
+	Elf *elf;
+	size_t shstrndx;
+	const char *rule_str;
+	ssize_t left;
+	int i;
+
+	const struct {
+		enum kabi_rule_type type;
+		const char *tag;
+	} rule_types[] = {
+		{
+			.type = KABI_RULE_TYPE_DECLONLY,
+			.tag = KABI_RULE_TAG_DECLONLY,
+		},
+		{
+			.type = KABI_RULE_TYPE_ENUMERATOR_IGNORE,
+			.tag = KABI_RULE_TAG_ENUMERATOR_IGNORE,
+		},
+		{
+			.type = KABI_RULE_TYPE_ENUMERATOR_VALUE,
+			.tag = KABI_RULE_TAG_ENUMERATOR_VALUE,
+		},
+	};
+
+	if (!stable)
+		return;
+
+	if (elf_version(EV_CURRENT) != EV_CURRENT)
+		error("elf_version failed: %s", elf_errmsg(-1));
+
+	elf = elf_begin(fd, ELF_C_READ_MMAP, NULL);
+	if (!elf)
+		error("elf_begin failed: %s", elf_errmsg(-1));
+
+	if (elf_getshdrstrndx(elf, &shstrndx) < 0)
+		error("elf_getshdrstrndx failed: %s", elf_errmsg(-1));
+
+	scn = elf_nextscn(elf, NULL);
+
+	while (scn) {
+		const char *sname;
+
+		shdr = gelf_getshdr(scn, &shdr_mem);
+		if (!shdr)
+			error("gelf_getshdr failed: %s", elf_errmsg(-1));
+
+		sname = elf_strptr(elf, shstrndx, shdr->sh_name);
+		if (!sname)
+			error("elf_strptr failed: %s", elf_errmsg(-1));
+
+		if (!strcmp(sname, KABI_RULE_SECTION)) {
+			rule_data = elf_getdata(scn, NULL);
+			if (!rule_data)
+				error("elf_getdata failed: %s", elf_errmsg(-1));
+			break;
+		}
+
+		scn = elf_nextscn(elf, scn);
+	}
+
+	if (!rule_data) {
+		debug("kABI rules not found");
+		check(elf_end(elf));
+		return;
+	}
+
+	rule_str = rule_data->d_buf;
+	left = shdr->sh_size;
+
+	if (left < KABI_RULE_MIN_ENTRY_SIZE)
+		error("kABI rule section too small: %zd bytes", left);
+
+	if (rule_str[left - 1] != '\0')
+		error("kABI rules are not null-terminated");
+
+	while (left > KABI_RULE_MIN_ENTRY_SIZE) {
+		enum kabi_rule_type type = KABI_RULE_TYPE_UNKNOWN;
+		const char *field;
+		struct rule *rule;
+
+		/* version */
+		field = get_rule_field(&rule_str, &left);
+
+		if (strcmp(field, KABI_RULE_VERSION))
+			error("unsupported kABI rule version: '%s'", field);
+
+		/* type */
+		field = get_rule_field(&rule_str, &left);
+
+		for (i = 0; i < ARRAY_SIZE(rule_types); i++) {
+			if (!strcmp(field, rule_types[i].tag)) {
+				type = rule_types[i].type;
+				break;
+			}
+		}
+
+		if (type == KABI_RULE_TYPE_UNKNOWN)
+			error("unsupported kABI rule type: '%s'", field);
+
+		rule = xmalloc(sizeof(struct rule));
+
+		rule->type = type;
+		rule->target = xstrdup(get_rule_field(&rule_str, &left));
+		rule->value = xstrdup(get_rule_field(&rule_str, &left));
+
+		hash_add(rules, &rule->hash, rule_hash(rule));
+
+		debug("kABI rule: type: '%s', target: '%s', value: '%s'", field,
+		      rule->target, rule->value);
+	}
+
+	if (left > 0)
+		warn("unexpected data at the end of the kABI rules section");
+
+	check(elf_end(elf));
+}
+
+bool kabi_is_declonly(const char *fqn)
+{
+	struct rule *rule;
+
+	if (!stable)
+		return false;
+	if (!fqn || !*fqn)
+		return false;
+
+	hash_for_each_possible(rules, rule, hash,
+			       rule_values_hash(KABI_RULE_TYPE_DECLONLY, fqn)) {
+		if (rule->type == KABI_RULE_TYPE_DECLONLY &&
+		    !strcmp(fqn, rule->target))
+			return true;
+	}
+
+	return false;
+}
+
+static char *get_enumerator_target(const char *fqn, const char *field)
+{
+	char *target = NULL;
+
+	if (asprintf(&target, "%s %s", fqn, field) < 0)
+		error("asprintf failed for '%s %s'", fqn, field);
+
+	return target;
+}
+
+static unsigned long get_ulong_value(const char *value)
+{
+	unsigned long result = 0;
+	char *endptr = NULL;
+
+	errno = 0;
+	result = strtoul(value, &endptr, 10);
+
+	if (errno || *endptr)
+		error("invalid unsigned value '%s'", value);
+
+	return result;
+}
+
+bool kabi_is_enumerator_ignored(const char *fqn, const char *field)
+{
+	bool match = false;
+	struct rule *rule;
+	char *target;
+
+	if (!stable)
+		return false;
+	if (!fqn || !*fqn || !field || !*field)
+		return false;
+
+	target = get_enumerator_target(fqn, field);
+
+	hash_for_each_possible(
+		rules, rule, hash,
+		rule_values_hash(KABI_RULE_TYPE_ENUMERATOR_IGNORE, target)) {
+		if (rule->type == KABI_RULE_TYPE_ENUMERATOR_IGNORE &&
+		    !strcmp(target, rule->target)) {
+			match = true;
+			break;
+		}
+	}
+
+	free(target);
+	return match;
+}
+
+bool kabi_get_enumerator_value(const char *fqn, const char *field,
+			       unsigned long *value)
+{
+	bool match = false;
+	struct rule *rule;
+	char *target;
+
+	if (!stable)
+		return false;
+	if (!fqn || !*fqn || !field || !*field)
+		return false;
+
+	target = get_enumerator_target(fqn, field);
+
+	hash_for_each_possible(rules, rule, hash,
+			       rule_values_hash(KABI_RULE_TYPE_ENUMERATOR_VALUE,
+						target)) {
+		if (rule->type == KABI_RULE_TYPE_ENUMERATOR_VALUE &&
+		    !strcmp(target, rule->target)) {
+			*value = get_ulong_value(rule->value);
+			match = true;
+			break;
+		}
+	}
+
+	free(target);
+	return match;
+}
+
+void kabi_free(void)
+{
+	struct hlist_node *tmp;
+	struct rule *rule;
+
+	hash_for_each_safe(rules, rule, tmp, hash) {
+		free((void *)rule->target);
+		free((void *)rule->value);
+		free(rule);
+	}
+
+	hash_init(rules);
+}
-- 
2.47.1.613.gc27f4b7a9f-goog


