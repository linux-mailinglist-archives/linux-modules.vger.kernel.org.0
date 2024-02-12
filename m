Return-Path: <linux-modules+bounces-466-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A364E852086
	for <lists+linux-modules@lfdr.de>; Mon, 12 Feb 2024 22:50:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2ECEC1F2378D
	for <lists+linux-modules@lfdr.de>; Mon, 12 Feb 2024 21:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 649A55C8FC;
	Mon, 12 Feb 2024 21:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lPzM8CUh"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61015A7B3
	for <linux-modules@vger.kernel.org>; Mon, 12 Feb 2024 21:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707774034; cv=none; b=rclhtnMgH7259o3KODSjhxgUqxlVT3Z+eimCdXgV7Wp1SeBKXNTziJBeqZYwnmB9ErJ6BB25AYwQXnk86ZkVkowt5JEcXpfc/eDhwdPo27bTe1oxYZn5C/Ii4HAwgS63Ojs6dOBx9jwQEStCFIji9E1OQSHKwQoSRFCv939KDvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707774034; c=relaxed/simple;
	bh=agT5b25ACG41VKpR8q87SrJ3Bcb+qFiIEtA30AzV538=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YJOME5Ax78tzaSnKMjb4ZOX8bgYKM8TU4AtAcG182u+tpWzMKxG1o6W81InIBq+KODnz8cdGVWEjRY66Wz4cFil443UR4ID5hc9YbJfdUwkJRxqNWYMOymKycPEuUdXRb33qKWSlrkOP61UOMfJ1acBjwiyGhU9UCFZt9ATRNZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lPzM8CUh; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-604ab15463aso4584137b3.3
        for <linux-modules@vger.kernel.org>; Mon, 12 Feb 2024 13:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707774031; x=1708378831; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=X07z1RjJe29sLMh5N/vKSXU8uipRKYcH64glAbq+0r0=;
        b=lPzM8CUhyrv/sPst6GWvy6n9rv20CXuQ/4zauYIxESdrS2e2oB2YyltlxNYRqZELJb
         3Y/9ffwm1BbBJlPShZ1vB3Y6vjjuiwYOzEBK/lVXxRuoRd2w3mdiIe6SgufsOP0ggnEv
         //jwQp8FI7R7NqRIX5QBKXIkWU/tzVLtP9ERHhZowRn0AohY1d/3H+p7sZiKXG5Wky5Z
         g30I5jKc0TzaAvbZxQTIV+1zKgTbqfLF9NJi9+2H9YR/paoKEJwC0Y/Ww7VlTp+ieXpB
         l4frLkDMMBdyyhwpEmkde49wedJgoqTs4fuWb66SoZAEY/ZddeT0lsRPtBebBHaMKZSi
         yh7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707774031; x=1708378831;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X07z1RjJe29sLMh5N/vKSXU8uipRKYcH64glAbq+0r0=;
        b=ncZ+7/1wlP3k5bibL7uxYkeESLi3TmVNGJKLlnLe7LEMsRpT3RkwCh3ZPdBMk4UCGy
         bfY/N7QhfOMUkgVnM2oZXkTqBzt0uQV7q+FLtt8dzoP0Pacg2xTMrGHju8WbviETJpY0
         BTdCh849mrrjlJIGmoa0EOMyLEQhQWk2RPrD09KLp2jqZjFfUPCnyudyExxndPCnLv0A
         xB/HRTFX2D2wHCVXZJE5aoHlBtM4Wa8jIZ+kxdNpw86NN85SDDrhrwAtO12Hu1qFhmQW
         pw/DOZd3crH52z5RgqERnx+DiWMR6BhHvrDokUmxjDdVPn/i+eTZ33AyasU92S99NOqY
         U9iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoZBJj+JQWeytJ3OmCTwhwT90CTQrF2PkDtq+DFsvP3Jr3WFtVHiCQR1eVaVBfuyFGEcJpnfKruo0j9sAQwvDDJWwl4yF0nb7TRWyONA==
X-Gm-Message-State: AOJu0Ywdj11YFi3CY/mhBVmW3k80HwtGsPqNlyZBoreNQJVS41ZPExgH
	bMmnzbsS8FEbQTyy95yqfq4y94BqumF8Cq5R3aZ92aoQBjeLD2p/6uALbv0SG4InaRpOlf01Y/S
	93w==
