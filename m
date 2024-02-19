Return-Path: <linux-modules+bounces-648-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4511859A52
	for <lists+linux-modules@lfdr.de>; Mon, 19 Feb 2024 02:05:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BBA91F21255
	for <lists+linux-modules@lfdr.de>; Mon, 19 Feb 2024 01:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3216F1FDB;
	Mon, 19 Feb 2024 01:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fz+QvxkG"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B39653
	for <linux-modules@vger.kernel.org>; Mon, 19 Feb 2024 01:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708304712; cv=none; b=sLYJp9wDfyAaXl1+axbEpklcTuJZdKzoxXYvruAVhiNlX+iHSFa+efKrQPn1EyFN2jxp+t/reMPpwV5fcYBuPK/UpN1zwaMW3hYYXNwL++VLM6F7l2q4Z6FybtvyCBxtrTnu7bQfmk/bLoEaAlKhaKyxlo6x1SE8OqHPiwJpEtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708304712; c=relaxed/simple;
	bh=RN/oOnbxOXJRjgABecn+1xhjdfXant7wAu1DO9OYV0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IvzThXYuoZnprnjNw3C/gRcQIJVy6/mA+xTCM4Y1znhDCcKV7PxfFBMYaJ2MEMpCxZFXOrJfD5pJovWHtADSVrgR6/GYKLvkXQDenXxeFNssDjckkVocEMaJZTnLONMdmHL9yfr9oFWydSCDa5bL3EzCTEK7cd+wnJXzWaWOZrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fz+QvxkG; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dc6dcd9124bso3563795276.1
        for <linux-modules@vger.kernel.org>; Sun, 18 Feb 2024 17:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708304708; x=1708909508; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mIDaOHUmOnFQVc3Wwg+6+LPaeJ2ta81+Eqz5TMzPBys=;
        b=fz+QvxkGr229b6bOrKWi9XavB8I5cjL/HDA9sjZn+pP0oqOmBxKuzRnbZm2bmE6Nue
         0X98b9HQ0mJuVpQCJ8NsQDg7bMdv4O6KJJIzE6uqTskf5hlTpRx6+OMe0ARgOY0bFZZP
         2QfpxR5ErVjv499/jVaEHj6IeV8mVNVWmXWCC4NkPE8oA+lEidFad5YsZfvgtKh3Orr/
         hP0JbfDr5YYpgdcjnvL68K/qXF24lAuS2EDLWGYZeMwuDeXvtJBb4N5JExgrI8l5DAHr
         B6lYOoDQJXe0Lhw9wpOcJKkd84rfPiGTDy54w80WJjCEq8y9G66FW8jcJBmU1Nibcmw/
         qh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708304708; x=1708909508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mIDaOHUmOnFQVc3Wwg+6+LPaeJ2ta81+Eqz5TMzPBys=;
        b=p5OmdNHF+ZbS80MKRxCztSZhiLkFbyOHr8jKUoHFlwoGJReobXMUfEfT89ONj3iINE
         JNkCk534D/xkHqVDv56D7q1/0aG3WUK7UdLPmBdhaR8drjSzLLRzlvMtJ3zNYJLWGGdk
         rxmBnY6eapmj9h1CETHJF0edZU8hzp0qcVYuSnFc13NHd/Lhqe0xOOjTW2wGJdPyJ1U4
         uTkcl34blkMuLadNFTxs7okyIBYovoPY98iFbaSCh8vU+moqZkWUnR6aW3Fr9UO0xgFb
         CQQFLCTUsgSZH109lE0YTX+H1O0RowN5bdFFD2rTT7xYya5VaFQaYdjGxieg2XSgyjI1
         bk2A==
X-Forwarded-Encrypted: i=1; AJvYcCVtgCmDa9h8nwj2pbhMFadeHtEXU3Fi72msJKlaYhPoBgHd3OERsYcARpKnv1d5Q+frk+f32XWPo0MCn+0hayQEWjUzuYKe4qj8BpCfhw==
X-Gm-Message-State: AOJu0YxydQZDvknH4bIo8sF4QKFGOiYn7tJO5FQ9mKYOcHh23ruSRi/Y
	76dSKB4Xg/aRRJljGbuwRuyhA775/pBlGReIXP4Hp1GJ7ItFGzhUu13WoZu91qJXTUAY4YXfaep
	uNXyhvJphOB6kZKMmC0+0uAyR9ihdBf+v4WrO
X-Google-Smtp-Source: AGHT+IFAFF6IWWYhF0S9T//EmmWIuYGcDfDoGsA7me1Exr/qYPq0aAoDdEWC37Tru9GNL3XObftohrbEHommrFTiK+w=
X-Received: by 2002:a5b:b43:0:b0:dcc:eb38:199c with SMTP id
 b3-20020a5b0b43000000b00dcceb38199cmr10258615ybr.56.1708304707680; Sun, 18
 Feb 2024 17:05:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240212213922.783301-1-surenb@google.com> <20240212213922.783301-33-surenb@google.com>
 <f0a56027-472d-44a6-aba5-912bd50ee3ae@suse.cz>
