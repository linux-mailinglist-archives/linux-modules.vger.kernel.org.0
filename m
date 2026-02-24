Return-Path: <linux-modules+bounces-5781-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mK7eOYDvnWncSgQAu9opvQ
	(envelope-from <linux-modules+bounces-5781-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Tue, 24 Feb 2026 19:35:44 +0100
X-Original-To: lists+linux-modules@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 483DD18B771
	for <lists+linux-modules@lfdr.de>; Tue, 24 Feb 2026 19:35:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B77DA306E865
	for <lists+linux-modules@lfdr.de>; Tue, 24 Feb 2026 18:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8FD2396D21;
	Tue, 24 Feb 2026 18:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lxqvNbLn"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3292798F8
	for <linux-modules@vger.kernel.org>; Tue, 24 Feb 2026 18:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771958045; cv=none; b=nRVsVoLIhO726smdRRZaaXz+HKbmjclPa9EJqzi5EkAuaN+VCXYaFMsaXHNDVrrogmBPuK4trDbH//BF/2v/rRJU1ZREEUUqXu+dF8iViowkrNZJvJyRLRnK9YUEYHDtX6TCpB282wFBLc0vu0USWN+QnTlF+5u7u5CQmQHBuM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771958045; c=relaxed/simple;
	bh=9ypUVcrUQGxqa/UHcKTwm3h0u3TclCFr7LqBI8UanN0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=acok3421dSgvOVaCL7FQLfq6Vds+7oa5/oc0PfqZKsoFqCIq5q2k+7Y/bzVKhVK1K5vj7FeUc+6u0rsLiM6yKrhDKfB0K7venjj9dCsQg/n0wrevHHvVyAcBjAkxyiT4hCH+gj48J4m+29JDGB67Oo2ex+nBK2QlHgQGesgbgKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lxqvNbLn; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2bdbe1bd565so238731eec.1
        for <linux-modules@vger.kernel.org>; Tue, 24 Feb 2026 10:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771958043; x=1772562843; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vCl16yQd5JCdKMlnrWwaTzTiouydIWnKj+/Pu7L48ec=;
        b=lxqvNbLnIWoe2gfskGb2EU4zZ8DZ0FU+WvEUslbSVtB0XAkp8erMJCJ1oZEIkIUA9s
         iBZ7pmbqbP8rMOFdcSWERPxavUC8QM5Mi5oIn/dcXWEGd7onD5kkaN49P+O6glY3wmer
         SegCk9XHK6GkqpxLnSDzW7U5GbARCZXk4X63CmZgJHJ5jpvTa0WCIMQBZ8j7qs5lAgga
         0SQikk/A/MeawEOat5wdC2C0syEgf6E4cMu5D9w3JZUKsajK1uBIrJRCuwFMVnN/dzX4
         lgmcPqmHHkSHrfYgtOgvUwv4WNW62UL4WRjWUJ5v96YFBj+GcFYKwVcsDyN5pRSuBQi5
         pEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771958043; x=1772562843;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vCl16yQd5JCdKMlnrWwaTzTiouydIWnKj+/Pu7L48ec=;
        b=DIdf1IEJkf/RKiSKPb8sv5o5xDcbtCapUKpeaUJQ3F5OfJNjAqzx5rqZyWuTk+RQKC
         tfsgCjCCMAH7CDJfjXq5IcWmgZLT+n/pKOQ8yJrawi2sMNgfmWzF9B/R6IpIFxRtcbdG
         amlLSUVBNmz4gX4+HGGbrlXZ1Sw82zh5TA0bHQKWqPkQRoFjWPJa+VYeVpqJx4pOkHN1
         NEjGVvE0LD8pv7QTPu3ZcMbZht6W4rBVUDTp9ruE5ufUgRyC0KWcg+mfj7HaerlpdleL
         KWigOZbsoN1FKlwbXL7DpauMKVQtANaACSV/aGTuW9wjAultfkVtdR5kcIGZTqhMG1RG
         lcdw==
X-Forwarded-Encrypted: i=1; AJvYcCVO+OyD/H+6W6VS4IQHzOto//0yqDdCKpsfy8G4LkFT6njo16k1vbvakWqvMadgUMFX1o1ump32NZsaAbTI@vger.kernel.org
X-Gm-Message-State: AOJu0YwgBJBmc31An4aGhl5tHUVMbkhWKgOYN+KoxRi9Ec0qasu38oRq
	VQSwwQq5yDsNJPgAjZaU5aTdbBlkIZeE5n/dF4iAWPYox51XRosI+VbuKk1krQk5he/spx9KgJv
	a+jrmg3eynfKpE2yx0es0F6rvXxjtow==
X-Received: from dycue10.prod.google.com ([2002:a05:7300:8a:b0:2ba:7069:6875])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:3002:b0:2ba:7b63:3f4f with SMTP id 5a478bee46e88-2bd7b9f1ddemr4985896eec.15.1771958043333;
 Tue, 24 Feb 2026 10:34:03 -0800 (PST)
Date: Tue, 24 Feb 2026 18:34:02 +0000
In-Reply-To: <20260205143720.423026-1-petr.pavlu@suse.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260205143720.423026-1-petr.pavlu@suse.com>
X-Mailer: b4 0.14.3
Message-ID: <177195804200.1905199.16388859152409551132.b4-ty@google.com>
Subject: Re: [PATCH] module: Fix the modversions and signing submenus
From: Sami Tolvanen <samitolvanen@google.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>
Cc: Aaron Tomlin <atomlin@atomlin.com>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org
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
	TAGGED_FROM(0.00)[bounces-5781-lists,linux-modules=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[samitolvanen@google.com,linux-modules@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-modules];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 483DD18B771
X-Rspamd-Action: no action

On Thu, 05 Feb 2026 15:37:08 +0100, Petr Pavlu wrote:
> The module Kconfig file contains a set of options related to "Module
> versioning support" (depends on MODVERSIONS) and "Module signature
> verification" (depends on MODULE_SIG). The Kconfig tool automatically
> creates submenus when an entry for a symbol is followed by consecutive
> items that all depend on the symbol. However, this functionality doesn't
> work for the mentioned module options. The MODVERSIONS options are
> interleaved with ASM_MODVERSIONS, which has no 'depends on MODVERSIONS' but
> instead uses 'default HAVE_ASM_MODVERSIONS && MODVERSIONS'. Similarly, the
> MODULE_SIG options are interleaved by a comment warning not to forget
> signing modules with scripts/sign-file, which uses the condition 'depends
> on MODULE_SIG_FORCE && !MODULE_SIG_ALL'.
> 
> [...]

Applied to modules-next, thanks!

[1/1] module: Fix the modversions and signing submenus
      commit: 8d597ba6ec18dae2eec143d4e1c9d81441ca0dda

Best regards,

	Sami



