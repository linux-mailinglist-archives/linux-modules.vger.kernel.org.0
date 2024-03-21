Return-Path: <linux-modules+bounces-895-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F5E885DF7
	for <lists+linux-modules@lfdr.de>; Thu, 21 Mar 2024 17:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E20CA1F25008
	for <lists+linux-modules@lfdr.de>; Thu, 21 Mar 2024 16:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C2F1135A52;
	Thu, 21 Mar 2024 16:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n8YcSSUT"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1AE13540A
	for <linux-modules@vger.kernel.org>; Thu, 21 Mar 2024 16:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711039052; cv=none; b=Z8ks7xJl1GxC21mzkntJqzD7icneXrX6iqmORja19Ved2GLd9iLLOtGHOwH/4hY2vYfQ+vLalt8NmJON4E8j0m7Qm7EW+zNcrLEcdWsPtrr74IaUtMOvpPXb4jhGUWfjj28ubz3DaTcehSSbsKOUMlLvjy6F9tLoUzKaVCNgNck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711039052; c=relaxed/simple;
	bh=BaI5FwltZ9MPYvqrYfL7z73ZIdY4QTxEvqI1wYv8mLU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=H4QFjZJQJISeN6MR3jC2SY3N+7Xder+sILfKqFixYxxn9aI1/TXcNBAFOZEuZviPHc25UCC/FXQTFj0/qN0idJH+PjmPVxHf1GaH06S6GNFsK7HXIH9GjWfzNURK8ZJhsA7MhihdiXcEU29n2HAjHY90Jo4kdD9Dt5zhcIQPRns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n8YcSSUT; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dcf22e5b70bso1901839276.1
        for <linux-modules@vger.kernel.org>; Thu, 21 Mar 2024 09:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711039050; x=1711643850; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dkdT2DGL8QlDQh+VA6yRS9pNWPbAmDPXuEOr3/wpZDQ=;
        b=n8YcSSUTbn64EjLCnXrjw8pr7cUOGXBDJ0fWyaecu4xK4Bu/z30xILXr4a9N2K8K9n
         mtPqo2vBk6JXVZMmtRI1cR3J7cbjva0poqE15ef8TfJZ2WsNcdAkFe8ovRrOosGPCJBy
         PdjQ93z315PwL7aQXohiBSVtdauthwd65hww8B6ADWoY96s/GzXkURMh3cwZrvgUh59f
         ftCUpj/JGB1JE1rhHnGnaG07MvDLZxJnCAk8ZExmeNztda+OqqjAWXZp8dV6Rgloo9Mm
         3Th5Ctneq48vTIomayLWdCgwQwDGpf8ojktv/3NkzChu8pWz4ptNBMPnWGX1vBkVitCC
         6nFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711039050; x=1711643850;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dkdT2DGL8QlDQh+VA6yRS9pNWPbAmDPXuEOr3/wpZDQ=;
        b=k+jvsnDP4v45uNQ2+GGztJN+8BYIIcejbdWcTQ+sW0AELOidkZSx6PUhJwrTr3MjbF
         6uXr7XaxmRLTg9EDiqhWEsOFOEC3SLl+CW+cjtplu0If2tZ2bg/TUZ1z2DxSuiAiSKs3
         iANeaafhhMyEWvMXXUnEsG9IkPLpiQbjbBFfvNXSRFXTEbkVuZbP8ihfspbi0rALNjJO
         7jqZfGLzhLFdW7znZAIgQeelpK+oJuTl4P4UVjqH5URxlgp+brRepAmWdn2/bCycdjzQ
         nBOcvqarbWs9/6Q6zXUz6LtC2u9hvlBIbTgkjQ+zLrSofNDf8GiD4OoS0sCwfY7eKeVp
         pAUQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5O9dgjyTPiP4m+duCXqZHCxjrHRWAslLNrTEs8NU/EBMerQ09ne8VAe0om1y3QX7FYbHUm12aXAPox0sfC+HdYv7MPOdzRDK8xiThrQ==
X-Gm-Message-State: AOJu0YxM7xAope9xDSH45120+BGU7i4H8U2GP8iX7OsIx5+ICYzKccNe
	1oN0YYIFgCqiNVC9/ZVAZdPc80cerkiUkqp+gxnOzGprholyVF7YUhOZvBVtXUNkjX/oN/vs94d
	9VA==
X-Google-Smtp-Source: AGHT+IH5FL19hotlByvhDCzXe4teRPXoOwhKIdyfBan8YOb9XXKYaMuIFalLgecMbTUkzippyEaUxzmEK2E=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:a489:6433:be5d:e639])
 (user=surenb job=sendgmr) by 2002:a05:6902:188f:b0:dcf:f526:4cc6 with SMTP id
 cj15-20020a056902188f00b00dcff5264cc6mr1142116ybb.11.1711039049407; Thu, 21
 Mar 2024 09:37:29 -0700 (PDT)
