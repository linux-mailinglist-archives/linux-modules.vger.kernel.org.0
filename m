Return-Path: <linux-modules+bounces-6558-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILjcCY8vFmqQiwcAu9opvQ
	(envelope-from <linux-modules+bounces-6558-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Wed, 27 May 2026 01:41:03 +0200
X-Original-To: lists+linux-modules@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8AE5DD962
	for <lists+linux-modules@lfdr.de>; Wed, 27 May 2026 01:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57A5E304972B
	for <lists+linux-modules@lfdr.de>; Tue, 26 May 2026 23:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78973D1AAA;
	Tue, 26 May 2026 23:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MsU9QSon"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FF83D1A9C
	for <linux-modules@vger.kernel.org>; Tue, 26 May 2026 23:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779838845; cv=none; b=R//4p8wzGjlk+C0wp+OyCOj7XHAfGvRkrTCWn7q5nIgdXz8HjS9Dhp7XwzQlWEfBXK5frWoTCRcUOg36IemLuvrHiFRm2uhElef2JyFeRK6LXOfqHv9bCzCbICfVnkkPPT18C3x0e1iaHMU1rQq8KdG5WL2dRyUA8GYFOeHfIQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779838845; c=relaxed/simple;
	bh=ue5Qj3tkiBpJBhqMgsSCI+ppGyow/fPJ2WxBTPFrOQo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SLTGd3/ZnzFKI3Eit+039m+AmTOCdwuVBeKe1KP2UlHTYxKquDlC9l1ONpQctbGvagxQDek/LFrnMjlp5VqFEEK1Wuw/JOCF/VyKmnVDmzQI7z9yRo6Fx5L/PcXxC3U1yonDEEbmoA1sv+CbIEW//b5x3yDQv9tr4z3VpNFbgRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MsU9QSon; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-132d631edaaso3351676c88.0
        for <linux-modules@vger.kernel.org>; Tue, 26 May 2026 16:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779838840; x=1780443640; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2C0S2w8UKATUl0Jp7xshg/gDFeia5kPjP02r6MRcxxY=;
        b=MsU9QSonQU+TTLF/T4Lac4rxoXB79O0BacKB0qys1jCleyL5vMWhnP5GbL6JbwJQjE
         8oupWMzY/rMpBwXxXjKxY2wVbSuy5fCAVtS8lZQ6MzU8ELJTlV0FKf6z75FpkRCMwUV8
         1Gguag8X+C7Yny8LRcC/monffEVRRmSUc0YKbxvLjfYiOq4te4uaGW70coSuaB1XD2c1
         WFGjHTrEjegfQ4LvYT+xphnY7jO0z6W4PaJfR+VFt18mwnkD9FYV/D4+q9WCIpZjP5AB
         1sZlnRvREyqJkEzoqhFi2ChuYMR1o086S6yFSjBAKov1rcYWbP1zhOY20AOIbTsnnaaH
         aSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779838840; x=1780443640;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2C0S2w8UKATUl0Jp7xshg/gDFeia5kPjP02r6MRcxxY=;
        b=KjaKsIxoktiV5rAf2OwARn3QnZk8/zr3vEnhbTkJsW5EY6AZLRJl08TI4zaOp21IfM
         Zlz9A5CKLHnDK/w9yPgQ6t7bMwfecmWpd3yNNnrFCsZ8Q4maH2eQJT3pI3V4Y2Af6Kx5
         eiXtccdwmiDWyjQvRENFDWng78DNa3FYFQUiCK6gF7b3kAeqweypOeTeeXF5V44nvJCd
         Z04zKs4CktvigQ0TNGv6cr99Zd+IkvYiprlR+4fqdw58fA2KZvQ9EZByrwflflvKBiag
         yEtZKhL7qA3tLeCx9Mx4oNR1UMUqMVacOynfVQWggTr31ioN5tznTWbnbuzLKiOzSkCP
         Jm2g==
X-Gm-Message-State: AOJu0YyY/wXdJ3diXf7HYlhpyRo7IQ9T+cGgfMwdr77xqJ7qoC2yvt/d
	DRCuypL0R/UPjjjrdzqDsp4UC5QmqfrxwrqHaBZlRlGgXMhicmcoQDVcNzDfqaVk9xJ+y38I7Mg
	xAlVxEMvYDK6phd/1Xca+hlSG2ADC1w==
X-Received: from dlbsi4.prod.google.com ([2002:a05:7022:b884:b0:136:420:2090])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:f313:b0:12d:b7e5:a67b with SMTP id a92af1059eb24-1365f81e628mr4025340c88.14.1779838840126;
 Tue, 26 May 2026 16:40:40 -0700 (PDT)
Date: Tue, 26 May 2026 23:40:39 +0000
In-Reply-To: <20260427-params-pr-once-v1-1-3a8c64704cc4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260427-params-pr-once-v1-1-3a8c64704cc4@kernel.org>
X-Mailer: b4 0.14.3
Message-ID: <177983883957.35274.15506019019254966722.b4-ty@google.com>
Subject: Re: [PATCH] rust: module_param: use `pr_warn_once!` for null pointer warning
From: Sami Tolvanen <samitolvanen@google.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,suse.com,atomlin.com,garyguo.net,protonmail.com,google.com,umich.edu];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6558-lists,linux-modules=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[samitolvanen@google.com,linux-modules@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-modules];
	NEURAL_HAM(-0.00)[-0.978];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: AF8AE5DD962
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 27 Apr 2026 10:11:35 +0200, Andreas Hindborg wrote:
> Replace `pr_warn!` and the accompanying TODO with `pr_warn_once!`, now that
> the macro is available.
> 
> 

Applied to modules-next, thanks!

[1/1] rust: module_param: use `pr_warn_once!` for null pointer warning
      commit: 8d2a562b7efe98fdea57d10caaced911fca46a3f

Best regards,

	Sami



