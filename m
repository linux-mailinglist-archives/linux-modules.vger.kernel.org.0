Return-Path: <linux-modules+bounces-6012-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIexMGwmsGnYgQIAu9opvQ
	(envelope-from <linux-modules+bounces-6012-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Tue, 10 Mar 2026 15:10:52 +0100
X-Original-To: lists+linux-modules@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 382FA251793
	for <lists+linux-modules@lfdr.de>; Tue, 10 Mar 2026 15:10:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 72AE8333EF8F
	for <lists+linux-modules@lfdr.de>; Tue, 10 Mar 2026 13:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE97C36B046;
	Tue, 10 Mar 2026 13:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imet4woT"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F24839DBE1
	for <linux-modules@vger.kernel.org>; Tue, 10 Mar 2026 13:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773149761; cv=pass; b=ZgAHelOu/eClb74tLQQSr0cmOLrAqd18IEKatH851bL2qam12erNyBH5Yd46YpQzuy6Hk5IuCE01MMqC9LCYE6NytdR9lOEZv8nKJ+uW4mUa5PGcta/qoGfxj6fZpcFB2ioHMYjwwGvgxawRi0H9ZecqbgBpC+Uwlq6cnirzn+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773149761; c=relaxed/simple;
	bh=9+ITvhyuK+qiLzKuGxx5vIvJu8n9h3IEvRSOy3oFBF4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U3fJ499xB8M60vjkU+e+dXNgtxmdcmyREpGX9tbzLAc+m1ufSNhgnOgB1xpYCOVmStPix8qAdykfQrhdGsf0Q1/oW5zCeyK97sxLl1H9O54sIhYO2cidTfFdBTqhxYkaYHhHKiNC1RN3tO9eAB+eYdh6wIhocW5ygPDtXtMBz74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=imet4woT; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79495b1aaa7so113978787b3.1
        for <linux-modules@vger.kernel.org>; Tue, 10 Mar 2026 06:36:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773149760; cv=none;
        d=google.com; s=arc-20240605;
        b=Sh64QiXUbNL6JH6bTMzPypbEBKk8xO9Y+jxwrzGYVQEJFGBhzz1Z34dESkOmZuKbMr
         aRbUQit+j7gyAjBVVI0Wj9hsu2uRnxntrcpBnlsavWNvB54LzzEAIzqk92eZTC+o/gWp
         wH6sNNhy1lxlEqpB4N79DP/YbSIoMk+O9u18k5MF5jfjZs9zUiu1fR7IBlVuwa2pnwb3
         pzbadWR0QwJ9Bl/qKE/qpX3W1RvgAfP7VG5OVWLmG5ekQGOd4upM0IzqcWCAtGCs5fj+
         ywwUxw1vzk7ndVOYIjubNkUSNy86xlpnhdChRKrADnAtkZ9zlDOHJRgQSk/W29kgRSZq
         iTsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2eD1oCIgFi2ZrcfUmO7jmrn0YazceqbfMakhdVxyNfY=;
        fh=5qKMlxFcLRiwJQyvxE4AAGzkfxV/EkheESy58dLYZbc=;
        b=fSCpFcTLsAl1wIZZcZpIpMGfDD18djmfWbLr1dL/uQN1AckzXHHlE3Jnm491j/2Li5
         NiPuHP/zj1FFarmyH1VJdVUaC6JQTWN3T4oDBD1HkPZSVIiQgPtCQQCTRQgREm22ItOq
         Cwl/bwqPV+M7TcgvzOxtFwxOKYV6SURnIrxSUUI6OT8weOfUbhCLvPvQ61+JZRDKSQEw
         T0e1C2HzOr9rM3yGRaN9HMCs0MnvXQyhEk8/Oj6EU9kNCFBXToYd4qZ2XRnTuNl8ji7o
         a4TTg6XSTTSgNU7XnYKZ+9hbnmXeWf2+OX0UkxrFcGU/E8xTYUncP96MYP6rSjLCG1rd
         dzGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773149760; x=1773754560; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2eD1oCIgFi2ZrcfUmO7jmrn0YazceqbfMakhdVxyNfY=;
        b=imet4woTh8FTX0jFaEdcbQ31AsyBxvgLI0Cipi08/GgesS6PawDi0WESsBl1TolhK+
         O5AZD72bN9XAw3Zg062+Hmb2HSDpwbsALmV4ZjlOcEC7OPu1NlGahCS2xMizjvhSUbir
         hiIny3vp3HEMEUTA6n2M4TfdeSAh5JY8AZlgsNlmUnmmyrJC5CNqWrFLfmK4og4osgEd
         i/PHt96y0RtqLqL7NhB7IOd5YwiBK4PhG16G94QW4mcJJtPQefzqDczJ/R3Wi+sQpk1r
         MgN4rlbgXVCmCGWx+ZmJX79OXwkB1cXbdIC005A5IXOHTZ1fm+9SCREZELetidH0b22J
         FWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773149760; x=1773754560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2eD1oCIgFi2ZrcfUmO7jmrn0YazceqbfMakhdVxyNfY=;
        b=Fe8rSQtqPmsLjdk621JYK9BDgvsYJIQNgKbh7MIZObCaSrEqfIwN9yK1umwpUuL1qP
         srEizdjVIecBoh1O/h9cmGf5Ms0Bp2KYkFeuzhHelsN3Y+QTIQIPSwIOXyHDx7pzG/8O
         +FvrS1M9/cmYpKgNThgSSRxUiDqZvQ3x1B4RdqxVvOXh8qp1nSVH8OdDf85gYIdzVYej
         Hn2MfoaK5EQWeR9zXEyfzaf/uKfWv4LhSXLCSRtW918rCW2AwFp5MtYjVj7aZRGmNpF3
         O/yfV6SvtYnG8uya2LtDHXQhnmJRnwqtsbZ6DLtOKYob0Jyl5WtUD5JR5+GadtS2irYe
         ltsA==
X-Forwarded-Encrypted: i=1; AJvYcCW27tBASJdahQNwy2iCsW+H8c9LRjkLA/d+HlvGt+qgvpyzIK9GFlOU8zQyKT8Dli0UMLAucKeuPcPuNdkm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1GjJnzh10Hv8QapkOpnyzckG8A75TkEf6dLN40nvmAJOfOPoJ
	Q5SYmj5mv4rqMMp30Hr8aHodOzSzxgIjr4HrK9mLk3ikmQyC5fSMBQP3RcoIJttvmtvvRFh7lNs
	BpLIYdDrpbg600Mo3+T8O4r+4wO8Qjnc=
X-Gm-Gg: ATEYQzxnFfKGRMa9OPFJVVQOLsMIB9uKBVG/7R0qnlbKZ0mPW2ZXrm+Lnrwf7S7WnUu
	u9/TVuTM96a6LKlywVcIyv3RnjekSUz6lr6eYI/xil354hPeydNL8/sLebneyNCgmD6d2UvKmoB
	PZPm1G3yKGLX7NwhobDnBwG+vJTLXwvKfpsyVVfugnZ0GGcsIxm3OINANMnTLOQOh5iGMTLaXuB
	R1GfOXCuMG1ekvuOfz0ByEPhXTZ5FR7NYUfhYwDJMAYw5hYA9mNKQKv/Uwc+X8Cm996nklzU83x
	XXWOa76eCrDnU8Tt3as=
X-Received: by 2002:a05:690c:6905:b0:796:5a14:87c3 with SMTP id
 00721157ae682-798dd770854mr138151297b3.40.1773149759470; Tue, 10 Mar 2026
 06:35:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aa-6wILF90Y4ndnd@infradead.org> <4215f061-488b-4c2b-98b3-45db4aabed5e@gmail.com>
 <abAXjc6OihRcdoAA@infradead.org> <CALOAHbA3g=UVavYgxJXH_5v0TYMLd6QKUTd=HDbD74Cp+9Kgvg@mail.gmail.com>
 <abAZSCbSEGUhTdUn@infradead.org> <CALOAHbBpAi_FM=odrNkGwXGj1d-ydn=cwURXkUGLawzOMUufuQ@mail.gmail.com>
 <abAa03DO9aLxWcwX@infradead.org> <CALOAHbBoX00_eDLq4X6vTrbdLG5X=9-07jW=Ba+Oa-QjtZX3MQ@mail.gmail.com>
 <abAdr6zqeqSNMJ8X@infradead.org>
In-Reply-To: <abAdr6zqeqSNMJ8X@infradead.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Tue, 10 Mar 2026 21:35:23 +0800
X-Gm-Features: AaiRm50Fbd65P1-T0UNvEp1HOoh8mNf7smm4EQDMrP3_9JePn0mlQKeHVepFm1s
Message-ID: <CALOAHbCmxa0ptYTcq1EjRKMrzvFHCyyrv8CeEDYOhuuo7-QbOw@mail.gmail.com>
Subject: Re: [PATCH v3] module: print version for external modules in print_modules()
To: Christoph Hellwig <hch@infradead.org>
Cc: atomlin@atomlin.com, da.gomez@kernel.org, linux-modules@vger.kernel.org, 
	mcgrof@kernel.org, petr.pavlu@suse.com, samitolvanen@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 382FA251793
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-6012-lists,linux-modules=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laoarshao@gmail.com,linux-modules@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-modules];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,infradead.org:email]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 9:33=E2=80=AFPM Christoph Hellwig <hch@infradead.or=
g> wrote:
>
> On Tue, Mar 10, 2026 at 09:30:06PM +0800, Yafang Shao wrote:
> > On Tue, Mar 10, 2026 at 9:21=E2=80=AFPM Christoph Hellwig <hch@infradea=
d.org> wrote:
> > >
> > > On Tue, Mar 10, 2026 at 09:19:22PM +0800, Yafang Shao wrote:
> > > > Given that the Linux kernel officially supports out-of-tree modules=
,
> > >
> > > It does not officially support them as a first class entity.
> >
> > But out-of-tree modules are still a supported entity by the Linux
> > kernel, correct?
>
> They are not supported, and any support request that includes them is
> typically rejected.
>
> > > It adds overhead
> >
> > Could you please explain what overhead this might introduce?
>
> It adds code that needs to be maintained and which is built into every
> kernel.
>
> >
> > >  to the kernel just for leechers like you that don't
> > > actually contibute their code upstream.  That's always a bad idea.
> >
> > I am not the GPU vendor, so I am unable to upstream the relevant code m=
yself.
>
> Well, that's not the kernels problem.
>
> > By the way, here is a record of my contributions to the Linux kernel
> > over the past few years:
>
> Why would that matter?  You don't get a wild card to do things otherwise
> rejected because you contributed something before.

Could you please explain why I am being characterized as a "leecher"?

--=20
Regards
Yafang

