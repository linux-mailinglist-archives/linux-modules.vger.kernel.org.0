Return-Path: <linux-modules+bounces-686-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C1C85E80D
	for <lists+linux-modules@lfdr.de>; Wed, 21 Feb 2024 20:49:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E056FB27782
	for <lists+linux-modules@lfdr.de>; Wed, 21 Feb 2024 19:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D5F14E2F4;
	Wed, 21 Feb 2024 19:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GuV3TJ3M"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6ED814D446
	for <linux-modules@vger.kernel.org>; Wed, 21 Feb 2024 19:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708544506; cv=none; b=lmnNivMSVsKfRpgqpghSoRoj/L+fRPKMgSCM9F0ZqmJGgjXXF58ZGxonuhzvqZGClc/QRAHtlAM/N/RvR9bR2ep0QIhacs2cjlsJCIkiRqJNjSTQJ0zMJczYVnzSrX31R80t2JuccQ83yndkK5Un6hZMrw92ufla7TTCEkJ1+Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708544506; c=relaxed/simple;
	bh=tyIikjJlrYyNLJoOHRGtPA/wKSTMkEiPDo19C/DYXH4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XRNmaT/xOTx9b8sZ4y3TdC1AaMi1ZWXvz6IJc43KvmXlIhZYXzETqicAmPIbNLj/1RHY7s0g8nZ1yH94AehT43H765VWrRUe/kHUz8vkbzpfkrWseAEM+ZINvpS2RJ1x+yfKDeuWEySOj5Te+cDH9mTHqVau0xoK+Xugid25XPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GuV3TJ3M; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-607e613a1baso116815107b3.1
        for <linux-modules@vger.kernel.org>; Wed, 21 Feb 2024 11:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708544503; x=1709149303; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4D2ym4tmaIuNf1w08quK73QR9EK/cyrgSXHS1sTLYhg=;
        b=GuV3TJ3MrI71MbxE34f/5qi8JNdui5fJUINhuMdeX1pUpXOUTj7yHD3Eld8RsYWH8f
         M/bNF47TLDvzMTaikAwQfx5WddNrQm6sqCLiOiARVX7t+xQ7Eq5H7GY4kcchBe3XFPMM
         HAVGsc1rrSCkuU8pLk5mAWeFBMxrfkeRSXQp6E908UePDaoCInUbhxotyQX2qhK5w/wI
         j2SdaGwjQqVMqvULZDe0ZO0V316WYJSGZI/mCCndvhtjVEoU8Bja0evFw0h1iM6XbYBG
         qlc3/mtkzf3fQG2/AG70AhJGtroFax1I18GSPlZL8f4nBZRtDCg0p0AiAVunFN34nnap
         p/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708544503; x=1709149303;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4D2ym4tmaIuNf1w08quK73QR9EK/cyrgSXHS1sTLYhg=;
        b=udXVtMDqxyvMfLZrAlR9k1xXaxwXyjpHBflkQnvtidyO+SjRATxaFIF6GyL746Q4t9
         j5D4GkOCEDrpC4NimU/0aFlLrI543TxeA2mAdYkpkGj5RtVcnikHgtGGIfTUdtuGJiHQ
         JiDBTBxkFkDTFGOcle0X0NFa6X/V0zwI6C7/UR6nNrsyi6XQk0Vphff33TVAhkH3jVH+
         gmdEOlJeBodMVnn3xWVLVYKjqn/60TiNncUXUKyv4GYCvqgPNL6wRqlyMJla38cu9CUq
         Zjihrea/S8q6FMlJFPXaUaNrwn5mZL9/MhyzqWTTd6jmFQtJITmdSLjLK3stZweV/x6u
         y3IA==
X-Forwarded-Encrypted: i=1; AJvYcCWNqVoRZrlCObX1bXjw4uIn1dI7KY+054Sf9qRaFXywGx9LZuOgKazGZn3RNQop13DtHLKv4sW66RIzKKxbGJgPJITD5g8Tm1RpXU+wZg==
X-Gm-Message-State: AOJu0YyPwAvIKEmDe14ahJ3bkSXSkRFp4wYYSgVfeRu65AJLBIRIg/rN
	1I4P/5A5untLeXjcQ+7o0uqtVy3Qvmn/G9PwT30pBaG2r4+s5veXdZNyS75rUh37Q8X3XRvsnxS
	tVg==
X-Google-Smtp-Source: AGHT+IHUFqe0R6lIIi9NA0qHx8ZRtyarym315AvQcyj6s2JvP2F2gSCMg1vFWmN120oFVZKD/Z/VCxMwQvI=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:953b:9a4e:1e10:3f07])
 (user=surenb job=sendgmr) by 2002:a0d:e611:0:b0:607:9268:6665 with SMTP id
 p17-20020a0de611000000b0060792686665mr4677003ywe.10.1708544502298; Wed, 21
 Feb 2024 11:41:42 -0800 (PST)
Date: Wed, 21 Feb 2024 11:40:34 -0800
In-Reply-To: <20240221194052.927623-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240221194052.927623-1-surenb@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221194052.927623-22-surenb@google.com>
Subject: [PATCH v4 21/36] lib: add codetag reference into slabobj_ext
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

To store code tag for every slab object, a codetag reference is embedded
into slabobj_ext when CONFIG_MEM_ALLOC_PROFILING=y.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Co-developed-by: Kent Overstreet <kent.overstreet@linux.dev>
Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
---
 include/linux/memcontrol.h | 5 +++++
 lib/Kconfig.debug          | 1 +
 2 files changed, 6 insertions(+)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index f3584e98b640..2b010316016c 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -1653,7 +1653,12 @@ unsigned long mem_cgroup_soft_limit_reclaim(pg_data_t *pgdat, int order,
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
index 7bbdb0ddb011..9ecfcdb54417 100644
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
2.44.0.rc0.258.g7320e95886-goog


