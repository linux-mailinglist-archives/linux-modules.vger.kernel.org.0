Return-Path: <linux-modules+bounces-188-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A76C7E4EE2
	for <lists+linux-modules@lfdr.de>; Wed,  8 Nov 2023 03:28:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C0911C20D94
	for <lists+linux-modules@lfdr.de>; Wed,  8 Nov 2023 02:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B835BED2;
	Wed,  8 Nov 2023 02:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sCmUhvrN"
X-Original-To: linux-modules@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F19A4F
	for <linux-modules@vger.kernel.org>; Wed,  8 Nov 2023 02:27:55 +0000 (UTC)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5D8F10F8
	for <linux-modules@vger.kernel.org>; Tue,  7 Nov 2023 18:27:54 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-da04776a869so6504166276.0
        for <linux-modules@vger.kernel.org>; Tue, 07 Nov 2023 18:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699410474; x=1700015274; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=j+pXCzJsltO32Q6Q6QKytaM4r4O4ehr4GGX/b31TdaA=;
        b=sCmUhvrNpDzPvwfh8RXHn+9yWDq50A6xSMsWdxAJI7IiczvMBtv0jmW5ILjOzLbW5P
         Gw1dXMLJmyeUFBF23SORgYdvH8k2tg6IF7fr0oZk7oB2oADwupiVqg4ZwreU4UCCZpi3
         vw3hkSdyklMFS+h21jiab7GCp5cuft82X8W+PJ3Th6GrhXKDi4T8nQe0+ESwGZurE6Ep
         kwX14C40DYRgu/QC28UQktSn7MiWKJETWqVyYRNNqJhXUcWAUCIVZ76vK8UoXwtVOSuQ
         pZ+FOy5DYKvDKTkakDE0wAfrwiIceAro0CGzULyIuDi4R4YeuXIJ3ixTsSoT+3Bmq/te
         CdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699410474; x=1700015274;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j+pXCzJsltO32Q6Q6QKytaM4r4O4ehr4GGX/b31TdaA=;
        b=lFGRD9kqpqZsrsWKa9LPZJh5idvs3r/hSiQqWlE6p/iCBQh3cmKWkinP9GYARXr00e
         9N1vGkIU/UvoqnbIiABdhd94bHcTQC4IzYKHGWBxt63ieRYkAmisyrsIHHildhUVIPOn
         7xHskrSLc9dKFyaOn9HM4DFjf6XcFLp42kZEO8enFSnOPOSVf5J2XKeSEUTkiSq4iJ2f
         7PU0QDTxzf3UHHWVsbinjrqUUQt/81I3OKZCcdlhxa27LfPKY2bD9T0gESOlonx4jMV1
         H/KYo9NYXlKuUeURmTNKblhW2eh6+bkLckNRSYqR1MHJsq6MjxQRL/8RnP5chUcKH/fK
         4Ptg==
X-Gm-Message-State: AOJu0YxuGNVgUzHPIeQusKRMftqi5QqE9GJoHgUVv64mEXB1N1hCzKzV
	h5z4rVlP4/btI7Rbq9GvO7OVvcYrvmHp
X-Google-Smtp-Source: AGHT+IEStJ9CSqrdAUJC0EXXJkXE33qO2K7wb06zQcU3w37tWljEEI+W9gKdDO6RYrRaincap25EZASrHFME
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:102:b0:da3:723b:b2a4 with SMTP id
 o2-20020a056902010200b00da3723bb2a4mr8048ybh.7.1699410474120; Tue, 07 Nov
 2023 18:27:54 -0800 (PST)
Date: Wed,  8 Nov 2023 02:26:25 +0000
In-Reply-To: <20231108022651.645950-2-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231108022651.645950-2-mmaurer@google.com>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
Message-ID: <20231108022651.645950-6-mmaurer@google.com>
Subject: [PATCH 3/3] rust: Require RUST_MODULES for module support
From: Matthew Maurer <mmaurer@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	John Ogness <john.ogness@linutronix.de>, Randy Dunlap <rdunlap@infradead.org>, 
	Matthew Maurer <mmaurer@google.com>, Zhen Lei <thunder.leizhen@huawei.com>, 
	Nhat Pham <nphamcs@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Marc=20Aur=C3=A8le=20La=20France?=" <tsi@tuyoix.net>
Cc: linux-kbuild@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Currently, we don't support MODVERSIONS for Rust symbols. For users that
want to use Rust in the kernel but for whom MODVERSIONS is required,
this allows the use of built-in Rust code even with MODVERSIONS enabled.
It may additionally allow code-size reduction by avoiding exporting
symbols that won't be used without Rust modules.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 init/Kconfig          | 21 +++++++++++++++++----
 kernel/module/Kconfig |  1 +
 rust/exports.c        |  4 ++++
 3 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index 9ffb103fc927..6912dbbee3f1 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1885,7 +1885,6 @@ config RUST
 	bool "Rust support"
 	depends on HAVE_RUST
 	depends on RUST_IS_AVAILABLE
-	depends on !MODVERSIONS
 	depends on !GCC_PLUGINS
 	depends on !RANDSTRUCT
 	depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
@@ -1896,13 +1895,27 @@ config RUST
 	  This allows other Rust-related options, like drivers written in Rust,
 	  to be selected.
 
-	  It is also required to be able to load external kernel modules
-	  written in Rust.
-
 	  See Documentation/rust/ for more information.
 
 	  If unsure, say N.
 
+config RUST_MODULES
+	bool "Rust Module Support"
+	depends on RUST
+	depends on MODULES
+	rust_modules
+	help
+	  Enables support for Rust Modules in the kernel.
+
+	  This is required to load external kernel modules written in Rust.
+
+	  The two primary reasons to consider disabling this are:
+	  * Allow MODVERSIONS support
+	  * Allow additional code to be optimized out by the compiler if you
+	    know that you'll only be using built-in Rust code.
+
+	  If unsure, say Y.
+
 config RUSTC_VERSION_TEXT
 	string
 	depends on RUST
diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index 0ea1b2970a23..a76128887618 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -158,6 +158,7 @@ config MODULE_UNLOAD_TAINT_TRACKING
 	  shown. If unsure, say N.
 
 config MODVERSIONS
+	depends on !RUST_MODULES
 	bool "Module versioning support"
 	help
 	  Usually, you have to use modules compiled with your kernel.
diff --git a/rust/exports.c b/rust/exports.c
index 83e2a7070cae..96b706048ed4 100644
--- a/rust/exports.c
+++ b/rust/exports.c
@@ -13,7 +13,11 @@
 
 #include <linux/module.h>
 
+#ifdef CONFIG_RUST_MODULES
 #define EXPORT_SYMBOL_RUST_GPL(sym) extern int sym; EXPORT_SYMBOL_GPL(sym)
+#else
+#define EXPORT_SYMBOL_RUST_GPL(sym)
+#endif
 
 #include "exports_core_generated.h"
 #include "exports_alloc_generated.h"
-- 
2.42.0.869.gea05f2083d-goog


