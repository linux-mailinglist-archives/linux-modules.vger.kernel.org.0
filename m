Return-Path: <linux-modules+bounces-513-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD140853DF3
	for <lists+linux-modules@lfdr.de>; Tue, 13 Feb 2024 23:03:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5ED071F2639A
	for <lists+linux-modules@lfdr.de>; Tue, 13 Feb 2024 22:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D7F6313F;
	Tue, 13 Feb 2024 21:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rxb8wS3o"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A63D69951
	for <linux-modules@vger.kernel.org>; Tue, 13 Feb 2024 21:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707861535; cv=none; b=nigtr1NU2+Yl82O/v144qkmjl96YB9lQT5Vw0SagV9zBqwz4C32TBGcVAJwcEKMyGuq4fBxqsjoQV+OtxA3ZgoqEQWeEghq00vIulJkA5OgiHfezF4u7u7mAYxg83FW9j2EG0ZYCDITJc9nsxxGcYB16C3KJ+sFD3FqyCexRRpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707861535; c=relaxed/simple;
	bh=y3mhTelgi0cx53H62n2OpwC2+wJXIbkyAT/UHHyybvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RkI2Y5rn77E+gQxeYooRsximxGiGSsbnLvj/12Y4TJIVdo2ax/byApFpY1oh+tQqvz+Xz3FKm2ohi220qaajFkATgYCc1OuaqAOO1UWyNaGAIklUPs2NhLWrfVrJ82eJJQ68Xg5Bz1LVcEkGjx9NcfI9e2FjtgvPyQGbloOrw88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rxb8wS3o; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dcc6fc978ddso194391276.0
        for <linux-modules@vger.kernel.org>; Tue, 13 Feb 2024 13:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707861533; x=1708466333; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sj6FkWt0IHINoPp252M2H78r73QaJ+UAYuAK2lRmHyc=;
        b=Rxb8wS3oMHnLIb34yoTtwMfqoD4BcyVNuvNgGPdVHWPCpCIa6nEGYA5xvYOo5c/pvz
         J2+OGg5pEfmE2ho3y5XIHT7lyPc4URII+matfJ1wGhF8/rZuDswE4lvq0eGNeHmc4d6i
         1TslSmbu7/OW47V4jOiZ5LOcxgKzmPryQ4zK+pmespbb8vXgJxMG8uIdRMZx91X4F4MZ
         GLPJ/mSUpVJkzmEWH8AhXqdx7DmmTZO/C6XQK33qFlrmwPlyjLWoDnxwx87d60SE9xih
         +mW7UIlKhjY11M0oWGgX7klJ3vobUHc6ZLro1BWt6iAV7lHw8VKFBSbHNeQIPKHeeCWG
         zK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707861533; x=1708466333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sj6FkWt0IHINoPp252M2H78r73QaJ+UAYuAK2lRmHyc=;
        b=iXM2F4gTc8OuKGLmuw6GnGw6dMhSa1fjdAezbq+4w2iXyb926/qooUQtgYLNivtdKV
         DP86F/zJwymq+PjyMkeowVa4mvHGNWIhsw/v6ZQoOS3ECATYtl90a6kpS8PszZUDk2mM
         3F5YqnChSlUbamArdQ3uM4cF8KDc/MKUJkltt6zbnjCMEf5UhqbTJeVdByaSc4AA14sR
         evvjNyvy0nu4kxJr2aWkRShNtJNcFTadncjREoJOQhgWIb7tkGuL6rg9orLh7Dt0d1wL
         egNd6R3ZXbv/nrSfHFG7EoL6n+bw63keEjs3acYV+Y70Jd0U9um5ytRs3/5utQ10PNg2
         Anfw==
X-Forwarded-Encrypted: i=1; AJvYcCWN0NIxyTS7Mt+7FbKYtDJY04RS0fyl1jEU1HFkxrvhh1eNxeXv6ED9W5i+DzhJfVBw2phlL/yo3ZWOWRcU0bsACc4BTXQqojMdkabbxA==
X-Gm-Message-State: AOJu0Yw/z45a905ejLD3SC08nh2KfaNa+UBv0sCaxX8UV6WRSMOE4vgu
	Hp8AK/oJ1W7HpgAd+KSddcr3Cu9du+KrFmb5fIdBKRkmfZeeKeigZVWkJaQOWFlyqEA4BfxPj4g
	4g1HIBbTXVJTsRUeg84+WMr60aSDJWE5/lzk/
X-Google-Smtp-Source: AGHT+IG6l4h8KgCu1mcr/ZMWQbdEFueKYTFVYNMwYlVMCYSQKnQPu8RzycqvNzeYz47HXL5wboAvOGkSQgCimZvCNdM=
X-Received: by 2002:a25:d815:0:b0:dc6:e7f6:254a with SMTP id
 p21-20020a25d815000000b00dc6e7f6254amr127954ybg.8.1707861532899; Tue, 13 Feb
 2024 13:58:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240212213922.783301-1-surenb@google.com> <Zctfa2DvmlTYSfe8@tiehlicka>
In-Reply-To: <Zctfa2DvmlTYSfe8@tiehlicka>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 13 Feb 2024 13:58:39 -0800
Message-ID: <CAJuCfpEsWfZnpL1vUB2C=cxRi_WxhxyvgGhUg7WdAxLEqy6oSw@mail.gmail.com>
Subject: Re: [PATCH v3 00/35] Memory allocation profiling
To: Michal Hocko <mhocko@suse.com>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, vbabka@suse.cz, 
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

On Tue, Feb 13, 2024 at 4:24=E2=80=AFAM Michal Hocko <mhocko@suse.com> wrot=
e:
>
> On Mon 12-02-24 13:38:46, Suren Baghdasaryan wrote:
> [...]
> > We're aiming to get this in the next merge window, for 6.9. The feedbac=
k
> > we've gotten has been that even out of tree this patchset has already
> > been useful, and there's a significant amount of other work gated on th=
e
> > code tagging functionality included in this patchset [2].
>
> I suspect it will not come as a surprise that I really dislike the
> implementation proposed here. I will not repeat my arguments, I have
> done so on several occasions already.
>
> Anyway, I didn't go as far as to nak it even though I _strongly_ believe
> this debugging feature will add a maintenance overhead for a very long
> time. I can live with all the downsides of the proposed implementation
> _as long as_ there is a wider agreement from the MM community as this is
> where the maintenance cost will be payed. So far I have not seen (m)any
> acks by MM developers so aiming into the next merge window is more than
> little rushed.

We tried other previously proposed approaches and all have their
downsides without making maintenance much easier. Your position is
understandable and I think it's fair. Let's see if others see more
benefit than cost here.
Thanks,
Suren.

>
> >  81 files changed, 2126 insertions(+), 695 deletions(-)
> --
> Michal Hocko
> SUSE Labs

