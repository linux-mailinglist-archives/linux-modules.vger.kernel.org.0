Return-Path: <linux-modules+bounces-2672-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3829DB1C3
	for <lists+linux-modules@lfdr.de>; Thu, 28 Nov 2024 04:15:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72D0A281214
	for <lists+linux-modules@lfdr.de>; Thu, 28 Nov 2024 03:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8246E84D29;
	Thu, 28 Nov 2024 03:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IjzC4fGH"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DC735280;
	Thu, 28 Nov 2024 03:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732763728; cv=none; b=bAKQmXaFHoG0DBcjfVWxgF2yh9KzmWeRCbMC38i7SrorkCk3kLhRRy7MGk5EaE+XvlTpDQP34VT71AtKIWlYVRn16Ogt8hNIhjp5c1hIefYK+bPobPd6LZ899BLz3GYfyS2mI5/ndc5rN41ZWqVbB/Z31dY89SRWY7az5RBF6RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732763728; c=relaxed/simple;
	bh=3KPORSOgye9V7mlhDMwS8f+UOYgTd3WwJRxNqx/RErg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b+43VtFauC0aTq0aLcItSMLGv0QE8k5Ptf9LfQOFz9SD/a4BSFAaw80gBhpLAySt/Lb2ihX+M0SLrqmv8Wnpiv0c1A48LUkuIDonqvdo2HvElmX9wqS2fQqCFKEOtLsZKOOP2S7HscHf39m38TKrwbDi7sPkw5kneJqtx5v6gVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IjzC4fGH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 022AEC4AF09;
	Thu, 28 Nov 2024 03:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732763728;
	bh=3KPORSOgye9V7mlhDMwS8f+UOYgTd3WwJRxNqx/RErg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IjzC4fGHB94VFLl/fkWo2opcDPRDQqLhrVht0Uctaql5LCTlr+/q3jsLNDUlYZ3w+
	 lv6ChxBRNM0Va0VHIQEJS8ob2wqt/X4GxQoSCxcM5ex4GEAJp0yyDcjW2KCcU2/rac
	 ZNJ8cPq3+mrQRhvMsX2yt3DQnkA6HmK55FD9QKRWK1flQZAktQyJ0Ts7Xb12OYB6Al
	 XhqwIAdUrLhYrQH5UdJIwT9APvbe6CL+nLK+31xUkNA8GZKOQn5c4Fa5AYvv7CqKdV
	 tcIqFklq3E0myHCCw4d/nrBu4JGprbFIGG9jc7cGi81hj2kt0HdIoGtl9IRK7h2B9R
	 TFrRlstBdT8cA==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ffa8092e34so3866231fa.1;
        Wed, 27 Nov 2024 19:15:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVnnrhvAmM6avNEuk0RJuV6lw7gRKtG4V4zP/u1yHCh7SVa41CJV/wq2rKcj4LaB+nZhnzLRFz9Tr3YDCE=@vger.kernel.org, AJvYcCWeDI1sWOUA4u7OdXAnsw4BPlZOSueCpTrpyDOoq6o93Y0UxmdueBNsFoHvAHjiP8XW879VeFtKceJmSkvkBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJuBbKjO7dOjvsjscNckSeMLQNZnCLinTkUN7wLBzzMcoV5Ypd
	T+Gtf9Y5gZusurHsFNkCvM9PAV56MhPdfzOP+opo5NDfjdPk5muRzupi9O9mhnbls4F2BB9ETqR
	L+dZcit7+lHIKaDbnNGXrvUoFiUY=
X-Google-Smtp-Source: AGHT+IGbhHQ1ENBEVbV70RiDRFMrbSKM8OMvLunCuqf6c2DKpLb9Pv0BjaaGl3vtNJ4IMAJVjVQO2JmT/KgCYg5/OFo=
X-Received: by 2002:a05:651c:2211:b0:2fa:c18c:faba with SMTP id
 38308e7fff4ca-2ffd60de22fmr29525351fa.30.1732763726655; Wed, 27 Nov 2024
 19:15:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z0ZxiLw9hauUynTS@bombadil.infradead.org> <CAHk-=wjCkJsdLageTx6C4n--aYFoO6gSRe0Rwcbk1jQdOdiPfg@mail.gmail.com>
 <Z0eeuCyUGcKgsc5h@bombadil.infradead.org> <Z0eqiayuv1w4a_dc@bombadil.infradead.org>
 <CAHk-=wj+imfGvW73XoYn60bAMzRtPfXFqwFTUqBoEq4=u5_oUg@mail.gmail.com>
 <Z0fT4hC30NISjmi_@bombadil.infradead.org> <Z0fYqZutUzDdxTGf@bombadil.infradead.org>
 <CAK7LNARDwBmvKY4fDmr5K=WLEvWLhFgg50ibu7etJykiRxohOA@mail.gmail.com>
 <Z0fdX6i3inNVJf-e@bombadil.infradead.org> <Z0ffD62YLuVVrCGR@bombadil.infradead.org>
In-Reply-To: <Z0ffD62YLuVVrCGR@bombadil.infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 28 Nov 2024 12:14:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNASj1j5xSP2Df88h2nRUxMbX1WkshrVXdZCa3hrRuOnNkg@mail.gmail.com>
Message-ID: <CAK7LNASj1j5xSP2Df88h2nRUxMbX1WkshrVXdZCa3hrRuOnNkg@mail.gmail.com>
Subject: Re: [GIT PULL] Modules changes for v6.13-rc1
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, samitolvanen@google.com, 
	petr.pavlu@suse.com, da.gomez@samsung.com, linux-modules@vger.kernel.org, 
	patches@lists.linux.dev, linux-kernel@vger.kernel.org, mmaurer@google.com, 
	arnd@arndb.de, deller@gmx.de, song@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2024 at 12:10=E2=80=AFPM Luis Chamberlain <mcgrof@kernel.or=
g> wrote:
>
> On Wed, Nov 27, 2024 at 07:02:55PM -0800, Luis Chamberlain wrote:
> > I did. Multiple times.
>
> I've split this up now in 2 parts, one with your fixes and then the
> other boundary fixes which are not related.
>
> From 8e4c903fa3079e1c05c9585f78c57e8067024d99 Mon Sep 17 00:00:00 2001
> From: Luis Chamberlain <mcgrof@kernel.org>
> Date: Wed, 27 Nov 2024 14:10:57 -0800
> Subject: [PATCH 1/2] selftests: kallsyms: fix double build stupidity
>
> The current arrangement will have the test modules rebuilt on
> any make without having the script or code actually change.
> Take Masahiro Yamada's suggested fix and cleanups on the Makefile
> to fix this.
>


Fixes: 84b4a51fce4c ("selftests: add new kallsyms selftests")

> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>

Closes: https://lore.kernel.org/all/CAK7LNATRDODmfz1tE=3DinV-DQqPA4G9vKH+38=
zMbaGdpTuFWZFw@mail.gmail.com/T/#me6c8f98e82acbee6e75a31b34bbb543eb4940b15



--=20
Best Regards
Masahiro Yamada

