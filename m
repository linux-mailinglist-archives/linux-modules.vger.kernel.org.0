Return-Path: <linux-modules+bounces-725-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A379E861F7D
	for <lists+linux-modules@lfdr.de>; Fri, 23 Feb 2024 23:18:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E506289D5B
	for <lists+linux-modules@lfdr.de>; Fri, 23 Feb 2024 22:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8818914D42B;
	Fri, 23 Feb 2024 22:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VdEii+wV"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710B414CAC6
	for <linux-modules@vger.kernel.org>; Fri, 23 Feb 2024 22:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708726680; cv=none; b=Mi2kEFS1Fn3iuYRfgRSQaiIydTowx4/OG2UPwZf52cSNnMBtaSM6e3U7TNw9gROoXZ06Z74Wrnb6VBGLQcN08LiyDgZqwbEwdj60zhNpZY3ZvNQ24kVXdgCRnCwfa/0gFG1T2+pLJx4f+dDncctStlIGbXUoQlmDCFKw0ABvhP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708726680; c=relaxed/simple;
	bh=mr+d1THQdIOXLBHXtZjKUSDXbb7TH7vTqrSqao2j71w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z96UKsgywOr8AKAXGQ5zSCHLakTHk7+nrg/v9PkWVPVENovqiK4rZrtr5sbiueQ//xBHrCKhHCPL2NoE+Jo9DCac2CUfyFTPZ+NcfBQECA5ZqLeqIWn30GWoSjAt3zroc+kZZOEjwl07slbgOg5hSwTeuPpQuMnjEe7hGH5cjTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VdEii+wV; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dc6d8bd612dso1316678276.1
        for <linux-modules@vger.kernel.org>; Fri, 23 Feb 2024 14:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708726677; x=1709331477; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mr+d1THQdIOXLBHXtZjKUSDXbb7TH7vTqrSqao2j71w=;
        b=VdEii+wVRnJp1mt3DLFbLstJLZ/qohvz+uwS06r5/nk3fYwfMxW+/vdbORHgEMfQ6V
         //+/+IhByApeXKiHe8wSxfYEuEZYIUPOnqOQZs/vLMV8SWswH8kbRMouhgqB75Ssf/uE
         9wzrB8/2WIi0puq4JAx0PnY9sMr3J/BpLlubAEBBrGUIz0LYmGSTC6ovFKL/TaZ2FTAJ
         WR9c2RUwFoRHwqV7zoI6oijiyxTF6+ZGSqnwBQo20sbR2jP6ux0HC+h2PwG3qMs7sKSd
         R0qd+leXxrawGLgwD1vKL0dy24+1d1jG4QB4Vav+gUykapzedxDSuQOBul5mVndE2dZg
         TFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708726677; x=1709331477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mr+d1THQdIOXLBHXtZjKUSDXbb7TH7vTqrSqao2j71w=;
        b=wwj1ZLPErOX+SFmtwJsS6qgpnZ7ePG7pWxOdqsyRBjRVZNh/VxO2Sza4ydC7r+ehkB
         rPHEjCPT0BBDerBJmqzR9Kvjg6rLlGQlpc34TKeFDM3MMYDMIf1UoLi42iWMhteMA7QT
         FlRpoqBRxPGprljS8yc6Qeunw/6crVWuhremnek1+JQlsQ+vmafuUTenbTpVygKRHMsX
         2s5F+KPBjINBUGqWhY+1Vgx9tOYY6bpFDqhPJQEaAEhtyM3r05qIFBcoD1FGNIX3hZVt
         E2qkgcyptNzY0begnVqbKhEXxauj6LCYRf6G499ISTrXJMtDLCA/b7WJzqKRfeGHB7Ph
         mFGw==
X-Forwarded-Encrypted: i=1; AJvYcCUEUvrmNVD+JBhJMZWQE8JVbnTBh3ANcbvqxRlHF2cOIrUzjH5ad2Y7XsTMdB2Md6Yw3Yr4SOaheCxpi1SKPx6TPgOv5nkCLUjGPxIIvQ==
X-Gm-Message-State: AOJu0YzYYUsm1bjTTTDUBixu447K3esUDaHXWtrqIfCji0DedJITpl9p
	MJcFChYyhTSN3dU+jJwQOJbWlNvEra7c69/91JiCAUi0/Bi9zJED9bvAPMF8FgXBDUlTDeSgIdF
	6KnG7++/Y6WsyPpA+AVSMavQ1x4wLscAZOIt4
X-Google-Smtp-Source: AGHT+IFvVslf3S11aDqNfvq204R/MIDJZtFxjw2mS4TXD0XUNA43SeY457VF5UW1NHR7Lcxr2CpVLic3B31+1rRIW2U=
X-Received: by 2002:a25:a427:0:b0:dc7:47b7:9053 with SMTP id
 f36-20020a25a427000000b00dc747b79053mr1214318ybi.15.1708726677063; Fri, 23
 Feb 2024 14:17:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221194052.927623-1-surenb@google.com> <20240221194052.927623-25-surenb@google.com>
 <CAH5fLgiyouEuDGkbm3fB6WTOxAnTiDx=z6ADx7HN3BTMAO851g@mail.gmail.com>
In-Reply-To: <CAH5fLgiyouEuDGkbm3fB6WTOxAnTiDx=z6ADx7HN3BTMAO851g@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 23 Feb 2024 14:17:44 -0800
Message-ID: <CAJuCfpHBEX27ThkdMBag-rOwir0Aaie-EeAUgF6bem=3OX4EdA@mail.gmail.com>
Subject: Re: [PATCH v4 24/36] rust: Add a rust helper for krealloc()
To: Alice Ryhl <aliceryhl@google.com>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	penguin-kernel@i-love.sakura.ne.jp, corbet@lwn.net, void@manifault.com, 
	peterz@infradead.org, juri.lelli@redhat.com, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
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
	cgroups@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 2:00=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Wed, Feb 21, 2024 at 8:41=E2=80=AFPM Suren Baghdasaryan <surenb@google=
.com> wrote:
> >
> > From: Kent Overstreet <kent.overstreet@linux.dev>
> >
> > Memory allocation profiling is turning krealloc() into a nontrivial
> > macro - so for now, we need a helper for it.
> >
> > Until we have proper support on the rust side for memory allocation
> > profiling this does mean that all Rust allocations will be accounted to
> > the helper.
> >
> > Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
> > Cc: Miguel Ojeda <ojeda@kernel.org>
> > Cc: Alex Gaynor <alex.gaynor@gmail.com>
> > Cc: Wedson Almeida Filho <wedsonaf@gmail.com>
> > Cc: Boqun Feng <boqun.feng@gmail.com>
> > Cc: Gary Guo <gary@garyguo.net>
> > Cc: "Bj=C3=B6rn Roy Baron" <bjorn3_gh@protonmail.com>
> > Cc: Benno Lossin <benno.lossin@proton.me>
> > Cc: Andreas Hindborg <a.hindborg@samsung.com>
> > Cc: Alice Ryhl <aliceryhl@google.com>
> > Cc: rust-for-linux@vger.kernel.org
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
>
> Currently, the Rust build doesn't work throughout the entire series
> since there are some commits where krealloc is missing before you
> introduce the helper. If you introduce the helper first before
> krealloc stops being an exported function, then the Rust build should
> work throughout the entire series. (Having both the helper and the
> exported function at the same time is not a problem.)

Ack. I'll move it up in the series.

>
> With the patch reordered:
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Thanks Alice!

>
> Alice

