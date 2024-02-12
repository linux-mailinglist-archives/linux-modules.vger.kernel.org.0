Return-Path: <linux-modules+bounces-464-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA5785207B
	for <lists+linux-modules@lfdr.de>; Mon, 12 Feb 2024 22:49:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64D131C22FEE
	for <lists+linux-modules@lfdr.de>; Mon, 12 Feb 2024 21:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693784E1D5;
	Mon, 12 Feb 2024 21:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FNho1vl3"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4B958AB4
	for <linux-modules@vger.kernel.org>; Mon, 12 Feb 2024 21:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707774030; cv=none; b=nQ8Pmka4hv+/HoBIMeph+0XniYHStD9C92dLKdkk/hLQpCFNfH2+tK6ArS1YvZgm57elnT/ZOfd/sjJmthXtsF+VnmDropSyPc5bZXkGrSPvoxvVusZE9sD7im/GzZDACHBLguA2Z4U1lv9BnfSrXvEcuhPTAYtFtgjcZ3/K1Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707774030; c=relaxed/simple;
	bh=SPQ6Ysfd7WnLLii6ApAHVobNpCAxJwmzP4EGGARuO/M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tU60o/DYZKgsX+nfv1AaO2xor6Uuh8CKRDINcNElPwo0dX9HDB9WlT4oW5RsJCx4Z4ZOENANGZbKwP/Vzvt5zPRW5UsOuMLWH1TWWKg+eDgBHp6BzgeNX2s6vOQQgPXi8W3ehzQkioCzIGHz9E5A7mq0SdtSUD+Fd0Mmr9MVgjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FNho1vl3; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dc647f65573so6527313276.2
        for <linux-modules@vger.kernel.org>; Mon, 12 Feb 2024 13:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707774027; x=1708378827; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uyzb7E9FIhn/mbh3tSg2FbzBy8bNHcnwrWfMf2QZXg0=;
        b=FNho1vl3tt9J+6Doa5B0s+MpcIxnRkqDjVGbtulbmBq+KlAel0ZRPSDKK5WK6m2YUI
         v5mbXUCJL7cHOZPaO/Z/isl9yYFvC0fQ6Ba54wk2zZNnB20JGQEvjPJbCNPNEumi2G2v
         TCVSgWGroVKF+trDAcs9bCaBGiARj+xv8V2Ew9bCpZxMRNl+fd1OjFzNml5UAoxcQlYx
         YwMcLllMnvgJbNXfJkJ50caD3DDtPwuWkYTKXTDfLUadKu4W5dxBcw1V0hsKxVqpBnIo
         FLqwwV8Z4Ut/Q1n96ll3obaZBsRTc22a4yBF9F1JHTQ32EnjRNdsWrXMymkJZ60bzQo/
         2Zlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707774027; x=1708378827;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uyzb7E9FIhn/mbh3tSg2FbzBy8bNHcnwrWfMf2QZXg0=;
        b=nCYxLBAY4/aHcBj7RpRzv0hpQGFkWjCTdBjl5otawcYzeCLf/IAazywoEgNTw9rMiG
         WECjpFcRN3KggEGYgrAwl+lIdhD+Jy1O6wF2QNr1UEwQasbXhOrMFzkMiQjG6vDZBCu8
         4rqH5ZWUFpJ7UMHjZDjxR2fDDIZEMZ66YDi3xE3N8mpHEc5TevByUEaWoRZvHGPy2SZe
         8AZouOza/IDhsCOeAgJebVC3JWbiAJlFxan20+mxB/EcvJ7RKmZJV7rvtoo9c4U2T6pj
         hnO38mPfQqxnBJbLCQpm7+qx18P4r8NrX0YBMVDSAMso3E7sMgdWBDqvyrZ0TODVAJoA
         6Ecg==
