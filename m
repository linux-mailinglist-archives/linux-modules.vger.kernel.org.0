Return-Path: <linux-modules+bounces-123-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BEF7D5251
	for <lists+linux-modules@lfdr.de>; Tue, 24 Oct 2023 15:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40C5B28188C
	for <lists+linux-modules@lfdr.de>; Tue, 24 Oct 2023 13:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C316C2B5DC;
	Tue, 24 Oct 2023 13:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4cw539HC"
X-Original-To: linux-modules@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7242B74D
	for <linux-modules@vger.kernel.org>; Tue, 24 Oct 2023 13:46:57 +0000 (UTC)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A685010D1
	for <linux-modules@vger.kernel.org>; Tue, 24 Oct 2023 06:46:55 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5a7a6fd18abso57833547b3.1
        for <linux-modules@vger.kernel.org>; Tue, 24 Oct 2023 06:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698155215; x=1698760015; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X9FRyOcPx+PqvPwKi5hgMRq683fi1N6H4UQ0tqouPmU=;
        b=4cw539HC33gvhIGk13GOxveTOd9n1qGKSR1OIc8xOIqZipc/s0QJYoKuwGZaPBSZSY
         onk1CfCe8xYPPNFZPxmgb20jMmxXKRMe2IJP7f5hIsQFYbUmuXE2e3KjIbCaK1hPGGFj
         GdO6XFZXDEaduSPjBFIxqe/1E+qe9Wg+6roLruCWU2Evcek5c6nAuxgzCToHxSRI0n4F
         ypuIDcUomO8EQpCRIasU5iLUIx1mKr/E53fgrUPZwSHfj3nkWV5pyBHpiHxKSUZPNSZh
         /yw4WSVAIBThlIGtOb6fV992xxiLyPKGZzw9XA2duieziGf02tsWSHCpDFb+FKQRoGsb
         aO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698155215; x=1698760015;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=X9FRyOcPx+PqvPwKi5hgMRq683fi1N6H4UQ0tqouPmU=;
        b=q+pGQXC8A+HQaXlkbn6cVkxdlIUUrxSuEpkENkOVc5WXNn3q/BTsonJDP82wQ9LUGE
         tr2dnM7A+FBcInoubfkSMvOzyI3xTPGQqKuFVoDHtHVXx9slCkjxVMF8YnqGhY1ec2uE
         /4XH6LzZYYMoSoMGt1a2KEg0diTvQa0WTZ1DChWNnIStv/OVgomXQR+c3PlsEWuTDkn1
         xlYH8kIKRNoPiZ75uqq7H1jntcVDtPI9+4OVop6CeS2YwUevClYD55kEr15wbcTMRd2Q
         8skWX2Y0f3whuQwmdZuMJvzVfDq2PKNVKgPwbi25cR/2o28D2PzgUPQLhBqFeOJZeJ9d
         ljvg==
X-Gm-Message-State: AOJu0Yy+Tz6kjp3j9JGnd0HA5bZz9MBBARDxpp964CquZwpXPmuO8Ea7
	2PZPljZG3mY2kBMepOO/fK29lmnRqF4=
X-Google-Smtp-Source: AGHT+IEYMUNI7PlAuFFQePhYZveJfVsgkcZviL6909NPcDbeQdTGb/wj9KBYs/s9p7NjrzoDo5b3j9oL6eI=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:45ba:3318:d7a5:336a])
 (user=surenb job=sendgmr) by 2002:a0d:eb8a:0:b0:5a7:b496:5983 with SMTP id
 u132-20020a0deb8a000000b005a7b4965983mr249771ywe.9.1698155214761; Tue, 24 Oct
 2023 06:46:54 -0700 (PDT)
