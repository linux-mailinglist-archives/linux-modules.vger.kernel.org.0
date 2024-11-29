Return-Path: <linux-modules+bounces-2671-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B20D9DB1BF
	for <lists+linux-modules@lfdr.de>; Thu, 28 Nov 2024 04:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C59FB282585
	for <lists+linux-modules@lfdr.de>; Thu, 28 Nov 2024 03:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3103F84D29;
	Thu, 28 Nov 2024 03:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LY3qBKXI"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A8583CC7;
	Thu, 28 Nov 2024 03:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732763607; cv=none; b=j4YT+v7qD93tURlh73Hmqs0hK5DkAR3XtdSgJEmh/HgWtiMlszIlmWfUZoJAPYZYAjtQW2SmaGtxcdhByftjra0Co/QaccNYEKwn5DDp1N/HOLrL7J/0nyt8bqkAoTBMK+b6ObJtnxb9+5QkfjCYmV1oiUDC/jGELjiSqfpvLkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732763607; c=relaxed/simple;
	bh=UFLk8rPK1RtT/idJq/5jJ5geJVIHGweZM4Y4cO/h1uQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J8wzXTMlmFSs9opYoPrMkF7v/WhWiz4NI/dgjc3zsDlAVw4KorMIYuT9Ex6sAW6GTxh+TZTYysTLms0GrkwiA+5l5npanFL6jj626vd2njAhgxWK8TlBIhW4ey0+OJqihqw85Id1j2YVlPzjLiriWCDGd8+UbbxnjolpVrMrOpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LY3qBKXI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77A2BC4CED3;
	Thu, 28 Nov 2024 03:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732763605;
	bh=UFLk8rPK1RtT/idJq/5jJ5geJVIHGweZM4Y4cO/h1uQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LY3qBKXIIeTE97iUkCo74GkmPJedYcIvfHsyAoUMtYxOkXtFVHDzPoQ4LJIypWChs
	 8mcoXeQQV9Z1j4DQ4eDTCE5E/1nJmPOeax+5oIybdoX+pt4zmk3MzOmnfd7kt97YTa
	 vooLuIM08IRo7PF8zBJPmGtiEnrj80iAp+6VuC49sLuQv4faOX7YL1o5sy4WSHmfyJ
	 HuiiwRqBbnsrJ6wWjyrODgniByVlfOnYkWx63MZnXoB7BDixuUlX8C5vDKsxeMWkkS
	 YDTBMHyoMbbcWctP1pKeTylRp4dAPWBV7Q1vtwC//MrStzt7H0pkdfT5YTC7AVFGRd
	 cRvtdZCaV+u6w==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53de101525eso1416096e87.0;
        Wed, 27 Nov 2024 19:13:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUrGGA7RcmNMPYc0iVXM2TnlpH2Ul45rBXvl5SQTj1lBsyvP6hRL0NB4UqevNgtfvFTcmJK8J6ljofnFcc=@vger.kernel.org, AJvYcCW5b2dZtS9GxFLACsOVEUeIr9GfkDPua83tqQD2WcBU7nN+tpIBGY4tQ8ChSdo67WOQIARkgVrYBsmnes5EqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJKefoQfKPZC/s3bhrdG6UHK+fzCcSYc6hXpv0horNck9by9v5
	lV7CYyPhBijO6MMfxO/EQfueRYsJwixuGa9r1uc40fHrkQpZEJ5fbDY4suiOVLEEFzSCp9cqXRU
	00Oat5tYMOPmLhIJqVX+9fg7ZLbU=
X-Google-Smtp-Source: AGHT+IHUT8HpoofJqEenApBBB27WO/TnvkeVPVP4VFB7/l17cTm+uG9hV9l/bgA5hrGmmHBIzkPNn0qjfhuXzV1f0+Y=
X-Received: by 2002:a05:6512:401b:b0:53d:f6bc:23ec with SMTP id
 2adb3069b0e04-53df6bc24a4mr98334e87.5.1732763604117; Wed, 27 Nov 2024
 19:13:24 -0800 (PST)
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
 <CAK7LNARDwBmvKY4fDmr5K=WLEvWLhFgg50ibu7etJykiRxohOA@mail.gmail.com> <Z0fdX6i3inNVJf-e@bombadil.infradead.org>