Date: Thu, 21 Mar 2024 09:36:31 -0700
In-Reply-To: <20240321163705.3067592-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240321163705.3067592-1-surenb@google.com>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
Message-ID: <20240321163705.3067592-10-surenb@google.com>
Subject: [PATCH v6 09/37] slab: objext: introduce objext_flags as extension to page_memcg_data_flags
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

Introduce objext_flags to store additional objext flags unrelated to memcg.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 include/linux/memcontrol.h | 29 ++++++++++++++++++++++-------
 mm/slab.h                  |  5 +----
 2 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 99f423742324..12afc2647cf0 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -357,7 +357,22 @@ enum page_memcg_data_flags {
 	__NR_MEMCG_DATA_FLAGS  = (1UL << 2),
 };
 
-#define MEMCG_DATA_FLAGS_MASK (__NR_MEMCG_DATA_FLAGS - 1)
+#define __FIRST_OBJEXT_FLAG	__NR_MEMCG_DATA_FLAGS
+
+#else /* CONFIG_MEMCG */
+
+#define __FIRST_OBJEXT_FLAG	(1UL << 0)
+
+#endif /* CONFIG_MEMCG */
+
+enum objext_flags {
+	/* the next bit after the last actual flag */
+	__NR_OBJEXTS_FLAGS  = __FIRST_OBJEXT_FLAG,
+};
+
+#define OBJEXTS_FLAGS_MASK (__NR_OBJEXTS_FLAGS - 1)
+
+#ifdef CONFIG_MEMCG
 
 static inline bool folio_memcg_kmem(struct folio *folio);
 
@@ -391,7 +406,7 @@ static inline struct mem_cgroup *__folio_memcg(struct folio *folio)
 	VM_BUG_ON_FOLIO(memcg_data & MEMCG_DATA_OBJEXTS, folio);
 	VM_BUG_ON_FOLIO(memcg_data & MEMCG_DATA_KMEM, folio);
 
-	return (struct mem_cgroup *)(memcg_data & ~MEMCG_DATA_FLAGS_MASK);
+	return (struct mem_cgroup *)(memcg_data & ~OBJEXTS_FLAGS_MASK);
 }
 
 /*
@@ -412,7 +427,7 @@ static inline struct obj_cgroup *__folio_objcg(struct folio *folio)
 	VM_BUG_ON_FOLIO(memcg_data & MEMCG_DATA_OBJEXTS, folio);
 	VM_BUG_ON_FOLIO(!(memcg_data & MEMCG_DATA_KMEM), folio);
 
-	return (struct obj_cgroup *)(memcg_data & ~MEMCG_DATA_FLAGS_MASK);
+	return (struct obj_cgroup *)(memcg_data & ~OBJEXTS_FLAGS_MASK);
 }
 
 /*
@@ -469,11 +484,11 @@ static inline struct mem_cgroup *folio_memcg_rcu(struct folio *folio)
 	if (memcg_data & MEMCG_DATA_KMEM) {
 		struct obj_cgroup *objcg;
 
-		objcg = (void *)(memcg_data & ~MEMCG_DATA_FLAGS_MASK);
+		objcg = (void *)(memcg_data & ~OBJEXTS_FLAGS_MASK);
 		return obj_cgroup_memcg(objcg);
 	}
 
-	return (struct mem_cgroup *)(memcg_data & ~MEMCG_DATA_FLAGS_MASK);
+	return (struct mem_cgroup *)(memcg_data & ~OBJEXTS_FLAGS_MASK);
 }
 
 /*
@@ -512,11 +527,11 @@ static inline struct mem_cgroup *folio_memcg_check(struct folio *folio)
 	if (memcg_data & MEMCG_DATA_KMEM) {
 		struct obj_cgroup *objcg;
 
-		objcg = (void *)(memcg_data & ~MEMCG_DATA_FLAGS_MASK);
+		objcg = (void *)(memcg_data & ~OBJEXTS_FLAGS_MASK);
 		return obj_cgroup_memcg(objcg);
 	}
 
-	return (struct mem_cgroup *)(memcg_data & ~MEMCG_DATA_FLAGS_MASK);
+	return (struct mem_cgroup *)(memcg_data & ~OBJEXTS_FLAGS_MASK);
 }
 
 static inline struct mem_cgroup *page_memcg_check(struct page *page)
diff --git a/mm/slab.h b/mm/slab.h
index 1c16dc8344fa..65db525e93af 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -554,11 +554,8 @@ static inline struct slabobj_ext *slab_obj_exts(struct slab *slab)
 	VM_BUG_ON_PAGE(obj_exts && !(obj_exts & MEMCG_DATA_OBJEXTS),
 							slab_page(slab));
 	VM_BUG_ON_PAGE(obj_exts & MEMCG_DATA_KMEM, slab_page(slab));
-
-	return (struct slabobj_ext *)(obj_exts & ~MEMCG_DATA_FLAGS_MASK);
-#else
-	return (struct slabobj_ext *)obj_exts;
 #endif
+	return (struct slabobj_ext *)(obj_exts & ~OBJEXTS_FLAGS_MASK);
 }
 
 #else /* CONFIG_SLAB_OBJ_EXT */
-- 
2.44.0.291.gc1ea87d7ee-goog


