Return-Path: <linux-modules+bounces-63-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 614177BD53D
	for <lists+linux-modules@lfdr.de>; Mon,  9 Oct 2023 10:31:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1348E281558
	for <lists+linux-modules@lfdr.de>; Mon,  9 Oct 2023 08:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87380800;
	Mon,  9 Oct 2023 08:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="guH2wMSM"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67649156EB
	for <linux-modules@vger.kernel.org>; Mon,  9 Oct 2023 08:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8368C433C9;
	Mon,  9 Oct 2023 08:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696840299;
	bh=k+U5O8rSw/WBFMKyCVGOfUbLEx6tf3XN/L5MZF6Uqa8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=guH2wMSMUCza3wYp4jOLA4YfzvWfYqkGW81raiiNvQHQOOEV4YZXjnvxFarx6CHKG
	 SCkKgmu4jAhc5Pefo7U7YVY4WrYLt4k412V1VX5x8ezqj8LeZ8p7ws1oOHgAE8uRUG
	 zEia8CD6OGSiQJSFXr7i1OWWN/bVENARFtqkvrm5E51Q/FVvWQ1uvKXbMwOWhFCFMl
	 N4IzEYECZV6gD3WoOPuyljoD07eSh1WYrsIpqW+aCKqYwAt8vfV18XhKiLpMi/YKxv
	 GyyKWECp96fexe8ZEQf8DhUmo2mRldh1JSo8MP7X4dQQRrKMBWVvxX3l3SCNQr9fU7
	 u28yDYbpsWBnw==
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3af64a4c97eso2415831b6e.2;
        Mon, 09 Oct 2023 01:31:39 -0700 (PDT)
X-Gm-Message-State: AOJu0YwqJ2qETXzalIgEi5VNjb2GZDnpYW6+jiC1YKj0Wm6dRCN4J7w8
	HbJ5zT44pKa86miee5r7XyWVPTeNGM6XLX1o2n0=
X-Google-Smtp-Source: AGHT+IFRkq0Z5e5o/4ftogKUePolTKBpPtT85HqjlKijj4ZEXvwYnMDnF92iO4aDuyOtNzU+UBT5uxn3uoWUnAkBHAM=
X-Received: by 2002:a05:6870:8a0b:b0:1bf:5b4:4a51 with SMTP id
 p11-20020a0568708a0b00b001bf05b44a51mr13909865oaq.58.1696840299192; Mon, 09
 Oct 2023 01:31:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231005150728.3429-1-msuchanek@suse.de>
In-Reply-To: <20231005150728.3429-1-msuchanek@suse.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 9 Oct 2023 17:31:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQh7vCQ859RPkL3SDr2d4ptt5OVCr66fkPKGcvxDUHtkw@mail.gmail.com>
Message-ID: <CAK7LNAQh7vCQ859RPkL3SDr2d4ptt5OVCr66fkPKGcvxDUHtkw@mail.gmail.com>
Subject: Re: [PATCH rebased] kbuild: rpm-pkg: Fix build with non-default MODLIB
To: Michal Suchanek <msuchanek@suse.de>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-modules@vger.kernel.org, 
	Takashi Iwai <tiwai@suse.com>, Lucas De Marchi <lucas.de.marchi@gmail.com>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Jiri Slaby <jslaby@suse.com>, Jan Engelhardt <jengelh@inai.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 6, 2023 at 12:49=E2=80=AFAM Michal Suchanek <msuchanek@suse.de>=
 wrote:
>
> The default MODLIB value is composed of two variables and the hardcoded
> string '/lib/modules/'.
>
> MODLIB =3D $(INSTALL_MOD_PATH)/lib/modules/$(KERNELRELEASE)
>
> Defining this middle part as a variable was rejected on the basis that
> users can pass the whole MODLIB to make, such as


In other words, do you want to say

"If defining this middle part as a variable had been accepted,
this patch would have been unneeded." ?


I do not think so.


If your original patch were accepted, how would this patch look like?

kernel.spec needs to know the module directory somehow.


Would you add the following in scripts/package/mkspec ?

%define MODLIB $(pkg-config --print-variables kmod 2>/dev/null | grep
'^module_directory$' >/dev/null && pkg-config
--variable=3Dmodule_directory kmod || echo /lib/modules)








>
> make 'MODLIB=3D$(INSTALL_MOD_PATH)/usr/lib/modules/$(KERNELRELEASE)'
>
> However, this middle part of MODLIB is independently hardcoded by
> rpm-pkg, and when the user alters MODLIB this is not reflected when
> building the package.
>
> Given that $(INSTALL_MOD_PATH) is overridden during the rpm package build
> it is likely going to be empty. Then MODLIB can be passed to the rpm
> package, and used in place of the whole
> /usr/lib/modules/$(KERNELRELEASE) part.
>
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
>  scripts/package/kernel.spec | 8 ++++----
>  scripts/package/mkspec      | 1 +
>  2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
> index 3eee0143e0c5..15f49c5077db 100644
> --- a/scripts/package/kernel.spec
> +++ b/scripts/package/kernel.spec
> @@ -67,7 +67,7 @@ cp $(%{make} %{makeflags} -s image_name) %{buildroot}/b=
oot/vmlinuz-%{KERNELRELEA
>  %{make} %{makeflags} INSTALL_HDR_PATH=3D%{buildroot}/usr headers_install
>  cp System.map %{buildroot}/boot/System.map-%{KERNELRELEASE}
>  cp .config %{buildroot}/boot/config-%{KERNELRELEASE}
> -ln -fns /usr/src/kernels/%{KERNELRELEASE} %{buildroot}/lib/modules/%{KER=
NELRELEASE}/build
> +ln -fns /usr/src/kernels/%{KERNELRELEASE} %{buildroot}%{MODLIB}/build
>  %if %{with_devel}
>  %{make} %{makeflags} run-command KBUILD_RUN_COMMAND=3D'${srctree}/script=
s/package/install-extmod-build %{buildroot}/usr/src/kernels/%{KERNELRELEASE=
}'
>  %endif
> @@ -98,8 +98,8 @@ fi
>
>  %files
>  %defattr (-, root, root)
> -/lib/modules/%{KERNELRELEASE}
> -%exclude /lib/modules/%{KERNELRELEASE}/build
> +%{MODLIB}
> +%exclude %{MODLIB}/build
>  /boot/*
>
>  %files headers
> @@ -110,5 +110,5 @@ fi
>  %files devel
>  %defattr (-, root, root)
>  /usr/src/kernels/%{KERNELRELEASE}
> -/lib/modules/%{KERNELRELEASE}/build
> +%{MODLIB}/build
>  %endif
> diff --git a/scripts/package/mkspec b/scripts/package/mkspec
> index d41608efb747..d41b2e5304ac 100755
> --- a/scripts/package/mkspec
> +++ b/scripts/package/mkspec
> @@ -18,6 +18,7 @@ fi
>  cat<<EOF
>  %define ARCH ${ARCH}
>  %define KERNELRELEASE ${KERNELRELEASE}
> +%define MODLIB ${MODLIB}
>  %define pkg_release $("${srctree}/init/build-version")
>  EOF
>
> --
> 2.42.0
>


--
Best Regards
Masahiro Yamada

