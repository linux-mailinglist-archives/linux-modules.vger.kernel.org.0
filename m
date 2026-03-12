Return-Path: <linux-modules+bounces-6096-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qG2eD2sqs2ksSwAAu9opvQ
	(envelope-from <linux-modules+bounces-6096-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Thu, 12 Mar 2026 22:04:43 +0100
X-Original-To: lists+linux-modules@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AED72279BB9
	for <lists+linux-modules@lfdr.de>; Thu, 12 Mar 2026 22:04:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F414131CF5D3
	for <lists+linux-modules@lfdr.de>; Thu, 12 Mar 2026 21:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A50F137B407;
	Thu, 12 Mar 2026 21:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NQAlYf3i"
X-Original-To: linux-modules@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54584377032
	for <linux-modules@vger.kernel.org>; Thu, 12 Mar 2026 21:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773349377; cv=none; b=IDRs34ExHzZi1TsGnttJPoHJChXYxKWldeBgy8V4Bu7Bz+YOKkhS9ssM3gpyESNBr5FdBppkGXY2orP+y924flGHOma/8apnWA01Jgj91VobLtvr0YzY+5aeJSrcp5DiMd/xd8cCtR8BuE1QmR1i4jFRmMX1u71QazzOuCQiQlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773349377; c=relaxed/simple;
	bh=mTS5iJl6zfXqRYySxqKjfA+Jz1P4RKNOhogQ9J5FPlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pkknmsoDHRWYQyrERf2aU9NXzik1KfP83109uvqYJzVj4gUi/zztWlfGTFQbLWSlF6r6FqaKpP67zeqYfdFHi4E0SqRVmR3Pa4f6jH8x1k7oHtWDIUwNs8iY2OoG2X6QBzZH70yKCSkdlKbRXieE1ga4NUwWN2qD5TW9xfwnBbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NQAlYf3i; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773349375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OlMt/cHXFQTj8f0pj6UVg7GrYkompktT2C1zCMqkl0Y=;
	b=NQAlYf3iuxt+gAic4OJVmxCceOcz+Odz1BweK8Q+kEjM+XF8+dFzYewORxUlt3g1B8ck7H
	B2iXN2Vo59a7dddkhwaLTdhayhOM4irRuoVN/lY2L+zDDO0WiaZzIZqkF3STmSNPDyBNnV
	sc+OhjI1Xc1h9HBMshQmlNG4+G0XSO8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-230-QCbAwVcdM7etC7WvEcdcTA-1; Thu,
 12 Mar 2026 17:02:49 -0400
X-MC-Unique: QCbAwVcdM7etC7WvEcdcTA-1
X-Mimecast-MFC-AGG-ID: QCbAwVcdM7etC7WvEcdcTA_1773349367
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C50241800372;
	Thu, 12 Mar 2026 21:02:46 +0000 (UTC)
Received: from redhat.com (unknown [10.22.80.5])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0206D30002DC;
	Thu, 12 Mar 2026 21:02:44 +0000 (UTC)
Date: Thu, 12 Mar 2026 17:02:42 -0400
From: Joe Lawrence <joe.lawrence@redhat.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Aaron Tomlin <atomlin@atomlin.com>, Petr Mladek <pmladek@suse.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [PATCH v2] module.lds,codetag: force 0 sh_addr for sections
Message-ID: <abMp8rJsqHWqSd1I@redhat.com>
References: <20260305015237.299727-1-joe.lawrence@redhat.com>
 <20260311211207.GA2440964@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311211207.GA2440964@google.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6096-lists,linux-modules=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joe.lawrence@redhat.com,linux-modules@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-modules];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sourceware.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AED72279BB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 09:12:07PM +0000, Sami Tolvanen wrote:
> On Wed, Mar 04, 2026 at 08:52:37PM -0500, Joe Lawrence wrote:
> > Commit 1ba9f8979426 ("vmlinux.lds: Unify TEXT_MAIN, DATA_MAIN, and
> > related macros") added .text and made .data, .bss, and .rodata sections
> > unconditional in the module linker script, but without an explicit
> > address like the other sections in the same file.
> > 
> > When linking modules with ld.bfd -r, sections defined without an address
> > inherit the location counter, resulting in non-zero sh_addr values in
> > the .ko.  Relocatable objects are expected to have sh_addr=0 for these
> > sections and these non-zero addresses confuse elfutils and have been
> > reported to cause segmentation faults in SystemTap [1].
> > 
> > Add the 0 address specifier to all sections in module.lds, including the
> > .codetag.* sections via MOD_SEPARATE_CODETAG_SECTIONS macro.
> > 
> > Link: https://sourceware.org/bugzilla/show_bug.cgi?id=33958
> > Fixes: 1ba9f8979426 ("vmlinux.lds: Unify TEXT_MAIN, DATA_MAIN, and related macros")
> > Signed-off-by: Joe Lawrence <joe.lawrence@redhat.com>
> > ---
> >  include/asm-generic/codetag.lds.h |  2 +-
> >  scripts/module.lds.S              | 12 ++++++------
> >  2 files changed, 7 insertions(+), 7 deletions(-)
> > 
> > v2:
> > - Update the MOD_SEPARATE_CODETAG_SECTION for .codetag.* as well [Petr]
> 
> Do we also need similar changes in any of the architecture-specific module
> linker scripts (arch/*/include/asm/module.lds.h)?
> 

Hi Sami,

That is a good question that is unfortunately beyond my limited linker script
knowledge.  Some of those arch-specific module.lds.h do not specify
address for several sections and have been that way for years ... so if
I were to guess, I don't think 1ba9f8979426 changed their behavior one
way or another.

--
Joe