In-Reply-To: <Z0fdX6i3inNVJf-e@bombadil.infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 28 Nov 2024 12:12:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNASx_oMzhGmgdePy5YHSAm6y4W_yfgr4LKsB6k-PH=6Vdw@mail.gmail.com>
Message-ID: <CAK7LNASx_oMzhGmgdePy5YHSAm6y4W_yfgr4LKsB6k-PH=6Vdw@mail.gmail.com>
Subject: Re: [GIT PULL] Modules changes for v6.13-rc1
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, samitolvanen@google.com, 
	petr.pavlu@suse.com, da.gomez@samsung.com, linux-modules@vger.kernel.org, 
	patches@lists.linux.dev, linux-kernel@vger.kernel.org, mmaurer@google.com, 
	arnd@arndb.de, deller@gmx.de, song@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2024 at 12:02=E2=80=AFPM Luis Chamberlain <mcgrof@kernel.or=
g> wrote:
>
> On Thu, Nov 28, 2024 at 11:56:44AM +0900, Masahiro Yamada wrote:
> > On Thu, Nov 28, 2024 at 11:42=E2=80=AFAM Luis Chamberlain <mcgrof@kerne=
l.org> wrote:
> > >
> > > Now with Masahiro's cleanups, in my testing we don't need the FORCE a=
nymore.
> > >
> > >
> > > From 83497e0e83d81950df54d82461b1dae629842147 Mon Sep 17 00:00:00 200=
1
> > > From: Luis Chamberlain <mcgrof@kernel.org>
> > > Date: Wed, 27 Nov 2024 14:10:57 -0800
> > > Subject: [PATCH v3] selftests: kallsyms: fix double build stupidity
> > >
> > > Fix the stupid FORCE so that re-builds will only trigger
> > > when really needed. While at it, document the sensible ranges
> > > supported and fix the script to accept these alternatives.
> > >
> > > Also adopt Masahiro Yamada's suggested cleanups on the Makefile.
> > >
> > > Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> > > Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> >
> >
> > Did you run any compile-test before submitting this?
>
> I did. Multiple times.

$ touch lib/tests/module/gen_test_kallsyms.sh
$ make

  or

Try full building from a clean state.




>
> > if_changed requires FORCE.
> > Your patch introduces new warnings.
> > mkdir -p /home/masahiro/ref/linux/tools/objtool && make
> > O=3D/home/masahiro/ref/linux subdir=3Dtools/objtool --no-print-director=
y
> > -C objtool
> >   INSTALL libsubcmd_headers
> >   CALL    scripts/checksyscalls.sh
> > lib/tests/module/Makefile:12: FORCE prerequisite is missing
> >   GEN     lib/tests/module/test_kallsyms_a.c
> > lib/tests/module/Makefile:12: FORCE prerequisite is missing
> > lib/tests/module/Makefile:12: FORCE prerequisite is missing
> >   GEN     lib/tests/module/test_kallsyms_b.c
> > lib/tests/module/Makefile:12: FORCE prerequisite is missing
> >   GEN     lib/tests/module/test_kallsyms_c.c
> >   GEN     lib/tests/module/test_kallsyms_d.c
> >   CC [M]  lib/tests/module/test_kallsyms_a.o
> >   CC [M]  lib/tests/module/test_kallsyms_b.o
> >   CC [M]  lib/tests/module/test_kallsyms_c.o
> >   CC [M]  lib/tests/module/test_kallsyms_d.o
>
> Odd, I didn't see them. Anyway, I'll just take your Makefile fixes,
> thanks.
>
>   Luis



--=20
Best Regards
Masahiro Yamada

