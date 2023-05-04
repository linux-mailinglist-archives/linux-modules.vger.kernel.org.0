Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB5DE6F34A3
	for <lists+linux-modules@lfdr.de>; Mon,  1 May 2023 19:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232841AbjEARCW (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Mon, 1 May 2023 13:02:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232821AbjEARAr (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Mon, 1 May 2023 13:00:47 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03E493C35
        for <linux-modules@vger.kernel.org>; Mon,  1 May 2023 09:56:47 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-b9a792ff423so5508506276.1
        for <linux-modules@vger.kernel.org>; Mon, 01 May 2023 09:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682960178; x=1685552178;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FLzZ9YV8+8xWjeDeRDWFnLJt6gby5ahlup+t8unODj4=;
        b=6MUphdHNce/Gp+joNLguOb4c4BxZ2K95cOfq0noWa5+zgK3o6mMkxvgmYTxKopfE12
         gvzB4L7ekld5KXS4qJrG0iyIY1OJTcBOr1jnrj5Qj+XSjPc9d8l46YT4nC5jTNEYkgOa
         Ftsse48iJ0f92YHed3wWA/J0eqwt07vyXvq1REgD9bK10yNIvJKHoqfnJDmh6CoLNpLi
         pUPv1EUVjPqy0lNNdb2UUSVTJnBt6kuBEfOfDhudMx+qNc4MyWYtoUsdbUWBDNV9FGAp
         xUasOVCUh854FOcecSCfYemAj9x0uxOHD+fuFHr9oLGXAgOTof3XgPYghDgqHqQy10zL
         pGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682960178; x=1685552178;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FLzZ9YV8+8xWjeDeRDWFnLJt6gby5ahlup+t8unODj4=;
        b=MwWnxxOhNQwtjy3P3xQGb3+2piVGZLQIaFk7BlE7UnOEFjkUO/b17J4Hg+YyonNF6H
         DgrDaVfSxOPNANBmlLSPdnizgY4+UKR0MaQ9ZvjS05qPXljSdMSjhKMtt9BrQ4TazKmV
         3c650Ffgs0yfmKBQsKbBdYOIg9q3nE+J5cFDANhOZyWyOOuXUdwfSxOHImsJx/ARLAzL
         1p3jzVdiKMMRQanzWys+3GqodKXJILp91j5gTpZ1X/gkp0bOODYUQt6lXTbmI+Le9PRW
         BhmpBWBDioS8dxI1+DBS9FYyG4c4lovKNLBoeIjtxB0LBgF+AWuAbYV8cLu85cBD4/1n
         EcKA==
X-Gm-Message-State: AC+VfDxuUJ7p5ZLZRa7uDdZaTrMhNEBRU7RtcDq9pantpAbRtflpO4qx
        GtfBx9EUGtw4kVJbJwul1tG9pDMO+rk=
X-Google-Smtp-Source: ACHHUZ66kr0Wi3To7Fb9ZeLfyGM0k4cAx/qlYDAQpdI8t7cF2IOT9smAXhzqkgeAFGYo751C+YmUvQHpTxw=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:6d24:3efd:facc:7ac4])
 (user=surenb job=sendgmr) by 2002:a25:d18e:0:b0:b9e:5008:1770 with SMTP id
 i136-20020a25d18e000000b00b9e50081770mr393470ybg.8.1682960178602; Mon, 01 May
 2023 09:56:18 -0700 (PDT)
