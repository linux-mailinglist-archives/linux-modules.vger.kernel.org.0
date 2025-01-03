Return-Path: <linux-modules+bounces-2913-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CABCA00EED
	for <lists+linux-modules@lfdr.de>; Fri,  3 Jan 2025 21:46:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E14BE3A4818
	for <lists+linux-modules@lfdr.de>; Fri,  3 Jan 2025 20:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A941B1BFE0C;
	Fri,  3 Jan 2025 20:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xQkU5JDg"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CF71C07DC
	for <linux-modules@vger.kernel.org>; Fri,  3 Jan 2025 20:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735937144; cv=none; b=toq8yNebhQ4RJPu1f2Q7nb5z1jcZbM3I0bAo+pVcJuNf6EwqOmIyOIB5GyNuF9ndJTwHEFYC9F+x+zwwsmQ6acyqREtOuT3Gr3h2BqPXzHP3TvS0W2ucKjVx7GPOhl/U33Q6843MZLNOC3PHpA2+EfkBnArjtFfQjc1ncjFyxHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735937144; c=relaxed/simple;
	bh=bbCvhhmVnhtTYpDrJYZHLEm7Ii+2fqEhxzWaIoSVp4g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ENmLsKUQs18aD5Z+kjinWzMlUfoK8DT31clp9XrRSgCP4Cj9BnsZA45KXGkV8TZ6MrgksTNFk8E8PMRyWUwCzkVhveSTsqr/uanW7r+RaV2/vvBNHgZiMnA7S0Sf+2ZCEbJVwEe7L1LK5E29Fvv2nAnVsgWzNkLxJADx3DBPhDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xQkU5JDg; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ee9f66cb12so17867420a91.1
        for <linux-modules@vger.kernel.org>; Fri, 03 Jan 2025 12:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735937140; x=1736541940; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iqmGG67x42YJFJgNp9m9MGLgkL+XEQeNfXKJAnh+SAA=;
        b=xQkU5JDgw2j5zPRMIYmbbNqvrCtFvUPfIkRsnXM9fkHeLA05VNUagpVBw1FdvNSSLM
         1D+zLBC/iAUt1vd0x2Mol7U3fg+YNMYvLjJxnHg1lII+OwDcorxbtyqoLNgWKEuvkrx1
         KzCiOFYtBJjsQTJT5glv3IwHx8WS48q9OOmtn8nr0T6pytj+rJS43L7zA/bigXWPfzfB
         83hNrrfOggaVcSXPzrwFHnPlXamqMaIDaM7+Gie1+oGyl69gFHog6uSRec0ZblLO94O8
         dxICCl37dhw8cqyymgBuy/zbnbxf64icSU+4Jknp+5MJmaMvx21KfY/mghUvmS09nj9e
         mhww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735937140; x=1736541940;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iqmGG67x42YJFJgNp9m9MGLgkL+XEQeNfXKJAnh+SAA=;
        b=AZ2LzU/S3i0wD3uEeoSwqQKLPidN3Xvvyf/xg8EaA+eOINVYk4WvCyTocf6Pn9MfVr
         PDXpBQzlA5PhN+XCSZ3nfTx9KuE5gQFDveVdRnVEvEOPEMTRa2Rv6eBZ43vzLCSbtDqo
         iYQ0jDtcCEtV3RYnkpl5EDb/slYoqzr4nZqjS7g+3Qa52PkbL8eP7fxCeu5fm0XHkxVJ
         XUQAOQZIkcqJEqloMhQf+T6RqG1aiogS7OptcqQ+Vsoj7Oa5RqzRkn5/PfRtpZfQVffS
         Zs5QFyeTBq39gggSoUh3CkGJWktWJaTDeqo/O8CceqvcoGOwsV5DPpKyqkAlQ3YXPsBe
         LD/g==
