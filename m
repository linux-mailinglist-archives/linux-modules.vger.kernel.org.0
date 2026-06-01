Return-Path: <linux-modules+bounces-6614-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDFiIBZ5HWrEbAkAu9opvQ
	(envelope-from <linux-modules+bounces-6614-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Mon, 01 Jun 2026 14:20:38 +0200
X-Original-To: lists+linux-modules@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7656061F2B1
	for <lists+linux-modules@lfdr.de>; Mon, 01 Jun 2026 14:20:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D165D300B2BA
	for <lists+linux-modules@lfdr.de>; Mon,  1 Jun 2026 12:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D663374725;
	Mon,  1 Jun 2026 12:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="idxrSPbO"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A30E371880
	for <linux-modules@vger.kernel.org>; Mon,  1 Jun 2026 12:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780316431; cv=none; b=VbORHfugWy0z189/khQJeAjdJ4dwn2XoPFO0T/mSX8TMVwx94BS/SPWoKBRkIsCDvRQouHnqUipdO0faChdZ6fRSvSkUJ20s2SZE4keJrL+nmtA69HXxwiUM3b+I8qmyZkzQYpnJjPf3XkBOGuSUyfjXv8F7F0kcnOn2V2fdLZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780316431; c=relaxed/simple;
	bh=J9dM6bce8WQvO0CD3kE9zq4qRXQWdLiSjW3T2/HZUEo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G5gy5bkP4EkTSKCubl8x9qnSKN8BPK9XizwHpXgtDZO14TZLrncu6txGsh9SCiePySnPNkivlO0+CGht9YcoZirFradlEKhoLD0k/UNytU7NyxGAUCuuGGZCeiv/SRh+XD8B9qIp+uDTANcU14TpWRE9efRezDAl2gfb5SnTjtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=idxrSPbO; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95F501F00893;
	Mon,  1 Jun 2026 12:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780316429;
	bh=CTWh+AqktMaHeRQYI2X21fWWb2qkhYG67jnspKgL2og=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=idxrSPbOCS8RpaIW0bnP/VbHx92l0phNGFM+7c51rQdNRjUKfVlY4LT6sjZlGgNtn
	 /45SJJWqDS1AE4rbE2YiphETiBqpp/hDtVnDIgeAVhHiWFQtxSswzy8oAVih9ZEo1F
	 Y2ZD5uKpGEhUHlSLYKXOxP5zYtBbN7QjXR5P5fIq9oAYQuRqLKy1FstaXQhHcPy5tm
	 vWNPyI7h/2N0BvddiwB0gcZimMi60/qSmGEeRDgMQM+ouWUzpe6tMfVU/Kojc9xNBA
	 iNvfxyhiZyV8JmCtYcCAjD88mnDrJYcvJrPcLYnOT0wcnj1Lv+YnavBcP1y5MOSckx
	 i1eW6XJrkEBSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 19/24] dyndbg,module: make proper substructs in
 _ddebug_info
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jim Cromie" <jim.cromie@gmail.com>
Cc: linux-modules@vger.kernel.org
In-Reply-To: <20260601-dd-maint-2-v3-19-4a15b241bd3c@gmail.com>
References: <20260601-dd-maint-2-v3-19-4a15b241bd3c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 12:20:29 +0000
Message-Id: <20260601122029.95F501F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6614-lists,linux-modules=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,smtp.kernel.org:mid,sashiko.dev:url]
X-Rspamd-Queue-Id: 7656061F2B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Built-in modules without class maps incorrectly inherit the glob=
al built-in class maps array, violating state invariants and causing perfor=
mance regressions on queries.
--

commit 97c08d5dc7f7ec501676f73addba8ad9f6c67352
Author: Jim Cromie <jim.cromie@gmail.com>

dyndbg,module: make proper substructs in _ddebug_info

This patch recomposes struct _ddebug_info by inserting proper sub-structs
for descriptors and class maps. It updates the usage of this struct as a
cursor for built-in module data and module state access. Note that the
regression detailed below was fixed later in the patch series by commit
b54eb6f1ef1ecdd4f503388db9a2426bb84d49d1.

> diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> --- a/lib/dynamic_debug.c
> +++ b/lib/dynamic_debug.c
> @@ -1176,12 +1177,12 @@ static void ddebug_attach_module_classes(struct d=
debug_table *dt, struct _ddebug
>  	 * the builtin/modular classmap vector/section.  Save the start
>  	 * and length of the subrange at its edges.
>  	 */
> -	for_subvec(i, cm, di, classes) {
> +	for_subvec(i, cm, di, maps) {
>  		if (!strcmp(cm->mod_name, dt->mod_name)) {

[ ... ]

>  		} else if (nc) {
>  			/* end of matching classmaps */
>  			break;
>  		}
>  	}
>  	if (nc) {
> -		dt->num_classes =3D nc;
> +		dt->info.maps.len =3D nc;

[Severity: Medium]
When a built-in module does not have any class maps (so nc remains 0), this
function will exit without setting dt->info.maps.len to 0.=20

Because dt->info was populated by a shallow copy of *di earlier in
ddebug_add_module(), this leaves dt->info.maps.len set to the global built-=
in
class maps array length. Does this cause modules without class maps to
incorrectly retain the entire global class maps array bounds?

This appears to degrade query time complexity, as ddebug_change() will fals=
ely
find class maps in these modules and needlessly iterate over all their
descriptors.

>  		vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
>  	}
>  }

[ ... ]

> @@ -1220,19 +1221,18 @@ static int ddebug_add_module(struct _ddebug_info =
*di, const char *modname)
>  	 * this struct ddebug_table.
>  	 */
>  	dt->mod_name =3D modname;
> -	dt->ddebugs =3D di->descs;
> -	dt->num_ddebugs =3D di->num_descs;
> +	dt->info =3D *di;

[Severity: Medium]
This shallow struct copy initializes the module's maps with the global array
bounds. Before this patch, dt->num_classes was correctly initialized to 0
by kzalloc_obj(*dt) and only updated if classes were found.

If ddebug_attach_module_classes() doesn't overwrite dt->info.maps.len for
modules with no class maps, does this break the contiguous subrange invaria=
nt?

> =20
>  	INIT_LIST_HEAD(&dt->link);
> =20
> -	if (di->classes && di->num_classes)
> +	if (di->maps.len)
>  		ddebug_attach_module_classes(dt, di);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601-dd-maint-2=
-v3-0-4a15b241bd3c@gmail.com?part=3D19