Date:   Mon,  1 May 2023 09:54:41 -0700
In-Reply-To: <20230501165450.15352-1-surenb@google.com>
Mime-Version: 1.0
References: <20230501165450.15352-1-surenb@google.com>
X-Mailer: git-send-email 2.40.1.495.gc816e09b53d-goog
Message-ID: <20230501165450.15352-32-surenb@google.com>
Subject: [PATCH 31/40] mm: percpu: enable per-cpu allocation tagging
From:   Suren Baghdasaryan <surenb@google.com>
To:     akpm@linux-foundation.org
Cc:     kent.overstreet@linux.dev, mhocko@suse.com, vbabka@suse.cz,
        hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de,
        dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com,
        corbet@lwn.net, void@manifault.com, peterz@infradead.org,
        juri.lelli@redhat.com, ldufour@linux.ibm.com,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
        x86@kernel.org, peterx@redhat.com, david@redhat.com,
        axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org,
        nathan@kernel.org, dennis@kernel.org, tj@kernel.org,
        muchun.song@linux.dev, rppt@kernel.org, paulmck@kernel.org,
        pasha.tatashin@soleen.com, yosryahmed@google.com,
        yuzhao@google.com, dhowells@redhat.com, hughd@google.com,
        andreyknvl@gmail.com, keescook@chromium.org,
        ndesaulniers@google.com, gregkh@linuxfoundation.org,
        ebiggers@google.com, ytcoode@gmail.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        bristot@redhat.com, vschneid@redhat.com, cl@linux.com,
        penberg@kernel.org, iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com,
        glider@google.com, elver@google.com, dvyukov@google.com,
        shakeelb@google.com, songmuchun@bytedance.com, jbaron@akamai.com,
        rientjes@google.com, minchan@google.com, kaleshsingh@google.com,
        surenb@google.com, kernel-team@android.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arch@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-modules@vger.kernel.org, kasan-dev@googlegroups.com,
        cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

Redefine __alloc_percpu, __alloc_percpu_gfp and __alloc_reserved_percpu
to record allocations and deallocations done by these functions.

Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/percpu.h | 19 ++++++++----
 mm/percpu.c            | 66 +++++-------------------------------------
 2 files changed, 22 insertions(+), 63 deletions(-)

diff --git a/include/linux/percpu.h b/include/linux/percpu.h
index 1338ea2aa720..51ec257379af 100644
--- a/include/linux/percpu.h
+++ b/include/linux/percpu.h
@@ -2,12 +2,14 @@
 #ifndef __LINUX_PERCPU_H
 #define __LINUX_PERCPU_H
 
+#include <linux/alloc_tag.h>
 #include <linux/mmdebug.h>
 #include <linux/preempt.h>
 #include <linux/smp.h>
 #include <linux/cpumask.h>
 #include <linux/pfn.h>
 #include <linux/init.h>
+#include <linux/sched.h>
 
 #include <asm/percpu.h>
 
@@ -116,7 +118,6 @@ extern int __init pcpu_page_first_chunk(size_t reserved_size,
 				pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn);
 #endif
 
-extern void __percpu *__alloc_reserved_percpu(size_t size, size_t align) __alloc_size(1);
 extern bool __is_kernel_percpu_address(unsigned long addr, unsigned long *can_addr);
 extern bool is_kernel_percpu_address(unsigned long addr);
 
@@ -124,10 +125,15 @@ extern bool is_kernel_percpu_address(unsigned long addr);
 extern void __init setup_per_cpu_areas(void);
 #endif
 
