Return-Path: <linux-modules+bounces-5772-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLlsA1W3mGkjLQMAu9opvQ
	(envelope-from <linux-modules+bounces-5772-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Fri, 20 Feb 2026 20:34:45 +0100
X-Original-To: lists+linux-modules@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 655A516A5F4
	for <lists+linux-modules@lfdr.de>; Fri, 20 Feb 2026 20:34:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E47CB303FDF9
	for <lists+linux-modules@lfdr.de>; Fri, 20 Feb 2026 19:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6717D2EDD7D;
	Fri, 20 Feb 2026 19:34:42 +0000 (UTC)
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CCE1C8634
	for <linux-modules@vger.kernel.org>; Fri, 20 Feb 2026 19:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771616082; cv=pass; b=MOKKQ3dkgoN12iVm8l3PEEeJRzyvTyLcJ49MnsclH8vlvAg/55h0os34JjsaxBUbIZRWfAopA8hPECK9AxCxW7TRv6qP1Dhabknpyd4S2swapeVQcrp9ERCnxT9Q4yc06fzq/q4Q7H8Fj6iJjU57JjNzC79hkC4mrGFBrP6FfsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771616082; c=relaxed/simple;
	bh=1Bcsv3Fm8OYwqLXOasgTOeKp0GPI23Bs8/zwK/Kej9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Iq5uEE4Gy9S9tf1RL8HRzVdmq6VYau/zqHC5o1g3k767EuT45eIBF/VoObB5RpFtOszlwcnmGdvshU4fsd5cWH2vP8KFZUlor1YHq4WuAH8xiz8InRL3ak7PjOqRA00TGDaIyP44drGvJGGoHZLKtbbStXhn0hBgtSH0kMvR8q0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chrisli.org; spf=pass smtp.mailfrom=chrisli.org; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chrisli.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisli.org
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64ae222d87dso2354750d50.2
        for <linux-modules@vger.kernel.org>; Fri, 20 Feb 2026 11:34:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771616080; cv=none;
        d=google.com; s=arc-20240605;
        b=aka2qQ6bVWvO9IEpAojClkHGM7Jujgs+jU1GzSSppaT8MYm968E3VoSxm5bDGn3JnI
         mNlVfcXh+lx67a3xmFnSTSkBEsFPOG9tprrFZndDrRUTXHz3j0EVyPFAEQg9VfWQ5fkj
         cx1lJIxXODQxqrAqW+6ffc4BAAADxyOQg9WWyHhreRH2zgpy7w1CZzOVOd4VMnJnt/Rg
         Pb07iMqpDIMNeXe4nkfZfQt9loT34ezgZCW48Pglv3p2N/LtHwJXYmYdcyEiD4V6/JLy
         va7iDhDBr264Kll66ZZyakO6GpPRKi+9hVTDfV443/iyB+vL4LU1kCAYX6kwmzwDGUav
         mczA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=1Bcsv3Fm8OYwqLXOasgTOeKp0GPI23Bs8/zwK/Kej9M=;
        fh=U/TaTc+44hX6RF0H9kNtVCGZZK2bL81peMmBzv+G770=;
        b=i8YhQX9NpszSQpvSNvGNdp+NoQkkmsXJgch66IMoVAePW0KEv+KbKMrUEaA3XHzHc6
         OaiueYJohTwSM6vE5wkHT5moJnq3K7MzD5fHP/strQlJLwGqlbxXHN3HeifM+YgAfQST
         09B7qF4L/d6g0SFm+3H7lMiS46Ceh7UgQqllmXAbGzqHLZofoE1Y+GIVkzySJykqbqBw
         TwV6XXcX9bVK1L62R2kKnaGDaCa7t5HBh90Uhv6RMQ8RlbExpEpo0H21aU65rjg6fYJZ
         AVwnLUOO+SJIm0MRpqizbbSvpqXnjkKRQIARv2oXaLKaxIkzRv6CIv5RibWtOrHfHRy6
         941Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771616080; x=1772220880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Bcsv3Fm8OYwqLXOasgTOeKp0GPI23Bs8/zwK/Kej9M=;
        b=On7WZmuaOd50/88tjBIQnIna0jpTqcXWX4BIXEbf6VsuN4vqn9w+Fj8tSMEhhkofHP
         LvtNKe///6SPu8GawHB56g/nyXZ0STyja0299QMW3LTGLvwrGUXTVIMzz+/z4amSY+s3
         FbRtSibhZEFCbXLbrlO7DQ5wVkchlekQQ4rDcjDY5gbnxCFWM7gyB6ZeBU7Lk92fW/8N
         OjU/3+ISGgzfVuU9C+SmXQ8jDa7KY46vuvuGC4aOdUzyRXd94cY/7R5Jwf3ONJV6hmXo
         Z+NqcBGIUvTrOELKnBvIilV+bqx/pSXMB11biefBqapBaaVA4vhtZ4HuU1TJFTDFcxBS
         p+sg==
X-Forwarded-Encrypted: i=1; AJvYcCXeGBFcU/KyFwsrtN6xYfmFeQ9Lhh9UpUs8CKDnEqrAmtEM3PuxFk3gaH2Tlji0BMpbfxy/LBBWaTD83rEU@vger.kernel.org
X-Gm-Message-State: AOJu0YyqjOSWozBVsMDxCybd40nsf7sFRysLCK59AAUz5P9RVTq8J1IV
	lGHI+t9Qk5sxrpD3z6PlFsOjt0dP83P46MGA7R8nF0YHDRzeUH/m2+ec4nBvTFv380B+po6MhNA
	O5TxEQNJ12ooe5JVqkEXSqQhAZUzEC2D7w2Zjkcf9XA==
X-Gm-Gg: AZuq6aIi47Y9ZBtkO2PHZt3Uz1wQLRLF5q5Tbe0EymRDuu+PSKANxRj0v8JhepI3KAh
	3ppHHUsjvHgc98nC+PTUyY4ApCrEoy4EdDaSAAocVu1vMXsp0/dflSDA5O0Gx3YYoMp6i4V22eZ
	9SnN6aeS1/R5s2iROtIGHGRnXNmHXzqWTJBPciV+7zDvsVD+BsLCiVL3j/+h94SxzSHL8hNBwBS
	bVF2h67hNwLhKbtQK5eHWnxhPlz+ot3RnUupO/A5AVLCpOBsETjvzt2+jsdimbTdWItFZ2uL5C2
	+KUBmW7PkLBD+mQ24byv89oBv9qurAFCV7nLv4PU1FB2H6yQkVH4A7O2Qmm+F4cJc9PhJioaxJn
	xmnS3
X-Received: by 2002:a05:690e:d81:b0:64a:f160:2354 with SMTP id
 956f58d0204a3-64c78e5658bmr757577d50.79.1771616080205; Fri, 20 Feb 2026
 11:34:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219-fix-builtin-strlen-v1-1-3ec3efc0cda7@samsung.com>
 <CABCJKuf8jh_yxQcR1=uMeuWOueXyoM5=L-QpTuBenRi_MZK_Gg@mail.gmail.com>
 <aZdAxZR-c8PY_uEL@macos> <CACePvbU9Dh-caC59+L7wicZF+3sMjc4NC0HEkp9cVa7qqdydow@mail.gmail.com>
 <aZdighmTJN-JaijL@smile.fi.intel.com> <CACePvbWpC7o-Du=pr4Cfn-pM_XcOM1v+6cHb5mqaaEvzsvMX=Q@mail.gmail.com>
 <aZgbw40qk2zIRpbE@smile.fi.intel.com>
In-Reply-To: <aZgbw40qk2zIRpbE@smile.fi.intel.com>
From: Chris Li <sparse@chrisli.org>
Date: Fri, 20 Feb 2026 11:34:29 -0800
X-Gm-Features: AZwV_QjMrv0_Kf8LpzTob_omqayDaD81buOZ4DLJ5VxqWVmTOoHlvQpZWf0Hu7I
Message-ID: <CACePvbU5ByoP2jZZSHYWCncNNXOQXArvyWpVcinTRag8k3-GiA@mail.gmail.com>
Subject: Re: [PATCH] builtin: mark __builtin_strlen() as integer constant expression
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Daniel Gomez <da.gomez@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Sami Tolvanen <samitolvanen@google.com>, linux-sparse@vger.kernel.org, 
	Aaron Tomlin <atomlin@atomlin.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Eric Biggers <ebiggers@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	"Luck, Tony" <tony.luck@intel.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5772-lists,linux-modules=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[chrisli.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,zeniv.linux.org.uk,google.com,vger.kernel.org,atomlin.com,linaro.org,gmail.com,intel.com,suse.com];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sparse@chrisli.org,linux-modules@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.972];
	TAGGED_RCPT(0.00)[linux-modules];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 655A516A5F4
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 12:31=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Fri, Feb 20, 2026 at 12:06:15AM -0800, Chris Li wrote:
> > On Thu, Feb 19, 2026 at 11:20=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > >
> > > On Thu, Feb 19, 2026 at 09:06:23AM -0800, Chris Li wrote:
> > > > On Thu, Feb 19, 2026 at 9:00=E2=80=AFAM Daniel Gomez <da.gomez@kern=
el.org> wrote:
> > > > >
> > > > > Can you please take a look? If Al patch is the correct approach, =
any
> > > > > chance you can send it and fix this?
> > > >
> > > > I am asking in another thread should I pull Al's git repo instead.
> > > > There are a few good commits there.
> > >
> > > Please, pull Al's work, My colleagues and I use his version of sparse=
 for a few
> > > weeks without noticing any downsides.
> >
> > Thanks for the heads up. I just pulled Al's sparse repo.
>
> Can you also issue a new tag (say 0.6.5) so the distros can really be pus=
hed to
> update the quite outdated sparse in their repos?

Sure. I can give it a spin this weekend and keep you posted. There is
one risk on my signing key, it might be expired and I need to sort
that out.

Meanwhile, please give the current sparse repo some good tests.

Chris

