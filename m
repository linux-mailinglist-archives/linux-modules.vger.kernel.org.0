Return-Path: <linux-modules+bounces-6584-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDsAN6ZgHWojZwkAu9opvQ
	(envelope-from <linux-modules+bounces-6584-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Mon, 01 Jun 2026 12:36:22 +0200
X-Original-To: lists+linux-modules@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6474361D986
	for <lists+linux-modules@lfdr.de>; Mon, 01 Jun 2026 12:36:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9565530FBC93
	for <lists+linux-modules@lfdr.de>; Mon,  1 Jun 2026 10:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE33639A076;
	Mon,  1 Jun 2026 10:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HbzH8r55"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D1E394E91;
	Mon,  1 Jun 2026 10:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780308631; cv=none; b=sLz3ZKJ+adZ1IqkwDd5TxMfFBvNFSU1Fvum1uxOdMc3a7+Dbe37zHcsqRXSrqJsFkzyA4I7G3iVm8XIMxY1adn5fsp7JTF/soYW7C+Uz7TTzoSDcQUxG20qxppwVyziZ5j9Vr2RT9WW8/PYTMv9dC3xEU56sg9Qj1SzuXaDzHww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780308631; c=relaxed/simple;
	bh=xw6EOQOZa57QEzNICPTlKfQ1oFLxa1x8tG3sAZOkU0c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RPAx1flzhye6vZC0R4FjvSKJmIFa6JlGX6oeO6h1yz9f2tdOgbiHHP6WmFZc5kxK6Sg2f21k90LFVYbkvobIJ5Vf6gIQlyY01aXJSgSaB+6gKUILOtrUzYb7h1o6/w89a2ahh+PHiSY3yx2FmL5hWgFnUw8+S7j0U6cNLaB1GZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HbzH8r55; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A45C91F00893;
	Mon,  1 Jun 2026 10:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780308624;
	bh=vfQ8+IUZDhxYmHScq4CKs3ZZbxy5wKvV5kA45jMiA2c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=HbzH8r55hZFyZwyMzjLlbmm9PSCQv53MO1ij2E36tp4yH6h2wizdXHOZ+TkjUc66n
	 lAuf0IQAWUH7lYPglQknJDYE6/LQRhQYwWFnYfOCQRjEcJeOBxaRSDO4mFv0/9TNmK
	 ax2B1k34PMyP2F2nCNbWEcGWhg680+IY+P075BE2uUcCKMBOQVQdscShsb+2LfqfBV
	 DDVyJ5NInJ5DOS1mkn7EgMM7E3Skh2kqMWw3s8ifJkh4earqYpOihxjpeM++KpQ60+
	 Kjzh07XlZKU7pC8a5h2UonhZYkdMQRieio3LtYIYVbHul2nzwJmPH60OOV7gIr5XS/
	 C6QKf6TJKAnZg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Luis Chamberlain <mcgrof@kernel.org>, Petr
 Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, Sami
 Tolvanen <samitolvanen@google.com>, Aaron
 Tomlin <atomlin@atomlin.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun
 Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6r?=
 =?utf-8?Q?n?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: module_param: return value by copy from `value`
In-Reply-To: <DIV5NRUFAGLY.1RH2GL15CYQCG@garyguo.net>
References: <20260529-modules-value-ref-v1-1-a0df7e9e6f2d@kernel.org>
 <DIV5NRUFAGLY.1RH2GL15CYQCG@garyguo.net>
Date: Mon, 01 Jun 2026 12:10:15 +0200
Message-ID: <878q8y7erc.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6584-lists,linux-modules=lfdr.de];
	FREEMAIL_TO(0.00)[garyguo.net,kernel.org,suse.com,google.com,atomlin.com,protonmail.com,umich.edu];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a.hindborg@kernel.org,linux-modules@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-modules];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6474361D986
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

"Gary Guo" <gary@garyguo.net> writes:

> On Fri May 29, 2026 at 9:41 AM BST, Andreas Hindborg wrote:
>> For `Copy` parameter types it is more ergonomic to retrieve the
>> parameter value by copy than through a shared reference. Change
>> `ModuleParamAccess::value` to return `T` by copy when `T: Copy`,
>> and rename the previous reference-returning accessor to
>> `value_ref`. Update the in-tree caller in `rust_minimal`.
>>
>> Suggested-by: Alice Ryhl <aliceryhl@google.com>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>> This change was suggested during review of the rust null block series [1].
>>
>> [1] https://lore.kernel.org/r/abfe2LbhLzXiGCkA@google.com
>> ---
>>  rust/kernel/module_param.rs  | 15 ++++++++++++++-
>>  samples/rust/rust_minimal.rs |  2 +-
>>  2 files changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/rust/kernel/module_param.rs b/rust/kernel/module_param.rs
>> index 6a8a7a875643..701210206bba 100644
>> --- a/rust/kernel/module_param.rs
>> +++ b/rust/kernel/module_param.rs
>> @@ -132,9 +132,12 @@ pub const fn new(default: T) -> Self {
>>      }
>>  
>>      /// Get a shared reference to the parameter value.
>> +    ///
>> +    /// Returns a reference to the value supplied at module load time, or a
>> +    /// reference to the default value if the parameter has not been set.
>>      // Note: When sysfs access to parameters are enabled, we have to pass in a
>>      // held lock guard here.
>> -    pub fn value(&self) -> &T {
>> +    pub fn value_ref(&self) -> &T {
>>          self.value.as_ref().unwrap_or(&self.default)
>>      }
>>  
>> @@ -146,6 +149,16 @@ pub const fn as_void_ptr(&self) -> *mut c_void {
>>      }
>>  }
>>  
>> +impl<T: Copy> ModuleParamAccess<T> {
>
> Instead of adding a new impl block, this should just be moved to immediately
> after (or before) `value_ref` with a `where T: Copy` bound instead.
>
> This makes related code close together for readers of the code.

Will do.


Best regards,
Andreas Hindborg




