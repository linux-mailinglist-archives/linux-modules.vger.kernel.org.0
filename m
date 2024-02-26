Return-Path: <linux-modules+bounces-740-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE3B867E39
	for <lists+linux-modules@lfdr.de>; Mon, 26 Feb 2024 18:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E2D21F24754
	for <lists+linux-modules@lfdr.de>; Mon, 26 Feb 2024 17:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 562B112F387;
	Mon, 26 Feb 2024 17:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UtEdZPQI"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1312412D77D
	for <linux-modules@vger.kernel.org>; Mon, 26 Feb 2024 17:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708968165; cv=none; b=b1FZg8haT4EzhzkiSIwBf/V/qzMXwA4NGAKxkdZwkBJE74I6giLTmlLur+aXwzR+4dEOzCz993J4VFkR31/M5MZ7Yktt6NuQzmPCGoHMw7wb9cyhBq8EMIB9sw/X5vW/LUlMmaAs6NS/hXEkuuwDX/VC+C0RQizYecRTU+bIiXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708968165; c=relaxed/simple;
	bh=EqmeweN9yJbHN4ZOPQ4NNULOO0mEliqSsTTtiukx5Xg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ou4DHqkRvNDR2UW7DWcqJao+SCrKTeiGZ8xRT5qCOlDn9UORJlKP3uYmxgT4RVw9EO5Dgf/4tpxHGplga6Yh8fyaZx9Q929tAwP9gFLBs1nYhExuSYM4W1S4qzTLKK4pY/OTNDoDG2Na9H6k0qgD6O2ooN8bAapD0amLGitg/48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UtEdZPQI; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d180d6bd32so48837311fa.1
        for <linux-modules@vger.kernel.org>; Mon, 26 Feb 2024 09:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708968161; x=1709572961; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dv1MR8FFyIVeo2kD5/jRtw1zZdBqiDH8uTYdJ7duKRA=;
        b=UtEdZPQIZQ3QnohdxOrVw8t21VecFDMJ22AYc8M3h/OLTcWQGmofC5i2wHNfp5etvd
         IxycCl+BPuxdiJPETX3fYYBIVegZY/vN+xUCEaifNbAmwLrnCi97dSL+u/624e0iVsDD
         TkEcuEPlhDJPrEhQW3tw6AxiK0wnEC7A0OhZEP3hOXEWT/UH3N5czcorAcpJUMueHs7I
         XmuqjWvOUm+mpWtOeHegPpxOGo7lxpf9TXhZWzP+WZUnQHy4D9MSMTnWOpNgnZjhkvHe
         S5lswx19Inj0FaKiPePkX0oICzcdVKrWe/4KjFm0v49JRYDrlDdD2Gk21rsxbVbmQEf/
         3tew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708968161; x=1709572961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dv1MR8FFyIVeo2kD5/jRtw1zZdBqiDH8uTYdJ7duKRA=;
        b=PHS0ll+rUk6v0VT7AzsXK3TBU+WLUtYc8ELfrH0wrN0CvrobIVeNOaV8Pr/5Bd0ohc
         3XVVODfHpbsc92MdgHAlVWCXt3WCi+aVEPPMbqtkmXdfNNM/z6DZDH+ZwEmcpMuPwPgE
         33qNR/FszZSNdHM/qSV6+6pGZL/2VO8mKtUtUA0TGDP8SaJYxxwcZ+oWTQQlzYmxlHPV
         YUykplGIhQYNMnBFhfUVjDexCS/Sw/sdja2bZMxG4yfODy1hgYGBxf0ml7Nxw1xaD97O
         F4AX5SlCPA60fUTQ0WRfg87+RQtTvEC2wm1NgOm5zEHQSaMoL64msQYR2S0U4QFnNVfJ
         ghow==
