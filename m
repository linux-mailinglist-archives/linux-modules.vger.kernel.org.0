Return-Path: <linux-modules+bounces-699-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0595985E85C
	for <lists+linux-modules@lfdr.de>; Wed, 21 Feb 2024 20:55:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 293261C23676
	for <lists+linux-modules@lfdr.de>; Wed, 21 Feb 2024 19:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE7815A495;
	Wed, 21 Feb 2024 19:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QT+I9dIj"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0793A159580
	for <linux-modules@vger.kernel.org>; Wed, 21 Feb 2024 19:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708544535; cv=none; b=OYprG8VglFgMGh/kiZMtKuqxz7zNNN1Xss3D3b5d8TX8hnPHuffbZVB5JoWMCwg61xs/KdCI31tgz1ZZPro2uSMyg8frzy6U9+w2Kr2khsSrfzLItUbFsIXrywM5E09Lq042jX3VYFl7f/w2rpNydzbi8haHY+iIofy8rfVCkvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708544535; c=relaxed/simple;
	bh=EtGZdtp4JE5smpUDDSnJSa8gqme5Eknt5nfrguZ5Ojo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=H4uuAWFw1YIidbl9fqm6K42w4t/qrnGebJ/TjGhSAMZiPohGYNZaMi5kOkfEJaLEwm5nZUAJfxKG0/RJp0pPfFQsMsQouu/AILcQqa4IbjP8X8x1llCmHPIscZlbPlZ4M5L4asauFMFderV2w6GmT0lob9lrTupjvWA3DiV8EFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QT+I9dIj; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dcd1779adbeso14724498276.3
        for <linux-modules@vger.kernel.org>; Wed, 21 Feb 2024 11:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708544532; x=1709149332; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BN4n4r+pGIOuiPq9+HuwMZ/LVswbQsC+381oXCoHOQk=;
        b=QT+I9dIjrlm7aN6nkJGW/ej3yiHgWW7Qwb7FpTrIyH1ib3gBkYMqePkO0wmFPRaCxC
         6KqyXfULJJSimBHXlo0rtG6Blv181jgBfuErdDwvDdHc1AiIHGW6cAzQOH1YoqpjqUYy
         HJjomKc3iolr55SQrzqkF6jqXBps8caJMt6/KUhv9R2tusZKk+umMd3EKll9K55rPMsV
         n0hpu13GyFEZ7pOfh63kGUqT4XPbeg3SKvD19/zyadqPMq8S54HDUmBkUHekT7D/mMIf
         Fqi8sVFaWJdoDCq1I3GOprzw8fUs5irMZwObwN3Vo06XszZ5mZK0gklhiuO5HzbjEdnH
         y3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708544532; x=1709149332;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BN4n4r+pGIOuiPq9+HuwMZ/LVswbQsC+381oXCoHOQk=;
        b=B6JEvmv+3zmC0XRYmJ/etLKypyc1pZk8GiqsXpdzL94BfbG/mtUNhTfvlQTn5mvPGh
         wZbx5P6R1AMDubcSeFiMJUmbDKxuzkcaIw1BGpPywww1JM2VUUzmnt+skBVk+ZE1+YTx
         X9pM/p6NfgnKQkb14JIsLyvm8cCGBc4/6s3h5oAGYr0WqLYQrTKFpTvtu4biGVK9ee/v
         s1e90hoL8m0JCTTbJB6UwTQIe51GbWAO+nOLaKg8hqj5ejT9I0QpnZjGh2jrWaXHCqMP
         mMz2cLPuxlCBYi62UaACnHw3AYJK9kAW3jun1TfrHMVSoRcvqn1PMiC+rgBTU8iPw6ZO
         47uw==
X-Forwarded-Encrypted: i=1; AJvYcCUbhktQ8R6mu3LbFXOPklSbvLZBn7TgbXrPkgBGyDQs96ek7GnZeRxw0eOwJdH2ItuDeWcaHtTsl4DOsHaMu8d9/8W4Y0T5Ux0njOJAGA==
X-Gm-Message-State: AOJu0Yw6dDBi1JVM9nP+2FEuSdfwWxME81TTzayRN6+5REoVPnIzavvL
	xFsW21wjs4BWdLcumhHc8a6km5WhbDomouIJF4AQqszYM+RiX8TU6eBI8qb4c02qbsCb4k8ZPMe
	M5w==
X-Google-Smtp-Source: AGHT+IGccLdK1+8RZqTfFKQGLX6PM7i11Typ+L1RnqZIOYRT2MopGhT4QGJWEbhgFrEtPg85XhcRKYt7Lzg=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:953b:9a4e:1e10:3f07])
 (user=surenb job=sendgmr) by 2002:a25:ab6f:0:b0:dcb:b9d7:2760 with SMTP id
 u102-20020a25ab6f000000b00dcbb9d72760mr67613ybi.13.1708544531841; Wed, 21 Feb
 2024 11:42:11 -0800 (PST)
