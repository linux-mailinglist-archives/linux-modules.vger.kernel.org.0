Return-Path: <linux-modules+bounces-2791-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E22F89F86B4
	for <lists+linux-modules@lfdr.de>; Thu, 19 Dec 2024 22:14:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 890AE1896A76
	for <lists+linux-modules@lfdr.de>; Thu, 19 Dec 2024 21:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 492852040B7;
	Thu, 19 Dec 2024 21:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KKC2XYju"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D4320011B
	for <linux-modules@vger.kernel.org>; Thu, 19 Dec 2024 21:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734642500; cv=none; b=E45aHf5g/wP3rTrVMHzie1DlM24CFgYmeF2NjmNR/6mxPfXePGDIJ+CO7cJ2jrH+c/J9WOpAcmhOoS+jbmItq30+iuU9EIdJ7AXlCv6LpSoXARyHWuNuIE+gJN0/9ywu6EwcjIM3l5DJ5mvwkXMAn9jawDHRyJKmdxQA3IiJgFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734642500; c=relaxed/simple;
	bh=p7WWEhhYSoB9EsyiZb7zkPmioP1Ghg8VnlGqhauZXHQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gsKh+eaXuwXcn9k/81ZpBZUs5gqBFyrlqVN6Xcd8yaFZTdyipep54seH/OQSqj/k2ovyiNY4p8bgwCZGEQ5zz2ortqWXvfKWGxa7RqcEfBYzAojbWNOLfOReSCT79eWoD7Sf5tYJ8wgtnc6SAUUnT0brB1SyQdtyFS334l1gas8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KKC2XYju; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-725cab4d72bso974616b3a.2
        for <linux-modules@vger.kernel.org>; Thu, 19 Dec 2024 13:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734642497; x=1735247297; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K9QWQProj0DRDekjJKvkceMs2crMPK7X9JqHuvPddMI=;
        b=KKC2XYjuSy0XsoY/oBy7mUHNHZTn8TeZV/niwAFTcU7EE/Hv1bG4dGQRTXvKzmDHMq
         ofMRlDLt6nTf/b1JPIfmktnRraGPaQNHTAeaJiB81RX+gyANGnpU+/ksHOv2WnQbrwRj
         xTp8yE7dBdcGT9KXeqcGY04tQSdrORkWwRkm0Zz3kOKOipTJjRuiD+5RpKHjvID2NQBD
         369XLs80+uM6R1JyY3usmkXfOL6jHcTjsY37pVkU40Z+3pBbEI673sx+ZId3S5xnluDK
         wfpABrdWM+mliXg32/RoliP88uVJqaES1qPGE4Oz6YJWd04OWt+WEynUIfhG/ginX34+
         Np7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734642497; x=1735247297;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K9QWQProj0DRDekjJKvkceMs2crMPK7X9JqHuvPddMI=;
        b=FOhttmtTWA+2wQV/F9svVtOJX38zhpJEFL/WiGX6qhUo1OcLndouSna12JgoTfEqju
         HOCmlqwOreU5yBJfue0QFIy+5wVa2Ldk6R4FU9tx4VCyTvHFbBmxgoJPzfGr5vwnK3U4
         vJDFKOU+Iyf0thfqa0GQ2SfzEOd7FjPPyaMIyfdtPjoskYrmyzOxmZ8ZQkXreXE3lr9f
         6gGMqZLCsPtMcNlzUqIhuSb4yGyHC6EqxmdFq6D9tpnf9k1LDnbBZsfvow639Zx8hLpJ
         XNXEIPN53d2yDYQbffCUI1omRXnQs99h33oZgV0aqIU2CnhdxIarDM5e1CVZB7LNBZhx
         7GMA==
