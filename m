Return-Path: <linux-modules+bounces-1670-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FC6949A19
	for <lists+linux-modules@lfdr.de>; Tue,  6 Aug 2024 23:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7DCF2815EE
	for <lists+linux-modules@lfdr.de>; Tue,  6 Aug 2024 21:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C96A17A5AB;
	Tue,  6 Aug 2024 21:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pdTckeFX"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8495617A584
	for <linux-modules@vger.kernel.org>; Tue,  6 Aug 2024 21:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722979295; cv=none; b=F+VvFSdd8ByYSm1XmWIEeBO8SSGA6yl/s6HoqWip6EnIfs5hr93fuuZRUNT2Ck/TzU72Qr28AYfQHWfB8F7PRPxVdPCBQO0GszfwnfWWGyH8uUEKdbEEUsYmwN/3F/Bo7N4nltH1zXjsgqSZzSSWHg0unOoGDHaS5qYqUBCHQg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722979295; c=relaxed/simple;
	bh=epnI8eGvDDKISVPVfjjyglGB5CLDgu79i3HpiZi/AGs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iBBZAL0R+iE/PxPguxR7m5JtdzlrTCNsOHAfcM7iY2TwabW9QFhvZlcoc+7JCCrTsJ8h7H5m5yHigppA7zCVoOYtDVMFjsLTvscTKoCmafmdnlKT1A2Cg3/VUfBQk7P+mMx/O80zM66aK8guCXcaUfzyN6xKAlzO7QY2le8XKZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pdTckeFX; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e087ed145caso1632390276.3
        for <linux-modules@vger.kernel.org>; Tue, 06 Aug 2024 14:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722979292; x=1723584092; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FQ2zq/LCKzRU6SFahUeU1WMrViDXPV+lPPZmW0ps8uk=;
        b=pdTckeFXWIegKqc+4CmBazJKel8IMcm8mDemjVEdO0+mj7/5wfkCkEBnLvbUXqYblx
         NnTT7A80izGbzfLnMY7q6VgfHBxe58erO08xd7XOMkmstGIk1ElWiLDQUIl2gQPT/ELf
         gjg8UptB/wVnz9qUEGlPFd6iusGQvqaF6tIXSlBtjNfgdpA6Ncntou5SZUkt2QOVB9Dz
         sjs/IG1QKih8lI0+1nleiVZFs4J+2kDKj1xw3S2CZRh7jPRnEbuEXkEmnxw2KXTKly9g
         NR5dEwinei7OHsx28vsrmP9BcQJjtPAiHLlScdSW1DVXBZpTScXrUH0KewWrw4VqYHZ7
         QVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722979292; x=1723584092;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FQ2zq/LCKzRU6SFahUeU1WMrViDXPV+lPPZmW0ps8uk=;
        b=sFyyaunKfwSg2qhtRezuSuP20UJgqt5PVka+JwPM3j6hFeqflLQFkY8S3OfWS6+v8V
         dMcl5b+S9Bdno9KUZWqJWHWTkVp5Rna7a97q3n621LU8jjedW6arfivZhlwxmFMIkv3v
         vK9tY1o819ZOP6LxtxEle9mQBSt7J8rZWabwZ7xXGu+BFdqYqMj9mZOQ/w4pg7zQZ04G
         HqPUAn4UyZZXRVoSDsmhAgoqu09iFTIjphWjgoVaiSk68OvPbfqlTLZKDMGZepIRjWX5
         8EGlKp1UZ76pnkq+VwGTncjwfW2PfSW+RSa+qkI16ehYF84ePVLRU5fRvnOs5K6l+ZnH
         tIMw==
X-Forwarded-Encrypted: i=1; AJvYcCXzSumdiLaIu+z9lWK/2Xgc7jnI8CI3++bDXyqeGJFfrr5z+MRbony0gJyWYplt38XCXK1EqloIxAen3aDJD+/ruo6NogQ3+tl4iMz6SA==
X-Gm-Message-State: AOJu0YwKVs9XH9U1TpHW332e3Hr2K03N5UOQYczegiYGRwOFa8EpopZH
	DR2uADCjid4zFnHtJIl+uNJ7va4lf4TQ+gDX+fEwmrTmlCvxjYHK6LUCQViJ+LsvtkXe1IpkBOH
	HiJBvtQ==
X-Google-Smtp-Source: AGHT+IH6x1pd7T7CSwv3R+eylAyRZmNxI/232pEEFyoDFtMxFDuEMBONgvXpuP7EkLOuGdtv0x2gUeU1cK01
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:100c:b0:dfa:8ed1:8f1b with SMTP
 id 3f1490d57ef6-e0bde22affamr345027276.1.1722979292488; Tue, 06 Aug 2024
 14:21:32 -0700 (PDT)
Date: Tue,  6 Aug 2024 21:20:37 +0000
In-Reply-To: <20240806212106.617164-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240806212106.617164-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240806212106.617164-12-mmaurer@google.com>
Subject: [PATCH v3 11/16] module: Additional validation in elf_validity_cache_strtab
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

Validate properties of the strtab that are depended on elsewhere, but
were previously unchecked:
* String table nonempty (offset 0 is valid)
* String table has a leading NUL (offset 0 corresponds to "")
* String table is NUL terminated (strfoo functions won't run out of the
  table while reading).
* All symbols names are inbounds of the string table.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/main.c | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index d70d829b5ab9..7001054c5c4f 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2090,17 +2090,53 @@ static int elf_validity_cache_index(struct load_info *info, int flags)
 }
 
 /**
- * elf_validity_cache_strtab() - Cache symbol string table
+ * elf_validity_cache_strtab() - Validate and cache symbol string table
  * @info: Load info to read from and update.
  *        Must have &load_info->sechdrs and &load_info->secstrings populated.
  *        Must have &load_info->index populated.
  *
+ * Checks:
+ *
+ * * The string table is not empty.
+ * * The string table starts and ends with NUL (required by ELF spec).
+ * * Every &Elf_Sym->st_name offset in the symbol table is inbounds of the
+ *   string table.
+ *
+ * And caches the pointer as &load_info->strtab in @info.
+ *
  * Return: 0 on success, negative error code if a check failed.
  */
 static int elf_validity_cache_strtab(struct load_info *info)
 {
 	Elf_Shdr *str_shdr = &info->sechdrs[info->index.str];
+	Elf_Shdr *sym_shdr = &info->sechdrs[info->index.sym];
 	char *strtab = (char *)info->hdr + str_shdr->sh_offset;
+	Elf_Sym *syms = (void *)info->hdr + sym_shdr->sh_offset;
+	int i;
+
+	if (str_shdr->sh_size == 0) {
+		pr_err("empty symbol string table\n");
+		return -ENOEXEC;
+	}
+	if (strtab[0] != '\0') {
+		pr_err("symbol string table missing leading NUL\n");
+		return -ENOEXEC;
+	}
+	if (strtab[str_shdr->sh_size - 1] != '\0') {
+		pr_err("symbol string table isn't NUL terminated\n");
+		return -ENOEXEC;
+	}
+
+	/*
+	 * Now that we know strtab is correctly structured, check symbol
+	 * starts are inbounds before they're used later.
+	 */
+	for (i = 0; i < sym_shdr->sh_size / sizeof(*syms); i++) {
+		if (syms[i].st_name >= str_shdr->sh_size) {
+			pr_err("symbol name out of bounds in string table");
+			return -ENOEXEC;
+		}
+	}
 
 	info->strtab = strtab;
 	return 0;
-- 
2.46.0.rc2.264.g509ed76dc8-goog


