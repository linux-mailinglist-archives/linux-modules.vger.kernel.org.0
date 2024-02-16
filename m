Return-Path: <linux-modules+bounces-630-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9E2858364
	for <lists+linux-modules@lfdr.de>; Fri, 16 Feb 2024 18:04:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A2D01F23842
	for <lists+linux-modules@lfdr.de>; Fri, 16 Feb 2024 17:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2C6B130E32;
	Fri, 16 Feb 2024 17:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qdH7rwIE"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB2C130E2E
	for <linux-modules@vger.kernel.org>; Fri, 16 Feb 2024 17:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708103063; cv=none; b=RFiOWkTdxA2yjf7YN+zhTxWFmpBsKHw8C+Cs8fnY9V/7b8LLNf+Yfyk3mlLh7ojceaEgNR2yNIZ5fQhZbZMrfUdpc7uheA3+bBljbC4wTYWViKLlekPKe2M+Z3aRdgOPW/nKkk7LVeTiA+8ssIFbSgTf8B9nqxidqXWEfBnlPrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708103063; c=relaxed/simple;
	bh=3a7FMORiulYeKmE84zKi/piBb+dkvwU96kx/uVbaQFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vo71jfa0M04voWckAlHdO4M7xHXDTsmLArewspkawvKYSZFDfSFQ/RVLPDIQU2bK3D0l3OKyvE1+P+10wRZQ35xvsWjXr1vEo+tqRRi4EZnDejwJIA7Xb98GUKpsc5jI53oZqgfZKYoBJd7mQglaSfKxmxhBBukYynyTL8E0B1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qdH7rwIE; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dcc7cdb3a98so2344698276.2
        for <linux-modules@vger.kernel.org>; Fri, 16 Feb 2024 09:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708103060; x=1708707860; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AONf6Rwt70Y/InxvAsZm9qasH+QAXmnPb6exgsQbAn0=;
        b=qdH7rwIEutJjohj3+iLQ+MrYMO2JOxTZXt6DXmZHUv4X0WOsHTSDV2pY0udsMdTxtd
         fofwGxmK4la2Ejmxb14rS2/69OpBaCCYH3oE6YLgqnyflnOj7KwxVInQOUlWoyZNCw6F
         UtxWHzIoJjDI5gsC5hm7OT61vrKzYu3SvSEcYgPVQOj1ixFQKtyoHh69I2vb7X89nQPC
         fy49PYaHmgz/BIyi9V2/HaaQPH+gvUWs8wvQODnJ/1Ggx9UG5p0dWyX3Qoj13/abE4KN
         XZCU5DSADi8rvmwmeeZiyGwGVKBtS5q7JvcvcDqanvdlGVWhPMEzpmPo8p0b43EMG9E+
         v37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708103060; x=1708707860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AONf6Rwt70Y/InxvAsZm9qasH+QAXmnPb6exgsQbAn0=;
        b=feDZGnCtrJ/XjVHlqFvgpWxQEzdySFR7UpNZ8xV1Znoz1CnZ1q5NWvk5XtsjE51+uB
         PDDnx6nxoZltEVxW+CKCJMpU5qCBiWfyED/zOnWB5ubt2crBRsFq9ptbtdD2e41IBf9c
         AY1iyVnwx9MLeSZL7GClgQPImEQUGSXe8baZoDCFuVn5PjXTiHOPCaN4kmM9yJCJ3WOY
         xxsx5NJLqVZslSKVUBz5j60pnxv5PNiZmVTHweZVAzLWUyceCnydPcCIH0mwDElfTqqe
         ChVTUKb66As+RokSeGddJndYT93LZEyuNUp4oieTGLES4+fHY9wFb/SeVasvczzqjGz/
         qycA==
X-Forwarded-Encrypted: i=1; AJvYcCUHHViRnUrUqBjx4FDyZ85mnBy2AhRfloEZbhgtJ8VllTCN4elb2pjA6ydfpHpVGKQAkq53UZtIKYgrwNL1o8tPNpc0tTB6NLQNA9w68Q==
X-Gm-Message-State: AOJu0YxWSeJsX6eMKtYRqpaihlSmJcHY8/Dm7ZR/fJr8BtH/D5moWsAb
	s3HJLgoq8zgmC9O6WU0rpZtLmuGE29BYP3ej584iGspF2hcEJPhEp6C+NdLWo0AjTU+2AkyiHUC
	CT9NUUHR8yP2hTa7RDVsKwc7BRHRpcnuLRN9F
