Return-Path: <linux-modules+bounces-967-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4497088BBB5
	for <lists+linux-modules@lfdr.de>; Tue, 26 Mar 2024 08:51:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5DA71F34D29
	for <lists+linux-modules@lfdr.de>; Tue, 26 Mar 2024 07:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885C4134409;
	Tue, 26 Mar 2024 07:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AoR/K3A9"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3EE132C1A
	for <linux-modules@vger.kernel.org>; Tue, 26 Mar 2024 07:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711439499; cv=none; b=OJDRUbKQzAg4Raw6pvV/wk/6dRxU/0mVdz1ujPwm4xl0e+CExuUjQJ84mwvWTYZf8JpClDPXPbKEKHzCXtvayQb7ReYWz9bNVt3SZ8EbefJnwtei9/mbWCUcF8kS6lxGA2i/cXXp/yATgjisFwWjPkucXflU3f8FK/CLhHsr468=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711439499; c=relaxed/simple;
	bh=qQOLO5yzYREaf6V5UZ46t3ExCwuenEVvpk1QDbdYz28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rJ2gR4Sjws94MZweiTSbZ4OM+SIraWk8aIQZ9f6gWOkmmuT08RQE67Zk/k5wdA/zpStRCcI2bXypqLevlkX3L1JegDZ6WMGXrewXc1RI4u4rFXZTMSpnbpIbgMBjAFzNV1FEQBW1MIn80zIVjCR6uikhlnYYZ4yUCgkTmAcw3Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AoR/K3A9; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dcc80d6004bso5109640276.0
        for <linux-modules@vger.kernel.org>; Tue, 26 Mar 2024 00:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711439495; x=1712044295; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shklYWkLA2oyBqnlJsmv6lUxL/P85ZOYE2ckd/gba5w=;
        b=AoR/K3A9wZgTr/H35zji2Ryw+JLZD17t8Szk3uZ0qBgeAWIMB4NN/BJPJl3JEUN120
         JR/dFikYMYTHog58UqZeWY3abyXSZUyAQhcJeeiKJpnr/q3iy4u2x+ZiWRmiFXTuY4d0
         +wc6Q4UTQkI1gwn3NZpEbigkgcPaUHuCPwDkFXgLpseEsrvifg9T5Hl2k2OELRZjb6IO
         7HhpJaXTkfsKZer7xANqdvBDRaIHRAYTWZTqNzDY69XWEL0E6/FXTCmnffr7tHBlV5uz
         EdplvUVUqmH07En2kwV6V3HDpPDo4hp6r0Czwxmv6qUgkvmaDs7Irw3eU/uoAoJFXx2u
         w+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711439495; x=1712044295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=shklYWkLA2oyBqnlJsmv6lUxL/P85ZOYE2ckd/gba5w=;
        b=Tm9Xfs2/TPiH4H4Jhv+nqUl2mPYKnx2KbyOaZg1C2sB/tQzDeEd5zyqAkQpGk4lfrJ
         APpBdBw1Q6KKSnc7vdHyT0oo3zYg2pNKp1pGs9ZJGnHYvJmzgnU6jLThzBZaKoRszgcX
         Wwh5NmZMC8r7pIvlKWDy5JbpZDZLkB7jHcyJkXsCQX10oPSMOD8f6BNZhlvhpf1IB9/G
         Gqx2gy/dhtU1p+s7Dr7CLsYie8HQcW4mYejv8gLi5JLtNOtp8ZVFAX0KoQvRQ1siJ3hL
         uKUhdph84t183W6Ip0y+XdESKBHMOCJbNi4pS/cWUf4Pal/IeF7GPDANyd2NiJzGmYps
         Akog==
X-Forwarded-Encrypted: i=1; AJvYcCVkmHZBj4HRm2eNOnd08D76py1iqHBQv3obExyumDFUCxlRzqQ+5Ro0mM3oh2ORIz8UbGNOnzKP/BNg7SVGWJsJAAWt5NTzDxCtKqdMVQ==
X-Gm-Message-State: AOJu0YzjChiHBS9EGN1fxuwaFQRl6k3jiSMnfzm9vkWxNAezbKLBXFtk
	hAqftuMU5dnES9iKHgOENKk8gIm7O/ljW9NpGHJaEh42jflOuC+wbYEvj78ge2KiroUwMGgKyLY
	IElGn0wyAqAUP6OO9ejDoQNP3lNSUkcOa8Wzk
