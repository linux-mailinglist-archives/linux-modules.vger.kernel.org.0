Return-Path: <linux-modules+bounces-15-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 787FF7AADCA
	for <lists+linux-modules@lfdr.de>; Fri, 22 Sep 2023 11:25:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 1564D282532
	for <lists+linux-modules@lfdr.de>; Fri, 22 Sep 2023 09:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 717AD18AF0;
	Fri, 22 Sep 2023 09:25:23 +0000 (UTC)
X-Original-To: linux-modules@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC8D14F6F
	for <linux-modules@vger.kernel.org>; Fri, 22 Sep 2023 09:25:21 +0000 (UTC)
X-Greylist: delayed 514 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 22 Sep 2023 02:25:20 PDT
Received: from mail.avm.de (mail.avm.de [IPv6:2001:bf0:244:244::119])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7B3ACE
	for <linux-modules@vger.kernel.org>; Fri, 22 Sep 2023 02:25:20 -0700 (PDT)
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Fri, 22 Sep 2023 11:16:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1695374193; bh=LtM687oI9TFrYjIfRJXzHSYw7X0NRDTTPtB/S1Bg2W0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hoCOuDrzKh4zqLMGadFkno5hxDh0k+e57tQ8xBuyXabTB30GvYpf834/8jAkI8u+Z
	 7jQvWkWY46vyzwF+KwMR2eiMhiP3Y0/ulQ6hjg9YvXN4hhK56HH/UCM6xDq9xiawf+
	 nA1urMKKbcLTlxTy7XtH33lU+Ymcd1+9lVdRC1iE=
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id BAD0080A71;
	Fri, 22 Sep 2023 11:16:32 +0200 (CEST)
Received: by buildd.core.avm.de (Postfix, from userid 1000)
	id ADFE71813CA; Fri, 22 Sep 2023 11:16:32 +0200 (CEST)
Date: Fri, 22 Sep 2023 11:16:32 +0200
From: Nicolas Schier <n.schier@avm.de>
To: Martin Nybo Andersen <tweek@tweek.dk>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nick Terrell <terrelln@fb.com>, Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org
Subject: Re: [PATCH] Use CRC32 and a 1MiB dictionary for XZ compressed modules
Message-ID: <ZQ1bcIEECHEvK09c@buildd.core.avm.de>
Mail-Followup-To: Martin Nybo Andersen <tweek@tweek.dk>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nick Terrell <terrelln@fb.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org
References: <3d34a965-ab9c-d549-0c63-c717ab5d2edc@tweek.dk>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3d34a965-ab9c-d549-0c63-c717ab5d2edc@tweek.dk>
X-purgate-ID: 149429::1695374193-9A4019BA-C47752C9/0/0
X-purgate-type: clean
X-purgate-size: 1000
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

In linux-modules@v.k.o probably some more experts can comment on this:

On Fri, Sep 15, 2023 at 12:15:39PM +0200, Martin Nybo Andersen wrote:
> Kmod is now using the kernel decompressor which doesn't handle CRC64
> and dictionaries larger than 1MiB.
> 
> Fixes: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1050582
> Signed-off-by: Martin Nybo Andersen <tweek@tweek.dk>
> ---
>  scripts/Makefile.modinst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
> index c59cc57286ba..ffbafbd3aeea 100644
> --- a/scripts/Makefile.modinst
> +++ b/scripts/Makefile.modinst
> @@ -144,7 +144,7 @@ endif
>  quiet_cmd_gzip = GZIP    $@
>        cmd_gzip = $(KGZIP) -n -f $<
>  quiet_cmd_xz = XZ      $@
> -      cmd_xz = $(XZ) --lzma2=dict=2MiB -f $<
> +      cmd_xz = $(XZ) --check=crc32 --lzma2=dict=1MiB -f $<
>  quiet_cmd_zstd = ZSTD    $@
>        cmd_zstd = $(ZSTD) -T0 --rm -f -q $<
> 
> --
> 2.40.1

