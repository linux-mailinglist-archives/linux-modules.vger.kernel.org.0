Return-Path: <linux-modules+bounces-2622-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F83D9D6749
	for <lists+linux-modules@lfdr.de>; Sat, 23 Nov 2024 03:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9FC07B21B99
	for <lists+linux-modules@lfdr.de>; Sat, 23 Nov 2024 02:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93C7317BEBF;
	Sat, 23 Nov 2024 02:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iBlWZlT1"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BC316DEA9
	for <linux-modules@vger.kernel.org>; Sat, 23 Nov 2024 02:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732329745; cv=none; b=BEqQzysn8yKuah1HCocNWSPgKv7JmTGz7TvmzPilI9mqMWVERkyXX1nZVhUVVKBpOqolnnEX+jaMxmmF0NVvKe64Vq9pCrw/zZZjqJEdC0hZSyL2PuEHJEob4wR6X5VgTU17jJ9geY/YT9hXmZ4y/7AvHSomaVgGLUeKIwm/Ti4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732329745; c=relaxed/simple;
	bh=E70cW8Xw5ro15xoETh9JVhOPG/66AkkqX42fR6dpKnU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Vkf17I2yHsb0XNvurRcBJqD14/raHE0ouBkpfm2N2DqXNpUInedFnRK/FtqMBa77s7TcdrQgV4OmzkimBluWpaA41XdksAPM+PLnOUMRszbibRBVnY9oXgqeJaUyqS4cerPt+2XPX5qajRRAU1aMMkritG3PWl9lLRjQoEhg3cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iBlWZlT1; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6ee7ccc0286so48749387b3.2
        for <linux-modules@vger.kernel.org>; Fri, 22 Nov 2024 18:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732329742; x=1732934542; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qjZqp4IoL0KyqiTVwJH117KupI+sKpsSnEXGEf7A6k8=;
        b=iBlWZlT1K3bF85XreVwu8AHanu5rDlSBbuP9RdWD4b9cuUYG86llR8YTycHt7/cw3J
         y+7KlHhvmScfCF5xrd16aCr/B17t7mN+0rfQR+imXmS7FgOWXDrnV8QmVtb6xPuk7FcC
         tjjSJdKcqQpVMlCY1cJL9yo6Os2+CvwsUi+NoosFXjR7lpnixpIFTs7LTqxsYGJkdllW
         VINVpHnuOX93nLAKIq/zW4xoJFqYnYhlwJz9IAOXNHxaK9V3M8xtxzWIEDM6Eh1elEYH
         0myNU1wR7Oyo40TkJf1n3Bwsqih73HC3dKNKyHwOK5LJ15DZz5pv/f+R17o2+aPDXC8q
         4bVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732329742; x=1732934542;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qjZqp4IoL0KyqiTVwJH117KupI+sKpsSnEXGEf7A6k8=;
        b=MEjme8ugzC76PEaOVtUOLer9h+nul+c5erGjyPoPz55SRHUvWtyCOJCIAh/gzWhsXw
         5I53WO/JwtVfy0RS8jQOIPleBLNzXhiHbravhIvmsRdbu8G7R6WKPkYFMOB6EaX9f/lX
         9BCmpnDTnSJkCYxIr9V43xBlJvNPfnQ1qGCUXVUvT2dxSIRBYiDwa42TY0+aKep50dKq
         dvPbmK/f7m+TWB1NQtj2O7TGWQ6Gh/W2kavVerFQ6bCm1mXThI7rGufyNb0q3HUshxY5
         aLQv+NnpWd9tdsxaOpa/dVL3h72ahe6t6AAr1dJohYw7caY4HJJgE/WJiZzpoTjQ2pIw
         SHDg==
X-Forwarded-Encrypted: i=1; AJvYcCVVMebdBq1TrohjdnjtBf7Ben72S1yLn+LCBg8wrI5xB6YtxXmKo2RKUQXU6NQuGKnL0ZGJv6i2Y38Dvz0z@vger.kernel.org
X-Gm-Message-State: AOJu0YyTNIFH3KRE/S7VwDfCkskprcm6e5tHzxTnmRb5zse6q9Vk1LIv
	9wsaKML8qQ5KuXzwaI+BpdZUfmDSIU+cjq1pgYSpugH7uvn495Y3sejmWQKnkwZzj2b1RNXtoOz
	rftslOw==
X-Google-Smtp-Source: AGHT+IEYfeF7tWWhEOHN9DEuYSPktxzlkbMWxVRw/ZgbuKKnn0fgAzmvVNJdek/aWY1ojtQn6DCYmI3h6IPQ
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:2e90:b0:6e3:f32:5fc8 with SMTP id
 00721157ae682-6eee089340fmr281427b3.1.1732329742509; Fri, 22 Nov 2024
 18:42:22 -0800 (PST)
