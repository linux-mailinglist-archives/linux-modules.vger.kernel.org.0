Return-Path: <linux-modules+bounces-6121-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HbmKzDeuWnNOwIAu9opvQ
	(envelope-from <linux-modules+bounces-6121-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Wed, 18 Mar 2026 00:05:20 +0100
X-Original-To: lists+linux-modules@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0142B36E2
	for <lists+linux-modules@lfdr.de>; Wed, 18 Mar 2026 00:05:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0EB0A314FC48
	for <lists+linux-modules@lfdr.de>; Tue, 17 Mar 2026 22:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C703F880E;
	Tue, 17 Mar 2026 22:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oSvIPiSJ"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E511C8634;
	Tue, 17 Mar 2026 22:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788161; cv=none; b=P/WhJeApLafHiNlX/LNF2PC+DvbxxhGnUgiXtI0C115+ZxPO+7Zwg5yGvcaHuhxTua5sKrfZ7Aduv04+I3PfAbCRyA9Tlp34ryha04iYpSWUnylsEZYXp4d5Sbu2iKQTMwBeiO5TotyNTJpdwA2oAj0OL+0OuUmAxYfJGHpecCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788161; c=relaxed/simple;
	bh=KYNip1ZW/5yQuk+dSXO5QFxizLm9d/s84r+MOvy0seA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GFbVuNU28hrcoaUDjuN2uHxcpua77EjEdtEtWfNsyE7SE+k2XTFOyJcAkqq6rGrhf2qTQ1zKeKuSevvIh7PFqBPER7gNxk6QCDoQ3U5TBWK/BXuvV3/NxyIbrleCYsR52QaWvaV1wwf076U2IxhLiAHgqp5Lw4jJkQQTP+BTvUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oSvIPiSJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 081DCC4CEF7;
	Tue, 17 Mar 2026 22:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773788160;
	bh=KYNip1ZW/5yQuk+dSXO5QFxizLm9d/s84r+MOvy0seA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oSvIPiSJhgFlVTDjmykqRaREdrvRL7z1dLNhXV/M3Uq75/aaYcNMjlotMGPCuJm7s
	 LaA/tdBcQoWbT8NLlluNd3K9rsGtNETpKe5/GkGUbt9Gry5IY0dyLygO3SoAb2MeKK
	 vsbTcpRvdpyX8Uu2T7mhGwi7k+mWq+jcetoI+Bk5KzlH9xViwb+TrC84xarOZubvXV
	 QDECOnS/t4qo+QsQFxh4sxkkGMiW3ksfHWvZ5wsHh1znvMnYgHVKP1r3WeaK0WfKvf
	 hkmKH7H1i+9IxEwixLikbBDEwbLsmsNQ2pSeDpfwA0+E+ZbHDi4vWFIs97L1JaFXPX
	 fAbTaGda0b/rg==
Date: Tue, 17 Mar 2026 15:55:57 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>, linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	Aaron Tomlin <atomlin@atomlin.com>, Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH v2] module.lds,codetag: force 0 sh_addr for sections
Message-ID: <jl7b2iy44nakt6qiyytncemcym22aoddrjixblxcrfgjnnfc3k@vpmf2yfnrokr>
References: <20260305015237.299727-1-joe.lawrence@redhat.com>
 <20260311211207.GA2440964@google.com>
 <3969f887-4d3d-4fb8-870d-6af834d120e5@suse.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3969f887-4d3d-4fb8-870d-6af834d120e5@suse.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6121-lists,linux-modules=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jpoimboe@kernel.org,linux-modules@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-modules];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4D0142B36E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 03:23:20PM +0100, Petr Pavlu wrote:
> > Do we also need similar changes in any of the architecture-specific module
> > linker scripts (arch/*/include/asm/module.lds.h)?
> 
> I overlooked these architecture-specific files. I believe we should do
> the same for them. For instance, riscv explicitly defines the .plt, .got
> and .got.plt sections, and they have misleading addresses:
> 
> $ readelf -t fs/xfs/xfs.ko
> [...]
> Section Headers:
>   [Nr] Name
>        Type              Address          Offset            Link
>        Size              EntSize          Info              Align
>        Flags
> [...]
>   [48] __versions
>        PROGBITS         0000000000000000  0000000000194e90  0
>        0000000000007900 0000000000000000  0                 8
>        [0000000000000002]: ALLOC
>   [49] .plt
>        PROGBITS         0000000000007900  000000000019c790  0
>        0000000000000001 0000000000000000  0                 1
>        [0000000000000006]: ALLOC, EXEC
>   [50] .got
>        PROGBITS         0000000000007901  000000000019c791  0
>        0000000000000001 0000000000000000  0                 1
>        [0000000000000003]: WRITE, ALLOC
>   [51] .got.plt
>        PROGBITS         0000000000007902  000000000019c792  0
>        0000000000000001 0000000000000000  0                 1
>        [0000000000000002]: ALLOC
> [...]
> 
> Nonetheless, this can be done separately. I think fixes for these files
> should better go through architecture-specific trees anyway.
> 
> I can check the individual architectures and prepare the necessary
> patches, unless someone else is already looking into this or wants to
> take a look.

I agree those can be done separately.  In the meantime do you plan to
take this patch in the module tree?

-- 
Josh

