Return-Path: <linux-modules+bounces-3762-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B22CAD22EF
	for <lists+linux-modules@lfdr.de>; Mon,  9 Jun 2025 17:49:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 830D73A33B8
	for <lists+linux-modules@lfdr.de>; Mon,  9 Jun 2025 15:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 233D521517C;
	Mon,  9 Jun 2025 15:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LTV1pVZp"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8976218A6A5
	for <linux-modules@vger.kernel.org>; Mon,  9 Jun 2025 15:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749484173; cv=none; b=urI3q38lrA82IBrs313c+fMJ/5APrN63teYVxgGUbP5i1j8iufZqqUGES+vZI3x30aXIFS2WLWS93dzr6/zp86ClcATe/XzRAdolRTsNkxj0plfKOUEFL7+cWOuKiTuKhSKJ17zhAwQcJ3pTI4qi6wnQ9KTbOhbQlXcxHZHlLp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749484173; c=relaxed/simple;
	bh=O16/i8ImN1omRqIDkVizfBKxq029hgU/VoUr9M+AMV4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=oYQqStVKbeyFboDzk6ug8Uqv73waMo5iqdbfC7aceR6E+QLWN/9IemoT3mgMoHkWZr3WVnp0Ax8fckyS3MHnipd4idWcQq1EfWH2LpZDLv0LmaK9MePBmFKCellv2LdcLAg8RKU/iKrztEIS/zBXXj9+jcldAFlhCNYTbJ70iic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LTV1pVZp; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b2fb347b3e6so641621a12.1
        for <linux-modules@vger.kernel.org>; Mon, 09 Jun 2025 08:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749484170; x=1750088970; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GbDXTAZxIXygNZLsCst7kpU0mT+2twAyV2birPGbUuE=;
        b=LTV1pVZpd7OAOhKmd1jfLcoQ/EA0VPa0tvaxCJ7K732qTLPQV+6pS0dpXHKtuE6CFa
         ZlO0ElWWkKHIsFe/rdWtr8gk4UbGtvKp1EkoRkREkqV/92daXLBawKqSh2rZOhzFo3q0
         MJzIljsNv325bTPJQL4ucAMvGKYtyzDDvKGjVXKT7EfIClsiMWOm11WfG732D0erVeZD
         GVdekJExKYJSQw87c7RE+E4SmdNU/l98ZYcuzttUSR81hSLeQNFz1NJgT8XrrQRISP8k
         5Lz9iL+nxIhIoTj2Y1NAxVH84w/GqoT91enekMgU4HdH7315WPwPLzTWvVaB3M9ORQvd
         eSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749484170; x=1750088970;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GbDXTAZxIXygNZLsCst7kpU0mT+2twAyV2birPGbUuE=;
        b=VktN2O/aetvzAw8AbvquicNWuTCvVKGvjKzJa7fUAsm/xdpy3743UVoKh5boTBFnDj
         KLvW4XSdU/J0jmfIT30Sl/w9qulVKC4JbtmA1GHMx8USrDa1JnkzgN9Fezcmu/L/Z2YX
         D/dKntTGwZL2JuBhyhnmBn1O+dwVGZyg3W+ExAd4mWpEAGVe0bJxyZxgi6kvgX3Z4CN5
         5Z+Czey2Bvhg2d1aisGUApOgAZ9YRaA2uI3oNH2Z8BYPI3NKytmMXkA1F7pNx6p625eu
         YnFM7H5yhFI8HSPkcEHU55y/nOdG8F90FamIHdw95Q7aN/7OKrIW9DsH96cF+AzZJaZE
         a0Wg==
X-Forwarded-Encrypted: i=1; AJvYcCVhJnFxner1Sr7DDCvzbHDRgqoBC+Vz0HbD5FTIxm8WJAoh9CQVj86O2YHC1Z0o7aDHsKeV2Xz6yF/miNHG@vger.kernel.org
X-Gm-Message-State: AOJu0YxTWtZX3EYgd5STbep5DuAehc1b4QyZ57tvEPbP+x9NH5zB5nTo
	Vv+i20ZSfVrPCErclUNUUgL09GpjrB9zai11LdtHSauluKIis1Ni4ojMIEVKi9zFK+zyjXEm8W+
	HMF/pqVV0Ms8sz9Ht3q7Ca9CRAKBgLQ==
X-Google-Smtp-Source: AGHT+IFrXkiR8WR8iG3nbOmJqUxBsjH3gTSS4afmh9YumbsXjLp04RKCNCIYb7Enm3IB8vOPOnUJONfHpnLgUPk2lAo=
X-Received: from pfbdw27.prod.google.com ([2002:a05:6a00:369b:b0:747:a8e8:603e])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:9203:b0:1f5:8622:5ed5 with SMTP id adf61e73a8af0-21ee24e1c1cmr23128880637.3.1749484169917;
 Mon, 09 Jun 2025 08:49:29 -0700 (PDT)
Date: Mon,  9 Jun 2025 15:49:27 +0000
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=4947; i=samitolvanen@google.com;
 h=from:subject; bh=O16/i8ImN1omRqIDkVizfBKxq029hgU/VoUr9M+AMV4=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDBnuTG2Xpn3ULs9iaeX6fGIX85sQl4Rttj6+Atx9574xM
 qX8ZN3ZUcrCIMbBICumyNLydfXW3d+dUl99LpKAmcPKBDKEgYtTACbyZCUjw/eYyw5Lr3l4F0rw
 7Dw31y/ntubxo15fE+5mGyxpEU05lc7wP3Lt/ZXTfKTy5m278shFOeD70azNMa/2SOUY3pf4ppD tzQYA
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250609154926.1237033-2-samitolvanen@google.com>
Subject: [PATCH] gendwarfksyms: Fix structure type overrides
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>, Giuliano Procida <gprocida@google.com>
Content-Type: text/plain; charset="UTF-8"

