Return-Path: <linux-modules+bounces-492-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACE08522E9
	for <lists+linux-modules@lfdr.de>; Tue, 13 Feb 2024 01:09:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C93E1C22E7F
	for <lists+linux-modules@lfdr.de>; Tue, 13 Feb 2024 00:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D415CAC;
	Tue, 13 Feb 2024 00:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Dqem6BUr"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1194696
	for <linux-modules@vger.kernel.org>; Tue, 13 Feb 2024 00:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707782980; cv=none; b=Fu994gWUxJX+tod2nnIym81Oxqq+nr5weUCtroP/ois2qT3ED3sD03Mk0078tMoft/XhpsD2poG07ECZAhNDNlZdS2siT+fpJagJCezsIsPpOUCqT5SMEq45i61EFpKYgGNVi7BPyFhDqi73qKIq9FyB6dqCtz8Pv8YXlTP8cEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707782980; c=relaxed/simple;
	bh=XuwWJ5Dw+8x+0dOrRRNuv+dH3uOAg+IXu71lodinJZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N5xuV6iZhJHak6Id73UfYr84GOXOvCLhbaVsChw2SGkGL3XjZeyIzObezAD5A9Xz8Q25FgUDqiXz31yycxVxxhYPLvQXyuWn/Joriy+cOSip0eFfqKVwzsEgj08CVoPpGDvOsuqAl+4d8S+ggTqnbxvHiXWj+c2aNHWnSW/7Atg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Dqem6BUr; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dcc84ae94c1so93822276.1
        for <linux-modules@vger.kernel.org>; Mon, 12 Feb 2024 16:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707782976; x=1708387776; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLK7xEb3jxgpuysPUzwq60xsYYfX0bEwBasjsp6nC7A=;
        b=Dqem6BUrpUFhDF+tudKwN9UlsKgkco3lToizzpx8jxBLDRjnA55NCEnitkMSxPbskb
         nPfP5QPSCbA4aajaOVf+p47nTdmNttlquCMyop+WTSCJPsIvJEv+mETX2DQ8rJXaSMSL
         2b7MyIpJjaPBx+3z5aiS4RtwjlR4JVvH1XRLYyBtl4mvpsme/S6H9dSw4PsopMVaJwRS
         0sfv6TDLvalqOM1QpihoXEB+QIYnNK3vpIOWcGvDDnxSdVJLBY8gm6FCO4xsoNrQltoy
         1cGB1NgOLXyHdKn+11hsJB2hq+ddhFMDcy3fYzcufKFnKqHkTRAFmSKyZufHX8sQe1Sg
         5dSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707782976; x=1708387776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gLK7xEb3jxgpuysPUzwq60xsYYfX0bEwBasjsp6nC7A=;
        b=c7+Ehbt4XU1haVZhq1UhaTxSiS+70hl6fYNLmV+MjCnsRyCS+vWbCuHCSkoZTshSTH
         zSukHmnl3UlIe17vSrZhGLMZ9w4EeFYXBCsRf0G23w6UTdPjWtYi4Z6MhrIjVBOQSujE
         J1etrEN0/gG2lP8b2OFKkWx0Fcgi5565vl5WFZf8s9UTSgeHGoUXs9dP5YvZsgmq2RFC
         P1grT5jQ91q1q8b52OhhrT/qDsKUf3ZV6ZIh9oXk5jFsXBLbCtD+BqN+vtLdO14hMQSf
         bzvWknBScbQ9qAiFumX9SSPa9UvvsM/q/eUXHhBoJUYOgdmGx7aDbXwTdnElhP4EcDyQ
         Htjg==
X-Forwarded-Encrypted: i=1; AJvYcCWqn/SBbVcd2GMsrzmXNZpok5i8V48JK9bb/LAnhT1rjjZtxcefjz4k+WEzpxclyshfWibXdi+XsVMn/HKDtHBasgiuoR6cozfvTwarfw==
X-Gm-Message-State: AOJu0YwRebxc7DxHhuviuLwhNxAJOgzTfU3JNwR5g8oeGLxLCxfQos9T
	Jby2CnZfFBV5apHPnXbB4HFnz77cedqLeC6TcscSrRmBpwMBBp9hPAJcW+Z6uRKPR1e0P/Q0fgw
	xP6Mz8mYiOWtOcoyaLHG703lV2rKHS4gmR1AW
