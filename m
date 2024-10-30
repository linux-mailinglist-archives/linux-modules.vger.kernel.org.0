Return-Path: <linux-modules+bounces-2392-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D759B6A82
	for <lists+linux-modules@lfdr.de>; Wed, 30 Oct 2024 18:13:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 505C41F2588F
	for <lists+linux-modules@lfdr.de>; Wed, 30 Oct 2024 17:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC0F31BD9CB;
	Wed, 30 Oct 2024 17:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SFd53Vok"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9916235A31
	for <linux-modules@vger.kernel.org>; Wed, 30 Oct 2024 17:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730307721; cv=none; b=rh8z5qiw1UDnO5nTlwxyqKXgl5g0si5qywDHroJx12bkXZaaWtYAriNTefDUsd88vz2vfQT3G44t3DajRYvcQQC1xvjkzEGvd5m/NeYk5yUti8PbpH9NIqGt4Xfh8LORm/L6LYtpBt6p28MUVrL+VqkxqRZbZQ+cqvTexfGQwU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730307721; c=relaxed/simple;
	bh=3FriUdHtDkRRZPJGTzNicaJg/WplN7J779UEvmaSOpk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bQEsGwAqDRhUiDcY+QdBIJOmXWkOMUDcbdM5wE3FBKez3wyzNm1tkfJ6eti0XVkvnrmeUKbSlqydGY2Nq6HP9hstSN7lkzo18+CQs5mDr6ZM22QC0wx4SJWX2HgKz0gQDUEbKAppGH7GlTLvR7VcuCV9rDQWCum3JitVHtUyvZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SFd53Vok; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e9ba43a9a0so95642387b3.3
        for <linux-modules@vger.kernel.org>; Wed, 30 Oct 2024 10:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730307716; x=1730912516; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gCXKhYHd2Mx+NGKb3+6xjgXWoy+xYokNujvaCJkeSC8=;
        b=SFd53Vokul5S8vFJeHifqAQ3DwLXvOWkQzj4cGpj4hXtigQophPOMgUOQIE2tkp+EN
         QgA/uWK/QDOKBmbCJ8Y0fNekWIqebIHsFSna7ZysNHfEeMvtEe2dC4d1q8tJPhtZXDV3
         X4jz9bIoKDIQZM4bd0b493mGjH8RLw95RTSrm0NZfHXR4txlvb5xCUQzeuAxbtvumhyd
         s4t7kD/I7RmrRjOLAdWchCKK+O5qBDH0W6mH/I0Y9eHQ32CIjw9T+6ZOXe/4YKkKpWXk
         kszwpyYZ8PC40RXtn3ERFl8rr5bA198lAN69QL7L4vaGsMZUYUYrYApICVhDXzaPm2RG
         02MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730307716; x=1730912516;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gCXKhYHd2Mx+NGKb3+6xjgXWoy+xYokNujvaCJkeSC8=;
        b=Gqbp5NiUiaSKuiZ9rQ0rR1X4DXqcJ4fUEpz1FZLy9+eA3KrmxyUAHVefvN+mracwO+
         2WsuniZS9DWyzrisEEJXe6io3Bwbr0ULe2o2ZzYTy3qemsGFLR9tA0L8Ut7jEt+DC1fK
         3Hi/56IEbScmyrLypN+qxS7oSXj08jr/D+7vOOHaE8bZiCELnW43hENbwsQEpVquTanr
         z7m9snSAvzL9DZTrByF1sSSbqH4P1/2W6iRLwmJn1fL1x9JHMzJpBaLIO4aEQmvAasfR
         4aw3Jkc7pIbh7u9h0cn5sFIFTgSQKkPIfMmJViG3GjBFZlcy2ttseHZIZWlUCHnVFst1
         EQcg==
X-Forwarded-Encrypted: i=1; AJvYcCVWyigs+LSpYb6jBvjMAPfRE6o++GmIJTKaKutZW357me2jx4XqgcVJQgzW+BlCI0okn38z+iyygOYGu1rR@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmo+wTYYc6KQON40lwXDcC1sB5fdB7MbnPTZMsQ8XqAd7opg20
	Rn5o/vsSgFug93hKSfg5a5HGG3W0kJ7QQuvvnL9ktDZnb1fKj6jjVchUem09A2psi2nds3POqEI
	y1VGcHXmUZr26LRCytqcAVLawUQ==
