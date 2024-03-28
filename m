Return-Path: <linux-modules+bounces-966-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AF288BA5B
	for <lists+linux-modules@lfdr.de>; Tue, 26 Mar 2024 07:23:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 972C62C5151
	for <lists+linux-modules@lfdr.de>; Tue, 26 Mar 2024 06:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A26130485;
	Tue, 26 Mar 2024 06:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iOJWERdO"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFB512EBDC
	for <linux-modules@vger.kernel.org>; Tue, 26 Mar 2024 06:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711434219; cv=none; b=UR0QY2vjnvUGJ6VT6BxPP1LDBAi0lfrGbqMmbNl7fY+frglNl43tXKQPT65q+gvaex49/ZGrDsfdZRVc64phYdokLyCe6P8DeeqHMgd5TawC3VdIbFlM1N8aS/N89qcsM1mNb02snOjzTlzjHFmjCqlHp5H46w701DED0kJAVvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711434219; c=relaxed/simple;
	bh=1vPnDmB9pDj0OJfEqjDZCv6xNP3XvTJ8rn8qLgfyVhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bFkU6Zi/9AvtQD/TZHRin5cEDy87EouERNVNrMvCuPGtcPktk4tWmnWzOuFC0ilw2LNflQX6eAfBht0K/UzG+2MBbIZxyKWvfNYGTmvFv15vlOaxEppN+TOSx8ESF3NXE7ZZq2TJ8IYZacoWKjn4L3h3X7J5Gi1Fy06kO4KMn3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iOJWERdO; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-ddaad2aeab1so3331893276.3
        for <linux-modules@vger.kernel.org>; Mon, 25 Mar 2024 23:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711434216; x=1712039016; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hY2WNNA6khj/wLxlBTVDg0e/YVgDEc7zpROxMWd3xhs=;
        b=iOJWERdOqSxevG4YebMTI4ggPr0uZw6klcfS+Upol/qe1IIkw26Tb85sS6L2lFZq6R
         7u/T+OfxkI/9mr46BJmcRRCSq9aaKDHrKJaoU88D5TNDd4mDEfXTCZsME+nAX4TWiq4h
         hCTapPU7Z2uhyTQ1m+UAXhLVDvU7OsFrwbmLvjHrBSkjzdhYjachF1tCNRvGEn+lnMM3
         vCkRYpsnyjGvXQFNTDsI4PQ0K4wOXY4myt8Ce93SeO6aRbTfpY0rHbZ0tqasHTHjWMM/
         uW09WK173s9e61MNV6m+RTpNkEyIV11d6kgmAdmwD+4Co8lPDjDN0zh364Zyh4U9A2JD
         EaSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711434216; x=1712039016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hY2WNNA6khj/wLxlBTVDg0e/YVgDEc7zpROxMWd3xhs=;
        b=GShRtw8ib0MK/P7o3yEDgP5qtuUxJrYqNO9UJBmSUfQ2o7ySWu/k/E5ltr8p1TJ6CN
         zU0gHFyCW6OUu/Kk6rbjJK+Of321Hey3MOwNKPtZgPFOU/kJvVHnwmXi2VOVNc+P6KG5
         GXp1PLZd1KcOC5Yo7xfLhuMRDb0Ffpl2DiYNZ0o0nj7/gIDXPNm6U0vZ+BevPpRlIbZE
         vbuVUYO0el1sCFXyotLQagFCjTZjP0u+xtZjMenZxgmWoIMYkqZ1j/sYy1fn8ByLkhx9
         kKUJagJDiFojKFSz5yf4GKlIxAwqs2PjPH34lXUXJuk+OvU+LQ91b8kdrRccbjRh89dx
         GsTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdyYYfSYqwY38lPLu3CLds7FyfCxdWUXQRbtY1uocB/6ai2wT0/wik8iPwdK6UCvnCAROVspw7uvKP6vUS1tweC3D1CCFA+AKhvZaPiA==
X-Gm-Message-State: AOJu0YzwHgolCmX//ZSkFSlzEAvb1aF+kERvK71u3fqXmcFp0panAI2O
	ikKVWDIUapVR58ZofL/e2moLdK36qJgKDEkZcsaYsHygeywg6+vewrCtDIvaWuGMPmh0bc3IF9j
	7/u5KwtgspH95X7Vb9FVBEyM2pQQlPGssUAjl
X-Google-Smtp-Source: AGHT+IG0Gky/CBeJB0rm/0hu0j5w1H7Rs/NYjEm4sYKK7iwNm6xWETNlnSAhCMgOK//6yiQJTSFCTE29ikghtZ8wfEk=
X-Received: by 2002:a05:6902:4d3:b0:dc6:d457:ac92 with SMTP id
 v19-20020a05690204d300b00dc6d457ac92mr7166050ybs.31.1711434216382; Mon, 25
 Mar 2024 23:23:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240321163705.3067592-1-surenb@google.com> <20240321163705.3067592-15-surenb@google.com>
 <ZgI9Iejn6DanJZ-9@casper.infradead.org>
In-Reply-To: <ZgI9Iejn6DanJZ-9@casper.infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 25 Mar 2024 23:23:25 -0700
Message-ID: <CAJuCfpGvviA5H1Em=ymd8Yqz_UoBVGFOst_wbaA6AwGkvffPHg@mail.gmail.com>
Subject: Re: [PATCH v6 14/37] lib: introduce support for page allocation tagging
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, liam.howlett@oracle.com, 
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

On Mon, Mar 25, 2024 at 8:12=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Thu, Mar 21, 2024 at 09:36:36AM -0700, Suren Baghdasaryan wrote:
> > +++ b/include/linux/pgalloc_tag.h
> > @@ -0,0 +1,78 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * page allocation tagging
> > + */
> > +#ifndef _LINUX_PGALLOC_TAG_H
> > +#define _LINUX_PGALLOC_TAG_H
> > +
> > +#include <linux/alloc_tag.h>
> > +
> > +#ifdef CONFIG_MEM_ALLOC_PROFILING
> > +
> > +#include <linux/page_ext.h>
> > +
> > +extern struct page_ext_operations page_alloc_tagging_ops;
> > +extern struct page_ext *page_ext_get(struct page *page);
> > +extern void page_ext_put(struct page_ext *page_ext);
>
> Why are you duplicating theses two declarations?
>
> I just deleted them locally and don't see any build problems.  tested wit=
h
> x86-64 defconfig (full build), allnoconfig full build and allmodconfig
> mm/ and fs/ (nobody has time to build allmodconfig drivers/)

Ah, good eye! We probably didn't include page_ext.h before and then
when we did I missed removing these declarations. I'll post a fixup.
Thanks!

