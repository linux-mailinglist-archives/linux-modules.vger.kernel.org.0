Return-Path: <linux-modules+bounces-350-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D3482D9C0
	for <lists+linux-modules@lfdr.de>; Mon, 15 Jan 2024 14:14:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B417E1C21941
	for <lists+linux-modules@lfdr.de>; Mon, 15 Jan 2024 13:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66968168D0;
	Mon, 15 Jan 2024 13:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="blW/LIOh"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DD315AF6
	for <linux-modules@vger.kernel.org>; Mon, 15 Jan 2024 13:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CC23E3F2C6
	for <linux-modules@vger.kernel.org>; Mon, 15 Jan 2024 13:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1705324202;
	bh=AcIwXn1d2qZsb7Cb9AUdojeFFR71C06twk+hvG9aBtY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=blW/LIOhfPYfSlyu2dBrEe/XtcQjbHn6rMT1xt4SajvPV8VhUgJrezbZu2Wrq31m+
	 KGVd6buFuBm8FP4/IDccnjrGCv4zlXClZ+WbMCH2WXYSBiACnlMumCHvhde3glzsWb
	 P01DPqt+O1NGzULocyMn3DQk6TKS+yn60WmdVSruTfsryB9UqMxB0mlpHiiv8YEgxo
	 ZMyOcgesYv6hNJ/YukD7zsXNxinIMQo3IwQab1k/nwNH5p1pJfzQmk8zZzkJ2yPJIp
	 NEOikFdy+HriD00ak6zUVrwjQusS9cRwqhU0oiTrjVlxsqGMEHcqiTRvLzMWBpR+rw
	 zl2CtDHulxKgQ==
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3368698efbdso4642527f8f.0
        for <linux-modules@vger.kernel.org>; Mon, 15 Jan 2024 05:10:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705324202; x=1705929002;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AcIwXn1d2qZsb7Cb9AUdojeFFR71C06twk+hvG9aBtY=;
        b=HMgj0K8j1qa5Ks/+qikrz+EqVmKpFLu/J9uQ7X8pF+J3YDmJg0O1AmXTdpO1Chj/Ol
         Zhuq84zXjYxVs+ign7kLK1hjs+R48ze22e971E//G09Kg1SdLeAMAjJYjOtrm2+/Z87s
         aPdG2onmY9MsxUFKXSrcwfAP9PmLKGEjx/Q9PshZvHlG/PdjBw/KAbU+YU7BDwcMcgq2
         Tv+yHiD/G7IaPsuzNp5EjIxta4hQE2XiAmeNHqVudvs2UKPWy8zOyWPtdnqcn+UFE4rx
         Uqov6GWnI4M/G4aOd4JH2umd8vNw2TKXHpzbjB+ax0KzMWiTt5y4AdG4Zk1xm01hITsS
         JMqw==
X-Gm-Message-State: AOJu0YziayZZRFcsGU7AJ1Q7Xt/N4AHbj1+3vwgQIW1td9/5JIKly6E/
	J2F2PnNRN35O9z0bJNjVXGWf3mIhIuSAW2FdUyxBu4ZGPA53b+tYMNibw4RGqPFpW261YSWz2BM
	f2WSRczlQJuQ6yap7J5z+e8qFRRhu9gRo/3ElluX8rZFctvAeUl0JCbe/pYfO6qrJ0g==
X-Received: by 2002:a05:6000:91:b0:336:c963:2741 with SMTP id m17-20020a056000009100b00336c9632741mr3120076wrx.11.1705324202087;
        Mon, 15 Jan 2024 05:10:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGThona9/dG9cixAYReEvvBT7Fkev1DrZxFLEbmsIJhitxPNn/3cKkdZCFzUDrjucsduTRFBVt0chcSgXFxk0=
X-Received: by 2002:a05:6000:91:b0:336:c963:2741 with SMTP id
 m17-20020a056000009100b00336c9632741mr3120066wrx.11.1705324201745; Mon, 15
 Jan 2024 05:10:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <E1rNVlL-000qDm-Pg@rmk-PC.armlinux.org.uk> <ZaUo7ctf5H/qqqkG@shell.armlinux.org.uk>
