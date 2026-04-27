Return-Path: <linux-modules+bounces-6328-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDGAJEBJ72lO/wAAu9opvQ
	(envelope-from <linux-modules+bounces-6328-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Mon, 27 Apr 2026 13:32:16 +0200
X-Original-To: lists+linux-modules@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9566C471C70
	for <lists+linux-modules@lfdr.de>; Mon, 27 Apr 2026 13:32:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 89FD0301580F
	for <lists+linux-modules@lfdr.de>; Mon, 27 Apr 2026 11:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C1D3B8BB2;
	Mon, 27 Apr 2026 11:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hj3hDcte"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A622B3B8921;
	Mon, 27 Apr 2026 11:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777289344; cv=none; b=CfIBCVcMdn7R6XQX6ThOjv8wYpxrzak37J2P/LXtT4+iYBp8u+lBn3cOaxq3Ql5Irtryr6ZQ32ZCLiqNQ6H3HyYaozL8D93ynZa5yYrY0cVHEoRja7IJWELhAanNHgV4QiwWMPv4KHhQswBNWZrzXhy/HiDPjxpo01/vv8Ygdw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777289344; c=relaxed/simple;
	bh=70r7fSEnH0CEsVRa27rLWqlD7lAp7l0plvtFvK+ONyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fqfDDmpqrD/yGANnT/MdpldZpdcOrhriFjhe8F53qdyvukNqOcfzFGefvVaoxUgbdGa97PdIXQm/vMzOZB4NWrwST19F96z5cJ81OxkkTHRkTIHFIaGCwzelS4/MLBiuwUN9u4XF/02MLPzG0cSC0SofayW1+tkTNnlpIcZMwmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hj3hDcte; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5405C19425;
	Mon, 27 Apr 2026 11:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777289344;
	bh=70r7fSEnH0CEsVRa27rLWqlD7lAp7l0plvtFvK+ONyY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Hj3hDcteVdta+yCjx7SEyhoGBg9EWWTm5YRyle7G3FHxrn/uhgnTGxjKr4r/MjJyM
	 TU+X+Y+IrZCvZ0a/6O4w2BUQZYWa6dFPWVNF8FZYr/FUsYxRXQ3RwUqBMtyKw1IkTY
	 yp5jL3peAO92yA/6eTWpJkqaOqEoXNq5yt4nCjEoK17oyfVc8K36CHqhp3hZC7WaCy
	 FqAqBvWexs2Zg3lYMd6S2tlTkNL05p807ywr/M3Q2xXbUoiC3CYSr1hJGbRhmX6PQX
	 pp08asOfTDST0CRmY8gAPdIQC6oyLEmMw4aQbGA+pKD7rjFg28F4iVu5npzitpSkt2
	 BIy+qKDUCx6hw==
Message-ID: <b5b5d2de-2be7-4bcf-b4f4-1dda6b09130a@kernel.org>
Date: Mon, 27 Apr 2026 13:28:57 +0200
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: module_param: use `pr_warn_once!` for null pointer
 warning
To: Andreas Hindborg <a.hindborg@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20260427-params-pr-once-v1-1-3a8c64704cc4@kernel.org>
Content-Language: en-US
From: Daniel Gomez <da.gomez@kernel.org>
In-Reply-To: <20260427-params-pr-once-v1-1-3a8c64704cc4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9566C471C70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,suse.com,google.com,atomlin.com,garyguo.net,protonmail.com,umich.edu];
	TAGGED_FROM(0.00)[bounces-6328-lists,linux-modules=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[da.gomez@kernel.org,linux-modules@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-modules];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,samsung.com:email]

On 27/04/2026 10.11, Andreas Hindborg wrote:
> Replace `pr_warn!` and the accompanying TODO with `pr_warn_once!`, now that
> the macro is available.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Available since v7.0-rc1. LGTM,

Reviewed-by: Daniel Gomez <da.gomez@samsung.com>

