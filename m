Return-Path: <linux-modules+bounces-2790-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBE09F86AD
	for <lists+linux-modules@lfdr.de>; Thu, 19 Dec 2024 22:13:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EDCC16943B
	for <lists+linux-modules@lfdr.de>; Thu, 19 Dec 2024 21:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0FA202C50;
	Thu, 19 Dec 2024 21:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DBTjqzFB"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD631FF1D6
	for <linux-modules@vger.kernel.org>; Thu, 19 Dec 2024 21:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734642499; cv=none; b=AmIj6hhwr9M4+FkU69c9gfYqDjAhMhhOHypf5jyNjYzOKgqZFy2W740fS5qr2N3aibRzvVBg4FMgmB4VmXD6TEGrZhl1TB9jXKyklzYNhDsOOwt0nzzuo+FbZttXql6IkOmymsgDSbF7dlQXiyVqUAr8hEewHp62b2fEZ9DJhvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734642499; c=relaxed/simple;
	bh=G8T+NnXPkjDtKGjHLSfjrDpCNmmPfEyUeqSk1ZhBztg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FtnPtiMpPjXZHiF/UZ1LO30mWcXARm1LzVW2HVUSIXnfXZ2eaNbunU+NG/ocxWhI8bnu0VfJlqPG3ueADMbG4mAvOeYp9njwkNBxixMku9laExJ+SlLoaS2em2BKPQvU9zlmts911i1q/tdr69uZYKt0buNs7PxZpOJvsdHIG40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DBTjqzFB; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-7ea69eeb659so782472a12.0
        for <linux-modules@vger.kernel.org>; Thu, 19 Dec 2024 13:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734642496; x=1735247296; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XhebaHvwRpIK3ajuqUsaMJY6c1H8vjbSZoFxdXzqCTY=;
        b=DBTjqzFB9cUlXBv+JhaOM3TbZRs+CLHHWMir38Pm7DMPiIUog5czwtL9iYxrCPWfpC
         y+YvPjXxTQRL0sMlBckBNSkiPNL7GqDnSOzR3Svr9CKlXU4FGQNzx55iHTBNn2DRcQni
         mA0d5W2sBwGzoFMuxMHRcf3yTCxzcvar5KSos9a5fZDVjFRp0r84KleayRgX4MiZTBFE
         i1XUnrDZ2DtbRXekJGcK8CFsHxgsmrfO3zxJNrOj6JtPiFQIRgKoD3juwdQMOynaao9y
         tUkvUVzzMTNdclFxg9BIVx2cb43Ls8mXC/PgqjNidJU8vea3zeiyM9FSJ1YpcMuX+GE5
         FLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734642496; x=1735247296;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XhebaHvwRpIK3ajuqUsaMJY6c1H8vjbSZoFxdXzqCTY=;
        b=wHbwq9OhiGxULxMuxPxJFwipENQSkYi4YrxHD7zZb7LiWP14f0UUDUFcAx+32iC24f
         AAOsGNIx7ft9kdkdhvmVhxAm2FkO79ixqVFFMvsrk5Rdu4J2RDVkc7Ou+rlI5GAlbrgN
         4xQfXTgc5hblYaI+1dEM/CFKN+igRDWP1/BtYsptc+YyI+YOzSm572/oxHuXQZRGuWLG
         6g+O4m9Lo9PACLk1FBDZZ3rZf4KAgMFZKhaBWjcjNcPpquarWuxXgWFsbe6SRsm2St63
         d4aaer7spFcVVo2YygjuNWPo/wswcNGjPEORvjqPFQa3JCNNgrm3eqqETu08vchaYdjP
         KOlw==
X-Forwarded-Encrypted: i=1; AJvYcCVNZFmW50nhmPs3yCoTlBjxpjECbR6rjT+RFPrSSGcwEkCp+XUcWGzAICLV62GdJOONQIGLm/Ri7MzaAKFF@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwci4z8UofPmmCUlEINOMjhXMoFhPMrR6g7YkOJNk31ZD5QVVf
	6k8FEGYUgFZrqm9rPBUAq2Icd9isYDJSR2GIeRf5rPzD/htvbehAzWAgfGAiTJxvB1u/gwZFrsV
	eWy9m/gZzNEECH25JLv0ESg0w9A==
X-Google-Smtp-Source: AGHT+IFhC4Ah0P2LpeeGNVWwyHAZfHL11yB3Qlfn6u2eyEw2X2bDrlrkxGMrpOMsrenz4F16xpWQ4hhDijC681Gi99s=
X-Received: from pjbsc15.prod.google.com ([2002:a17:90b:510f:b0:2da:ac73:93e0])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2744:b0:2ee:d7d3:3008 with SMTP id 98e67ed59e1d1-2f452e205b2mr861955a91.12.1734642495981;
 Thu, 19 Dec 2024 13:08:15 -0800 (PST)
Date: Thu, 19 Dec 2024 21:07:53 +0000
In-Reply-To: <20241219210736.2990838-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241219210736.2990838-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2005; i=samitolvanen@google.com;
 h=from:subject; bh=G8T+NnXPkjDtKGjHLSfjrDpCNmmPfEyUeqSk1ZhBztg=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOkp3YrdtVHhySouOkF7m0o/qbT80J9sEuBUNadufYapv
 7naryUdpSwMYhwMsmKKLC1fV2/d/d0p9dXnIgmYOaxMIEMYuDgFYCL6mYwMC8QNvC5Va/C6soQc
 2nND0fFj1mrj2OxZJ382S7zpEX4XwfBPU+d02AeenJOZBg++HOXPnffloVHvtx28p1rmeYb8rvz ACAA=
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241219210736.2990838-36-samitolvanen@google.com>
Subject: [PATCH v7 16/18] export: Add __gendwarfksyms_ptr_ references to
 exported symbols
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
index 2633df4d31e6..a8c23d945634 100644
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
2.47.1.613.gc27f4b7a9f-goog


