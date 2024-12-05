Return-Path: <linux-modules+bounces-2709-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B96899E5A40
	for <lists+linux-modules@lfdr.de>; Thu,  5 Dec 2024 16:52:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74312287B4D
	for <lists+linux-modules@lfdr.de>; Thu,  5 Dec 2024 15:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D92C21D585;
	Thu,  5 Dec 2024 15:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dc+vz+Zi"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3011DACA8
	for <linux-modules@vger.kernel.org>; Thu,  5 Dec 2024 15:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733413954; cv=none; b=mrTy8O8EylfVdL6OA8Fsm8fuuMAk6WY6FuVR/RZdNSt0SDO7KYnYVNie/d2D/76YgCoOjtWF1hfSDXxNqg/uNoiYlZcqPR4u4T36WeNjb/aPvou+0N/li8aT8n+Yu8cleDB0MwBsCq3WetJc6yKtQl8GxlbOs7rB2NSepxWYT0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733413954; c=relaxed/simple;
	bh=Kij0pMFjp1FIZECulBkulJhs69DMxK/+RRr1dTBi8Mg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ivyT9lrmL6Pp7wwW4YRemdZy1ZL+owLdmwKnhAak1TN7VIgQhyBZQ9Q6ltUojMsJhAvEB4BwQamggjKIJIaUvW1nhRewqNpKJcKuUCh0MtcikYNa+ylWZlT6Y037s1cboK7M3kfzw2IKDSJ9advtB42IzZYq6zR8oh0LJxUE++U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dc+vz+Zi; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d1228d66a0so9962a12.1
        for <linux-modules@vger.kernel.org>; Thu, 05 Dec 2024 07:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733413950; x=1734018750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vEZhIBbCBW5mV7dogz2EkqQC7Av8Las6Bo0OJgolYbA=;
        b=dc+vz+ZidA4fziyKq7m9Gz/ilKT/1b6MewlT/L7QWKMvRxKWt9FkDY3r1hBtd6mVPp
         BSJZ1LoosdiJ1DhfYNyP5H8ER+t0X1Fqizgspz4ChX0soXLTtFfzzvxe4wKPp8K4Tu7D
         uzPGy/BEvY5xu3MFGDoavb1ygNoqzc3lNA1EakpMw4CjreT5taBZSOwihGrFQwlPbBds
         li1UpGrbBHfor3l8bZSqfeh5Xp8tQ7aL5CA5zDsslA/b/4uJczMpNdoWW/z+ap6V4ASI
         uo63z4vRQxd3wsl1OMwvCUhLLsNNz/n6CTf4KAN+RQ+/lkVIw2CGpgg7Gq0YKa+NISus
         sO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733413950; x=1734018750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEZhIBbCBW5mV7dogz2EkqQC7Av8Las6Bo0OJgolYbA=;
        b=o2HHeMMPAtTlhvj+6XvJcAZ8TFz2WEBGC5pApbBkUpGQngRYQywH4ib2BCu8fthhBT
         i4MqRNGkQKt3//hZPwXk8cfemHf5Aj+JfFmcntei4vW2dDhXAbTUlNXyIFv84U5gVPHx
         wFjYnctx1Gp7vT0AFwDnONEJSoX0E7yePmDl8d0fCtWEo5yWqxuX+2HGmbAEPl6bWPGF
         oWtLGTeJOCDKueCc488CYYklrXTK6QJXvmxj/sP35m5IzExZ0RvPKo5xuaCSa7jzTZaL
         XCv6Iu1UWhuwCKM6Qq/M5BvVx8MLpWxExC/SZP0ALslGBbzAWgynGDmPkZgdAp1eVyOc
         IrAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE1X9JMVSQmfoG/wj6SDaSSZ7VTxIPP7Sz2WjLKEeiXnf85kxDEt4yvZbi9h2TfffDYoWgeu51/z1IeT9u@vger.kernel.org
X-Gm-Message-State: AOJu0YzXo+zK4LIJO+y8xGtbSHUvy3z5kI13TDpLLNPWiogQAXVB9M9Q
	5U0RqM+t0XGf+6L5/nPGkJvQJZR+BDKYrirZoHRNdKm9EwjSbdSQwqZdxP8lliIYq8opX9l1kl6
	FpksztEApTEnXIswoNlFpZyGcwksFTSFhv7JF
