Return-Path: <linux-modules+bounces-2008-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 963B397F089
	for <lists+linux-modules@lfdr.de>; Mon, 23 Sep 2024 20:24:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0770EB2244C
	for <lists+linux-modules@lfdr.de>; Mon, 23 Sep 2024 18:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B6D41A7057;
	Mon, 23 Sep 2024 18:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JkGjtCWh"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7781A0B04
	for <linux-modules@vger.kernel.org>; Mon, 23 Sep 2024 18:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727115583; cv=none; b=kIBD3gK3Vu5VryiiENrF7CBYrc91Uut1PnNcw1abTwxtZrTZm4uU5Npm+pFXdFpnTCCgYDiyQpEh57JSopR5urohtIDRoCslCrG0cujYgIfwhG/meqq7eQoTnANtj9OEFpNhiRMnGysyj7kIm3g/qJOOEaOMe8QK0KfGoiWHYSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727115583; c=relaxed/simple;
	bh=+UvoU8FD7maTKGVExD/e4mqqBkqzCVeVz2B4x7Mcj68=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=f9egap7sKLTXO9vHDeuhufsPhR4neCTMLRGpKt/hnJM43WHh6tpw5qCI6zz8QcELiHEcswtQRXPLbgzkxWahrii1hZLDKuZlP2B8AVaNkqOeUauLQNafvHH0KrTmHWcMJRz/LqqeuzFFx1WFAFh9L7v2ADYe0OuhxEWlKULGnRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JkGjtCWh; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-71985781cbdso4330144b3a.3
        for <linux-modules@vger.kernel.org>; Mon, 23 Sep 2024 11:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727115578; x=1727720378; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wBp4ZQRSWGSz9WsZC/MJ1xrrw9uz490jpQ8iIOLHT0A=;
        b=JkGjtCWhd855rziKszRLB7HHDzJU/GUmn/sgvR6q7uL4YDYV9FfkWAbo3uRzHadslf
         fO/xBL0Fpt0YWA7jUV9yz1926UfYIU2Vd7QMWlVRoQG39zvBse2TC2LMlkUmj/yD2Q+s
         Rmn7wsdzcqjX9jd+gwLXouM95+OKDlJE95URQfhljiCNbBKhvb0T41RWzE+XaPSukesI
         I1lLNSvX1PMwTOOY88d3ssl+PIumjwZ+gmvYPlCD0VMIT0R6lL/AncxBAW5lALEQ3a+N
         wy/dFUKt5k5U5Tlayhem0b60TfuRucFxh7ZQfUsGKFU+4+ov0LyymrYQDtxXAYxgzEeF
         E6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727115578; x=1727720378;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wBp4ZQRSWGSz9WsZC/MJ1xrrw9uz490jpQ8iIOLHT0A=;
        b=NYFbu/+jeY8UBE2jDOY6Si1mXhV6i9de++IpsEtIvQZFAsN99IA9TW2i/PKoSAhrjf
         m5LLBOiG43a/D9KCWml2ZMKf5ayJHX7JGmiShdda/WlLesXp6jMRhSrN2Pb2uaLMZ67M
         fPff6yiZkxt4TOxyVj3mbDph0wcqXggwainS1uVrhB2lAvYOYtYSH37PrsNmGFQR1wlU
         GzZ8sl980W/dolCNuCcR+ll0MO5H/E0Fj6OQwkKz6R7t+rPy/3rrxPd6tj60035CNHW3
         IW4KstFqYR+7FaBPLy7gF8EcMC9mlf3+DFxf9ewhTPD3/7+HNKM2lJoklGNpcDEMpbNq
         FlDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtx+UnI73eYJO8pDMf4creW5gnNG3ZRmIZ2NwZA/vx88xNsf9FgHgApGRVgSTiEQfeeWikh5IFtp/l4r/X@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/OVZaGCytKPgAlhzJeQnHkD2jJy2wruvPFEANLEmg8jphFzj9
	7eoopgDmKuxr1pzPs6Mx6hhutS4Mlz+5ECILJjHqe9vAguMCsW1xuv6mx1AHEAd0diHpEbxJFP5
	kf7fK9itG/9QwkfEGnPMG33jgLg==
X-Google-Smtp-Source: AGHT+IEfhnnGFLNqxmlxpS6JZN5ZKd9QA3K4jtdAwTpy/rFImsyDZ7zzpRDe8/9I6s/nxiyGkzCR7eTK9rO2z27zOVg=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:6a00:4bb4:b0:717:8dee:d810 with
 SMTP id d2e1a72fcca58-7199ca6bbccmr18336b3a.5.1727115578261; Mon, 23 Sep 2024
 11:19:38 -0700 (PDT)
Date: Mon, 23 Sep 2024 18:19:04 +0000
In-Reply-To: <20240923181846.549877-22-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240923181846.549877-22-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2005; i=samitolvanen@google.com;
 h=from:subject; bh=+UvoU8FD7maTKGVExD/e4mqqBkqzCVeVz2B4x7Mcj68=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDGkfN/L/Wmu/+g6PmN/FR6lzFR3evt4qxfT64czd7z++U
 PviHLj6eEcpC4MYB4OsmCJLy9fVW3d/d0p99blIAmYOKxPIEAYuTgGYiOtThn/Gwc87+donpSpK
 T54afXBp1vx9axN6DiRFfDHJtZUR9GNl+O9Q6vCAdcklt4Xy0Q9mM03Z9l9n0u3ExGWfWeZ8uVD //QkrAA==
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240923181846.549877-40-samitolvanen@google.com>
Subject: [PATCH v3 18/20] export: Add __gendwarfksyms_ptr_ references to
 exported symbols
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

With gendwarfksyms, we need each TU where the EXPORT_SYMBOL() macro
is used to also contain DWARF type information for the symbols it
exports.  However, as a TU can also export external symbols and
compilers may choose not to emit debugging information for symbols not
defined in the current TU, the missing types will result in missing
symbol versions. Stand-alone assembly code also doesn't contain type
information for exported symbols, so we need to compile a temporary
object file with asm-prototypes.h instead, and similarly need to
ensure the DWARF in the temporary object file contains the necessary
types.

To always emit type information for external exports, add explicit
__gendwarfksyms_ptr_<symbol> references to them in EXPORT_SYMBOL().
gendwarfksyms will use the type information for __gendwarfksyms_ptr_*
if needed. Discard the pointers from the final binary to avoid further
bloat.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 include/linux/export.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/linux/export.h b/include/linux/export.h
index 0bbd02fd351d..cf71d3202e5b 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -52,9 +52,24 @@
 
 #else
 
+#ifdef CONFIG_GENDWARFKSYMS
+/*
+ * With CONFIG_GENDWARFKSYMS, ensure the compiler emits debugging
+ * information for all exported symbols, including those defined in
+ * different TUs, by adding a __gendwarfksyms_ptr_<symbol> pointer
+ * that's discarded during the final link.
+ */
+#define __GENDWARFKSYMS_EXPORT(sym)				\
+	static typeof(sym) *__gendwarfksyms_ptr_##sym __used	\
+		__section(".discard.gendwarfksyms") = &sym;
+#else
+#define __GENDWARFKSYMS_EXPORT(sym)
+#endif
+
 #define __EXPORT_SYMBOL(sym, license, ns)			\
 	extern typeof(sym) sym;					\
 	__ADDRESSABLE(sym)					\
+	__GENDWARFKSYMS_EXPORT(sym)				\
 	asm(__stringify(___EXPORT_SYMBOL(sym, license, ns)))
 
 #endif
-- 
2.46.0.792.g87dc391469-goog


