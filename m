Return-Path: <linux-modules+bounces-1711-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE59C95392D
	for <lists+linux-modules@lfdr.de>; Thu, 15 Aug 2024 19:41:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CB451F25CB9
	for <lists+linux-modules@lfdr.de>; Thu, 15 Aug 2024 17:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B55111BC081;
	Thu, 15 Aug 2024 17:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3GmBb4rc"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FB054656
	for <linux-modules@vger.kernel.org>; Thu, 15 Aug 2024 17:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723743570; cv=none; b=eI/h94PFLBH8QI57ocWQ9zhDet+Gf0uQcXOhd9H54zG//QASoydAcu8qNyOqCWJ6xSoABtrwB22hgIWJZOdeNU94xf29iFfqrfrQyqULVfJH3SCV3pDB23l5AHYVV+y+buTSNQzstUo9L/hwDcnkUlEEQ5Z0DPmu5dR0B0K6EGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723743570; c=relaxed/simple;
	bh=IxWZKsLfDtf9kxevQsdRvL9iAtwcYd0l83K436mpqAw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=W76eJCqBxTTCF2eVTiLSrI6/GetOMSlqf8VfbeOs2ukljqWKbLNbYBNW5VhB+zXAhXtxgv3iLxZarzcdhE6K+10PvKCLrSUVMNrYFMGkvemEkBM5ok+iRnQW3+euWMK1yDzhh5Iznk07ohs/4+OFQJlsSpRrnY0dzSk5/WDI+WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3GmBb4rc; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2d3baf38457so1313287a91.0
        for <linux-modules@vger.kernel.org>; Thu, 15 Aug 2024 10:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723743568; x=1724348368; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zfuqlaZpivgP61E8IUfDVjWbxuMIer3qaRAVkhI1EpI=;
        b=3GmBb4rc++vRWW/4KqKV9KTJWL3x6VLo/tP3ZfHIyt3SjWJy4o9mlP9T/odMErYMTC
         rLq7/uF4I1ziCckGX3kBjiQbgLfAfBYp4WSyqfppCdNKR//2lksivPJ1v0fJXXhREvWd
         npDqDCsiC6WMwXBWcmq0gjjWo+NXNFRnbyEM4jzg9eUV74FoZUfA8u4hw0zd/B48WtDC
         OmduN6GjtbJYmV79SIwJUtnKvnnsLytzkZgjkHQyPHiQPQfSu77a5wCctlAp/TVyo+jJ
         97NJ2bupphxEHtLdVz4dfYSO7r0w2RHJ7Nttq7j7ucgCe3ecb2D0Xrzbr2bSgmgn6gNx
         RSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723743568; x=1724348368;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zfuqlaZpivgP61E8IUfDVjWbxuMIer3qaRAVkhI1EpI=;
        b=Ah4gq/ZC3jq063r0SXg1iQOg7R08vRFZx5QrNU8R7nSLZruvvHsS+3tkiL4TW3JLtX
         M92wHEZBSAAPw02GOapUZlPvk+w774z9LOLl1eItmBiYvLKoFhgOggG0S2jNCGoCO+XC
         z8VVW6tbgIg9nEXVFH7F8o8GCVUTHvfUUNocggKeB6fkmtvXlSPukJeLC2QTGQ+JGiZk
         11ENu3vA1nBYliSXL8rQt3OVQQUk+Dhyx66xmlLT5KMWUWY37zSYXF6S4oO19FSHKdTN
         ebc7DXOFoNYWKNDcanbzAsx67LQ9pPksN09CedzqyvDGyTc8ri+D0p5S2xSlUerfe6SW
         IU5A==
X-Forwarded-Encrypted: i=1; AJvYcCWbaga7IkNT2ihQKkLj2qZmacQhYB5IUnIrP2vub2eL5S9ZZfvIeuAvjbfoOKB+qSdmuBl4uOT1PyMyJyckPOvDSZzTBViXn7Tyz3ylqg==
X-Gm-Message-State: AOJu0YxOroT1W6nx194Nbjoc9QjOGPmnl3BQXhoUqXAc3l59rFSC+BIw
	qyhVqCN4mvRuA/Y2CuybPte/PJZnyNlZ4ZPMpVPHfClj4j13lVYoKuFzN0GL5tQBAS+Jh+435VN
	WYD1zNhe2Dyn+JSZAZOXxD0qsbQ==
X-Google-Smtp-Source: AGHT+IFQfH4kooGic/QhjPlGgJQHvcaXF8cjadEJBNf7+K5TmqkgZbkyFvn+Yr2S6dOfoFZYy38IjvlUZRUzMCgrMbo=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:90a:d78e:b0:2d3:96b5:4940 with
 SMTP id 98e67ed59e1d1-2d3e20b22a9mr743a91.0.1723743567718; Thu, 15 Aug 2024
 10:39:27 -0700 (PDT)
