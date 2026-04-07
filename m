Return-Path: <linux-modules+bounces-6226-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNyrLlNw1WmN6QcAu9opvQ
	(envelope-from <linux-modules+bounces-6226-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Tue, 07 Apr 2026 23:00:03 +0200
X-Original-To: lists+linux-modules@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8683B4CB2
	for <lists+linux-modules@lfdr.de>; Tue, 07 Apr 2026 23:00:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1A0DC3079069
	for <lists+linux-modules@lfdr.de>; Tue,  7 Apr 2026 20:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A9BB3603C9;
	Tue,  7 Apr 2026 20:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WzsPIBfC"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C6F8287E;
	Tue,  7 Apr 2026 20:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775595158; cv=none; b=S4dkAwqBQJ3hnXAo/+7nqSNdFVYnbn7X6VMccosn5m4Aiz7EwzXaxQIrr8qBJXpUNdsCiynGh1VgwF3ghiuX7XqCi1DbeV1CZpKOWlCDYe45cqhmNjAgstz4U3a3M9pklGFyy9K3fAzcCwNsZtChQm6izVbaspq6i4j9+ucQRuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775595158; c=relaxed/simple;
	bh=JAf6UY1JnywAtdY5jgwKCwXNbd1gYulshpM01nbt5UE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cjRWJxSGah6uVgwbUE//Ol4ncuSYUye70Wgdp/ihniRBnTxvgmn1D+KSQKDQDlNs1XrsSXl1d+3hPPtXn9tq2jlXjSjkUhGkF7BtJByKzH5SuMC11gZ36Whil7mR7DneR+L59gFuiIaLrCXRBwsBQUrv7/k9KPNEOucOWECPIY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WzsPIBfC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1B38C116C6;
	Tue,  7 Apr 2026 20:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775595158;
	bh=JAf6UY1JnywAtdY5jgwKCwXNbd1gYulshpM01nbt5UE=;
	h=Date:From:To:Subject:From;
	b=WzsPIBfCqkYRkRZ7fnHBkVZ2zaj68XP1e8+ZS9vcpbEGpqyGheTziSdKpaE0hHoVt
	 OWkS8SPJ+PTS4kfa1gdu/iZWDiJjBNve3dnGqrDAgIzaiKXmxfFYDZX28TujUlQBsj
	 tdrkKCYEh6dfhwGDf4ccVrQZNLk99sxVRpfH0sxw6f2/XbKALrXaa7vMq0Mdqgbc76
	 P5SA1z4aZwzVJLBLEPwjH/vMWzv42L6vN6DYjM8wFN9vEsnmWEkV57badRETEWQMNj
	 ftIESrRM2dXJj57xNhh6UHQ45dIxY+Qukp6Fah94Dc2i6sFRhP/7LmOlhcY+n39xq1
	 pM/BHTxF0u65g==
Date: Tue, 7 Apr 2026 22:52:33 +0200
From: Helge Deller <deller@kernel.org>
To: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>, linux-modules@vger.kernel.org
Subject: [PATCH v2] module.lds.S: Fix modules on 32-bit parisc architecture
Message-ID: <adVukQYvRuuC5F-K@p100>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6226-lists,linux-modules=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@kernel.org,linux-modules@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-modules];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,gmx.de:email]
X-Rspamd-Queue-Id: CE8683B4CB2
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

Introduce the ARCH_WANTS_MODULES_TEXT_SECTIONS config option which
avoids the text section merge for modules, and fix this issue by
enabling this option by default for 32-bit parisc.

v2: Introduce and use ARCH_WANTS_MODULES_TEXT_SECTIONS option

Fixes: 1ba9f8979426 ("vmlinux.lds: Unify TEXT_MAIN, DATA_MAIN, and related macros")
Cc: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: stable@vger.kernel.org # v6.19+
Suggested-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/Kconfig b/arch/Kconfig
index 102ddbd4298e..78abb8be1e63 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1128,6 +1128,13 @@ config ARCH_WANTS_MODULES_DATA_IN_VMALLOC
 	  For architectures like powerpc/32 which have constraints on module
 	  allocation and need to allocate module data outside of module area.
 
+config ARCH_WANTS_MODULES_TEXT_SECTIONS
+	bool
+	help
+	  For architectures like 32-bit parisc which require that functions in
+	  modules have to keep code in own text sections (-ffuntion-sections)
+	  and to avoid merging all text into one big text section,
+
 config ARCH_WANTS_EXECMEM_LATE
 	bool
 	help
diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 62d5a89d5c7b..5a8cd50e8d70 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -8,6 +8,7 @@ config PARISC
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_SYSCALL_TRACEPOINTS
 	select ARCH_WANT_FRAME_POINTERS
+	select ARCH_WANTS_MODULES_TEXT_SECTIONS if !64BIT
 	select ARCH_HAS_CPU_CACHE_ALIASING
 	select ARCH_HAS_DMA_ALLOC if PA11
 	select ARCH_HAS_DMA_OPS
diff --git a/scripts/module.lds.S b/scripts/module.lds.S
index 054ef99e8288..7c017b997fd7 100644
--- a/scripts/module.lds.S
+++ b/scripts/module.lds.S
@@ -41,9 +41,11 @@ SECTIONS {
 	__kcfi_traps		: { KEEP(*(.kcfi_traps)) }
 #endif
 
+#ifndef CONFIG_ARCH_WANTS_MODULES_TEXT_SECTIONS
 	.text : {
 		*(.text .text.[0-9a-zA-Z_]*)
 	}
+#endif
 
 	.bss : {
 		*(.bss .bss.[0-9a-zA-Z_]*)

