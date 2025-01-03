Return-Path: <linux-modules+bounces-2921-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F943A00EFE
	for <lists+linux-modules@lfdr.de>; Fri,  3 Jan 2025 21:47:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C542E18850C0
	for <lists+linux-modules@lfdr.de>; Fri,  3 Jan 2025 20:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CFB01AD3E5;
	Fri,  3 Jan 2025 20:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Tpv+7mU5"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CCC1C3F04
	for <linux-modules@vger.kernel.org>; Fri,  3 Jan 2025 20:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735937161; cv=none; b=liyovxoh51D/ClrSHC76Bx6nQAaBQKiBGHJ9/Mbz2R3s4xT7iWF2qY7V1OrJCvKksqa1Aqmv8a3nPiS0bNf1SecT+HAINovav8qrZlNgp45g6eKfHz1EMOrKSIAwrHYDvv9VzLsxsoyGmmSDAIQLRANa+cASXC5+fMTMQcuhSRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735937161; c=relaxed/simple;
	bh=ewl5S2jzanve+U7ARk/uAO2NDn3AtA0CV1SBDzIA0jY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=swcg2Zb6hBZJhDLz7bb6/W5J8tKtioNJ4UlS7Cw236JpKckD1HnHJ2QLUegVQ8BrIcagoGXzNSvTlX2xWxk6jsxEl7J0dTv+7DLD/6j07GEVPkFo1mnVp4Ix1X+qMJBeCZ9CF1kq8paV/JZfLdC/MmJzy15k4TzuW9+uwTJD11A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Tpv+7mU5; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2efc3292021so27841612a91.1
        for <linux-modules@vger.kernel.org>; Fri, 03 Jan 2025 12:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735937148; x=1736541948; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=umEBs0sJokKjcG+vSqWh5DOC7EvkghygpqnTohIGBMM=;
        b=Tpv+7mU5NtdCLOS7Rpj1o+ZNUeg7shAlZPIwqxyTmkDkEba1Nl9Z635Iihfqnc0U+d
         x5Cgz+9q+QeM5/yGh1QD/L676Mo1Y85T0D9cYIIzZ172ac8bA/wX2QErtmXH6LVBWQLx
         lagHUwJZKigoANf3gI+z+omzlAkuYvRHFfCHTYIRbSUqCwo9sAAtBsyFjObF5LaybIIz
         z9Zs4Dcwcl6aDouMiWpn12X+lcmWrXB160yjTW/WwH2PP5nB453DyUPUHuZXjgs27I67
         acdww2HIdjQG0iF0/ZSbcpyg3AUI9fP2BSuHvmM/GVK7yg2FBq33tlxZpWXRRXMFaa2O
         PhoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735937148; x=1736541948;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=umEBs0sJokKjcG+vSqWh5DOC7EvkghygpqnTohIGBMM=;
        b=LCTzX5+nzAvyz31hdzMtIHrwNl0rjfQiuqqlMWSXoAi02XcgwMrFZwr20Cu1vBYmBm
         P7Xt6pTz4mUgJOHK1d3shM0d86nls0QG3fvg4lKNXMb11ZsFKoFnGDiRXnKg9hpzxfpO
         WdqThXnR5neuAiekrNku6YbMvPBQWzRpuVAYODLHSmnjXHUfVWjjCWDLPGsQjW3YJa5t
         vO/DTKBrBLOjFGT0cygD2IPk2iF7BTSEhMvsw2V2uCzR2nzqKiJjbK+uedj5/d2fZLNI
         CYQ/AMBWg9vZia9sGdEc+Upjc1pXDrIgGKnd6h41rXTh2u2K4h/qTVEn/T70Lp29FfLf
         YyNA==
