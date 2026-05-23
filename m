Return-Path: <linux-modules+bounces-6520-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIsvLxlYEWr9kgYAu9opvQ
	(envelope-from <linux-modules+bounces-6520-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Sat, 23 May 2026 09:32:41 +0200
X-Original-To: lists+linux-modules@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E465BDBF9
	for <lists+linux-modules@lfdr.de>; Sat, 23 May 2026 09:32:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF233300A8FF
	for <lists+linux-modules@lfdr.de>; Sat, 23 May 2026 07:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A24345CDD;
	Sat, 23 May 2026 07:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NDfDEsBp"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241222DC79F
	for <linux-modules@vger.kernel.org>; Sat, 23 May 2026 07:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779521558; cv=none; b=O1baSz9nLuPSEncdB4wP3TIDBujFTrKiI50XN5Wfhp3goXhQoCOA0j0nUCEf3GmFgFZeQ0AqEpadX8abDQXJixpo2i/Gtrtxj+rEinCS2NF6uHLKaC1Q/Fqq2ORKB6XyFSWhhSy7quAi/EpQOs0WApO9oTGfFClNAA1NmJxioCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779521558; c=relaxed/simple;
	bh=xfr43jZFPQ4vzDiUvT12nKe7ghJMtx0Bs1pBsN9mgzE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=asy7q79BpuZCqvexpTwr+TMKwX4w0xO+/0f2XGci1jPfzWvXOlLlkzwJgYZ3egUwvJwcvVPIRMuPpOBA8kx6r88Zjb3tpVbpDLaA7Ck0LX5Kriy720B6m6SIRmbMYpvI4lOoXJJZMkD+led+Rx+7cDaFBeoa9JFTVuXdmFJXppk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NDfDEsBp; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A95381F000E9;
	Sat, 23 May 2026 07:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779521556;
	bh=eK7WAK+v3M65seu4SLNgkx96/ehfPHNzkgA7YXRZXt4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NDfDEsBpfVp4cuHXR+L9H0qM5yKon+2rkkOERQV6p3bJgQY7QNN5YrVmRiguus80u
	 J42qoWKkIkVYb8NJ9HzEWA9DWqMHhgw/YEUgHX4d1wghcql4vhs/0stVQ0FCjemQ9A
	 Xu0+OJjTtOw/SrJn85dy/09gFyB/AhjVBuKlXqN6oSMPTe4sKL3fw1AVvhqs2gL4YO
	 dyEjG+LZND10cedAsPQVFfk5Uel6zfIQvmuuRqZvDTcLS3ZB5ZuBM5xRnvDDJKv8XX
	 7uznozKuju2r4w8uchGDijpp3v+V0j8OkTN2d6gwBcSHvt+JCpDPYAqZIDbvWqN+yA
	 3KEzvdRfnYa4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 12/24] dyndbg: drop NUM_TYPE_ARGS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jim Cromie" <jim.cromie@gmail.com>
Cc: linux-modules@vger.kernel.org
In-Reply-To: <20260523-dd-maint-2-v2-12-b937312aa083@gmail.com>
References: <20260523-dd-maint-2-v2-12-b937312aa083@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 23 May 2026 07:32:36 +0000
Message-Id: <20260523073236.A95381F000E9@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-6520-lists,linux-modules=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sashiko.dev:url,lists.linux.dev:replyto]
X-Rspamd-Queue-Id: 22E465BDBF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] `include/linux/dynamic_debug.h` uses `ARRAY_SIZE` in the `DECLARE_D=
YNDBG_CLASSMAP` macro but does not include `<linux/array_size.h>`.
--

commit 618a01dd2902c43678e5c0a9f07fd35aaf566937
Author: Jim Cromie <jim.cromie@gmail.com>

dyndbg: drop NUM_TYPE_ARGS

This commit drops the NUM_TYPE_ARGS macro and replaces it with ARRAY_SIZE in
the DECLARE_DYNDBG_CLASSMAP macro.

> diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
> --- a/include/linux/dynamic_debug.h
> +++ b/include/linux/dynamic_debug.h
> @@ -121,11 +121,9 @@ struct ddebug_class_param {
>  		.mod_name =3D KBUILD_MODNAME,				\
>  		.base =3D _base,						\
>  		.map_type =3D _maptype,					\
> -		.length =3D NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
> +		.length =3D ARRAY_SIZE(_var##_classnames),		\

[Severity: Low]
Does this macro expansion require linux/array_size.h to be included directly
in include/linux/dynamic_debug.h?

If a driver or module includes linux/dynamic_debug.h and invokes
DECLARE_DYNDBG_CLASSMAP without independently including linux/array_size.h
(for example, via linux/kernel.h), it might fail to compile. It looks like
the include for linux/array_size.h was added to lib/dynamic_debug.c below,
instead of to this header file.

>  		.class_names =3D _var##_classnames,			\
>  	}

[ ... ]

> diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> --- a/lib/dynamic_debug.c
> +++ b/lib/dynamic_debug.c
> @@ -13,6 +13,7 @@
> =20
>  #define pr_fmt(fmt) "dyndbg: " fmt
> =20
> +#include <linux/array_size.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260523-dd-maint-2=
-v2-0-b937312aa083@gmail.com?part=3D12

