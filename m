Return-Path: <linux-modules+bounces-44-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA517B588D
	for <lists+linux-modules@lfdr.de>; Mon,  2 Oct 2023 18:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 9CFF5282514
	for <lists+linux-modules@lfdr.de>; Mon,  2 Oct 2023 16:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC6A1DDCB;
	Mon,  2 Oct 2023 16:58:06 +0000 (UTC)
X-Original-To: linux-modules@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33961CF83
	for <linux-modules@vger.kernel.org>; Mon,  2 Oct 2023 16:58:04 +0000 (UTC)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C725FBD
	for <linux-modules@vger.kernel.org>; Mon,  2 Oct 2023 09:58:02 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1bf55a81eeaso285285ad.0
        for <linux-modules@vger.kernel.org>; Mon, 02 Oct 2023 09:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696265882; x=1696870682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OmqTcPALB5Fa2231OIyxzbdzfqXkdnOxzqNeS9x4hgs=;
        b=IWzQ12f1FmtSa5xm350ayLL0Msu8ZKS6hNwlapwOkWQ73CdIBBhQNxNcdjVGkIjNc8
         DuVr1RZVcJ2qFK+HkCNMWjE+FoUUNz6R/A9M8NlKIJJvrLKqmrSAI5ok9g0l3xknfeo4
         pUw96U41+khQ0DeQyhvnq8SebmJxsRF3p1zao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696265882; x=1696870682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmqTcPALB5Fa2231OIyxzbdzfqXkdnOxzqNeS9x4hgs=;
        b=eUdi+qcMPWA9tpN+k4J3KrBp58hbvGvn214zUtzsvrZZBPmc6MyYx2xVEh/piNzMS4
         ZxY6GpjtzWrI7QZFFfIsgueflAhIQ3VedK98m/zsTGQmUI59TuaKopCNAe/QMczHnrLK
         NsbpaYtA3Bq7B3uQPo+dJvggvztbUkL38jKXmtlqqFy+Yb7Zvtzpq3MbamyZBZXrbEHj
         zYhGAsJ1AFjK/BV7/05ClfgTBWmQDYHNXEz/siBdFVPCqW3ixvvxNv+FDaSclnJVYLMt
         qByYeXdvW4Lb8ciB69PHyUzixe/fOr1DN4DYBfqtDZsCV0p0M50npFdQZ9WrILYA7dl3
         kFMQ==
X-Gm-Message-State: AOJu0YzSe2xgZP62QXYbxb2aI/86goJ90jvHnMP2SSnhS8jxNiPD02Oo
	6/o77Ic57xSDWLdlUkrWE+wDXA==
X-Google-Smtp-Source: AGHT+IFbiFrmNXAcBqoD21bFKcMD0lXjlNKJVvMM6NyfF786Ran5xugt2TBoWfWxH0Mge86oU9T5HA==
X-Received: by 2002:a17:903:22c4:b0:1c1:f3f8:3949 with SMTP id y4-20020a17090322c400b001c1f3f83949mr11623836plg.1.1696265882236;
        Mon, 02 Oct 2023 09:58:02 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id a5-20020a170902ee8500b001c62d63b817sm13050708pld.179.2023.10.02.09.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 09:58:01 -0700 (PDT)
Date: Mon, 2 Oct 2023 09:57:59 -0700
From: Kees Cook <keescook@chromium.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 0/5] params: harden string ops and allocatio ops
Message-ID: <202310020957.022F9047F0@keescook>
References: <20231002124856.2455696-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231002124856.2455696-1-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 02, 2023 at 03:48:51PM +0300, Andy Shevchenko wrote:
> A couple of patches are for get the string ops, used in the module,
> slightly harden. On top a few cleanups.
> 
> Since the main part is rather hardening, I think the Kees' tree is
> the best fit for the series, but I'm open for another option(s).
> 
> Changelog v2:
> - dropped the s*printf() --> sysfs_emit() conversion as it revealed
>   an issue, i.e. reuse getters with non-page-aligned pointer, which
>   would be addressed separately
> - added cover letter and clarified the possible route for the series
>   (Luis)
> 
> Andy Shevchenko (5):
>   params: Introduce the param_unknown_fn type
>   params: Do not go over the limit when getting the string length
>   params: Use size_add() for kmalloc()
>   params: Sort headers
>   params: Fix multi-line comment style

Seems like a nice bit of clean-up.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

