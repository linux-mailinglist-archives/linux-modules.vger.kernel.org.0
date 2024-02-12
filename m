Return-Path: <linux-modules+bounces-490-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5BD852228
	for <lists+linux-modules@lfdr.de>; Tue, 13 Feb 2024 00:00:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F07E728310C
	for <lists+linux-modules@lfdr.de>; Mon, 12 Feb 2024 23:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8614F1E0;
	Mon, 12 Feb 2024 23:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CSHsxssM"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB76C51011
	for <linux-modules@vger.kernel.org>; Mon, 12 Feb 2024 22:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707778801; cv=none; b=FxkIGOcl/9EOZz3xFedXs/sVFR10Ccpr/E72Juncu34rwGayC98WoQz3dahVWqHG5d2V2SwXpY2a39Hnm4AtCJ1UZ8W0fLyFNUFMxp9IFdG5Up626adMqlqVSHpvFrThmsLge6QcQ8GJLGFe8xjuOzOcP5ztfJE595TL9VSdT4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707778801; c=relaxed/simple;
	bh=aYY2Rs2oW/xk4wvqKVnHjM5RBsMS+W7rJ4ZfUJGebUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IKn8QrQ0n3w+cbGXodsdlL/Y4RfriGI7RnIM6SlGtnK68IOD3PAmuRZHqTqKrRr/hWaAjGuoCXRNTD9vrZv7SRlTH2vFux6WGlgjehIrxVyOe96gHswWMqxAR707EYdg0wPHTtu/gIeyNO/N1WpXaQptweobaqcd/WZaqZf2/es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CSHsxssM; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3bba50cd318so2976588b6e.0
        for <linux-modules@vger.kernel.org>; Mon, 12 Feb 2024 14:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707778798; x=1708383598; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y6AxC+gFNzLegoAwuSB5/O4MPPTQdLkk2fG8bSEFU8c=;
        b=CSHsxssMI9FixXVytsmRDJhZdsRn9ZYT//YUZXzZ5VtUokI5Mm5H4M9E1UmXM+xU/8
         h7ekOzi+2N41WsdclXz5sk8MpFXC8vJFdXlP0lQKafy0NRF0EF0LEhH6mD8N7Or6Qf2K
         vEI3BrqIsDFZEo1z3zmJlpZ1K/NC480bTbBYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707778798; x=1708383598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y6AxC+gFNzLegoAwuSB5/O4MPPTQdLkk2fG8bSEFU8c=;
        b=Obevj6pNAaXki4KsswhYdN0fItD90dl5pJEF0NaHWDCSWtVyJtGYAaorOEBMf4h5+R
         rZnjms3yvlR8PIpVBOTA5dqMybrVb5Oq2p/JPBt0Wp7BbeBkXjjz3bd+w3bPMOgff/W4
         /RenSXc2b2D3ICpblFOJFg2NHzEoEutf1Mc/csGNc2Bsuehx0z5mbCtk0524OGflmwO9
         8XMuTGiOjYOlsUMYKUCpvlUKbk5MPRPbn7+S+LIAYpos22d6KxFOeoBTBhFD7bUsqYGO
         0fqdUvqr04dvMyiof6CjWVSHGtG2ppiUSsjXYC2WiC1GOM62oYTKjAJ6T/i+z7vcHnI1
         ZS0A==
X-Forwarded-Encrypted: i=1; AJvYcCXx05pg4AdXfCrb5Y5hNjhnSbb8A1JQkDqbKhuleUWURPqNz1byq2ToLfF6D9+YPnTgiNeR+331P40pL3CQzQtBWs2Dbiz+6zjV1goF+g==
X-Gm-Message-State: AOJu0YzmSHFQcR1dUys+/hqKrCSoiO+OXCiKba3JeS0hC5em4/OeaLTH
	SnhZKjy4NXTAIst8IjlJ89g9LiEC4P7+Nqem3mm8G10HF8uXCuP8zOzkmmJYFg==
X-Google-Smtp-Source: AGHT+IFsaEygC2XO+Q0B03sBU7ZPnujQ/EvxYG+Mtl9An+rAOeacCcFpEMP2zzjc5kz2TyLf8ip3kg==
X-Received: by 2002:a05:6358:717:b0:176:3e0d:8a36 with SMTP id e23-20020a056358071700b001763e0d8a36mr7448969rwj.0.1707778797911;
        Mon, 12 Feb 2024 14:59:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUN/x1eVaIcn54RxZcQlNsO+ucIPMk7vlyGVyb87st4NyQ/iZ5l5eTz+mMvz9NX05jSKiZ7ZYO5ITibQUWmRc7IEE5sufBNZd2s8GtAEKSyxpknXaVNC9tmfgDMUJR9NYKVlEe/1LnldNDMUfaVmNHswunnZihDs4P/cvAafcI5W1vrHt8V4+Z+bO/k1ZTsPWxRokFSjfm6oCTiLjrrP4auVfEEOpepy7gb186UC3MH+XFtfPqQzSUY796e3OjPPwec8NsPkF0A20TiWDOFlAk3uNFcDoC4ngIlqIwrH9914N58Ba0PY05+q4yO//boTwxmNncZmfC9Phux3mDRTZQCfx7swsk9ps8J1y15zrHI9KUOqyBvcIYAbwWVl1G1XQbWAs9oo+aZikxTLaedFUex+JS992rESnig9RhrGExdrpNpjrhRHzO9mBxFPQQqkElUlL9icPTY9fTP8M5BjI7ayc7E5RQdtrdxpmMnbkR8a/E+boRmW8Fm3yrvR+qY8h/wetMaTa16l+tuMMMS1qVK3sxFtgyJ9/3irb0qV9n2X12TpuGrerIcNVx8AnddtXhoDct7E0b0iQqPVoR2gEXyAiXrq9UYPhT74rkEeIDU5eBs/d6G4spgU31W5T0LAZetTYBBRZno0gRcQHgKdiQc2H2OD64kIly/FXTx0a3EBYTi9MKcHcNIbKzwz07Las74bFVxmpCmDa9K+RptA9QWEyp3fON09CgBZ+rjTkTikn3L5bdPLA==
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id z16-20020aa78890000000b006dff3ca9e26sm6089537pfe.102.2024.02.12.14.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 14:59:57 -0800 (PST)
Date: Mon, 12 Feb 2024 14:59:57 -0800
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
Subject: Re: [PATCH v3 21/35] mm/slab: add allocation accounting into slab
 allocation and free paths
Message-ID: <202402121459.DEFAB0280@keescook>
References: <20240212213922.783301-1-surenb@google.com>
 <20240212213922.783301-22-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212213922.783301-22-surenb@google.com>

On Mon, Feb 12, 2024 at 01:39:07PM -0800, Suren Baghdasaryan wrote:
> Account slab allocations using codetag reference embedded into slabobj_ext.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

