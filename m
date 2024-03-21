Return-Path: <linux-modules+bounces-909-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1D2885E53
	for <lists+linux-modules@lfdr.de>; Thu, 21 Mar 2024 17:46:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C28B1F26E33
	for <lists+linux-modules@lfdr.de>; Thu, 21 Mar 2024 16:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A791413B2AF;
	Thu, 21 Mar 2024 16:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GYz/1lmV"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A1F13AA2F
	for <linux-modules@vger.kernel.org>; Thu, 21 Mar 2024 16:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711039083; cv=none; b=MJoA5az3FL4UsP+EGHrDXWp1Kfn1hdSYAIzZpmPl0PAzCcKbSQc01lhKKU/ooH08z+kyUPvBAYqdKCg2CIivZF4MHWSLyFqDAQSWccBXnLLO6JDmbCGdn9sErCzZbyunSI7IiYZgJo+X6EWJepPO8Va11XzdRJN2ldhiHjroXmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711039083; c=relaxed/simple;
	bh=GMoeKKgr6ForvCg3pCNgoGVRhZa/k6YjjT689wI9LjU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AH/ZFZ1IuDgEdv3m5jDV81BEclrd5mIcIFkYUcafiFWvrglPghBMHUegj3v2rd0LVziU18cnqJmpN19ZI2AULRBphijVBpQc8yPNPbztZHa/iCMin4AgMLYaPHevAy5lhfKvOWaxQJ3UdqhqIBiaPmIIW5BRey8G4GxNvvVCfks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GYz/1lmV; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dcdc3db67f0so2777304276.1
        for <linux-modules@vger.kernel.org>; Thu, 21 Mar 2024 09:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711039080; x=1711643880; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qDb8iz8I8QS6d+rOBOAu9Y4ek6cz/wlqKmX9e9H3T5g=;
        b=GYz/1lmVMk8aUi02+B95MjtDSjZXmFMDcwn7+9fDDSk0bueWyNzvB6uRJlnPGW+30L
         lNWp/t6t6ilh8CnjyaqClEDXJ3EVJPs40b3TbVMM3+NerYl+b5WrNNPCTPE5WsoPI4W+
         i+rXscCfD639qoXaVjTPiQBZyovE5VdiTtiUon0jMxxXegZ20CNty8GAVbjottvMUqhs
         rE48ueKG6WAWCYu9Kj4NPVjMfTMeMOzMhcQ42TGmIPQUmb7fpRXJQ6iU3BTD/HichLyB
         /ogzvvDvjrMaR9mSR5bwa6cgL3QjIOLOJQoA+tu7NycJCOTB9MN1zlBi/CcYJm4t1n2a
         61/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711039080; x=1711643880;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qDb8iz8I8QS6d+rOBOAu9Y4ek6cz/wlqKmX9e9H3T5g=;
        b=Sbfe4Pp6ZL5CaaoeSRJ5nm4Hk8ON6ywbLYSL2+z9UN2zAVlSdESxRTCFAeo1zq+65B
         czzPcqV7MO8CT5yYiS3R3dX5XAFAMbz6k3T8vbw3Kk4RcDF6vLoQF0CmFeavRtFOtAYH
         AKvG7kCJxZR9mtS/DngxmPFF76nRK3lvqiyvyuYINMxqnKZmHY9DeuTn7nvIrvnMZD9u
         wZJPv3b0xA9NmnSEaNJOuQl2yDW2XAwLW4BcPNF5Y1FhNiGPXBWgq3hyCn2rYnQWOrvv
         oFVWmfzKuw+G/T7+oFf3uWZuFJE5futcGXOcFLKhGO+tWKNpQlQEfgq3jnBLUntCcrzG
         onbg==
X-Forwarded-Encrypted: i=1; AJvYcCWv6041WhW9sTy6OKC7vvP3Z60iwEs+Yr7T5zl1I+diHPbH4CIIMKgHyiMiO3sxFrPxmNqQzCcLVigrs3PMtkH6kBdhgCawp3nXzdf5sA==
X-Gm-Message-State: AOJu0YxLCUeBoXvGLItqU20325DnDjY2FgUevpQsWM4ZZSm60fkTi76k
	7+TjOf7B2Ka0o2J4HAQoqr558dAlW9sHz3v5ii5EorNU8EWeNB8fhlm5Cb++mIn/Xmy/JJbLGDW
	UxA==
