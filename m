Return-Path: <linux-modules+bounces-6613-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePDyCAd6HWrEbAkAu9opvQ
	(envelope-from <linux-modules+bounces-6613-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Mon, 01 Jun 2026 14:24:39 +0200
X-Original-To: lists+linux-modules@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7705061F39B
	for <lists+linux-modules@lfdr.de>; Mon, 01 Jun 2026 14:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D1A6304724D
	for <lists+linux-modules@lfdr.de>; Mon,  1 Jun 2026 12:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C023769EF;
	Mon,  1 Jun 2026 12:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YTzVAMTX"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2BC372073
	for <linux-modules@vger.kernel.org>; Mon,  1 Jun 2026 12:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780316202; cv=none; b=ZIFvIzwLVZB6YgwKGCSoPJslKcaDLK1JW6i+TMJvK//CMzsq4aH879w8iz1a8Gg8iOHfLEV4wpJOCyl4Kdz6/mGfX6Mb4kY/aNkGe5Dm6ub68vTAv2MSSIbEMqZ+fCRAlUxim2FQcVnZUpJX7uE8LzsQiOyeoM+/VECcjFD2djU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780316202; c=relaxed/simple;
	bh=heKeqj1VrvZzgGxburSR5Ki197u22mpkJiHrB/VkVag=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FQ0WU+goxMSSMqnvpNpsFFeW6rAal5+wrXG7DKr+eic/+pRaHwk2rA5ul1T42IlJHZ7uNxri6nYseiuzacQxkYUMUtHl/76eIAyvsxIaipcCIOQXXqRYr0z8JPXWptFxQiDZS5iIPQwk9WrUrHRX0aLy5ARez9Ob3PCh2r6P2pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YTzVAMTX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 815001F00893;
	Mon,  1 Jun 2026 12:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780316201;
	bh=POZMb1jdGG4gTbzr3gBInMrID1M1xtjHnD3Td9h1tJE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YTzVAMTXyA96Npl8erqZjuSq65yoZ+sJ1px3fHzGRtDv/JY25kSJotf5pO9tAxEWZ
	 ePWzzjrb1Kb90HSGbF4KUJw1dWu8HbDfb9o/GtcYKY9DZ7GZYR2bzZVDmp0JMxAh11
	 hxJkWplO88CEa0ZM31SXBZuhSclWpSxTDSHeMXYcDgjJ2UQ1+jr/iQPaCxh4VaVywf
	 khzFYH/b8sO01KTLsXE5l9kTlETPTnt9Uw7Ma6HYCYayni2/CYJeYps2dWpE9SlMhV
	 rM7M8UOqdP46u2wixwU8EWFrkpBnY99i/pXrHoHBbHsl1tMXT1SuA5WWCjhk4nWbmI
	 zL8PCtbzlOiRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 13/24] dyndbg: reduce verbose/debug clutter
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jim Cromie" <jim.cromie@gmail.com>
Cc: linux-modules@vger.kernel.org
In-Reply-To: <20260601-dd-maint-2-v3-13-4a15b241bd3c@gmail.com>
References: <20260601-dd-maint-2-v3-13-4a15b241bd3c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 12:16:40 +0000
Message-Id: <20260601121641.815001F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6613-lists,linux-modules=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-modules@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-modules];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sashiko.dev:url]
X-Rspamd-Queue-Id: 7705061F39B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Loss of 'no matches' diagnostic output at verbose=3D1.
- [Low] Commit message output mismatch due to double space formatting.
--

commit 4e15442ecf24d2ba351dc5e3411a51965df2f4c3
Author: Jim Cromie <jim.cromie@gmail.com>

dyndbg: reduce verbose/debug clutter

This commit reduces verbose and debug clutter in dyndbg by condensing
multi-line logging output into single lines and dropping unnecessary verbose
messages during query execution and module addition.

> diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> index 0377d9f8dcd1f..bacb55f960faf 100644
> --- a/lib/dynamic_debug.c
> +++ b/lib/dynamic_debug.c
> @@ -276,9 +276,6 @@ static int ddebug_change(const struct ddebug_query *q=
uery,
>  	}
>  	mutex_unlock(&ddebug_lock);
> =20
> -	if (!nfound && verbose)
> -		pr_info("no matches for query\n");
> -

[Severity: Low]
Is it possible this unintentionally hides the 'no matches' diagnostic output
from ddebug_change() for users with verbose=3D1?

The commit message mentions that this status is retold later in the output,
but that updated line is printed using v2pr_info() in ddebug_exec_queries().
Since v2pr_info() requires verbose >=3D 2, users running with verbose=3D1 w=
ill
lose this diagnostic feedback when queries don't match.

>  	return nfound;
>  }

[ ... ]

> @@ -593,7 +587,8 @@ static int ddebug_exec_queries(char *query, const cha=
r *modname)
>  		if (!query || !*query || *query =3D=3D '#')
>  			continue;
> =20
> -		vpr_info("query %d: \"%s\" mod:%s\n", i, query, modname ?: "*");
> +		vpr_info("query %d: %s%s \"%s\"\n", i,
> +			 modname ? "module " : "", modname ?: "", query);

[Severity: Low]
Will this format string produce a double space in the output when modname
is NULL?

If modname is NULL in ddebug_exec_queries(), both %s formatters evaluate to
empty strings. This leaves the space after the colon and the space before
the quote adjacent, resulting in a double space before the query string.

This isn't a bug, but it contradicts the single space output explicitly sho=
wn
in the commit message.

> =20
>  		rc =3D ddebug_exec_query(query, modname);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601-dd-maint-2=
-v3-0-4a15b241bd3c@gmail.com?part=3D13

