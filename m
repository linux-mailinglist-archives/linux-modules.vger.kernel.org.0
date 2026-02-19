Return-Path: <linux-modules+bounces-5763-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOjCEM5Bl2lXwAIAu9opvQ
	(envelope-from <linux-modules+bounces-5763-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Thu, 19 Feb 2026 18:01:02 +0100
X-Original-To: lists+linux-modules@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E6E160E10
	for <lists+linux-modules@lfdr.de>; Thu, 19 Feb 2026 18:00:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 782B43012D20
	for <lists+linux-modules@lfdr.de>; Thu, 19 Feb 2026 17:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A2A296BAF;
	Thu, 19 Feb 2026 17:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="clavPsrq"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0130D287268;
	Thu, 19 Feb 2026 17:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771520453; cv=none; b=Gh7kvwVnv/Ag+sGiAAksERSm8vPTw/5YXHIUTG/oovmOvBrAI5bG5E0Ix8KYdI5atMsTfDoppmzjVaZVEOAST8j7Kbz09hgw6Cv7HMLXH5uKM913jEVLNczBYKFoRIIQBUARyyu3xzCP6plxNpOD0TdMihyL585HA2Zz7Hi4Y6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771520453; c=relaxed/simple;
	bh=jTyHBqqXEcKEtopsua1iY7DytSLkpwKrXrn4CUuv8SI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d4tqbjjM7nECpaxwTkjeHydtEoxvcY9SZxJ7FWxt/dLeyym5xNF+hdYcbSSv6K7B8r2itTrU6Thd7SX/whk8KCWL12bky2MungXch6SbJ6A5UV77nhCgHFYpF4NSsA1qVdRhjLjkQ46gjoxsmbLmaB0K+igtTercOnIl0696yYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=clavPsrq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1E61C4CEF7;
	Thu, 19 Feb 2026 17:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771520452;
	bh=jTyHBqqXEcKEtopsua1iY7DytSLkpwKrXrn4CUuv8SI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=clavPsrqbyCrka37XkhPrcXGn6/n7tADKPGzr3ZDTzLbXrB4G5Uc2CQ0XI679lPLz
	 zV7X8o2skq5FA+Qjd8SDukL8mn+sAIpw4aj7ifLac92MB2Vrs+X6Y7NfUD7T5itpro
	 I832kURNJ/U2XL8TqHZp7bNjrQs+aqVKrFiV4kX+fUPbjTF8o2iqjgUAp9HMkDGgns
	 9f8/VfS256dgKP0FqBeBkNbe+641tbHwU62CiWqjQgYFCAKdBTtsHEnDlbTEynHrv1
	 fYw96q5MU7KutEM581TG0a9LbRgIgeB5C227LG3JL3mjL3aphQc+j9OynIw0IUuG4j
	 xtlMY2JPU3ivA==
Date: Thu, 19 Feb 2026 18:00:48 +0100
From: Daniel Gomez <da.gomez@kernel.org>
To: Chris Li <sparse@chrisli.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Sami Tolvanen <samitolvanen@google.com>
Cc: linux-sparse@vger.kernel.org, Aaron Tomlin <atomlin@atomlin.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Eric Biggers <ebiggers@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, "Luck, Tony" <tony.luck@intel.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH] builtin: mark __builtin_strlen() as integer constant
 expression
Message-ID: <aZdAxZR-c8PY_uEL@macos>
References: <20260219-fix-builtin-strlen-v1-1-3ec3efc0cda7@samsung.com>
 <CABCJKuf8jh_yxQcR1=uMeuWOueXyoM5=L-QpTuBenRi_MZK_Gg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABCJKuf8jh_yxQcR1=uMeuWOueXyoM5=L-QpTuBenRi_MZK_Gg@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5763-lists,linux-modules=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[samsung.com:query timed out];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,atomlin.com,intel.com,linaro.org,gmail.com,kernel.org,suse.com,zeniv.linux.org.uk];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[da.gomez@kernel.org,linux-modules@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-modules];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[da.gomez.samsung.com:query timed out,da.gomez.kernel.org:query timed out];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 10E6E160E10
X-Rspamd-Action: no action

On 2026-02-19 08:41, Sami Tolvanen wrote:
> Hi Daniel,
> 
> On Thu, Feb 19, 2026 at 8:11 AM Daniel Gomez <da.gomez@kernel.org> wrote:
> >
> > From: Daniel Gomez <da.gomez@samsung.com>
> >
> > Commit ae83f3b72621 ("module: Add compile-time check for embedded
> > NUL characters") in the Linux kernel added static assert checks for
> > __builtin_strlen() inside MODULE_INFO() macros. But sparse does not mark
> > the result as CEF_SET_ICE during evaluation, making these assertions
> > fail with:
> >
> >     error: static assertion failed: "MODULE_INFO(...) contains embedded
> >     NUL byte"
> >
> > Fix by marking __builtin_strlen() as an integer constant expression at
> > eval time. This matches other builtins like __builtin_constant_p() or
> > __builtin_safe_p().
> >
> > Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> > ---
> > Discussion:
> > https://lore.kernel.org/all/aTc9s210am0YqMV4@agluck-desk3/
> 
> It looks like Al had a more complete fix for this issue, but I guess
> it never ended up in the sparse repo?
> 
> https://lore.kernel.org/all/aUV7kyjxlijuy5sC@agluck-desk3/
> 
> Sami

Chris, Al,

Can you please take a look? If Al patch is the correct approach, any
chance you can send it and fix this?

