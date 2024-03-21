Return-Path: <linux-modules+bounces-931-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB5188625E
	for <lists+linux-modules@lfdr.de>; Thu, 21 Mar 2024 22:14:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4186E1C227CC
	for <lists+linux-modules@lfdr.de>; Thu, 21 Mar 2024 21:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8287F1369BC;
	Thu, 21 Mar 2024 21:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pL1V3BNr"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C041413443D
	for <linux-modules@vger.kernel.org>; Thu, 21 Mar 2024 21:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711055598; cv=none; b=aWpvS4q20FZoQ3O+NoqGoGYF3qzzWTppplLR5ta3HAmMB+L0MfWJSQL4hczIWMmF+nJEqSfdrROmHUERtU+L36R7NLdqwDj4WUrLkPVPDPESojIkLiKJwil9eEX3JF3fDPWkAeK+45u9cYFeGEwPL33Iobbdi1FewGluoT1NEyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711055598; c=relaxed/simple;
	bh=QdWLuurPKKnAKd/0efIBlHX1KMwle2RKzlVXv6YtTy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cVB/joNuyVPyX46FvCjuM2JEImZx8UWRMCp2l2q24PLOAc91jBT/lLWlYXg3g0vNflIhiiC5UYAcydQIKrUdTEFfhpvkzNw6QBuyhDrH8GoqUELEGRNYKDYWZClCzBRDgOIG9XAHdIZoe8L7Q2xOZNjU6MtXVz85S+zGcZTh93A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pL1V3BNr; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dcbc6a6808fso1379860276.2
        for <linux-modules@vger.kernel.org>; Thu, 21 Mar 2024 14:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711055595; x=1711660395; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ebQxy1c2E58rfYFrtDF0LlwrADqhUaZL+Ah6PQaZrV4=;
        b=pL1V3BNroI1V+L0QVJtIF2Bfjxr9u0dSM7FcbmtcSrpqf8cfuKeIV6bglX3Zapnm4Q
         lW74BtRppnFUHzxeT+5zkNdcUymSOJwC6PJyUlISyZAmiTOVNcQHrl5bjQmLke0jshL1
         NoaQWgozgUIQKha6dpdZ7wLH1e3jUE1eGUBvvmjb8xf1hF+7Oy9NY0D0WqoNKwlbp/VX
         6WAstCHbwWZ9PX8I92qnHu+6mLPu3GOt2TbuZf5ASnUY8jDx1iYIiyLJJbVGDDDfMO9R
         SqxgQ5eQzWaKNUGvvJElpFJYTzu21KbktvnRr5gy36fzXVTf6Xmz6rgFuQFcDbZ7UXWI
         Qt0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711055595; x=1711660395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ebQxy1c2E58rfYFrtDF0LlwrADqhUaZL+Ah6PQaZrV4=;
        b=HO7yAA43RoWyRPT7F9oNPupY7b9ly2SIscxlmLgWvL7OdnxHc6soILFxzTqFbx83Ol
         HJXnHhdy6UcOqYbVbXv3PWwumEVBpeGpSs8HFNdELYFQlWnpeREhbeaJAYZVtQPTbZnS
         rcweCW7UHd8C7Ej4vNaeSuAeSjhyogRf/ZZS9/87AEOwRhPsVYGXLkL2tRMdPO6P4liV
         qhcYdielulESs9m5NtkmtTJ8zhNmHFnLxltfoE58QO/sIvqNRqrM9uOlzWmfoZQKNEgI
         sRRKDFtKq0qow7JFyr5EghjcZ5fYlTBKnnNHqOZMXPmlLrfY0TEHPFqL/Lda5FXg0VXn
         fThQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/cWV+YEW5IeYYhWnAZ354Tzf+P3dJIIXTQv49hBL7k9CgvRJVVVAgns7dysunifbPKOURxiBrLBYbWwGFzK3Ru07kNOwqQok5CnYeAA==
X-Gm-Message-State: AOJu0YwaAhWK9BPtFMY9MgtZSsIK918nIR3m1dhwk7eL+DApuS2Pdk3M
	a6TYaTnqOHO2Ipw35o1EAJxsmrvD5RVlhJ0kMSa9wkAujD+sZgoMl7Z6h78Nv520bMq6SNsYXlw
	VMbuQFdtwKge/7NEO523Tchmyb32KGr6gaga9
