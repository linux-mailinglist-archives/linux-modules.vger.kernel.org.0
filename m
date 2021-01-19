Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C2862FBF0D
	for <lists+linux-modules@lfdr.de>; Tue, 19 Jan 2021 19:33:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390688AbhASSck (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Tue, 19 Jan 2021 13:32:40 -0500
Received: from vmicros1.altlinux.org ([194.107.17.57]:39000 "EHLO
        vmicros1.altlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390332AbhASScU (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Tue, 19 Jan 2021 13:32:20 -0500
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
        by vmicros1.altlinux.org (Postfix) with ESMTP id 253B172C8B3;
        Tue, 19 Jan 2021 21:31:31 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
        id 1796C7CC8A4; Tue, 19 Jan 2021 21:31:31 +0300 (MSK)
Date:   Tue, 19 Jan 2021 21:31:31 +0300
From:   "Dmitry V. Levin" <ldv@altlinux.org>
To:     Lucas De Marchi <lucas.demarchi@intel.com>
Cc:     linux-modules@vger.kernel.org, Jan Tojnar <jtojnar@gmail.com>
Subject: Re: [PATCH 2/3] depmod: fix precedence order
Message-ID: <20210119183130.GA10896@altlinux.org>
References: <20210119145238.12774-1-lucas.demarchi@intel.com>
 <20210119145238.12774-2-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210119145238.12774-2-lucas.demarchi@intel.com>
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

On Tue, Jan 19, 2021 at 06:52:37AM -0800, Lucas De Marchi wrote:
> Configuration in /etc should have higher prio than /run.

Should it?  Isn't the common practice nowadays to have /run override /etc?

> Given how rarely configuration in /run is used with depmod, this is
> likely not to cause any problems, even if it's a change in behavior.
> ---
>  tools/depmod.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/depmod.c b/tools/depmod.c
> index 3f31cdf..8e1d9ec 100644
> --- a/tools/depmod.c
> +++ b/tools/depmod.c
> @@ -51,8 +51,8 @@ static int verbose = DEFAULT_VERBOSE;
>  static const char CFG_BUILTIN_KEY[] = "built-in";
>  static const char CFG_EXTERNAL_KEY[] = "external";
>  static const char *default_cfg_paths[] = {
> -	"/run/depmod.d",
>  	SYSCONFDIR "/depmod.d",
> +	"/run/depmod.d",
>  	"/lib/depmod.d",
>  	NULL
>  };

-- 
ldv
