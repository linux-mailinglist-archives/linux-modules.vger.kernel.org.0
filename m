Return-Path: <linux-modules+bounces-146-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF3F7D52EB
	for <lists+linux-modules@lfdr.de>; Tue, 24 Oct 2023 15:49:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1A5BB22301
	for <lists+linux-modules@lfdr.de>; Tue, 24 Oct 2023 13:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E3538F88;
	Tue, 24 Oct 2023 13:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e8MH4gnJ"
X-Original-To: linux-modules@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED092E629
	for <linux-modules@vger.kernel.org>; Tue, 24 Oct 2023 13:47:56 +0000 (UTC)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FD4D1FD0
	for <linux-modules@vger.kernel.org>; Tue, 24 Oct 2023 06:47:47 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d9c5708ddbeso5260158276.1
        for <linux-modules@vger.kernel.org>; Tue, 24 Oct 2023 06:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698155266; x=1698760066; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QaUscnVR3A9ivKzFSXLwhZ9WVAKd01wEmSHK760WXQ8=;
        b=e8MH4gnJoAUpsPTyheF3wyTjBPTAOvkvqVsK4m8evYCMDbM6k+SRnEdexKewJMF7/C
         EB+7Qnca8n5RsAn+fOZdyj4uFlE1s2YGQp4QnyfI9JXhdkE73Nt5gfPaBTfcjTUg3Sd8
         HR73DgnWHRunS5r+0EAFzWrR12p/qSOSyHva2483Ojt6rdfZF5B2we8JKHfTgq3yhG9a
         7XPCtBXakeJgYmQV/DyoXGmlJC5ndSrmERPszGYkrWw4D/k7TXi/210ANxAAb0ZUpvkQ
         JYmaZyCTkTwCEXDflhlWc22d4aZm+PslZre6aCXyTUzv+wm7gMRlLH3VYHGPcYPYvzPv
         1+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698155266; x=1698760066;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QaUscnVR3A9ivKzFSXLwhZ9WVAKd01wEmSHK760WXQ8=;
        b=fqWduy34xPMaPuTFk3zYf4S+fWGG3FqUHceTU1+gfAnBVpKC+U63iDRyNOiKPgSyYW
         beXXTyjbtVzMT11arMZdBUO6jZk/TAjiZiDxbkb6AmUbM5GThXFk3c0Aws/wcIeLli4J
         z8U0rpbuWHWdApsptRuFginvL4zjF+AzW7uOlpRd9FSGOXjqeDKMK4hXLky60FIa0nor
         Fl5A56TBeoDHf7CFb7lEZwxQwglMJv3M7mhv2Iy0unVEIL6P5uLrgwK/hF6AniChySbg
         Jch7aukJk0ZRzqro0cMr/nBVYAEZRv8D6q78aUeLwT+dqcgJGrorRtV+PqCor/Dgu5jd
         5Gjg==
X-Gm-Message-State: AOJu0YwSPfCJEXkGZQhl9T7CktfZn6g7cuEq+AQIV03cf09KnFF3ZpEy
	Z+4dKCTAp0xKpW5HdPv4mcTLciUO9Oc=
X-Google-Smtp-Source: AGHT+IH1Lkjv7kiNBXwNvQL565BH4DAdvvh1g2aWFQE+hKVCSXY8/YuVaym3f5veoHBOTW82zGAoDjJNWeM=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:45ba:3318:d7a5:336a])
 (user=surenb job=sendgmr) by 2002:a05:6902:105:b0:da0:3da9:ce08 with SMTP id
 o5-20020a056902010500b00da03da9ce08mr35592ybh.10.1698155266214; Tue, 24 Oct
 2023 06:47:46 -0700 (PDT)
Date: Tue, 24 Oct 2023 06:46:26 -0700
In-Reply-To: <20231024134637.3120277-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231024134637.3120277-1-surenb@google.com>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
Message-ID: <20231024134637.3120277-30-surenb@google.com>
Subject: [PATCH v2 29/39] mm: percpu: Introduce pcpuobj_ext
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	corbet@lwn.net, void@manifault.com, peterz@infradead.org, 
	juri.lelli@redhat.com, ldufour@linux.ibm.com, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org, muchun.song@linux.dev, 
	rppt@kernel.org, paulmck@kernel.org, pasha.tatashin@soleen.com, 
	yosryahmed@google.com, yuzhao@google.com, dhowells@redhat.com, 
	hughd@google.com, andreyknvl@gmail.com, keescook@chromium.org, 
	ndesaulniers@google.com, vvvvvv@google.com, gregkh@linuxfoundation.org, 
	ebiggers@google.com, ytcoode@gmail.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	bristot@redhat.com, vschneid@redhat.com, cl@linux.com, penberg@kernel.org, 
	iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com, 
	elver@google.com, dvyukov@google.com, shakeelb@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, rientjes@google.com, 
	minchan@google.com, kaleshsingh@google.com, surenb@google.com, 
	kernel-team@android.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Kent Overstreet <kent.overstreet@linux.dev>

Upcoming alloc tagging patches require a place to stash per-allocation
metadata.

We already do this when memcg is enabled, so this patch generalizes the
obj_cgroup * vector in struct pcpu_chunk by creating a pcpu_obj_ext
type, which we will be adding to in an upcoming patch - similarly to the
previous slabobj_ext patch.

Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Dennis Zhou <dennis@kernel.org>
Cc: Tejun Heo <tj@kernel.org>
Cc: Christoph Lameter <cl@linux.com>
Cc: linux-mm@kvack.org
---
 mm/percpu-internal.h | 19 +++++++++++++++++--
 mm/percpu.c          | 30 +++++++++++++++---------------
 2 files changed, 32 insertions(+), 17 deletions(-)