X-Forwarded-Encrypted: i=1; AJvYcCXoQ6767u8IfIeVRxTkXZppuhC5buaRKsqEcB0ZI8rR16Q8Ow/Xx4qKnnyuSLx7/QT5ZNd8Oi2BDBSb/LqWIZ99Hv2kkAvhAVyIySE8wA==
X-Gm-Message-State: AOJu0Yy6xXNY7TKPqhJp/qxz7Js107sKNofbyTamyqED3hOUbxEAVL0h
	hCyXDRuinTN0gGW+jx0YXeg8FAr2ct5eJfXZgH8mdOgonuTQEvkwbKInPf+tUYGo79OQynlPJdg
	Tsw==
X-Google-Smtp-Source: AGHT+IE5NPp+ufCGF1WHGTLjC5ri/m4V06t1gtAUtmtnTKuKy22ZlehWWdmQuoopo1S/2T4p6wMzddrrcNE=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:b848:2b3f:be49:9cbc])
 (user=surenb job=sendgmr) by 2002:a05:6902:1505:b0:dc7:48ce:d17f with SMTP id
 q5-20020a056902150500b00dc748ced17fmr2107200ybu.10.1707774026593; Mon, 12 Feb
 2024 13:40:26 -0800 (PST)
Date: Mon, 12 Feb 2024 13:39:11 -0800
In-Reply-To: <20240212213922.783301-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240212213922.783301-1-surenb@google.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240212213922.783301-26-surenb@google.com>
Subject: [PATCH v3 25/35] xfs: Memory allocation profiling fixups
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

This adds an alloc_hooks() wrapper around kmem_alloc(), so that we can
have allocations accounted to the proper callsite.

Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 fs/xfs/kmem.c |  4 ++--
 fs/xfs/kmem.h | 10 ++++------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/fs/xfs/kmem.c b/fs/xfs/kmem.c
index c557a030acfe..9aa57a4e2478 100644
--- a/fs/xfs/kmem.c
+++ b/fs/xfs/kmem.c
@@ -8,7 +8,7 @@
 #include "xfs_trace.h"
 
 void *
-kmem_alloc(size_t size, xfs_km_flags_t flags)
+kmem_alloc_noprof(size_t size, xfs_km_flags_t flags)
 {
 	int	retries = 0;
 	gfp_t	lflags = kmem_flags_convert(flags);
@@ -17,7 +17,7 @@ kmem_alloc(size_t size, xfs_km_flags_t flags)
 	trace_kmem_alloc(size, flags, _RET_IP_);
 
 	do {
-		ptr = kmalloc(size, lflags);
+		ptr = kmalloc_noprof(size, lflags);
 		if (ptr || (flags & KM_MAYFAIL))
 			return ptr;
 		if (!(++retries % 100))
diff --git a/fs/xfs/kmem.h b/fs/xfs/kmem.h
index b987dc2c6851..c4cf1dc2a7af 100644
--- a/fs/xfs/kmem.h
+++ b/fs/xfs/kmem.h
@@ -6,6 +6,7 @@
 #ifndef __XFS_SUPPORT_KMEM_H__
 #define __XFS_SUPPORT_KMEM_H__
 
+#include <linux/alloc_tag.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
 #include <linux/mm.h>
@@ -56,18 +57,15 @@ kmem_flags_convert(xfs_km_flags_t flags)
 	return lflags;
 }
 
-extern void *kmem_alloc(size_t, xfs_km_flags_t);
 static inline void  kmem_free(const void *ptr)
 {
 	kvfree(ptr);
 }
 
+extern void *kmem_alloc_noprof(size_t, xfs_km_flags_t);
+#define kmem_alloc(...)			alloc_hooks(kmem_alloc_noprof(__VA_ARGS__))
 
-static inline void *
-kmem_zalloc(size_t size, xfs_km_flags_t flags)
-{
-	return kmem_alloc(size, flags | KM_ZERO);
-}
+#define kmem_zalloc(_size, _flags)	kmem_alloc((_size), (_flags) | KM_ZERO)
 
 /*
  * Zone interfaces
-- 
2.43.0.687.g38aa6559b0-goog


