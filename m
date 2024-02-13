Return-Path: <linux-modules+bounces-527-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F62853F4F
	for <lists+linux-modules@lfdr.de>; Tue, 13 Feb 2024 23:59:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 782C82825CC
	for <lists+linux-modules@lfdr.de>; Tue, 13 Feb 2024 22:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23EEE61685;
	Tue, 13 Feb 2024 22:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R3/2bRPD"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3266280B
	for <linux-modules@vger.kernel.org>; Tue, 13 Feb 2024 22:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707865166; cv=none; b=WJYSrFleLXS/vxvru64MIukxYggQIneTgt0bOAfWOuURuFGu9J1y1ycFUhPj224G8tI9gff9dgSze/ExUCwQd3rLcym52RM+MBNfcVKTBL9e5mWtPz3b2RuZe+u3btsoe0+CdaBclr/EZqO5JHCi2DH/UDD5WRApOZHqMPJUIig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707865166; c=relaxed/simple;
	bh=844WXX5yd15NBvKyBWDdzovUDDmAUcOrqOuOYCpCKD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BQyEjla78VU1YTONgpcSpU42AS46OAK6klD6goXKFJhjSUDS+nJcki/eGBqC+iY3m9yRVfZg1K7jygcWyy3qPVC0XSTJO0+5tK2osweenboeLlRZrTigbBqy56+NId0uZRBOL6MYDKI0XcXw4ZHCa7oI+KZMZ18yvcqqeD6NXmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R3/2bRPD; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc238cb1b17so4683679276.0
        for <linux-modules@vger.kernel.org>; Tue, 13 Feb 2024 14:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707865163; x=1708469963; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=844WXX5yd15NBvKyBWDdzovUDDmAUcOrqOuOYCpCKD8=;
        b=R3/2bRPDEVBwjRU7D9sTgip5eUff4Ff3xyuNTbD8vkI0ntoJ7XeikCusWklcJqaNxZ
         9Fm4i+B1BNwf0ViG66HrkyPdKIXUyzaA0sxcIYRQcSG8ER5AomjkYQVJZnwF6lkMTATJ
         L7poNaxetWkGIS7q8b39xWaQJHbUtEFLLrDLqFVjUWFljIv828b3LZ+iBeKRRbBlfBve
         okHGMq8IQ+QT+qbRv/fK7cxinVpjPdJRBS5tLuQAesFmhvRxyZxRGFbj+RIjLCVJCK5C
         nHV3m8AubiA7tXlQQxiqUoosOoJv2EF2wJf+Fc5UUZJP7EjHpEJsS0fqyvK+YKXjCaSG
         s0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707865163; x=1708469963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=844WXX5yd15NBvKyBWDdzovUDDmAUcOrqOuOYCpCKD8=;
        b=d1PlQLc+PduivSVfqpNPQFUZlZOQyFrTIkPRmfTLYYKTXE68Rlea9PAUKFyj2EhBNe
         zah8hoQLi45jIx5k46UmbNb7vIynCp4BTz1NjGsHgr49DjcEfAV5yDruDdVb9b04lHxJ
         PcqePY2LsuYu6yUYWAgSGEz7ovXKmlDqi28ayFxiKdwfiEuAgxb52uFuhYjROzgoP5uo
         5QoQM9g59lPUyrqe39FT1sNio5O9FQ+6XFc4qogitGPB1cmEKi8NkBFcMoMs0gEIdLu6
         mkpr5KNKH9674UKTgwsKqdiFLZB/AECdnHHf09kxvoE5O0unQQ/2cgv2HZBdro7chB8Y
         PsFA==
X-Forwarded-Encrypted: i=1; AJvYcCXXioIGMsyY/23AzWhOOwl9Q2igbkrRG0zrBgglzT/udjijMi643BJ1XvO5VpXPRFvGkewL/m8O29flgjKzKi44V2ZWUfZzilB4ccm7zw==
X-Gm-Message-State: AOJu0YzNmS9dIOLhRR3vo1SI0kjENEND3q3hOz+JHp4OYTMUCBrjNvP2
	/ZbiG7mfNWb3NWeneceFCAM9JRgzgGnHf3X6UbQTB+M7ZXjAbXOxp1FJ141gmo7WrcWyGgzz3ls
	9yUGApVPB6TW96tZNgBGSBkGpzVMv3btzsRqw
X-Google-Smtp-Source: AGHT+IEsak8qaWENuvHfc4VIgP7AWv/5RJ7avJuNvMpPoMXa//p1aEVkERJbZdcyqEU4FQCBMSTUEaA/SBMrUpfRqEg=
X-Received: by 2002:a25:8691:0:b0:dc6:1869:9919 with SMTP id
 z17-20020a258691000000b00dc618699919mr694753ybk.41.1707865162739; Tue, 13 Feb
 2024 14:59:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240212213922.783301-1-surenb@google.com> <Zctfa2DvmlTYSfe8@tiehlicka>
 <CAJuCfpEsWfZnpL1vUB2C=cxRi_WxhxyvgGhUg7WdAxLEqy6oSw@mail.gmail.com>
 <9e14adec-2842-458d-8a58-af6a2d18d823@redhat.com> <2hphuyx2dnqsj3hnzyifp5yqn2hpgfjuhfu635dzgofr5mst27@4a5dixtcuxyi>
 <6a0f5d8b-9c67-43f6-b25e-2240171265be@redhat.com> <CAJuCfpEtOhzL65eMDk2W5SchcquN9hMCcbfD50a-FgtPgxh4Fw@mail.gmail.com>
 <adbb77ee-1662-4d24-bcbf-d74c29bc5083@redhat.com> <r6cmbcmalryodbnlkmuj2fjnausbcysmolikjguqvdwkngeztq@45lbvxjavwb3>
