Return-Path: <linux-modules+bounces-2908-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69000A00CE2
	for <lists+linux-modules@lfdr.de>; Fri,  3 Jan 2025 18:38:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34AC13A3F91
	for <lists+linux-modules@lfdr.de>; Fri,  3 Jan 2025 17:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 712801FCFC1;
	Fri,  3 Jan 2025 17:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WG6Rvu8Z"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-ot1-f74.google.com (mail-ot1-f74.google.com [209.85.210.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9101FCD07
	for <linux-modules@vger.kernel.org>; Fri,  3 Jan 2025 17:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735925837; cv=none; b=f33+xf60KPmAaGguuAjgceA3K3G0gb0/A9RYNyp60AOXf7Mb7wIV6tByN8GbZ+5/Y/mHy0lrCC9v7CsZ8aFg4dK0O492R2cYGZNlc6efqs/LrboKBvyksyKGk0ronkDc20qsIKd7Q//29ktcknP+I87ucaYcmTJIjsWl6qdaz/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735925837; c=relaxed/simple;
	bh=OfARBdrSO25YJUBOotWgeA+0nMfy8zMZa0sJjFrf0fc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UboIOdFFIhZ7UVy2/fuaJvv5MFUlyOFuPznTF/OoSZ7ZNRaym0mmPdBOSqBShUMW+S/t9ZrGStZarA3o9f2P5XycqX1qOvCnxOEfMKCBBWJ9YHsx1yxdSiKxBe5L4FYcn541O0ZZvQ2OAdR+FdE64iKlOcSAIj9wx+Pe46gmI0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WG6Rvu8Z; arc=none smtp.client-ip=209.85.210.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-ot1-f74.google.com with SMTP id 46e09a7af769-71e1c3396a1so9090579a34.1
        for <linux-modules@vger.kernel.org>; Fri, 03 Jan 2025 09:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735925833; x=1736530633; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NnqTVWJzvIfhKg7Bjweyg4HBEOW+h34t+hptux0JJqo=;
        b=WG6Rvu8ZkJPhGceM4WtCLtzdfmrbDIu6a21CDsp8a3VizcWzyurSGbgPkQmeIfsMLa
         Jy6VfUKPekL54qvXa9QQCJpdBmzNf4J/WZ2TzZFfUo3nHfjpx3Yu6Da+GApFAvKbYmG6
         C9caCB2ClnT0GmzgJoWyNOwKoJ9yDZZ71XA8h+KNnmL/hOq1CKOtTWOSp/7qT01fmMTg
         TuSvKB9eIhd7q/DAWbmiBpirACaJp8nSEtdxKJYfO//iO7dZt61z2T85swB3+PyqHLpI
         mpL4uQF+e+wzGy9tfD1EevYR9WJiwxQIv8D8vnrrCTqbf+k718uPX+GH9uF3SF4858tl
         Yjqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735925833; x=1736530633;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NnqTVWJzvIfhKg7Bjweyg4HBEOW+h34t+hptux0JJqo=;
        b=sGWhR6HBz6Ss6s0SsYE8Nx6VvqtZzHLPyyt2A8CKJ2thi1zxP+wMAYhAnQuTnuGWl9
         SjBpLTHxEv+BnR69MxFndQAu+bBcyYFS90QNtJYC9goA67TwbrtOgDGPR9TiHzfnMi/k
         OsJOZCvM2xU37NH4Km2vXR5IB/rPdO6e5JK9Rva45optTFhHGctrecOZVwS6PvN3vr/K
         9mZqYuQ8F7m3fQ8xYoMYmorGm5RwhAkIL4KHtwk51U7N3bGf48lcWtIvbu4AfGZaeXZ6
         3FfgwLNgEVwpEWnLth3YYZilU3SbtBHju21IvfaO02BrkSsUJd7+viptMnwRdh0lob5t
         1L6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXSd+kRm7SdHPTGjY5+x6EsXxxKdt56XuuK7PPslyQnJeHAgLX3J1LOoDOyvIFC8lKITOqse/u0lWcosI93@vger.kernel.org
X-Gm-Message-State: AOJu0YwPY7t1Pt8oTD/NJo1BuGF0g7RF6MnFbS9SBTtS78oOoTsxPn4e
	+Wl2LzK3y4WHzvHP6Pgtj9v1RhhMEChkPUmCnaCy5DFKyoeSWYcpWYr7Bq96DofRmHHUX4faEXv
	QCk+K3Q==
X-Google-Smtp-Source: AGHT+IGSTIF0juMK9VyJAJVfLygRi2f85BWQxzNFR64wOrkiaeDcNc+IiR3F3Rw5A8HO98Gdoqqk3B0klugH
X-Received: from oabmm5.prod.google.com ([2002:a05:6870:e85:b0:297:2777:a7bb])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:2f09:b0:29e:3eff:dea
 with SMTP id 586e51a60fabf-2a7fb00b558mr24668510fac.8.1735925833092; Fri, 03
 Jan 2025 09:37:13 -0800 (PST)
Date: Fri, 03 Jan 2025 17:37:05 +0000
In-Reply-To: <20250103-extended-modversions-v13-0-35d87c65ee04@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250103-extended-modversions-v13-0-35d87c65ee04@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250103-extended-modversions-v13-5-35d87c65ee04@google.com>
Subject: [PATCH v13 5/5] rust: Use gendwarfksyms + extended modversions for CONFIG_MODVERSIONS
From: Matthew Maurer <mmaurer@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

From: Sami Tolvanen <samitolvanen@google.com>