In-Reply-To: <f0a56027-472d-44a6-aba5-912bd50ee3ae@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 19 Feb 2024 01:04:54 +0000
Message-ID: <CAJuCfpGUTu7uhcR-23=0d3Wnn8ZbDtNwTaFnukd9qYYVHS9aSA@mail.gmail.com>
Subject: Re: [PATCH v3 32/35] codetag: debug: skip objext checking when it's
 for objext itself
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

On Fri, Feb 16, 2024 at 6:39=E2=80=AFPM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> On 2/12/24 22:39, Suren Baghdasaryan wrote:
> > objext objects are created with __GFP_NO_OBJ_EXT flag and therefore hav=
e
> > no corresponding objext themselves (otherwise we would get an infinite
> > recursion). When freeing these objects their codetag will be empty and
> > when CONFIG_MEM_ALLOC_PROFILING_DEBUG is enabled this will lead to fals=
e
> > warnings. Introduce CODETAG_EMPTY special codetag value to mark
> > allocations which intentionally lack codetag to avoid these warnings.
> > Set objext codetags to CODETAG_EMPTY before freeing to indicate that
> > the codetag is expected to be empty.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  include/linux/alloc_tag.h | 26 ++++++++++++++++++++++++++
> >  mm/slab.h                 | 25 +++++++++++++++++++++++++
> >  mm/slab_common.c          |  1 +
> >  mm/slub.c                 |  8 ++++++++
> >  4 files changed, 60 insertions(+)
> >
> > diff --git a/include/linux/alloc_tag.h b/include/linux/alloc_tag.h
> > index 0a5973c4ad77..1f3207097b03 100644
>
> ...
>
> > index c4bd0d5348cb..cf332a839bf4 100644
> > --- a/mm/slab.h
> > +++ b/mm/slab.h
> > @@ -567,6 +567,31 @@ static inline struct slabobj_ext *slab_obj_exts(st=
ruct slab *slab)
> >  int alloc_slab_obj_exts(struct slab *slab, struct kmem_cache *s,
> >                       gfp_t gfp, bool new_slab);
> >
> > +
> > +#ifdef CONFIG_MEM_ALLOC_PROFILING_DEBUG
> > +
> > +static inline void mark_objexts_empty(struct slabobj_ext *obj_exts)
> > +{
> > +     struct slabobj_ext *slab_exts;
> > +     struct slab *obj_exts_slab;
> > +
> > +     obj_exts_slab =3D virt_to_slab(obj_exts);
> > +     slab_exts =3D slab_obj_exts(obj_exts_slab);
> > +     if (slab_exts) {
> > +             unsigned int offs =3D obj_to_index(obj_exts_slab->slab_ca=
che,
> > +                                              obj_exts_slab, obj_exts)=
;
> > +             /* codetag should be NULL */
> > +             WARN_ON(slab_exts[offs].ref.ct);
> > +             set_codetag_empty(&slab_exts[offs].ref);
> > +     }
> > +}
> > +
> > +#else /* CONFIG_MEM_ALLOC_PROFILING_DEBUG */
> > +
> > +static inline void mark_objexts_empty(struct slabobj_ext *obj_exts) {}
> > +
> > +#endif /* CONFIG_MEM_ALLOC_PROFILING_DEBUG */
> > +
>
> I assume with alloc_slab_obj_exts() moved to slub.c, mark_objexts_empty()
> could move there too.

No, I think mark_objexts_empty() belongs here. This patch introduced
the function and uses it. Makes sense to me to keep it all together.

>
> >  static inline bool need_slab_obj_ext(void)
> >  {
> >  #ifdef CONFIG_MEM_ALLOC_PROFILING
> > diff --git a/mm/slab_common.c b/mm/slab_common.c
> > index 21b0b9e9cd9e..d5f75d04ced2 100644
> > --- a/mm/slab_common.c
> > +++ b/mm/slab_common.c
> > @@ -242,6 +242,7 @@ int alloc_slab_obj_exts(struct slab *slab, struct k=
mem_cache *s,
> >                * assign slabobj_exts in parallel. In this case the exis=
ting
> >                * objcg vector should be reused.
> >                */
> > +             mark_objexts_empty(vec);
> >               kfree(vec);
> >               return 0;
> >       }
> > diff --git a/mm/slub.c b/mm/slub.c
> > index 4d480784942e..1136ff18b4fe 100644
> > --- a/mm/slub.c
> > +++ b/mm/slub.c
> > @@ -1890,6 +1890,14 @@ static inline void free_slab_obj_exts(struct sla=
b *slab)
> >       if (!obj_exts)
> >               return;
> >
> > +     /*
> > +      * obj_exts was created with __GFP_NO_OBJ_EXT flag, therefore its
> > +      * corresponding extension will be NULL. alloc_tag_sub() will thr=
ow a
> > +      * warning if slab has extensions but the extension of an object =
is
> > +      * NULL, therefore replace NULL with CODETAG_EMPTY to indicate th=
at
> > +      * the extension for obj_exts is expected to be NULL.
> > +      */
> > +     mark_objexts_empty(obj_exts);
> >       kfree(obj_exts);
> >       slab->obj_exts =3D 0;
> >  }
>

