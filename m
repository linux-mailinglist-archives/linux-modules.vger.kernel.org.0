Return-Path: <linux-modules+bounces-714-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A3C85EDF1
	for <lists+linux-modules@lfdr.de>; Thu, 22 Feb 2024 01:25:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2619283EA5
	for <lists+linux-modules@lfdr.de>; Thu, 22 Feb 2024 00:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B631910A0A;
	Thu, 22 Feb 2024 00:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ofhFBy0g"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B13F516
	for <linux-modules@vger.kernel.org>; Thu, 22 Feb 2024 00:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708561505; cv=none; b=LgPPuGoROoHmMzgRy8BfE+poYXXIf9ntW9Cz/ESpXXm4z/p8gpD5CXliaOmzXaifFetbWC+ksKUbnwmkerp1+KD4tUtHOFW/1sCU33KbAof/iy837orR69ISEJ5/2n7Ol5PyecUplPGFxEBPLl55hSGPrDvtdkQj1FAFIIbacLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708561505; c=relaxed/simple;
	bh=Wl2VBsr8T1E9brAP9ZLk+di58Ii4yEnpHnIDqcL7Ys4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IKY55UTbNXXIoWnsMiCRwUWKNL8gI9/pcqVSizNY+0DXGUP5RaTgu5k0OSGplRPzj5mCQjRIrTBEBwUyeYqXCCMp1A6Ac0IUYmgtSkn96MfoLO45/YKgbmq2QAaxVEidwBvTGYqQ4NuJ3ivQr/Iz6wGg47rKI20lz1FVN8eleko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ofhFBy0g; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6e4c359e48aso554564b3a.1
        for <linux-modules@vger.kernel.org>; Wed, 21 Feb 2024 16:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708561503; x=1709166303; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WrVxGxFZ9H3+hlcYIVohDlCBqheEbLY5A8SDm36k8gU=;
        b=ofhFBy0gzNz2gmMbsAtpvobfLetDEr2h/tPE+renP/99jyIWS80pMhgteraIKPRAuT
         dVlepU+AgxElGXhJTrV3XW5TKRRYghKYMkGBB6bsmf9UWTapjBEs+sytEdFYdPj195G4
         U9m8fSBu+mk6/tjkHArePIX9vdpFML0ALGQ50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708561503; x=1709166303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WrVxGxFZ9H3+hlcYIVohDlCBqheEbLY5A8SDm36k8gU=;
        b=nV+DnrjYG0++cgmBR6jSxnLLS0Tx62XwFaVKoaA26FCOfCmytk/J+DaYFIFaL8VZna
         OlxatJWg2V6+jgUK/kFaho8v68zJA3Z+1xH41kEjskEong6W9UQsi5iAxUfXVmLa/mvI
         gORJwcPf2w+U0tXAXZUqYIQVQxsGCseprRsc0jasanVWieLzItXr9G1WQwRJMALn90tf
         RxseMiz6e0an1H120JqnpOsVZlKBrtkGnZ2bWfx6KewLHDtpV3l4za9gCObuzK5zXsj7
         XifVlUwpAEtLJRGh4BSiyK2JKfISEgkdtaen9CSPnOBp6EJcvw4l1ZEvm9bxsQmBn84z
         AoWg==
X-Forwarded-Encrypted: i=1; AJvYcCV83Z40zKQFqI1KDGHeJkHKsL7y9USExGUNJ+rXLEX75p5eDWOjXizJBaNMjjrqML5nRF+oMA0TcXkSTnVm+a2TK9CtyoGjtQqC62iunQ==
X-Gm-Message-State: AOJu0YyHhrRM9dRf989HZx1ZSeHX0TJJuh7X34RUgjULhRobcMd64Oxb
	0aqvatnUH8lxvwnvJOJcgEWXY/Hg5h8NZmgmsyzkx+dba5F+FuMv10sOjebP2w==
X-Google-Smtp-Source: AGHT+IEJZ3HYcFxZObICKM/x49WlLf4h3po0Yzl2rQr8TWxwQ9a9m/zFcKDEERUUQbcGP3mxNS8r5A==
X-Received: by 2002:aa7:8a06:0:b0:6e4:59d0:febe with SMTP id m6-20020aa78a06000000b006e459d0febemr11129392pfa.7.1708561503366;
        Wed, 21 Feb 2024 16:25:03 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id q13-20020a056a00088d00b006e05c801748sm9501136pfj.199.2024.02.21.16.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 16:25:03 -0800 (PST)
Date: Wed, 21 Feb 2024 16:25:02 -0800
From: Kees Cook <keescook@chromium.org>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org,
	roman.gushchin@linux.dev, mgorman@suse.de, dave@stgolabs.net,
	willy@infradead.org, liam.howlett@oracle.com,
	penguin-kernel@i-love.sakura.ne.jp, corbet@lwn.net,
	void@manifault.com, peterz@infradead.org, juri.lelli@redhat.com,
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
	tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
	x86@kernel.org, peterx@redhat.com, david@redhat.com,
	axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org,
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org,
	muchun.song@linux.dev, rppt@kernel.org, paulmck@kernel.org,
	pasha.tatashin@soleen.com, yosryahmed@google.com, yuzhao@google.com,
	dhowells@redhat.com, hughd@google.com, andreyknvl@gmail.com,
	ndesaulniers@google.com, vvvvvv@google.com,
	gregkh@linuxfoundation.org, ebiggers@google.com, ytcoode@gmail.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, bristot@redhat.com,
	vschneid@redhat.com, cl@linux.com, penberg@kernel.org,
	iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com,
	elver@google.com, dvyukov@google.com, shakeelb@google.com,
	songmuchun@bytedance.com, jbaron@akamai.com, rientjes@google.com,
	minchan@google.com, kaleshsingh@google.com, kernel-team@android.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-arch@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com,
	cgroups@vger.kernel.org
