Return-Path: <linux-modules+bounces-85-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 086087C7375
	for <lists+linux-modules@lfdr.de>; Thu, 12 Oct 2023 18:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39C131C20BDC
	for <lists+linux-modules@lfdr.de>; Thu, 12 Oct 2023 16:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12DC42AB3A;
	Thu, 12 Oct 2023 16:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="3Evlr9Ko"
X-Original-To: linux-modules@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58778262BB
	for <linux-modules@vger.kernel.org>; Thu, 12 Oct 2023 16:50:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A1ABBE;
	Thu, 12 Oct 2023 09:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6y1wB+wLmbd3DnNxETvQ+qCVK9s9E8u1DdnwFwmSGKc=; b=3Evlr9KoSDHi22us3TUTb+Fiyd
	gpw+vQLph7yAIUkkXcLUqlYn6cWIAUPdtGWauTTIyuMru/9b6Fpqw2kSlok3vm+PyhsPpNckmHPl7
	eYJIj5eVzmazuqs/5C1p7XZY7nBlj66Az8VFEVFwgx98zi1pBh553mqSYysImTi6L5R+8W8UTwCgp
	ovUGic/6YcYy833JjclTyb8KHJwHjkMiIvikmnZ067/eCewx2XLGsFU/UdrzetMW62sjIfQcsRd+9
	Y/za7hzSia8NxG/hekMKqNR0ospFPvJneh96OYcuV35sOaSCB2yx73EJIfVqYzyIH78cgU6w4Ggbn
	FuS0O7KA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qqytH-001SdC-2n;
	Thu, 12 Oct 2023 16:50:27 +0000
Date: Thu, 12 Oct 2023 09:50:27 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Joey Jiao <quic_jiangenj@quicinc.com>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] module: Add CONFIG_MODULE_DISABLE_INIT_FREE option
Message-ID: <ZSgj02JtR+Hkc5qz@bombadil.infradead.org>
References: <20231012014012.9030-1-quic_jiangenj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231012014012.9030-1-quic_jiangenj@quicinc.com>
Sender: Luis Chamberlain <mcgrof@infradead.org>
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Thu, Oct 12, 2023 at 07:10:11AM +0530, Joey Jiao wrote:
> To facilitate syzkaller test, it's essential for the module to retain the same
> address across reboots.

Why?

> In userspace, the execution of modprobe commands must
> occur sequentially.

Why?

> In the kernel, selecting the CONFIG_MODULE_DISABLE_INIT_FREE
> option disables the asynchronous freeing of init sections.

No it does not.

> Signed-off-by: Joey Jiao <quic_jiangenj@quicinc.com>
> ---
>  kernel/module/Kconfig | 8 ++++++++
>  kernel/module/main.c  | 5 +++--
>  2 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
> index 33a2e991f608..1cdbee4c51de 100644
> --- a/kernel/module/Kconfig
> +++ b/kernel/module/Kconfig
> @@ -389,4 +389,12 @@ config MODULES_TREE_LOOKUP
>  	def_bool y
>  	depends on PERF_EVENTS || TRACING || CFI_CLANG
>  
> +config MODULE_DISABLE_INIT_FREE
> +	bool "Disable freeing of init sections"
> +	default n
> +	help
> +	  Allows users to prevent the freeing of init sections. This option is
> +	  particularly helpful for syzkaller fuzzing, ensuring that the module
> +	  consistently loads into the same address across reboots.
> +
>  endif # MODULES
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index 98fedfdb8db5..a5210b90c078 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -2593,8 +2593,9 @@ static noinline int do_init_module(struct module *mod)
>  	 * be cleaned up needs to sync with the queued work - ie
>  	 * rcu_barrier()
>  	 */
> -	if (llist_add(&freeinit->node, &init_free_list))
> -		schedule_work(&init_free_wq);
> +	if (llist_add(&freeinit->node, &init_free_list) &&
> +		!IS_ENABLED(CONFIG_MODULE_DISABLE_INIT_FREE))
> +			schedule_work(&init_free_wq);

llist_add() returns true if the list was empty prior to adding the
entry, so the functionality you are adding makes no sense with the
commit log in any way shape or form.

  Luis

