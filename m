Return-Path: <linux-modules+bounces-6001-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBMGMscnsGnYgQIAu9opvQ
	(envelope-from <linux-modules+bounces-6001-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Tue, 10 Mar 2026 15:16:39 +0100
X-Original-To: lists+linux-modules@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD2A251A0E
	for <lists+linux-modules@lfdr.de>; Tue, 10 Mar 2026 15:16:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7C2B32929AA
	for <lists+linux-modules@lfdr.de>; Tue, 10 Mar 2026 13:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E22043BC694;
	Tue, 10 Mar 2026 13:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="czRgpX8a"
X-Original-To: linux-modules@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B26C3A75B9
	for <linux-modules@vger.kernel.org>; Tue, 10 Mar 2026 13:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148050; cv=none; b=oFfMhMH5G8x3fZdCe+8txagGCLe8RSssQtJV5h4NZztzJNGhdJWuNjcYgnwaAkFJTMyZWmDlI0P8k7mzI3fCWsqszVcAL/DIhL1BSfgKsMHv/dbBV7ZWR3C8m5RIzVQOXxB3W2v5lf2UGe+tm+dOxWYK0/KFfCMMzQGkUUAPJa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148050; c=relaxed/simple;
	bh=FxbQYXrSz5YTlXTz2zBDndIQt9sA2w8YutchPvYOSGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l0ELM8cqBxlc8ggvRU2E1jLFEsgLgjsgmgIUPuPBnPalSrDfMjlb35ayR+r4fxGDCO6/f/OwvXbBvM0Vv6JInOCTFYBj+aC9ruO8QrDhpIpjNTXU52oqzFTTis3wz5lbqWzZHak/xttgZ9En9mvsdjV0LetL8NemhhLHOGkgEqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=czRgpX8a; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=V/W8fUnIestLy4XQqxH/cuC4beXLBH3+wMpCM6OOPp0=; b=czRgpX8ao3GyEYJ68vvdf1QH8l
	CX4rAY9LmXmlvnR2Jxt9DIESDKqia4BO5jX+ZFBF7xkbYh5154ikLEDyhE6BoY/MRTzz2e59BHhTg
	Pg6UGoZFzcKuKPmpHeksvOnypeDT3KY1F51QBb+p8jh/y57vPUh7Wy2Ew1MYJdVbdhB0tlRExSokn
	ojcj5P8H485XhciASqnOwr+GY7RHypQMT4EnekWTgdlfDxr84imxxw5dm6oVbNCA312V+UsVBFEOn
	UvGzKRc0gbtpOin0o+zfjXDxbXdMwvi+VQiKluzfHf5YrIPlsC7W5uBGjj6LwA3AoHWCNfqXHDJAP
	Eu6TyvFw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwo1-00000009YhP-2lgN;
	Tue, 10 Mar 2026 13:07:25 +0000
Date: Tue, 10 Mar 2026 06:07:25 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: hch@infradead.org, atomlin@atomlin.com, da.gomez@kernel.org,
	linux-modules@vger.kernel.org, mcgrof@kernel.org,
	petr.pavlu@suse.com, samitolvanen@google.com
Subject: Re: [PATCH v3] module: print version for external modules in
 print_modules()
Message-ID: <abAXjc6OihRcdoAA@infradead.org>
References: <aa-6wILF90Y4ndnd@infradead.org>
 <4215f061-488b-4c2b-98b3-45db4aabed5e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4215f061-488b-4c2b-98b3-45db4aabed5e@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rspamd-Queue-Id: 4CD2A251A0E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6001-lists,linux-modules=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@infradead.org,linux-modules@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-modules];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:dkim,infradead.org:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 09:04:14PM +0800, Yafang Shao wrote:
> 
> 
> > Then don't run extetrnal modules, which are not a first part citizen.
> > Get your changeas upstream instead of just leeching the upstream
> > developers work.
> 
> That doesn't make any sense.
> Could you please explain the rationale behind introducing
> EXPORT_SYMBOL_GPL() and TAINT_OOT_MODULE ?

Your straw man doesn't make any sense to me.