X-Gm-Gg: ASbGncv5tK/xF4Ymm0LKKO5+1x5B5weWkY+2gwNSBN7BxqPQf7ziUlR3ATRsG4hXNM2
	4D4lV89FFlkG4LhOh7kbYnS5yQ+Bl/dT+
X-Google-Smtp-Source: AGHT+IFBiLz78aKLQ7PSRqfnfxVbdQRhB246a3JGCkTy/Nk+EAvR/wwPlsqF9sjCkYVRcSQoJuYGGxEhlRPuON1Kgqo=
X-Received: by 2002:a50:ed99:0:b0:5d0:b20c:205c with SMTP id
 4fb4d7f45d1cf-5d13514ed50mr87120a12.5.1733413949872; Thu, 05 Dec 2024
 07:52:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com>
 <20241121204220.2378181-21-samitolvanen@google.com> <Z0UIdmDHYQtUTR1i@bombadil.infradead.org>
 <CAK7LNATK9rSm4AUSneq=aYbADatPL=1eUXuYRChX+WU+zNTyKw@mail.gmail.com>
 <Z0YS1hVWuozpN4Ln@bombadil.infradead.org> <CAK7LNARcECiG0TAJFmFDhmbgzQiETX0i-_mr3StDAUiGTjKnLA@mail.gmail.com>
In-Reply-To: <CAK7LNARcECiG0TAJFmFDhmbgzQiETX0i-_mr3StDAUiGTjKnLA@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 5 Dec 2024 17:51:52 +0200
Message-ID: <CABCJKuep1Fk22rpxcZbFzD0_Dhp+1Oonz123jHs8WkNKjQaekA@mail.gmail.com>
Subject: Re: [PATCH v6 01/18] tools: Add gendwarfksyms
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Dec 5, 2024 at 5:46=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> On Wed, Nov 27, 2024 at 3:26=E2=80=AFAM Luis Chamberlain <mcgrof@kernel.o=
rg> wrote:
> >
> > On Tue, Nov 26, 2024 at 12:50:48PM +0900, Masahiro Yamada wrote:
> > > On Tue, Nov 26, 2024 at 8:30=E2=80=AFAM Luis Chamberlain <mcgrof@kern=
el.org> wrote:
> > > >
> > > > On Thu, Nov 21, 2024 at 08:42:22PM +0000, Sami Tolvanen wrote:
> > > > > Add a basic DWARF parser, which uses libdw to traverse the debugg=
ing
> > > > > information in an object file and looks for functions and variabl=
es.
> > > > > In follow-up patches, this will be expanded to produce symbol ver=
sions
> > > > > for CONFIG_MODVERSIONS from DWARF.
> > > > >
> > > > > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > > > > Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
> > > > > ---
> > > > >  kernel/module/Kconfig                 |   8 ++
> > > > >  scripts/Makefile                      |   1 +
> > > > >  scripts/gendwarfksyms/.gitignore      |   2 +
> > > >
> > > > This doesn't add scripts/gendwarfksyms to MAINTAINERS
> > > > but then again   scripts/genksyms/ is not there either
> > > > but it does got to Masahiro.
> > >
> > > scripts/genksyms/ is a very old tool with no maintainer.
> > >
> > > It defaults to the maintainer of the scripts/ directory (i.e. me)
> > >
> > > > Masahiro, should we just add both to KERNEL BUILD and add
> > > > Sami as a Reviewer to help with gendwarfksyms?
> > >
> > > I think it is better to have a separate entry for
> > >
> > > F:  scripts/gendwarfksyms/
> > >
> > > with Sami as the maintainer.
> >
> > OK do you want this and the extended modversions to go through your tre=
e
> > or modules tree?
> >
> >   Luis
>
>
> I guess I can pick up them.
>
> I was just thinking about a possibility to
> make this (and the other one) less worse.

Note that I'm planning to send out v7 with the recent feedback
addressed ~mid-December when I'm back in the office, and I'm sure Matt
is also happy to make any improvements to his patches that you have in
mind.

Sami

