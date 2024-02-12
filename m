Return-Path: <linux-modules+bounces-457-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF59852052
	for <lists+linux-modules@lfdr.de>; Mon, 12 Feb 2024 22:47:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5CECB2555A
	for <lists+linux-modules@lfdr.de>; Mon, 12 Feb 2024 21:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14EAC55E4A;
	Mon, 12 Feb 2024 21:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TZwz6uBE"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5AB55799
	for <linux-modules@vger.kernel.org>; Mon, 12 Feb 2024 21:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707774015; cv=none; b=UdsafDP/43B3/XbdkR80vXurOtWoWm5CluwXZ5GdYnvTV0I+e3dteCyPHLazUOOMtN8lle7Kzzv7J6Y+b0u8Ow4XkDXIRb5qOEG0zynrx2G1pniP/iH0iIxEQ2tGkB3YsGuQMEYpWdJcRxa6akyt8c9djmfRyKTu4u56JvoL8yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707774015; c=relaxed/simple;
	bh=739Pm3kYnMAr8exPlAiXO0Y/KQxGxE3So1S+V16L2B8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MbERjbrO07ZthHOgpgx9wq0lb9ZldXkNBST9ChLnuLSp9hjZ48/UczgTbjgg6VMJdpXtpVP62bRSh01creJ6Dex6Lj75wA8jgD/ik+sWQklgfUJbJxWYnOyHXzIBOC3+RF9GyqdeQM/+jaHZHPdh67bhDn9w+9ktgRlbLFm8Wu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TZwz6uBE; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-5efe82b835fso84266327b3.0
        for <linux-modules@vger.kernel.org>; Mon, 12 Feb 2024 13:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707774009; x=1708378809; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GrGwB9qfJZ8baAR6T6ipxUZf1yCQtYwXa3nH2rh59j0=;
        b=TZwz6uBEjg0OiOzYHw6O84ayV05IB5s+xwMhxMd5Okq0STG6lIhNokaXJJEFBItRBH
         rmJMa24jZr2DHzaKjdCi7tAinL202GCPoJNFEUwWBFnshp4Bp28hNFf5xOJgeWRAFu8e
         KJc8y83pT2STLzefEuZ+aF5OYnov8OJrIwXUaIIECvBi7Y78EM16ROtdmiagPOoAqnMj
         HuqFK370+6TOEcTrk96CzYlTE0IqXeBQMOlAWkcUk9gfvd6S1D8RxhVHxNN3KwtYNw0D
         9k1sDhnBR/VbnREV7bm59dmUU8AosDfILjb0cGk3MqfECzPGezsLAxZSUrv6rEng+JHI
         JD6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707774009; x=1708378809;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GrGwB9qfJZ8baAR6T6ipxUZf1yCQtYwXa3nH2rh59j0=;
        b=ZYHnw6365z5QMT89iGB2N6rtOYIA2DVBqMkZOsTM9B83pye6LTsnVSJZVe2SUIzZR2
         vD4QuenuK8iEXT+WJL4hEWOGkhj6ir+9sKVfWN4i/q/+oqbCKYzV7Ruat4I4Xh7TOaoh
         RJm+51JGTG+YiwPJCVhDgsdDsD/O/pah31qlxhocoO7ebm90ldJDllkj0XuO7Fg6kPub
         VssLz+i83sXyprh0XdvSaeRB1jyxO8ltPP1ADiDrnE3LjwWb52LQrS0BRtrezZPXxDHz
         8fwf94zWoMVU25pJPgdvDec4IlZQWx+v3aahDyseIDn1WGZNr6tvOwDY4MyV5/gi4cSW
         ixpA==
X-Forwarded-Encrypted: i=1; AJvYcCWl8at6E7/TGXIW6putmIW81TFMA8Z3lnAZ5WeJy5kaldqzngDWDpopNmGxjiJEPaPdydVtAkvf/8r2WTuIPm0LOJa8nRNdmx4KZXJ1hw==
X-Gm-Message-State: AOJu0YxI1uEsXNRqhQ2VMrWDGStMvz2WiCw3CP7GYLw9oGZ2A/huZ6QI
	MzvBxsSS6MUdkVjeWMTKDy/dzQ7ozVgPsBD6IWEJFF1v+rTSuvvmXm17d8dSsIyoHHbezRqQux4
	9YA==
X-Google-Smtp-Source: AGHT+IHSOOtqV+tB0AgXVysbclo7veEI+l/B8vUwDQqYprkJNFv3jRaKZjBjeFfz/9+sevD0Aijuq2/T8Xg=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:b848:2b3f:be49:9cbc])
 (user=surenb job=sendgmr) by 2002:a05:690c:3505:b0:604:9b11:ff2 with SMTP id
 fq5-20020a05690c350500b006049b110ff2mr2208602ywb.6.1707774009704; Mon, 12 Feb
 2024 13:40:09 -0800 (PST)
Date: Mon, 12 Feb 2024 13:39:03 -0800
In-Reply-To: <20240212213922.783301-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240212213922.783301-1-surenb@google.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240212213922.783301-18-surenb@google.com>
Subject: [PATCH v3 17/35] mm: enable page allocation tagging
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	corbet@lwn.net, void@manifault.com, peterz@infradead.org, 
	juri.lelli@redhat.com, catalin.marinas@arm.com, will@kernel.org, 
	arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
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

