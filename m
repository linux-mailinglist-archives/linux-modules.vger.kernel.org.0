Return-Path: <linux-modules+bounces-1875-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3FC967E8F
	for <lists+linux-modules@lfdr.de>; Mon,  2 Sep 2024 06:42:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 589621F21BD5
	for <lists+linux-modules@lfdr.de>; Mon,  2 Sep 2024 04:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B40CD15574F;
	Mon,  2 Sep 2024 04:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4JmcXONf"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86C4154C05
	for <linux-modules@vger.kernel.org>; Mon,  2 Sep 2024 04:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725252101; cv=none; b=kyv1ePGySh3vS0z9I40fRUlJ07BpqhXOW84dO5Uao0sP9a6Ra6xK3OY/3iSjRbCc3r9mI4ZyJE6RNvT6CO+YHy0GDe6dqoXbH3rgO2jRjldvUiZkGodaetVEbq4ioicrvTacxVA7E2aL5sRCuH7nb9MgJ1yc2GFqUD+3ISZ3jgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725252101; c=relaxed/simple;
	bh=WZGSZDDwwBcvVvHjYbdkt42ukG4S2dTzJF74pYfBzvM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KkgplOTYc9BENi1o7Jg0w0raThrXoncQ2dDehdsjXDi7E4kYwHMwgyoBgmw92p9aWCc1WBfoJnFJo05vvDkY1pbXBD/HAKR4LSN0ARR2mXgt3TLt2DMS83Q+ZBEZ7TYtkr6rjYiaCiyoGk6KnR00e2zLMvXh+m/F6B7HAk+cLwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4JmcXONf; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6d470831e3aso50887817b3.3
        for <linux-modules@vger.kernel.org>; Sun, 01 Sep 2024 21:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725252099; x=1725856899; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GtHW3QbMIbL8VkRhZ9UoruDWIR+5Ejb5CjRZSzRSfG0=;
        b=4JmcXONfpduox86Z3T05T4h09vS+JR41ggjQq6WCOLEgnoRyFAMTcFf3DOepWglhnB
         riXhLkSAS+5zSOeFkeJ56aRodHoLWuayhLtpXrtzWY05cLrjvjsqcCbGJ4wB8jE82tqT
         Isd5rtc0Tqa5jga9M7OhgSXpSPf2gMhRlr2+YoM50ANE/fRhFkMsgTMo39ZHIweY1yIM
         IId71c0yzaJKmVmDZpZQhLcLSVCVKsfRuSeO1Yk0INoWJtxcZBDCp7w1mqX/46NsOJ5X
         U7NHWHGF1RSIV5xKICoWdy2e/cAFpK4TNFWRT55MzckkodKgT7/+ZMvhArFjhrjGtBoC
         KdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725252099; x=1725856899;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GtHW3QbMIbL8VkRhZ9UoruDWIR+5Ejb5CjRZSzRSfG0=;
        b=V1udjcxSqxuygonc4fyE0owL3Kw2aI71qZbbRrySdgMWr7MoWNVXyZMqe83gD6hsQD
         A0t9Bv7II0K34qlX69MPP1MlM/0JyKfcX8LqpJgFp2pll+sK0x4kKhQTwQNiZ+RZK2Bx
         QtOURV7uE39xGwzvQ2dXtM8k/ndnxIeKzElsKm/LbL689rClVHkRjmczSqYLOh8ShKUV
         drIZopyt7XQQhhQpomk0NPIA53Q9DORL9s6JQRcNq5MsKjn7ZHCxNNGdqWxlRGZgFKQj
         l4NosC1UCVOSY7JBizlKyJHfOJzg2KVBVaMxfj9eTV522opuJNIm0cnJLGBNiR92un3U
         9waw==
X-Forwarded-Encrypted: i=1; AJvYcCX2OkW2tJ4T6Ua7XpB+m2BUFOQX1hZGjsJyPzGpGTPVhOpReCkhoKhnMn6sicERv1nmTmB9rtBnigumEKaM@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcr+qE9wsbrY3EvuC/cxeAmNaatdtoOPfejOreHKRKBTWc59Gp
	fTjHpUXMRuhM6OPjmPTfWGxI+S2DKi0PAJgFFZxCplo9y6RYb9FjCbvE5AWYqCFzLlmbgC2MIO/
	NJw==
X-Google-Smtp-Source: AGHT+IGHUG44Vos/pxlFWbZNjhZtZ0OaAmv4KSGmEpEw821HAQXG3t5pT+l+pURZYG9PiSEp/j/9qgeoB6s=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:7343:ecd2:aed:5b8f])
 (user=surenb job=sendgmr) by 2002:a25:7e46:0:b0:e0b:ab63:b9c8 with SMTP id
 3f1490d57ef6-e1a7a3dbab3mr14893276.11.1725252098507; Sun, 01 Sep 2024
 21:41:38 -0700 (PDT)