Date: Sat, 23 Nov 2024 02:42:17 +0000
In-Reply-To: <20241123-extended-modversions-v10-0-0fa754ffdee3@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241123-extended-modversions-v10-0-0fa754ffdee3@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20241123-extended-modversions-v10-3-0fa754ffdee3@google.com>
Subject: [PATCH v10 3/5] modules: Allow extended modversions without basic MODVERSIONS
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

If you know that your kernel modules will only ever be loaded by a newer
kernel, you can disable BASIC_MODVERSIONS to save space. This also
allows easy creation of test modules to seee how tooling will respond to
modules that only have the new format.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/Kconfig    | 15 +++++++++++++++
 scripts/Makefile.modpost |  1 +
 scripts/mod/modpost.c    | 19 +++++++++++--------
 3 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index a31c617cd67d3d66b24d2fba34cbd5cc9c53ab78..35545bc1d96016f95fe4e95e8876159a4a4d616d 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -218,6 +218,21 @@ config EXTENDED_MODVERSIONS
 	  The most likely reason you would enable this is to enable Rust
 	  support. If unsure, say N.
 
+config BASIC_MODVERSIONS
+	bool "Basic Module Versioning Support"
+	depends on MODVERSIONS
+	default MODVERSIONS
+	help
+	  This enables basic MODVERSIONS support, allowing older tools or
+	  kernels to potentially load modules.
+
+	  Disabling this may cause older `modprobe` or `kmod` to be unable
+	  to read MODVERSIONS information from built modules. With this
+	  disabled, older kernels may treat this module as unversioned.
+
+	  This is enabled by default when MODVERSIONS are enabled.
+	  If unsure, say Y.
+
 config MODULE_SRCVERSION_ALL
 	bool "Source checksum for all modules"
 	help
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 40426fc6350985780c0092beb49c6cc29b9eff62..d7d45067d08b94a82451d66a64eae29b6826e139 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -43,6 +43,7 @@ MODPOST = $(objtree)/scripts/mod/modpost
 modpost-args =										\
 	$(if $(CONFIG_MODULES),-M)							\
 	$(if $(CONFIG_MODVERSIONS),-m)							\
+	$(if $(CONFIG_BASIC_MODVERSIONS),-b)						\
 	$(if $(CONFIG_EXTENDED_MODVERSIONS),-x)						\
 	$(if $(CONFIG_MODULE_SRCVERSION_ALL),-a)					\
 	$(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)					\
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index bd38f33fd41fbd98bce34f8924b2fb0ac04297ee..ed52f9aa45a490bba706ffb2caa3e238e4697814 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -32,6 +32,8 @@ static bool module_enabled;
 static bool modversions;
 /* Is CONFIG_MODULE_SRCVERSION_ALL set? */
 static bool all_versions;
+/* Is CONFIG_BASIC_MODVERSIONS set? */
+static bool basic_modversions;
 /* Is CONFIG_EXTENDED_MODVERSIONS set? */
 static bool extended_modversions;
 /* If we are modposting external module set to 1 */
@@ -1836,10 +1838,8 @@ static void add_extended_versions(struct buffer *b, struct module *mod)
 		if (!s->module)
 			continue;
 		if (!s->crc_valid) {
-			/*
-			 * We already warned on this when producing the legacy
-			 * modversions table.
-			 */
+			warn("\"%s\" [%s.ko] has no CRC!\n",
+				s->name, mod->name);
 			continue;
 		}
 		buf_printf(b, "\t%#8x,\n", s->crc);
@@ -1853,8 +1853,8 @@ static void add_extended_versions(struct buffer *b, struct module *mod)
 			continue;
 		if (!s->crc_valid) {
 			/*
-			 * We already warned on this when producing the legacy
-			 * modversions table.
+			 * We already warned on this when producing the crc
+			 * table.
 			 * We need to skip its name too, as the indexes in
 			 * both tables need to align.
 			 */
@@ -1872,7 +1872,7 @@ static void add_versions(struct buffer *b, struct module *mod)
 {
 	struct symbol *s;
 
-	if (!modversions)
+	if (!basic_modversions)
 		return;
 
 	buf_printf(b, "\n");
@@ -2184,7 +2184,7 @@ int main(int argc, char **argv)
 	LIST_HEAD(dump_lists);
 	struct dump_list *dl, *dl2;
 
-	while ((opt = getopt(argc, argv, "ei:MmnT:to:au:WwENd:x")) != -1) {
+	while ((opt = getopt(argc, argv, "ei:MmnT:to:au:WwENd:xb")) != -1) {
 		switch (opt) {
 		case 'e':
 			external_module = true;
@@ -2233,6 +2233,9 @@ int main(int argc, char **argv)
 		case 'd':
 			missing_namespace_deps = optarg;
 			break;
+		case 'b':
+			basic_modversions = true;
+			break;
 		case 'x':
 			extended_modversions = true;
 			break;

-- 
2.47.0.371.ga323438b13-goog


