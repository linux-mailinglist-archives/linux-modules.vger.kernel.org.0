Return-Path: <linux-modules+bounces-6142-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLI8OClBwWmqRwQAu9opvQ
	(envelope-from <linux-modules+bounces-6142-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Mon, 23 Mar 2026 14:33:29 +0100
X-Original-To: lists+linux-modules@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4CD2F2FF3
	for <lists+linux-modules@lfdr.de>; Mon, 23 Mar 2026 14:33:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A3233099B19
	for <lists+linux-modules@lfdr.de>; Mon, 23 Mar 2026 13:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F5539A805;
	Mon, 23 Mar 2026 13:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H8dWRVbT"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046492139C9;
	Mon, 23 Mar 2026 13:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272206; cv=none; b=Z/qweArA5Mhxt7aYbQVj2BhYWE8vUL43DHoeCANHfT7wDizQaw7YBe7CH1kwIGLkvD3hr7Y5TyPJXykk5/AIOhMkCS25c9ZTOi06GbvwvQkFhMBzxhMNI7B/2ef2ksTXmmGx82rZi++DxsovJADLSgmuQ/3ew7tEJPBK676st6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272206; c=relaxed/simple;
	bh=5+ioQJUeIDf/x0qzWPmvHNI8zlIsgnW7A1U9GUXzrdc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Dngqb7KFXr60rXx8M2ymE9RGzzlOAu4vmqoIDs03LoC722FxjdAU14fwKWT5V33ffP9YiTlLZtPDxnq2OeL+bUgtrS2Yw+xhsPpJeOU2Xn2nbu5OR+I5EPJYsbFlSVMjbOYpo9j08qRO408h/1H4mVopk20WrnyTcqQk4bfdM0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H8dWRVbT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ADDFC4CEF7;
	Mon, 23 Mar 2026 13:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774272205;
	bh=5+ioQJUeIDf/x0qzWPmvHNI8zlIsgnW7A1U9GUXzrdc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=H8dWRVbTh8ae/Uz/9VC+O9tyLKIktjqn/3Hd+OtF7JAttrvkLwkKiP/NgyUex4A8F
	 97r5Y2LkvDSpkrtc0MT0eUYOBzh/dl81krT66M5rQ9WbacibSRQsmZ3HXhIxYxfMl8
	 4iJdCTxnDHmdRwhJ0KNaRs5mlmJv/KnQMTGv3Dx5NTz9Gzr7DDDhGFTlwnK5PR3EGw
	 rRJPccU9qf3hB0yOfPI6VaawDUS/yCjWLEKOlZ7bmoBRJCcv11ZOkXm/L4JU1MPi2Z
	 gNDmjAjWqFJHyes+/GwpONp6WgB/TBdOdZLGEEpUqZ5msbzWTq4Z1q+rKxdfzshA/B
	 XyvYTDqgSO+TQ==
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
Subject: Re: [PATCH] rust: module_param: return copy from value() for Copy
 types
In-Reply-To: <DHA6CNZ4W0DH.388Y1VMS61C7T@garyguo.net>
References: <20260323-module-value-ref-v1-1-32507e1085f1@kernel.org>
 <B35EIugB0ZiXtxZAHa1AuIDljufS1ZaLB2mKQKnsZ6V88hCAHK1cPnOVtfoXYGK1JBY-e8tU7PrQ07_LvUzcFA==@protonmail.internalid>
 <DHA6CNZ4W0DH.388Y1VMS61C7T@garyguo.net>
Date: Mon, 23 Mar 2026 14:23:14 +0100
Message-ID: <87fr5qr871.fsf@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6142-lists,linux-modules=lfdr.de];
	FREEMAIL_TO(0.00)[garyguo.net,kernel.org,suse.com,google.com,atomlin.com,protonmail.com,umich.edu];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,garyguo.net:email]
X-Rspamd-Queue-Id: 7A4CD2F2FF3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

"Gary Guo" <gary@garyguo.net> writes:

> On Mon Mar 23, 2026 at 12:47 PM GMT, Andreas Hindborg wrote:
>> Rename the existing `value()` method to `value_ref()` which returns a
>> shared reference to the parameter value, and add a new `value()`
>> method on `ModuleParamAccess<T>` where `T: Copy` that returns the
>> value by copy.
>>
>> This provides a more ergonomic API for the common case where the
>> parameter type implements `Copy`, avoiding the need to explicitly
>> dereference the return value at call sites.
>>
>> Currently `value_ref()` has no in-tree callers, but it will be needed
>> when support for non-`Copy` parameter types such as arrays and
>> strings is added.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>> This change was suggested at [1].
>>
>> Link: https://lore.kernel.org/r/87cy13swpw.fsf@t14s.mail-host-address-is-not-set [1]
>> ---
>>  rust/kernel/module_param.rs  | 11 ++++++++++-
>>  samples/rust/rust_minimal.rs |  2 +-
>>  2 files changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/rust/kernel/module_param.rs b/rust/kernel/module_param.rs
>> index 6a8a7a875643..5dcfe2ba87a1 100644
>> --- a/rust/kernel/module_param.rs
>> +++ b/rust/kernel/module_param.rs
>> @@ -134,7 +134,7 @@ pub const fn new(default: T) -> Self {
>>      /// Get a shared reference to the parameter value.
>>      // Note: When sysfs access to parameters are enabled, we have to pass in a
>>      // held lock guard here.
>> -    pub fn value(&self) -> &T {
>> +    pub fn value_ref(&self) -> &T {
>>          self.value.as_ref().unwrap_or(&self.default)
>>      }
>>
>> @@ -146,6 +146,15 @@ pub const fn as_void_ptr(&self) -> *mut c_void {
>>      }
>>  }
>>
>> +impl<T: Copy> ModuleParamAccess<T> {
>> +    /// Get a copy of the parameter value.
>> +    // Note: When sysfs access to parameters are enabled, we have to pass in a
>> +    // held lock guard here.
>> +    pub fn value(&self) -> T {
>
> It's better to keep this close to `value_ref` in the same impl block. The `T:
> Copy` bound doesn't need to be on the impl block, it can be on the item itself
> with
>
>     pub fn value(&self) -> T where T: Copy

Cool, I'll do that.


Best regards,
Andreas Hindborg