Date: Sun,  1 Sep 2024 21:41:25 -0700
In-Reply-To: <20240902044128.664075-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240902044128.664075-1-surenb@google.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Message-ID: <20240902044128.664075-4-surenb@google.com>
Subject: [PATCH v2 3/6] alloc_tag: eliminate alloc_tag_ref_set
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, corbet@lwn.net, arnd@arndb.de, 
	mcgrof@kernel.org, rppt@kernel.org, paulmck@kernel.org, thuth@redhat.com, 
	tglx@linutronix.de, bp@alien8.de, xiongwei.song@windriver.com, 
	ardb@kernel.org, david@redhat.com, vbabka@suse.cz, mhocko@suse.com, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, dave@stgolabs.net, 
	willy@infradead.org, liam.howlett@oracle.com, pasha.tatashin@soleen.com, 
	souravpanda@google.com, keescook@chromium.org, dennis@kernel.org, 
	jhubbard@nvidia.com, yuzhao@google.com, vvvvvv@google.com, 
	rostedt@goodmis.org, iamjoonsoo.kim@lge.com, rientjes@google.com, 
	minchan@google.com, kaleshsingh@google.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kernel-team@android.com, surenb@google.com
Content-Type: text/plain; charset="UTF-8"

To simplify further refactoring, open-code the only two callers
of alloc_tag_ref_set().

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/alloc_tag.h   | 25 ++-----------------------
 include/linux/pgalloc_tag.h | 12 +++++++++++-
 2 files changed, 13 insertions(+), 24 deletions(-)

diff --git a/include/linux/alloc_tag.h b/include/linux/alloc_tag.h
index 99cbc7f086ad..21e3098220e3 100644
--- a/include/linux/alloc_tag.h
+++ b/include/linux/alloc_tag.h
@@ -143,36 +143,15 @@ static inline void alloc_tag_add_check(union codetag_ref *ref, struct alloc_tag
 static inline void alloc_tag_sub_check(union codetag_ref *ref) {}
 #endif
 
-/* Caller should verify both ref and tag to be valid */
-static inline void __alloc_tag_ref_set(union codetag_ref *ref, struct alloc_tag *tag)
-{
-	ref->ct = &tag->ct;
-	/*
-	 * We need in increment the call counter every time we have a new
-	 * allocation or when we split a large allocation into smaller ones.
-	 * Each new reference for every sub-allocation needs to increment call
-	 * counter because when we free each part the counter will be decremented.
-	 */
-	this_cpu_inc(tag->counters->calls);
-}
-
-static inline void alloc_tag_ref_set(union codetag_ref *ref, struct alloc_tag *tag)
-{
-	alloc_tag_add_check(ref, tag);
-	if (!ref || !tag)
-		return;
-
-	__alloc_tag_ref_set(ref, tag);
-}
-
 static inline void alloc_tag_add(union codetag_ref *ref, struct alloc_tag *tag, size_t bytes)
 {
 	alloc_tag_add_check(ref, tag);
 	if (!ref || !tag)
 		return;
 
-	__alloc_tag_ref_set(ref, tag);
+	ref->ct = &tag->ct;
 	this_cpu_add(tag->counters->bytes, bytes);
+	this_cpu_inc(tag->counters->calls);
 }
 
 static inline void alloc_tag_sub(union codetag_ref *ref, size_t bytes)
diff --git a/include/linux/pgalloc_tag.h b/include/linux/pgalloc_tag.h
index 207f0c83c8e9..244a328dff62 100644
--- a/include/linux/pgalloc_tag.h
+++ b/include/linux/pgalloc_tag.h
@@ -103,7 +103,17 @@ static inline void pgalloc_tag_split(struct page *page, unsigned int nr)
 	page_ext = page_ext_next(page_ext);
 	for (i = 1; i < nr; i++) {
 		/* Set new reference to point to the original tag */
-		alloc_tag_ref_set(codetag_ref_from_page_ext(page_ext), tag);
+		ref = codetag_ref_from_page_ext(page_ext);
+		alloc_tag_add_check(ref, tag);
+		if (ref) {
+			ref->ct = &tag->ct;
+			/*
+			 * We need in increment the call counter every time we split a
+			 * large allocation into smaller ones because when we free each
+			 * part the counter will be decremented.
+			 */
+			this_cpu_inc(tag->counters->calls);
+		}
 		page_ext = page_ext_next(page_ext);
 	}
 out:
-- 
2.46.0.469.g59c65b2a67-goog


