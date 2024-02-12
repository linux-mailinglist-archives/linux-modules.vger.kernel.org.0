Return-Path: <linux-modules+bounces-481-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F93852135
	for <lists+linux-modules@lfdr.de>; Mon, 12 Feb 2024 23:15:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF5F1B25E11
	for <lists+linux-modules@lfdr.de>; Mon, 12 Feb 2024 22:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14B1D4EB22;
	Mon, 12 Feb 2024 22:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IeSR7CE8"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7895A4F211
	for <linux-modules@vger.kernel.org>; Mon, 12 Feb 2024 22:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707776099; cv=none; b=XMGOXPkkx2MC1M63aY2Vd/kjATE+ggKOz6KGo/mg/lr/c9vMjIlHY3ZD2i9xztNDvGEHpVml5XYFcIk1n6mKrTEZEGpC9nX3i/KM8yOoIS8mLi4ZtN9A17l+AJY5Jwr43LxE8X4ZyGYgR8hBw8fgmRqpOsN211WPFRbfQzT46Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707776099; c=relaxed/simple;
	bh=dyH1lfHbtvnYqMA2n7qN8NXnHWmrvDNZFQy38SC9y5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jYnvGCyNHgFs5o4WWdapxCSDjB/QQstNaerswZ5ObOpPxgXAaKpcgs7DLZkHMJVhZkzhUCi3PM3o0nu8XLvOYNaE6jTk3w5zejNMT0ezdd7vJIG/bJSPcWQJQaDXsC1YxXQxjEUXmRdvjmRRQe2qIV7wsVh+v1x0gZ7uVM8+/50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IeSR7CE8; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e0ee8e9921so267317b3a.3
        for <linux-modules@vger.kernel.org>; Mon, 12 Feb 2024 14:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707776097; x=1708380897; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=njQYW+8QUhLVezZTq33SQ25bt0JrLVgtIWx4ItZ5PfU=;
        b=IeSR7CE86+X05I2QmvdCXJzwE0kKk6hDmPajOHls6UUwBtJEZkj+cskUvkz8Q1qnV1
         JaeAy0KELzfshPa2E3RoVQ6ybC99UUfVW642FenYbbtUDuLV8LwjnZycyc78D2+Zi6AZ
         C/4eq4h00xoyJuO2t5cPVcqfycLu0FZYmNOqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707776097; x=1708380897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=njQYW+8QUhLVezZTq33SQ25bt0JrLVgtIWx4ItZ5PfU=;
        b=LLK6n136u20i8gH4gtMWWR/GibVbgh+3BYvY44XjeZnHE9gUTUi9MYkwY6n4UkL+1r
         h1t9Sf3rBL8AwSjvewr22Mqg0GMY8lWaYMEg1+dSpWeM6AUgIJyEcvHOOU8vT7aba5op
         Xgxw1ut+yw9NqoEFnK16XUf5wVjWnFaG8yCJdikeRc+haetMJVZa0E1vcTWWs6KLXffr
         xc4EBOHJPRPt2QoLwTkxX4vXNTAQx483Umt7+iXKeRcrPGQtChHlexJa+XsaGyYmlcjL
         JCPuHlFoTH13kaoWhtzSvmt+7dX/IDz91EB3p8klbJyU/P5GJ8awDkPLhAcg/nFBEnzc
         muPg==
X-Forwarded-Encrypted: i=1; AJvYcCVDiJE+XT0VXC5kVcauGIDVw1qR/+NiSqH/o58OYleG1dKjd2nxjwIV4GsqT6p/PkFzeDxm/Hj7+uqzeSbbJDU7YM3odT7MpUASP/gSPQ==
X-Gm-Message-State: AOJu0Yxveto/H4kMfanA7wVm4cva6rzPSngN8wmFpVFG82Ci1874znju
	UL00IHi/Cu07XFq7MWqtcGFenYcxLFQUK296Bxe/AqVyDduebLvSip+wKu2l6Q==