X-Forwarded-Encrypted: i=1; AJvYcCUqUlhcvInU80KSSFEpnQzskCATtKcYdov94vE1ngS5EcmaubmBntvpMa+e11p3+nqL+VO2tFN2fmazR7zB@vger.kernel.org
X-Gm-Message-State: AOJu0YyoZVD/gxkd3XhK25NnEk/QPFO+WQalFGstTYM/979Bkez/M2qp
	mGKT/glzhfBeK5OqHkPsu6nk1qv+uLMIuZw/0BaENzFB0GMJ6QyS4UqOcudJ6vhXyH0QCpvq4zW
	/gOErhMBlrVw2jnn0i7uEKShA1g==
X-Google-Smtp-Source: AGHT+IGuKGndGRuHlhBBZFNCEbRkZFNy7qrppC6TOn/wTic9OAjDh2APD+XkcWOgBZYYA5gWeEtA9OnLhFZCfhA992o=
X-Received: from pfbeb15.prod.google.com ([2002:a05:6a00:4c8f:b0:728:e3af:6bb0])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1309:b0:725:e015:9082 with SMTP id d2e1a72fcca58-72abdd502d5mr301666b3a.5.1734642497599;
 Thu, 19 Dec 2024 13:08:17 -0800 (PST)
Date: Thu, 19 Dec 2024 21:07:54 +0000
In-Reply-To: <20241219210736.2990838-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241219210736.2990838-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=4688; i=samitolvanen@google.com;
 h=from:subject; bh=p7WWEhhYSoB9EsyiZb7zkPmioP1Ghg8VnlGqhauZXHQ=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOkp3YrpVpoOXc0C/cZ2+8v1jIQnyB/b0b27ZNIizpV2c
 8q4BUI6SlkYxDgYZMUUWVq+rt66+7tT6qvPRRIwc1iZQIYwcHEKwERmX2Vk2DE7Ylvq3KsTJy1l
 zavaxBBrqifvfyvyzrvs2wLaPw4tSmNkeDh9kRzr30s7lhfV/XskONuiWOm8qNJUfcVI+bUzlbq DmAE=
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241219210736.2990838-37-samitolvanen@google.com>
Subject: [PATCH v7 17/18] kbuild: Add gendwarfksyms as an alternative to genksyms
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

When MODVERSIONS is enabled, allow selecting gendwarfksyms as the
implementation, but default to genksyms.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 kernel/module/Kconfig  | 22 ++++++++++++++++++++++
 scripts/Makefile       |  2 +-
 scripts/Makefile.build | 35 +++++++++++++++++++++++++++++------
 3 files changed, 52 insertions(+), 7 deletions(-)

diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index 4637f063d0fc..d443fc504ffc 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -169,6 +169,22 @@ config MODVERSIONS
 	  make them incompatible with the kernel you are running.  If
 	  unsure, say N.
 
+choice
+	prompt "Module versioning implementation"
+	depends on MODVERSIONS
+	help
+	  Select the tool used to calculate symbol versions for modules.
+
+	  If unsure, select GENKSYMS.
+
+config GENKSYMS
+	bool "genksyms (from source code)"
+	help
+	  Calculate symbol versions from pre-processed source code using
+	  genksyms.
+
+	  If unsure, say Y.
+
 config GENDWARFKSYMS
 	bool "gendwarfksyms (from debugging information)"
 	depends on DEBUG_INFO
@@ -176,6 +192,12 @@ config GENDWARFKSYMS
 	depends on !DEBUG_INFO_REDUCED && !DEBUG_INFO_SPLIT
 	# Requires ELF object files.
 	depends on !LTO
+	help
+	  Calculate symbol versions from DWARF debugging information using
+	  gendwarfksyms. Requires DEBUG_INFO to be enabled.
+
+	  If unsure, say N.
+endchoice
 
 config ASM_MODVERSIONS
 	bool
diff --git a/scripts/Makefile b/scripts/Makefile
index d7fec46d38c0..8533f4498885 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -53,7 +53,7 @@ hostprogs += unifdef
 targets += module.lds
 
 subdir-$(CONFIG_GCC_PLUGINS) += gcc-plugins
