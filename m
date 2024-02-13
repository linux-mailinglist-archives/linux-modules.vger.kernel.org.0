Return-Path: <linux-modules+bounces-505-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 044D885277B
	for <lists+linux-modules@lfdr.de>; Tue, 13 Feb 2024 03:20:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B2921F2695B
	for <lists+linux-modules@lfdr.de>; Tue, 13 Feb 2024 02:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10AE2F2F;
	Tue, 13 Feb 2024 02:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4Jrb9xtg"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB76B1C02
	for <linux-modules@vger.kernel.org>; Tue, 13 Feb 2024 02:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707790828; cv=none; b=rAbh31u1DjJupMvXoSQXHz6+i/uSVixs9MlCUzc79OEJrIupxZHjubt2W3Pd+yzsM68Ww+FbXxp965vUt5+RbRvLc/QaAKFDkYno7/2+jOg3HeDB+u2m7tVlm1JPUYMPe+ioiJfRvyPAgEvHzmV268Q3GlWinJ7GcODjjG+oVag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707790828; c=relaxed/simple;
	bh=S9sbRuvYiarABejv+1FZRtHjtyC1exllh7yCDkk639Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nbqOT6CuUy6KdX5J/p80Lul4CLLLwq0vNF06NGRcQo59hMNgMvzGViFUE+tf0aBIDsUFtHFJyRHAvqWoUuds5Vh/0WujeY310PEioilMKFkO8xn4O1PzTpslZPlcBI/YH1v1SQqxXaJuRAAGptZSWVXsvivBbvx6cI+iqsgMmAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4Jrb9xtg; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dcc6fc978ddso189576276.0
        for <linux-modules@vger.kernel.org>; Mon, 12 Feb 2024 18:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707790825; x=1708395625; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9sbRuvYiarABejv+1FZRtHjtyC1exllh7yCDkk639Q=;
        b=4Jrb9xtgZZd68Cd8qtWKkms3W8lyscetML+GV9VkniajxjX00oCm8vO3er0J1tOJYG
         KXV6U73T7/ahxivChBXpV+Epa+r+05A2t154aRf14aPl3XbChON6p22PKWX4U7vAzS9o
         brwAToX8177IfGEf9W+XIqe1YPvjrVvfL9p54qZ1sWP3PGzpzREqC3UGYZKQKBZySG2k
         Ww0YUiGkRHSadsneVBJVnVGSj/Fif1gMg/8vv70xOYtj2wcjiPng2kr+bKGBZYgVzATG
         OKxyy6fQiAVrWs5pOrlgKVY84DYPBwXY7IoUnb6KCj+HNchnZ6OPi4x27n09k46FAdxz
         ByRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707790825; x=1708395625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9sbRuvYiarABejv+1FZRtHjtyC1exllh7yCDkk639Q=;
        b=Nvmbytc6Evc3hAdY0s226hhRefQ/vRs/U0aNXSv9BLjBNQMG2vkFRf05s1ixD2P2IS
         BpP7mMDQ6Dc0aTZM1nlUNOiGt4mbRGyngi8LpMkWtNNO9iQ2ZhvrbCrnZIfhNcgUN5lt
         AE09J8dWb3cLvgOpqSBqDku4V8FjJvJDrC8ClPorJphM4VB+9VozCN0qQ/hCTJWrgZ6b
         cZceZD+Tw2PB7zdBi56Xf5pfWOTCWvztDBKuOKrsKbSCTAVmJRbqKT64+/j4O2H871GY
         3K+eT2po05FkYchCMvLTh/RO5kFH/volLba8Q875IbCHo5K0o5VqpcK3wblhhW9OYMmM
         vOcw==
X-Gm-Message-State: AOJu0YxCsjG3u4ZPjk6vyT1LuO7ebImP+Gltc3QVKfCaZm1DD/g+9jbg
	tzezfWmjXgEuDnIb2Kw8hWjTqllD6p0J7n0CKTSkWa3mzKc0CsZXm/QRFy3S07XrOyDl6l6tHgy
	TAN8uaSSf+IHPMO7F1QwNQQIyZ92NJDvrpUCP
X-Google-Smtp-Source: AGHT+IF7VIKyAprzsQj97Z263Qoier3okujGUFo7m34RyS9jjnxf5dSV3vlCD/UI6jUXKLUqELRXLl2excxB7HnDSlw=
X-Received: by 2002:a25:df91:0:b0:dc6:de93:7929 with SMTP id
 w139-20020a25df91000000b00dc6de937929mr863370ybg.26.1707790825358; Mon, 12
 Feb 2024 18:20:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240212213922.783301-1-surenb@google.com> <20240212213922.783301-6-surenb@google.com>
 <202402121413.94791C74D5@keescook>
In-Reply-To: <202402121413.94791C74D5@keescook>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 12 Feb 2024 18:20:13 -0800
Message-ID: <CAJuCfpGkdAy58nR02_PSVXc4=R3faRUL-7Hack3R_aWmAgk5HA@mail.gmail.com>
Subject: Re: [PATCH v3 05/35] mm: introduce slabobj_ext to support slab object extensions
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

On Mon, Feb 12, 2024 at 2:14=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
rote:
>
> On Mon, Feb 12, 2024 at 01:38:51PM -0800, Suren Baghdasaryan wrote:
> > Currently slab pages can store only vectors of obj_cgroup pointers in
> > page->memcg_data. Introduce slabobj_ext structure to allow more data
> > to be stored for each slab object. Wrap obj_cgroup into slabobj_ext
> > to support current functionality while allowing to extend slabobj_ext
> > in the future.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
>
> It looks like this doesn't change which buckets GFP_KERNEL_ACCOUNT comes
> out of, is that correct? I'd love it if we didn't have separate buckets
> so GFP_KERNEL and GFP_KERNEL_ACCOUNT came from the same pools (so that
> the randomized pools would cover GFP_KERNEL_ACCOUNT ...)

This should not affect KMEM accounting in any way. We are simply
changing the vector of obj_cgroup objects to hold complex objects
which can contain more fields in addition to the original obj_cgroup
(in our case it's the codetag reference).
Unless I misunderstood your question?

>
> Regardless:
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
>
> --
> Kees Cook

