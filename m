Return-Path: <linux-modules+bounces-844-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 641F9879BBE
	for <lists+linux-modules@lfdr.de>; Tue, 12 Mar 2024 19:41:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 889771C23094
	for <lists+linux-modules@lfdr.de>; Tue, 12 Mar 2024 18:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7C1B1420DD;
	Tue, 12 Mar 2024 18:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jm2PPML8"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EA6141988
	for <linux-modules@vger.kernel.org>; Tue, 12 Mar 2024 18:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710268906; cv=none; b=ENro7cDOOStm4CpXgjUM+HIrnVY+OLG+2yYA4V3pRmToKW70asZk4bGBoChB4naUbD4/4JMH7Bspu88WrmQyyGmQufZjAvynCd6052KbRvUEVGlZy8M8EaZ4rvzagjvbuJ6p6APa/AAYREhPDRTunO717Y7ruIZAWr06VWknTfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710268906; c=relaxed/simple;
	bh=sqOb2aVxWzIRPNIud0HwvwVM+i0sQ6GOvRIk6ilU6Us=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=abVxH28VMODjBQDVdY64T1SpWdsGkfiC6CXJSXLSwFaS6iUJABiEm2EPz7Juzyfk4rugqzLz97tmtyCM+jHqbC1X9N1FK5LAzByvXq6qx0/iSSaN7x509QwZHseQwXXG6RLFbXo92Q5TO/GVqJWgHBOY1Z41u4l8G99LoT1pMZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Jm2PPML8; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-60a0a54869bso1394077b3.1
        for <linux-modules@vger.kernel.org>; Tue, 12 Mar 2024 11:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710268903; x=1710873703; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2MYgtHOHaU2CXGG9+oDczn4RM3zU0YZuyP5JPwAa+g=;
        b=Jm2PPML8v5quH3bfe9rqbFYY9G4GwVlCaraY/tLSQM7HjpeuXe1zxebYDAZ8wBAw6+
         kDr/TlcLRq1qk8yRwpnjK7CrCtepwcPhUeYeqk56n3XSf12jHS/KZnnxU+jainbKNqeo
         q5S7ybj8JKvWJwLW5I1Z7fmdAA0bGQkoO15gRuaYgH89HkolkZAiXS2Tn6JbxRg0f3e6
         ZAuBhgYERIlEIVfDRQMShMGpGTwPG+z4AcgqKLlEZmMpwNiRlE3HTtijk+0evSokROYG
         juZVO4fapxEkTUhAneKAa36gQvOZJlqp+xgF4OU4G8AdYdnJviV1bGUDZrZAFdIO4eGR
         0F6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710268903; x=1710873703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k2MYgtHOHaU2CXGG9+oDczn4RM3zU0YZuyP5JPwAa+g=;
        b=j+2sL1+h9ekAgtHwM0EL18P0ttT/ifUT36wAxiy1l7GGzdrbpvu/I4KVVEuV5le/9t
         0Kxp8+nSTjAGf+heNzrXFSH/2RT6jkfsys1oSVPfGLro1tytUSlZGEvppXYhtSIKS56T
         c6yKkSsCGi7CShAJ7YweCzsXdJsvRcHnDxSzcgDvbG9rvwqo26Axver6iNl7+mkNzwFd
         g9coX4+vf2IFAhDswCm9glfVms8852h7DxRVN8vobPM+0/IpCEtkak/XyUpbrginteEv
         eVuTXSFxB+vB0izuzH2WYWAeUpVCEPPInW0hLmn4RwlshEaRjYMAAeTgv55PVHL+accu
         yWZw==
