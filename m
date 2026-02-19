Return-Path: <linux-modules+bounces-5766-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEZRKJBil2mnxgIAu9opvQ
	(envelope-from <linux-modules+bounces-5766-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Thu, 19 Feb 2026 20:20:48 +0100
X-Original-To: lists+linux-modules@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C29E1161E68
	for <lists+linux-modules@lfdr.de>; Thu, 19 Feb 2026 20:20:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5E92F30072B4
	for <lists+linux-modules@lfdr.de>; Thu, 19 Feb 2026 19:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2B72FF675;
	Thu, 19 Feb 2026 19:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ee7p6JgY"
X-Original-To: linux-modules@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CBF2D978B;
	Thu, 19 Feb 2026 19:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771528841; cv=none; b=atozltzrcCBeObIpG70emUVN6IiGOK+TDeKqqqLFlkTbGPHtgdLBYEW6eaZMUU3Dj+g8Uk+hb0aA8mPaglZfZwGmGpcB6B6jEqnAMn6IetJZcctLjGHnA3p/f8C0da0QlKtwFDKJGGPfxn+givLaIVsyZibknyGJgHk4OpBQ7/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771528841; c=relaxed/simple;
	bh=W7K5+4oEkwAzxwMwz/wpvg+aWYzATLdos1rcs6tXJqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rGM/eXXogrsNAgB+uQkVUjqQ4qCMgSZxiE7xrBLF2dX41xwBZL3WPmoYUOg7iz4X3F1IGB1IgfI3hQfM8qFDVzPsWBh1j9GgiNPh8jY94ezmZ706VED2/DMOc48J60INeXUBOsvssOstQ/1NdZWEa0bW65bOzqsQNf7bg7mre7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ee7p6JgY; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771528841; x=1803064841;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=W7K5+4oEkwAzxwMwz/wpvg+aWYzATLdos1rcs6tXJqc=;
  b=ee7p6JgYucmuCMFINGsp08nT2/RmXVa4bJvSeikq6eqmUINUN0iu7Bpy
   XDPwj5ri+HD4GXglMsUxLHdxk3gTaj8gKDVmd/8RWbuaT6gAl4GkikpiW
   WC4d9GOdb/vnedinjuLllLguj3qL03WR76Fgy3YZ6U3cRMszpdqc7Z8QQ
   kW2dZwRwqfDIJak8ff9/3pDATbiYvmYZfEomRotpdb2KqLM/UDNL4psni
   mSmDpO+RG3Wt/9snD4zyzYkGulfPY1sFN2v3Tz3fP5qQmjkQJqJlev5JG
   U0LSsvNHx/Jk6b3dWpVGRxagSw9O26NvmEXkx5GSEJmmUS987zgX2Sw24
   A==;
X-CSE-ConnectionGUID: OCyRk4LMQ5eipoW7WQlOXg==
X-CSE-MsgGUID: n9HNvXKMSQqRIqDC1urOKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72668673"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="72668673"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 11:20:40 -0800
X-CSE-ConnectionGUID: H1G0/YEvR8S5+d5/zeUAQw==
X-CSE-MsgGUID: m/QqZo0/SXSTogGd32cVbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="213255493"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.114])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 11:20:36 -0800
Date: Thu, 19 Feb 2026 21:20:34 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Chris Li <sparse@chrisli.org>
Cc: Daniel Gomez <da.gomez@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-sparse@vger.kernel.org, Aaron Tomlin <atomlin@atomlin.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, "Luck, Tony" <tony.luck@intel.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>
Subject: Re: [PATCH] builtin: mark __builtin_strlen() as integer constant
 expression
Message-ID: <aZdighmTJN-JaijL@smile.fi.intel.com>
References: <20260219-fix-builtin-strlen-v1-1-3ec3efc0cda7@samsung.com>
 <CABCJKuf8jh_yxQcR1=uMeuWOueXyoM5=L-QpTuBenRi_MZK_Gg@mail.gmail.com>
 <aZdAxZR-c8PY_uEL@macos>
 <CACePvbU9Dh-caC59+L7wicZF+3sMjc4NC0HEkp9cVa7qqdydow@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACePvbU9Dh-caC59+L7wicZF+3sMjc4NC0HEkp9cVa7qqdydow@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,zeniv.linux.org.uk,google.com,vger.kernel.org,atomlin.com,linaro.org,gmail.com,intel.com,suse.com];
	TAGGED_FROM(0.00)[bounces-5766-lists,linux-modules=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-modules@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-modules];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C29E1161E68
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 09:06:23AM -0800, Chris Li wrote:
> On Thu, Feb 19, 2026 at 9:00 AM Daniel Gomez <da.gomez@kernel.org> wrote:
> >
> > Can you please take a look? If Al patch is the correct approach, any
> > chance you can send it and fix this?
> 
> I am asking in another thread should I pull Al's git repo instead.
> There are a few good commits there.

Please, pull Al's work, My colleagues and I use his version of sparse for a few
weeks without noticing any downsides.

-- 
With Best Regards,
Andy Shevchenko