Date: Wed, 21 Feb 2024 11:40:47 -0800
In-Reply-To: <20240221194052.927623-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240221194052.927623-1-surenb@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221194052.927623-35-surenb@google.com>
Subject: [PATCH v4 34/36] codetag: debug: introduce OBJEXTS_ALLOC_FAIL to mark
 failed slab_ext allocations
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

If slabobj_ext vector allocation for a slab object fails and later on it
succeeds for another object in the same slab, the slabobj_ext for the
original object will be NULL and will be flagged in case when
CONFIG_MEM_ALLOC_PROFILING_DEBUG is enabled.
Mark failed slabobj_ext vector allocations using a new objext_flags flag
stored in the lower bits of slab->obj_exts. When new allocation succeeds
it marks all tag references in the same slabobj_ext vector as empty to
avoid warnings implemented by CONFIG_MEM_ALLOC_PROFILING_DEBUG checks.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/memcontrol.h |  4 +++-
 mm/slub.c                  | 46 ++++++++++++++++++++++++++++++++------
 2 files changed, 42 insertions(+), 8 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 2b010316016c..f95241ca9052 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -365,8 +365,10 @@ enum page_memcg_data_flags {
 #endif /* CONFIG_MEMCG */
 
 enum objext_flags {
+	/* slabobj_ext vector failed to allocate */
+	OBJEXTS_ALLOC_FAIL = __FIRST_OBJEXT_FLAG,
 	/* the next bit after the last actual flag */
-	__NR_OBJEXTS_FLAGS  = __FIRST_OBJEXT_FLAG,
+	__NR_OBJEXTS_FLAGS  = (__FIRST_OBJEXT_FLAG << 1),
 };
 
 #define OBJEXTS_FLAGS_MASK (__NR_OBJEXTS_FLAGS - 1)
diff --git a/mm/slub.c b/mm/slub.c
index 3e41d45f9fa4..43d63747cad2 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -1901,9 +1901,33 @@ static inline void mark_objexts_empty(struct slabobj_ext *obj_exts)
 	}
 }
 
+static inline void mark_failed_objexts_alloc(struct slab *slab)
+{
+	slab->obj_exts = OBJEXTS_ALLOC_FAIL;
+}
+
+static inline void handle_failed_objexts_alloc(unsigned long obj_exts,
+			struct slabobj_ext *vec, unsigned int objects)
+{
+	/*
+	 * If vector previously failed to allocate then we have live
+	 * objects with no tag reference. Mark all references in this
+	 * vector as empty to avoid warnings later on.
+	 */
+	if (obj_exts & OBJEXTS_ALLOC_FAIL) {
+		unsigned int i;
+
+		for (i = 0; i < objects; i++)
+			set_codetag_empty(&vec[i].ref);
+	}
+}
+
 #else /* CONFIG_MEM_ALLOC_PROFILING_DEBUG */
 
 static inline void mark_objexts_empty(struct slabobj_ext *obj_exts) {}
+static inline void mark_failed_objexts_alloc(struct slab *slab) {}
+static inline void handle_failed_objexts_alloc(unsigned long obj_exts,
+			struct slabobj_ext *vec, unsigned int objects) {}
 
 #endif /* CONFIG_MEM_ALLOC_PROFILING_DEBUG */
 
@@ -1919,29 +1943,37 @@ int alloc_slab_obj_exts(struct slab *slab, struct kmem_cache *s,
 			gfp_t gfp, bool new_slab)
 {
 	unsigned int objects = objs_per_slab(s, slab);
-	unsigned long obj_exts;
-	void *vec;
+	unsigned long new_exts;
+	unsigned long old_exts;
+	struct slabobj_ext *vec;
 
 	gfp &= ~OBJCGS_CLEAR_MASK;
 	/* Prevent recursive extension vector allocation */
 	gfp |= __GFP_NO_OBJ_EXT;
 	vec = kcalloc_node(objects, sizeof(struct slabobj_ext), gfp,
 			   slab_nid(slab));
-	if (!vec)
+	if (!vec) {
+		/* Mark vectors which failed to allocate */
+		if (new_slab)
+			mark_failed_objexts_alloc(slab);
+
 		return -ENOMEM;
+	}
 
-	obj_exts = (unsigned long)vec;
+	new_exts = (unsigned long)vec;
 #ifdef CONFIG_MEMCG
-	obj_exts |= MEMCG_DATA_OBJEXTS;
+	new_exts |= MEMCG_DATA_OBJEXTS;
 #endif
+	old_exts = slab->obj_exts;
+	handle_failed_objexts_alloc(old_exts, vec, objects);
 	if (new_slab) {
 		/*
 		 * If the slab is brand new and nobody can yet access its
 		 * obj_exts, no synchronization is required and obj_exts can
 		 * be simply assigned.
 		 */
-		slab->obj_exts = obj_exts;
-	} else if (cmpxchg(&slab->obj_exts, 0, obj_exts)) {
+		slab->obj_exts = new_exts;
+	} else if (cmpxchg(&slab->obj_exts, old_exts, new_exts) != old_exts) {
 		/*
 		 * If the slab is already in use, somebody can allocate and
 		 * assign slabobj_exts in parallel. In this case the existing
-- 
2.44.0.rc0.258.g7320e95886-goog


