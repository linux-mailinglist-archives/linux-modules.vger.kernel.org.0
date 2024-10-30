Return-Path: <linux-modules+bounces-2374-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A259B6A48
	for <lists+linux-modules@lfdr.de>; Wed, 30 Oct 2024 18:08:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 195631C2260D
	for <lists+linux-modules@lfdr.de>; Wed, 30 Oct 2024 17:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9BDB217476;
	Wed, 30 Oct 2024 17:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m6rgJziA"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6DD21948A
	for <linux-modules@vger.kernel.org>; Wed, 30 Oct 2024 17:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730307688; cv=none; b=XxxiDf+sM+jG/TU9zm41q/wQPThwyx0+FWnyjn3w5BPF5epp0PdTa7VhtscUJcu60GMjyfXx+aoP51zvgZocyYr4NubIl93CBhuZIywplD4u4r38K5cgFlRagR6TMs17kgqM4oLbdYAKnEiF7h8++2uzkF0qRg7mgkXuI4vPiAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730307688; c=relaxed/simple;
	bh=JFqhKNnLGh9w7aa5bC1kQAx6mphavhSjPHqtEw0jlh8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fSD8MmbEZrgALeZrQfBQi4kgyEJNYtGxKErc57rJU4YvS6MrhCluNkw3GzW/Q2jlNI4XkLlPJhvVSsu7cqvVh9ZEPcwQZM4d5KEZMDauJqpH3N1FGGPrrWsGoXwLZG35hX1Ymb2nboeHC78kJ/ayOWJ+hqiMIt7ifao6zFpg1QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m6rgJziA; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-207510f3242so506075ad.0
        for <linux-modules@vger.kernel.org>; Wed, 30 Oct 2024 10:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730307684; x=1730912484; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rzv0vlmPqrkQn2efcj0z8bE5vNBtHR+T7c+1dkOz4ic=;
        b=m6rgJziAhqSPbdUeJIauks7CTMSBBbYK7jsJjjpNrWkSoe9WAR3p8+ye5HCYYo35dH
         f7nx95mUzQw03jCwBqIapGCzwNS2s5pJckXq33nHOIyeZFXS6by5TPf9PBX8IjRhxbAb
         KI/VLJItThuHyJxx9sfq0MPeTMRG6F7o9jjH2L2vqiN8kfuYjnDbZGnoO21LJnrWNTfa
         j4/R1aiHeDfjFJRdBsxxsfaiQ4qsrdL8Iz55HDylSaMTuWeBPO0N8ptepXaPz9i6+RPe
         102UGFow3gAavYAc/hNZsQqoIvRxCG+aMjzkdv6y8GyOw5+0kP8EN4e09a2RLma4QM5P
         V9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730307684; x=1730912484;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rzv0vlmPqrkQn2efcj0z8bE5vNBtHR+T7c+1dkOz4ic=;
        b=aOLmgY78sZyR5ePJgBYDmbnWMMsQkzTuIwDMIuHg+R9+OAwlDSBHtf7qvyl4ZsElRf
         mlLt+wODpAbZRKQGxQGcLLTbE9zG2bIIcHXPhrpDSiNE+PNslNcKTNHRLQJP5yNbPN4O
         Ry4ZPnVr8Yb0YKXznt2jxUdsEZFMGOPshgH0aWiF70BriwpPJl3pL4kV+93kAXJW0Y5J
         HwAzmyBgGgvhbNFqwxH+1mB6gJfJo4ts0Dn/gElVo7iaP7IUPrCs4TimByNi1FecuEcg
         7t59jQ4YXUJ8RcZr8cdIkWc0UN7pEq5upHTAPIh2rQY4gFyWbEQz6Vbp/rRo25KZgdV/
         6phA==
