Return-Path: <linux-modules+bounces-2780-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD289F868E
	for <lists+linux-modules@lfdr.de>; Thu, 19 Dec 2024 22:09:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57DE316B376
	for <lists+linux-modules@lfdr.de>; Thu, 19 Dec 2024 21:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7674D1F5402;
	Thu, 19 Dec 2024 21:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wjFr1nVt"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0641EE7A9
	for <linux-modules@vger.kernel.org>; Thu, 19 Dec 2024 21:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734642483; cv=none; b=sjg1TaDuk/Y4ZsvWEwg9wql3stQP9fmps2+dcEnXgBFXqfp+v+Zmwd21L8hD7pIoTWwIGoLTHFw+VX+0KycXwzITEAk+nxFNPkhDyNLGeLlg5sbWzoFC1sqzaBcB+XeXbXy0i/nG33dyIsC54do32VG3HBh3WyxEuZIwqzRiihA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734642483; c=relaxed/simple;
	bh=yrWG/DLfaIaAG3roJ/5utp+xwkOJf1qHLLIwHK3efLM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JW1SC73aWZszy8Ybksc6zdXi39JCcBUfIrDLOoXfs66cx95ZGxMeFdL9J0s91on+qxOOcw9hjehc4Z3CQZQAi5AzMl4m8YNm3FcOwoA1/b4xWL0YgVIavDg9U6xUU5JDqsS1UnTa69onZ+AB4oEIeFUqK7xuD3anjRuM4f4x0vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wjFr1nVt; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ef35de8901so1090221a91.3
        for <linux-modules@vger.kernel.org>; Thu, 19 Dec 2024 13:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734642480; x=1735247280; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FPHPHvsctuc5VzYf3oHMp0UrUbKfYCtMAQllWUKFUVU=;
        b=wjFr1nVtncfs4uZM0MGJ5JLqv3O+VmtTwRpr61vkTN3I1NuKsj/J9+oqmuWdP6P9k5
         EKB4/R9nKiCbfAg9sm/o4VgdcVWtImAO+GL10wIFiKrUGYYW6PNrNnU7vY4Yot2wColD
         XK5Iz0UD3kvnKvdCOnBgVrLQseFcmKysWhTCwFvwC7XP5x/mKqAeG1aa2tQDPJGio0TJ
         oJBzj4Ar8mB16w/G4TYNxEl3nZYH9EZxIUTI+GNK04RtB9y80ZBsJKEslzhPColQ9et5
         BuVukhWHCBJa57Sa3ky6hRe9j7ElxV3XOU71yu4n6Brjy8eAylnzu+SPfzRfBqTGRpl8
         wRBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734642480; x=1735247280;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FPHPHvsctuc5VzYf3oHMp0UrUbKfYCtMAQllWUKFUVU=;
        b=wOJ1QOkZ1skuAadQAHCRoIV6sT4C7UAV7x0YF1lMGM50287cD96JidKmL2/h+r4Ne8
         F40hkruQHx2nJncoQZYFNK4ElcVW13UXYwAgX7xnhkP/e/5UXjuzq6AlPZ3FgsKmIDR2
         09KLewNzv9YLCRCreenu2IGNybvx5R858QNHzGTaRQ844o9KcfSGbDi5G4D1LkT+ZGtr
         0HdjoO6HJwjlg7To3zfqoralsEdjGl3tEBgpP1HWJE8wWD7Ii/0PeoHmH4+voQetOoH5
         3QK3p+tpNs9v5mR/FN5i1O6HEuV9FvJk3oIJLpYdyNDjs44MPkuYrJoc459+pEf7+Cqe
         l+5w==
X-Forwarded-Encrypted: i=1; AJvYcCVX99R5GgTqBzgTnbYOL5BsM+YJDoWe1eTl2U/9thi2vssjENljA6lEepqPBMw+ueGj8X5o6dU22cZ/teYu@vger.kernel.org
X-Gm-Message-State: AOJu0YyTQi8u9idsd3RMzLVJ8OLDCbi9hrsekSV4wRKvfaHC+nnFfmuC
	wszUhkq4VNvSuwb8/7f3PZWJrotMeUQP0grnMjCQHJmfCqokmcxB6CtwRH0kYUvXkXFhrXMbaVN
	tXOpNLSfXRkkZZmReljNZkGsVQQ==
X-Google-Smtp-Source: AGHT+IFYCaPz9QbyJkzupiDNzS+0gKY6yj2ENaZGGGMbhbVCqclKJfeKJrrvON74WvgtKdmMMO0b1eaIO/DnhNkwtDY=
X-Received: from pjbtb3.prod.google.com ([2002:a17:90b:53c3:b0:2ef:6fb0:55fb])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2d4c:b0:2ee:c2b5:97a0 with SMTP id 98e67ed59e1d1-2f452ec290emr651742a91.25.1734642480608;
 Thu, 19 Dec 2024 13:08:00 -0800 (PST)
Date: Thu, 19 Dec 2024 21:07:43 +0000
In-Reply-To: <20241219210736.2990838-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241219210736.2990838-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5759; i=samitolvanen@google.com;
 h=from:subject; bh=yrWG/DLfaIaAG3roJ/5utp+xwkOJf1qHLLIwHK3efLM=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOkp3dLXypfvOnnVWfZ8SmhR2tXsyecXqs/a8KIlPa6Te
 fLxoJJjHaUsDGIcDLJiiiwtX1dv3f3dKfXV5yIJmDmsTCBDGLg4BWAii1gZ/qeKrjj4y/+h1T/r
 izPN7FYsCTq0P/Zv5Z6O0zv39rDO0N3K8If/29Wt2wv8eD35gm41/rzzUdH3eN3irK5Ed96wPXF GykwA
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241219210736.2990838-26-samitolvanen@google.com>
Subject: [PATCH v7 06/18] gendwarfksyms: Expand subroutine_type
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