In-Reply-To: <ZaUo7ctf5H/qqqkG@shell.armlinux.org.uk>
From: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Date: Mon, 15 Jan 2024 13:09:25 +0000
Message-ID: <CADWks+a7jBSqWZh-MJSp9x8vTUFvzu6c2GTHc8eQaMNE5VDrQg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: detect depmod version to exclude new SHA3 module
 signing options
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jan 2024 at 12:45, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> Ping?
>

The intent is good.
The implementation is incomplete.

Please respond or address review feedback emailed previously. See
https://lore.kernel.org/all/CADWks+Z5iZ=P_OAanA-PiePFbMpwtRe3_dF8wRTak8YAi87zvQ@mail.gmail.com/#t

> On Wed, Jan 10, 2024 at 10:24:43AM +0000, Russell King (Oracle) wrote:
> > When using the SHA3 module signing options, kmod 28 segfaults during
> > "make modules_install" on the build host.
> >
> > When running depmod under gdb, it reports:
> >
> > Program received signal SIGSEGV, Segmentation fault.
> > __strlen_sse2 () at ../sysdeps/x86_64/multiarch/strlen-vec.S:133
> >
> > Therefore, SHA3 can't be used on a build system with an old kmod. Add
> > a script to retrieve the version of depmod, and use that in the Kconfig
> > to determine whether the SHA3 options should be made available.
> >
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> > I don't know what the minimum requirement is for SHA3 to work, so I have
> > chosen a minimum of version 29 for the purposes of this patch.
> > ---
> >  kernel/module/Kconfig     |  8 ++++++++
> >  scripts/Kconfig.include   |  3 +++
> >  scripts/depmod-version.sh | 11 +++++++++++
> >  3 files changed, 22 insertions(+)
> >  create mode 100755 scripts/depmod-version.sh
> >
> > diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
> > index 0ea1b2970a23..d2ba454026a9 100644
> > --- a/kernel/module/Kconfig
> > +++ b/kernel/module/Kconfig
> > @@ -223,6 +223,11 @@ config MODULE_SIG_ALL
> >         Sign all modules during make modules_install. Without this option,
> >         modules must be signed manually, using the scripts/sign-file tool.
> >
> > +config DEPMOD_VERSION
> > +     int
> > +     default $(depmod-version)
> > +     default 0
> > +
> >  comment "Do not forget to sign required modules with scripts/sign-file"
> >       depends on MODULE_SIG_FORCE && !MODULE_SIG_ALL
> >
> > @@ -250,14 +255,17 @@ config MODULE_SIG_SHA512
> >
> >  config MODULE_SIG_SHA3_256
> >       bool "Sign modules with SHA3-256"
> > +     depends on DEPMOD_VERSION > 28
> >       select CRYPTO_SHA3
> >
> >  config MODULE_SIG_SHA3_384
> >       bool "Sign modules with SHA3-384"
> > +     depends on DEPMOD_VERSION > 28
> >       select CRYPTO_SHA3
> >
> >  config MODULE_SIG_SHA3_512
> >       bool "Sign modules with SHA3-512"
> > +     depends on DEPMOD_VERSION > 28
> >       select CRYPTO_SHA3
> >
> >  endchoice
> > diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> > index 5a84b6443875..052f581c86da 100644
> > --- a/scripts/Kconfig.include
> > +++ b/scripts/Kconfig.include
> > @@ -63,3 +63,6 @@ ld-version := $(shell,set -- $(ld-info) && echo $2)
> >  cc-option-bit = $(if-success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/null,$(1))
> >  m32-flag := $(cc-option-bit,-m32)
> >  m64-flag := $(cc-option-bit,-m64)
> > +
> > +# depmod version
> > +depmod-version := $(shell,$(srctree)/scripts/depmod-version.sh)
> > diff --git a/scripts/depmod-version.sh b/scripts/depmod-version.sh
> > new file mode 100755
> > index 000000000000..32a8a6f6b737
> > --- /dev/null
> > +++ b/scripts/depmod-version.sh
> > @@ -0,0 +1,11 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +set -e
> > +
> > +: ${DEPMOD:=depmod}
> > +
> > +# legacy behavior: "depmod" in /sbin, no /sbin in PATH
> > +PATH="$PATH:/sbin"
> > +
> > +LC_ALL=C "$DEPMOD" --version | sed -n '1s/kmod version //p'
> > --
> > 2.30.2
> >
> >
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!



-- 
Dimitri

Sent from Ubuntu Pro
https://ubuntu.com/pro

