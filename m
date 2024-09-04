Return-Path: <linux-modules+bounces-1891-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EAECE96A652
	for <lists+linux-modules@lfdr.de>; Tue,  3 Sep 2024 20:20:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AD361C2173F
	for <lists+linux-modules@lfdr.de>; Tue,  3 Sep 2024 18:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D61019047C;
	Tue,  3 Sep 2024 18:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ydlfzMSb"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3342418B49C
	for <linux-modules@vger.kernel.org>; Tue,  3 Sep 2024 18:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725387604; cv=none; b=j3XiOnGb5uaFTpTV7gT3geUrDHeNpZfZ9gNtkg4xhEjvPoji3RBNn8D3CYACLs3cgGP6CkEFGQDnnXKLLKPR26bBDb+OpbZplB5vTHRDqlmEdNvzkotJy85UfyY02XYCkpnKYUShQz55P+HUDbVDZQXVzHBjp0hUwuWujeCdrx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725387604; c=relaxed/simple;
	bh=zXN/cYGVl2WUochENDfjWT91MjJc/vSw44nrbwt6mHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t8SRXfp2xfIst7dxMlSlj4Yl8rTWX8Z8G7YDSpcLybapoWIIEhFUH1w+mlWbHdSHe/6XabSvfwgOu1vkxTPAEqzhzhr0j8jtIpnKxHHpkyGRTbEHm2o6ONQuKJ7H87j6vxo/pAGqv8EBdyrhJXKZH1FmVdQ8ziRimgXCVab23c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ydlfzMSb; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4567deb9f9dso32801cf.1
        for <linux-modules@vger.kernel.org>; Tue, 03 Sep 2024 11:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725387602; x=1725992402; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BavSPl5fUtSdj/rsZpwNTR+qZ+A98RwNx6tvieBDuTs=;
        b=ydlfzMSbYXzau+BOfW2sp03zEDKQYC/IFvlDYBhswif2+dYiCemHCZ+nAoyveHzIim
         tOTtCnb7z9y+J1vU4fKwIDmAlgUuZIb+KIETCfuwaVEKqq7Tpim1tMhUQZvjEINyc78g
         f21uvBuco5g9pO1EYQzesZ0UzdtemAwe7f3PtiBEBUqzV1RMHfeYLTKyAANMGgYeW1ee
         w0svIlm+2mM20Iodr+qj7rmBF0K/8bIdJ8vGGBtBefMP0aLBY5FkY5GlW8Hl2L0JLcOT
         SDEFOPBVthrIpzJnGGXSETeuBztCM93c996X/BgwPz/bo2vpP0N2iT59qDWDXqIxh4MR
         5wAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725387602; x=1725992402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BavSPl5fUtSdj/rsZpwNTR+qZ+A98RwNx6tvieBDuTs=;
        b=c6czHCEBD6/5D/xwmjb/W4LCH46Cs2d4wLbOD9GyRdRfBKTiGaccaVJH9qe7CyiLJe
         OJTy7L67687ktDydCoX0cM8H4V18VTLeNERM8Ul7R//3bD0ZzOPql6p0cbknW7bwolRl
         Zbc3IgjQWtC40cj78pjBJhSMsq7xcef+2qlNPjXDWlrVCfH4RXel4trmvrn1hpRJt2oa
         e416slnUZpmLWiEb6BPnE654ew32rA+imPFdnhySTAgzG37EQlIUZabPcpZyFGSnCK2l
         fL+J743Rt+QUoBK/r/e2lvXPk9sbzjzqoIN/vErkLYIu29kVfzgsJ/My9LgXfEcTVZbm
         rWrA==
X-Forwarded-Encrypted: i=1; AJvYcCU1BR6oOwr8Ed/CLAXgwzlHKaAKF9f2FjQ1DPgct0QezVhAr6p/O1aISJnw6bM9lP+9wr9MNJhrVGGsIpcz@vger.kernel.org
X-Gm-Message-State: AOJu0YyjCI3x4vasM2STxw17DLP4PsrywU3JUL8fNIDDA2EFTRhQh0Sw
	Rtp2CwgtvMCAUMWzsVSDSEmpFN6rVsrAxeJFSRD9uWi/3oDV0m4iXdndymMitrNqGw2hw8SqnpH
	XziYKWDxhwSlKfRo8YkffceiRfBGZgJ6pLk5q
X-Google-Smtp-Source: AGHT+IGGVsLSR0VWiAw1Ihng2p7h4/4G9uaafKrLUqbwk2Hx9YjWEaRA9FJvSAxgGPWu1F5yx8Cnzf/j56ZBNxw7Whk=
X-Received: by 2002:ac8:7d85:0:b0:453:56d3:d155 with SMTP id
 d75a77b69052e-457f6225901mr370451cf.8.1725387601590; Tue, 03 Sep 2024
 11:20:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902044128.664075-1-surenb@google.com> <20240902044128.664075-7-surenb@google.com>
 <20240901221636.5b0af3694510482e9d9e67df@linux-foundation.org>
In-Reply-To: <20240901221636.5b0af3694510482e9d9e67df@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 3 Sep 2024 11:19:48 -0700
Message-ID: <CAJuCfpGNYgx0GW4suHRzmxVH28RGRnFBvFC6WO+F8BD4HDqxXA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] alloc_tag: config to store page allocation tag
 refs in page flags
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kent.overstreet@linux.dev, corbet@lwn.net, arnd@arndb.de, 
	mcgrof@kernel.org, rppt@kernel.org, paulmck@kernel.org, thuth@redhat.com, 
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