X-Forwarded-Encrypted: i=1; AJvYcCU2gIVxKZNKlVAJ+chF3/naFf7BI8J4CDMFHemJCX66LeR84Mp9ELk8wqWkx/AGJq5ta8toV4A+kMdIRX4w@vger.kernel.org
X-Gm-Message-State: AOJu0YzBFEFd1Qk6UGPfiARe8ut/15wHiwRBtRTfGE01rdT1sgwT09mp
	/tqAgfBkGy/E1iP0HEUdKLipI4iwA0TO/Ecu3ioBOl0lYJlPAmlz73DXQmpBOUwbY3TnldjBKof
	rF8JIXlnzqXLB7eEYL0Y9WneftA==
X-Google-Smtp-Source: AGHT+IF3lcEK1vTVZovsXf90AQaEC80VtkUCJFdDsXxm855oo/+SOTxTd7VGHJ77aM4hJb7uhTDlPmcjwe3Xfaq1/h4=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:902:d505:b0:20b:7ece:3225 with
 SMTP id d9443c01a7336-210c6711ed3mr1038715ad.0.1730307683970; Wed, 30 Oct
 2024 10:01:23 -0700 (PDT)
Date: Wed, 30 Oct 2024 17:01:08 +0000
In-Reply-To: <20241030170106.1501763-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=9994; i=samitolvanen@google.com;
 h=from:subject; bh=JFqhKNnLGh9w7aa5bC1kQAx6mphavhSjPHqtEw0jlh8=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOlKaUETDblfSmlkTJ2cH12qarjrSHJB1KfJr2tsDtwWi
 LryLNa1o5SFQYyDQVZMkaXl6+qtu787pb76XCQBM4eVCWQIAxenAEyEK4HhD+8pPsaTZrYP8h84
 u0sluZiKLLD0Ovxh3ocTKdennp7/pp2RYTW7QuLb91mPzlz/GrV9csHZb27zFWbc7XdkVWfZ/iX pJDMA
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241030170106.1501763-22-samitolvanen@google.com>
Subject: [PATCH v5 01/19] scripts: move genksyms crc32 implementation to a
 common include
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

To avoid duplication between host programs, move the crc32 code to a
shared header file.

Suggested-by: Petr Pavlu <petr.pavlu@suse.com>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Acked-by: Neal Gompa <neal@gompa.dev>
---
 scripts/genksyms/genksyms.c | 77 +-----------------------------
 scripts/include/crc32.h     | 93 +++++++++++++++++++++++++++++++++++++
 2 files changed, 94 insertions(+), 76 deletions(-)
 create mode 100644 scripts/include/crc32.h

diff --git a/scripts/genksyms/genksyms.c b/scripts/genksyms/genksyms.c
index f3901c55df23..2885bbcb9eec 100644
--- a/scripts/genksyms/genksyms.c
+++ b/scripts/genksyms/genksyms.c
@@ -18,6 +18,7 @@
 #include <stdarg.h>
 #include <getopt.h>
 
+#include <crc32.h>
 #include "genksyms.h"
 /*----------------------------------------------------------------------*/
 
@@ -58,82 +59,6 @@ static struct string_list *mk_node(const char *string);
 static void print_location(void);
 static void print_type_name(enum symbol_type type, const char *name);
 
