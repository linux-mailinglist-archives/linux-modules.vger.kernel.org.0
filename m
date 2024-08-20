Return-Path: <linux-modules+bounces-1760-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FEB957F88
	for <lists+linux-modules@lfdr.de>; Tue, 20 Aug 2024 09:26:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A68C01C23D73
	for <lists+linux-modules@lfdr.de>; Tue, 20 Aug 2024 07:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ABCB18005B;
	Tue, 20 Aug 2024 07:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4WDek1bp"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8F2132124
	for <linux-modules@vger.kernel.org>; Tue, 20 Aug 2024 07:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724138802; cv=none; b=iTe0z6fmXP8daDbmot4p8hyz3dP1VXAruc7xZkBwPY2HXRYfb2SsKtsNmScKZUtu0//U+fDxL2+/t+gh2V0pwj2jsgtvPiUQBW7f2oWVL4CaDqwfazF/YMxJFFVr9vJKLHwAr76eERhjPubZiMkpWNmzfgSg3BmQug2IlfgERZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724138802; c=relaxed/simple;
	bh=oLKuSynS85DO7ibV0yy8WURwJPtLjlxiOsXpJhNgus4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nuDY+tfZ4Suy7VWc6TUvksmTxZZmWfaEqNGC3yU5PDd+NwfwRiJH20FtDe2/ytwOIbHZvnp44M/2qts21WyA5rOghJZ3tzG623Il3lQiDYabODftwCUoWdFOHinoQTotUmsCLCCXFhvJLS777/Z7Lyk6vy8WumL8fgxlVnqQG8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4WDek1bp; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6b3afc6cd01so24355767b3.1
        for <linux-modules@vger.kernel.org>; Tue, 20 Aug 2024 00:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724138799; x=1724743599; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LN564zYHb/q+BN0L0S3sLo0tgai+pv6UXeCiHGIBfXI=;
        b=4WDek1bpkYZz4wk7Ije/jkly+YAODxU/PEs2vo7FhiDuGmyHdNm6FN/UTaz4CKbiLz
         onG9HeoGhvceCp7E2mUtArDFMF2zgXFaCasY0HSxjMKTvBtTEMhyGCzmOGh7axH0+6u+
         zrLOMCUzMSuPUdsEv4zSYuAAe4+xeUn5FSu+Irx7HNQrIG4/Pjof1YJk5EIvCO1ACejt
         9Sv0cwtnYdd51tLiKNUyDl1f0JNQMq0bCTDWXHNo5Rlye1gWbyI6YowIjV64FqFGbty9
         nPzIhwhdCsbJP/tfLnaCw6+VpJZZ6E12xrE06PND4ehgIxiLGIwqP6RrFc6JC8MkHmOT
         SGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724138799; x=1724743599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LN564zYHb/q+BN0L0S3sLo0tgai+pv6UXeCiHGIBfXI=;
        b=P1AQX460VO4zhz02qzmTwyTGuFyrTJu2QC2q+6mQQR+E+28ifyFUzapLg5jXQaawy8
         bD0trnrNnQ6NEO8U2OwZwnyAx+HilzWdnshhrIRkB5t1HXprK/gB64KnPsdLDbk+Ak6g
         Rc9ILpli5ptPPNf+IER0DW5gGWhlwAhrrnKoUZhH02TvBvitkXNO4/SgOdvBnTqxBjuk
         S8uUyYByK41Z0z+kLYjC2PK94z6Pg4unrCGgrLRU81F/jHgZmZ3QUIt2nKvgRtZEi47r
         Vsv5UXe4/TD725S2ydio+puesym9rk0vTU2TRY/rghmFzZqknd4T/fSD3L3e/qj/eYcc
         KfYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMya9C9Uz88S1+yyNy+McO0Re2E5Yed97fkMBPJEn9ZgFC/mytqmULrjGlXUSVWNhixbt3NzTYyVIXlyn1OnEkbe2J2M782A6ZJmvdbQ==
X-Gm-Message-State: AOJu0YzaGhFr67II0kqWNNQ6kkvUvOlo2u27tth2OFwdcaBL9u2Ib57N
	LjwhcgRfY4TV1as9p2uU7tGmByFPiEonYm8LSEM1zdbpW6kRBn9NRt+9mefqT6MzO0u984DKsHn
	Dpejhk5MaYTefMPuq2rbH0LZ6myinQqYamaE9
X-Google-Smtp-Source: AGHT+IEu4NsnZWpz9MZCaZucuLVy0UjltYOjyQoU56+siXBz2tCiizAdvhgvEd1X1U+P3/g9CXL7Rc8N12MGbs0TTZg=
X-Received: by 2002:a05:690c:2c92:b0:64b:1eb2:3dd4 with SMTP id
 00721157ae682-6bdcf2e6c41mr15550867b3.8.1724138798431; Tue, 20 Aug 2024
 00:26:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819151512.2363698-1-surenb@google.com> <20240819151512.2363698-2-surenb@google.com>
 <ZsRCAy5cCp0Ig3I/@kernel.org>
