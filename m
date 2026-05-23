Return-Path: <linux-modules+bounces-6521-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDsxAmFYEWr9kgYAu9opvQ
	(envelope-from <linux-modules+bounces-6521-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Sat, 23 May 2026 09:33:53 +0200
X-Original-To: lists+linux-modules@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D925BDC0F
	for <lists+linux-modules@lfdr.de>; Sat, 23 May 2026 09:33:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A39FC300A765
	for <lists+linux-modules@lfdr.de>; Sat, 23 May 2026 07:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 868DA3126CD;
	Sat, 23 May 2026 07:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QX1D5Gbc"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B49B2DC79F
	for <linux-modules@vger.kernel.org>; Sat, 23 May 2026 07:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779521628; cv=none; b=NV49a/5Ra70oEowTcHUX3W4L9jou5dKH2wcgvEvEHsPifgyRAG5Dx7w2oOHP+fwgzavdxtJL8BTAqQq9D6MSSNc9YTPFHOqYNJiXkl3o5kL6hgYmgYM/OpIL2DdYPKdlNh5aV9x7pMg/EP7lM2AjfWu5eQDDy6+B7s2w40epbp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779521628; c=relaxed/simple;
	bh=JyDEo2MMs4IrGfxUklapEkDJfEZiMMn+61kX3x06JJM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GPWa8NE68C48eF2TFdCSCueyNwEej44bUEhQkxHc8fcN8lAYWbYQ/rZn2Q5fvEZb3GzzPJhFpfdtZIzn8QGQ85lS6CL99hbNAuXcccZl80qnFJt0XSoXyJd69u4ziz9XXaKfXNUN/8OUS3PXyHNIr9C7I5pkvlX8qFvF/WJdfsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QX1D5Gbc; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 023371F000E9;
	Sat, 23 May 2026 07:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779521627;
	bh=wMnAITFKwmphA6lNTFxw3LyiB/kAs8Ca4pN+BZPlbK0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QX1D5GbcOgLge8sxIyfbwVUe6AjAfcPT7oWAxY2vvkQ7gmweFI165MfGLvfUVsRS8
	 fpTnay8IXQFtr/s/iSn8lxxTFlqpWKlg8m+SiqC7U15+Y41sYU6VrcPnIhE/kamK41
	 e/Wkf3EfKIACBL94AU/dDImbCeCLaWkyNyUWqfAlAafW1x4aWdHxOJSxzfOU/o+D1O
	 WUW/jd+fJ1DdM1PNYzNRtZZFa8XWZJLCINKwzzsgc+I9GpF7TXf0DmfYXXzIH7CfWR
	 4DYjPnK65qo4mBjVDA5HqmhoRnbT+kVlOizGFHj5euYnxbAE6FnXS6vh8pLe8O2j6t
	 yudYsupaHSIUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 11/24] dyndbg-API: remove
 DD_CLASS_TYPE_(DISJOINT|LEVEL)_NAMES and code
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jim Cromie" <jim.cromie@gmail.com>
Cc: linux-modules@vger.kernel.org
In-Reply-To: <20260523-dd-maint-2-v2-11-b937312aa083@gmail.com>
References: <20260523-dd-maint-2-v2-11-b937312aa083@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 23 May 2026 07:33:46 +0000
Message-Id: <20260523073347.023371F000E9@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-6521-lists,linux-modules=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sashiko.dev:url,smtp.kernel.org:mid]
X-Rspamd-Queue-Id: 52D925BDC0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The documentation comment for DECLARE_DYNDBG_CLASSMAP references th=
e old enum and outdated symbolic features.
--

commit 71dcc2d5d3240e498bff39bb8fa71e77409d1cbd
Author: Jim Cromie <jim.cromie@gmail.com>

dyndbg-API: remove DD_CLASS_TYPE_(DISJOINT|LEVEL)_NAMES and code

This commit removes the DD_CLASS_TYPE_DISJOINT_NAMES and
DD_CLASS_TYPE_LEVEL_NAMES classmap types. It simplifies the API by removing
support for symbolic class names in parameter inputs, which were primarily
used for tests. It also renames the class_map_type enum to
ddebug_class_map_type.

> diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
> index a10adac8e8f00..aa45dcf36a448 100644
> --- a/include/linux/dynamic_debug.h
> +++ b/include/linux/dynamic_debug.h
> @@ -59,27 +59,16 @@ struct _ddebug {
>  #endif
>  } __attribute__((aligned(8)));
> =20
> -enum class_map_type {
> +enum ddebug_class_map_type {

[Severity: Low]
This isn't a bug, but should the kernel-doc comment for
DECLARE_DYNDBG_CLASSMAP be updated to reflect this new enum name and the
removed symbolic support?

It still refers to the old enum class_map_type and mentions numeric/symbolic
choices:

/**
 * DECLARE_DYNDBG_CLASSMAP - declare classnames known by a module
 * @_var:   a struct ddebug_class_map, passed to module_param_cb
 * @_type:  enum class_map_type, chooses bits/verbose, numeric/symbolic
 * @_base:  offset of 1st class-name. splits .class_id space
 * @classes: class-names used to control class'd prdbgs
 */

>  	DD_CLASS_TYPE_DISJOINT_BITS,
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260523-dd-maint-2=
-v2-0-b937312aa083@gmail.com?part=3D11