Previously, two things stopped Rust from using MODVERSIONS:
1. Rust symbols are occasionally too long to be represented in the
   original versions table
2. Rust types cannot be properly hashed by the existing genksyms
   approach because:
	* Looking up type definitions in Rust is more complex than C
	* Type layout is potentially dependent on the compiler in Rust,
	  not just the source type declaration.

CONFIG_EXTENDED_MODVERSIONS addresses the first point, and
CONFIG_GENDWARFKSYMS the second. If Rust wants to use MODVERSIONS, allow
it to do so by selecting both features.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Co-developed-by: Matthew Maurer <mmaurer@google.com>
Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 init/Kconfig  |  3 ++-
 rust/Makefile | 34 ++++++++++++++++++++++++++++++++--
 2 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index c1f9eb3d5f2e892e977ba1425599502dc830f552..b60acfd9431e0ac2bf401ecb6523b5104ad31150 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1959,7 +1959,8 @@ config RUST
 	bool "Rust support"
 	depends on HAVE_RUST
 	depends on RUST_IS_AVAILABLE
-	depends on !MODVERSIONS
+	select EXTENDED_MODVERSIONS if MODVERSIONS
+	depends on !MODVERSIONS || GENDWARFKSYMS
 	depends on !GCC_PLUGIN_RANDSTRUCT
 	depends on !RANDSTRUCT
 	depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
diff --git a/rust/Makefile b/rust/Makefile
index a40a3936126d603836e0ec9b42a1285916b60e45..80f970ad81f7989afe5ff2b5f633f50feb7f6006 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -329,10 +329,11 @@ $(obj)/bindings/bindings_helpers_generated.rs: private bindgen_target_extra = ;
 $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.c FORCE
 	$(call if_changed_dep,bindgen)
 
+rust_exports = $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D|B)/ && $$3!~/__cfi/ { printf $(2),$(3) }'
+
 quiet_cmd_exports = EXPORTS $@
       cmd_exports = \
-	$(NM) -p --defined-only $< \
-		| awk '$$2~/(T|R|D|B)/ && $$3!~/__cfi/ {printf "EXPORT_SYMBOL_RUST_GPL(%s);\n",$$3}' > $@
+	$(call rust_exports,$<,"EXPORT_SYMBOL_RUST_GPL(%s);\n",$$3) > $@
 
 $(obj)/exports_core_generated.h: $(obj)/core.o FORCE
 	$(call if_changed,exports)
@@ -401,11 +402,36 @@ ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(CONFIG_64BIT))),)
 		__ashlti3 __lshrti3
 endif
 
+ifdef CONFIG_MODVERSIONS
+cmd_gendwarfksyms = $(if $(skip_gendwarfksyms),, \
+	$(call rust_exports,$@,"%s\n",$$3) | \
+	scripts/gendwarfksyms/gendwarfksyms \
+		$(if $(KBUILD_GENDWARFKSYMS_STABLE), --stable) \
+		$(if $(KBUILD_SYMTYPES), --symtypes $(@:.o=.symtypes),) \
+		$@ >> $(dot-target).cmd)
+endif
+
 define rule_rustc_library
 	$(call cmd_and_fixdep,rustc_library)
 	$(call cmd,gen_objtooldep)
+	$(call cmd,gendwarfksyms)
 endef
 
+define rule_rust_cc_library
+	$(call if_changed_rule,cc_o_c)
+	$(call cmd,force_checksrc)
+	$(call cmd,gendwarfksyms)
+endef
+
+# helpers.o uses the same export mechanism as Rust libraries, so ensure symbol
+# versions are calculated for the helpers too.
+$(obj)/helpers/helpers.o: $(src)/helpers/helpers.c $(recordmcount_source) FORCE
+	+$(call if_changed_rule,rust_cc_library)
+
+# Disable symbol versioning for exports.o to avoid conflicts with the actual
+# symbol versions generated from Rust objects.
+$(obj)/exports.o: private skip_gendwarfksyms = 1
+
 $(obj)/core.o: private skip_clippy = 1
 $(obj)/core.o: private skip_flags = -Wunreachable_pub
 $(obj)/core.o: private rustc_objcopy = $(foreach sym,$(redirect-intrinsics),--redefine-sym $(sym)=__rust$(sym))
@@ -417,13 +443,16 @@ ifneq ($(or $(CONFIG_X86_64),$(CONFIG_X86_32)),)
 $(obj)/core.o: scripts/target.json
 endif
 
+$(obj)/compiler_builtins.o: private skip_gendwarfksyms = 1
 $(obj)/compiler_builtins.o: private rustc_objcopy = -w -W '__*'
 $(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/core.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
+$(obj)/build_error.o: private skip_gendwarfksyms = 1
 $(obj)/build_error.o: $(src)/build_error.rs $(obj)/compiler_builtins.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
+$(obj)/ffi.o: private skip_gendwarfksyms = 1
 $(obj)/ffi.o: $(src)/ffi.rs $(obj)/compiler_builtins.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
@@ -435,6 +464,7 @@ $(obj)/bindings.o: $(src)/bindings/lib.rs \
 	+$(call if_changed_rule,rustc_library)
 
 $(obj)/uapi.o: private rustc_target_flags = --extern ffi
+$(obj)/uapi.o: private skip_gendwarfksyms = 1
 $(obj)/uapi.o: $(src)/uapi/lib.rs \
     $(obj)/ffi.o \
     $(obj)/uapi/uapi_generated.rs FORCE

-- 
2.47.1.613.gc27f4b7a9f-goog