Date: Thu, 15 Aug 2024 17:39:12 +0000
In-Reply-To: <20240815173903.4172139-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=4692; i=samitolvanen@google.com;
 h=from:subject; bh=IxWZKsLfDtf9kxevQsdRvL9iAtwcYd0l83K436mpqAw=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBmvj04GkWhb24TKJqKw4JVSD8OHepYkerwtLdQx
 qaACpYCrKWJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZr49OAAKCRBMtfaEi7xW
 7sWTDACcHTL9GfULRb2s9iLakapapeokqgn87VvgRoaESLeX4qLc/RanJQknVLtcLG6YhJp8RYv
 qRY2Rko4zoQCzFOWW8UPaaT4qc+mgEicvOfhMlLL8Rnw9kzYr5FSGz1n1Z8ALY0EsEOx3wtW/1k
 zuEpLF63tTCSLwE7scyHu2pF5B6aAhXbt427egI0quLd1Svj8a1D0fYSZKkb1F76YHEbiMGwyan
 JoIluQ0Fn9iFOzcXfVeGQWMlTF55oEKVU0lPOrtgtEdwL8o4aLUqI+UF9abnadVnptTuxVJ8WV9
 4u6bmfWXL6SXXQwMSDkHaE712B0M7EXa23aBV3cLpglNfnQXKvv7U3MgyjoYRDnbAHo40UMWKiR
 UMTWMR+DcoOXWQ14S0LaPEr+tsiuwpJCzBLwcUcmMkhrR0KPZI9l5OFCrMHaabH+r0+8NaARQpd dzycoPwoG+9DjaCujbi6uQFh4iPqACsslbf0N/X03KJOJcuZWkndB3IjqDwtl88LliXeg=
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240815173903.4172139-29-samitolvanen@google.com>
Subject: [PATCH v2 08/19] gendwarfksyms: Expand subroutine_type
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Add support for expanding DW_TAG_subroutine_type and the parameters
in DW_TAG_formal_parameter. Use this to also expand subprograms.

Example output with --debug:

  subprogram(
    formal_parameter base_type usize byte_size(8),
    formal_parameter base_type usize byte_size(8),
  )
  -> base_type void;

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/gendwarfksyms/dwarf.c         | 57 ++++++++++++++++++++++++++-
 scripts/gendwarfksyms/gendwarfksyms.h |  1 +
 2 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 82185737fa2a..c81652426be8 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -210,6 +210,15 @@ DEFINE_PROCESS_UDATA_ATTRIBUTE(alignment)
 DEFINE_PROCESS_UDATA_ATTRIBUTE(byte_size)
 DEFINE_PROCESS_UDATA_ATTRIBUTE(encoding)
 
+/* Match functions -- die_match_callback_t */
+#define DEFINE_MATCH(type)                                     \
+	static bool match_##type##_type(Dwarf_Die *die)        \
+	{                                                      \
+		return dwarf_tag(die) == DW_TAG_##type##_type; \
+	}
+
+DEFINE_MATCH(formal_parameter)
+
 bool match_all(Dwarf_Die *die)
 {
 	return true;
@@ -247,6 +256,25 @@ static int process_type_attr(struct state *state, struct die *cache,
 	return check(process(state, cache, "base_type void"));
 }
 
+/* Comma-separated with DW_AT_type */
+static int __process_list_type(struct state *state, struct die *cache,
+			       Dwarf_Die *die, const char *type)
+{
+	check(process(state, cache, type));
+	check(process_type_attr(state, cache, die));
+	check(process(state, cache, ","));
+	return check(process_linebreak(cache, 0));
+}
+
+#define DEFINE_PROCESS_LIST_TYPE(type)                                      \
+	static int process_##type##_type(struct state *state,               \
+					 struct die *cache, Dwarf_Die *die) \
+	{                                                                   \
+		return __process_list_type(state, cache, die, #type " ");   \
+	}
+
+DEFINE_PROCESS_LIST_TYPE(formal_parameter)
+
 /* Container types with DW_AT_type */
 static int __process_type(struct state *state, struct die *cache,
 			  Dwarf_Die *die, const char *type)
@@ -281,6 +309,29 @@ DEFINE_PROCESS_TYPE(shared)
 DEFINE_PROCESS_TYPE(volatile)
 DEFINE_PROCESS_TYPE(typedef)
 
+static int __process_subroutine_type(struct state *state, struct die *cache,
+				     Dwarf_Die *die, const char *type)
+{
+	check(process(state, cache, type));
+	check(process(state, cache, "("));
+	check(process_linebreak(cache, 1));
+	/* Parameters */
+	check(process_die_container(state, cache, die, process_type,
+				    match_formal_parameter_type));
+	check(process_linebreak(cache, -1));
+	check(process(state, cache, ")"));
+	process_linebreak(cache, 0);
+	/* Return type */
+	check(process(state, cache, "-> "));
+	return check(process_type_attr(state, cache, die));
+}
+
+static int process_subroutine_type(struct state *state, struct die *cache,
+				   Dwarf_Die *die)
+{
+	return check(__process_subroutine_type(state, cache, die,
+					       "subroutine_type"));
+}
 static int process_base_type(struct state *state, struct die *cache,
 			     Dwarf_Die *die)
 {
@@ -358,8 +409,11 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 	PROCESS_TYPE(rvalue_reference)
 	PROCESS_TYPE(shared)
 	PROCESS_TYPE(volatile)
+	/* Subtypes */
+	PROCESS_TYPE(formal_parameter)
 	/* Other types */
 	PROCESS_TYPE(base)
+	PROCESS_TYPE(subroutine)
 	PROCESS_TYPE(typedef)
 	default:
 		debug("unimplemented type: %x", tag);
@@ -379,7 +433,8 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
  */
 static int process_subprogram(struct state *state, Dwarf_Die *die)
 {
-	return check(process(state, NULL, "subprogram;\n"));
+	check(__process_subroutine_type(state, NULL, die, "subprogram"));
+	return check(process(state, NULL, ";\n"));
 }
 
 static int process_variable(struct state *state, Dwarf_Die *die)
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index e8b4da0fc9a8..25f87485eb69 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -59,6 +59,7 @@ extern bool debug;
 #define checkp(expr) __check(expr, __res < 0, __res)
 
 /* Consistent aliases (DW_TAG_<type>_type) for DWARF tags */
+#define DW_TAG_formal_parameter_type DW_TAG_formal_parameter
 #define DW_TAG_typedef_type DW_TAG_typedef
 
 /*
-- 
2.46.0.184.g6999bdac58-goog