-extern void __percpu *__alloc_percpu_gfp(size_t size, size_t align, gfp_t gfp) __alloc_size(1);
-extern void __percpu *__alloc_percpu(size_t size, size_t align) __alloc_size(1);
-extern void free_percpu(void __percpu *__pdata);
-extern phys_addr_t per_cpu_ptr_to_phys(void *addr);
+extern void __percpu *__pcpu_alloc(size_t size, size_t align, bool reserved,
+				   gfp_t gfp) __alloc_size(1);
+
+#define __alloc_percpu_gfp(_size, _align, _gfp)	alloc_hooks(		\
+		__pcpu_alloc(_size, _align, false, _gfp), void __percpu *, NULL)
+#define __alloc_percpu(_size, _align)		alloc_hooks(		\
+		__pcpu_alloc(_size, _align, false, GFP_KERNEL), void __percpu *, NULL)
+#define __alloc_reserved_percpu(_size, _align)	alloc_hooks(		\
+		__pcpu_alloc(_size, _align, true, GFP_KERNEL), void __percpu *, NULL)
 
 #define alloc_percpu_gfp(type, gfp)					\
 	(typeof(type) __percpu *)__alloc_percpu_gfp(sizeof(type),	\
@@ -136,6 +142,9 @@ extern phys_addr_t per_cpu_ptr_to_phys(void *addr);
 	(typeof(type) __percpu *)__alloc_percpu(sizeof(type),		\
 						__alignof__(type))
 
+extern void free_percpu(void __percpu *__pdata);
+extern phys_addr_t per_cpu_ptr_to_phys(void *addr);
+
 extern unsigned long pcpu_nr_pages(void);
 
 #endif /* __LINUX_PERCPU_H */
diff --git a/mm/percpu.c b/mm/percpu.c
index 4e2592f2e58f..4b5cf260d8e0 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -1728,7 +1728,7 @@ static void pcpu_alloc_tag_free_hook(struct pcpu_chunk *chunk, int off, size_t s
 #endif
 
 /**
- * pcpu_alloc - the percpu allocator
+ * __pcpu_alloc - the percpu allocator
  * @size: size of area to allocate in bytes
  * @align: alignment of area (max PAGE_SIZE)
  * @reserved: allocate from the reserved chunk if available
@@ -1742,8 +1742,8 @@ static void pcpu_alloc_tag_free_hook(struct pcpu_chunk *chunk, int off, size_t s
  * RETURNS:
  * Percpu pointer to the allocated area on success, NULL on failure.
  */
-static void __percpu *pcpu_alloc(size_t size, size_t align, bool reserved,
-				 gfp_t gfp)
+void __percpu *__pcpu_alloc(size_t size, size_t align, bool reserved,
+			    gfp_t gfp)
 {
 	gfp_t pcpu_gfp;
 	bool is_atomic;
@@ -1909,6 +1909,8 @@ static void __percpu *pcpu_alloc(size_t size, size_t align, bool reserved,
 
 	pcpu_memcg_post_alloc_hook(objcg, chunk, off, size);
 
+	pcpu_alloc_tag_alloc_hook(chunk, off, size);
+
 	return ptr;
 
 fail_unlock:
@@ -1935,61 +1937,7 @@ static void __percpu *pcpu_alloc(size_t size, size_t align, bool reserved,
 
 	return NULL;
 }
-
-/**
- * __alloc_percpu_gfp - allocate dynamic percpu area
- * @size: size of area to allocate in bytes
- * @align: alignment of area (max PAGE_SIZE)
- * @gfp: allocation flags
- *
- * Allocate zero-filled percpu area of @size bytes aligned at @align.  If
- * @gfp doesn't contain %GFP_KERNEL, the allocation doesn't block and can
- * be called from any context but is a lot more likely to fail. If @gfp
- * has __GFP_NOWARN then no warning will be triggered on invalid or failed
- * allocation requests.
- *
- * RETURNS:
- * Percpu pointer to the allocated area on success, NULL on failure.
- */
-void __percpu *__alloc_percpu_gfp(size_t size, size_t align, gfp_t gfp)
-{
-	return pcpu_alloc(size, align, false, gfp);
-}
-EXPORT_SYMBOL_GPL(__alloc_percpu_gfp);
-
-/**
- * __alloc_percpu - allocate dynamic percpu area
- * @size: size of area to allocate in bytes
- * @align: alignment of area (max PAGE_SIZE)
- *
- * Equivalent to __alloc_percpu_gfp(size, align, %GFP_KERNEL).
- */
-void __percpu *__alloc_percpu(size_t size, size_t align)
-{
-	return pcpu_alloc(size, align, false, GFP_KERNEL);
-}
-EXPORT_SYMBOL_GPL(__alloc_percpu);
-
-/**
- * __alloc_reserved_percpu - allocate reserved percpu area
- * @size: size of area to allocate in bytes
- * @align: alignment of area (max PAGE_SIZE)
- *
- * Allocate zero-filled percpu area of @size bytes aligned at @align
- * from reserved percpu area if arch has set it up; otherwise,
- * allocation is served from the same dynamic area.  Might sleep.
- * Might trigger writeouts.
- *
- * CONTEXT:
- * Does GFP_KERNEL allocation.
- *
- * RETURNS:
- * Percpu pointer to the allocated area on success, NULL on failure.
- */
-void __percpu *__alloc_reserved_percpu(size_t size, size_t align)
-{
-	return pcpu_alloc(size, align, true, GFP_KERNEL);
-}
+EXPORT_SYMBOL_GPL(__pcpu_alloc);
 
 /**
  * pcpu_balance_free - manage the amount of free chunks
@@ -2299,6 +2247,8 @@ void free_percpu(void __percpu *ptr)
 
 	size = pcpu_free_area(chunk, off);
 
+	pcpu_alloc_tag_free_hook(chunk, off, size);
+
 	pcpu_memcg_free_hook(chunk, off, size);
 
 	/*
-- 
2.40.1.495.gc816e09b53d-goog

