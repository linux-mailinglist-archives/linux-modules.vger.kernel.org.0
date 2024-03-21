Return-Path: <linux-modules+bounces-930-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB951886246
	for <lists+linux-modules@lfdr.de>; Thu, 21 Mar 2024 22:09:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00DFCB219B0
	for <lists+linux-modules@lfdr.de>; Thu, 21 Mar 2024 21:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19945135A55;
	Thu, 21 Mar 2024 21:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vH7+jQ/m"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02F8135A5C
	for <linux-modules@vger.kernel.org>; Thu, 21 Mar 2024 21:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711055331; cv=none; b=GnkhnOnpARdVZkYJhbINCSQSBRyQMEH6vvFS0VzRy0fnCQqxrn9La+m/qfoR+WjkBY+c/Ld8u6CVoRzO2upYR4FocuCpXSI1ez6Xh7Pas+OXfykVRtSbvhwBEDlJlKbHz425nx+C1JtPRp/d9z+rb8oDe1SaliWwKvvoCYebM6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711055331; c=relaxed/simple;
	bh=y6UZilsub+NKtJrG/hhdATKtBTFYxelRy9AM56Z6Tnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kcqhj8Q6rlUUDcpfTkqVF08NvmfBgzqiFZ7njwLUwLmuM3Nl+GNuN55cllvxy9kuiIrjli8usJVUulHl5lMZNK6D0wXu7rPIRxi2JIy0PIz8whaRgX2fB2fKUYJwYvkd2pVTo/0j5AGqj3ALSjooJVB+C5g2tsaux8Q4MeVMf0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vH7+jQ/m; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dd10ebcd702so1426244276.2
        for <linux-modules@vger.kernel.org>; Thu, 21 Mar 2024 14:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711055328; x=1711660128; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRNPrWHMxiQDcKwm3DA9WZxrfwYc+pk9Whir/OXbLVs=;
        b=vH7+jQ/mO3HDEunRoRopDRQGT701Z3nvOVF1j7zOjH5gTdnLOYY96/qQqQyBmtiCtC
         Jm6ZLEGAqlXxQGAa7w3PllnyFtErJLdlUpgIkeHGCtk+6dGoBdESjarQULu5UGpgZV22
         VKHwZz78l/9Y2UuN+Pib7YCppcefS4lXi0+Tb2gRo1c1QDrpjYxqv2K3zpckzuwKEUUQ
         X8tQa8dX7Q5hgNZ9RJWGfxVsM7cmFqoR1gznhb7h3i3C5fkTWtC7iTKPqvKWahBAawKD
         qbU15dLn3n1/aXMHW47aVqTwjlO8GGg4nRB1PpQTVu6CAeGwsB7K87Mny5Y/JpvUU6+c
         aIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711055328; x=1711660128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NRNPrWHMxiQDcKwm3DA9WZxrfwYc+pk9Whir/OXbLVs=;
        b=AwkzSlhMF4Oaa7w+gPxRbrjAMO0cjmJjsXOqZtA/C/WED5PfSxsRiYezOalsKd+h7S
         wYuV0/IWmLz4SCbreli/NxaNJo25u5+nymPGojIBe4ESsnfR2U9pPoYF16Hka9oTy/LQ
         kJiHqwGfJZ8zUjnVV/aQ1yMrJC9xnRyiO4cMiJmLrs591Smn5WAU5yYQm3OKbJZH23Ww
         eWDRQGVlwCoEc30bJl3cHxh0KpjceANO/vkOhtlPmYeMOtuYsGjWgP4WeVijOzXnlU9X
         QXGwR2PJs6QGg7MIrdFBeiJBlHrJ+7qAfgL62Qwpi/RbFo5uNZoxXz+gtn02DVVvV9P4
         QOvA==
X-Forwarded-Encrypted: i=1; AJvYcCXmTFKPtlxUkqYyDdndOshfBe4HlReusE61dNpGaU9IlwLawWY7OlCkrFEhWgUrrMzgW9ro50IMvN+wBdcml+67g+tiCP24wC+nAz+sJg==
X-Gm-Message-State: AOJu0YyZrWM32fK7sTmq0fRPvyPzlvt3C4zueTZMXK+UGdr7OF+bvjE9
	HO75aB/nlDpWLttLoGTJh03IzbpuvvDzN+dss3R3xn/slmFB4yfszGTptH2cq/wY5uiV7YSI0XL
	oO6M/Tse3I+IzbtQMqZrhOjWeYsx/rIYZ4obt
X-Google-Smtp-Source: AGHT+IFQjWJqcUXxfuhd8any/MYD5BWIbsIOeqDcrZmmixvYhOq+BO7q8gQSEJbNPKfsdpWwwz0LdvkayxzWMZVyrx4=
X-Received: by 2002:a25:6903:0:b0:dcf:f78f:a570 with SMTP id
 e3-20020a256903000000b00dcff78fa570mr390215ybc.7.1711055327530; Thu, 21 Mar
 2024 14:08:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240321163705.3067592-1-surenb@google.com> <20240321134157.212f0fbe1c03479c01e8a69e@linux-foundation.org>
In-Reply-To: <20240321134157.212f0fbe1c03479c01e8a69e@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 21 Mar 2024 14:08:34 -0700
Message-ID: <CAJuCfpG-KiE-MyOR0ZCghOswDMKS-9SmBh_UEdzSf4GHTB1wBg@mail.gmail.com>
Subject: Re: [PATCH v6 00/37] Memory allocation profiling
To: Andrew Morton <akpm@linux-foundation.org>
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
	kernel-team@android.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 21, 2024 at 1:42=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Thu, 21 Mar 2024 09:36:22 -0700 Suren Baghdasaryan <surenb@google.com>=
 wrote:
>
> > Low overhead [1] per-callsite memory allocation profiling. Not just for
> > debug kernels, overhead low enough to be deployed in production.
> >
> > Example output:
> >   root@moria-kvm:~# sort -rn /proc/allocinfo
> >    127664128    31168 mm/page_ext.c:270 func:alloc_page_ext
> >     56373248     4737 mm/slub.c:2259 func:alloc_slab_page
> >     14880768     3633 mm/readahead.c:247 func:page_cache_ra_unbounded
> >     14417920     3520 mm/mm_init.c:2530 func:alloc_large_system_hash
> >     13377536      234 block/blk-mq.c:3421 func:blk_mq_alloc_rqs
> >     11718656     2861 mm/filemap.c:1919 func:__filemap_get_folio
> >      9192960     2800 kernel/fork.c:307 func:alloc_thread_stack_node
> >      4206592        4 net/netfilter/nf_conntrack_core.c:2567 func:nf_ct=
_alloc_hashtable
> >      4136960     1010 drivers/staging/ctagmod/ctagmod.c:20 [ctagmod] fu=
nc:ctagmod_start
> >      3940352      962 mm/memory.c:4214 func:alloc_anon_folio
> >      2894464    22613 fs/kernfs/dir.c:615 func:__kernfs_new_node
>
> Did you consider adding a knob to permit all the data to be wiped out?
> So people can zap everything, run the chosen workload then go see what
> happened?
>
> Of course, this can be done in userspace by taking a snapshot before
> and after, then crunching on the two....

Yeah, that's exactly what I was envisioning. Don't think we need to
complicate more by adding a reset functionality unless there are other
reasons for it. Thanks!