X-Forwarded-Encrypted: i=1; AJvYcCWoLqHv4iSpkr0KrockFB2PdeE4d4i4f0gpZUduO5WZnTm5vE4qR/+p/TGKI/8ELMXPRsh2vp+PB3DjmOH6@vger.kernel.org
X-Gm-Message-State: AOJu0YwZbBa2G0WUjwlnsSjZqr4e1swRRSH2onnhdJq+O+92R7JuKnXg
	ZDoCdXx1X3XcUZQ6jfGUCM/Hh1yArn4h+MHDKgfS5pdHBjqL1QhIk2kj8ugYxW/eaeu/uEfgj6W
	2clARZdbJu51hxtLV+bJvbEA1Tw==
X-Google-Smtp-Source: AGHT+IFXuddT1SniC3vu76OSSXgxaFfdEk00k+prIDU00wwVEv734y9dgvX4z9j1gZ0FQwj6ZmzHyp0XlhJpFeFnFNc=
X-Received: from pfbby11.prod.google.com ([2002:a05:6a00:400b:b0:71e:4dee:9d6b])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:392a:b0:71e:1722:d019 with SMTP id d2e1a72fcca58-72abdeb7326mr74813102b3a.22.1735937140123;
 Fri, 03 Jan 2025 12:45:40 -0800 (PST)
Date: Fri,  3 Jan 2025 20:45:25 +0000
In-Reply-To: <20250103204521.1885406-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250103204521.1885406-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5405; i=samitolvanen@google.com;
 h=from:subject; bh=bbCvhhmVnhtTYpDrJYZHLEm7Ii+2fqEhxzWaIoSVp4g=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOkVPsmTOfLeOSXc/yAtcG3KRvG375YYlxx89vqYa396Q
 3azF9fhjlIWBjEOBlkxRZaWr6u37v7ulPrqc5EEzBxWJpAhDFycAjARg1aGfxqTV60rutuYsoaB
 8Vo283XPdyv+hx/XvztLJ3VZCdvBn08Y/te9qVz5j++Wn4jAS4FNnxVmL69ISr+xddpPp7sBa61 M8tkA
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250103204521.1885406-23-samitolvanen@google.com>
Subject: [PATCH v8 03/18] gendwarfksyms: Expand base_type
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

Start making gendwarfksyms more useful by adding support for
expanding DW_TAG_base_type types and basic DWARF attributes.

Example:

  $ echo loops_per_jiffy | \
      scripts/gendwarfksyms/gendwarfksyms \
        --debug --dump-dies vmlinux.o
  ...
  gendwarfksyms: process_symbol: loops_per_jiffy
  variable base_type unsigned long byte_size(8) encoding(7)
  ...

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 scripts/gendwarfksyms/dwarf.c | 160 ++++++++++++++++++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 81df3e2ad3ae..74e75b8ec891 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -3,8 +3,21 @@
  * Copyright (C) 2024 Google LLC
  */
 
+#include <inttypes.h>
+#include <stdarg.h>
 #include "gendwarfksyms.h"
 
+#define DEFINE_GET_ATTR(attr, type)                                    \
+	static bool get_##attr##_attr(Dwarf_Die *die, unsigned int id, \
+				      type *value)                     \
+	{                                                              \
+		Dwarf_Attribute da;                                    \
+		return dwarf_attr(die, id, &da) &&                     \
+		       !dwarf_form##attr(&da, value);                  \
+	}
+
+DEFINE_GET_ATTR(udata, Dwarf_Word)
+
 static bool get_ref_die_attr(Dwarf_Die *die, unsigned int id, Dwarf_Die *value)
 {
 	Dwarf_Attribute da;
@@ -67,6 +80,109 @@ static void process(const char *s)
 		fputs(s, stderr);
 }
 
