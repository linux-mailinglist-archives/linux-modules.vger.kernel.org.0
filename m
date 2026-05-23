Return-Path: <linux-modules+bounces-6524-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLUvC2xaEWrmkwYAu9opvQ
	(envelope-from <linux-modules+bounces-6524-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Sat, 23 May 2026 09:42:36 +0200
X-Original-To: lists+linux-modules@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDC15BDC3E
	for <lists+linux-modules@lfdr.de>; Sat, 23 May 2026 09:42:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 685833019154
	for <lists+linux-modules@lfdr.de>; Sat, 23 May 2026 07:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C0A30ACF0;
	Sat, 23 May 2026 07:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XLGtp7EP"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA878175A72
	for <linux-modules@vger.kernel.org>; Sat, 23 May 2026 07:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779522152; cv=none; b=N+weKbHr15QiyY3bfk+TmvClu5NUI712wcB076FAPXNObaJ2DZPUveYgnvM43FcXaDe5xrIVkhPaxw2no2Dp/vLFV5rh4EWzmTk6+H/1wHynRdYlKX/Q7xYr+Ba2LZLpJ1imn1q6ef7fN8cf+POs+sKqsrWK6vH4POECBBj4e+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779522152; c=relaxed/simple;
	bh=4cNHlqQ6Ox8WyS3kSp5lkMZGopW+SRnK6A7c8ZhqQZM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QNnlmlJJAgB2N4UygVc8OfigprdOD1Abhfa5qDQqJVmaiAtMCiDohkmt7OhfiaBJnRNnTELyJ76xCkvnUL1JBQBLack7jDhTdpENfr+L1xgM4n6YAnAxNic6moDJLKxiI2/9HDXgzgG1GblpYuurFhz0HIyKmuKgau9AB6q3RzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XLGtp7EP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F5CF1F000E9;
	Sat, 23 May 2026 07:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779522150;
	bh=1DbgNs9LIPU3FxE1MdKpKE/WFbHf3sfVMWVAiBqAXAs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XLGtp7EPsD0O20gyXoTuw3EutH8Fyguv6TQw0Pm1J6KA67pGdwd7SivEcvzhVs1/Z
	 ZCCrQc8tCCNKCmTJsmqcj8mys6O2G/c9f6itieHFc6YS1S7aHypkkMwB2JPdrSJgy0
	 /gbj6/NpZpJre8LXaKjDTpfQnUZPO9feTqTw81HOxi1XJSsMSx73sHwM9Y6CuL8RBG
	 yDOAwYYO16kfzP2fWEi3J9VRS9ygegERV+gsLmW7uevHCquPoc020nhsgCXUTsu7lF
	 t7DM4LzQvGpqlaGZeFDYU0FxYpvNVbORd0ApuOKwaFbyKfpdr0CqyroGaa9R99POMi
	 8Iw0hkEnVCUmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/24] vmlinux.lds.h: Fix ALIGN(8) omission causing
 NULL ptr on i386
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jim Cromie" <jim.cromie@gmail.com>
Cc: linux-modules@vger.kernel.org
In-Reply-To: <20260523-dd-maint-2-v2-5-b937312aa083@gmail.com>
References: <20260523-dd-maint-2-v2-5-b937312aa083@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 23 May 2026 07:42:29 +0000
Message-Id: <20260523074230.4F5CF1F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6524-lists,linux-modules=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,sashiko.dev:url,lists.linux.dev:replyto,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9BDC15BDC3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The implicit 8-byte alignment added to `BOUNDED_SECTION` macros co=
rrupts the `.notes` ELF section by injecting padding at the start, breaking=
 `PT_NOTE` parsing.
- [Low] The patch fails to apply the `_ALIGNED` variant to `.BTF_ids`, viol=
ating the commit message's stated refactoring rules.
--

commit 8b6f5abfb8521b62106505848b2663ec04bac566
Author: Jim Cromie <jim.cromie@gmail.com>
Subject: vmlinux.lds.h: Fix ALIGN(8) omission causing NULL ptr on i386

This commit explicitly adds 8-byte alignment to BOUNDED_SECTION macros to
prevent unaligned section pointers. It also introduces _ALIGNED variants
for manually aligned sections and updates existing macros to use them.

Link: https://lore.kernel.org/lkml/177402491426.6181.12855763650074831089.b=
4-review@b4/

> diff --git a/include/asm-generic/bounded_sections.lds.h b/include/asm-gen=
eric/bounded_sections.lds.h
> index 268cdc34389b0..8ff3e3420f60a 100644
> --- a/include/asm-generic/bounded_sections.lds.h
> +++ b/include/asm-generic/bounded_sections.lds.h
[ ... ]
> -#define BOUNDED_SECTION_PRE_LABEL(_sec_, _label_, _BEGIN_, _END_)	\
> +#define BOUNDED_SECTION_PRE_LABEL_ALIGNED(_sec_, _label_, _BEGIN_, _END_=
, _ALIGNED_) \
> +	. =3D ALIGN(_ALIGNED_);						\
>  	_BEGIN_##_label_ =3D .;						\
>  	KEEP(*(_sec_))							\
>  	_END_##_label_ =3D .;
> =20
> -#define BOUNDED_SECTION_POST_LABEL(_sec_, _label_, _BEGIN_, _END_)	\
> +#define BOUNDED_SECTION_PRE_LABEL(_sec_, _label_, _BEGIN_, _END_)	\
> +	BOUNDED_SECTION_PRE_LABEL_ALIGNED(_sec_, _label_, _BEGIN_, _END_, 8)

[Severity: High]
Does this implicit 8-byte alignment break the .notes ELF section by
injecting padding?

The NOTES macro in vmlinux.lds.h defines the .notes output section, which
inherits a 4-byte alignment from its input *(.note.*) sections. It often
follows RO_EXCEPTION_TABLE, which can end on a 4-byte boundary.

If the output section VMA is not 8-byte aligned, this new explicit
. =3D ALIGN(8) inside the BOUNDED_SECTION_BY macro will inject 4 bytes of
zero padding at the beginning of the .notes section.

This padding can be misinterpreted as an empty note header by external
tools and the kernel, breaking PT_NOTE parsing. Should the NOTES macro be
updated to use BOUNDED_SECTION_BY_ALIGNED(.note.*, _notes, 4)?

> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmli=
nux.lds.h
> index 9c61dd083f26a..477333bdf3d35 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
[ ... ]
> @@ -650,7 +650,7 @@
>  #define BTF								\
>  	. =3D ALIGN(PAGE_SIZE);						\
>  	.BTF : AT(ADDR(.BTF) - LOAD_OFFSET) {				\
> -		BOUNDED_SECTION_BY(.BTF, _BTF)				\
> +		BOUNDED_SECTION_BY_ALIGNED(.BTF, _BTF, PAGE_SIZE)	\
>  	}								\
>  	. =3D ALIGN(PAGE_SIZE);						\
>  	.BTF_ids : AT(ADDR(.BTF_ids) - LOAD_OFFSET) {			\

[Severity: Low]
The commit message states "update BOUNDED_SECTION uses inside . =3D ALIGN(x)
stanzas to use _ALIGNED variants".

Was .BTF_ids intentionally omitted from this rule?

It sits right below .BTF and also has an outer . =3D ALIGN(PAGE_SIZE), but
still uses the base BOUNDED_SECTION_BY macro. This doesn't cause functional
issues since it is already page-aligned, but it leaves the macro usage
inconsistent with the stated refactoring rules.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260523-dd-maint-2=
-v2-0-b937312aa083@gmail.com?part=3D5