Subject: Re: [PATCH v4 14/36] lib: add allocation tagging support for memory
 allocation profiling
Message-ID: <202402211608.41AD94094@keescook>
References: <20240221194052.927623-1-surenb@google.com>
 <20240221194052.927623-15-surenb@google.com>
 <202402211449.401382D2AF@keescook>
 <4vwiwgsemga7vmahgwsikbsawjq5xfskdsssmjsfe5hn7k2alk@b6ig5v2pxe5i>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4vwiwgsemga7vmahgwsikbsawjq5xfskdsssmjsfe5hn7k2alk@b6ig5v2pxe5i>

On Wed, Feb 21, 2024 at 06:29:17PM -0500, Kent Overstreet wrote:
> On Wed, Feb 21, 2024 at 03:05:32PM -0800, Kees Cook wrote:
> > On Wed, Feb 21, 2024 at 11:40:27AM -0800, Suren Baghdasaryan wrote:
> > > [...]
> > > +struct alloc_tag {
> > > +	struct codetag			ct;
> > > +	struct alloc_tag_counters __percpu	*counters;
> > > +} __aligned(8);
> > > [...]
> > > +#define DEFINE_ALLOC_TAG(_alloc_tag)						\
> > > +	static DEFINE_PER_CPU(struct alloc_tag_counters, _alloc_tag_cntr);	\
> > > +	static struct alloc_tag _alloc_tag __used __aligned(8)			\
> > > +	__section("alloc_tags") = {						\
> > > +		.ct = CODE_TAG_INIT,						\
> > > +		.counters = &_alloc_tag_cntr };
> > > [...]
> > > +static inline struct alloc_tag *alloc_tag_save(struct alloc_tag *tag)
> > > +{
> > > +	swap(current->alloc_tag, tag);
> > > +	return tag;
> > > +}
> > 
> > Future security hardening improvement idea based on this infrastructure:
> > it should be possible to implement per-allocation-site kmem caches. For
> > example, we could create:
> > 
> > struct alloc_details {
> > 	u32 flags;
> > 	union {
> > 		u32 size; /* not valid after __init completes */
> > 		struct kmem_cache *cache;
> > 	};
> > };
> > 
> > - add struct alloc_details to struct alloc_tag
> > - move the tags section into .ro_after_init
> > - extend alloc_hooks() to populate flags and size:
> > 	.flags = __builtin_constant_p(size) ? KMALLOC_ALLOCATE_FIXED
> > 					    : KMALLOC_ALLOCATE_BUCKETS;
> > 	.size = __builtin_constant_p(size) ? size : SIZE_MAX;
> > - during kernel start or module init, walk the alloc_tag list
> >   and create either a fixed-size kmem_cache or to allocate a
> >   full set of kmalloc-buckets, and update the "cache" member.
> > - adjust kmalloc core routines to use current->alloc_tag->cache instead
> >   of using the global buckets.
> > 
> > This would get us fully separated allocations, producing better than
> > type-based levels of granularity, exceeding what we have currently with
> > CONFIG_RANDOM_KMALLOC_CACHES.
> > 
> > Does this look possible, or am I misunderstanding something in the
> > infrastructure being created here?
> 
> Definitely possible, but... would we want this?

Yes, very very much. One of the worst and mostly unaddressed weaknesses
with the kernel right now is use-after-free based type confusion[0], which
depends on merged caches (or cache reuse).

This doesn't solve cross-allocator (kmalloc/page_alloc) type confusion
(as terrifyingly demonstrated[1] by Jann Horn), but it does help with
what has been a very common case of "use msg_msg to impersonate your
target object"[2] exploitation.

> That would produce a _lot_ of kmem caches

Fewer than you'd expect, but yes, there is some overhead. However,
out-of-tree forks of Linux have successfully experimented with this
already and seen good results[3].

> and don't we already try to collapse those where possible to reduce
> internal fragmentation?

In the past, yes, but the desire for security has tended to have more
people building with SLAB_MERGE_DEFAULT=n and/or CONFIG_RANDOM_KMALLOC_CACHES=y
(or booting with "slab_nomerge").

Just doing the type safety isn't sufficient without the cross-allocator
safety, but we've also had solutions for that proposed[4].

-Kees

[0] https://github.com/KSPP/linux/issues/189
[1] https://googleprojectzero.blogspot.com/2021/10/how-simple-linux-kernel-memory.html
[2] https://www.willsroot.io/2021/08/corctf-2021-fire-of-salvation-writeup.html
    https://google.github.io/security-research/pocs/linux/cve-2021-22555/writeup.html#exploring-struct-msg_msg
[3] https://grsecurity.net/how_autoslab_changes_the_memory_unsafety_game
[4] https://lore.kernel.org/linux-hardening/20230915105933.495735-1-matteorizzo@google.com/

-- 
Kees Cook