X-Google-Smtp-Source: AGHT+IFnlhMaDeXQ/6v7SCYeIH1jerB9WtfdLD+6iI6HSe1DJjys46YrL6vqN8je+TUjGgFatkLOlTQGRlnhv5puLNo=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:690c:6481:b0:6e3:da91:3e17 with
 SMTP id 00721157ae682-6ea5231fbb5mr1437b3.2.1730307715651; Wed, 30 Oct 2024
 10:01:55 -0700 (PDT)
Date: Wed, 30 Oct 2024 17:01:26 +0000
In-Reply-To: <20241030170106.1501763-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=12136; i=samitolvanen@google.com;
 h=from:subject; bh=3FriUdHtDkRRZPJGTzNicaJg/WplN7J779UEvmaSOpk=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOlKaTFdRtv3hvepTRY2XHo/0H7N2WQ1s+P+/0+ybzJo+
 HIqXsW1o5SFQYyDQVZMkaXl6+qtu787pb76XCQBM4eVCWQIAxenAExkuiHDXxH+rvC1W49KVh11
 C+CwPJm+O4cxdE0J53qxw4bz/xStK2Nk2CvpJTBBa2W5aLjd1dSpImunFT8v7f3/OP7XqxMqU/1 CWAE=
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241030170106.1501763-40-samitolvanen@google.com>
Subject: [PATCH v5 19/19] Documentation/kbuild: Add DWARF module versioning
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

Add documentation for gendwarfksyms changes, and the kABI stability
features that can be useful for distributions even though they're not
used in mainline kernels.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Acked-by: Neal Gompa <neal@gompa.dev>
---
 Documentation/kbuild/gendwarfksyms.rst | 276 +++++++++++++++++++++++++
 Documentation/kbuild/index.rst         |   1 +
 2 files changed, 277 insertions(+)
 create mode 100644 Documentation/kbuild/gendwarfksyms.rst

