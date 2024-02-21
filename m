Return-Path: <linux-modules+bounces-708-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DD785EB12
	for <lists+linux-modules@lfdr.de>; Wed, 21 Feb 2024 22:38:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20AFF28B1F6
	for <lists+linux-modules@lfdr.de>; Wed, 21 Feb 2024 21:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D526112E1E7;
	Wed, 21 Feb 2024 21:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="TvKM5Qjm"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E809112D75D
	for <linux-modules@vger.kernel.org>; Wed, 21 Feb 2024 21:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708551079; cv=none; b=PCF2T70EzfC1vueMmwBWgg7hfZs34FVoltnjKIHK+8Lx+0t7I1L1d+VNWWEV60du/swDgpjrKS+LFaLVejYxe8Gn/a/AIQ2TNK3XYjPJGZAE9R23LBYO2vVTtUMvL3iy/xWs3+Iw9NFMU5s/dkOFPbk1pqz1bprQGbX/kgxk1N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708551079; c=relaxed/simple;
	bh=gFsioKErNguGb0UXfpCehO3mOIaCj+gYffuxZggc6lc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G4bxjdRhUaUcvQHYAAoZNu4qacuQVjN+giKaIfILccqatokikYydYkHzZJxeMUyafKUtFaLfZYEp6KTPNzR5U0AvBDuyzECC6sWwt1yEBr2q7bwScmfaAt8OXVjTgRzZrddAhXER+cmr16ppWEGocJETlcNp1UIB4xBn1YainaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=TvKM5Qjm; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-42a4516ec46so2209621cf.0
        for <linux-modules@vger.kernel.org>; Wed, 21 Feb 2024 13:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1708551076; x=1709155876; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFsioKErNguGb0UXfpCehO3mOIaCj+gYffuxZggc6lc=;
        b=TvKM5QjmE9xrfDQJ0zweQnLEld1ypTjdep3yzcgaY30WwpzHdpmS5OdggDnbCVaKgl
         1JI/zHkJI7W6/zh4E+3JMqzlHbFQqqjxdhIdIhzoFfy9vEkG0Ut4sFjJAWQIxQfVcLLI
         ugE17rbvStlLf4KlWm7GZ4w0Y23sSuKIgk/Gp0ewW1tpB1IW3EUUNBOK2S0IvZMhQBAV
         Fljy92n/Wd4jpdvCPDYvSWZFTUCreb0Gt1ia9PFfu8yiO4DmpffOnJASQG1dxoO8YQMc
         KUK3XFt3/8JyqXNqZ/Q+U1IaLjSKpwN+bGASvPMOF6g+KRYRa0s4joCrPuQI+G3jREI1
         +i+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708551076; x=1709155876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFsioKErNguGb0UXfpCehO3mOIaCj+gYffuxZggc6lc=;
        b=evKWE4nw2YJDl7T2SrgP3NNT+f46PCmHeMNdjh8qBUI/bOuqLcGpDQ2wAFQ38nd1Pa
         Z/9Wk4/FKbvw7z56k45n62ay5JcH4cFHG/rUvsxce1Wm1H//xUwl1uFCrpq/G7522qQV
         RXMcOk464Pro615NvfAhK8t/Kz3wVCpJURFVbCUA/MvYzrXKuWERAqmpiaNUttNtrnsW
         w/yLPRL3hPirSe7zypxgA6z+FbUNfh+y8qH/iQ2N3H8XrWx7ThEryoBP9o6o0EvVNHeA
         +i/zcrWJH1rQtdyWe85i/48Zl4qF1rtbHLssIKjtr1I4EsZS8NIfvrfYaL3czq0GpPjp
         pboQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8GyEC7SJJiENOxzKgdc2nSHPuxEEi8o3yIW1gTRhAMmtjlkg4zA+6GpWBxBJshooNksTPS7chQnqhUVlejLtwBRFySP2D2wjpdglHJQ==
X-Gm-Message-State: AOJu0Yzl634ie23KiiIpsiA1QBwA4Ri0EHF6TX7yg4pOmlvUStqwlkw2
	iFcq/TIjSXgcNdR4Fcl333m6gEd4I5VLOnxZZnQO2xz5uBQfMvnsDKPI+cx+j+DsfMgjjIL7Ddi
	t5U+Z3EHa093QvA8/VcZLcZJ5OxvzSYzkYr9NKA==
X-Google-Smtp-Source: AGHT+IFO5Z7BsmHAefImdCXlOf9v/A1DymY9rKzrFG6F8X6fIh9MpYHyGC/yHJX92pP0BH/FzDecR0AIIxui9aAjnNM=
X-Received: by 2002:ac8:570f:0:b0:42c:78fd:e4fa with SMTP id
 15-20020ac8570f000000b0042c78fde4famr1316065qtw.32.1708551075946; Wed, 21 Feb
 2024 13:31:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221194052.927623-1-surenb@google.com> <20240221194052.927623-8-surenb@google.com>
In-Reply-To: <20240221194052.927623-8-surenb@google.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 21 Feb 2024 16:30:39 -0500
Message-ID: <CA+CK2bDOiV8xwig1pDdTVjkO4KhK+jJ0wXAtNon1ZXQGviih4A@mail.gmail.com>
Subject: Re: [PATCH v4 07/36] mm: introduce slabobj_ext to support slab object extensions
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	penguin-kernel@i-love.sakura.ne.jp, corbet@lwn.net, void@manifault.com, 
	peterz@infradead.org, juri.lelli@redhat.com, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org, muchun.song@linux.dev, 
	rppt@kernel.org, paulmck@kernel.org, yosryahmed@google.com, yuzhao@google.com, 
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

On Wed, Feb 21, 2024 at 2:41=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> Currently slab pages can store only vectors of obj_cgroup pointers in
> page->memcg_data. Introduce slabobj_ext structure to allow more data
> to be stored for each slab object. Wrap obj_cgroup into slabobj_ext
> to support current functionality while allowing to extend slabobj_ext
> in the future.
>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

