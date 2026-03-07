Return-Path: <linux-modules+bounces-5909-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id JwUdJC3wq2nniAEAu9opvQ
	(envelope-from <linux-modules+bounces-5909-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Sat, 07 Mar 2026 10:30:21 +0100
X-Original-To: lists+linux-modules@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E9522AE3E
	for <lists+linux-modules@lfdr.de>; Sat, 07 Mar 2026 10:30:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37EFF301ECFB
	for <lists+linux-modules@lfdr.de>; Sat,  7 Mar 2026 09:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EDFD36D4FC;
	Sat,  7 Mar 2026 09:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GvPoYmk3"
X-Original-To: linux-modules@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D62368268;
	Sat,  7 Mar 2026 09:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772875818; cv=none; b=eTaqNvj2Arwvn19/AkYvmmA9YXZcuJlq4i9ohnjOT94kgxI0MMZhOV/eQXJfWLZH0NnhJt6BtAjvcL4rNLKHCyokZtQaZ6O2ptY7z2ayXdPg1Mhdd8+Y+/pBN8s7y59/XXgYvC2WcakSKxvZM7c008LqAVv+unddKc52BltcFt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772875818; c=relaxed/simple;
	bh=oOxzKQwICj7Br0UxUZXEZbfs0K50wQ/IldByW5/G2Mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bePmfOIGXpj5j3tSBfxU7IhF/sCyRbBuP8xToj6sNAk1CIUSEvxdBjiPqpfQuULC+d3UYj3e+Fg4yLwttsDDqH46goxEaov7RtyNTGu1dLKmul5vAEDnFwOEDIrYe8SHlabLcljjiijh79+wgjOLs2QAirw480AY7Q6kOR287l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GvPoYmk3; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZyUQ8o6mITxtK3FKnjFG1H9al+LDuFL7rOLaCjVBue4=; b=GvPoYmk3hdvo7H2EN6iqkFLctW
	lcHpHWbDe9VEzhaCCc1eAxTMvXIgvPbhnuo4ZhzvXd1Hd+sc3JMQLB2MFhr8mQh/EXqre/xuc3Jsy
	EbV0QTzM1CTbwWszKDtBITzoLhauPWVpaQQbkrl2RhQLJyBG/yxJs3CoSHo7V3BqljhJSYiPI4le3
	ZciMDHpcXUIB/kH/6KNkOScjqMiRAjiQimJ1eKCkL51z0X+54Tw9AVCz4eG4CA4/0cMLUUYSTt2HP
	JHhuLOswkhsbq8wnLTA2SLz2jGyWSvBgGomxAPPuC5nq8+QJs2Djq9fHwFIgJJpH39diHoAC0VXew
	1AoK07Hg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vynz5-00000000cbD-34EP;
	Sat, 07 Mar 2026 09:30:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6760B301150; Sat, 07 Mar 2026 10:30:06 +0100 (CET)
Date: Sat, 7 Mar 2026 10:30:06 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Nicholas Sielicki <linux@opensource.nslick.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Matthias Maennich <maennich@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-modules@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] module: expose imported namespaces via sysfs
Message-ID: <20260307093006.GU606826@noisy.programming.kicks-ass.net>
References: <20260307090010.20828-1-linux@opensource.nslick.com>
 <20260307090010.20828-2-linux@opensource.nslick.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307090010.20828-2-linux@opensource.nslick.com>
X-Rspamd-Queue-Id: 25E9522AE3E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5909-lists,linux-modules=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,linux-modules@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-modules];
	NEURAL_HAM(-0.00)[-0.933];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,noisy.programming.kicks-ass.net:mid,infradead.org:dkim]
X-Rspamd-Action: no action

On Sat, Mar 07, 2026 at 03:00:09AM -0600, Nicholas Sielicki wrote:
> Previously, the only way for userspace to inspect the symbol
> namespaces a module imports is to locate the .ko on disk and invoke
> modinfo(8) to decompress/parse the metadata. The kernel validated
> namespaces at load time, but it was otherwise discarded.
> 
> Add /sys/module/*/import_ns to expose imported namespaces for
> currently loaded modules. The file contains one namespace per line and
> only exists for modules that import at least one namespace.

What I'm missing here is why users would care about this?