X-Google-Smtp-Source: AGHT+IHDeZBFlJ0NtCqkUUNT0gfkHkrQ10cEoA8CJOTWwHwDSwKuqC04Vl0uLsTIeS1kWMwDWt3A7ZdyM4A=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:a489:6433:be5d:e639])
 (user=surenb job=sendgmr) by 2002:a05:6902:1604:b0:dd9:2782:d1c6 with SMTP id
 bw4-20020a056902160400b00dd92782d1c6mr9210ybb.1.1711039079759; Thu, 21 Mar
 2024 09:37:59 -0700 (PDT)
Date: Thu, 21 Mar 2024 09:36:45 -0700
In-Reply-To: <20240321163705.3067592-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240321163705.3067592-1-surenb@google.com>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
Message-ID: <20240321163705.3067592-24-surenb@google.com>
Subject: [PATCH v6 23/37] mm/slab: add allocation accounting into slab
 allocation and free paths
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	penguin-kernel@i-love.sakura.ne.jp, corbet@lwn.net, void@manifault.com, 
	peterz@infradead.org, juri.lelli@redhat.com, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, dennis@kernel.org, jhubbard@nvidia.com, tj@kernel.org, 
	muchun.song@linux.dev, rppt@kernel.org, paulmck@kernel.org, 
	pasha.tatashin@soleen.com, yosryahmed@google.com, yuzhao@google.com, 
	dhowells@redhat.com, hughd@google.com, andreyknvl@gmail.com, 
	keescook@chromium.org, ndesaulniers@google.com, vvvvvv@google.com, 
	gregkh@linuxfoundation.org, ebiggers@google.com, ytcoode@gmail.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, bristot@redhat.com, vschneid@redhat.com, cl@linux.com, 
	penberg@kernel.org, iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, 
	glider@google.com, elver@google.com, dvyukov@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, aliceryhl@google.com, 
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com, 
	surenb@google.com, kernel-team@android.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Account slab allocations using codetag reference embedded into slabobj_ext.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Co-developed-by: Kent Overstreet <kent.overstreet@linux.dev>
Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 mm/slub.c | 96 ++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 95 insertions(+), 1 deletion(-)

diff --git a/mm/slub.c b/mm/slub.c
index 666dcc3b8a26..5840ab963319 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -1932,7 +1932,68 @@ static inline void free_slab_obj_exts(struct slab *slab)
 	kfree(obj_exts);
 	slab->obj_exts = 0;
 }
+
+static inline bool need_slab_obj_ext(void)
+{
+	if (mem_alloc_profiling_enabled())
+		return true;
+
+	/*
+	 * CONFIG_MEMCG_KMEM creates vector of obj_cgroup objects conditionally
+	 * inside memcg_slab_post_alloc_hook. No other users for now.
+	 */
+	return false;
+}
+
+static inline struct slabobj_ext *
+prepare_slab_obj_exts_hook(struct kmem_cache *s, gfp_t flags, void *p)
+{
+	struct slab *slab;
+
+	if (!p)
+		return NULL;
+
+	if (s->flags & SLAB_NO_OBJ_EXT)
+		return NULL;
+
+	if (flags & __GFP_NO_OBJ_EXT)
+		return NULL;
+
+	slab = virt_to_slab(p);
+	if (!slab_obj_exts(slab) &&
+	    WARN(alloc_slab_obj_exts(slab, s, flags, false),
+		 "%s, %s: Failed to create slab extension vector!\n",
+		 __func__, s->name))
+		return NULL;
+
+	return slab_obj_exts(slab) + obj_to_index(s, slab, p);
+}
+
+static inline void
+alloc_tagging_slab_free_hook(struct kmem_cache *s, struct slab *slab, void **p,
+			     int objects)
+{
+#ifdef CONFIG_MEM_ALLOC_PROFILING
+	struct slabobj_ext *obj_exts;
+	int i;
+
+	if (!mem_alloc_profiling_enabled())
+		return;
+
+	obj_exts = slab_obj_exts(slab);
+	if (!obj_exts)
+		return;
+
+	for (i = 0; i < objects; i++) {
+		unsigned int off = obj_to_index(s, slab, p[i]);
+
+		alloc_tag_sub(&obj_exts[off].ref, s->size);
+	}
+#endif
+}
+
 #else /* CONFIG_SLAB_OBJ_EXT */