X-Google-Smtp-Source: AGHT+IGqHvQOXXe7pc2R8QyHByBXSm0DS/WGlqi3hZkqk8zeoT0i73r83gGpApQJ03KCZsZvt2qMeg==
X-Received: by 2002:a05:6a00:124d:b0:6e0:4a04:cd1 with SMTP id u13-20020a056a00124d00b006e04a040cd1mr8211556pfi.17.1707776096755;
        Mon, 12 Feb 2024 14:14:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUawBFhnV5kDrJizR8a00DS7yAvZ2jV8W5VE00vxBHng9Iux9BXaSmyGyDA+k/BmGKhRzKbWgCJlDApB9sU0S29Qs2ATeXIPgNbm4G9/M9kXh/5eYurHo9ba8q5k/E/MRaeOJ3yRafvYhsV53C3qCdd2RmIrydlsVryJ4CdulBga6TAqzPfk3A03BoqE+5noWnQQngO2dUiuB22FMz4yqYpERu2gKGnXcL3qQcPRx8QZK5QYBIuL3QlvVOx1EM1wtNT9Fv3Dirtaw2NsVkJ5Z3zsSNAEgQK6BfuKYvX/hccDt0wHJCJNRMNWj7MEiql8IFjfRIeYCzedAohtWgXbo3DkcfSe/fCdff7co71W0LbEfOUkxXQaXM2E81jCQbqIAvmJkIh1npJ8zhRmHuD8O9LjKD8vz7GT1RPiUu24gXbK16IB7uPEaiQzl3wT2WnbCXgUoNedjXsO9qGAlDAGaPCYADPuBr/7c/JDUry2XcXokowgT8A+Ki9kmQ0pzfUoO4weA6y38ykw/YlDDuGmgTB/CfzmHDMpLBdZBYCV2SJgg7D0dwPX4leQyuezXu7ZhUNW1lMsUUsbzm7q0bPBP+qNxPT4gLqwGcHlRdJIkHxVUG+Qlc1p1gIyYn46L/cukorHtdjTEdsUq+Mo4o66zaSxNyzfL6wuF8lepBEzoCdMzP/Pq9ocXXYi7a4GBGr9c5wXz89P/S/Wy05xXyXJ7vbiEHF7N0v8J5oyvy4CFwX7DrFteqamA==
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id m4-20020a62f204000000b006e0472fd7d1sm5946630pfh.130.2024.02.12.14.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 14:14:56 -0800 (PST)
Date: Mon, 12 Feb 2024 14:14:55 -0800
From: Kees Cook <keescook@chromium.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, mhocko@suse.com,
	vbabka@suse.cz, hannes@cmpxchg.org, roman.gushchin@linux.dev,
	mgorman@suse.de, dave@stgolabs.net, willy@infradead.org,
	liam.howlett@oracle.com, corbet@lwn.net, void@manifault.com,
	peterz@infradead.org, juri.lelli@redhat.com,
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
	tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
	x86@kernel.org, peterx@redhat.com, david@redhat.com,
	axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org,
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org,
	muchun.song@linux.dev, rppt@kernel.org, paulmck@kernel.org,
	pasha.tatashin@soleen.com, yosryahmed@google.com, yuzhao@google.com,
	dhowells@redhat.com, hughd@google.com, andreyknvl@gmail.com,
	ndesaulniers@google.com, vvvvvv@google.com,
	gregkh@linuxfoundation.org, ebiggers@google.com, ytcoode@gmail.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, bristot@redhat.com,
	vschneid@redhat.com, cl@linux.com, penberg@kernel.org,
	iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com,
	elver@google.com, dvyukov@google.com, shakeelb@google.com,
	songmuchun@bytedance.com, jbaron@akamai.com, rientjes@google.com,
	minchan@google.com, kaleshsingh@google.com, kernel-team@android.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-arch@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com,
	cgroups@vger.kernel.org
Subject: Re: [PATCH v3 07/35] mm/slab: introduce SLAB_NO_OBJ_EXT to avoid
 obj_ext creation
Message-ID: <202402121414.57F185ACC3@keescook>
References: <20240212213922.783301-1-surenb@google.com>
 <20240212213922.783301-8-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212213922.783301-8-surenb@google.com>

On Mon, Feb 12, 2024 at 01:38:53PM -0800, Suren Baghdasaryan wrote:
> Slab extension objects can't be allocated before slab infrastructure is
> initialized. Some caches, like kmem_cache and kmem_cache_node, are created
> before slab infrastructure is initialized. Objects from these caches can't
> have extension objects. Introduce SLAB_NO_OBJ_EXT slab flag to mark these
> caches and avoid creating extensions for objects allocated from these
> slabs.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