diff --git a/Documentation/kbuild/gendwarfksyms.rst b/Documentation/kbuild/gendwarfksyms.rst
new file mode 100644
index 000000000000..0f5000491132
--- /dev/null
+++ b/Documentation/kbuild/gendwarfksyms.rst
@@ -0,0 +1,276 @@
+=======================
+DWARF module versioning
+=======================
+
+1. Introduction
+===============
+
+When CONFIG_MODVERSIONS is enabled, symbol versions for modules
+are typically calculated from preprocessed source code using the
+**genksyms** tool.  However, this is incompatible with languages such
+as Rust, where the source code has insufficient information about
+the resulting ABI. With CONFIG_GENDWARFKSYMS (and CONFIG_DEBUG_INFO)
+selected, **gendwarfksyms** is used instead to calculate symbol versions
+from the DWARF debugging information, which contains the necessary
+details about the final module ABI.
+
+1.1. Usage
+==========
+
+gendwarfksyms accepts a list of object files on the command line, and a
+list of symbol names (one per line) in standard input::
+
+        Usage: gendwarfksyms [options] elf-object-file ... < symbol-list
+
+        Options:
+          -d, --debug          Print debugging information
+              --dump-dies      Dump DWARF DIE contents
+              --dump-die-map   Print debugging information about die_map changes
+              --dump-types     Dump type strings
+              --dump-versions  Dump expanded type strings used for symbol versions
+          -s, --stable         Support kABI stability features
+          -T, --symtypes file  Write a symtypes file
+          -h, --help           Print this message
+
+
+2. Type information availability
+================================
+
+While symbols are typically exported in the same translation unit (TU)
+where they're defined, it's also perfectly fine for a TU to export
+external symbols. For example, this is done when calculating symbol
+versions for exports in stand-alone assembly code.
+
+To ensure the compiler emits the necessary DWARF type information in the
+TU where symbols are actually exported, gendwarfksyms adds a pointer
+to exported symbols in the `EXPORT_SYMBOL()` macro using the following
+macro::
+
+        #define __GENDWARFKSYMS_EXPORT(sym)                             \
+                static typeof(sym) *__gendwarfksyms_ptr_##sym __used    \
+                        __section(".discard.gendwarfksyms") = &sym;
+
+
+When a symbol pointer is found in DWARF, gendwarfksyms can use its
+type for calculating symbol versions even if the symbol is defined
+elsewhere. The name of the symbol pointer is expected to start with
+`__gendwarfksyms_ptr_`, followed by the name of the exported symbol.
+
+3. Symtypes output format
+=========================
+
+Similarly to genksyms, gendwarfksyms supports writing a symtypes
+file for each processed object that contain types for exported
+symbols and each referenced type that was used in calculating symbol
+versions. These files can be useful when trying to determine what
+exactly caused symbol versions to change between builds. To generate
+symtypes files during a kernel build, set `KBUILD_SYMTYPES=1`.
+
+Matching the existing format, the first column of each line contains
+either a type reference or a symbol name. Type references have a
+one-letter prefix followed by "#" and the name of the type. Four
+reference types are supported::
+
+        e#<type> = enum
+        s#<type> = struct
+        t#<type> = typedef
+        u#<type> = union
+
+Type names with spaces in them are wrapped in single quotes, e.g.::
+
+        s#'core::result::Result<u8, core::num::error::ParseIntError>'
+
+The rest of the line contains a type string. Unlike with genksyms that
+produces C-style type strings, gendwarfksyms uses the same simple parsed
+DWARF format produced by **--dump-dies**, but with type references
+instead of fully expanded strings.
+
+4. Maintaining a stable kABI
+============================
+
+Distribution maintainers often need the ability to make ABI compatible
+changes to kernel data structures due to LTS updates or backports. Using
+the traditional `#ifndef __GENKSYMS__` to hide these changes from symbol
+versioning won't work when processing object files. To support this
+use case, gendwarfksyms provides kABI stability features designed to
+hide changes that won't affect the ABI when calculating versions. These
+features are all gated behind the **--stable** command line flag and are
+not used in the mainline kernel. To use stable features during a kernel
+build, set `KBUILD_GENDWARFKSYMS_STABLE=1`.
+
+Examples for using these features are provided in the
+**scripts/gendwarfksyms/examples** directory, including helper macros
+for source code annotation. Note that as these features are only used to
+transform the inputs for symbol versioning, the user is responsible for
+ensuring that their changes actually won't break the ABI.
+
+4.1. kABI rules
+===============
+
+kABI rules allow distributions to fine-tune certain parts
+of gendwarfksyms output and thus control how symbol
+versions are calculated. These rules are defined in the
+`.discard.gendwarfksyms.kabi_rules` section of the object file and
+consist of simple null-terminated strings with the following structure::
+
+	version\0type\0target\0value\0
+
+This string sequence is repeated as many times as needed to express all
+the rules. The fields are as follows:
+
+- `version`: Ensures backward compatibility for future changes to the
+  structure. Currently expected to be "1".
+- `type`: Indicates the type of rule being applied.
+- `target`: Specifies the target of the rule, typically the fully
+  qualified name of the DWARF Debugging Information Entry (DIE).
+- `value`: Provides rule-specific data.
+
+The following helper macro, for example, can be used to specify rules
+in the source code::
+
+	#define __KABI_RULE(hint, target, value)                             \
+		static const char __PASTE(__gendwarfksyms_rule_,             \
+					  __COUNTER__)[] __used __aligned(1) \
+			__section(".discard.gendwarfksyms.kabi_rules") =     \
+				"1\0" #hint "\0" #target "\0" #value
+
+
+Currently, only the rules discussed in this section are supported, but
+the format is extensible enough to allow further rules to be added as
+need arises.
+
+4.1.1. Managing structure visibility
+====================================
+
+A structure declaration can change into a full definition when
+additional includes are pulled into the translation unit. This changes
+the versions of any symbol that references the structure even if the ABI
+remains unchanged. As it may not be possible to drop includes without
+breaking the build, the `struct_declonly` rule can be used to specify a
+data structure as declaration-only, even if the debugging information
+contains the full definition.
+
+The rule fields are expected to be as follows:
+
+- `type`: "struct_declonly"
+- `target`: The fully qualified name of the target data structure
+  (as shown in **--dump-dies** output).
+- `value`: This field is ignored and is expected to have the value ";".
+
+Using the `__KABI_RULE` macro, this rule can be defined as::
+
+	#define KABI_STRUCT_DECLONLY(fqn) \
+		__KABI_RULE(struct_declonly, fqn, ;)
+
+Example usage::
+
+	struct s {
+		/* definition */
+	};
+
+	KABI_STRUCT_DECLONLY(s);
+
+4.1.2. Adding enumerators
+=========================
+
+For enums, all enumerators and their values are included in calculating
+symbol versions, which becomes a problem if we later need to add more
+enumerators without changing symbol versions. The `enumerator_ignore`
+rule allows us to hide named enumerators from the input.
+
+The rule fields are expected to be as follows:
+
+- `type`: "enumerator_ignore"
+- `target`: The fully qualified name of the target enum
+  (as shown in **--dump-dies** output).
+- `value`: The name of the enumerator to ignore.
+
+Using the `__KABI_RULE` macro, this rule can be defined as::
+
+	#define KABI_ENUMERATOR_IGNORE(fqn, field) \
+		__KABI_RULE(enumerator_ignore, fqn, field)
+
+Example usage::
+
+	enum e {
+		A, B, C, D,
+	};
+
+	KABI_ENUMERATOR_IGNORE(e, B);
+	KABI_ENUMERATOR_IGNORE(e, C);
+
+
+4.3. Adding structure members
+=============================
+
+Perhaps the most common ABI compatible changeis adding a member to a
+kernel data structure. When changes to a structure are anticipated,
+distribution maintainers can pre-emptively reserve space in the
+structure and take it into use later without breaking the ABI. If
+changes are needed to data structures without reserved space, existing
+alignment holes can potentially be used instead. While kABI rules could
+be added for these type of changes, using unions is typically a more
+natural method. This section describes gendwarfksyms support for using
+reserved space in data structures and hiding members that don't change
+the ABI when calculating symbol versions.
+
+4.3.1. Reserving space and replacing members
+============================================
+
+To reserve space in a struct, adding a member of any type with a name
+that starts with `__kabi_` will result in the name being left out of
+symbol versioning::
+
+        struct s {
+                long a;
+                long __kabi_reserved_0; /* reserved for future use */
+        };
+
+The space reserved by this member can be later taken into use by
+wrapping it into a union, which includes the original type and the
+replacement struct member::
+
+        struct s {
+                long a;
+                union {
+                        long __kabi_reserved_0; /* original type */
+                        struct b b; /* replaced field */
+                };
+        };
+
+As long as the reserved member's name in the union starts with
+`__kabi_reserved_`, the original type will be used for symbol
+versioning and rest of the union is ignored. The examples include
+`KABI_(RESERVE|USE)*` macros that help simplify the process and also
+ensure the replacement member's size won't exceed the reserved space.
+
+4.3.2. Hiding members
+=====================
+
+Predicting which structures will require changes during the support
+timeframe isn't always possible, in which case one might have to resort
+to placing new members into existing alignment holes::
+
+        struct s {
+                int a;
+                /* a 4-byte alignment hole */
+                unsigned long b;
+        };
+
+
+While this won't change the size of the data structure, one needs to
+be able to hide the added members from symbol versioning. Similarly
+to reserved fields, this can be accomplished by wrapping the added
+member to a union where one of the fields has a name starting with
+`__kabi_ignored`::
+
+        struct s {
+                int a;
+                union {
+                        char __kabi_ignored_0;
+                        int n;
+                };
+                unsigned long b;
+        };
+
+With **--stable**, both versions produce the same symbol version.
diff --git a/Documentation/kbuild/index.rst b/Documentation/kbuild/index.rst
index cee2f99f734b..e82af05cd652 100644
--- a/Documentation/kbuild/index.rst
+++ b/Documentation/kbuild/index.rst
@@ -21,6 +21,7 @@ Kernel Build System
     reproducible-builds
     gcc-plugins
     llvm
+    gendwarfksyms
 
 .. only::  subproject and html
 
-- 
2.47.0.163.g1226f6d8fa-goog