X-Google-Smtp-Source: AGHT+IEnVh4+gbIjqfTqnNSb1ESniynB5/g+eF5Tlrl382kaRHENtFyyuE83hIP6W791lwHTf2P908O7iGBHbxnvUiU=
X-Received: by 2002:a5b:181:0:b0:dce:2e9:a637 with SMTP id r1-20020a5b0181000000b00dce02e9a637mr7603025ybl.20.1711439494844;
 Tue, 26 Mar 2024 00:51:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJuCfpGiuCnMFtViD0xsoaLVO_gJddBQ1NpL6TpnsfN8z5P6fA@mail.gmail.com>
 <20240325182007.233780-1-sj@kernel.org>
In-Reply-To: <20240325182007.233780-1-sj@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 26 Mar 2024 00:51:21 -0700
Message-ID: <CAJuCfpGwLRBWKegYq5XY++fCPWO4mpzrhifw9QGvzJ5Uf9S4jw@mail.gmail.com>
Subject: Re: [PATCH v6 30/37] mm: vmalloc: Enable memory allocation profiling
To: SeongJae Park <sj@kernel.org>
Cc: vbabka@suse.cz, hannes@cmpxchg.org, roman.gushchin@linux.dev, 
	mgorman@suse.de, dave@stgolabs.net, willy@infradead.org, 
	liam.howlett@oracle.com, penguin-kernel@i-love.sakura.ne.jp, corbet@lwn.net, 
	void@manifault.com, peterz@infradead.org, juri.lelli@redhat.com, 
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, tglx@linutronix.de, 
	mingo@redhat.com, dave.hansen@linux.intel.com, x86@kernel.org, 
	peterx@redhat.com, david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, 
	masahiroy@kernel.org, nathan@kernel.org, dennis@kernel.org, 
	jhubbard@nvidia.com, tj@kernel.org, muchun.song@linux.dev, rppt@kernel.org, 
	paulmck@kernel.org, pasha.tatashin@soleen.com, yosryahmed@google.com, 
	yuzhao@google.com, dhowells@redhat.com, hughd@google.com, 
	andreyknvl@gmail.com, keescook@chromium.org, ndesaulniers@google.com, 
	vvvvvv@google.com, gregkh@linuxfoundation.org, ebiggers@google.com, 
	ytcoode@gmail.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, bristot@redhat.com, 
	vschneid@redhat.com, cl@linux.com, penberg@kernel.org, iamjoonsoo.kim@lge.com, 
	42.hyeyoo@gmail.com, glider@google.com, elver@google.com, dvyukov@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, aliceryhl@google.com, 
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com, 
	kernel-team@android.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 11:20=E2=80=AFAM SeongJae Park <sj@kernel.org> wrot=
e:
>
> On Mon, 25 Mar 2024 10:59:01 -0700 Suren Baghdasaryan <surenb@google.com>=
 wrote:
>
> > On Mon, Mar 25, 2024 at 10:49=E2=80=AFAM SeongJae Park <sj@kernel.org> =
wrote:
> > >
> > > On Mon, 25 Mar 2024 14:56:01 +0000 Suren Baghdasaryan <surenb@google.=
com> wrote:
> > >
> > > > On Sat, Mar 23, 2024 at 6:05=E2=80=AFPM SeongJae Park <sj@kernel.or=
g> wrote:
> > > > >
> > > > > Hi Suren and Kent,
> > > > >
> > > > > On Thu, 21 Mar 2024 09:36:52 -0700 Suren Baghdasaryan <surenb@goo=
gle.com> wrote:
> > > > >
> > > > > > From: Kent Overstreet <kent.overstreet@linux.dev>
> > > > > >
> > > > > > This wrapps all external vmalloc allocation functions with the
> > > > > > alloc_hooks() wrapper, and switches internal allocations to _no=
prof
> > > > > > variants where appropriate, for the new memory allocation profi=
ling
> > > > > > feature.
> > > > >
> > > > > I just noticed latest mm-unstable fails running kunit on my machi=
ne as below.
> > > > > 'git-bisect' says this is the first commit of the failure.
> > > > >
> > > > >     $ ./tools/testing/kunit/kunit.py run --build_dir ../kunit.out=
/
> > > > >     [10:59:53] Configuring KUnit Kernel ...
> > > > >     [10:59:53] Building KUnit Kernel ...
> > > > >     Populating config with:
> > > > >     $ make ARCH=3Dum O=3D../kunit.out/ olddefconfig
> > > > >     Building with:
> > > > >     $ make ARCH=3Dum O=3D../kunit.out/ --jobs=3D36
> > > > >     ERROR:root:/usr/bin/ld: arch/um/os-Linux/main.o: in function =
`__wrap_malloc':
> > > > >     main.c:(.text+0x10b): undefined reference to `vmalloc'
> > > > >     collect2: error: ld returned 1 exit status
> > > > >
> > > > > Haven't looked into the code yet, but reporting first.  May I ask=
 your idea?