Redefine page allocators to record allocation tags upon their invocation.
Instrument post_alloc_hook and free_pages_prepare to modify current
allocation tag.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Co-developed-by: Kent Overstreet <kent.overstreet@linux.dev>
Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
---
 include/linux/alloc_tag.h |  10 +++
 include/linux/gfp.h       | 126 ++++++++++++++++++++++++--------------
 include/linux/pagemap.h   |   9 ++-
 mm/compaction.c           |   7 ++-
 mm/filemap.c              |   6 +-
 mm/mempolicy.c            |  52 ++++++++--------
 mm/page_alloc.c           |  60 +++++++++---------
 7 files changed, 160 insertions(+), 110 deletions(-)

diff --git a/include/linux/alloc_tag.h b/include/linux/alloc_tag.h
index cf55a149fa84..6fa8a94d8bc1 100644
--- a/include/linux/alloc_tag.h
+++ b/include/linux/alloc_tag.h
@@ -130,4 +130,14 @@ static inline void alloc_tag_add(union codetag_ref *ref, struct alloc_tag *tag,
 
 #endif
 
+#define alloc_hooks(_do_alloc)						\
+({									\
+	typeof(_do_alloc) _res;						\
+	DEFINE_ALLOC_TAG(_alloc_tag, _old);				\
+									\
+	_res = _do_alloc;						\
+	alloc_tag_restore(&_alloc_tag, _old);				\
+	_res;								\
+})
+
 #endif /* _LINUX_ALLOC_TAG_H */
diff --git a/include/linux/gfp.h b/include/linux/gfp.h
index de292a007138..bc0fd5259b0b 100644
--- a/include/linux/gfp.h
+++ b/include/linux/gfp.h
@@ -6,6 +6,8 @@
 
 #include <linux/mmzone.h>
 #include <linux/topology.h>
+#include <linux/alloc_tag.h>
+#include <linux/sched.h>
 
 struct vm_area_struct;
 struct mempolicy;
@@ -175,42 +177,46 @@ static inline void arch_free_page(struct page *page, int order) { }
 static inline void arch_alloc_page(struct page *page, int order) { }
 #endif
 
-struct page *__alloc_pages(gfp_t gfp, unsigned int order, int preferred_nid,
+struct page *__alloc_pages_noprof(gfp_t gfp, unsigned int order, int preferred_nid,
 		nodemask_t *nodemask);
-struct folio *__folio_alloc(gfp_t gfp, unsigned int order, int preferred_nid,
+#define __alloc_pages(...)			alloc_hooks(__alloc_pages_noprof(__VA_ARGS__))
+
+struct folio *__folio_alloc_noprof(gfp_t gfp, unsigned int order, int preferred_nid,
 		nodemask_t *nodemask);
+#define __folio_alloc(...)			alloc_hooks(__folio_alloc_noprof(__VA_ARGS__))
 
-unsigned long __alloc_pages_bulk(gfp_t gfp, int preferred_nid,
+unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 				nodemask_t *nodemask, int nr_pages,
 				struct list_head *page_list,
 				struct page **page_array);
+#define __alloc_pages_bulk(...)			alloc_hooks(alloc_pages_bulk_noprof(__VA_ARGS__))
 
-unsigned long alloc_pages_bulk_array_mempolicy(gfp_t gfp,
+unsigned long alloc_pages_bulk_array_mempolicy_noprof(gfp_t gfp,
 				unsigned long nr_pages,
 				struct page **page_array);
+#define  alloc_pages_bulk_array_mempolicy(...)				\
+	alloc_hooks(alloc_pages_bulk_array_mempolicy_noprof(__VA_ARGS__))
 
 /* Bulk allocate order-0 pages */
-static inline unsigned long
-alloc_pages_bulk_list(gfp_t gfp, unsigned long nr_pages, struct list_head *list)
-{
-	return __alloc_pages_bulk(gfp, numa_mem_id(), NULL, nr_pages, list, NULL);
-}
+#define alloc_pages_bulk_list(_gfp, _nr_pages, _list)			\
+	__alloc_pages_bulk(_gfp, numa_mem_id(), NULL, _nr_pages, _list, NULL)
 
-static inline unsigned long
-alloc_pages_bulk_array(gfp_t gfp, unsigned long nr_pages, struct page **page_array)
-{
-	return __alloc_pages_bulk(gfp, numa_mem_id(), NULL, nr_pages, NULL, page_array);
-}
+#define alloc_pages_bulk_array(_gfp, _nr_pages, _page_array)		\
+	__alloc_pages_bulk(_gfp, numa_mem_id(), NULL, _nr_pages, NULL, _page_array)
 
 static inline unsigned long
-alloc_pages_bulk_array_node(gfp_t gfp, int nid, unsigned long nr_pages, struct page **page_array)
+alloc_pages_bulk_array_node_noprof(gfp_t gfp, int nid, unsigned long nr_pages,
+				   struct page **page_array)
 {
 	if (nid == NUMA_NO_NODE)
 		nid = numa_mem_id();
 
-	return __alloc_pages_bulk(gfp, nid, NULL, nr_pages, NULL, page_array);
+	return alloc_pages_bulk_noprof(gfp, nid, NULL, nr_pages, NULL, page_array);
 }
 
+#define alloc_pages_bulk_array_node(...)				\
+	alloc_hooks(alloc_pages_bulk_array_node_noprof(__VA_ARGS__))
+
 static inline void warn_if_node_offline(int this_node, gfp_t gfp_mask)
 {
 	gfp_t warn_gfp = gfp_mask & (__GFP_THISNODE|__GFP_NOWARN);
@@ -230,82 +236,104 @@ static inline void warn_if_node_offline(int this_node, gfp_t gfp_mask)
  * online. For more general interface, see alloc_pages_node().
  */
 static inline struct page *
-__alloc_pages_node(int nid, gfp_t gfp_mask, unsigned int order)
+__alloc_pages_node_noprof(int nid, gfp_t gfp_mask, unsigned int order)
 {
 	VM_BUG_ON(nid < 0 || nid >= MAX_NUMNODES);
 	warn_if_node_offline(nid, gfp_mask);
 
-	return __alloc_pages(gfp_mask, order, nid, NULL);
+	return __alloc_pages_noprof(gfp_mask, order, nid, NULL);
 }
 
+#define  __alloc_pages_node(...)		alloc_hooks(__alloc_pages_node_noprof(__VA_ARGS__))
+
 static inline
-struct folio *__folio_alloc_node(gfp_t gfp, unsigned int order, int nid)
+struct folio *__folio_alloc_node_noprof(gfp_t gfp, unsigned int order, int nid)
 {
 	VM_BUG_ON(nid < 0 || nid >= MAX_NUMNODES);
 	warn_if_node_offline(nid, gfp);
 
-	return __folio_alloc(gfp, order, nid, NULL);
+	return __folio_alloc_noprof(gfp, order, nid, NULL);
 }
 
+#define  __folio_alloc_node(...)		alloc_hooks(__folio_alloc_node_noprof(__VA_ARGS__))
+
 /*
  * Allocate pages, preferring the node given as nid. When nid == NUMA_NO_NODE,
  * prefer the current CPU's closest node. Otherwise node must be valid and
  * online.
  */
-static inline struct page *alloc_pages_node(int nid, gfp_t gfp_mask,
-						unsigned int order)
+static inline struct page *alloc_pages_node_noprof(int nid, gfp_t gfp_mask,
+						   unsigned int order)
 {
 	if (nid == NUMA_NO_NODE)
 		nid = numa_mem_id();
 
-	return __alloc_pages_node(nid, gfp_mask, order);
+	return __alloc_pages_node_noprof(nid, gfp_mask, order);
 }
 
+#define  alloc_pages_node(...)			alloc_hooks(alloc_pages_node_noprof(__VA_ARGS__))
+
 #ifdef CONFIG_NUMA
-struct page *alloc_pages(gfp_t gfp, unsigned int order);
-struct page *alloc_pages_mpol(gfp_t gfp, unsigned int order,
+struct page *alloc_pages_noprof(gfp_t gfp, unsigned int order);
+struct page *alloc_pages_mpol_noprof(gfp_t gfp, unsigned int order,
 		struct mempolicy *mpol, pgoff_t ilx, int nid);
-struct folio *folio_alloc(gfp_t gfp, unsigned int order);
-struct folio *vma_alloc_folio(gfp_t gfp, int order, struct vm_area_struct *vma,
+struct folio *folio_alloc_noprof(gfp_t gfp, unsigned int order);
+struct folio *vma_alloc_folio_noprof(gfp_t gfp, int order, struct vm_area_struct *vma,
 		unsigned long addr, bool hugepage);
 #else
-static inline struct page *alloc_pages(gfp_t gfp_mask, unsigned int order)
+static inline struct page *alloc_pages_noprof(gfp_t gfp_mask, unsigned int order)
 {
-	return alloc_pages_node(numa_node_id(), gfp_mask, order);
+	return alloc_pages_node_noprof(numa_node_id(), gfp_mask, order);
 }
-static inline struct page *alloc_pages_mpol(gfp_t gfp, unsigned int order,
+static inline struct page *alloc_pages_mpol_noprof(gfp_t gfp, unsigned int order,
 		struct mempolicy *mpol, pgoff_t ilx, int nid)
 {
-	return alloc_pages(gfp, order);
+	return alloc_pages_noprof(gfp, order);
 }
-static inline struct folio *folio_alloc(gfp_t gfp, unsigned int order)
+static inline struct folio *folio_alloc_noprof(gfp_t gfp, unsigned int order)
 {
 	return __folio_alloc_node(gfp, order, numa_node_id());
 }
-#define vma_alloc_folio(gfp, order, vma, addr, hugepage)		\
-	folio_alloc(gfp, order)
+#define vma_alloc_folio_noprof(gfp, order, vma, addr, hugepage)		\
+	folio_alloc_noprof(gfp, order)
 #endif
+
+#define alloc_pages(...)			alloc_hooks(alloc_pages_noprof(__VA_ARGS__))
+#define alloc_pages_mpol(...)			alloc_hooks(alloc_pages_mpol_noprof(__VA_ARGS__))
+#define folio_alloc(...)			alloc_hooks(folio_alloc_noprof(__VA_ARGS__))
+#define vma_alloc_folio(...)			alloc_hooks(vma_alloc_folio_noprof(__VA_ARGS__))
+
 #define alloc_page(gfp_mask) alloc_pages(gfp_mask, 0)
-static inline struct page *alloc_page_vma(gfp_t gfp,
+
+static inline struct page *alloc_page_vma_noprof(gfp_t gfp,
 		struct vm_area_struct *vma, unsigned long addr)
 {
-	struct folio *folio = vma_alloc_folio(gfp, 0, vma, addr, false);
+	struct folio *folio = vma_alloc_folio_noprof(gfp, 0, vma, addr, false);
 
 	return &folio->page;
 }
+#define alloc_page_vma(...)			alloc_hooks(alloc_page_vma_noprof(__VA_ARGS__))
+
+extern unsigned long get_free_pages_noprof(gfp_t gfp_mask, unsigned int order);
+#define __get_free_pages(...)			alloc_hooks(get_free_pages_noprof(__VA_ARGS__))
 
-extern unsigned long __get_free_pages(gfp_t gfp_mask, unsigned int order);
-extern unsigned long get_zeroed_page(gfp_t gfp_mask);
+extern unsigned long get_zeroed_page_noprof(gfp_t gfp_mask);
+#define get_zeroed_page(...)			alloc_hooks(get_zeroed_page_noprof(__VA_ARGS__))
+
+void *alloc_pages_exact_noprof(size_t size, gfp_t gfp_mask) __alloc_size(1);
+#define alloc_pages_exact(...)			alloc_hooks(alloc_pages_exact_noprof(__VA_ARGS__))
 
-void *alloc_pages_exact(size_t size, gfp_t gfp_mask) __alloc_size(1);
 void free_pages_exact(void *virt, size_t size);
-__meminit void *alloc_pages_exact_nid(int nid, size_t size, gfp_t gfp_mask) __alloc_size(2);
 
-#define __get_free_page(gfp_mask) \
-		__get_free_pages((gfp_mask), 0)
+__meminit void *alloc_pages_exact_nid_noprof(int nid, size_t size, gfp_t gfp_mask) __alloc_size(2);
+#define alloc_pages_exact_nid(...)					\
+	alloc_hooks(alloc_pages_exact_nid_noprof(__VA_ARGS__))
+
+#define __get_free_page(gfp_mask)					\
+	__get_free_pages((gfp_mask), 0)
 
-#define __get_dma_pages(gfp_mask, order) \
-		__get_free_pages((gfp_mask) | GFP_DMA, (order))
+#define __get_dma_pages(gfp_mask, order)				\
+	__get_free_pages((gfp_mask) | GFP_DMA, (order))
 
 extern void __free_pages(struct page *page, unsigned int order);
 extern void free_pages(unsigned long addr, unsigned int order);
@@ -357,10 +385,14 @@ extern gfp_t vma_thp_gfp_mask(struct vm_area_struct *vma);
 
 #ifdef CONFIG_CONTIG_ALLOC
 /* The below functions must be run on a range from a single zone. */
-extern int alloc_contig_range(unsigned long start, unsigned long end,
+extern int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 			      unsigned migratetype, gfp_t gfp_mask);
-extern struct page *alloc_contig_pages(unsigned long nr_pages, gfp_t gfp_mask,
-				       int nid, nodemask_t *nodemask);
+#define alloc_contig_range(...)			alloc_hooks(alloc_contig_range_noprof(__VA_ARGS__))
+
+extern struct page *alloc_contig_pages_noprof(unsigned long nr_pages, gfp_t gfp_mask,
+					      int nid, nodemask_t *nodemask);
+#define alloc_contig_pages(...)			alloc_hooks(alloc_contig_pages_noprof(__VA_ARGS__))
+
 #endif
 void free_contig_range(unsigned long pfn, unsigned long nr_pages);
 
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 2df35e65557d..35636e67e2e1 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -542,14 +542,17 @@ static inline void *detach_page_private(struct page *page)
 #endif
 
 #ifdef CONFIG_NUMA
-struct folio *filemap_alloc_folio(gfp_t gfp, unsigned int order);
+struct folio *filemap_alloc_folio_noprof(gfp_t gfp, unsigned int order);
 #else
-static inline struct folio *filemap_alloc_folio(gfp_t gfp, unsigned int order)
+static inline struct folio *filemap_alloc_folio_noprof(gfp_t gfp, unsigned int order)
 {
-	return folio_alloc(gfp, order);
+	return folio_alloc_noprof(gfp, order);
 }
 #endif
 
+#define filemap_alloc_folio(...)				\
+	alloc_hooks(filemap_alloc_folio_noprof(__VA_ARGS__))
+
 static inline struct page *__page_cache_alloc(gfp_t gfp)
 {
 	return &filemap_alloc_folio(gfp, 0)->page;
diff --git a/mm/compaction.c b/mm/compaction.c
index 4add68d40e8d..f4c0e682c979 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -1781,7 +1781,7 @@ static void isolate_freepages(struct compact_control *cc)
  * This is a migrate-callback that "allocates" freepages by taking pages
  * from the isolated freelists in the block we are migrating to.
  */
-static struct folio *compaction_alloc(struct folio *src, unsigned long data)
+static struct folio *compaction_alloc_noprof(struct folio *src, unsigned long data)
 {
 	struct compact_control *cc = (struct compact_control *)data;
 	struct folio *dst;
@@ -1800,6 +1800,11 @@ static struct folio *compaction_alloc(struct folio *src, unsigned long data)
 	return dst;
 }
 
+static struct folio *compaction_alloc(struct folio *src, unsigned long data)
+{
+	return alloc_hooks(compaction_alloc_noprof(src, data));
+}
+
 /*
  * This is a migrate-callback that "frees" freepages back to the isolated
  * freelist.  All pages on the freelist are from the same zone, so there is no
diff --git a/mm/filemap.c b/mm/filemap.c
index 750e779c23db..e51e474545ad 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -957,7 +957,7 @@ int filemap_add_folio(struct address_space *mapping, struct folio *folio,
 EXPORT_SYMBOL_GPL(filemap_add_folio);
 
 #ifdef CONFIG_NUMA
-struct folio *filemap_alloc_folio(gfp_t gfp, unsigned int order)
+struct folio *filemap_alloc_folio_noprof(gfp_t gfp, unsigned int order)
 {
 	int n;
 	struct folio *folio;
@@ -972,9 +972,9 @@ struct folio *filemap_alloc_folio(gfp_t gfp, unsigned int order)
 
 		return folio;
 	}
-	return folio_alloc(gfp, order);
+	return folio_alloc_noprof(gfp, order);
 }
-EXPORT_SYMBOL(filemap_alloc_folio);
+EXPORT_SYMBOL(filemap_alloc_folio_noprof);
 #endif
 
 /*
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 10a590ee1c89..c329d00b975f 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -2070,15 +2070,15 @@ static struct page *alloc_pages_preferred_many(gfp_t gfp, unsigned int order,
 	 */
 	preferred_gfp = gfp | __GFP_NOWARN;
 	preferred_gfp &= ~(__GFP_DIRECT_RECLAIM | __GFP_NOFAIL);
-	page = __alloc_pages(preferred_gfp, order, nid, nodemask);
+	page = __alloc_pages_noprof(preferred_gfp, order, nid, nodemask);
 	if (!page)
-		page = __alloc_pages(gfp, order, nid, NULL);
+		page = __alloc_pages_noprof(gfp, order, nid, NULL);
 
 	return page;
 }
 
 /**
- * alloc_pages_mpol - Allocate pages according to NUMA mempolicy.
+ * alloc_pages_mpol_noprof - Allocate pages according to NUMA mempolicy.
  * @gfp: GFP flags.
  * @order: Order of the page allocation.
  * @pol: Pointer to the NUMA mempolicy.
@@ -2087,7 +2087,7 @@ static struct page *alloc_pages_preferred_many(gfp_t gfp, unsigned int order,
  *
  * Return: The page on success or NULL if allocation fails.
  */
-struct page *alloc_pages_mpol(gfp_t gfp, unsigned int order,
+struct page *alloc_pages_mpol_noprof(gfp_t gfp, unsigned int order,
 		struct mempolicy *pol, pgoff_t ilx, int nid)
 {
 	nodemask_t *nodemask;
@@ -2117,7 +2117,7 @@ struct page *alloc_pages_mpol(gfp_t gfp, unsigned int order,
 			 * First, try to allocate THP only on local node, but
 			 * don't reclaim unnecessarily, just compact.
 			 */
-			page = __alloc_pages_node(nid,
+			page = __alloc_pages_node_noprof(nid,
 				gfp | __GFP_THISNODE | __GFP_NORETRY, order);
 			if (page || !(gfp & __GFP_DIRECT_RECLAIM))
 				return page;
@@ -2130,7 +2130,7 @@ struct page *alloc_pages_mpol(gfp_t gfp, unsigned int order,
 		}
 	}
 
-	page = __alloc_pages(gfp, order, nid, nodemask);
+	page = __alloc_pages_noprof(gfp, order, nid, nodemask);
 
 	if (unlikely(pol->mode == MPOL_INTERLEAVE) && page) {
 		/* skip NUMA_INTERLEAVE_HIT update if numa stats is disabled */
@@ -2146,7 +2146,7 @@ struct page *alloc_pages_mpol(gfp_t gfp, unsigned int order,
 }
 
 /**
- * vma_alloc_folio - Allocate a folio for a VMA.
+ * vma_alloc_folio_noprof - Allocate a folio for a VMA.
  * @gfp: GFP flags.
  * @order: Order of the folio.
  * @vma: Pointer to VMA.
@@ -2161,7 +2161,7 @@ struct page *alloc_pages_mpol(gfp_t gfp, unsigned int order,
  *
  * Return: The folio on success or NULL if allocation fails.
  */
-struct folio *vma_alloc_folio(gfp_t gfp, int order, struct vm_area_struct *vma,
+struct folio *vma_alloc_folio_noprof(gfp_t gfp, int order, struct vm_area_struct *vma,
 		unsigned long addr, bool hugepage)
 {
 	struct mempolicy *pol;
@@ -2169,15 +2169,15 @@ struct folio *vma_alloc_folio(gfp_t gfp, int order, struct vm_area_struct *vma,
 	struct page *page;
 
 	pol = get_vma_policy(vma, addr, order, &ilx);
-	page = alloc_pages_mpol(gfp | __GFP_COMP, order,
-				pol, ilx, numa_node_id());
+	page = alloc_pages_mpol_noprof(gfp | __GFP_COMP, order,
+				       pol, ilx, numa_node_id());
 	mpol_cond_put(pol);
 	return page_rmappable_folio(page);
 }
-EXPORT_SYMBOL(vma_alloc_folio);
+EXPORT_SYMBOL(vma_alloc_folio_noprof);
 
 /**
- * alloc_pages - Allocate pages.
+ * alloc_pages_noprof - Allocate pages.
  * @gfp: GFP flags.
  * @order: Power of two of number of pages to allocate.
  *
@@ -2190,7 +2190,7 @@ EXPORT_SYMBOL(vma_alloc_folio);
  * flags are used.
  * Return: The page on success or NULL if allocation fails.
  */
-struct page *alloc_pages(gfp_t gfp, unsigned int order)
+struct page *alloc_pages_noprof(gfp_t gfp, unsigned int order)
 {
 	struct mempolicy *pol = &default_policy;
 
@@ -2201,16 +2201,16 @@ struct page *alloc_pages(gfp_t gfp, unsigned int order)
 	if (!in_interrupt() && !(gfp & __GFP_THISNODE))
 		pol = get_task_policy(current);
 
-	return alloc_pages_mpol(gfp, order,
-				pol, NO_INTERLEAVE_INDEX, numa_node_id());
+	return alloc_pages_mpol_noprof(gfp, order, pol, NO_INTERLEAVE_INDEX,
+				       numa_node_id());
 }
-EXPORT_SYMBOL(alloc_pages);
+EXPORT_SYMBOL(alloc_pages_noprof);
 
-struct folio *folio_alloc(gfp_t gfp, unsigned int order)
+struct folio *folio_alloc_noprof(gfp_t gfp, unsigned int order)
 {
-	return page_rmappable_folio(alloc_pages(gfp | __GFP_COMP, order));
+	return page_rmappable_folio(alloc_pages_noprof(gfp | __GFP_COMP, order));
 }
-EXPORT_SYMBOL(folio_alloc);
+EXPORT_SYMBOL(folio_alloc_noprof);
 
 static unsigned long alloc_pages_bulk_array_interleave(gfp_t gfp,
 		struct mempolicy *pol, unsigned long nr_pages,
@@ -2229,13 +2229,13 @@ static unsigned long alloc_pages_bulk_array_interleave(gfp_t gfp,
 
 	for (i = 0; i < nodes; i++) {
 		if (delta) {
-			nr_allocated = __alloc_pages_bulk(gfp,
+			nr_allocated = alloc_pages_bulk_noprof(gfp,
 					interleave_nodes(pol), NULL,
 					nr_pages_per_node + 1, NULL,
 					page_array);
 			delta--;
 		} else {
-			nr_allocated = __alloc_pages_bulk(gfp,
+			nr_allocated = alloc_pages_bulk_noprof(gfp,
 					interleave_nodes(pol), NULL,
 					nr_pages_per_node, NULL, page_array);
 		}
@@ -2257,11 +2257,11 @@ static unsigned long alloc_pages_bulk_array_preferred_many(gfp_t gfp, int nid,
 	preferred_gfp = gfp | __GFP_NOWARN;
 	preferred_gfp &= ~(__GFP_DIRECT_RECLAIM | __GFP_NOFAIL);
 
-	nr_allocated  = __alloc_pages_bulk(preferred_gfp, nid, &pol->nodes,
+	nr_allocated  = alloc_pages_bulk_noprof(preferred_gfp, nid, &pol->nodes,
 					   nr_pages, NULL, page_array);
 
 	if (nr_allocated < nr_pages)
-		nr_allocated += __alloc_pages_bulk(gfp, numa_node_id(), NULL,
+		nr_allocated += alloc_pages_bulk_noprof(gfp, numa_node_id(), NULL,
 				nr_pages - nr_allocated, NULL,
 				page_array + nr_allocated);
 	return nr_allocated;
@@ -2273,7 +2273,7 @@ static unsigned long alloc_pages_bulk_array_preferred_many(gfp_t gfp, int nid,
  * It can accelerate memory allocation especially interleaving
  * allocate memory.
  */
-unsigned long alloc_pages_bulk_array_mempolicy(gfp_t gfp,
+unsigned long alloc_pages_bulk_array_mempolicy_noprof(gfp_t gfp,
 		unsigned long nr_pages, struct page **page_array)
 {
 	struct mempolicy *pol = &default_policy;
@@ -2293,8 +2293,8 @@ unsigned long alloc_pages_bulk_array_mempolicy(gfp_t gfp,
 
 	nid = numa_node_id();
 	nodemask = policy_nodemask(gfp, pol, NO_INTERLEAVE_INDEX, &nid);
-	return __alloc_pages_bulk(gfp, nid, nodemask,
-				  nr_pages, NULL, page_array);
+	return alloc_pages_bulk_noprof(gfp, nid, nodemask,
+				       nr_pages, NULL, page_array);
 }
 
 int vma_dup_policy(struct vm_area_struct *src, struct vm_area_struct *dst)
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index edb79a55a252..58c0e8b948a4 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -4380,7 +4380,7 @@ static inline bool prepare_alloc_pages(gfp_t gfp_mask, unsigned int order,
  *
  * Returns the number of pages on the list or array.
  */
-unsigned long __alloc_pages_bulk(gfp_t gfp, int preferred_nid,
+unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 			nodemask_t *nodemask, int nr_pages,
 			struct list_head *page_list,
 			struct page **page_array)
@@ -4516,7 +4516,7 @@ unsigned long __alloc_pages_bulk(gfp_t gfp, int preferred_nid,
 	pcp_trylock_finish(UP_flags);
 
 failed:
-	page = __alloc_pages(gfp, 0, preferred_nid, nodemask);
+	page = __alloc_pages_noprof(gfp, 0, preferred_nid, nodemask);
 	if (page) {
 		if (page_list)
 			list_add(&page->lru, page_list);
@@ -4527,13 +4527,13 @@ unsigned long __alloc_pages_bulk(gfp_t gfp, int preferred_nid,
 
 	goto out;
 }
-EXPORT_SYMBOL_GPL(__alloc_pages_bulk);
+EXPORT_SYMBOL_GPL(alloc_pages_bulk_noprof);
 
 /*
  * This is the 'heart' of the zoned buddy allocator.
  */
-struct page *__alloc_pages(gfp_t gfp, unsigned int order, int preferred_nid,
-							nodemask_t *nodemask)
+struct page *__alloc_pages_noprof(gfp_t gfp, unsigned int order,
+				      int preferred_nid, nodemask_t *nodemask)
 {
 	struct page *page;
 	unsigned int alloc_flags = ALLOC_WMARK_LOW;
@@ -4595,38 +4595,38 @@ struct page *__alloc_pages(gfp_t gfp, unsigned int order, int preferred_nid,
 
 	return page;
 }
-EXPORT_SYMBOL(__alloc_pages);
+EXPORT_SYMBOL(__alloc_pages_noprof);
 
-struct folio *__folio_alloc(gfp_t gfp, unsigned int order, int preferred_nid,
+struct folio *__folio_alloc_noprof(gfp_t gfp, unsigned int order, int preferred_nid,
 		nodemask_t *nodemask)
 {
-	struct page *page = __alloc_pages(gfp | __GFP_COMP, order,
+	struct page *page = __alloc_pages_noprof(gfp | __GFP_COMP, order,
 					preferred_nid, nodemask);
 	return page_rmappable_folio(page);
 }
-EXPORT_SYMBOL(__folio_alloc);
+EXPORT_SYMBOL(__folio_alloc_noprof);
 
 /*
  * Common helper functions. Never use with __GFP_HIGHMEM because the returned
  * address cannot represent highmem pages. Use alloc_pages and then kmap if
  * you need to access high mem.
  */
-unsigned long __get_free_pages(gfp_t gfp_mask, unsigned int order)
+unsigned long get_free_pages_noprof(gfp_t gfp_mask, unsigned int order)
 {
 	struct page *page;
 
-	page = alloc_pages(gfp_mask & ~__GFP_HIGHMEM, order);
+	page = alloc_pages_noprof(gfp_mask & ~__GFP_HIGHMEM, order);
 	if (!page)
 		return 0;
 	return (unsigned long) page_address(page);
 }
-EXPORT_SYMBOL(__get_free_pages);
+EXPORT_SYMBOL(get_free_pages_noprof);
 
-unsigned long get_zeroed_page(gfp_t gfp_mask)
+unsigned long get_zeroed_page_noprof(gfp_t gfp_mask)
 {
-	return __get_free_page(gfp_mask | __GFP_ZERO);
+	return get_free_pages_noprof(gfp_mask | __GFP_ZERO, 0);
 }
-EXPORT_SYMBOL(get_zeroed_page);
+EXPORT_SYMBOL(get_zeroed_page_noprof);
 
 /**
  * __free_pages - Free pages allocated with alloc_pages().
@@ -4818,7 +4818,7 @@ static void *make_alloc_exact(unsigned long addr, unsigned int order,
 }
 
 /**
- * alloc_pages_exact - allocate an exact number physically-contiguous pages.
+ * alloc_pages_exact_noprof - allocate an exact number physically-contiguous pages.
  * @size: the number of bytes to allocate
  * @gfp_mask: GFP flags for the allocation, must not contain __GFP_COMP
  *
@@ -4832,7 +4832,7 @@ static void *make_alloc_exact(unsigned long addr, unsigned int order,
  *
  * Return: pointer to the allocated area or %NULL in case of error.
  */
-void *alloc_pages_exact(size_t size, gfp_t gfp_mask)
+void *alloc_pages_exact_noprof(size_t size, gfp_t gfp_mask)
 {
 	unsigned int order = get_order(size);
 	unsigned long addr;
@@ -4840,13 +4840,13 @@ void *alloc_pages_exact(size_t size, gfp_t gfp_mask)
 	if (WARN_ON_ONCE(gfp_mask & (__GFP_COMP | __GFP_HIGHMEM)))
 		gfp_mask &= ~(__GFP_COMP | __GFP_HIGHMEM);
 
-	addr = __get_free_pages(gfp_mask, order);
+	addr = get_free_pages_noprof(gfp_mask, order);
 	return make_alloc_exact(addr, order, size);
 }
-EXPORT_SYMBOL(alloc_pages_exact);
+EXPORT_SYMBOL(alloc_pages_exact_noprof);
 
 /**
- * alloc_pages_exact_nid - allocate an exact number of physically-contiguous
+ * alloc_pages_exact_nid_noprof - allocate an exact number of physically-contiguous
  *			   pages on a node.
  * @nid: the preferred node ID where memory should be allocated
  * @size: the number of bytes to allocate
@@ -4857,7 +4857,7 @@ EXPORT_SYMBOL(alloc_pages_exact);
  *
  * Return: pointer to the allocated area or %NULL in case of error.
  */
-void * __meminit alloc_pages_exact_nid(int nid, size_t size, gfp_t gfp_mask)
+void * __meminit alloc_pages_exact_nid_noprof(int nid, size_t size, gfp_t gfp_mask)
 {
 	unsigned int order = get_order(size);
 	struct page *p;
@@ -4865,7 +4865,7 @@ void * __meminit alloc_pages_exact_nid(int nid, size_t size, gfp_t gfp_mask)
 	if (WARN_ON_ONCE(gfp_mask & (__GFP_COMP | __GFP_HIGHMEM)))
 		gfp_mask &= ~(__GFP_COMP | __GFP_HIGHMEM);
 
-	p = alloc_pages_node(nid, gfp_mask, order);
+	p = alloc_pages_node_noprof(nid, gfp_mask, order);
 	if (!p)
 		return NULL;
 	return make_alloc_exact((unsigned long)page_address(p), order, size);
@@ -6283,7 +6283,7 @@ int __alloc_contig_migrate_range(struct compact_control *cc,
 }
 
 /**
- * alloc_contig_range() -- tries to allocate given range of pages
+ * alloc_contig_range_noprof() -- tries to allocate given range of pages
  * @start:	start PFN to allocate
  * @end:	one-past-the-last PFN to allocate
  * @migratetype:	migratetype of the underlying pageblocks (either
@@ -6303,7 +6303,7 @@ int __alloc_contig_migrate_range(struct compact_control *cc,
  * pages which PFN is in [start, end) are allocated for the caller and
  * need to be freed with free_contig_range().
  */
-int alloc_contig_range(unsigned long start, unsigned long end,
+int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 		       unsigned migratetype, gfp_t gfp_mask)
 {
 	unsigned long outer_start, outer_end;
@@ -6427,15 +6427,15 @@ int alloc_contig_range(unsigned long start, unsigned long end,
 	undo_isolate_page_range(start, end, migratetype);
 	return ret;
 }
-EXPORT_SYMBOL(alloc_contig_range);
+EXPORT_SYMBOL(alloc_contig_range_noprof);
 
 static int __alloc_contig_pages(unsigned long start_pfn,
 				unsigned long nr_pages, gfp_t gfp_mask)
 {
 	unsigned long end_pfn = start_pfn + nr_pages;
 
-	return alloc_contig_range(start_pfn, end_pfn, MIGRATE_MOVABLE,
-				  gfp_mask);
+	return alloc_contig_range_noprof(start_pfn, end_pfn, MIGRATE_MOVABLE,
+				   gfp_mask);
 }
 
 static bool pfn_range_valid_contig(struct zone *z, unsigned long start_pfn,
@@ -6470,7 +6470,7 @@ static bool zone_spans_last_pfn(const struct zone *zone,
 }
 
 /**
- * alloc_contig_pages() -- tries to find and allocate contiguous range of pages
+ * alloc_contig_pages_noprof() -- tries to find and allocate contiguous range of pages
  * @nr_pages:	Number of contiguous pages to allocate
  * @gfp_mask:	GFP mask to limit search and used during compaction
  * @nid:	Target node
@@ -6490,8 +6490,8 @@ static bool zone_spans_last_pfn(const struct zone *zone,
  *
  * Return: pointer to contiguous pages on success, or NULL if not successful.
  */
-struct page *alloc_contig_pages(unsigned long nr_pages, gfp_t gfp_mask,
-				int nid, nodemask_t *nodemask)
+struct page *alloc_contig_pages_noprof(unsigned long nr_pages, gfp_t gfp_mask,
+				 int nid, nodemask_t *nodemask)
 {
 	unsigned long ret, pfn, flags;
 	struct zonelist *zonelist;
-- 
2.43.0.687.g38aa6559b0-goog


