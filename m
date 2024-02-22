Return-Path: <linux-modules+bounces-713-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E93E85EDC3
	for <lists+linux-modules@lfdr.de>; Thu, 22 Feb 2024 01:13:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2E5C284D68
	for <lists+linux-modules@lfdr.de>; Thu, 22 Feb 2024 00:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC794290E;
	Thu, 22 Feb 2024 00:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="u6MzgmLQ"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F6315BF
	for <linux-modules@vger.kernel.org>; Thu, 22 Feb 2024 00:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708560779; cv=none; b=HfP+QBcRA9BBRRgyjMMHo2jlk7QYfMytOIJyx8NAz3ey02+VssYw+7TnPX5CTNjtcnZeNjJ8y33Ka2pYSDH9LyF7vjMN8TxL1b7u5mkNt7Sp0+Pn34zNpIpGAj2B3vzFXpmnSovxc9kJEsntIowVesnhaq5CSmNlzhbZEbUceQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708560779; c=relaxed/simple;
	bh=yPsvw9vJzS5OOehh2obqY5C9ccmf1AALBE4na8IWGEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OAEiRuq0ygT7IAxdnoXzTD6wM2sP4Ga2XxcGb4Zht6dQYs1o++Z7hnFpwnlR6mcWonsrtNcqb2F5cx9pEOCY/1n3mpf3NB848ZGQaanDAuYUWbSckFANppipMUhufMtUFiPjZSp1P1Vf/DwqwDzniXqePqmLZO4B9lxjxguknTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=u6MzgmLQ; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-42dc86cc35dso6148871cf.1
        for <linux-modules@vger.kernel.org>; Wed, 21 Feb 2024 16:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1708560776; x=1709165576; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yPsvw9vJzS5OOehh2obqY5C9ccmf1AALBE4na8IWGEE=;
        b=u6MzgmLQHfOebLxBK3vq95PpgzpVyRoBGEcnq8JMV+Pt8FGSWmlAh2hfIioBlyCYSC
         hqyrh19LMeFU5IOtb+lnUbXtbjscpRxjjRrXJRRZs4XF1+uOlSuDQEmhWkGSDqdb2oPR
         nvXlPVHnD+zlVdfmkdxtKfibDp5Da97/9sSjWBSuFRpzBLozYGilxEwIVSsftN91kFuh
         rYicFEHecReyhUKLRgFk8VgBpv1rbqlI6g+fAxEjvTb2AiGftkkGhBQZBhJqkJNfNmpc
         PwA9mhxAVv0p/KuSrzB9VLt2DFF59hi6k+tYXUeOnH7sKgatrJe5V7y9sXAwMNlXFx6m
         2abQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708560776; x=1709165576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yPsvw9vJzS5OOehh2obqY5C9ccmf1AALBE4na8IWGEE=;
        b=bZ3+t2Cl18/cbYhF8hK8lWWwdOWOhsS/DrmSNMrVRPLrgjfhX2xtpQI9AWzxxyDBZd
         89+k56+8suz0pihAzsFpwkXqFCnYwByOKEi/qhAFlr0bVyf4RBpudhOlXykezYUj3FUk
         L4NKu7M/S0tlVGinykOKAPyr5k78M1ZRSRbGYSjXRYj3dLR5vlcUGbjVj2KxLc/NjXkT
         7S83rqEjja7sIMPsZpV3HvD9DAZ87hp7F4+bhREi1OcxtvnuqjI7ePtJoGB7S9zDRKVx
         A9aSKPCWCvQUQVAW0FklFg8colsiGg9XbNggWEMm2u6GiKOG6J2KYTcyiTSGpRp/cALn
         lQSw==
X-Forwarded-Encrypted: i=1; AJvYcCUFpV/gq6Nw/d26K0g6nF2dvIHlbOgcikOpJDXjXSyEJzECkrRo5D1Omar8Jpxojpjn2Clqo7rpPUPP82iM9xouyt4HGPJVwMf1A9AomQ==
X-Gm-Message-State: AOJu0YzpB5qFIpWUda2p7PsvLKbfVEjsg95OpYL+4pR37MgRGtngVBkr
	X+kDM3KQESdX0+1y0WSHUyxHwacxO8GgfV5IrVWMt1RA/rp8E+VdXjys+TMJERPkg60p7Vx1qoS
	wypaV+QFcda5TJGOOlLrKn+5Z4190xr8+NHyEcA==
X-Google-Smtp-Source: AGHT+IHC2jE3/DoAiHiK02zORvbTKUG6myX0k7i1f+aHTzOQJjz8xfPJY5H0xjNb5qm6LzazHkaY+DyA8GGq0QMoj/o=
X-Received: by 2002:a05:622a:1996:b0:42e:1911:93fc with SMTP id
 u22-20020a05622a199600b0042e191193fcmr11082250qtc.55.1708560775667; Wed, 21
 Feb 2024 16:12:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221194052.927623-1-surenb@google.com> <20240221194052.927623-11-surenb@google.com>
In-Reply-To: <20240221194052.927623-11-surenb@google.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 21 Feb 2024 19:12:19 -0500
Message-ID: <CA+CK2bBBcJfgBU-O600Wx-2yHs6RUdhT+n0wsHtieU-rSHn-Ng@mail.gmail.com>
Subject: Re: [PATCH v4 10/36] slab: objext: introduce objext_flags as
 extension to page_memcg_data_flags
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
> Introduce objext_flags to store additional objext flags unrelated to memc=
g.
>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Reviewed-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

