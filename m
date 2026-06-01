Return-Path: <linux-modules+bounces-6586-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SK8NCpFjHWpHaAkAu9opvQ
	(envelope-from <linux-modules+bounces-6586-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Mon, 01 Jun 2026 12:48:49 +0200
X-Original-To: lists+linux-modules@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7E161DD70
	for <lists+linux-modules@lfdr.de>; Mon, 01 Jun 2026 12:48:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53E9F3170664
	for <lists+linux-modules@lfdr.de>; Mon,  1 Jun 2026 10:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 345BB39768F;
	Mon,  1 Jun 2026 10:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bbLZA3z8"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5432BE65B
	for <linux-modules@vger.kernel.org>; Mon,  1 Jun 2026 10:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780309699; cv=none; b=PfR6qOIGD0S+fd8IEdngPPR+2ems0OyAz3sBsICAVav9ZtcE8R7ENyeJ5kbBlqqhALykcE6MWYdgJRafgVBS/rcrWYYT+AtjnBSq5+kaxf2HRtgwk1zBnwOevJA6fcJubBlptxmCJ9qJC7LxisMZpsiHJUQ4u6BD712YHmBrCoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780309699; c=relaxed/simple;
	bh=TfRoJn5H2150htKDlgxUzZg+ESJjTTUa6+EVSFM2IlI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IxS0iYhVWbYvqpUEm1EjY1KX9+A3ms66IJSxH5CMd2mlmYymtVot5CCktNKlNvkRmESpN0xwm70X3O73yV4sVjDozBv5dmegoKrlP0R8xKOZYbxTBHiSlYmU9EmLhZk63DffzXec0B8UbmhgxYi4D8BlDoZnCGsrQYYkFrukbGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bbLZA3z8; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F73E1F00893;
	Mon,  1 Jun 2026 10:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780309697;
	bh=nEROZ4LOz55S8/AK1V2OysBrwyBvMsVthmgneAqyCIU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bbLZA3z8fCOwkN9uUoNuHM7+3UYD7EYFMv0ScxgOyF8R95RkeKfW9dUdcIkvcWHzQ
	 8B1/X1v4qK9+2/w861bJVZqpvMzqwPGs2YFUtxaRJ4pghgFSC1kiTyT6Aej/UcPvwn
	 4Q+b10w7OGL0yXGpCon5HYJAyiN1U+1opT1KO5YWh06lFMm2vQwrJMwHOIaa7+GtH9
	 sEyu+Ji4lmVzkVGt/LXfIDzSAtiWd7A6TugKkWVqj2hGF05PpP2+QjxuLcmkmDviY8
	 MHRoWrpoGuSCvStNOcW3ZCTaBz4nNRMrWgoSencezevG1FErcXe83PGSzSz7SD9/FM
	 xv0L/STgcbpBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] rust: module_param: return value by copy from
 `value`
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andreas Hindborg" <a.hindborg@kernel.org>
Cc: linux-modules@vger.kernel.org, ojeda@kernel.org
In-Reply-To: <20260601-modules-value-ref-v2-1-12ebbf0510c9@kernel.org>
References: <20260601-modules-value-ref-v2-1-12ebbf0510c9@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 10:28:17 +0000
Message-Id: <20260601102817.9F73E1F00893@smtp.kernel.org>
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
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-modules@vger.kernel.org];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6586-lists,linux-modules=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-modules];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sashiko.dev:url,lists.linux.dev:replyto,smtp.kernel.org:mid]
X-Rspamd-Queue-Id: 7D7E161DD70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Casting a pointer of `ModuleParamAccess<T>` to `SetOnce<T>` invoke=
s undefined behavior due to missing `#[repr(C)]` on `ModuleParamAccess`.
--

commit 9dc35dfddf4037b5b314ed7586fa775219811371
Author: Andreas Hindborg <a.hindborg@kernel.org>

rust: module_param: return value by copy from value

This commit updates parameter access to be more ergonomic for Copy types
by returning the parameter value by copy rather than through a shared
reference. It changes ModuleParamAccess::value to return T by copy when
T: Copy, and renames the previous reference-returning accessor to
value_ref. The in-tree caller in rust_minimal is updated to reflect this
change.

> diff --git a/rust/kernel/module_param.rs b/rust/kernel/module_param.rs
> index 6a8a7a875643a..a33302d1b8a36 100644
> --- a/rust/kernel/module_param.rs
> +++ b/rust/kernel/module_param.rs

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but casting the pointer to
SetOnce<T> appears to rely on an unspecified memory layout.

In rust/kernel/module_param.rs:ModuleParamAccess:

pub struct ModuleParamAccess<T> {
    value: SetOnce<T>,
    default: T,
}

Since ModuleParamAccess lacks a #[repr(C)] annotation, the compiler is
free to reorder its fields. If the default field is placed before value
to minimize padding, would the cast in set_param() overwrite the default
field instead?

rust/kernel/module_param.rs:set_param() {
    ...
    // SAFETY: By function safety requirements, this access is safe.
    let container =3D unsafe {
        &*((*param).__bindgen_anon_1.arg.cast::<SetOnce<T>>())
    };

    container
        .populate(new_value)
    ...
}

Should ModuleParamAccess be marked with #[repr(C)], or should the pointer
be cast back to ModuleParamAccess<T> before accessing the value field?

> @@ -131,10 +131,26 @@ pub const fn new(default: T) -> Self {
>          }
>      }
> =20
> +    /// Get a copy of the parameter value.
> +    ///

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601-modules-va=
lue-ref-v2-1-12ebbf0510c9@kernel.org?part=3D1

