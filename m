Return-Path: <linux-modules+bounces-6527-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDXZLh5bEWoFlAYAu9opvQ
	(envelope-from <linux-modules+bounces-6527-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Sat, 23 May 2026 09:45:34 +0200
X-Original-To: lists+linux-modules@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2375B5BDC58
	for <lists+linux-modules@lfdr.de>; Sat, 23 May 2026 09:45:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E610F300A8FF
	for <lists+linux-modules@lfdr.de>; Sat, 23 May 2026 07:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A613B3101C0;
	Sat, 23 May 2026 07:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mdYN7QQD"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE61734104E
	for <linux-modules@vger.kernel.org>; Sat, 23 May 2026 07:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779522331; cv=none; b=GXOubLIiF/7KZ/G2CrXtXd4RD1BJdmFfL68JvGadI8k66pd44m5j+FRLqbjq4LOIhBZYHGHvPbCpQKwcuHVyD/cyhCgpH85ay1L7VI4AQcbYEDcrib2+zn+RQzPpXwTWol+K0Xiq/eDUFp1iHcZ1fObb1i3nNnGmm3Q+1AusQqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779522331; c=relaxed/simple;
	bh=jD6AiITpStPA/U3hMg7mSzyZ5AmhqlrCqer21+7qfPA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lshRLcWzwDZsZGVTQZfnQEO/eGEoGR78KenMZEtSJCAvkiqOqta937u+wGnDRngSmYXsI66+Wr04OokrLGZZLE7KvbGXEPzr9AJpB7uMxzO54doPh4qdwXXTbHEPs3iVR0TOLgHnrkIx67yDLfh53T3WST0Ak9BCffupH/3u3eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mdYN7QQD; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 789771F000E9;
	Sat, 23 May 2026 07:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779522328;
	bh=fR8SC+jB6GBN9SuXx0WrNuB2Bs47L8cbY1wVlEyI6lM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mdYN7QQDFzCvzOlY/1pNBVFLjaBPLSc8eof7aMCC2Au1vjeE23VzrhaWDbLy1j26b
	 w/6AjF7jXCQUhJ0u9q8lQZwzdXasLKqPxZ7qGX6d4AT427UaFCghFm+8jl6yxJIzj+
	 /jEe2mnh1ohVYH0HEa4AzybB4EJbFEQR7dx/NW9fo8/o1wuNp2cWbyymHvaDfvlwCW
	 GIyX1aL8pD2YJIZ7PlHmCEEaSTLz+OU9dHjP5s5v+UF4Cfz/4r2skjCc/qVt0+Pj8K
	 xxbzzR6VqyZ80/HSw8Ezm/Ww0WsuioapvlZSb2zbgYml/URC3Yuk7JjmGFcv8ZASz2
	 dCsHwJAYdb8/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 21/24] dyndbg: hoist classmap-filter-by-modname up to
 ddebug_add_module
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jim Cromie" <jim.cromie@gmail.com>
Cc: linux-modules@vger.kernel.org
In-Reply-To: <20260523-dd-maint-2-v2-21-b937312aa083@gmail.com>
References: <20260523-dd-maint-2-v2-21-b937312aa083@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 23 May 2026 07:45:28 +0000
Message-Id: <20260523074528.789771F000E9@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-6527-lists,linux-modules=lfdr.de];
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
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-modules];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,smtp.kernel.org:mid,sashiko.dev:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2375B5BDC58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch silently removes verbose debug logging (`v2pr_info` and `=
vpr_info`) that was previously emitted when module classmaps were successfu=
lly attached.
--

commit 6fc0ea29f4f01911b3505de6afab9a84131d7e51
Author: Jim Cromie <jim.cromie@gmail.com>

dyndbg: hoist classmap-filter-by-modname up to ddebug_add_module

This patch refactors the subrange filtering of module classmaps by moving
the logic from ddebug_attach_module_classes into a new macro named
dd_set_module_subrange. It also hoists the macro invocation into
ddebug_add_module to apply the filtering closer to initialization.

> diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> index 4a9b9bc9efc5a..b877f4c6d778e 100644
> --- a/lib/dynamic_debug.c
> +++ b/lib/dynamic_debug.c
[ ... ]
> -		if (!strcmp(cm->mod_name, dt->info.mod_name)) {
> -			if (!nc) {
> -				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d=
\n",
> -					  i, cm->mod_name, cm->base, cm->length, cm->map_type);
> -				dt->info.maps.start =3D cm;
> -			}
> -			nc++;
> -		} else if (nc) {
> -			/* end of matching classmaps */
> -			break;
> -		}
> -	}
> -	if (nc) {
> -		dt->info.maps.len =3D nc;
> -		vpr_info("module:%s attached %d classes\n", dt->info.mod_name, nc);
> -	}
> -}
[ ... ]
> +#define dd_set_module_subrange(_i, _sp, _di, _vec) ({			\
> +	struct _ddebug_info *__di =3D (_di);				\
> +	typeof(__di->_vec.start) __start =3D NULL;			\
> +	int __nc =3D 0;							\
> +	for_subvec(_i, _sp, __di, _vec) {				\
> +		if (!strcmp((_sp)->mod_name, __di->mod_name)) {		\
> +			if (!__nc++)					\
> +				__start =3D (_sp);			\
> +		} else if (__nc) {					\
> +			break; /* end of consecutive matches */		\
> +		}							\
> +	}								\
> +	if (__nc)							\
> +		__di->_vec.start =3D __start;				\
> +	__di->_vec.len =3D __nc;						\
> +})

[Severity: Low]
Was the removal of the verbose debug logging intentional?

The replaced ddebug_attach_module_classes function previously emitted
v2pr_info and vpr_info messages when module classmaps were successfully
attached. These diagnostic log messages appear to be completely removed
rather than migrated to the new macro.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260523-dd-maint-2=
-v2-0-b937312aa083@gmail.com?part=3D21