-/*----------------------------------------------------------------------*/
-
-static const unsigned int crctab32[] = {
-	0x00000000U, 0x77073096U, 0xee0e612cU, 0x990951baU, 0x076dc419U,
-	0x706af48fU, 0xe963a535U, 0x9e6495a3U, 0x0edb8832U, 0x79dcb8a4U,
-	0xe0d5e91eU, 0x97d2d988U, 0x09b64c2bU, 0x7eb17cbdU, 0xe7b82d07U,
-	0x90bf1d91U, 0x1db71064U, 0x6ab020f2U, 0xf3b97148U, 0x84be41deU,
-	0x1adad47dU, 0x6ddde4ebU, 0xf4d4b551U, 0x83d385c7U, 0x136c9856U,
-	0x646ba8c0U, 0xfd62f97aU, 0x8a65c9ecU, 0x14015c4fU, 0x63066cd9U,
-	0xfa0f3d63U, 0x8d080df5U, 0x3b6e20c8U, 0x4c69105eU, 0xd56041e4U,
-	0xa2677172U, 0x3c03e4d1U, 0x4b04d447U, 0xd20d85fdU, 0xa50ab56bU,
-	0x35b5a8faU, 0x42b2986cU, 0xdbbbc9d6U, 0xacbcf940U, 0x32d86ce3U,
-	0x45df5c75U, 0xdcd60dcfU, 0xabd13d59U, 0x26d930acU, 0x51de003aU,
-	0xc8d75180U, 0xbfd06116U, 0x21b4f4b5U, 0x56b3c423U, 0xcfba9599U,
-	0xb8bda50fU, 0x2802b89eU, 0x5f058808U, 0xc60cd9b2U, 0xb10be924U,
-	0x2f6f7c87U, 0x58684c11U, 0xc1611dabU, 0xb6662d3dU, 0x76dc4190U,
-	0x01db7106U, 0x98d220bcU, 0xefd5102aU, 0x71b18589U, 0x06b6b51fU,
-	0x9fbfe4a5U, 0xe8b8d433U, 0x7807c9a2U, 0x0f00f934U, 0x9609a88eU,
-	0xe10e9818U, 0x7f6a0dbbU, 0x086d3d2dU, 0x91646c97U, 0xe6635c01U,
-	0x6b6b51f4U, 0x1c6c6162U, 0x856530d8U, 0xf262004eU, 0x6c0695edU,
-	0x1b01a57bU, 0x8208f4c1U, 0xf50fc457U, 0x65b0d9c6U, 0x12b7e950U,
-	0x8bbeb8eaU, 0xfcb9887cU, 0x62dd1ddfU, 0x15da2d49U, 0x8cd37cf3U,
-	0xfbd44c65U, 0x4db26158U, 0x3ab551ceU, 0xa3bc0074U, 0xd4bb30e2U,
-	0x4adfa541U, 0x3dd895d7U, 0xa4d1c46dU, 0xd3d6f4fbU, 0x4369e96aU,
-	0x346ed9fcU, 0xad678846U, 0xda60b8d0U, 0x44042d73U, 0x33031de5U,
-	0xaa0a4c5fU, 0xdd0d7cc9U, 0x5005713cU, 0x270241aaU, 0xbe0b1010U,
-	0xc90c2086U, 0x5768b525U, 0x206f85b3U, 0xb966d409U, 0xce61e49fU,
-	0x5edef90eU, 0x29d9c998U, 0xb0d09822U, 0xc7d7a8b4U, 0x59b33d17U,
-	0x2eb40d81U, 0xb7bd5c3bU, 0xc0ba6cadU, 0xedb88320U, 0x9abfb3b6U,
-	0x03b6e20cU, 0x74b1d29aU, 0xead54739U, 0x9dd277afU, 0x04db2615U,
-	0x73dc1683U, 0xe3630b12U, 0x94643b84U, 0x0d6d6a3eU, 0x7a6a5aa8U,
-	0xe40ecf0bU, 0x9309ff9dU, 0x0a00ae27U, 0x7d079eb1U, 0xf00f9344U,
-	0x8708a3d2U, 0x1e01f268U, 0x6906c2feU, 0xf762575dU, 0x806567cbU,
-	0x196c3671U, 0x6e6b06e7U, 0xfed41b76U, 0x89d32be0U, 0x10da7a5aU,
-	0x67dd4accU, 0xf9b9df6fU, 0x8ebeeff9U, 0x17b7be43U, 0x60b08ed5U,
-	0xd6d6a3e8U, 0xa1d1937eU, 0x38d8c2c4U, 0x4fdff252U, 0xd1bb67f1U,
-	0xa6bc5767U, 0x3fb506ddU, 0x48b2364bU, 0xd80d2bdaU, 0xaf0a1b4cU,
-	0x36034af6U, 0x41047a60U, 0xdf60efc3U, 0xa867df55U, 0x316e8eefU,
-	0x4669be79U, 0xcb61b38cU, 0xbc66831aU, 0x256fd2a0U, 0x5268e236U,
-	0xcc0c7795U, 0xbb0b4703U, 0x220216b9U, 0x5505262fU, 0xc5ba3bbeU,
-	0xb2bd0b28U, 0x2bb45a92U, 0x5cb36a04U, 0xc2d7ffa7U, 0xb5d0cf31U,
-	0x2cd99e8bU, 0x5bdeae1dU, 0x9b64c2b0U, 0xec63f226U, 0x756aa39cU,
-	0x026d930aU, 0x9c0906a9U, 0xeb0e363fU, 0x72076785U, 0x05005713U,
-	0x95bf4a82U, 0xe2b87a14U, 0x7bb12baeU, 0x0cb61b38U, 0x92d28e9bU,
-	0xe5d5be0dU, 0x7cdcefb7U, 0x0bdbdf21U, 0x86d3d2d4U, 0xf1d4e242U,
-	0x68ddb3f8U, 0x1fda836eU, 0x81be16cdU, 0xf6b9265bU, 0x6fb077e1U,
-	0x18b74777U, 0x88085ae6U, 0xff0f6a70U, 0x66063bcaU, 0x11010b5cU,
-	0x8f659effU, 0xf862ae69U, 0x616bffd3U, 0x166ccf45U, 0xa00ae278U,
-	0xd70dd2eeU, 0x4e048354U, 0x3903b3c2U, 0xa7672661U, 0xd06016f7U,
-	0x4969474dU, 0x3e6e77dbU, 0xaed16a4aU, 0xd9d65adcU, 0x40df0b66U,
-	0x37d83bf0U, 0xa9bcae53U, 0xdebb9ec5U, 0x47b2cf7fU, 0x30b5ffe9U,
-	0xbdbdf21cU, 0xcabac28aU, 0x53b39330U, 0x24b4a3a6U, 0xbad03605U,
-	0xcdd70693U, 0x54de5729U, 0x23d967bfU, 0xb3667a2eU, 0xc4614ab8U,
-	0x5d681b02U, 0x2a6f2b94U, 0xb40bbe37U, 0xc30c8ea1U, 0x5a05df1bU,
-	0x2d02ef8dU
-};
-
-static unsigned long partial_crc32_one(unsigned char c, unsigned long crc)
-{
-	return crctab32[(crc ^ c) & 0xff] ^ (crc >> 8);
-}
-
-static unsigned long partial_crc32(const char *s, unsigned long crc)
-{
-	while (*s)
-		crc = partial_crc32_one(*s++, crc);
-	return crc;
-}
-
-static unsigned long crc32(const char *s)
-{
-	return partial_crc32(s, 0xffffffff) ^ 0xffffffff;
-}
-
-/*----------------------------------------------------------------------*/
-
 static enum symbol_type map_to_ns(enum symbol_type t)
 {
 	switch (t) {
diff --git a/scripts/include/crc32.h b/scripts/include/crc32.h
new file mode 100644
index 000000000000..06eedd273717
--- /dev/null
+++ b/scripts/include/crc32.h
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * CRC32 implementation.
+ *
+ * Moved from scripts/genksyms/genksyms.c, which has the following
+ * notice:
+ *
+ * Generate kernel symbol version hashes.
+ * Copyright 1996, 1997 Linux International.
+ *
+ * New implementation contributed by Richard Henderson <rth@tamu.edu>
+ * Based on original work by Bjorn Ekwall <bj0rn@blox.se>
+ *
+ * This file was part of the Linux modutils 2.4.22: moved back into the
+ * kernel sources by Rusty Russell/Kai Germaschewski.
+ */
+
+#ifndef __CRC32_H
+#define __CRC32_H
+
+static const unsigned int crctab32[] = {
+	0x00000000U, 0x77073096U, 0xee0e612cU, 0x990951baU, 0x076dc419U,
+	0x706af48fU, 0xe963a535U, 0x9e6495a3U, 0x0edb8832U, 0x79dcb8a4U,
+	0xe0d5e91eU, 0x97d2d988U, 0x09b64c2bU, 0x7eb17cbdU, 0xe7b82d07U,
+	0x90bf1d91U, 0x1db71064U, 0x6ab020f2U, 0xf3b97148U, 0x84be41deU,
+	0x1adad47dU, 0x6ddde4ebU, 0xf4d4b551U, 0x83d385c7U, 0x136c9856U,
+	0x646ba8c0U, 0xfd62f97aU, 0x8a65c9ecU, 0x14015c4fU, 0x63066cd9U,
+	0xfa0f3d63U, 0x8d080df5U, 0x3b6e20c8U, 0x4c69105eU, 0xd56041e4U,
+	0xa2677172U, 0x3c03e4d1U, 0x4b04d447U, 0xd20d85fdU, 0xa50ab56bU,
+	0x35b5a8faU, 0x42b2986cU, 0xdbbbc9d6U, 0xacbcf940U, 0x32d86ce3U,
+	0x45df5c75U, 0xdcd60dcfU, 0xabd13d59U, 0x26d930acU, 0x51de003aU,
+	0xc8d75180U, 0xbfd06116U, 0x21b4f4b5U, 0x56b3c423U, 0xcfba9599U,
+	0xb8bda50fU, 0x2802b89eU, 0x5f058808U, 0xc60cd9b2U, 0xb10be924U,
+	0x2f6f7c87U, 0x58684c11U, 0xc1611dabU, 0xb6662d3dU, 0x76dc4190U,
+	0x01db7106U, 0x98d220bcU, 0xefd5102aU, 0x71b18589U, 0x06b6b51fU,
+	0x9fbfe4a5U, 0xe8b8d433U, 0x7807c9a2U, 0x0f00f934U, 0x9609a88eU,
+	0xe10e9818U, 0x7f6a0dbbU, 0x086d3d2dU, 0x91646c97U, 0xe6635c01U,
+	0x6b6b51f4U, 0x1c6c6162U, 0x856530d8U, 0xf262004eU, 0x6c0695edU,
+	0x1b01a57bU, 0x8208f4c1U, 0xf50fc457U, 0x65b0d9c6U, 0x12b7e950U,
+	0x8bbeb8eaU, 0xfcb9887cU, 0x62dd1ddfU, 0x15da2d49U, 0x8cd37cf3U,
+	0xfbd44c65U, 0x4db26158U, 0x3ab551ceU, 0xa3bc0074U, 0xd4bb30e2U,
+	0x4adfa541U, 0x3dd895d7U, 0xa4d1c46dU, 0xd3d6f4fbU, 0x4369e96aU,
+	0x346ed9fcU, 0xad678846U, 0xda60b8d0U, 0x44042d73U, 0x33031de5U,
+	0xaa0a4c5fU, 0xdd0d7cc9U, 0x5005713cU, 0x270241aaU, 0xbe0b1010U,
+	0xc90c2086U, 0x5768b525U, 0x206f85b3U, 0xb966d409U, 0xce61e49fU,
+	0x5edef90eU, 0x29d9c998U, 0xb0d09822U, 0xc7d7a8b4U, 0x59b33d17U,
+	0x2eb40d81U, 0xb7bd5c3bU, 0xc0ba6cadU, 0xedb88320U, 0x9abfb3b6U,
+	0x03b6e20cU, 0x74b1d29aU, 0xead54739U, 0x9dd277afU, 0x04db2615U,
+	0x73dc1683U, 0xe3630b12U, 0x94643b84U, 0x0d6d6a3eU, 0x7a6a5aa8U,
+	0xe40ecf0bU, 0x9309ff9dU, 0x0a00ae27U, 0x7d079eb1U, 0xf00f9344U,
+	0x8708a3d2U, 0x1e01f268U, 0x6906c2feU, 0xf762575dU, 0x806567cbU,
+	0x196c3671U, 0x6e6b06e7U, 0xfed41b76U, 0x89d32be0U, 0x10da7a5aU,
+	0x67dd4accU, 0xf9b9df6fU, 0x8ebeeff9U, 0x17b7be43U, 0x60b08ed5U,
+	0xd6d6a3e8U, 0xa1d1937eU, 0x38d8c2c4U, 0x4fdff252U, 0xd1bb67f1U,
+	0xa6bc5767U, 0x3fb506ddU, 0x48b2364bU, 0xd80d2bdaU, 0xaf0a1b4cU,
+	0x36034af6U, 0x41047a60U, 0xdf60efc3U, 0xa867df55U, 0x316e8eefU,
+	0x4669be79U, 0xcb61b38cU, 0xbc66831aU, 0x256fd2a0U, 0x5268e236U,
+	0xcc0c7795U, 0xbb0b4703U, 0x220216b9U, 0x5505262fU, 0xc5ba3bbeU,
+	0xb2bd0b28U, 0x2bb45a92U, 0x5cb36a04U, 0xc2d7ffa7U, 0xb5d0cf31U,
+	0x2cd99e8bU, 0x5bdeae1dU, 0x9b64c2b0U, 0xec63f226U, 0x756aa39cU,
+	0x026d930aU, 0x9c0906a9U, 0xeb0e363fU, 0x72076785U, 0x05005713U,
+	0x95bf4a82U, 0xe2b87a14U, 0x7bb12baeU, 0x0cb61b38U, 0x92d28e9bU,
+	0xe5d5be0dU, 0x7cdcefb7U, 0x0bdbdf21U, 0x86d3d2d4U, 0xf1d4e242U,
+	0x68ddb3f8U, 0x1fda836eU, 0x81be16cdU, 0xf6b9265bU, 0x6fb077e1U,
+	0x18b74777U, 0x88085ae6U, 0xff0f6a70U, 0x66063bcaU, 0x11010b5cU,
+	0x8f659effU, 0xf862ae69U, 0x616bffd3U, 0x166ccf45U, 0xa00ae278U,
+	0xd70dd2eeU, 0x4e048354U, 0x3903b3c2U, 0xa7672661U, 0xd06016f7U,
+	0x4969474dU, 0x3e6e77dbU, 0xaed16a4aU, 0xd9d65adcU, 0x40df0b66U,
+	0x37d83bf0U, 0xa9bcae53U, 0xdebb9ec5U, 0x47b2cf7fU, 0x30b5ffe9U,
+	0xbdbdf21cU, 0xcabac28aU, 0x53b39330U, 0x24b4a3a6U, 0xbad03605U,
+	0xcdd70693U, 0x54de5729U, 0x23d967bfU, 0xb3667a2eU, 0xc4614ab8U,
+	0x5d681b02U, 0x2a6f2b94U, 0xb40bbe37U, 0xc30c8ea1U, 0x5a05df1bU,
+	0x2d02ef8dU
+};
+
+static inline unsigned long partial_crc32_one(unsigned char c, unsigned long crc)
+{
+	return crctab32[(crc ^ c) & 0xff] ^ (crc >> 8);
+}
+
+static inline unsigned long partial_crc32(const char *s, unsigned long crc)
+{
+	while (*s)
+		crc = partial_crc32_one(*s++, crc);
+	return crc;
+}
+
+static inline unsigned long crc32(const char *s)
+{
+	return partial_crc32(s, 0xffffffff) ^ 0xffffffff;
+}
+
+#endif /* __CRC32_H */
-- 
2.47.0.163.g1226f6d8fa-goog