X-Forwarded-Encrypted: i=1; AJvYcCXdcvOYiodqgVwpNYxwRkaBVrM25mF7UQZCyeDmvBhoO132atH0cone3d0vD04tAOV1MdOrsEYVD/pyiLfQ12MQG9n8avRFA3Os7gddwg==
X-Gm-Message-State: AOJu0Yw/UYt/CRDVrKO8W5gGrMc4RMwPdGd3UVVH+sz/t1WN6BkF35/3
	V5hJ0RgC/uxRsbCH46lAsILcrAGV6m0LqBPzV1TF1rNsZ3n6UWY2DbC0OIyL2mrQvMdOEikLZMu
	MSGuyvvFEFqAVp4aGgmALpLDTAX9j/YFNUkpX
X-Google-Smtp-Source: AGHT+IHRxxQsMQSRpnlCaAS8PflYsK1iTOiKydsmAuE0utC3AXspYUhCmo2l3tTpb+Dmf3/YMDJ4hjbxrgCTIuiY2OA=
X-Received: by 2002:a2e:990b:0:b0:2d2:7164:c6ba with SMTP id
 v11-20020a2e990b000000b002d27164c6bamr4367139lji.43.1708968160893; Mon, 26
 Feb 2024 09:22:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221194052.927623-1-surenb@google.com> <20240221194052.927623-8-surenb@google.com>
 <6851f8a0-e5d2-4b79-9cee-cff0fdec2970@suse.cz>
In-Reply-To: <6851f8a0-e5d2-4b79-9cee-cff0fdec2970@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 26 Feb 2024 17:22:21 +0000
Message-ID: <CAJuCfpHA-0PsQcNMcJVniVyUo4+nUYaioQSS7ZnXO_TGxgumqA@mail.gmail.com>
Subject: Re: [PATCH v4 07/36] mm: introduce slabobj_ext to support slab object extensions
To: Vlastimil Babka <vbabka@suse.cz>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, mhocko@suse.com, 
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
	minchan@google.com, kaleshsingh@google.com, kernel-team@android.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arch@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 8:26=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> On 2/21/24 20:40, Suren Baghdasaryan wrote:
> > Currently slab pages can store only vectors of obj_cgroup pointers in
> > page->memcg_data. Introduce slabobj_ext structure to allow more data
> > to be stored for each slab object. Wrap obj_cgroup into slabobj_ext
> > to support current functionality while allowing to extend slabobj_ext
> > in the future.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
>
> Hi, mostly good from slab perspective, just some fixups:
>
> > --- a/mm/slab.h
> > +++ b/mm/slab.h
> > -int memcg_alloc_slab_cgroups(struct slab *slab, struct kmem_cache *s,
> > -                              gfp_t gfp, bool new_slab);
> > -void mod_objcg_state(struct obj_cgroup *objcg, struct pglist_data *pgd=
at,
> > -                  enum node_stat_item idx, int nr);
> > -#else /* CONFIG_MEMCG_KMEM */
> > -static inline struct obj_cgroup **slab_objcgs(struct slab *slab)
> > +int alloc_slab_obj_exts(struct slab *slab, struct kmem_cache *s,
> > +                     gfp_t gfp, bool new_slab);
> >
>
> We could remove this declaration and make the function static in mm/slub.=
c.

Ack.

>
> > +#else /* CONFIG_SLAB_OBJ_EXT */
> > +
> > +static inline struct slabobj_ext *slab_obj_exts(struct slab *slab)
> >  {
> >       return NULL;
> >  }
> >
> > -static inline int memcg_alloc_slab_cgroups(struct slab *slab,
> > -                                            struct kmem_cache *s, gfp_=
t gfp,
> > -                                            bool new_slab)
> > +static inline int alloc_slab_obj_exts(struct slab *slab,
> > +                                   struct kmem_cache *s, gfp_t gfp,
> > +                                   bool new_slab)
> >  {
> >       return 0;
> >  }
>
> Ditto

Ack.

>
> > -#endif /* CONFIG_MEMCG_KMEM */
> > +
> > +static inline struct slabobj_ext *
> > +prepare_slab_obj_exts_hook(struct kmem_cache *s, gfp_t flags, void *p)
> > +{
> > +     return NULL;
> > +}
>
> Same here (and the definition and usage even happens in later patch).

