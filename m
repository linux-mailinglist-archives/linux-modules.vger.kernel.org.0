Return-Path: <linux-modules+bounces-6229-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cI4FKZu71mnLHggAu9opvQ
	(envelope-from <linux-modules+bounces-6229-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Wed, 08 Apr 2026 22:33:31 +0200
X-Original-To: lists+linux-modules@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 011CD3C3D2B
	for <lists+linux-modules@lfdr.de>; Wed, 08 Apr 2026 22:33:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3418530B0B7F
	for <lists+linux-modules@lfdr.de>; Wed,  8 Apr 2026 20:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 211FD3DB64D;
	Wed,  8 Apr 2026 20:31:31 +0000 (UTC)
X-Original-To: linux-modules@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D2A3DA7F4;
	Wed,  8 Apr 2026 20:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775680291; cv=none; b=rn113PQrqd4226OkjsA1JAJIILrJXWKDxzGlh/wv7ebufwGfZVLYRlxyCVkcFipuioX7dGonBPZ9g8q/9MTlIz3XlUhWpJtiAdbjTGhx5FXZwQ7cniALpFyg07Z8DAYehb2SOUT35sa6IsnyBAaCVbSYWUKCubD7Ii9vcRWm27A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775680291; c=relaxed/simple;
	bh=l2TKk7RqXY/yMRSmUxdi7j2QnQh7YNKuTn7QDnQrWmY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YwnW8FXlkYDH6t3l3T7ljejgLz3FhFmr4UokBDUKx66RC9SPLff6uDxVqcv6a3loNKkrkcK1KlB6knhanDQaG9UGdF7HNen78F//ydLo7g5403jLUygMuf3R4nf0fZc3I6hFDCY3rPtIvm0s1eoxRREiqPN7ih870oEZfM0Q5bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf10.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id B45BB8A939;
	Wed,  8 Apr 2026 20:31:27 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf10.hostedemail.com (Postfix) with ESMTPA id 4B9A93D;
	Wed,  8 Apr 2026 20:31:25 +0000 (UTC)
Date: Wed, 8 Apr 2026 16:32:41 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Cao Ruichuang <create0818@163.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com, mcgrof@kernel.org,
 petr.pavlu@suse.com, da.gomez@kernel.org, samitolvanen@google.com,
 atomlin@atomlin.com, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-modules@vger.kernel.org
Subject: Re: [PATCH] tracing: preserve module tracepoint strings
Message-ID: <20260408163241.20723018@gandalf.local.home>
In-Reply-To: <20260406170944.51047-1-create0818@163.com>
References: <20260406170944.51047-1-create0818@163.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: qz54nsrq8xuy37mcmdyur6po33pfkf3t
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+iwW7Gtqwsk+QAjNp3uRmGVuX1BXG0bag=
X-HE-Tag: 1775680285-191952
X-HE-Meta: U2FsdGVkX1/rUfSbfUF7EOXAQ/GusUWaam3Jn4qgGJJoYvLXr4GFTy+zki6MXBbqNPsL8B06K40XFi0izN0ZiFTolPovPQwV2yMHjGENYNFn5Ftp5pDFrHUgHxIGeLe5kJYy05TIamBhX4GeSWn0r2QhH1APLAJge47svX3PC1+hpriOBhKS25Kvf6ah6SR14F/4WOkbOu3UT443jFn9g+KCWNadeEig28I0kBS4xoD2MmHyH9BZQr6ZM+Mzz11EtgKdV7/9ngwMs1sjHscO7aysyHRnraPVDjfKdFvCQDZil86pMxJiRttHFTBJ/ViOLS2mnWUkGl7DjVPCOj7aCRr0XMq5Aa+/r2b2seRbCIeayXo5b0LuTQ==
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[goodmis.org : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6229-lists,linux-modules=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rostedt@goodmis.org,linux-modules@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-modules];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gandalf.local.home:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 011CD3C3D2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue,  7 Apr 2026 01:09:44 +0800
Cao Ruichuang <create0818@163.com> wrote:

> tracepoint_string() is documented as exporting constant strings
> through printk_formats, including when it is used from modules.
> That currently does not work.
> 
> A small test module that calls
> tracepoint_string("tracepoint_string_test_module_string") loads
> successfully and gets a pointer back, but the string never appears
> in /sys/kernel/tracing/printk_formats. The loader only collects
> __trace_printk_fmt from modules and ignores __tracepoint_str.
> 
> Collect module __tracepoint_str entries too, copy them to stable
> tracing-managed storage like module trace_printk formats, and let
> trace_is_tracepoint_string() recognize those copied strings. This
> makes module tracepoint strings visible through printk_formats and
> keeps them accepted by the trace string safety checks.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217196
> Signed-off-by: Cao Ruichuang <create0818@163.com>
> ---


As this is not a trivial change, and affects module code, I'm going to hold
off until after v7.1-rc1 to apply it.

-- Steve