X-Forwarded-Encrypted: i=1; AJvYcCXfoFm+ukqpf/DVmRMcugx1A5iIv3UBPk13YG+gis3I+Ocd8QUeAt222nqX2QGsr8Pm3xvU85+DUj5glqd8IKNozuvneLHhM1GIYpHE9Q==
X-Gm-Message-State: AOJu0YwddhltHC/K6pzFSqRLrtnqtCD64tyWbQW8c9giHKwCA2PpLP32
	8wfrgghG6VeIon9XyYIq5PYZh482x0kpaGACmTk1GjAA9ox+jV5yr/q58Be9mVRaLQO6tmubysx
	mxuy9E75ExtAYBg9RvFMP6F83EveMpQHf/GYx
X-Google-Smtp-Source: AGHT+IFJU+9YjFiJTRhIakZAUDsKxb4Ab6oaUlbKzNsmoW2Guyxj/oh9l2zNaCTqGzmRWVRumjgqHOm+DPQj+f7k6/8=
X-Received: by 2002:a81:e546:0:b0:609:c64a:f34b with SMTP id
 c6-20020a81e546000000b00609c64af34bmr292571ywm.22.1710268902597; Tue, 12 Mar
 2024 11:41:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306182440.2003814-1-surenb@google.com> <20240306182440.2003814-13-surenb@google.com>
 <ZfCdVI464EqeI9YP@bombadil.infradead.org>
In-Reply-To: <ZfCdVI464EqeI9YP@bombadil.infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 12 Mar 2024 11:41:28 -0700
Message-ID: <CAJuCfpFDY=+gmVytYY6iCYds5OW0gVfwrXguWWq0B0G1qq7hYQ@mail.gmail.com>
Subject: Re: [PATCH v5 12/37] lib: prevent module unloading if memory is not freed
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	penguin-kernel@i-love.sakura.ne.jp, corbet@lwn.net, void@manifault.com, 
	peterz@infradead.org, juri.lelli@redhat.com, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	david@redhat.com, axboe@kernel.dk, masahiroy@kernel.org, nathan@kernel.org, 
	dennis@kernel.org, jhubbard@nvidia.com, tj@kernel.org, muchun.song@linux.dev, 
	rppt@kernel.org, paulmck@kernel.org, pasha.tatashin@soleen.com, 
	yosryahmed@google.com, yuzhao@google.com, dhowells@redhat.com, 
	hughd@google.com, andreyknvl@gmail.com, keescook@chromium.org, 
	ndesaulniers@google.com, vvvvvv@google.com, gregkh@linuxfoundation.org, 
	ebiggers@google.com, ytcoode@gmail.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	bristot@redhat.com, vschneid@redhat.com, cl@linux.com, penberg@kernel.org, 
	iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com, 
	elver@google.com, dvyukov@google.com, shakeelb@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, aliceryhl@google.com, 
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com, 
	kernel-team@android.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2024 at 11:22=E2=80=AFAM Luis Chamberlain <mcgrof@kernel.or=
g> wrote:
>
> On Wed, Mar 06, 2024 at 10:24:10AM -0800, Suren Baghdasaryan wrote:
> > Skip freeing module's data section if there are non-zero allocation tag=
s
> > because otherwise, once these allocations are freed, the access to thei=
r
> > code tag would cause UAF.
>
> So you just let them linger?

Well, I think this is not a normal situation when a module allocated
some memory and then is being unloaded without freeing that memory,
no?

>
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
>
>
> >  /* Free a module, remove from lists, etc. */
> >  static void free_module(struct module *mod)
> >  {
> > +     bool unload_codetags;
> > +
> >       trace_module_free(mod);
> >
> > -     codetag_unload_module(mod);
> > +     unload_codetags =3D codetag_unload_module(mod);
> > +     if (!unload_codetags)
> > +             pr_warn("%s: memory allocation(s) from the module still a=
live, cannot unload cleanly\n",
> > +                     mod->name);
> > +
>
> Because this is not unwinding anything. Should'd we check if we can
> free all tags first, if we can't then we can't free the module. If we
> can then ensure we don't enter a state where we can't later?

unload_codetags already indicates that someone has a live reference to
one or more tags of that module, so we can't free them. Maybe I
misunderstood your suggestion?

>
>   Luis