X-Google-Smtp-Source: AGHT+IFKsCqKFJOqQT8bKrODn1/sGXg8SwbGnvmT7NLpaIG7hZMAXzI7k8uueS2KJuQc/CnCvGizvtw3FBEC6oUeP1g=
X-Received: by 2002:a81:71d6:0:b0:604:a75:4274 with SMTP id
 m205-20020a8171d6000000b006040a754274mr4969437ywc.51.1708103060160; Fri, 16
 Feb 2024 09:04:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240212213922.783301-1-surenb@google.com> <20240212213922.783301-21-surenb@google.com>
 <e845a3ee-e6c0-47dd-81e9-ae0fb08886d1@suse.cz>
In-Reply-To: <e845a3ee-e6c0-47dd-81e9-ae0fb08886d1@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 16 Feb 2024 09:04:06 -0800
Message-ID: <CAJuCfpGrVM6DieUZPAoxNNx2zfR9cWeC1-7NboatGEQ4qPbckw@mail.gmail.com>
Subject: Re: [PATCH v3 20/35] lib: add codetag reference into slabobj_ext
To: Vlastimil Babka <vbabka@suse.cz>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, mhocko@suse.com, 
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
	minchan@google.com, kaleshsingh@google.com, kernel-team@android.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arch@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 16, 2024 at 7:36=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> On 2/12/24 22:39, Suren Baghdasaryan wrote:
> > To store code tag for every slab object, a codetag reference is embedde=
d
> > into slabobj_ext when CONFIG_MEM_ALLOC_PROFILING=3Dy.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > Co-developed-by: Kent Overstreet <kent.overstreet@linux.dev>
> > Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
> > ---
> >  include/linux/memcontrol.h | 5 +++++
> >  lib/Kconfig.debug          | 1 +
> >  mm/slab.h                  | 4 ++++
> >  3 files changed, 10 insertions(+)
> >
> > diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> > index f3584e98b640..2b010316016c 100644
> > --- a/include/linux/memcontrol.h
> > +++ b/include/linux/memcontrol.h
> > @@ -1653,7 +1653,12 @@ unsigned long mem_cgroup_soft_limit_reclaim(pg_d=
ata_t *pgdat, int order,
> >   * if MEMCG_DATA_OBJEXTS is set.
> >   */
> >  struct slabobj_ext {
> > +#ifdef CONFIG_MEMCG_KMEM
> >       struct obj_cgroup *objcg;
> > +#endif
> > +#ifdef CONFIG_MEM_ALLOC_PROFILING
> > +     union codetag_ref ref;
> > +#endif
> >  } __aligned(8);
>
> So this means that compiling with CONFIG_MEM_ALLOC_PROFILING will increas=
e
> the memory overhead of arrays allocated for CONFIG_MEMCG_KMEM, even if
> allocation profiling itself is not enabled in runtime? Similar concern to
> the unconditional page_ext usage, that this would hinder enabling in a
> general distro kernel.
>
> The unused field overhead would be smaller than currently page_ext, but
> getting rid of it when alloc profiling is not enabled would be more work
> than introducing an early boot param for the page_ext case. Could be howe=
ver
> solved similarly to how page_ext is populated dynamically at runtime.
> Hopefully it wouldn't add noticeable cpu overhead.

Yes, slabobj_ext overhead is much smaller than page_ext one but still
considerable and it would be harder to eliminate. Boot-time resizing
of the extension object might be doable but that again would be quite
complex and better be done as a separate patchset. This is lower on my
TODO list than page_ext ones since the overhead is order of magnitude
smaller.

>
> >  static inline void __inc_lruvec_kmem_state(void *p, enum node_stat_ite=
m idx)
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index 7bbdb0ddb011..9ecfcdb54417 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -979,6 +979,7 @@ config MEM_ALLOC_PROFILING
> >       depends on !DEBUG_FORCE_WEAK_PER_CPU
> >       select CODE_TAGGING
> >       select PAGE_EXTENSION
> > +     select SLAB_OBJ_EXT
> >       help
> >         Track allocation source code and record total allocation size
> >         initiated at that code location. The mechanism can be used to t=
rack
> > diff --git a/mm/slab.h b/mm/slab.h
> > index 77cf7474fe46..224a4b2305fb 100644
> > --- a/mm/slab.h
> > +++ b/mm/slab.h
> > @@ -569,6 +569,10 @@ int alloc_slab_obj_exts(struct slab *slab, struct =
kmem_cache *s,
> >
> >  static inline bool need_slab_obj_ext(void)
> >  {
> > +#ifdef CONFIG_MEM_ALLOC_PROFILING
> > +     if (mem_alloc_profiling_enabled())
> > +             return true;
> > +#endif
> >       /*
> >        * CONFIG_MEMCG_KMEM creates vector of obj_cgroup objects conditi=
onally
> >        * inside memcg_slab_post_alloc_hook. No other users for now.
>