-subdir-$(CONFIG_MODVERSIONS) += genksyms
+subdir-$(CONFIG_GENKSYMS) += genksyms
 subdir-$(CONFIG_GENDWARFKSYMS) += gendwarfksyms
 subdir-$(CONFIG_SECURITY_SELINUX) += selinux
 subdir-$(CONFIG_SECURITY_IPE) += ipe
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index c16e4cf54d77..81d9dacad03c 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -107,13 +107,24 @@ cmd_cpp_i_c       = $(CPP) $(c_flags) -o $@ $<
 $(obj)/%.i: $(obj)/%.c FORCE
 	$(call if_changed_dep,cpp_i_c)
 
+getexportsymbols = $(NM) $@ | sed -n 's/.* __export_symbol_\(.*\)/$(1)/p'
+
+gendwarfksyms = $(objtree)/scripts/gendwarfksyms/gendwarfksyms	\
+	$(if $(KBUILD_SYMTYPES), --symtypes $(@:.o=.symtypes))	\
+	$(if $(KBUILD_GENDWARFKSYMS_STABLE), --stable)
+
 genksyms = $(objtree)/scripts/genksyms/genksyms		\
 	$(if $(KBUILD_SYMTYPES), -T $(@:.o=.symtypes))	\
 	$(if $(KBUILD_PRESERVE), -p)			\
 	$(addprefix -r , $(wildcard $(@:.o=.symref)))
 
 # These mirror gensymtypes_S and co below, keep them in synch.
+ifdef CONFIG_GENDWARFKSYMS
+cmd_gensymtypes_c = $(if $(skip_gendwarfksyms),,	\
+	$(call getexportsymbols,\1) | $(gendwarfksyms) $@)
+else
 cmd_gensymtypes_c = $(CPP) -D__GENKSYMS__ $(c_flags) $< | $(genksyms)
+endif # CONFIG_GENDWARFKSYMS
 
 # LLVM assembly
 # Generate .ll files from .c
@@ -286,14 +297,26 @@ $(obj)/%.rs: $(obj)/%.rs.S FORCE
 # This is convoluted. The .S file must first be preprocessed to run guards and
 # expand names, then the resulting exports must be constructed into plain
 # EXPORT_SYMBOL(symbol); to build our dummy C file, and that gets preprocessed
-# to make the genksyms input.
+# to make the genksyms input or compiled into an object for gendwarfksyms.
 #
 # These mirror gensymtypes_c and co above, keep them in synch.
-cmd_gensymtypes_S =                                                         \
-   { echo "\#include <linux/kernel.h>" ;                                    \
-     echo "\#include <asm/asm-prototypes.h>" ;                              \
-     $(NM) $@ | sed -n 's/.* __export_symbol_\(.*\)/EXPORT_SYMBOL(\1);/p' ; } | \
-    $(CPP) -D__GENKSYMS__ $(c_flags) -xc - | $(genksyms)
+getasmexports =								\
+   { echo "\#include <linux/kernel.h>" ;				\
+     echo "\#include <linux/string.h>" ;				\
+     echo "\#include <asm/asm-prototypes.h>" ;				\
+     $(call getexportsymbols,EXPORT_SYMBOL(\1);) ; }
+
+ifdef CONFIG_GENDWARFKSYMS
+cmd_gensymtypes_S =							\
+	$(getasmexports) |						\
+	$(CC) $(c_flags) -c -o $(@:.o=.gendwarfksyms.o) -xc -;		\
+	$(call getexportsymbols,\1) |					\
+	$(gendwarfksyms) $(@:.o=.gendwarfksyms.o)
+else
+cmd_gensymtypes_S =							\
+	$(getasmexports) |						\
+	$(CPP) -D__GENKSYMS__ $(c_flags) -xc - | $(genksyms)
+endif # CONFIG_GENDWARFKSYMS
 
 quiet_cmd_cpp_s_S = CPP $(quiet_modtag) $@
 cmd_cpp_s_S       = $(CPP) $(a_flags) -o $@ $<
-- 
2.47.1.613.gc27f4b7a9f-goog