On Sun, Sep 1, 2024 at 10:16=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Sun,  1 Sep 2024 21:41:28 -0700 Suren Baghdasaryan <surenb@google.com>=
 wrote:
>
> > Add CONFIG_PGALLOC_TAG_USE_PAGEFLAGS to store allocation tag
> > references directly in the page flags. This removes dependency on
> > page_ext and results in better performance for page allocations as
> > well as reduced page_ext memory overhead.
> > CONFIG_PGALLOC_TAG_REF_BITS controls the number of bits required
> > to be available in the page flags to store the references. If the
> > number of page flag bits is insufficient, the build will fail and
> > either CONFIG_PGALLOC_TAG_REF_BITS would have to be lowered or
> > CONFIG_PGALLOC_TAG_USE_PAGEFLAGS should be disabled.
> >
> > ...
> >
> > +config PGALLOC_TAG_USE_PAGEFLAGS
> > +     bool "Use pageflags to encode page allocation tag reference"
> > +     default n
> > +     depends on MEM_ALLOC_PROFILING
> > +     help
> > +       When set, page allocation tag references are encoded inside pag=
e
> > +       flags, otherwise they are encoded in page extensions.
> > +
> > +       Setting this flag reduces memory and performance overhead of me=
mory
> > +       allocation profiling but also limits how many allocations can b=
e
> > +       tagged. The number of bits is set by PGALLOC_TAG_USE_PAGEFLAGS =
and
> > +       they must fit in the page flags field.
>
> Again.  Please put yourself in the position of one of the all-minus-two
> people in this world who aren't kernel-memory-profiling-developers.
> How the heck are they to decide whether or not to enable this?  OK, 59%
> of them are likely to say "yes" because reasons.  But then what?  How
> are they to determine whether it was the correct choice for them?  If
> we don't tell them, who will?

Fair point. I think one would want to enable this config unless there
aren't enough unused bits if the page flags to address all page
allocation tags. That last part of determining how many bits we need
is a bit tricky.
If we put aside loadable modules for now, there are 3 cases:

1. The number of unused page flag bits is enough to address all page
allocations.
2. The number of unused page flag bits is enough if we push
last_cpupid out of page flags. In that case we get the warning at
https://elixir.bootlin.com/linux/v6.11-rc6/source/mm/mm_init.c#L124.
3. The number of unused page flag bits is not enough even if we push
last_cpupid out of page flags. In that case we get the  "Not enough
bits in page flags" build time error.

So, maybe I should make this option "default y" when
CONFIG_MEM_ALLOC_PROFILING=3Dy and let the user disable it if they hit
case #3 or (case #2 and performance hit is unacceptable)?

For loadable modules, if we hit the limit when loading a module at
runtime, we could issue a warning and disable allocation tagging via
the static key. Another option is to fail to load the module with a
proper warning but that IMO would be less appealing.

>
> >  config PGALLOC_TAG_REF_BITS
> >       int "Number of bits for page allocation tag reference (10-64)"
> >       range 10 64
> > -     default "64"
> > +     default "16" if PGALLOC_TAG_USE_PAGEFLAGS
> > +     default "64" if !PGALLOC_TAG_USE_PAGEFLAGS
> >       depends on MEM_ALLOC_PROFILING
> >       help
> >         Number of bits used to encode a page allocation tag reference.
> > @@ -1011,6 +1027,13 @@ config PGALLOC_TAG_REF_BITS
> >         Smaller number results in less memory overhead but limits the n=
umber of
> >         allocations which can be tagged (including allocations from mod=
ules).
> >
> > +       If PGALLOC_TAG_USE_PAGEFLAGS is set, the number of requested bi=
ts should
> > +       fit inside the page flags.
>
> What does "should fit" mean?  "It is your responsibility to make it
> fit"?  "We think it will fit but we aren't really sure"?

This is the case #3 I described above, the user will get a "Not enough
bits in page flags" build time error. If we stick with this config, I
can clarify that in this description.

>
> > +       If PGALLOC_TAG_USE_PAGEFLAGS is not set, the number of bits use=
d to store
> > +       a reference is rounded up to the closest basic type. If set hig=
her than 32,
> > +       a direct pointer to the allocation tag is stored for performanc=
e reasons.
> > +
>
> We shouldn't be offering things like this to our users.  If we cannot dec=
ide, how
> can they?

Thinking about the ease of use, the CONFIG_PGALLOC_TAG_REF_BITS is the
hardest one to set. The user does not know how many page allocations
are there. I think I can simplify this by trying to use all unused
page flag bits for addressing the tags. Then, after compilation we can
follow the rules I mentioned before:
- If the available bits are not enough to address all kernel page
allocations, we issue an error. The user should disable
CONFIG_PGALLOC_TAG_USE_PAGEFLAGS.
- If there are enough unused bits but we have to push last_cpupid out
of page flags, we issue a warning and continue. The user can disable
CONFIG_PGALLOC_TAG_USE_PAGEFLAGS if last_cpupid has to stay in page
flags.
- If we run out of addressing space during module loading, we disable
allocation tagging and continue. The user should disable
CONFIG_PGALLOC_TAG_USE_PAGEFLAGS.

This leaves one outstanding case:
- If we run out of addressing space during module loading but we would
not run out of space if we pushed last_cpupid out of page flags during
compilation.
In this case I would want the user to have an option to request a
larger addressing space for page allocation tags at compile time.
Maybe I can keep CONFIG_PGALLOC_TAG_REF_BITS for such explicit
requests for a larger space? This would limit the use of
CONFIG_PGALLOC_TAG_REF_BITS to this case only. In all other cases the
number of bits would be set automatically. WDYT?

