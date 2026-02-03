Return-Path: <linux-modules+bounces-5558-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yC7uEH/NgWl5KAMAu9opvQ
	(envelope-from <linux-modules+bounces-5558-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Tue, 03 Feb 2026 11:27:11 +0100
X-Original-To: lists+linux-modules@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A23DFD798F
	for <lists+linux-modules@lfdr.de>; Tue, 03 Feb 2026 11:27:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70B34308C26B
	for <lists+linux-modules@lfdr.de>; Tue,  3 Feb 2026 10:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5EC631690E;
	Tue,  3 Feb 2026 10:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="oKihOAPY";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="d0Z+EwAk";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="JEcuAUv+";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="k26vDfBl"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318DA314D13
	for <linux-modules@vger.kernel.org>; Tue,  3 Feb 2026 10:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770114277; cv=none; b=TLuav/jmuhod1vE0HGwAOzAyqFvYcFRu4aW4glSDfL9oZUcpJO5vmRPF0IwDvO7ZdlBgMnhV6lxO7q5nvIMdR5Y84fu8Ph48n4Yz8WW9nIGQLJ6rLgOKnn5mtaGLgQnRORI8PJb+VcxslhU4SYqHGYJR6+sb+OcPx8xxvELw0U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770114277; c=relaxed/simple;
	bh=ZPnQ1HTuX6/8TUjJZQEUNBKfShrrT/gk9os+omxmngE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=EUiOywEpQHmR7dU1lnexWd3/2g5JH/ReMdKwRA2Ewp6dYWUigRbAPbQKh2UTgKmHHxHddFVsxdpVmJkNnI8no8Ek/QNmN7yVhi0DW02HG8Zg0bPw2GXh+J0kyPRNZ4swKrfJudBUpdXHs5FmSvK2q1fwD+tSHzL8h3YraDyWX7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=oKihOAPY; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=d0Z+EwAk; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=JEcuAUv+; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=k26vDfBl; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from [10.128.32.1] (unknown [10.128.32.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6BED43E6D1;
	Tue,  3 Feb 2026 10:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1770114274; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NXLc+2Adk+AGPqid+ouMV8j5AeeHusZ6zyh11O4Tw1A=;
	b=oKihOAPYjLVp+fl/g2hEKBBV+iPVb/y6/1MSj6tLFL154W7+kgfgEfdzGar9p3ci8otPRp
	Dq16Qap9rqYnvq8ud3dUDnXU6cRmokfA6sxS8yKFs/osFjxoV+AKO1fDLmFpvqrPj/7g49
	DwDzIpPAuDIJ886uutIGWom68EuTFz0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1770114274;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NXLc+2Adk+AGPqid+ouMV8j5AeeHusZ6zyh11O4Tw1A=;
	b=d0Z+EwAkv0iwKf6p1yggnT+8gzHI0Vcyiccsz6eHTAbQZVZPCibQIuCv2Gb5FMzujR3m9v
	Wstt8TLVDBjA+IAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1770114273; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NXLc+2Adk+AGPqid+ouMV8j5AeeHusZ6zyh11O4Tw1A=;
	b=JEcuAUv+h4kJjgGFz93l6T+gfN33Cv7GtZfLvqRy5h/BY+HQjL7wXaW9FFrEC3NwV25jlY
	56cnGyrbkjLF4JRa6lsCsRkToEILXB9rtYlBqosFmgpzY16xWRZoKXBSDmsO3C1TG5Fa3k
	BkU26cQ8Eg4PHG6kVwbNvEAM+I5kEOE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1770114273;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NXLc+2Adk+AGPqid+ouMV8j5AeeHusZ6zyh11O4Tw1A=;
	b=k26vDfBlwloLR/FIwRhFb6wMwVfWahUiI/rcuBrWGFvauv3ejCMMvniPccWTedIvJnjqC2
	/AYNMe+EA8IyCAAQ==
Date: Tue, 3 Feb 2026 11:24:33 +0100 (CET)
From: Miroslav Benes <mbenes@suse.cz>
To: Petr Pavlu <petr.pavlu@suse.com>
cc: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
    Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>, 
    Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
    Sami Tolvanen <samitolvanen@google.com>, 
    Aaron Tomlin <atomlin@atomlin.com>, Peter Zijlstra <peterz@infradead.org>, 
    live-patching@vger.kernel.org, linux-modules@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Improve handling of the __klp_{objects,funcs}
 sections in modules
In-Reply-To: <20260123102825.3521961-1-petr.pavlu@suse.com>
Message-ID: <alpine.LSU.2.21.2602031124080.19996@pobox.suse.cz>
References: <20260123102825.3521961-1-petr.pavlu@suse.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-5558-lists,linux-modules=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mbenes@suse.cz,linux-modules@vger.kernel.org];
	DKIM_TRACE(0.00)[suse.cz:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-modules];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.cz:email,suse.cz:dkim,pobox.suse.cz:mid]
X-Rspamd-Queue-Id: A23DFD798F
X-Rspamd-Action: no action

On Fri, 23 Jan 2026, Petr Pavlu wrote:

> Changes since v2 [1]:
> - Generalize the helper function that locates __klp_objects in a module
>   to allow it to find any data in other sections as well.
> 
> Changes since v1 [2]:
> - Generalize the helper function that locates __klp_objects in a module
>   to allow it to find objects in other sections as well.
> 
> [1] https://lore.kernel.org/linux-modules/20260121082842.3050453-1-petr.pavlu@suse.com/
> [2] https://lore.kernel.org/linux-modules/20260114123056.2045816-1-petr.pavlu@suse.com/
> 
> Petr Pavlu (2):
>   livepatch: Fix having __klp_objects relics in non-livepatch modules
>   livepatch: Free klp_{object,func}_ext data after initialization
> 
>  include/linux/livepatch.h           |  3 +++
>  kernel/livepatch/core.c             | 19 +++++++++++++++++++
>  scripts/livepatch/init.c            | 20 +++++++++-----------
>  scripts/module.lds.S                |  9 ++-------
>  tools/objtool/check.c               |  2 +-
>  tools/objtool/include/objtool/klp.h | 10 +++++-----
>  tools/objtool/klp-diff.c            |  2 +-
>  7 files changed, 40 insertions(+), 25 deletions(-)
> 
> 
> base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193

Acked-by: Miroslav Benes <mbenes@suse.cz>

Thank you,
M