X-Forwarded-Encrypted: i=1; AJvYcCWbKAewSF7dwr7M+ZfTo3LeQWHvf7fR+XEANaGvnOyPMXDGNxanvvT629Em16UiK7zi7fw9wv9s/IVSu4i9@vger.kernel.org
X-Gm-Message-State: AOJu0YzuRPJlv8K9aevwwREE3GVVV7K8arKaM1s/jpM2utVxfz9/+bF+
	US9JDQfcCTqXmQypmL4awcBbTJ/a+KHg33sSJAU7bA1lypLPVv0BqBoTx+zS4ut9NGG41igsZ/j
	Jn418Ihs5Upku0sPA6IbNG3jHIw==
X-Google-Smtp-Source: AGHT+IFle8sYcdG4AG/nYdbDmkefxrFEjBZBFejmHoWxff9K7oFdtGFkx+W06qXtWdEhpmuKVXnhpZOCCSc+e32rXa8=
X-Received: from pfbcw13.prod.google.com ([2002:a05:6a00:450d:b0:725:d64a:9a05])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:399a:b0:725:b7dd:e668 with SMTP id d2e1a72fcca58-72abdebb868mr68283427b3a.17.1735937147700;
 Fri, 03 Jan 2025 12:45:47 -0800 (PST)
Date: Fri,  3 Jan 2025 20:45:30 +0000
In-Reply-To: <20250103204521.1885406-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250103204521.1885406-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=8481; i=samitolvanen@google.com;
 h=from:subject; bh=ewl5S2jzanve+U7ARk/uAO2NDn3AtA0CV1SBDzIA0jY=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOkVPqmCsSWmsz2vz8vfW3l0b8SBK3JMARHbJcVclgY9e
 FOXvCu7o5SFQYyDQVZMkaXl6+qtu787pb76XCQBM4eVCWQIAxenAEzklQbD/9z4qP2y1TqyK05v
 WvX1GwsL/+qnZjmrCs+wn2YRLz4fUMLIcHsT9ypX6WOfFEJb/Lr2LxKr+V2b/1I3Ye+1wxUbWE9 zsAIA
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250103204521.1885406-28-samitolvanen@google.com>
Subject: [PATCH v8 08/18] gendwarfksyms: Expand structure types
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

Recursively expand DWARF structure types, i.e. structs, unions, and
enums. Also include relevant DWARF attributes in type strings to
encode structure layout, for example.

Example output with --dump-dies:

  subprogram (
    formal_parameter structure_type &str {
      member pointer_type {
        base_type u8 byte_size(1) encoding(7)
      } data_ptr data_member_location(0) ,
      member base_type usize byte_size(8) encoding(7) length data_member_location(8)
    } byte_size(16) alignment(8) msg
  )
  -> base_type void

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 scripts/gendwarfksyms/dwarf.c         | 138 +++++++++++++++++++++++++-
 scripts/gendwarfksyms/gendwarfksyms.h |   5 +
 2 files changed, 141 insertions(+), 2 deletions(-)

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 46ce17b2459b..6ec1138c459f 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -208,9 +208,14 @@ static void process_fqn(struct die *cache, Dwarf_Die *die)
 				    value);                                \
 	}
 
+DEFINE_PROCESS_UDATA_ATTRIBUTE(accessibility)
 DEFINE_PROCESS_UDATA_ATTRIBUTE(alignment)
+DEFINE_PROCESS_UDATA_ATTRIBUTE(bit_size)
 DEFINE_PROCESS_UDATA_ATTRIBUTE(byte_size)
 DEFINE_PROCESS_UDATA_ATTRIBUTE(encoding)
+DEFINE_PROCESS_UDATA_ATTRIBUTE(data_bit_offset)
+DEFINE_PROCESS_UDATA_ATTRIBUTE(data_member_location)
+DEFINE_PROCESS_UDATA_ATTRIBUTE(discr_value)
 
 /* Match functions -- die_match_callback_t */
 #define DEFINE_MATCH(type)                                     \
@@ -219,7 +224,9 @@ DEFINE_PROCESS_UDATA_ATTRIBUTE(encoding)
 		return dwarf_tag(die) == DW_TAG_##type##_type; \
 	}
 
