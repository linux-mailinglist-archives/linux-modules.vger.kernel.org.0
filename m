Return-Path: <linux-modules+bounces-6417-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIw5AoVpCWouYwQAu9opvQ
	(envelope-from <linux-modules+bounces-6417-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Sun, 17 May 2026 09:08:53 +0200
X-Original-To: lists+linux-modules@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCBA55F9C7
	for <lists+linux-modules@lfdr.de>; Sun, 17 May 2026 09:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 07970300373E
	for <lists+linux-modules@lfdr.de>; Sun, 17 May 2026 07:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB27308F3B;
	Sun, 17 May 2026 07:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HUmWcmKw"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FB71427A;
	Sun, 17 May 2026 07:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779001726; cv=none; b=ccr9WezjM9QRNuJQS5xsbxrevj7AEOcW96ExRT6m7kP99pLvXbaZAb8eLRuORmG/RxQGTp0rx9zB3FQWF2GmLTNuh4HsDWA1eyqI13LGexAcFxK6SO/BB2xb2PjP4z1EW8XqM/eOIqdhUYkzYLTeS7JTbxDErWActY9Hs1VgnG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779001726; c=relaxed/simple;
	bh=icZcRWan3mxY3Ld44xrZZpW7OGtAHmNw0PHM9+h1FaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=azTc/XwvBVO1FupZr1lyvtlDvzeS9QCnf1R2bRadK0NFzGIPiYnqOE6u5jhtJ406xXEpSnNn/CSE1upeogZFHQ/iPLIBjkmHWuERUUL/t8cedg5drjmaY93cL2JluBo3JNOA5nANIvLtcaoi53zpyEGDFq26LH9S+5pob51pUjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HUmWcmKw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDDF9C2BCB0;
	Sun, 17 May 2026 07:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1779001726;
	bh=icZcRWan3mxY3Ld44xrZZpW7OGtAHmNw0PHM9+h1FaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HUmWcmKwhW0Y2wCQosktViTFq1UjCOKc8kkG5iM1CZPzQOpU52WQ47/tyAB41FRRG
	 oBL4mGqKIzwqOTVY86WyM1Vl1MU0CBE63SB0sMVdJHUxvWLV/XA+d5sqOIXkXA51OP
	 8NKVuYwUeAiFOosgfwMrjGcp/q6FIo++Zzj4PkIA=
Date: Sun, 17 May 2026 09:08:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Afi0 <capyenglishlite@gmail.com>
Cc: security@kernel.org, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, mcgrof@kernel.org,
	dmitry.torokhov@gmail.com
Subject: Re: Missing error check in module_decompress() leads to heap OOB
 write
Message-ID: <2026051750-dreamless-undiluted-b59b@gregkh>
References: <CAEABq7d=a-AZYfeTerM6osxnar236Gr5L9GKHpTxypj6dgiEbg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEABq7d=a-AZYfeTerM6osxnar236Gr5L9GKHpTxypj6dgiEbg@mail.gmail.com>
X-Rspamd-Queue-Id: 4FCBA55F9C7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6417-lists,linux-modules=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-modules@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-modules];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sun, May 17, 2026 at 06:26:20AM +0000, Afi0 wrote:
> Signed-off-by: Afi0 <capyenglishlite@gmail.com>


Please resend just a patch with your real name.

thanks,

greg k-h