Ack.

>
> > +#endif /* CONFIG_SLAB_OBJ_EXT */
> > +
> > +#ifdef CONFIG_MEMCG_KMEM
> > +void mod_objcg_state(struct obj_cgroup *objcg, struct pglist_data *pgd=
at,
> > +                  enum node_stat_item idx, int nr);
> > +#endif
> >
> >  size_t __ksize(const void *objp);
> >
> > diff --git a/mm/slub.c b/mm/slub.c
> > index d31b03a8d9d5..76fb600fbc80 100644
> > --- a/mm/slub.c
> > +++ b/mm/slub.c
> > @@ -683,10 +683,10 @@ static inline bool __slab_update_freelist(struct =
kmem_cache *s, struct slab *sla
> >
> >       if (s->flags & __CMPXCHG_DOUBLE) {
> >               ret =3D __update_freelist_fast(slab, freelist_old, counte=
rs_old,
> > -                                         freelist_new, counters_new);
> > +                                         freelist_new, counters_new);
> >       } else {
> >               ret =3D __update_freelist_slow(slab, freelist_old, counte=
rs_old,
> > -                                         freelist_new, counters_new);
> > +                                         freelist_new, counters_new);
> >       }
> >       if (likely(ret))
> >               return true;
> > @@ -710,13 +710,13 @@ static inline bool slab_update_freelist(struct km=
em_cache *s, struct slab *slab,
> >
> >       if (s->flags & __CMPXCHG_DOUBLE) {
> >               ret =3D __update_freelist_fast(slab, freelist_old, counte=
rs_old,
> > -                                         freelist_new, counters_new);
> > +                                         freelist_new, counters_new);
> >       } else {
> >               unsigned long flags;
> >
> >               local_irq_save(flags);
> >               ret =3D __update_freelist_slow(slab, freelist_old, counte=
rs_old,
> > -                                         freelist_new, counters_new);
> > +                                          freelist_new, counters_new);
>
> Please no drive-by fixups of whitespace in code you're not actually
> changing. I thought you agreed in v3?

Sorry, I must have misunderstood your previous comment. I thought you
were saying that the alignment I changed to was incorrect. I'll keep
them untouched.


>
> >  static inline bool memcg_slab_pre_alloc_hook(struct kmem_cache *s,
> >                                            struct list_lru *lru,
> >                                            struct obj_cgroup **objcgp,
> > @@ -2314,7 +2364,7 @@ static __always_inline void account_slab(struct s=
lab *slab, int order,
> >                                        struct kmem_cache *s, gfp_t gfp)
> >  {
> >       if (memcg_kmem_online() && (s->flags & SLAB_ACCOUNT))
> > -             memcg_alloc_slab_cgroups(slab, s, gfp, true);
> > +             alloc_slab_obj_exts(slab, s, gfp, true);
>
> This is still guarded by the memcg_kmem_online() static key, which is goo=
d.
>
> >
> >       mod_node_page_state(slab_pgdat(slab), cache_vmstat_idx(s),
> >                           PAGE_SIZE << order);
> > @@ -2323,8 +2373,7 @@ static __always_inline void account_slab(struct s=
lab *slab, int order,
> >  static __always_inline void unaccount_slab(struct slab *slab, int orde=
r,
> >                                          struct kmem_cache *s)
> >  {
> > -     if (memcg_kmem_online())
> > -             memcg_free_slab_cgroups(slab);
> > +     free_slab_obj_exts(slab);
>
> But this no longer is, yet it still could be?

Yes, I missed that, it seems. free_slab_obj_exts() would bail out but
still checking the static key is more efficient. I'll revive this
check.

Thanks for the review!
Suren.

>
> >
> >       mod_node_page_state(slab_pgdat(slab), cache_vmstat_idx(s),
> >                           -(PAGE_SIZE << order));
>

