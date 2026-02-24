Return-Path: <linux-modules+bounces-5782-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KS0OZHvnWkHSwQAu9opvQ
	(envelope-from <linux-modules+bounces-5782-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Tue, 24 Feb 2026 19:36:01 +0100
X-Original-To: lists+linux-modules@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B2718B786
	for <lists+linux-modules@lfdr.de>; Tue, 24 Feb 2026 19:36:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23A5F3099155
	for <lists+linux-modules@lfdr.de>; Tue, 24 Feb 2026 18:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D7B3AA183;
	Tue, 24 Feb 2026 18:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2NLPtGk5"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E713A63E9
	for <linux-modules@vger.kernel.org>; Tue, 24 Feb 2026 18:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771958047; cv=none; b=pZyGSWk0TDXLPJJcR8OM5flJud1r+cDO2vX8O25b7AfiQkNrcmQPMd+JElPjnAZikZ1egGAQUOyA3gkkBEEKwc06tsDQfdBM4nJGhNOxmvsOTb1t0pS4NbjEFmo8SHJAmiPse+C52JO8lZcBjBz8tUWDO6AIuIZuC2w2Ji8ICHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771958047; c=relaxed/simple;
	bh=6lqXDUqvCraUjBEWRX+ZO0/NynIR3O9KfZGZn7bsZGw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rl+1pQyk4fKD56kAdonIviBqvwHF7axTq5iF4+XtlmWAoz4PfDj5DrYRmbnqr2Jcj4ZiinYVdmUanytPnPc4Zt85a0Pcr6Do4c5PZKiRVFrh38YK7sss6gRkCi12MsJOCKTV7yD7LrqJgHjScna/Qzl4/7uxMJ2dDjQZdJGzHlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2NLPtGk5; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2ba87c0e198so4467945eec.1
        for <linux-modules@vger.kernel.org>; Tue, 24 Feb 2026 10:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771958045; x=1772562845; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=u3eV8FGTUnBczUYPB0FGGe/VAWeujBZTzDOFeSUSQWI=;
        b=2NLPtGk5MxnaYqfbhBdOu6EfxQ4XnHkcQufz2pDlGr+Mg5csHCtrWIq+SkmkdZO9CN
         upy9xJ0TFbN0rAcKyyNZDngTEals+KECkGuYrtiGxJJwWBASj7spf0IqJBcekyCzCPjO
         gRXbncy50YzRF5Mug1mSzl7dhAJzLfFmxG55VOH1CjckjgA2WRYKqInRjazvZCiutN4L
         n7ZT/VlBQDd8Kkbcx5HpQFF5g7t8OzDvi6/BdQqfNyC7Bvu86BhWMZmCCZFiMf/Jeg6k
         tnXDsod5a2yxDhWrL85iZ6XYkzGD4103Bj5AJHvp6iBVrUG9xtl8O+k1e0KCLJJxIVU7
         7KUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771958045; x=1772562845;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u3eV8FGTUnBczUYPB0FGGe/VAWeujBZTzDOFeSUSQWI=;
        b=lmq1lK5efmLTGtdEMCdnJVIBmHvQLyDev7JYeY/W9VtlVp5Ywj27KzSxH4x0wSPoCs
         qcFKOzwFIqz5YSf4gWOKhPR6Ai02zoQLlIefezeUBckNfXp5igvfgdcw+jaxxOSFUmvn
         F1P4A256ipbpmrnwxE0LFkCJj0Zjy3HDi9J23Uv7MZ/1IDvUQfb53gndHuhhTqIyoU91
         TyATMgcQuLkgTeY5peCp7GGsWIVlB/qGYAFN/6hyQ5J3vPzjjT0gFku6duxR4nBOOpIa
         ARt0fmBAbb41xCZIlv72yrJVXmp0NRGPDfIpKpRl0SCA3al1+t0JZOBETybqrPUzX9JC
         eQLg==
X-Forwarded-Encrypted: i=1; AJvYcCU9UcQlviMmye21H/vZ4jGlfk4hJWoGUyTwchKWA23tUszE7J5+ha1XgNHAE7T1FbGtxaHPjgXFeaaay/Za@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8IqeXMaeTkRiUR/lJsKcE+eQvBcnyAso6A0W8qDfzsTlDGCs9
	Ra3lq4PK7eaoaiVgNzN//28D6KbhrNz6XhP5WRBNHU3z3yoeVnN9zAk5MyZ4o5jqmEbYoCCkTVo
	3JdaDGKuNeOYret8inpHYwxt8ZsGiDw==
X-Received: from dlbdd21.prod.google.com ([2002:a05:7022:a95:b0:11e:64d:cd3b])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:38a:b0:123:34e8:ae9f with SMTP id a92af1059eb24-1276acb5ef9mr4854243c88.9.1771958045190;
 Tue, 24 Feb 2026 10:34:05 -0800 (PST)
Date: Tue, 24 Feb 2026 18:34:03 +0000
In-Reply-To: <20260107122329.1324707-1-petr.pavlu@suse.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260107122329.1324707-1-petr.pavlu@suse.com>
X-Mailer: b4 0.14.3
Message-ID: <177195804387.1905199.7714778925892286229.b4-ty@google.com>
Subject: Re: [PATCH] module: Remove duplicate freeing of lockdep classes
From: Sami Tolvanen <samitolvanen@google.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>
Cc: Aaron Tomlin <atomlin@atomlin.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Song Liu <song@kernel.org>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5782-lists,linux-modules=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[samitolvanen@google.com,linux-modules@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-modules];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 80B2718B786
X-Rspamd-Action: no action

On Wed, 07 Jan 2026 13:22:57 +0100, Petr Pavlu wrote:
> In the error path of load_module(), under the free_module label, the
> code calls lockdep_free_key_range() to release lock classes associated
> with the MOD_DATA, MOD_RODATA and MOD_RO_AFTER_INIT module regions, and
> subsequently invokes module_deallocate().
> 
> Since commit ac3b43283923 ("module: replace module_layout with
> module_memory"), the module_deallocate() function calls free_mod_mem(),
> which releases the lock classes as well and considers all module
> regions.
> 
> [...]

Applied to modules-next, thanks!

[1/1] module: Remove duplicate freeing of lockdep classes
      commit: a7b4bc094fbaa7dc7b7b91ae33549bbd7eefaac1

Best regards,

	Sami



