Return-Path: <linux-modules+bounces-6221-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Go1NMtu0WmCJgcAu9opvQ
	(envelope-from <linux-modules+bounces-6221-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Sat, 04 Apr 2026 22:04:27 +0200
X-Original-To: lists+linux-modules@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1B639C5A1
	for <lists+linux-modules@lfdr.de>; Sat, 04 Apr 2026 22:04:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6C1A300C91D
	for <lists+linux-modules@lfdr.de>; Sat,  4 Apr 2026 20:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28F22C031E;
	Sat,  4 Apr 2026 20:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oAbsmWzk"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC2217A30A;
	Sat,  4 Apr 2026 20:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775333064; cv=none; b=S8ltPc/7qxK4DbXWMIQvusP5aSns6LUKL7PIL2x/H2AF7/CP/oOGU19EbX4+esbs6LU60cpClHby45gJzoLd3q7/oH+3HZv0HfUkA+DP3dIsFt8w7gRL5pqPcOx3g1s4eX98nPy0nnqFcmMoRkEuZmF8ZVWaWUAc3DWTmhkqdIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775333064; c=relaxed/simple;
	bh=nuQOhXqzh/yrI4waHmqs/SiP+Sic5BOEOdHFjfTuvAA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fBkhNWIuwFnWdCdRjxISqpkSuVhov4CA9aO8qlrk9JTNR1EJm+6jBlCPhIhmJ1aCd+spXFC1c3H+/IGb/At+0qm1cDFiv1iliJK4JnXO1Wv+Xe1DBj6GTOIlzWa+YI0oIR2iSjmP6E5Ux7l+B/ccLMWkYiwQ/37o8k5c/kyrJHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oAbsmWzk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066AFC19421;
	Sat,  4 Apr 2026 20:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775333064;
	bh=nuQOhXqzh/yrI4waHmqs/SiP+Sic5BOEOdHFjfTuvAA=;
	h=Date:From:To:Subject:From;
	b=oAbsmWzkPGgR0PdvC1MshFr0gmWuZFGCFBrxlkPj32/7ALpt1J4W9nzLLGMTrswSo
	 6sMJImbxidX3ORM6HtZeQdxGnf741hzNsUqCRUqij1y7yaPn6ApmIFuqg6FKNyJ1Vf
	 uD0wtLT5/x5r/LwcQTMMgHWkHsAxCsUTSP4Pj8TXTbrQHmURX/O/6FfZlJE3VsflRH
	 lI3QpsIyIsD9UvOR6x18spMJ4HFmxqRGNMrF7V2LaXCm0qD7xUmbbb5aHN4OVVHCUP
	 3rn+W6uq4VXNsrl9bMBOzhw48Vw2if7pcwyoYde0N0KmSIPAEM6+JcK8OTEwW0pdFb
	 LDn0MIFdfNckg==
Date: Sat, 4 Apr 2026 22:04:19 +0200
From: Helge Deller <deller@kernel.org>
To: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>, linux-modules@vger.kernel.org
Subject: [PATCH] module.lds.S: Fix modules on 32-bit parisc architecture
Message-ID: <adFuw1E4iVyiXLf_@p100>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6221-lists,linux-modules=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@kernel.org,linux-modules@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-modules];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2F1B639C5A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On the 32-bit parisc architecture, we always used the
-ffunction-sections compiler option to tell the compiler to put the
functions into seperate text sections. This is necessary, otherwise
"big" kernel modules like ext4 or ipv6 fail to load because some
branches won't be able to reach their stubs.

Commit 1ba9f8979426 ("vmlinux.lds: Unify TEXT_MAIN, DATA_MAIN, and related
macros") broke this for parisc because all text sections will get
unconditionally merged now.

Fix the issue by avoiding the text section merge for 32-bit parisc while still
allowing it for all other architectures.

Fixes: 1ba9f8979426 ("vmlinux.lds: Unify TEXT_MAIN, DATA_MAIN, and related macros")
Cc: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: stable@vger.kernel.org # v6.19+
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/scripts/module.lds.S b/scripts/module.lds.S
index 054ef99e8288..41e13e9cbb9d 100644
--- a/scripts/module.lds.S
+++ b/scripts/module.lds.S
@@ -41,9 +41,11 @@ SECTIONS {
 	__kcfi_traps		: { KEEP(*(.kcfi_traps)) }
 #endif
 
+#if !defined(CONFIG_PARISC) || defined(CONFIG_64BIT)
 	.text : {
 		*(.text .text.[0-9a-zA-Z_]*)
 	}
+#endif
 
 	.bss : {
 		*(.bss .bss.[0-9a-zA-Z_]*)