+#define MAX_FMT_BUFFER_SIZE 128
+
+static void process_fmt(const char *fmt, ...)
+{
+	char buf[MAX_FMT_BUFFER_SIZE];
+	va_list args;
+
+	va_start(args, fmt);
+
+	if (checkp(vsnprintf(buf, sizeof(buf), fmt, args)) >= sizeof(buf))
+		error("vsnprintf overflow: increase MAX_FMT_BUFFER_SIZE");
+
+	process(buf);
+	va_end(args);
+}
+
+#define MAX_FQN_SIZE 64
+
+/* Get a fully qualified name from DWARF scopes */
+static char *get_fqn(Dwarf_Die *die)
+{
+	const char *list[MAX_FQN_SIZE];
+	Dwarf_Die *scopes = NULL;
+	bool has_name = false;
+	char *fqn = NULL;
+	char *p;
+	int count = 0;
+	int len = 0;
+	int res;
+	int i;
+
+	res = checkp(dwarf_getscopes_die(die, &scopes));
+	if (!res) {
+		list[count] = get_name_attr(die);
+
+		if (!list[count])
+			return NULL;
+
+		len += strlen(list[count]);
+		count++;
+
+		goto done;
+	}
+
+	for (i = res - 1; i >= 0 && count < MAX_FQN_SIZE; i--) {
+		if (dwarf_tag(&scopes[i]) == DW_TAG_compile_unit)
+			continue;
+
+		list[count] = get_name_attr(&scopes[i]);
+
+		if (list[count]) {
+			has_name = true;
+		} else {
+			list[count] = "<anonymous>";
+			has_name = false;
+		}
+
+		len += strlen(list[count]);
+		count++;
+
+		if (i > 0) {
+			list[count++] = "::";
+			len += 2;
+		}
+	}
+
+	free(scopes);
+
+	if (count == MAX_FQN_SIZE)
+		warn("increase MAX_FQN_SIZE: reached the maximum");
+
+	/* Consider the DIE unnamed if the last scope doesn't have a name */
+	if (!has_name)
+		return NULL;
+done:
+	fqn = xmalloc(len + 1);
+	*fqn = '\0';
+
+	p = fqn;
+	for (i = 0; i < count; i++)
+		p = stpcpy(p, list[i]);
+
+	return fqn;
+}
+
+static void process_fqn(Dwarf_Die *die)
+{
+	process(" ");
+	process(get_fqn(die) ?: "");
+}
+
+#define DEFINE_PROCESS_UDATA_ATTRIBUTE(attribute)                           \
+	static void process_##attribute##_attr(Dwarf_Die *die)              \
+	{                                                                   \
+		Dwarf_Word value;                                           \
+		if (get_udata_attr(die, DW_AT_##attribute, &value))         \
+			process_fmt(" " #attribute "(%" PRIu64 ")", value); \
+	}
+
+DEFINE_PROCESS_UDATA_ATTRIBUTE(alignment)
+DEFINE_PROCESS_UDATA_ATTRIBUTE(byte_size)
+DEFINE_PROCESS_UDATA_ATTRIBUTE(encoding)
+
 bool match_all(Dwarf_Die *die)
 {
 	return true;
@@ -93,6 +209,49 @@ int process_die_container(struct state *state, Dwarf_Die *die,
 	return 0;
 }
 
+static int process_type(struct state *state, Dwarf_Die *die);
+
+static void process_type_attr(struct state *state, Dwarf_Die *die)
+{
+	Dwarf_Die type;
+
+	if (get_ref_die_attr(die, DW_AT_type, &type)) {
+		check(process_type(state, &type));
+		return;
+	}
+
+	/* Compilers can omit DW_AT_type -- print out 'void' to clarify */
+	process("base_type void");
+}
+
+static void process_base_type(struct state *state, Dwarf_Die *die)
+{
+	process("base_type");
+	process_fqn(die);
+	process_byte_size_attr(die);
+	process_encoding_attr(die);
+	process_alignment_attr(die);
+}
+
+#define PROCESS_TYPE(type)                         \
+	case DW_TAG_##type##_type:                 \
+		process_##type##_type(state, die); \
+		break;
+
+static int process_type(struct state *state, Dwarf_Die *die)
+{
+	int tag = dwarf_tag(die);
+
+	switch (tag) {
+	PROCESS_TYPE(base)
+	default:
+		debug("unimplemented type: %x", tag);
+		break;
+	}
+
+	return 0;
+}
+
 /*
  * Exported symbol processing
  */
@@ -119,6 +278,7 @@ static void process_subprogram(struct state *state, Dwarf_Die *die)
 static int __process_variable(struct state *state, Dwarf_Die *die)
 {
 	process("variable ");
+	process_type_attr(state, die);
 	return 0;
 }
 
-- 
2.47.1.613.gc27f4b7a9f-goog


