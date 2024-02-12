Return-Path: <linux-modules+bounces-447-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D34852015
	for <lists+linux-modules@lfdr.de>; Mon, 12 Feb 2024 22:43:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68F261C2237A
	for <lists+linux-modules@lfdr.de>; Mon, 12 Feb 2024 21:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA6D52F81;
	Mon, 12 Feb 2024 21:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rz5/aBxb"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE514EB33
	for <linux-modules@vger.kernel.org>; Mon, 12 Feb 2024 21:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707773993; cv=none; b=Ki7M5SwPYBtJbiMwPXc97XeZgZBC+33q3TZ9J69RfMGvJX8XcUvQknkvFYWHXU8l7yK/94txRscdqTaw14RSQD/fax/NTZqtxeWhUYUg0EnhF/HVHq7MtPJONAXpDY0LHtP3k+jp5itcrYSyFnbd7IP04j5FBdMW8UOHulKZmos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707773993; c=relaxed/simple;
	bh=w44iVPug8jpPRNSPySloNWFf1wUiHVTmGcnwNRfDzpg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ugdq0jUiv/Do68M30AJ/KVMa26D6FYSawmNVBIbn0E+Roy8AavZJ3d8N6cIJP5yRETHMntsMWU6LeRuNpN59XkVJSdXp43UpMaBLmtlTCG3STvEi4WQxI2awq/INtFoZiv4q0LXDtv1klyBYIWI3lRZakD0BA5xG31nSeJ6O5zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rz5/aBxb; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-60770007e52so13310457b3.1
        for <linux-modules@vger.kernel.org>; Mon, 12 Feb 2024 13:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707773990; x=1708378790; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MHmYMVX3pDUmg31UH8awuyUsQFI7ijlFGj9IhCGVNQw=;
        b=Rz5/aBxbsyqoYl5hVd7mCn766MbmtfOU4LRvsCRCwTBPF39cHUQvh+tO3RkCXwHgXf
         bsmdmTKU/K7ZHiQc/uKVNkef4h6ELFCd7LjqxcF7m7FxcTFz5T9FgwyX9QQclGwkt8kK
         RKNDl/jjzial6AOial4qEZVF0exPUOUJydsG+JD8znWfxIDo/CC+AtF2qk3rndjJkhiP
         ZHNLySaG40RlwOoBiTLJvDrMlk2v/8gxySFuFLsJaBTMcBZhNOSJsTlPWs9mmnSg7CNN
         ifGxSG+Zcic0uSjuQNzabq2wLdotg9YpDrMuzojP1X6cenbsB3QRhtenQ1jhgRc8ZdHo
         k2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707773990; x=1708378790;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MHmYMVX3pDUmg31UH8awuyUsQFI7ijlFGj9IhCGVNQw=;
        b=ADNdCz/c7LDdBxoIrq6DLcr9ek893tvTEEUE2+CBoGHGxj7EVeByH8j4bFwxA/a/65
         sn/1/18/7/+Q5BPNDdI4Twk5g2NERIsgR1AgzQPFzeAf/XFEKQA4K3IoW1AoKbdeuwsv
         TGhHra+KJwVzbmKdC87VIl7bOm/9u4A48w3pvAQsuh3avrhu4G6KInZ4mhKVC5CsQgKb
         zppTHsD8EKQDoG3PPjFjGS7MlQOwiZIpH1+akA1PRmo1MVZPwmgj12CMOlHdSL75DzkO
         urD5c92u+lltVmnpbFtG7OZOOvkWXg+dBAS6SHoqFqrw3rfZuaY7kz40M8dCgt+1Hbth
         qxiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcT/kgfcymztHzWeczLALM8VTAlis383uNB0oOXMb5VbEdJWbHKJj2y3LDfoOt48FgigrMZ712cWAWOjgMvQKQ7H1t0y9/uquhN+tcBg==
X-Gm-Message-State: AOJu0YzpoOg9OfDYfyr0X1c2M0uAn0Oz2Id5Tdp+ubytyvBhZqcx/hs4
	+qhV7tSS3wvHxOIhXnOK/bIkEfwXJIjJnnji98DxqZAQCAriWdZ3YFuiZqJcHzpVyA+mKl4MPlr
	cxg==
X-Google-Smtp-Source: AGHT+IFDzjF2cGPjf9byIT/iUDxPrFM8RUYETPrPWdKRGwVNA8HPcuChMwLVorzqu+gtL/yYLkx2m1ZVYB4=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:b848:2b3f:be49:9cbc])
 (user=surenb job=sendgmr) by 2002:a05:690c:fd0:b0:602:cd1a:6708 with SMTP id
 dg16-20020a05690c0fd000b00602cd1a6708mr1449899ywb.0.1707773989875; Mon, 12
 Feb 2024 13:39:49 -0800 (PST)
Date: Mon, 12 Feb 2024 13:38:54 -0800
In-Reply-To: <20240212213922.783301-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240212213922.783301-1-surenb@google.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240212213922.783301-9-surenb@google.com>
Subject: [PATCH v3 08/35] mm: prevent slabobj_ext allocations for slabobj_ext
 and kmem_cache objects
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

Use __GFP_NO_OBJ_EXT to prevent recursions when allocating slabobj_ext
objects. Also prevent slabobj_ext allocations for kmem_cache objects.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/slab.h        | 6 ++++++
 mm/slab_common.c | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/mm/slab.h b/mm/slab.h
index 436a126486b5..f4ff635091e4 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -589,6 +589,12 @@ prepare_slab_obj_exts_hook(struct kmem_cache *s, gfp_t flags, void *p)
 	if (!need_slab_obj_ext())
 		return NULL;
 
+	if (s->flags & SLAB_NO_OBJ_EXT)
+		return NULL;
+
+	if (flags & __GFP_NO_OBJ_EXT)
+		return NULL;
+
 	slab = virt_to_slab(p);
 	if (!slab_obj_exts(slab) &&
 	    WARN(alloc_slab_obj_exts(slab, s, flags, false),
diff --git a/mm/slab_common.c b/mm/slab_common.c
index 6bfa1810da5e..83fec2dd2e2d 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -218,6 +218,8 @@ int alloc_slab_obj_exts(struct slab *slab, struct kmem_cache *s,
 	void *vec;
 
 	gfp &= ~OBJCGS_CLEAR_MASK;
+	/* Prevent recursive extension vector allocation */
+	gfp |= __GFP_NO_OBJ_EXT;
 	vec = kcalloc_node(objects, sizeof(struct slabobj_ext), gfp,
 			   slab_nid(slab));
 	if (!vec)
-- 
2.43.0.687.g38aa6559b0-goog