X-Google-Smtp-Source: AGHT+IGpQFVT0N1V6MSTPFGK3hczVIPcNsqNEuin7eWXL8IMpmHm2qxsutqSmIFxZ5BpkxVe8WmaXZz7+fehjNgm2MU=
X-Received: by 2002:a25:f40f:0:b0:dc7:4367:2527 with SMTP id
 q15-20020a25f40f000000b00dc743672527mr366083ybd.49.1711055594451; Thu, 21 Mar
 2024 14:13:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240321163705.3067592-1-surenb@google.com> <20240321163705.3067592-6-surenb@google.com>
 <20240321133147.6d05af5744f9d4da88234fb4@linux-foundation.org>
In-Reply-To: <20240321133147.6d05af5744f9d4da88234fb4@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 21 Mar 2024 14:13:03 -0700
Message-ID: <CAJuCfpFtXx=NH-Zykh+dfO2fAASV8eObLLxC4Fu_Zu2Y=idZuw@mail.gmail.com>
Subject: Re: [PATCH v6 05/37] fs: Convert alloc_inode_sb() to a macro
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kent.overstreet@linux.dev, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	penguin-kernel@i-love.sakura.ne.jp, corbet@lwn.net, void@manifault.com, 
	peterz@infradead.org, juri.lelli@redhat.com, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, dennis@kernel.org, jhubbard@nvidia.com, tj@kernel.org, 
	muchun.song@linux.dev, rppt@kernel.org, paulmck@kernel.org, 
	pasha.tatashin@soleen.com, yosryahmed@google.com, yuzhao@google.com, 
	dhowells@redhat.com, hughd@google.com, andreyknvl@gmail.com, 
	keescook@chromium.org, ndesaulniers@google.com, vvvvvv@google.com, 
	gregkh@linuxfoundation.org, ebiggers@google.com, ytcoode@gmail.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, bristot@redhat.com, vschneid@redhat.com, cl@linux.com, 
	penberg@kernel.org, iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, 
	glider@google.com, elver@google.com, dvyukov@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, aliceryhl@google.com, 
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com, 
	kernel-team@android.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 21, 2024 at 1:31=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Thu, 21 Mar 2024 09:36:27 -0700 Suren Baghdasaryan <surenb@google.com>=
 wrote:
>
> > From: Kent Overstreet <kent.overstreet@linux.dev>
> >
> > We're introducing alloc tagging, which tracks memory allocations by
> > callsite. Converting alloc_inode_sb() to a macro means allocations will
> > be tracked by its caller, which is a bit more useful.
>
> I'd have thought that there would be many similar
> inlines-which-allocate-memory.  Such as, I dunno, jbd2_alloc_inode().
> Do we have to go converting things to macros as people report
> misleading or less useful results, or is there some more general
> solution to this?

Yeah, that's unfortunately inevitable. Even if we had compiler support
we would have to add annotations for such inlined functions.
For the given example of jbd2_alloc_inode() it's not so bad since it's
used only from one location but in general yes, that's something we
will have to improve as we find more such cases.

>
> > --- a/include/linux/fs.h
> > +++ b/include/linux/fs.h
> > @@ -3083,11 +3083,7 @@ int setattr_should_drop_sgid(struct mnt_idmap *i=
dmap,
> >   * This must be used for allocating filesystems specific inodes to set
> >   * up the inode reclaim context correctly.
> >   */
> > -static inline void *
> > -alloc_inode_sb(struct super_block *sb, struct kmem_cache *cache, gfp_t=
 gfp)
> > -{
> > -     return kmem_cache_alloc_lru(cache, &sb->s_inode_lru, gfp);
> > -}
> > +#define alloc_inode_sb(_sb, _cache, _gfp) kmem_cache_alloc_lru(_cache,=
 &_sb->s_inode_lru, _gfp)
>
> Parenthesizing __sb seems sensible here?

Ack.
Let's wait for more comments and then I'll post fixes.
Thanks!

