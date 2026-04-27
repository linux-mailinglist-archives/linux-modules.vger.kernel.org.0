Return-Path: <linux-modules+bounces-6327-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIylH0A/72le/AAAu9opvQ
	(envelope-from <linux-modules+bounces-6327-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Mon, 27 Apr 2026 12:49:36 +0200
X-Original-To: lists+linux-modules@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6864713BB
	for <lists+linux-modules@lfdr.de>; Mon, 27 Apr 2026 12:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CA67D3004D34
	for <lists+linux-modules@lfdr.de>; Mon, 27 Apr 2026 10:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B943B531B;
	Mon, 27 Apr 2026 10:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="HybofPmE"
X-Original-To: linux-modules@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D41361DC3;
	Mon, 27 Apr 2026 10:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777286972; cv=none; b=nExJnLY2279HygBspPMVD6c+T/3Xmx8O3hRpzya+H+3MsP6BKsf/9351BhvcA+BzOOP7G9/IPmy2U5y5Aa31/+bmIS3vlQQmoUPg3dEX3BfDRjxbwdykzbpB7175HO7IkYyOeAK86blIR+PDSVP8W/wj2Ts3gwBUdxdY4UO+9t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777286972; c=relaxed/simple;
	bh=1NDqOAekPri/m4O8impoBtCDJFr+DiW4Ny0SINZ8vm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rw3FAsf98LnPlKoDzIuH1oOpmLYyqj07Kfj7v/UEuyOClg+tdbHtmzQoitNzXF1NKF4atcgET9oBhofizOm1h6eScEaakdwKfvNqYLMjAZkTwmxWtQkRk3gPV9e8DbEWCh+ZEJBFn00G+QJ6w4XUdvu9VehQ9vT83l14tq5OkLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=HybofPmE; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87BBB1684;
	Mon, 27 Apr 2026 03:49:24 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BD633F62B;
	Mon, 27 Apr 2026 03:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777286970; bh=1NDqOAekPri/m4O8impoBtCDJFr+DiW4Ny0SINZ8vm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HybofPmElUWxhJiHsWQ0t8uWuAGLg77UZdYEmqbP0Vvm0a9mwb+0sCN01sSw/7Ah2
	 7Q409dAH+foOqVQ2Lo3Gun2f++NmwGlOfy5rXY9PrLwwi/GgeNHzZv1y9+pIPJxEaG
	 rNrCwutKSV6vMlGLmesc0H4+GCSPYVfFvnAbT2ko=
Date: Mon, 27 Apr 2026 11:49:14 +0100
From: Leo Yan <leo.yan@arm.com>
To: Shashank Balaji <shashank.mahadasyam@sony.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Richard Cochran <richardcochran@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>, Mike Leach <mike.leach@arm.com>,
	Rahul Bukte <rahul.bukte@sony.com>, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, Daniel Palmer <daniel.palmer@sony.com>,
	Tim Bird <tim.bird@sony.com>, linux-modules@vger.kernel.org
Subject: Re: [PATCH v4 2/4] coresight: pass THIS_MODULE implicitly through a
 macro
Message-ID: <20260427104914.GG929984@e132581.arm.com>
References: <20260427-acpi_mod_name-v4-0-22b42240c9bf@sony.com>
 <20260427-acpi_mod_name-v4-2-22b42240c9bf@sony.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427-acpi_mod_name-v4-2-22b42240c9bf@sony.com>
X-Rspamd-Queue-Id: DD6864713BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6327-lists,linux-modules=lfdr.de];
	FREEMAIL_CC(0.00)[arm.com,linaro.org,linux.intel.com,gmail.com,foss.st.com,linuxfoundation.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,suse.com,atomlin.com,sony.com,vger.kernel.org,lists.linaro.org,lists.infradead.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[arm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leo.yan@arm.com,linux-modules@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-modules];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Hi Shashank,

On Mon, Apr 27, 2026 at 11:41:22AM +0900, Shashank Balaji wrote:

[...]

> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -1694,7 +1694,7 @@ static void __exit coresight_exit(void)
>  module_init(coresight_init);
>  module_exit(coresight_exit);
>  
> -int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
> +int __coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
>  			  struct platform_driver *pdev_drv, struct module *owner)
>  {
>  	int ret;
> @@ -1713,7 +1713,7 @@ int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
>  	amba_driver_unregister(amba_drv);
>  	return ret;
>  }
> -EXPORT_SYMBOL_GPL(coresight_init_driver);
> +EXPORT_SYMBOL_GPL(__coresight_init_driver);

For consistency, we usually use prefix "__" for internal functions.

Could you rename this function as:

  int coresight_init_driver_with_owner(..., struct module *owner);

> +#define coresight_init_driver(drv, amba_drv, pdev_drv) \
> +	__coresight_init_driver(drv, amba_drv, pdev_drv, THIS_MODULE)
> +int __coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
>  			  struct platform_driver *pdev_drv, struct module *owner);

Please first function declaration, then followed by the macro to
define coresight_init_driver().

With above changes:

Reviewed-by: Leo Yan <leo.yan@arm.com>