As we always iterate through the entire die_map when expanding
type strings, recursively processing referenced types in
type_expand_child() is not actually necessary. Furthermore,
the type_string kABI rule added in commit c9083467f7b9
("gendwarfksyms: Add a kABI rule to override type strings") can
fail to override type strings for structures due to a missing
kabi_get_type_string() check in this function.

Fix the issue by dropping the unnecessary recursion and moving
the override check to type_expand(). Note that symbol versions
are otherwise unchanged with this patch.

Fixes: c9083467f7b9 ("gendwarfksyms: Add a kABI rule to override type strings")
Reported-by: Giuliano Procida <gprocida@google.com>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/gendwarfksyms/types.c | 65 ++++++++++-------------------------
 1 file changed, 19 insertions(+), 46 deletions(-)

diff --git a/scripts/gendwarfksyms/types.c b/scripts/gendwarfksyms/types.c
index 39ce1770e463..7bd459ea6c59 100644
--- a/scripts/gendwarfksyms/types.c
+++ b/scripts/gendwarfksyms/types.c
@@ -333,37 +333,11 @@ static void calculate_version(struct version *version,
 	cache_free(&expansion_cache);
 }
 
-static void __type_expand(struct die *cache, struct type_expansion *type,
-			  bool recursive);
-
-static void type_expand_child(struct die *cache, struct type_expansion *type,
-			      bool recursive)
-{
-	struct type_expansion child;
-	char *name;
-
-	name = get_type_name(cache);
-	if (!name) {
-		__type_expand(cache, type, recursive);
-		return;
-	}
-
-	if (recursive && !__cache_was_expanded(&expansion_cache, cache->addr)) {
-		__cache_mark_expanded(&expansion_cache, cache->addr);
-		type_expansion_init(&child);
-		__type_expand(cache, &child, true);
-		type_map_add(name, &child);
-		type_expansion_free(&child);
-	}
-
-	type_expansion_append(type, name, name);
-}
-
-static void __type_expand(struct die *cache, struct type_expansion *type,
-			  bool recursive)
+static void __type_expand(struct die *cache, struct type_expansion *type)
 {
 	struct die_fragment *df;
 	struct die *child;
+	char *name;
 
 	list_for_each_entry(df, &cache->fragments, list) {
 		switch (df->type) {
@@ -379,7 +353,12 @@ static void __type_expand(struct die *cache, struct type_expansion *type,
 				error("unknown child: %" PRIxPTR,
 				      df->data.addr);
 
-			type_expand_child(child, type, recursive);
+			name = get_type_name(child);
+			if (name)
+				type_expansion_append(type, name, name);
+			else
+				__type_expand(child, type);
+
 			break;
 		case FRAGMENT_LINEBREAK:
 			/*
@@ -397,12 +376,17 @@ static void __type_expand(struct die *cache, struct type_expansion *type,
 	}
 }
 
-static void type_expand(struct die *cache, struct type_expansion *type,
-			bool recursive)
+static void type_expand(const char *name, struct die *cache,
+			struct type_expansion *type)
 {
+	const char *override;
+
 	type_expansion_init(type);
-	__type_expand(cache, type, recursive);
-	cache_free(&expansion_cache);
+
+	if (stable && kabi_get_type_string(name, &override))
+		type_parse(name, override, type);
+	else
+		__type_expand(cache, type);
 }
 
 static void type_parse(const char *name, const char *str,
@@ -416,8 +400,6 @@ static void type_parse(const char *name, const char *str,
 	if (!*str)
 		error("empty type string override for '%s'", name);
 
-	type_expansion_init(type);
-
 	for (pos = 0; str[pos]; ++pos) {
 		bool empty;
 		char marker = ' ';
@@ -478,7 +460,6 @@ static void type_parse(const char *name, const char *str,
 static void expand_type(struct die *cache, void *arg)
 {
 	struct type_expansion type;
-	const char *override;
 	char *name;
 
 	if (cache->mapped)
@@ -504,11 +485,7 @@ static void expand_type(struct die *cache, void *arg)
 
 	debug("%s", name);
 
-	if (stable && kabi_get_type_string(name, &override))
-		type_parse(name, override, &type);
-	else
-		type_expand(cache, &type, true);
-
+	type_expand(name, cache, &type);
 	type_map_add(name, &type);
 	type_expansion_free(&type);
 	free(name);
@@ -518,7 +495,6 @@ static void expand_symbol(struct symbol *sym, void *arg)
 {
 	struct type_expansion type;
 	struct version version;
-	const char *override;
 	struct die *cache;
 
 	/*
@@ -532,10 +508,7 @@ static void expand_symbol(struct symbol *sym, void *arg)
 	if (__die_map_get(sym->die_addr, DIE_SYMBOL, &cache))
 		return; /* We'll warn about missing CRCs later. */
 
-	if (stable && kabi_get_type_string(sym->name, &override))
-		type_parse(sym->name, override, &type);
-	else
-		type_expand(cache, &type, false);
+	type_expand(sym->name, cache, &type);
 
 	/* If the symbol already has a version, don't calculate it again. */
 	if (sym->state != SYMBOL_PROCESSED) {

base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