> > > >
> > > > Hi SeongJae,
> > > > Looks like we missed adding "#include <linux/vmalloc.h>" inside
> > > > arch/um/os-Linux/main.c in this patch:
> > > > https://lore.kernel.org/all/20240321163705.3067592-2-surenb@google.=
com/.
> > > > I'll be posing fixes for all 0-day issues found over the weekend an=
d
> > > > will include a fix for this. In the meantime, to work around it you
> > > > can add that include yourself. Please let me know if the issue stil=
l
> > > > persists after doing that.
> > >
> > > Thank you, Suren.  The change made the error message disappears.  How=
ever, it
> > > introduced another one.
> >
> > Ok, let me investigate and I'll try to get a fix for it today evening.
>
> Thank you for this kind reply.  Nonetheless, this is not blocking some re=
al
> thing from me.  So, no rush.  Plese take your time :)

I posted a fix here:
https://lore.kernel.org/all/20240326073750.726636-1-surenb@google.com/
Please let me know if this resolves the issue.
Thanks,
Suren.

>
>
> Thanks,
> SJ
>
> > Thanks,
> > Suren.
> >
> > >
> > >     $ git diff
> > >     diff --git a/arch/um/os-Linux/main.c b/arch/um/os-Linux/main.c
> > >     index c8a42ecbd7a2..8fe274e9f3a4 100644
> > >     --- a/arch/um/os-Linux/main.c
> > >     +++ b/arch/um/os-Linux/main.c
> > >     @@ -16,6 +16,7 @@
> > >      #include <kern_util.h>
> > >      #include <os.h>
> > >      #include <um_malloc.h>
> > >     +#include <linux/vmalloc.h>
> > >
> > >      #define PGD_BOUND (4 * 1024 * 1024)
> > >      #define STACKSIZE (8 * 1024 * 1024)
> > >     $
> > >     $ ./tools/testing/kunit/kunit.py run --build_dir ../kunit.out/
> > >     [10:43:13] Configuring KUnit Kernel ...
> > >     [10:43:13] Building KUnit Kernel ...
> > >     Populating config with:
> > >     $ make ARCH=3Dum O=3D../kunit.out/ olddefconfig
> > >     Building with:
> > >     $ make ARCH=3Dum O=3D../kunit.out/ --jobs=3D36
> > >     ERROR:root:In file included from .../arch/um/kernel/asm-offsets.c=
:1:
> > >     .../arch/x86/um/shared/sysdep/kernel-offsets.h:9:6: warning: no p=
revious prototype for =E2=80=98foo=E2=80=99 [-Wmissing-prototypes]
> > >         9 | void foo(void)
> > >           |      ^~~
> > >     In file included from .../include/linux/alloc_tag.h:8,
> > >                      from .../include/linux/vmalloc.h:5,
> > >                      from .../arch/um/os-Linux/main.c:19:
> > >     .../include/linux/bug.h:5:10: fatal error: asm/bug.h: No such fil=
e or directory
> > >         5 | #include <asm/bug.h>
> > >           |          ^~~~~~~~~~~
> > >     compilation terminated.
> > >
> > >
> > > Thanks,
> > > SJ
> > >
> > > [...]
> >
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kernel-team+unsubscribe@android.com.
>

