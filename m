Return-Path: <linux-modules+bounces-681-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 415D385E7EE
	for <lists+linux-modules@lfdr.de>; Wed, 21 Feb 2024 20:47:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 731221C23F62
	for <lists+linux-modules@lfdr.de>; Wed, 21 Feb 2024 19:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FDE0146904;
	Wed, 21 Feb 2024 19:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g3tJ4svK"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9BF86ADE
	for <linux-modules@vger.kernel.org>; Wed, 21 Feb 2024 19:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708544494; cv=none; b=amifNeYm5rr6CoO/2GCO//REowBCoX5hh/DeGiKpzft87oZfunsKhsTtAh0WW636niDF57M1B567os0PQt/qhboJ6fdLQPYAyqQx2jbftwswAQ4Eie0K8fWU/NYKSKThc3HhpvwUgNQ5pV+y6kc4UvTCCQ9DTlZJrYoR3AJ63g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708544494; c=relaxed/simple;
	bh=V79ceBwKz2YCfA8gxo6SKRHzpt3BUXzSbfgGLHuE1lE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RTneG/iL+/TT3bHpA8mY2W0jiJ3e6H5HUjS7LnWRgp8oXUG6E0k3aQGDS/GVQzUiwv+SSpkk+EwOmPT5o07c8wIwOOE9pLZh84XUJbJzmKrb1xRdp0CShV4Hcg2H3YFY4TsBKywpmvc7gwKIIXYz7dN0IMhA0IXybuHa85kgQ/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g3tJ4svK; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-607838c0800so1359577b3.1
        for <linux-modules@vger.kernel.org>; Wed, 21 Feb 2024 11:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708544491; x=1709149291; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GoE6bGSaoBD7i3pA8lR/Run1pysn6CP5hI9CoxzKmn4=;
        b=g3tJ4svKRkruRydasV1YYH+fielfjBLg86kHjY7DU5Hf9oDEzsdO6hP93n3q3QWZ7L
         czpgd9Fj1eLnc5y7qgBaT4cmOWb6h6VN/ArUYRE3T7ziqGTdp573ZX1yujVOx7GaCLKz
         EeofaPOD3DxqcghC7r9lHrMK+DVa4MmoV6KnSwDpSMeG4w+wL+eeuzuRzkrtrtyv7sOo
         YiXIvf3RIOm25J1Y0sO+87l0aSe27ukv4uDMKP/EJuiRvnSPQLDTuGD9WTX/yuP2jukq
         Qjx8E55GUUGCX8fh/68K4InzY0q/3c1gMdVcjVQPFr64mX8PNUNi3WzTV/DDeMPV+q4m
         70wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708544491; x=1709149291;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GoE6bGSaoBD7i3pA8lR/Run1pysn6CP5hI9CoxzKmn4=;
        b=QMehaic2vEXSBSnEnVDJlGaQaNQuJCFLESSz99cvxF1i1R9ik+Ove4NKtJoIkg00HO
         yk3hKjHL+t3+8qVwgtXf0JVX6m9olmt+GhP0HvuLWuj6M+GObxof+1wqecfCTt+DFxMD
         ziLs5q+1SVP1jrXsgn/x0ZksowHmWYjkziXIfhn4z53WDn3DKxP3CB3YTf0X7vukkHWv
         aW/94JY6S23b3oy7M5ClTiCXHQz94hlbHbiu1C5y863wC7ABVaVkma/nrPsjz/qbm83L
         EL1aT2pfLu5NR3t7avsKSsjtLEbHAGF4yQ0KUbQhU7R6mH86G14tnFlXsyJd63SM3x87
         DT7w==
X-Forwarded-Encrypted: i=1; AJvYcCVRfT+LVwiI/JVZSKIMnm9ZxBe80ilwS4P+x+cNxQpioGJ4mWZgB3CXjaYZOwvPwVk0sLpkk/fjALCUFB7ywdXoJdzyb+rMI8T76AhaoQ==
X-Gm-Message-State: AOJu0Yz3HfVIZ5IChZM+865Izqno+e8DhZ+rc/160P5iQir9/4LQ23vQ
	MuQmzk6ieDi7QXz5NAqIRTuuYq+VtuLQ/Ivm9lM4WX6J2rV5rvCq8KHgDcjR7KeE+c8Rn/o+Ube
	BfQ==
X-Google-Smtp-Source: AGHT+IG2dizM99WzNXjXCm4NRVCQCOVTKSh+Pv+zsrsy5Io1Fqept1ZOsQ0OERnmDAPF2nVohKm6aRgWd5Q=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:953b:9a4e:1e10:3f07])
 (user=surenb job=sendgmr) by 2002:a05:690c:fce:b0:608:7c19:c009 with SMTP id
 dg14-20020a05690c0fce00b006087c19c009mr105006ywb.0.1708544491160; Wed, 21 Feb
 2024 11:41:31 -0800 (PST)
Date: Wed, 21 Feb 2024 11:40:29 -0800
In-Reply-To: <20240221194052.927623-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240221194052.927623-1-surenb@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221194052.927623-17-surenb@google.com>
Subject: [PATCH v4 16/36] mm: percpu: increase PERCPU_MODULE_RESERVE to
 accommodate allocation tags
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

As each allocation tag generates a per-cpu variable, more space is required
to store them. Increase PERCPU_MODULE_RESERVE to provide enough area. A
better long-term solution would be to allocate this memory dynamically.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Tejun Heo <tj@kernel.org>
---
 include/linux/percpu.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/percpu.h b/include/linux/percpu.h
index 8c677f185901..62b5eb45bd89 100644
--- a/include/linux/percpu.h
+++ b/include/linux/percpu.h
@@ -14,7 +14,11 @@
 
 /* enough to cover all DEFINE_PER_CPUs in modules */
 #ifdef CONFIG_MODULES
+#ifdef CONFIG_MEM_ALLOC_PROFILING
+#define PERCPU_MODULE_RESERVE		(8 << 12)
+#else
 #define PERCPU_MODULE_RESERVE		(8 << 10)
+#endif
 #else
 #define PERCPU_MODULE_RESERVE		0
 #endif
-- 
2.44.0.rc0.258.g7320e95886-goog