diff --git a/mm/percpu-internal.h b/mm/percpu-internal.h
index cdd0aa597a81..e62d582f4bf3 100644
--- a/mm/percpu-internal.h
+++ b/mm/percpu-internal.h
@@ -32,6 +32,16 @@ struct pcpu_block_md {
 	int			nr_bits;	/* total bits responsible for */
 };
 
+struct pcpuobj_ext {
+#ifdef CONFIG_MEMCG_KMEM
+	struct obj_cgroup	*cgroup;
+#endif
+};
+
+#ifdef CONFIG_MEMCG_KMEM
+#define NEED_PCPUOBJ_EXT
+#endif
+
 struct pcpu_chunk {
 #ifdef CONFIG_PERCPU_STATS
 	int			nr_alloc;	/* # of allocations */
@@ -64,8 +74,8 @@ struct pcpu_chunk {
 	int			end_offset;	/* additional area required to
 						   have the region end page
 						   aligned */
-#ifdef CONFIG_MEMCG_KMEM
-	struct obj_cgroup	**obj_cgroups;	/* vector of object cgroups */
+#ifdef NEED_PCPUOBJ_EXT
+	struct pcpuobj_ext	*obj_exts;	/* vector of object cgroups */
 #endif
 
 	int			nr_pages;	/* # of pages served by this chunk */
@@ -74,6 +84,11 @@ struct pcpu_chunk {
 	unsigned long		populated[];	/* populated bitmap */
 };
 
+static inline bool need_pcpuobj_ext(void)
+{
+	return !mem_cgroup_kmem_disabled();
+}
+
 extern spinlock_t pcpu_lock;
 
 extern struct list_head *pcpu_chunk_lists;
diff --git a/mm/percpu.c b/mm/percpu.c
index a7665de8485f..5a6202acffa3 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -1392,9 +1392,9 @@ static struct pcpu_chunk * __init pcpu_alloc_first_chunk(unsigned long tmp_addr,
 		panic("%s: Failed to allocate %zu bytes\n", __func__,
 		      alloc_size);
 
-#ifdef CONFIG_MEMCG_KMEM
+#ifdef NEED_PCPUOBJ_EXT
 	/* first chunk is free to use */
-	chunk->obj_cgroups = NULL;
+	chunk->obj_exts = NULL;
 #endif
 	pcpu_init_md_blocks(chunk);
 
@@ -1463,12 +1463,12 @@ static struct pcpu_chunk *pcpu_alloc_chunk(gfp_t gfp)
 	if (!chunk->md_blocks)
 		goto md_blocks_fail;
 
-#ifdef CONFIG_MEMCG_KMEM
-	if (!mem_cgroup_kmem_disabled()) {
-		chunk->obj_cgroups =
+#ifdef NEED_PCPUOBJ_EXT
+	if (need_pcpuobj_ext()) {
+		chunk->obj_exts =
 			pcpu_mem_zalloc(pcpu_chunk_map_bits(chunk) *
-					sizeof(struct obj_cgroup *), gfp);
-		if (!chunk->obj_cgroups)
+					sizeof(struct pcpuobj_ext), gfp);
+		if (!chunk->obj_exts)
 			goto objcg_fail;
 	}
 #endif
@@ -1480,7 +1480,7 @@ static struct pcpu_chunk *pcpu_alloc_chunk(gfp_t gfp)
 
 	return chunk;
 
-#ifdef CONFIG_MEMCG_KMEM
+#ifdef NEED_PCPUOBJ_EXT
 objcg_fail:
 	pcpu_mem_free(chunk->md_blocks);
 #endif
@@ -1498,8 +1498,8 @@ static void pcpu_free_chunk(struct pcpu_chunk *chunk)
 {
 	if (!chunk)
 		return;
-#ifdef CONFIG_MEMCG_KMEM
-	pcpu_mem_free(chunk->obj_cgroups);
+#ifdef NEED_PCPUOBJ_EXT
+	pcpu_mem_free(chunk->obj_exts);
 #endif
 	pcpu_mem_free(chunk->md_blocks);
 	pcpu_mem_free(chunk->bound_map);
@@ -1648,8 +1648,8 @@ static void pcpu_memcg_post_alloc_hook(struct obj_cgroup *objcg,
 	if (!objcg)
 		return;
 
-	if (likely(chunk && chunk->obj_cgroups)) {
-		chunk->obj_cgroups[off >> PCPU_MIN_ALLOC_SHIFT] = objcg;
+	if (likely(chunk && chunk->obj_exts)) {
+		chunk->obj_exts[off >> PCPU_MIN_ALLOC_SHIFT].cgroup = objcg;
 
 		rcu_read_lock();
 		mod_memcg_state(obj_cgroup_memcg(objcg), MEMCG_PERCPU_B,
@@ -1665,13 +1665,13 @@ static void pcpu_memcg_free_hook(struct pcpu_chunk *chunk, int off, size_t size)
 {
 	struct obj_cgroup *objcg;
 
-	if (unlikely(!chunk->obj_cgroups))
+	if (unlikely(!chunk->obj_exts))
 		return;
 
-	objcg = chunk->obj_cgroups[off >> PCPU_MIN_ALLOC_SHIFT];
+	objcg = chunk->obj_exts[off >> PCPU_MIN_ALLOC_SHIFT].cgroup;
 	if (!objcg)
 		return;
-	chunk->obj_cgroups[off >> PCPU_MIN_ALLOC_SHIFT] = NULL;
+	chunk->obj_exts[off >> PCPU_MIN_ALLOC_SHIFT].cgroup = NULL;
 
 	obj_cgroup_uncharge(objcg, pcpu_obj_full_size(size));
 
-- 
2.42.0.758.gaed0368e0e-goog


