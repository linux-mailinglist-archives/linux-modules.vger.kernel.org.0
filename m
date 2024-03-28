Return-Path: <linux-modules+bounces-791-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62926873F26
	for <lists+linux-modules@lfdr.de>; Wed,  6 Mar 2024 19:32:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 196E02873F9
	for <lists+linux-modules@lfdr.de>; Wed,  6 Mar 2024 18:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C5214C595;
	Wed,  6 Mar 2024 18:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GlQvMxy9"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EC314BF2F
	for <linux-modules@vger.kernel.org>; Wed,  6 Mar 2024 18:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709749535; cv=none; b=pAWYm5S+7rXbOnveqqFeZ5sEm1dyX2eBPoo6QZ6lku9jvNH35fmiNopCMuhlX1MljlKAGoM3km3WobC9+dLvq4YpfGusD/f8ReLlNp4nRp9wGn5xKc6lZQK7Wpt7Gr13PF/0+WtM6dW+dQjvdiUBsKgv5A5J1vyQtL665AzIvAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709749535; c=relaxed/simple;
	bh=5X/AexHQW90KeQjyGkMbYKB5WQHanB7BlzRsAd7/9vI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qNSxiX8mtGKEd01vRNLKqMxS0uqv9P0ix+n1Xz+/vtOWhO45srwhHQJuz0T1m/B0+vV3EKm1S92Z6h38XVyf68GEyi6RVii6T/bbTvDzURhz/6eICTvUkbRBvSquoLLc75CO8xx7hC6FjAeZmxgfQjpZ7kbzuKt1SpBojkHp4lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GlQvMxy9; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-608e4171382so103557b3.3
        for <linux-modules@vger.kernel.org>; Wed, 06 Mar 2024 10:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709749532; x=1710354332; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rg6IJ0Q4L7KBxRODnLb4yefimTum4BvWKaOTt5/YB2o=;
        b=GlQvMxy9n468uijGtR8dhEvRg6rsCcInobtJm6bJxkSiHI/8WCtMbk49uxAij2WHxR
         oupI4bcvwcInZkySe4lWTAbxZ68CiYfqHu1qCaQyk1sBIQmCSjw/7NI89BLMmlBB0o0A
         q5zaWOXdLzsmfdcUj0MLTeyIUMhpki2CRrf3RFzIUqvCE6GJPl5hDX8603Uj72fzZXyb
         UtDOJJaqv/BCSIIG6GbFgGKXdSfwNhPJsu8LhAb2fwZA+W9/wZ4RzgHn9jw9VF4D1pgG
         +bsI0hg29w9br86sRLuo0IoPysiooHa5aFkNI8gMDiyJ3l3O+XAWAofULnnlPu6tKBZX
         Q3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709749532; x=1710354332;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rg6IJ0Q4L7KBxRODnLb4yefimTum4BvWKaOTt5/YB2o=;
        b=hL3rzFz9j6LoAX4s8f3qMGodpOwL0Lco2cPUF6hnQV1omnHFFDPkRIek5vpllrXMs+
         FiRDasgTy562TD4iRo4yBnhigxYLV2dFSyC3YZtA9atsOev3PiS66P3Ca0mwR7I6eqfE
         +BDR1KSe4anJWf9XS1uU3/cMvauKKgS8SU9AQ+PjWTrS8ZhkQM4NJm4uOxzlj7s6t/JW
         P60H3oXnN9LpehdLK2mgiE0pSGfInuxKHWMI1iJZ0mLQ0lSX6EhYMImgA3Ux+/t9SJwT
         rXLBx8fUBmTbxLj1mpi6i5TDRiOeQCvuWGNV/XY/9AwJSGD9btjyLaPUODnm5IkTUuEB
         ZVXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeKD9t/CCv/flbp+/lXFp9uGE/sGETZGVPsRZ/zgbujJvIrKaIfHyFpPuqp719LCi+ydXKVpUxa6cWOEscwxQpA3Is3jYg8YhSMSow2w==
X-Gm-Message-State: AOJu0YxldCc5dlOL8b9v1lMsiJrwsm9gYrdRGX2tDGt2UyzYr6QF0hta
	9dUYca0YpcehUhpF8Wgd54GsZg/37zWObqJxN0fEaLxt3UJR42ZJceu6fzY8MhQ8XbO/DXs0Gej
	JdA==
X-Google-Smtp-Source: AGHT+IF+RFcX0NYxjT6uNvnW+K0lH94IF3O72VJ6PT7ea1CL+TwW9QtFKtQNO2MOoPPDxhg0sWNTYKHdXg0=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:85f0:e3db:db05:85e2])
 (user=surenb job=sendgmr) by 2002:a81:9945:0:b0:609:781f:a7ab with SMTP id
 q66-20020a819945000000b00609781fa7abmr3355582ywg.1.1709749532080; Wed, 06 Mar
 2024 10:25:32 -0800 (PST)
Date: Wed,  6 Mar 2024 10:24:20 -0800
In-Reply-To: <20240306182440.2003814-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240306182440.2003814-1-surenb@google.com>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
Message-ID: <20240306182440.2003814-23-surenb@google.com>
Subject: [PATCH v5 22/37] lib: add codetag reference into slabobj_ext
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
	glider@google.com, elver@google.com, dvyukov@google.com, shakeelb@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, aliceryhl@google.com, 
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com, 
	surenb@google.com, kernel-team@android.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

To store code tag for every slab object, a codetag reference is embedded
into slabobj_ext when CONFIG_MEM_ALLOC_PROFILING=y.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Co-developed-by: Kent Overstreet <kent.overstreet@linux.dev>
Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 include/linux/memcontrol.h | 5 +++++
 lib/Kconfig.debug          | 1 +
 2 files changed, 6 insertions(+)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 7709fc3f8f5f..33cdb995751e 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -1652,7 +1652,12 @@ unsigned long mem_cgroup_soft_limit_reclaim(pg_data_t *pgdat, int order,
  * if MEMCG_DATA_OBJEXTS is set.
  */
 struct slabobj_ext {
+#ifdef CONFIG_MEMCG_KMEM
 	struct obj_cgroup *objcg;
+#endif
+#ifdef CONFIG_MEM_ALLOC_PROFILING
+	union codetag_ref ref;
+#endif
 } __aligned(8);
 
 static inline void __inc_lruvec_kmem_state(void *p, enum node_stat_item idx)
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 3e06320474d4..dfb5a03aa47b 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -979,6 +979,7 @@ config MEM_ALLOC_PROFILING
 	depends on !DEBUG_FORCE_WEAK_PER_CPU
 	select CODE_TAGGING
 	select PAGE_EXTENSION
+	select SLAB_OBJ_EXT
 	help
 	  Track allocation source code and record total allocation size
 	  initiated at that code location. The mechanism can be used to track
-- 
2.44.0.278.ge034bb2e1d-goog