X-Google-Smtp-Source: AGHT+IFcIoxxZ/at1Ut37e+obqddPjXFDoTfSw2W9xlVFGkbEDUuUmXcmdD9+Fz3EgwVz//7/lLpGbCXr+gCQA4ZbLI=
X-Received: by 2002:a25:8241:0:b0:dcc:623d:e475 with SMTP id
 d1-20020a258241000000b00dcc623de475mr508725ybn.30.1707782975978; Mon, 12 Feb
 2024 16:09:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240212213922.783301-1-surenb@google.com> <20240212213922.783301-35-surenb@google.com>
 <202402121448.AF0AA8E@keescook>
In-Reply-To: <202402121448.AF0AA8E@keescook>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 12 Feb 2024 16:09:21 -0800
Message-ID: <CAJuCfpEUQ+KctApss1upC4pWLvnU2bWVopbL5EsBzhsF0JzrPA@mail.gmail.com>
Subject: Re: [PATCH v3 34/35] codetag: debug: introduce OBJEXTS_ALLOC_FAIL to
 mark failed slab_ext allocations
To: Kees Cook <keescook@chromium.org>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	corbet@lwn.net, void@manifault.com, peterz@infradead.org, 
	juri.lelli@redhat.com, catalin.marinas@arm.com, will@kernel.org, 
	arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org, muchun.song@linux.dev, 
	rppt@kernel.org, paulmck@kernel.org, pasha.tatashin@soleen.com, 
	yosryahmed@google.com, yuzhao@google.com, dhowells@redhat.com, 
	hughd@google.com, andreyknvl@gmail.com, ndesaulniers@google.com, 
	vvvvvv@google.com, gregkh@linuxfoundation.org, ebiggers@google.com, 
	ytcoode@gmail.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, bristot@redhat.com, 
	vschneid@redhat.com, cl@linux.com, penberg@kernel.org, iamjoonsoo.kim@lge.com, 
	42.hyeyoo@gmail.com, glider@google.com, elver@google.com, dvyukov@google.com, 
	shakeelb@google.com, songmuchun@bytedance.com, jbaron@akamai.com, 
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com, 
	kernel-team@android.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 2:49=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
