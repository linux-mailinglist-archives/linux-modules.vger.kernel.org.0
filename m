Return-Path: <linux-modules+bounces-6549-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TAfjAAaHFWp3WQcAu9opvQ
	(envelope-from <linux-modules+bounces-6549-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Tue, 26 May 2026 13:41:58 +0200
X-Original-To: lists+linux-modules@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 743C55D50A4
	for <lists+linux-modules@lfdr.de>; Tue, 26 May 2026 13:41:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BCE463063E92
	for <lists+linux-modules@lfdr.de>; Tue, 26 May 2026 11:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FAAB3E4C81;
	Tue, 26 May 2026 11:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="ITIfPnNS"
X-Original-To: linux-modules@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069BA3E2AC3;
	Tue, 26 May 2026 11:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779795523; cv=none; b=D3OUSHqoTVwADcemT+uHchPXvvLYccDYbUcelEP4b4QOI/Eb5pk6t9UYb2hWOv275b7lj2DNj2D3MaVm87AcQ4+WzvQRD+cGKBVYaLGMyD2rRWLDt8L8EOY8+nrgGP5GmDzGUTGeazRs24ym1xzs+rbijhhp1mHDLMTPFLoZ7Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779795523; c=relaxed/simple;
	bh=kTAeZ3xw/Df4ezBjxQUd+PwImFlqzKYS6yA31g42XCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFF+9Iuxj8SdEX1agL5he3qI09ZwBwUbwJQQY/FqnyUOxhYOoWT+aGWu85GcaF4/iRtEaP0gDxbO5HJZATH8yqsIGjeUPkzU6aDKRkbXy6BCrsrB5i+A78vnLhgZzt2J1mxDgRiznbnvBGyOVAI5huG3KnSYKe+TEj7KL9NGUII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=ITIfPnNS; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1779795508;
	bh=kTAeZ3xw/Df4ezBjxQUd+PwImFlqzKYS6yA31g42XCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ITIfPnNSj4iYGsWPx3Tx9oUQY5RTkoSnYSt5EUf34ubhh7X+6E48t9zD8QK7p9UPJ
	 XunUJqRsVIEwWtiN2Rg9Bt86WZKhK6wBBXgLhouWeUEnyeCOr/EUakWvBODqgl2TFz
	 sDgAbkSNsaErv2LOwqvJaTrHYSPNfR2ht4L4Vb1g=
Date: Tue, 26 May 2026 13:38:27 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Luis Chamberlain <mcgrof@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Naveen N Rao <naveen@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
	Eric Snowberg <eric.snowberg@oracle.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Daniel Gomez <da.gomez@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>, 
	Xiu Jianfeng <xiujianfeng@huawei.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, bpf@vger.kernel.org, 
	Fabian =?utf-8?Q?Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>, Arnout Engelen <arnout@bzzt.net>, 
	Mattia Rizzolo <mattia@mapreri.org>, kpcyrd <kpcyrd@archlinux.org>, 
	Christian Heusel <christian@heusel.eu>, =?utf-8?B?Q8OianU=?= Mihai-Drosi <mcaju95@gmail.com>, 
	Eric Biggers <ebiggers@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org, debian-kernel@lists.debian.org
Subject: Re: [PATCH v5 07/14] module: Make module authentication usable
 without MODULE_SIG
Message-ID: <4ee3c775-1fbf-45e1-8b77-5f9034f45125@t-8ch.de>
References: <20260505-module-hashes-v5-0-e174a5a49fce@weissschuh.net>
 <20260505-module-hashes-v5-7-e174a5a49fce@weissschuh.net>
 <0a0736a4-2cdd-49f2-9062-e2f18d769fc0@suse.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a0736a4-2cdd-49f2-9062-e2f18d769fc0@suse.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,iogearbox.net,gmail.com,arndb.de,google.com,samsung.com,paul-moore.com,namei.org,hallyn.com,lwn.net,linux.ibm.com,ellerman.id.au,huawei.com,oracle.com,linux.dev,atomlin.com,oss.cyber.gouv.fr,vger.kernel.org,proxmox.com,bzzt.net,mapreri.org,archlinux.org,heusel.eu,linutronix.de,lists.ozlabs.org,lists.debian.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-6549-lists,linux-modules=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-modules@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	TAGGED_RCPT(0.00)[linux-modules];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 743C55D50A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-26 12:53:22+0200, Petr Pavlu wrote:
> On 5/5/26 11:05 AM, Thomas Weißschuh wrote:
> > The module authentication functionality will also be used by the
> > hash-based module authentication. Split it out from CONFIG_MODULE_SIG
> > so it is usable by both.
> > 
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > [...]
> > diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
> > index f535181e0d98..84297da666ff 100644
> > --- a/kernel/module/Kconfig
> > +++ b/kernel/module/Kconfig
> > @@ -271,9 +271,12 @@ config MODULE_SIG
> >  	  debuginfo strip done by some packagers (such as rpmbuild) and
> >  	  inclusion into an initramfs that wants the module size reduced.
> >  
> > +config MODULE_AUTH
> > +	def_bool MODULE_SIG
> > +
> >  config MODULE_SIG_FORCE
> >  	bool "Require modules to be validly signed"
> > -	depends on MODULE_SIG
> > +	depends on MODULE_AUTH
> >  	help
> >  	  Reject unsigned modules or signed modules for which we don't have a
> >  	  key.  Without this, such modules will simply taint the kernel.
> 
> Should MODULE_SIG_FORCE be renamed to MODULE_AUTH_FORCE, along with
> renaming the sig_enforce functionality in kernel/module/auth.c to
> auth_enforce?

Given that it is a user-visible symbol we'll need to be a bit careful
not to break existing configurations.
I'll try to use the new "transitional" kconfig attribute.


Thomas