In-Reply-To: <r6cmbcmalryodbnlkmuj2fjnausbcysmolikjguqvdwkngeztq@45lbvxjavwb3>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 13 Feb 2024 14:59:11 -0800
Message-ID: <CAJuCfpF4g1jeEwHVHjQWwi5kqS-3UqjMt7GnG0Kdz5VJGyhK3Q@mail.gmail.com>
Subject: Re: [PATCH v3 00/35] Memory allocation profiling
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@suse.com>, akpm@linux-foundation.org, 
	vbabka@suse.cz, hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	corbet@lwn.net, void@manifault.com, peterz@infradead.org, 
	juri.lelli@redhat.com, catalin.marinas@arm.com, will@kernel.org, 
	arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, nathan@kernel.org, 
	dennis@kernel.org, tj@kernel.org, muchun.song@linux.dev, rppt@kernel.org, 
	paulmck@kernel.org, pasha.tatashin@soleen.com, yosryahmed@google.com, 
	yuzhao@google.com, dhowells@redhat.com, hughd@google.com, 
	andreyknvl@gmail.com, keescook@chromium.org, ndesaulniers@google.com, 
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

On Tue, Feb 13, 2024 at 2:50=E2=80=AFPM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Tue, Feb 13, 2024 at 11:48:41PM +0100, David Hildenbrand wrote:
> > On 13.02.24 23:30, Suren Baghdasaryan wrote:
> > > On Tue, Feb 13, 2024 at 2:17=E2=80=AFPM David Hildenbrand <david@redh=
at.com> wrote:
> > > >
> > > > On 13.02.24 23:09, Kent Overstreet wrote:
> > > > > On Tue, Feb 13, 2024 at 11:04:58PM +0100, David Hildenbrand wrote=
:
> > > > > > On 13.02.24 22:58, Suren Baghdasaryan wrote:
> > > > > > > On Tue, Feb 13, 2024 at 4:24=E2=80=AFAM Michal Hocko <mhocko@=
suse.com> wrote:
> > > > > > > >
> > > > > > > > On Mon 12-02-24 13:38:46, Suren Baghdasaryan wrote:
> > > > > > > > [...]
> > > > > > > > > We're aiming to get this in the next merge window, for 6.=
9. The feedback
> > > > > > > > > we've gotten has been that even out of tree this patchset=
 has already
> > > > > > > > > been useful, and there's a significant amount of other wo=
rk gated on the
> > > > > > > > > code tagging functionality included in this patchset [2].
> > > > > > > >
> > > > > > > > I suspect it will not come as a surprise that I really disl=
ike the
> > > > > > > > implementation proposed here. I will not repeat my argument=
s, I have
> > > > > > > > done so on several occasions already.
> > > > > > > >
> > > > > > > > Anyway, I didn't go as far as to nak it even though I _stro=
ngly_ believe
> > > > > > > > this debugging feature will add a maintenance overhead for =
a very long
> > > > > > > > time. I can live with all the downsides of the proposed imp=
lementation
> > > > > > > > _as long as_ there is a wider agreement from the MM communi=
ty as this is
> > > > > > > > where the maintenance cost will be payed. So far I have not=
 seen (m)any
> > > > > > > > acks by MM developers so aiming into the next merge window =
is more than
> > > > > > > > little rushed.
> > > > > > >
> > > > > > > We tried other previously proposed approaches and all have th=
eir
> > > > > > > downsides without making maintenance much easier. Your positi=
on is
> > > > > > > understandable and I think it's fair. Let's see if others see=
 more
> > > > > > > benefit than cost here.
> > > > > >
> > > > > > Would it make sense to discuss that at LSF/MM once again, espec=
ially
> > > > > > covering why proposed alternatives did not work out? LSF/MM is =
not "too far"
> > > > > > away (May).
> > > > > >
> > > > > > I recall that the last LSF/MM session on this topic was a bit u=
nfortunate
> > > > > > (IMHO not as productive as it could have been). Maybe we can fi=
nally reach a
> > > > > > consensus on this.
> > > > >
> > > > > I'd rather not delay for more bikeshedding. Before agreeing to LS=
F I'd
> > > > > need to see a serious proposl - what we had at the last LSF was p=
eople
> > > > > jumping in with half baked alternative proposals that very much h=
adn't
> > > > > been thought through, and I see no need to repeat that.
> > > > >
> > > > > Like I mentioned, there's other work gated on this patchset; if p=
eople
> > > > > want to hold this up for more discussion they better be putting f=
orth
> > > > > something to discuss.
> > > >
> > > > I'm thinking of ways on how to achieve Michal's request: "as long a=
s
> > > > there is a wider agreement from the MM community". If we can achiev=
e
> > > > that without LSF, great! (a bi-weekly MM meeting might also be an o=
ption)
> > >
> > > There will be a maintenance burden even with the cleanest proposed
> > > approach.
> >
> > Yes.
> >
> > > We worked hard to make the patchset as clean as possible and
> > > if benefits still don't outweigh the maintenance cost then we should
> > > probably stop trying.
> >
> > Indeed.
> >
> > > At LSF/MM I would rather discuss functonal
> > > issues/requirements/improvements than alternative approaches to
> > > instrument allocators.
> > > I'm happy to arrange a separate meeting with MM folks if that would
> > > help to progress on the cost/benefit decision.
> > Note that I am only proposing ways forward.
> >
> > If you think you can easily achieve what Michal requested without all t=
hat,
> > good.
>
> He requested something?

Yes, a cleaner instrumentation. Unfortunately the cleanest one is not
possible until the compiler feature is developed and deployed. And it
still would require changes to the headers, so don't think it's worth
delaying the feature for years.