rote:
>
> On Mon, Feb 12, 2024 at 01:39:20PM -0800, Suren Baghdasaryan wrote:
> > If slabobj_ext vector allocation for a slab object fails and later on i=
t
> > succeeds for another object in the same slab, the slabobj_ext for the
> > original object will be NULL and will be flagged in case when
> > CONFIG_MEM_ALLOC_PROFILING_DEBUG is enabled.
> > Mark failed slabobj_ext vector allocations using a new objext_flags fla=
g
> > stored in the lower bits of slab->obj_exts. When new allocation succeed=
s
> > it marks all tag references in the same slabobj_ext vector as empty to
> > avoid warnings implemented by CONFIG_MEM_ALLOC_PROFILING_DEBUG checks.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  include/linux/memcontrol.h |  4 +++-
> >  mm/slab.h                  | 25 +++++++++++++++++++++++++
> >  mm/slab_common.c           | 22 +++++++++++++++-------
> >  3 files changed, 43 insertions(+), 8 deletions(-)
> >
> > diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> > index 2b010316016c..f95241ca9052 100644
> > --- a/include/linux/memcontrol.h
> > +++ b/include/linux/memcontrol.h
> > @@ -365,8 +365,10 @@ enum page_memcg_data_flags {
> >  #endif /* CONFIG_MEMCG */
> >
> >  enum objext_flags {
> > +     /* slabobj_ext vector failed to allocate */
> > +     OBJEXTS_ALLOC_FAIL =3D __FIRST_OBJEXT_FLAG,
> >       /* the next bit after the last actual flag */
> > -     __NR_OBJEXTS_FLAGS  =3D __FIRST_OBJEXT_FLAG,
> > +     __NR_OBJEXTS_FLAGS  =3D (__FIRST_OBJEXT_FLAG << 1),
> >  };
> >
> >  #define OBJEXTS_FLAGS_MASK (__NR_OBJEXTS_FLAGS - 1)
> > diff --git a/mm/slab.h b/mm/slab.h
> > index cf332a839bf4..7bb3900f83ef 100644
> > --- a/mm/slab.h
> > +++ b/mm/slab.h
> > @@ -586,9 +586,34 @@ static inline void mark_objexts_empty(struct slabo=
bj_ext *obj_exts)
> >       }
> >  }
> >
> > +static inline void mark_failed_objexts_alloc(struct slab *slab)
> > +{
> > +     slab->obj_exts =3D OBJEXTS_ALLOC_FAIL;
>
> Uh, does this mean slab->obj_exts is suddenly non-NULL? Is everything
> that accesses obj_exts expecting this?

Hi Kees,
Thank you for the reviews!
Yes, I believe everything that accesses slab->obj_exts directly
(currently alloc_slab_obj_exts() and free_slab_obj_exts()) handle this
special non-NULL case. kfence_init_pool() initialized slab->obj_exts
directly, but since it's setting it and not accessing it, it does not
need to handle OBJEXTS_ALLOC_FAIL. All other slab->obj_exts users use
slab_obj_exts() which applies OBJEXTS_FLAGS_MASK and masks out any
special bits.
Thanks,
Suren.

>
> -Kees
>
> > +}
> > +
> > +static inline void handle_failed_objexts_alloc(unsigned long obj_exts,
> > +                     struct slabobj_ext *vec, unsigned int objects)
> > +{
> > +     /*
> > +      * If vector previously failed to allocate then we have live
> > +      * objects with no tag reference. Mark all references in this
> > +      * vector as empty to avoid warnings later on.
> > +      */
> > +     if (obj_exts & OBJEXTS_ALLOC_FAIL) {
> > +             unsigned int i;
> > +
> > +             for (i =3D 0; i < objects; i++)
> > +                     set_codetag_empty(&vec[i].ref);
> > +     }
> > +}
> > +
> > +
> >  #else /* CONFIG_MEM_ALLOC_PROFILING_DEBUG */
> >
> >  static inline void mark_objexts_empty(struct slabobj_ext *obj_exts) {}
> > +static inline void mark_failed_objexts_alloc(struct slab *slab) {}
> > +static inline void handle_failed_objexts_alloc(unsigned long obj_exts,
> > +                     struct slabobj_ext *vec, unsigned int objects) {}
> >
> >  #endif /* CONFIG_MEM_ALLOC_PROFILING_DEBUG */
> >
> > diff --git a/mm/slab_common.c b/mm/slab_common.c
> > index d5f75d04ced2..489c7a8ba8f1 100644
> > --- a/mm/slab_common.c
> > +++ b/mm/slab_common.c
> > @@ -214,29 +214,37 @@ int alloc_slab_obj_exts(struct slab *slab, struct=
 kmem_cache *s,
> >                       gfp_t gfp, bool new_slab)
> >  {
> >       unsigned int objects =3D objs_per_slab(s, slab);
> > -     unsigned long obj_exts;
> > -     void *vec;
> > +     unsigned long new_exts;
> > +     unsigned long old_exts;
> > +     struct slabobj_ext *vec;
> >
> >       gfp &=3D ~OBJCGS_CLEAR_MASK;
> >       /* Prevent recursive extension vector allocation */
> >       gfp |=3D __GFP_NO_OBJ_EXT;
> >       vec =3D kcalloc_node(objects, sizeof(struct slabobj_ext), gfp,
> >                          slab_nid(slab));
> > -     if (!vec)
> > +     if (!vec) {
> > +             /* Mark vectors which failed to allocate */
> > +             if (new_slab)
> > +                     mark_failed_objexts_alloc(slab);
> > +
> >               return -ENOMEM;
> > +     }
> >
> > -     obj_exts =3D (unsigned long)vec;
> > +     new_exts =3D (unsigned long)vec;
> >  #ifdef CONFIG_MEMCG
> > -     obj_exts |=3D MEMCG_DATA_OBJEXTS;
> > +     new_exts |=3D MEMCG_DATA_OBJEXTS;
> >  #endif
> > +     old_exts =3D slab->obj_exts;
> > +     handle_failed_objexts_alloc(old_exts, vec, objects);
> >       if (new_slab) {
> >               /*
> >                * If the slab is brand new and nobody can yet access its
> >                * obj_exts, no synchronization is required and obj_exts =
can
> >                * be simply assigned.
> >                */
> > -             slab->obj_exts =3D obj_exts;
> > -     } else if (cmpxchg(&slab->obj_exts, 0, obj_exts)) {
> > +             slab->obj_exts =3D new_exts;
> > +     } else if (cmpxchg(&slab->obj_exts, old_exts, new_exts) !=3D old_=
exts) {
> >               /*
> >                * If the slab is already in use, somebody can allocate a=
nd
> >                * assign slabobj_exts in parallel. In this case the exis=
ting
> > --
> > 2.43.0.687.g38aa6559b0-goog
> >
>
> --
> Kees Cook

