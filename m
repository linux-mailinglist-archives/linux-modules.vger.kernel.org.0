Return-Path: <linux-modules+bounces-168-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D99587D885F
	for <lists+linux-modules@lfdr.de>; Thu, 26 Oct 2023 20:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 118941C20F8F
	for <lists+linux-modules@lfdr.de>; Thu, 26 Oct 2023 18:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602183AC10;
	Thu, 26 Oct 2023 18:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rTZGeXNS"
X-Original-To: linux-modules@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70033AC03
	for <linux-modules@vger.kernel.org>; Thu, 26 Oct 2023 18:33:32 +0000 (UTC)
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 120F410CC
	for <linux-modules@vger.kernel.org>; Thu, 26 Oct 2023 11:33:24 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-d9a58f5f33dso903566276.1
        for <linux-modules@vger.kernel.org>; Thu, 26 Oct 2023 11:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698345203; x=1698950003; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rsh3dPt2/r73NgmaoP1t7gGhxASdUa0L8chPdmn23Qo=;
        b=rTZGeXNSv39V7CDwWwbTtJTASQ2rK2BoAdrQCuFlLhh8yuAl3n4qHKdjNVN2ZqoB62
         bEv3SsybLlla5R9YmiMvyzniT1p77RmjoumAu+mZA80D1jsWVuRyL9lby6Oko5k2Brje
         /B4qDoaVO116OOmgyjlvXUtygLddZRd4pdsIoJpVkuPd2dhnI1sK9hABTLhRYwP90vN9
         vvo/3fPIqeT7SoYTZjJaaaM9/3Wo9l6c2G+lbJbOfEydg2aB37+ZlEth+zEZEMW5M0Wj
         iw2AaL5p+eEgxjCqadkYQ7jEbdBumr2S3Tm3OqgexNucK/zd9LFHXauLjpelg8RPBrFk
         uhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698345203; x=1698950003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rsh3dPt2/r73NgmaoP1t7gGhxASdUa0L8chPdmn23Qo=;
        b=pJbFWX8IRGs4xQm2Z2V1HSU7oUBCWgaZfG0LFQBLwhdU/JESFWppOInIrXUYh3P0F2
         q+YRwhKuXom+/HferJi5NhG9ff8PqOD5kAEW4KxVvBsKe6zaD1/O597Oaiy8s5NFai9O
         s97KT/1oO+QkL2MFs8FifYvxJhXIcKU7XL7CKSrrKx8N7Qf61SZatt9UCXSg3KMIrYUq
         CLVCHc9xUH93E0YD89uuZt/4TqRei/Jcz6GMMzYQJdeeJsOctKPur8ZfVfXiPWOcYUlK
         LKbJ5UYbk39vFCmhEZcPeTdIuNO6FDQDWlxABhHQ9LnMO3AivbAL1EQ/+DUgZtHdNi20
         K69A==
X-Gm-Message-State: AOJu0Yxw+JfqKGbh8WaWx1oRxB+Lv2mimV1NdSkF5zU4LtY6maCAKCEj
	wFlUPr8688R8U+1R6cciWOJEQoVlkVyn/z4qXDfZnA==
X-Google-Smtp-Source: AGHT+IHBtVGuULaTsqSbWWfK0JktN//Yobr+i2oSyvtEqBPvfhvTvIyFXXQYxmpnW+pXruM/MrOawuspY0l3Z4zpy28=
X-Received: by 2002:a25:74c5:0:b0:da0:46ad:fb46 with SMTP id
 p188-20020a2574c5000000b00da046adfb46mr114458ybc.41.1698345202763; Thu, 26
 Oct 2023 11:33:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231024134637.3120277-1-surenb@google.com> <20231024134637.3120277-29-surenb@google.com>
 <87h6me620j.ffs@tglx>
In-Reply-To: <87h6me620j.ffs@tglx>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 26 Oct 2023 18:33:09 +0000
Message-ID: <CAJuCfpH1pG513-FUE_28MfJ7xbX=9O-auYUjkxKLmtve_6rRAw@mail.gmail.com>
Subject: Re: [PATCH v2 28/39] timekeeping: Fix a circular include dependency
To: Thomas Gleixner <tglx@linutronix.de>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	corbet@lwn.net, void@manifault.com, peterz@infradead.org, 
	juri.lelli@redhat.com, ldufour@linux.ibm.com, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, mingo@redhat.com, dave.hansen@linux.intel.com, 
	x86@kernel.org, peterx@redhat.com, david@redhat.com, axboe@kernel.dk, 
	mcgrof@kernel.org, masahiroy@kernel.org, nathan@kernel.org, dennis@kernel.org, 
	tj@kernel.org, muchun.song@linux.dev, rppt@kernel.org, paulmck@kernel.org, 
	pasha.tatashin@soleen.com, yosryahmed@google.com, yuzhao@google.com, 
	dhowells@redhat.com, hughd@google.com, andreyknvl@gmail.com, 
	keescook@chromium.org, ndesaulniers@google.com, vvvvvv@google.com, 
	gregkh@linuxfoundation.org, ebiggers@google.com, ytcoode@gmail.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, bristot@redhat.com, vschneid@redhat.com, cl@linux.com, 
	penberg@kernel.org, iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, 
	glider@google.com, elver@google.com, dvyukov@google.com, shakeelb@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, rientjes@google.com, 
	minchan@google.com, kaleshsingh@google.com, kernel-team@android.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arch@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 25, 2023 at 5:33=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> On Tue, Oct 24 2023 at 06:46, Suren Baghdasaryan wrote:
> > From: Kent Overstreet <kent.overstreet@linux.dev>
> >
> > This avoids a circular header dependency in an upcoming patch by only
> > making hrtimer.h depend on percpu-defs.h
>
> What's the actual dependency problem?

Sorry for the delay.
When we instrument per-cpu allocations in [1] we need to include
sched.h in percpu.h to be able to use alloc_tag_save(). sched.h
includes hrtimer.h. So, without this change we end up with a circular
inclusion: percpu.h->sched.h->hrtimer.h->percpu.h

[1] https://lore.kernel.org/all/20231024134637.3120277-32-surenb@google.com=
/

>