In-Reply-To: <ZsRCAy5cCp0Ig3I/@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 20 Aug 2024 00:26:25 -0700
Message-ID: <CAJuCfpHVxpEC4xCW1QkEkMS3A2SU3yVcm8sX_-CLa=x7uqXeTA@mail.gmail.com>
Subject: Re: [PATCH 1/5] alloc_tag: load module tags into separate continuous memory
To: Mike Rapoport <rppt@kernel.org>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, corbet@lwn.net, 
	arnd@arndb.de, mcgrof@kernel.org, paulmck@kernel.org, thuth@redhat.com, 
	tglx@linutronix.de, bp@alien8.de, xiongwei.song@windriver.com, 
	ardb@kernel.org, david@redhat.com, vbabka@suse.cz, mhocko@suse.com, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, dave@stgolabs.net, 
	willy@infradead.org, liam.howlett@oracle.com, pasha.tatashin@soleen.com, 
	souravpanda@google.com, keescook@chromium.org, dennis@kernel.org, 
	jhubbard@nvidia.com, yuzhao@google.com, vvvvvv@google.com, 
	rostedt@goodmis.org, iamjoonsoo.kim@lge.com, rientjes@google.com, 
	minchan@google.com, kaleshsingh@google.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 12:13=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wr=
ote:
>
> On Mon, Aug 19, 2024 at 08:15:07AM -0700, Suren Baghdasaryan wrote:
> > When a module gets unloaded there is a possibility that some of the
> > allocations it made are still used and therefore the allocation tags
> > corresponding to these allocations are still referenced. As such, the
> > memory for these tags can't be freed. This is currently handled as an
> > abnormal situation and module's data section is not being unloaded.
> > To handle this situation without keeping module's data in memory,
> > allow codetags with longer lifespan than the module to be loaded into
> > their own separate memory. The in-use memory areas and gaps after
> > module unloading in this separate memory are tracked using maple trees.
> > Allocation tags arrange their separate memory so that it is virtually
> > contiguous and that will allow simple allocation tag indexing later on
> > in this patchset. The size of this virtually contiguous memory is set
> > to store up to 100000 allocation tags and max_module_alloc_tags kernel
> > parameter is introduced to change this size.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  .../admin-guide/kernel-parameters.txt         |   4 +
> >  include/asm-generic/codetag.lds.h             |  19 ++
> >  include/linux/alloc_tag.h                     |  13 +-
> >  include/linux/codetag.h                       |  35 ++-
> >  kernel/module/main.c                          |  67 +++--
> >  lib/alloc_tag.c                               | 245 ++++++++++++++++--
> >  lib/codetag.c                                 | 101 +++++++-
> >  scripts/module.lds.S                          |   5 +-
> >  8 files changed, 429 insertions(+), 60 deletions(-)
>
> ...
>
> > diff --git a/include/linux/codetag.h b/include/linux/codetag.h
> > index c2a579ccd455..c4a3dd60205e 100644
> > --- a/include/linux/codetag.h
> > +++ b/include/linux/codetag.h
> > @@ -35,8 +35,13 @@ struct codetag_type_desc {
> >       size_t tag_size;
> >       void (*module_load)(struct codetag_type *cttype,
> >                           struct codetag_module *cmod);
> > -     bool (*module_unload)(struct codetag_type *cttype,
> > +     void (*module_unload)(struct codetag_type *cttype,
> >                             struct codetag_module *cmod);
> > +     void (*module_replaced)(struct module *mod, struct module *new_mo=
d);
> > +     bool (*needs_section_mem)(struct module *mod, unsigned long size)=
;
> > +     void *(*alloc_section_mem)(struct module *mod, unsigned long size=
,
> > +                                unsigned int prepend, unsigned long al=
ign);
> > +     void (*free_section_mem)(struct module *mod, bool unused);
> >  };
> >
> >  struct codetag_iterator {
> > @@ -71,11 +76,31 @@ struct codetag_type *
> >  codetag_register_type(const struct codetag_type_desc *desc);
> >
> >  #if defined(CONFIG_CODE_TAGGING) && defined(CONFIG_MODULES)
> > +
> > +bool codetag_needs_module_section(struct module *mod, const char *name=
,
> > +                               unsigned long size);
> > +void *codetag_alloc_module_section(struct module *mod, const char *nam=
e,
> > +                                unsigned long size, unsigned int prepe=
nd,
> > +                                unsigned long align);
> > +void codetag_free_module_sections(struct module *mod);
> > +void codetag_module_replaced(struct module *mod, struct module *new_mo=
d);
> >  void codetag_load_module(struct module *mod);
> > -bool codetag_unload_module(struct module *mod);
> > -#else
> > +void codetag_unload_module(struct module *mod);
> > +
> > +#else /* defined(CONFIG_CODE_TAGGING) && defined(CONFIG_MODULES) */
> > +
> > +static inline bool
> > +codetag_needs_module_section(struct module *mod, const char *name,
> > +                          unsigned long size) { return false; }
> > +static inline void *
> > +codetag_alloc_module_section(struct module *mod, const char *name,
> > +                          unsigned long size, unsigned int prepend,
> > +                          unsigned long align) { return NULL; }
> > +static inline void codetag_free_module_sections(struct module *mod) {}
> > +static inline void codetag_module_replaced(struct module *mod, struct =
module *new_mod) {}
> >  static inline void codetag_load_module(struct module *mod) {}
> > -static inline bool codetag_unload_module(struct module *mod) { return =
true; }
> > -#endif
> > +static inline void codetag_unload_module(struct module *mod) {}
> > +
> > +#endif /* defined(CONFIG_CODE_TAGGING) && defined(CONFIG_MODULES) */
>
> Maybe I'm missing something, but can't alloc_tag::module_unload() just co=
py
> the tags that cannot be freed somewhere outside of module sections and th=
en
> free the module?
>
> The heavy lifting would be localized to alloc_tags rather than spread all
> over.

Hi Mike,
We can't copy those tags because allocations already have references
to them. We would have to find and update those references to point to
the new locations of these tags. That means potentially scanning all
page extensions/pages in the system and updating their tag references
in some race-less fashion. So, quite not trivial.
Thanks,
Suren.

>
> --
> Sincerely yours,
> Mike.