Date: Tue, 24 Oct 2023 06:46:03 -0700
In-Reply-To: <20231024134637.3120277-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231024134637.3120277-1-surenb@google.com>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
Message-ID: <20231024134637.3120277-7-surenb@google.com>
Subject: [PATCH v2 06/39] mm: enumerate all gfp flags
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
	cgroups@vger.kernel.org, 
	"=?UTF-8?q?Petr=20Tesa=C5=99=C3=ADk?=" <petr@tesarici.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Introduce GFP bits enumeration to let compiler track the number of used
bits (which depends on the config options) instead of hardcoding them.
That simplifies __GFP_BITS_SHIFT calculation.

Suggested-by: Petr Tesa=C5=99=C3=ADk <petr@tesarici.cz>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/gfp_types.h | 90 +++++++++++++++++++++++++++------------
 1 file changed, 62 insertions(+), 28 deletions(-)

diff --git a/include/linux/gfp_types.h b/include/linux/gfp_types.h
index 6583a58670c5..3fbe624763d9 100644
--- a/include/linux/gfp_types.h
+++ b/include/linux/gfp_types.h
@@ -21,44 +21,78 @@ typedef unsigned int __bitwise gfp_t;
  * include/trace/events/mmflags.h and tools/perf/builtin-kmem.c
  */
=20
+enum {
+	___GFP_DMA_BIT,
+	___GFP_HIGHMEM_BIT,
+	___GFP_DMA32_BIT,
+	___GFP_MOVABLE_BIT,
+	___GFP_RECLAIMABLE_BIT,
+	___GFP_HIGH_BIT,
+	___GFP_IO_BIT,
+	___GFP_FS_BIT,
+	___GFP_ZERO_BIT,
+	___GFP_UNUSED_BIT,	/* 0x200u unused */
+	___GFP_DIRECT_RECLAIM_BIT,
+	___GFP_KSWAPD_RECLAIM_BIT,
+	___GFP_WRITE_BIT,
+	___GFP_NOWARN_BIT,
+	___GFP_RETRY_MAYFAIL_BIT,
+	___GFP_NOFAIL_BIT,
+	___GFP_NORETRY_BIT,
+	___GFP_MEMALLOC_BIT,
+	___GFP_COMP_BIT,
+	___GFP_NOMEMALLOC_BIT,
+	___GFP_HARDWALL_BIT,
+	___GFP_THISNODE_BIT,
+	___GFP_ACCOUNT_BIT,
+	___GFP_ZEROTAGS_BIT,
+#ifdef CONFIG_KASAN_HW_TAGS
+	___GFP_SKIP_ZERO_BIT,
+	___GFP_SKIP_KASAN_BIT,
+#endif
+#ifdef CONFIG_LOCKDEP
+	___GFP_NOLOCKDEP_BIT,
+#endif
+	___GFP_LAST_BIT
+};
+
 /* Plain integer GFP bitmasks. Do not use this directly. */
-#define ___GFP_DMA		0x01u
-#define ___GFP_HIGHMEM		0x02u
-#define ___GFP_DMA32		0x04u
-#define ___GFP_MOVABLE		0x08u
-#define ___GFP_RECLAIMABLE	0x10u
-#define ___GFP_HIGH		0x20u
-#define ___GFP_IO		0x40u
-#define ___GFP_FS		0x80u
-#define ___GFP_ZERO		0x100u
+#define ___GFP_DMA		BIT(___GFP_DMA_BIT)
+#define ___GFP_HIGHMEM		BIT(___GFP_HIGHMEM_BIT)
+#define ___GFP_DMA32		BIT(___GFP_DMA32_BIT)
+#define ___GFP_MOVABLE		BIT(___GFP_MOVABLE_BIT)
+#define ___GFP_RECLAIMABLE	BIT(___GFP_RECLAIMABLE_BIT)
+#define ___GFP_HIGH		BIT(___GFP_HIGH_BIT)
+#define ___GFP_IO		BIT(___GFP_IO_BIT)
+#define ___GFP_FS		BIT(___GFP_FS_BIT)
+#define ___GFP_ZERO		BIT(___GFP_ZERO_BIT)
 /* 0x200u unused */