X-Google-Smtp-Source: AGHT+IE+9v5iTSehfGXvFLsyFgeYeTOkKmnm1/9Fi71HMokK15QIurDQiuu9x1J7ZwyZ5mBIdOmgWIrIEcg=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:b848:2b3f:be49:9cbc])
 (user=surenb job=sendgmr) by 2002:a05:6902:709:b0:dc7:59d9:7b46 with SMTP id
 k9-20020a056902070900b00dc759d97b46mr291099ybt.3.1707774030642; Mon, 12 Feb
 2024 13:40:30 -0800 (PST)
Date: Mon, 12 Feb 2024 13:39:13 -0800
In-Reply-To: <20240212213922.783301-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240212213922.783301-1-surenb@google.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240212213922.783301-28-surenb@google.com>
Subject: [PATCH v3 27/35] mm: percpu: Add codetag reference into pcpuobj_ext
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

From: Kent Overstreet <kent.overstreet@linux.dev>

To store codetag for every per-cpu allocation, a codetag reference is
embedded into pcpuobj_ext when CONFIG_MEM_ALLOC_PROFILING=y. Hooks to
use the newly introduced codetag are added.

Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/percpu-internal.h | 11 +++++++++--
 mm/percpu.c          | 26 ++++++++++++++++++++++++++
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/mm/percpu-internal.h b/mm/percpu-internal.h
index e62d582f4bf3..7e42f0ca3b7b 100644
--- a/mm/percpu-internal.h
+++ b/mm/percpu-internal.h
@@ -36,9 +36,12 @@ struct pcpuobj_ext {
 #ifdef CONFIG_MEMCG_KMEM
 	struct obj_cgroup	*cgroup;
 #endif
+#ifdef CONFIG_MEM_ALLOC_PROFILING
+	union codetag_ref	tag;
+#endif
 };
 
-#ifdef CONFIG_MEMCG_KMEM
+#if defined(CONFIG_MEMCG_KMEM) || defined(CONFIG_MEM_ALLOC_PROFILING)
 #define NEED_PCPUOBJ_EXT
 #endif
 
@@ -86,7 +89,11 @@ struct pcpu_chunk {
 
 static inline bool need_pcpuobj_ext(void)
 {
-	return !mem_cgroup_kmem_disabled();
+	if (IS_ENABLED(CONFIG_MEM_ALLOC_PROFILING))
+		return true;
+	if (!mem_cgroup_kmem_disabled())
+		return true;
+	return false;
 }
 
 extern spinlock_t pcpu_lock;
diff --git a/mm/percpu.c b/mm/percpu.c
index 2e5edaad9cc3..578531ea1f43 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -1699,6 +1699,32 @@ static void pcpu_memcg_free_hook(struct pcpu_chunk *chunk, int off, size_t size)
 }
 #endif /* CONFIG_MEMCG_KMEM */
 
+#ifdef CONFIG_MEM_ALLOC_PROFILING
+static void pcpu_alloc_tag_alloc_hook(struct pcpu_chunk *chunk, int off,
+				      size_t size)
+{
+	if (mem_alloc_profiling_enabled() && likely(chunk->obj_exts)) {
+		alloc_tag_add(&chunk->obj_exts[off >> PCPU_MIN_ALLOC_SHIFT].tag,
+			      current->alloc_tag, size);
+	}
+}
+
+static void pcpu_alloc_tag_free_hook(struct pcpu_chunk *chunk, int off, size_t size)
+{
+	if (mem_alloc_profiling_enabled() && likely(chunk->obj_exts))
+		alloc_tag_sub_noalloc(&chunk->obj_exts[off >> PCPU_MIN_ALLOC_SHIFT].tag, size);
+}
+#else
+static void pcpu_alloc_tag_alloc_hook(struct pcpu_chunk *chunk, int off,
+				      size_t size)
+{
+}
+
+static void pcpu_alloc_tag_free_hook(struct pcpu_chunk *chunk, int off, size_t size)
+{
+}
+#endif
+
 /**
  * pcpu_alloc - the percpu allocator
  * @size: size of area to allocate in bytes
-- 
2.43.0.687.g38aa6559b0-goog


