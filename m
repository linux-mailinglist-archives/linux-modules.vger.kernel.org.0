Return-Path: <linux-modules+bounces-1671-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C48949A1B
	for <lists+linux-modules@lfdr.de>; Tue,  6 Aug 2024 23:25:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 220981F22EB0
	for <lists+linux-modules@lfdr.de>; Tue,  6 Aug 2024 21:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD4A217A93D;
	Tue,  6 Aug 2024 21:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2RUt+FOb"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351B317A585
	for <linux-modules@vger.kernel.org>; Tue,  6 Aug 2024 21:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722979296; cv=none; b=TeT7yIgOMuIwnvrNODTXTaksclJe87ftfSNjjFnS4+tWF5c8R5nsMttG2fCxVAo3ObWYxM414x0eH9TBeXL8vbm6yeA78L4HSmx7/7DE8Cy5M3ZaAARzMjUKZB3tDQjVaUWtuJJ27qM4ScVkqhXUIOLvTBe+5AshWBLvvSV8gZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722979296; c=relaxed/simple;
	bh=YzibuyX/ZurkiUI6GyxkLzm0ZV6PxLde5yZfANw/NIQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VNedqTYHBGTynDNLbtRrbE8UBCs6uRHZxknyut+JtHFa+9AxRJRo/Int527eAipVw1fQto2cTlRc5z7h+qg0AyP9JbIiysPfwQblNopNRERpLMrVPGxRB2WQqLMMfLFtvVCc9uZQ0GRxoGBBozNz+8cdmQ1z1odj+dkELbUrdtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2RUt+FOb; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6902dc6d3ffso28911007b3.2
        for <linux-modules@vger.kernel.org>; Tue, 06 Aug 2024 14:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722979294; x=1723584094; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=o0aAyksQBIufqTGFzbZo39MWvG4cDYo9zi1d+Qwxleg=;
        b=2RUt+FObJTZXU/AW1+tDAdYnk6UOpIIB0UDQG+VAosmZ0w9m3VS0M/H5IThD1VaoUc
         HHLYu5CblXO4lmRZbdVe3Pxa1kRv9fgpgEJa30uxACsX/90zR8i9PxpxbxZzBF9hXcyu
         jZtx8qp3dLmEk0oXSPTswfbbEqPJ/BwxlibYKWYGIPz/hvTpFKGSPbRD2MwSrfXvCP8X
         lzd1fCxN1Kr/ggz1WzVdL/PfkftnTZR+FiAit7Yn3BZJHZeuIYtYGDMC2cg9cymqthoP
         Dx4EwfsuSBGY2mVnht/TtMn+K7YebAzqVjLVeQpQNseLXtj9RoWTdt45B7TUkVqVvRQd
         uV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722979294; x=1723584094;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o0aAyksQBIufqTGFzbZo39MWvG4cDYo9zi1d+Qwxleg=;
        b=TMO2frzqUu0YYvrBUobR4BF5FyZxZeJtNB6JYAE7+UqPFDGuPWFKroTj5kgYMtVjdg
         rJYlLxlNvYhJySxoYVASog2BPqtUWvyrzAyk9RGZGLFFHsXXdVFOYsJXD7UoSSWCXvrh
         ADCgepdD9fXILd9qa7P6KxlgUqqVnYHZupwYTHPKCqD2v50eU0GEyIXdm19hiu59e78l
         Ed/10T70dd1TkQCNmPIQEiz0YEF1HjI9kGCrgcQUpPDKdhUM0vg3afPYtQ4J2vnXJsGp
         ZpVxWZVUFH03Q9U7OwFwrQjoaOMdD2jvh7gtPVUzt56rn1aAfbsVnuzia1HHQ6TB4tFj
         pU0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWjU/ukVIcneybOHJkejngh0RFILctRxdFMWuVy5VA9+S4s7winK46TbB3a+lKjqIw9q3oqYbMcpChYlPdAa7IeiPlHd1fFjVYZXSKUEA==
X-Gm-Message-State: AOJu0YydrKcc3Xwe3Fbj1vpN+YRdLkrzNJyyr/pU+dJt88VrwQ44mryO
	XDp7hjl3AlN2qfWx1nOrMpmMGYde8Iy6aZkRSO/GbOfnmdiRsZY3UKz4om4PXfSosKOLY5zmB53
	RYDIx0A==
X-Google-Smtp-Source: AGHT+IHMHXkzQl0MInvIKMa5XRAGjt8JRRLdjto+8iW/bmxLWJhyarBXnt+EN/959FSdYIRtbVwMtymGh48x
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:f13:b0:648:fc8a:cd23 with SMTP id
 00721157ae682-6895ec48440mr10438247b3.2.1722979294433; Tue, 06 Aug 2024
 14:21:34 -0700 (PDT)
Date: Tue,  6 Aug 2024 21:20:38 +0000
In-Reply-To: <20240806212106.617164-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240806212106.617164-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240806212106.617164-13-mmaurer@google.com>
Subject: [PATCH v3 12/16] module: Reformat struct for code style
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, neal@gompa.dev, 
	marcan@marcan.st, j@jannau.net, asahi@lists.linux.dev, 
	Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Using commas to declare struct members makes adding new members to this
struct not as nice with patch management.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/internal.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index 2ebece8a789f..daef2be83902 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -80,7 +80,12 @@ struct load_info {
 	unsigned int used_pages;
 #endif
 	struct {
-		unsigned int sym, str, mod, vers, info, pcpu;
+		unsigned int sym;
+		unsigned int str;
+		unsigned int mod;
+		unsigned int vers;
+		unsigned int info;
+		unsigned int pcpu;
 	} index;
 };
 
-- 
2.46.0.rc2.264.g509ed76dc8-goog