+DEFINE_MATCH(enumerator)
 DEFINE_MATCH(formal_parameter)
+DEFINE_MATCH(member)
 DEFINE_MATCH(subrange)
 
 bool match_all(Dwarf_Die *die)
@@ -298,6 +305,10 @@ static void __process_list_type(struct state *state, struct die *cache,
 		process(cache, " ");
 		process(cache, name);
 	}
+	process_accessibility_attr(cache, die);
+	process_bit_size_attr(cache, die);
+	process_data_bit_offset_attr(cache, die);
+	process_data_member_location_attr(cache, die);
 }
 
 #define DEFINE_PROCESS_LIST_TYPE(type)                                       \
@@ -308,6 +319,7 @@ static void __process_list_type(struct state *state, struct die *cache,
 	}
 
 DEFINE_PROCESS_LIST_TYPE(formal_parameter)
+DEFINE_PROCESS_LIST_TYPE(member)
 
 /* Container types with DW_AT_type */
 static void __process_type(struct state *state, struct die *cache,
@@ -340,6 +352,7 @@ DEFINE_PROCESS_TYPE(reference)
 DEFINE_PROCESS_TYPE(restrict)
 DEFINE_PROCESS_TYPE(rvalue_reference)
 DEFINE_PROCESS_TYPE(shared)
+DEFINE_PROCESS_TYPE(template_type_parameter)
 DEFINE_PROCESS_TYPE(volatile)
 DEFINE_PROCESS_TYPE(typedef)
 
@@ -393,6 +406,107 @@ static void process_subroutine_type(struct state *state, struct die *cache,
 	__process_subroutine_type(state, cache, die, "subroutine_type");
 }
 
+static void process_variant_type(struct state *state, struct die *cache,
+				 Dwarf_Die *die)
+{
+	process_list_comma(state, cache);
+	process(cache, "variant {");
+	process_linebreak(cache, 1);
+	check(process_die_container(state, cache, die, process_type,
+				    match_member_type));
+	process_linebreak(cache, -1);
+	process(cache, "}");
+	process_discr_value_attr(cache, die);
+}
+
+static void process_variant_part_type(struct state *state, struct die *cache,
+				      Dwarf_Die *die)
+{
+	process_list_comma(state, cache);
+	process(cache, "variant_part {");
+	process_linebreak(cache, 1);
+	check(process_die_container(state, cache, die, process_type,
+				    match_all));
+	process_linebreak(cache, -1);
+	process(cache, "}");
+}
+
+static int ___process_structure_type(struct state *state, struct die *cache,
+				     Dwarf_Die *die)
+{
+	switch (dwarf_tag(die)) {
+	case DW_TAG_member:
+	case DW_TAG_variant_part:
+		return check(process_type(state, cache, die));
+	case DW_TAG_class_type:
+	case DW_TAG_enumeration_type:
+	case DW_TAG_structure_type:
+	case DW_TAG_template_type_parameter:
+	case DW_TAG_union_type:
+	case DW_TAG_subprogram:
+		/* Skip non-member types, including member functions */
+		return 0;
+	default:
+		error("unexpected structure_type child: %x", dwarf_tag(die));
+	}
+}
+
+static void __process_structure_type(struct state *state, struct die *cache,
+				     Dwarf_Die *die, const char *type,
+				     die_callback_t process_func,
+				     die_match_callback_t match_func)
+{
+	process(cache, type);
+	process_fqn(cache, die);
+	process(cache, " {");
+	process_linebreak(cache, 1);
+
+	check(process_die_container(state, cache, die, process_func,
+				    match_func));
+
+	process_linebreak(cache, -1);
+	process(cache, "}");
+
+	process_byte_size_attr(cache, die);
+	process_alignment_attr(cache, die);
+}
+
+#define DEFINE_PROCESS_STRUCTURE_TYPE(structure)                        \
+	static void process_##structure##_type(                         \
+		struct state *state, struct die *cache, Dwarf_Die *die) \
+	{                                                               \
+		__process_structure_type(state, cache, die,             \
+					 #structure "_type",            \
+					 ___process_structure_type,     \
+					 match_all);                    \
+	}
+
+DEFINE_PROCESS_STRUCTURE_TYPE(class)
+DEFINE_PROCESS_STRUCTURE_TYPE(structure)
+DEFINE_PROCESS_STRUCTURE_TYPE(union)
+
+static void process_enumerator_type(struct state *state, struct die *cache,
+				    Dwarf_Die *die)
+{
+	Dwarf_Word value;
+
+	process_list_comma(state, cache);
+	process(cache, "enumerator");
+	process_fqn(cache, die);
+
+	if (get_udata_attr(die, DW_AT_const_value, &value)) {
+		process(cache, " = ");
+		process_fmt(cache, "%" PRIu64, value);
+	}
+}
+
+static void process_enumeration_type(struct state *state, struct die *cache,
+				     Dwarf_Die *die)
+{
+	__process_structure_type(state, cache, die, "enumeration_type",
+				 process_type, match_enumerator_type);
+}
+
 static void process_base_type(struct state *state, struct die *cache,
 			      Dwarf_Die *die)
 {
@@ -403,6 +517,16 @@ static void process_base_type(struct state *state, struct die *cache,
 	process_alignment_attr(cache, die);
 }
 
+static void process_unspecified_type(struct state *state, struct die *cache,
+				     Dwarf_Die *die)
+{
+	/*
+	 * These can be emitted for stand-alone assembly code, which means we
+	 * might run into them in vmlinux.o.
+	 */
+	process(cache, "unspecified_type");
+}
+
 static void process_cached(struct state *state, struct die *cache,
 			   Dwarf_Die *die)
 {
@@ -463,17 +587,27 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 	PROCESS_TYPE(rvalue_reference)
 	PROCESS_TYPE(shared)
 	PROCESS_TYPE(volatile)
+	/* Container types */
+	PROCESS_TYPE(class)
+	PROCESS_TYPE(structure)
+	PROCESS_TYPE(union)
+	PROCESS_TYPE(enumeration)
 	/* Subtypes */
+	PROCESS_TYPE(enumerator)
 	PROCESS_TYPE(formal_parameter)
+	PROCESS_TYPE(member)
 	PROCESS_TYPE(subrange)
+	PROCESS_TYPE(template_type_parameter)
+	PROCESS_TYPE(variant)
+	PROCESS_TYPE(variant_part)
 	/* Other types */
 	PROCESS_TYPE(array)
 	PROCESS_TYPE(base)
 	PROCESS_TYPE(subroutine)
 	PROCESS_TYPE(typedef)
+	PROCESS_TYPE(unspecified)
 	default:
-		debug("unimplemented type: %x", tag);
-		break;
+		error("unexpected type: %x", tag);
 	}
 
 	/* Update cache state and append to the parent (if any) */
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index 0746a36f4924..1796f71b3a34 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -60,8 +60,13 @@ extern int dump_dies;
 #define checkp(expr) __check(expr, __res < 0)
 
 /* Consistent aliases (DW_TAG_<type>_type) for DWARF tags */
+#define DW_TAG_enumerator_type DW_TAG_enumerator
 #define DW_TAG_formal_parameter_type DW_TAG_formal_parameter
+#define DW_TAG_member_type DW_TAG_member
+#define DW_TAG_template_type_parameter_type DW_TAG_template_type_parameter
 #define DW_TAG_typedef_type DW_TAG_typedef
+#define DW_TAG_variant_part_type DW_TAG_variant_part
+#define DW_TAG_variant_type DW_TAG_variant
 
 /*
  * symbols.c
-- 
2.47.1.613.gc27f4b7a9f-goog


