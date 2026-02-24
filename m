Return-Path: <linux-modules+bounces-5783-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPJlDZ/vnWkHSwQAu9opvQ
	(envelope-from <linux-modules+bounces-5783-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Tue, 24 Feb 2026 19:36:15 +0100
X-Original-To: lists+linux-modules@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 907C218B79B
	for <lists+linux-modules@lfdr.de>; Tue, 24 Feb 2026 19:36:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59A3E30BEE42
	for <lists+linux-modules@lfdr.de>; Tue, 24 Feb 2026 18:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E0E3AA1BB;
	Tue, 24 Feb 2026 18:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2PxMZRMk"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D711D3A0E8E
	for <linux-modules@vger.kernel.org>; Tue, 24 Feb 2026 18:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771958050; cv=none; b=nzfYYKWCMI9/znsvL/CDmNwv1Ui7qHYcM/b3cAQ+8PPLJFsQC4ETQM0oLLZJ+qNqnsq5vuIXOa1yY63QmboUwMVjQctBABpFM5k2E/QIFl/Gyvjbrj0ruhj8HI6WzWRXAuYhncD4rwFJkjSUCHgRF34vtUp35TMXakOQpzUUcDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771958050; c=relaxed/simple;
	bh=J11iK2XwIj2+zXIcYCQZxiKQs/qMUnRO89klT0AGl1I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XaH/LcRJf/Er/skb42REP8s90LkXG9FfvcJwqk6mk3E+L7KE2efYhwo0NP1iGy7DuxgDhpIomQ9FFOul30Qvzci55QkiKpgtqElxBE983l/oeKK4d9Xr3XSTUhBwdx5njhM6ctU6A2NERMw5HQgoccLoEIor3BLgOZnPzQqJh38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2PxMZRMk; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2bdbe1bd565so238925eec.1
        for <linux-modules@vger.kernel.org>; Tue, 24 Feb 2026 10:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771958048; x=1772562848; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QrjBvSrm8JFCEhJvVydTf7Q6kCsOJiDnm0ZLRH2yvhY=;
        b=2PxMZRMkvwdPT6xmoQWt26Bz7LxYouErxHbvwHpyCRpyKkAEiMZw8KBiIBg284l0UR
         rtByLaeejleh76tViNccPtvMoMwjDzGLrD8GMB6spm/oT7ULoRjp1sJEIDvccw+AM5f0
         mL5Owi6Pjy/3hz5snmZIlMTcB4gQMBt2Qw3ti9ulThlUP93RHkgKVKk+otIiSlsSaPQU
         /c4AwOHIwI9Ojy63pFWM1uUZTr/9Ytq610yfVjDwuk0RhrulAAvSttVQOXYCPxn776E+
         rGOG3KK/FH14b2fU5OqogoRGcN7f8Lkuq5lIa6icsKjV1Bw+UkgETMBU2Tdilub01cme
         OFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771958048; x=1772562848;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QrjBvSrm8JFCEhJvVydTf7Q6kCsOJiDnm0ZLRH2yvhY=;
        b=okbeF6R/EjSOugTNmSaQK186bSNZZ/rAOXeTczJO21UMjGtTFM4tr7Tx/VG7M/26TA
         51+DOZpxZGu9DPjPyhqu7B2rff9npraz6wpNjpSrbwEPW/fVFQcNi47E5O1DFlwwLLh8
         YNcVnk5iwptQLdUAbhZOu9eVUANywZQVgoSYg+Qqb9SuVT+t8YzzP8P2vIyWAFY+xYZv
         pB/xmiF/L8kWc2x+D5PcX92pEr94kSE3+C28bN0PPMP2CZf2Lkfic18WK1BEPifJURan
         Z5Z3b5sv7+qysyqJjtogVvKWBJRGEnqB0xBoiteQvgClbt3hBCs/SQEQhPv68PPzHbSU
         RsXQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4yxqSZ/qP445FFrxDHhHZ+k/4R7bkoXfNuuVti8zkqcXVqC1+pjiLmexMt0i0/LHpsprkvgw8U2EHN31J@vger.kernel.org
X-Gm-Message-State: AOJu0YxZIuIeAlrDB7QudnHEKo4wfmykJmDBMaY5oVKIzFPUauhQG8Bk
	yTSSgj4zAeX8t97Pm/GW731/jhN//h8dQPPcwPPHUCObhgOO1+Lwk173rryuqbGHAdZnzRMVLp5
	iNp85fMH/CFwocPmUDA6M2hfJ93zzuQ==
X-Received: from dycng10.prod.google.com ([2002:a05:7300:ce0a:b0:2ba:963b:54da])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:d718:b0:2ba:6ffe:450 with SMTP id 5a478bee46e88-2bd7bd3aa44mr4531030eec.33.1771958047807;
 Tue, 24 Feb 2026 10:34:07 -0800 (PST)
Date: Tue, 24 Feb 2026 18:34:06 +0000
In-Reply-To: <20251230183208.1317279-1-ihor.solodrai@linux.dev>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251230183208.1317279-1-ihor.solodrai@linux.dev>
X-Mailer: b4 0.14.3
Message-ID: <177195804671.1905199.15508123005606240406.b4-ty@google.com>
Subject: Re: [PATCH] module: Fix kernel panic when a symbol st_shndx is out of bounds
From: Sami Tolvanen <samitolvanen@google.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5783-lists,linux-modules=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,suse.com,iogearbox.net,linux.dev,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[samitolvanen@google.com,linux-modules@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-modules];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 907C218B79B
X-Rspamd-Action: no action

On Tue, 30 Dec 2025 10:32:08 -0800, Ihor Solodrai wrote:
> The module loader doesn't check for bounds of the ELF section index in
> simplify_symbols():
> 
>        for (i = 1; i < symsec->sh_size / sizeof(Elf_Sym); i++) {
> 		const char *name = info->strtab + sym[i].st_name;
> 
> 		switch (sym[i].st_shndx) {
> 		case SHN_COMMON:
> 
> [...]

Applied to modules-next, thanks!

[1/1] module: Fix kernel panic when a symbol st_shndx is out of bounds
      commit: f9d69d5e7bde2295eb7488a56f094ac8f5383b92

Best regards,

	Sami