Add support for expanding DW_TAG_subroutine_type and the parameters
in DW_TAG_formal_parameter. Use this to also expand subprograms.

Example output with --dump-dies:

  subprogram (
    formal_parameter pointer_type {
      const_type {
        base_type char byte_size(1) encoding(6)
      }
    }
  )
  -> base_type unsigned long byte_size(8) encoding(7)

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 scripts/gendwarfksyms/dwarf.c         | 84 ++++++++++++++++++++++++++-
 scripts/gendwarfksyms/gendwarfksyms.h |  4 ++
 2 files changed, 85 insertions(+), 3 deletions(-)

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 3e08a32b7b16..7d8a4eb6c387 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -212,6 +212,15 @@ DEFINE_PROCESS_UDATA_ATTRIBUTE(alignment)
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
@@ -224,19 +233,28 @@ int process_die_container(struct state *state, struct die *cache,
 	Dwarf_Die current;
 	int res;
 
+	/* Track the first item in lists. */
+	if (state)
+		state->first_list_item = true;
+
 	res = checkp(dwarf_child(die, &current));
 	while (!res) {
 		if (match(&current)) {
 			/* <0 = error, 0 = continue, >0 = stop */
 			res = checkp(func(state, cache, &current));
 			if (res)
-				return res;
+				goto out;
 		}
 
 		res = checkp(dwarf_siblingof(&current, &current));
 	}
 
-	return 0;
+	res = 0;
+out:
+	if (state)
+		state->first_list_item = false;
+
+	return res;
 }
 
 static int process_type(struct state *state, struct die *parent,
@@ -256,6 +274,40 @@ static void process_type_attr(struct state *state, struct die *cache,
 	process(cache, "base_type void");
 }
 
+static void process_list_comma(struct state *state, struct die *cache)
+{
+	if (state->first_list_item) {
+		state->first_list_item = false;
+	} else {
+		process(cache, " ,");
+		process_linebreak(cache, 0);
+	}
+}
+
+/* Comma-separated with DW_AT_type */
+static void __process_list_type(struct state *state, struct die *cache,
+				Dwarf_Die *die, const char *type)
+{
+	const char *name = get_name_attr(die);
+
+	process_list_comma(state, cache);
+	process(cache, type);
+	process_type_attr(state, cache, die);
+	if (name) {
+		process(cache, " ");
+		process(cache, name);
+	}
+}
+
+#define DEFINE_PROCESS_LIST_TYPE(type)                                       \
+	static void process_##type##_type(struct state *state,               \
+					  struct die *cache, Dwarf_Die *die) \
+	{                                                                    \
+		__process_list_type(state, cache, die, #type " ");           \
+	}
+
+DEFINE_PROCESS_LIST_TYPE(formal_parameter)
+
 /* Container types with DW_AT_type */
 static void __process_type(struct state *state, struct die *cache,
 			   Dwarf_Die *die, const char *type)
@@ -290,6 +342,29 @@ DEFINE_PROCESS_TYPE(shared)
 DEFINE_PROCESS_TYPE(volatile)
 DEFINE_PROCESS_TYPE(typedef)
 
+static void __process_subroutine_type(struct state *state, struct die *cache,
+				      Dwarf_Die *die, const char *type)
+{
+	process(cache, type);
+	process(cache, " (");
+	process_linebreak(cache, 1);
+	/* Parameters */
+	check(process_die_container(state, cache, die, process_type,
+				    match_formal_parameter_type));
+	process_linebreak(cache, -1);
+	process(cache, ")");
+	process_linebreak(cache, 0);
+	/* Return type */
+	process(cache, "-> ");
+	process_type_attr(state, cache, die);
+}
+
+static void process_subroutine_type(struct state *state, struct die *cache,
+				    Dwarf_Die *die)
+{
+	__process_subroutine_type(state, cache, die, "subroutine_type");
+}
+
 static void process_base_type(struct state *state, struct die *cache,
 			      Dwarf_Die *die)
 {
@@ -360,8 +435,11 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
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
@@ -391,7 +469,7 @@ static void process_symbol(struct state *state, Dwarf_Die *die,
 static int __process_subprogram(struct state *state, struct die *cache,
 				Dwarf_Die *die)
 {
-	process(cache, "subprogram");
+	__process_subroutine_type(state, cache, die, "subprogram");
 	return 0;
 }
 
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index 832d05b4fc1c..0746a36f4924 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -60,6 +60,7 @@ extern int dump_dies;
 #define checkp(expr) __check(expr, __res < 0)
 
 /* Consistent aliases (DW_TAG_<type>_type) for DWARF tags */
+#define DW_TAG_formal_parameter_type DW_TAG_formal_parameter
 #define DW_TAG_typedef_type DW_TAG_typedef
 
 /*
@@ -154,6 +155,9 @@ void die_map_free(void);
 struct state {
 	struct symbol *sym;
 	Dwarf_Die die;
+
+	/* List expansion */
+	bool first_list_item;
 };
 
 typedef int (*die_callback_t)(struct state *state, struct die *cache,
-- 
2.47.1.613.gc27f4b7a9f-goog


