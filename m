Return-Path: <linux-modules+bounces-65-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E397BDC30
	for <lists+linux-modules@lfdr.de>; Mon,  9 Oct 2023 14:34:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA8671C20975
	for <lists+linux-modules@lfdr.de>; Mon,  9 Oct 2023 12:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 927321428F;
	Mon,  9 Oct 2023 12:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vDcEaXl9"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779211428B
	for <linux-modules@vger.kernel.org>; Mon,  9 Oct 2023 12:34:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E682EC433CB;
	Mon,  9 Oct 2023 12:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696854887;
	bh=1k6rM4lCLYpCX7xu2JGVxkuiNxryABdz8CHGqmNOj/U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vDcEaXl9niuNNqo067jjIO6MMpwKln23++Wm9pOabCws7E3hr5AIWzEFJlCZ9aToo
	 t0b3KY2LRdgWtvBVgnxJC2ixXR00E9T+lTYfAWiKF1FyHYWv4enhFQbfzIkOqaD7fW
	 oN8SQBkK3ZHhos/5QrsPoOSKJWM3wNculCFS62bjPwugJrK142pUuXffm5GCRHn3eq
	 LtI6qiI90GRxvQMB6Y7huX7L8gPAZ8KIYl3eeJN51+3TVgCDod6YDgCnyEdyx6NWAV
	 g/2GI/3tqwDWWPUskI+61MgVlLe552Trk1fnHD9Xhzp5QEqrp97iXZEScLHqcGdCqe
	 ApIYm0cmb4ktA==
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6c49f781855so3040053a34.3;
        Mon, 09 Oct 2023 05:34:47 -0700 (PDT)
X-Gm-Message-State: AOJu0YzERQ6pbqFvy6DfjKmcvAYSoDFrPtQoHMJqVKZvGnZBHQ/4ANfc
	Bx86BIeUlVI58Tix7+ZSs1AgqTif/rcybz1RT5U=
X-Google-Smtp-Source: AGHT+IFIbTz5t8VY6Ya5IBjf6SaeC2Hdeqj8i7oFiUWiND7dZgmlnVzVpWdR/Ce+OQTdLzfG7B4rbmkZQ5DeLtjK5EU=
X-Received: by 2002:a05:6870:a688:b0:1c8:b715:6c81 with SMTP id
 i8-20020a056870a68800b001c8b7156c81mr17805871oam.55.1696854887278; Mon, 09
 Oct 2023 05:34:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231005150728.3429-1-msuchanek@suse.de> <CAK7LNAQh7vCQ859RPkL3SDr2d4ptt5OVCr66fkPKGcvxDUHtkw@mail.gmail.com>
 <20231009085208.GT6241@kitsune.suse.cz>
In-Reply-To: <20231009085208.GT6241@kitsune.suse.cz>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 9 Oct 2023 21:34:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNASeMEKVi5c0PEow5KSdN7rsm7UYEf2smWOSkYOhr_5fVQ@mail.gmail.com>
Message-ID: <CAK7LNASeMEKVi5c0PEow5KSdN7rsm7UYEf2smWOSkYOhr_5fVQ@mail.gmail.com>
Subject: Re: [PATCH rebased] kbuild: rpm-pkg: Fix build with non-default MODLIB
To: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-modules@vger.kernel.org, 
	Takashi Iwai <tiwai@suse.com>, Lucas De Marchi <lucas.de.marchi@gmail.com>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Jiri Slaby <jslaby@suse.com>, Jan Engelhardt <jengelh@inai.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 9, 2023 at 5:52=E2=80=AFPM Michal Such=C3=A1nek <msuchanek@suse=
.de> wrote:
>
> Hello,
>
> On Mon, Oct 09, 2023 at 05:31:02PM +0900, Masahiro Yamada wrote:
> > On Fri, Oct 6, 2023 at 12:49=E2=80=AFAM Michal Suchanek <msuchanek@suse=
.de> wrote:
> > >
> > > The default MODLIB value is composed of two variables and the hardcod=
ed
> > > string '/lib/modules/'.
> > >
> > > MODLIB =3D $(INSTALL_MOD_PATH)/lib/modules/$(KERNELRELEASE)
> > >
> > > Defining this middle part as a variable was rejected on the basis tha=
t
> > > users can pass the whole MODLIB to make, such as
> >
> >
> > In other words, do you want to say
> >
> > "If defining this middle part as a variable had been accepted,
> > this patch would have been unneeded." ?
>
> If it were accepted I would not have to guess what the middle part is,
> and could use the variable that unambiguosly defines it instead.


How?

scripts/package/kernel.spec hardcodes 'lib/modules'
in a couple of places.

I am asking how to derive the module path.




--=20
Best Regards
Masahiro Yamada

