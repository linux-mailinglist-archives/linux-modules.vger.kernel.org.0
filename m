Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF366553B94
	for <lists+linux-modules@lfdr.de>; Tue, 21 Jun 2022 22:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354029AbiFUU0M (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Tue, 21 Jun 2022 16:26:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354010AbiFUU0L (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Tue, 21 Jun 2022 16:26:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C0EBC2A73B
        for <linux-modules@vger.kernel.org>; Tue, 21 Jun 2022 13:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655843169;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hBOzUNP2nn9f1CNcwGGAJIjWfMTRt0plrPkw96cdEyY=;
        b=D3rKd32BY8ZR0/i546mgaRLS0wwb2q4ul7g0hvPiGhKx0UHA8ibBqOTbpdLwzEf5uRbZfp
        cPx/AvsIteBMKf792zwdeBUFyCeOqKlj4pLgcrpuoS9OJ9zN/zr6Y2oWuSwGSam/TTpdbm
        aQIs/t+dpgp9L2aeCes3EeTnbEFR7Ig=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-dgwEwpuENyqIpZYcLSjnqA-1; Tue, 21 Jun 2022 16:26:01 -0400
X-MC-Unique: dgwEwpuENyqIpZYcLSjnqA-1
Received: by mail-wr1-f71.google.com with SMTP id n7-20020adfc607000000b0021a37d8f93aso3602194wrg.21
        for <linux-modules@vger.kernel.org>; Tue, 21 Jun 2022 13:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hBOzUNP2nn9f1CNcwGGAJIjWfMTRt0plrPkw96cdEyY=;
        b=lPKg3ssbmKoV/m19nVztxfdBw9pH1ERZ12n/fzTNKw77YiL3D4VjyayD0Mjq4KT83W
         LIzpXyFthYgK4Ozez6FhRZUI2774lfbxVkZVG+jAF/ZWZY/ysvNEq9mZWCAHXuVT6GSi
         7ZIBCZ/X8jsG1BALSK9Co856UwtOYmAniEkzkz4CFeS9RynyIk0Go2JIacltvs3QoiIh
         OOKzD+01IneoDIDlhKP40gVT5qyTPUw5MgviNv0ivft3NAzeWQ1FJC9NIf6p1FBV0ezI
         sj3s0wv3kAp6kbsNM1rjbPZxAGJputO0dYSkzdEcvizC8SKu2zbzYcAWz4RykgOXx4kW
         mOfw==
X-Gm-Message-State: AJIora9abJt8W/iKFK66O72YjnsnPF/P5hhx4wyR6Wt3kXYkrRtpvpKE
        VH0f/GLKg3C4MgNnQUZ/boygW4ylv1QLWpysQ7hX90DYhjep4X0KZ9zMSIzvUr7ag5fBfx+7L74
        MWF48L7HGpXnAghL35NvtowlH
X-Received: by 2002:adf:fec2:0:b0:21a:6cff:a4f1 with SMTP id q2-20020adffec2000000b0021a6cffa4f1mr23495512wrs.139.1655843159925;
        Tue, 21 Jun 2022 13:25:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tsXAWAlNpwcRfS/mKDgEH4mxXrw+o6EU2TMYs3FV5DxepsS/o0TXx2d6tLvaTXGvgHkWLCIA==
X-Received: by 2002:adf:fec2:0:b0:21a:6cff:a4f1 with SMTP id q2-20020adffec2000000b0021a6cffa4f1mr23495498wrs.139.1655843159731;
        Tue, 21 Jun 2022 13:25:59 -0700 (PDT)
Received: from localhost (cpc111743-lutn13-2-0-cust979.9-3.cable.virginm.net. [82.17.115.212])
        by smtp.gmail.com with ESMTPSA id t2-20020a1c4602000000b0039db60fa340sm22877183wma.33.2022.06.21.13.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 13:25:58 -0700 (PDT)
Date:   Tue, 21 Jun 2022 21:25:58 +0100
From:   Aaron Tomlin <atomlin@redhat.com>
To:     Saravana Kannan <saravanak@google.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Luis Chamberlain <mcgrof@kernel.org>, kernel-team@android.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-modules@vger.kernel.org
Subject: Re: [PATCH v2] module: Add support for default value for module
 async_probe
Message-ID: <20220621202558.jmvn2kozz44e2elg@ava.usersys.com>
X-PGP-Key: http://pgp.mit.edu/pks/lookup?search=atomlin%40redhat.com
X-PGP-Fingerprint: 7906 84EB FA8A 9638 8D1E  6E9B E2DE 9658 19CC 77D6
References: <20220604010101.719508-1-saravanak@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220604010101.719508-1-saravanak@google.com>
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

On Fri 2022-06-03 18:01 -0700, Saravana Kannan wrote:
> Add a module.async_probe kernel command line option that allows enabling
> async probing for all modules. When this command line option is used,
> there might still be some modules for which we want to explicitly force
> synchronous probing, so extend <modulename>.async_probe to take an
> optional bool input so that async probing can be disabled for a specific
> module.
> 
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
> v1->v2:
> - Updated the documentation to capture all the details/changes.
> 
>  Documentation/admin-guide/kernel-parameters.txt | 17 +++++++++++++++--
>  kernel/module/main.c                            | 11 ++++++++++-
>  2 files changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 710b52d87bdd..5174a08e20b0 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1147,8 +1147,12 @@
>  	nopku		[X86] Disable Memory Protection Keys CPU feature found
>  			in some Intel CPUs.
>  
> -	<module>.async_probe [KNL]
> -			Enable asynchronous probe on this module.
> +	<module>.async_probe[=<bool>] [KNL]
> +			If no <bool> value is specified or if the value
> +			specified is not a valid <bool>, enable asynchronous
> +			probe on this module.  Otherwise, enable/disable
> +			asynchronous probe on this module as indicated by the
> +			<bool> value. See also: module.async_probe
>  
>  	early_ioremap_debug [KNL]
>  			Enable debug messages in early_ioremap support. This
> @@ -3201,6 +3205,15 @@
>  			log everything. Information is printed at KERN_DEBUG
>  			so loglevel=8 may also need to be specified.
>  
> +	module.async_probe=<bool>
> +			[KNL] When set to true, modules will use async probing
> +			by default. To enable/disable async probing for a
> +			specific module, use the module specific control that
> +			is documented under <module>.async_probe. When both
> +			module.async_probe and <module>.async_probe are
> +			specified, <module>.async_probe takes precedence for
> +			the specific module.
> +
>  	module.sig_enforce
>  			[KNL] When CONFIG_MODULE_SIG is set, this means that
>  			modules without (valid) signatures will fail to load.
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index fed58d30725d..47085795f037 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -2410,6 +2410,12 @@ static void do_free_init(struct work_struct *w)
>  	}
>  }
>  
> +#undef MODULE_PARAM_PREFIX
> +#define MODULE_PARAM_PREFIX "module."
> +/* Default value for module->async_probe_requested */
> +static bool async_probe;
> +module_param(async_probe, bool, 0644);
> +
>  /*
>   * This is where the real work happens.
>   *
> @@ -2630,7 +2636,8 @@ static int unknown_module_param_cb(char *param, char *val, const char *modname,
>  	int ret;
>  
>  	if (strcmp(param, "async_probe") == 0) {
> -		mod->async_probe_requested = true;
> +		if (strtobool(val, &mod->async_probe_requested))
> +			mod->async_probe_requested = true;
>  		return 0;
>  	}
>  
> @@ -2797,6 +2804,8 @@ static int load_module(struct load_info *info, const char __user *uargs,
>  	if (err)
>  		goto bug_cleanup;
>  
> +	mod->async_probe_requested = async_probe;
> +
>  	/* Module is ready to execute: parsing args may do that. */
>  	after_dashes = parse_args(mod->name, mod->args, mod->kp, mod->num_kp,
>  				  -32768, 32767, mod,
> -- 
> 2.36.1.255.ge46751e96f-goog

Reviewed-by: Aaron Tomlin <atomlin@redhat.com>

-- 
Aaron Tomlin