-#define ___GFP_DIRECT_RECLAIM	0x400u
-#define ___GFP_KSWAPD_RECLAIM	0x800u
-#define ___GFP_WRITE		0x1000u
-#define ___GFP_NOWARN		0x2000u
-#define ___GFP_RETRY_MAYFAIL	0x4000u
-#define ___GFP_NOFAIL		0x8000u
-#define ___GFP_NORETRY		0x10000u
-#define ___GFP_MEMALLOC		0x20000u
-#define ___GFP_COMP		0x40000u
-#define ___GFP_NOMEMALLOC	0x80000u
-#define ___GFP_HARDWALL		0x100000u
-#define ___GFP_THISNODE		0x200000u
-#define ___GFP_ACCOUNT		0x400000u
-#define ___GFP_ZEROTAGS		0x800000u
+#define ___GFP_DIRECT_RECLAIM	BIT(___GFP_DIRECT_RECLAIM_BIT)
+#define ___GFP_KSWAPD_RECLAIM	BIT(___GFP_KSWAPD_RECLAIM_BIT)
+#define ___GFP_WRITE		BIT(___GFP_WRITE_BIT)
+#define ___GFP_NOWARN		BIT(___GFP_NOWARN_BIT)
+#define ___GFP_RETRY_MAYFAIL	BIT(___GFP_RETRY_MAYFAIL_BIT)
+#define ___GFP_NOFAIL		BIT(___GFP_NOFAIL_BIT)
+#define ___GFP_NORETRY		BIT(___GFP_NORETRY_BIT)
+#define ___GFP_MEMALLOC		BIT(___GFP_MEMALLOC_BIT)
+#define ___GFP_COMP		BIT(___GFP_COMP_BIT)
+#define ___GFP_NOMEMALLOC	BIT(___GFP_NOMEMALLOC_BIT)
+#define ___GFP_HARDWALL		BIT(___GFP_HARDWALL_BIT)
+#define ___GFP_THISNODE		BIT(___GFP_THISNODE_BIT)
+#define ___GFP_ACCOUNT		BIT(___GFP_ACCOUNT_BIT)
+#define ___GFP_ZEROTAGS		BIT(___GFP_ZEROTAGS_BIT)
 #ifdef CONFIG_KASAN_HW_TAGS
-#define ___GFP_SKIP_ZERO	0x1000000u
-#define ___GFP_SKIP_KASAN	0x2000000u
+#define ___GFP_SKIP_ZERO	BIT(___GFP_SKIP_ZERO_BIT)
+#define ___GFP_SKIP_KASAN	BIT(___GFP_SKIP_KASAN_BIT)
 #else
 #define ___GFP_SKIP_ZERO	0
 #define ___GFP_SKIP_KASAN	0
 #endif
 #ifdef CONFIG_LOCKDEP
-#define ___GFP_NOLOCKDEP	0x4000000u
+#define ___GFP_NOLOCKDEP	BIT(___GFP_NOLOCKDEP_BIT)
 #else
 #define ___GFP_NOLOCKDEP	0
 #endif
-/* If the above are modified, __GFP_BITS_SHIFT may need updating */
=20
 /*
  * Physical address zone modifiers (see linux/mmzone.h - low four bits)
@@ -249,7 +283,7 @@ typedef unsigned int __bitwise gfp_t;
 #define __GFP_NOLOCKDEP ((__force gfp_t)___GFP_NOLOCKDEP)
=20
 /* Room for N __GFP_FOO bits */
-#define __GFP_BITS_SHIFT (26 + IS_ENABLED(CONFIG_LOCKDEP))
+#define __GFP_BITS_SHIFT ___GFP_LAST_BIT
 #define __GFP_BITS_MASK ((__force gfp_t)((1 << __GFP_BITS_SHIFT) - 1))
=20
 /**
--=20
2.42.0.758.gaed0368e0e-goog


