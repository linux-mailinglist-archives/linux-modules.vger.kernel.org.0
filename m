Return-Path: <linux-modules+bounces-6567-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJmAL0JAGGqshwgAu9opvQ
	(envelope-from <linux-modules+bounces-6567-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Thu, 28 May 2026 15:16:50 +0200
X-Original-To: lists+linux-modules@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1695F291C
	for <lists+linux-modules@lfdr.de>; Thu, 28 May 2026 15:16:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 22445302736E
	for <lists+linux-modules@lfdr.de>; Thu, 28 May 2026 13:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482383F0AB3;
	Thu, 28 May 2026 13:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NG0Y4rVT"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C6E1A304A;
	Thu, 28 May 2026 13:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779974143; cv=none; b=qd79tEJsbN6S7xyjhAniBUjYEN4cbmXYf2Y2pDXT0GwHE11jZV9MT9AGviLH2MwDEkXgQYs0cosNfXr+VYJXmQsa3j46HKFuP+GXzNW8e/1IeadTa1FCt3JJ4aI7p639p+URdPkoGC7BN1OWj0yLMwZNLWJxpp/53gbjkn3YQdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779974143; c=relaxed/simple;
	bh=u2oysIY8dHlPzB/hBePgeyZJDrBHmGq0mAa5rmp2OiA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Uv86qImJm3qDOBcAjOq1sOI8etVvPjVhQurkJ3x8cLJ7owqbnO/NY083lVv2z1ATDLZDy22FBfahYD2nGUwUngeyEbXngmjltMoXjS0FEftBr4BD9UblIlgybt2UO0si/AxUXu+LC1lOHaXHMawzPm24B8y7O77QHtYh2BJYSW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NG0Y4rVT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 366181F000E9;
	Thu, 28 May 2026 13:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779974141;
	bh=seqxhQRK94cy6VtY2EuAyzTayFSe+TG9fXYMRDMjo1U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=NG0Y4rVTtqShVV0xR715sq8CdaMYMiWGXTMD7r55FNgSpEKMbqjKxlyqy+5rNtoqB
	 DJw+kZxm5llzwdMpFdKm7GLqybrEkJJQSZbRHmuikz8B5tiYKH00S9SQ4IIgLzT72r
	 mxkypdnJZ6myTYkhD/9b0T4WaRhU01cb3SrltuuqcwJfOFHW9Ln7lTRn0Kw1DP4ye4
	 G/PSBG+xrnltxun92SUlG7nFbu43R8Jg8uuZaGV7qsSoEB6teEyKcq1xbzfznV2Flf
	 D8dgvAff4L2l4YaYNP4xKc/U4lTSQf5e/iRVhMXF9hYZSbZfV6bOEZEnQYHkuhiwjY
	 oZ3SKgYCNZCtg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Wenzhao Liao <wenzhaoliao@ruc.edu.cn>, mcgrof@kernel.org,
 petr.pavlu@suse.com, da.gomez@kernel.org, samitolvanen@google.com,
 ojeda@kernel.org, linux-modules@vger.kernel.org,
 rust-for-linux@vger.kernel.org, atomlin@atomlin.com, boqun@kernel.org,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/1] rust: module_param: support bool parameters
In-Reply-To: <2026041323-fled-sharply-77c0@gregkh>
References: <20260411130254.3510128-1-wenzhaoliao@ruc.edu.cn>
 <XkCBdVOQy3WcLA_L2YGegyYzAKKeqrm7gLpNUE8Y2Yj_9WksIbIc3U8lKkN5BfYo8zLmhZzMZq9vwC43s_nqpg==@protonmail.internalid>
 <2026041118-croak-serving-ff5e@gregkh> <87fr4zvzn2.fsf@kernel.org>
 <2026041323-fled-sharply-77c0@gregkh>
Date: Thu, 28 May 2026 15:15:28 +0200
Message-ID: <87fr3b7k0f.fsf@t14s.mail-host-address-is-not-set>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6567-lists,linux-modules=lfdr.de];
	FREEMAIL_CC(0.00)[ruc.edu.cn,kernel.org,suse.com,google.com,vger.kernel.org,atomlin.com,garyguo.net,protonmail.com,umich.edu];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a.hindborg@kernel.org,linux-modules@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-modules];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kroah.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3D1695F291C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Greg KH <greg@kroah.com> writes:

> On Mon, Apr 13, 2026 at 02:00:17PM +0200, Andreas Hindborg wrote:
>> "Greg KH" <greg@kroah.com> writes:
>> 
>> > On Sat, Apr 11, 2026 at 09:02:53AM -0400, Wenzhao Liao wrote:
>> >> Sorry for the earlier noise and for our unfamiliarity with parts of the
>> >> kernel submission process, which created extra burden for maintainers.
>> >>
>> >> This patch adds boolean module parameter support to the Rust `module!`
>> >> parameter path.
>> >>
>> >> It implements `ModuleParam` for `bool` and wires `PARAM_OPS_BOOL` into
>> >> the Rust module parameter machinery, so Rust-side parsing reuses the
>> >> existing kernel `kstrtobool()` semantics through `kstrtobool_bytes()`
>> >> instead of introducing a separate parser. A boolean parameter is also
>> >> added to `samples/rust/rust_minimal.rs` as a small reference user and
>> >> build-time validation point.
>> >
>> > What driver needs this feature?  Module options should be very rare
>> > going forward as they are 1990's technology and do not fit the "modern"
>> > kernel model at all.
>> 
>> Rust null block uses module parameters, and was requested to use proper
>> boolean parsing rather than overloading u8 parsing for boolean
>> parameters [1].
>> 
>> Best regards,
>> Andreas Hindborg
>> 
>> 
>> [1] https://lore.kernel.org/rust-for-linux/abfK4eji5jKSeO_W@google.com/
>> 
>
> Ok, then that needs to be said somewhere, and ideally, have the code
> that uses that as part of the patch series.

It should be mentioned for sure, with a link to the code. I'm not sure
including this patch in the rnull driver series is the right approach.
That series is a really long already. I think using the b4 dependency
feature for dependencies is a better approach for marking dependencies.

I understand that you want to see APIs in context of use, that makes
sense.


Best regards,
Andreas Hindborg