+
 static int alloc_slab_obj_exts(struct slab *slab, struct kmem_cache *s,
 			       gfp_t gfp, bool new_slab)
 {
@@ -1942,6 +2003,24 @@ static int alloc_slab_obj_exts(struct slab *slab, struct kmem_cache *s,
 static inline void free_slab_obj_exts(struct slab *slab)
 {
 }
+
+static inline bool need_slab_obj_ext(void)
+{
+	return false;
+}
+
+static inline struct slabobj_ext *
+prepare_slab_obj_exts_hook(struct kmem_cache *s, gfp_t flags, void *p)
+{
+	return NULL;
+}
+
+static inline void
+alloc_tagging_slab_free_hook(struct kmem_cache *s, struct slab *slab, void **p,
+			     int objects)
+{
+}
+
 #endif /* CONFIG_SLAB_OBJ_EXT */
 
 #ifdef CONFIG_MEMCG_KMEM
@@ -2370,7 +2449,7 @@ static __always_inline void account_slab(struct slab *slab, int order,
 static __always_inline void unaccount_slab(struct slab *slab, int order,
 					   struct kmem_cache *s)
 {
-	if (memcg_kmem_online())
+	if (memcg_kmem_online() || need_slab_obj_ext())
 		free_slab_obj_exts(slab);
 
 	mod_node_page_state(slab_pgdat(slab), cache_vmstat_idx(s),
@@ -3823,6 +3902,7 @@ void slab_post_alloc_hook(struct kmem_cache *s,	struct obj_cgroup *objcg,
 			  unsigned int orig_size)
 {
 	unsigned int zero_size = s->object_size;
+	struct slabobj_ext *obj_exts;
 	bool kasan_init = init;
 	size_t i;
 	gfp_t init_flags = flags & gfp_allowed_mask;
@@ -3865,6 +3945,18 @@ void slab_post_alloc_hook(struct kmem_cache *s,	struct obj_cgroup *objcg,
 		kmemleak_alloc_recursive(p[i], s->object_size, 1,
 					 s->flags, init_flags);
 		kmsan_slab_alloc(s, p[i], init_flags);
+		if (need_slab_obj_ext()) {
+			obj_exts = prepare_slab_obj_exts_hook(s, flags, p[i]);
+#ifdef CONFIG_MEM_ALLOC_PROFILING
+			/*
+			 * Currently obj_exts is used only for allocation profiling.
+			 * If other users appear then mem_alloc_profiling_enabled()
+			 * check should be added before alloc_tag_add().
+			 */
+			if (likely(obj_exts))
+				alloc_tag_add(&obj_exts->ref, current->alloc_tag, s->size);
+#endif
+		}
 	}
 
 	memcg_slab_post_alloc_hook(s, objcg, flags, size, p);
@@ -4339,6 +4431,7 @@ void slab_free(struct kmem_cache *s, struct slab *slab, void *object,
 	       unsigned long addr)
 {
 	memcg_slab_free_hook(s, slab, &object, 1);
+	alloc_tagging_slab_free_hook(s, slab, &object, 1);
 
 	if (likely(slab_free_hook(s, object, slab_want_init_on_free(s))))
 		do_slab_free(s, slab, object, object, 1, addr);
@@ -4349,6 +4442,7 @@ void slab_free_bulk(struct kmem_cache *s, struct slab *slab, void *head,
 		    void *tail, void **p, int cnt, unsigned long addr)
 {
 	memcg_slab_free_hook(s, slab, p, cnt);
+	alloc_tagging_slab_free_hook(s, slab, p, cnt);
 	/*
 	 * With KASAN enabled slab_free_freelist_hook modifies the freelist
 	 * to remove objects, whose reuse must be delayed.
-- 
2.44.0.291.gc1ea87d7ee-goog


