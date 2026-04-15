Return-Path: <linux-modules+bounces-6248-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GcCIonj3mklMAAAu9opvQ
	(envelope-from <linux-modules+bounces-6248-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Wed, 15 Apr 2026 03:02:01 +0200
X-Original-To: lists+linux-modules@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB28A3FF6CA
	for <lists+linux-modules@lfdr.de>; Wed, 15 Apr 2026 03:02:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2030730A4480
	for <lists+linux-modules@lfdr.de>; Wed, 15 Apr 2026 00:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA06288C0E;
	Wed, 15 Apr 2026 00:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pVE8vzzP"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F5B282F14;
	Wed, 15 Apr 2026 00:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776214743; cv=none; b=Qov2qgt9vATgThqUWUkmF3QXpIaD4TxLJ/I+ANwPCzQidodWuiw7cHgXyzQ9pU1Y4wzNCQIVZJ88jog22wp+NpSJT285yPJJc5WpMG+/vPvbXfPM2HqjT00Q9EQojDOv8DrMBbwI6IWSHUfPys/JhJ5W4yB0K0SptbdXamC378g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776214743; c=relaxed/simple;
	bh=fXEv8Cnu3aFdp2BoURxMPIn9dosOQUIpsWriZEpDDZE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=dFe1nl/ZMqU0b54IXMYKGDXEeMDh3TI3C0yzEiAsjvHoUCAvJp3ghp0zG2PEsnANBM22r+cdvnkXuJLyJKSlbIWMmFYEEDWXuvLZEGX2yg0weDzu7dCRITUFOuN7PJXWqZKYh0cjJVdI0S4YZLtNoTmrxy+OEwKWl9qqz0CJNA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pVE8vzzP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6ACDC2BCB5;
	Wed, 15 Apr 2026 00:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776214743;
	bh=fXEv8Cnu3aFdp2BoURxMPIn9dosOQUIpsWriZEpDDZE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=pVE8vzzPgAmd2Pyw/TpV5GV0hxgthg8+E+jSYGKUYbxr0nOi3jBNqvTIllF+eI7lk
	 8wpEhmKpa86IhK5FsKEg16PIwZbOGkCvant5R8i1yQ25wO2aAjUhjPtXqC2L5KPSj2
	 LpCVQY5MmQe+tsPQo6qutV7lqwCem5grcLlMC0EdkDg0yStOadf9QXkXjf322qptC6
	 0vOW3wVoIUkAeClJl3ZDbRIpk3/pClYI77udUabi2JPuZAYErrW+C7V33lgZtloLvF
	 OJnZDz5Cf/9CCDRWcvti4/BiJ8rTXtlQFcHgydHSpoi3qhbLTA3S2PlbUcYQ2MftUo
	 W+o8aG4pgRONg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02F5A3809A29;
	Wed, 15 Apr 2026 00:58:35 +0000 (UTC)
Subject: Re: [GIT PULL] Modules changes for v7.1-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260413002616.1966468-2-samitolvanen@google.com>
References: <20260413002616.1966468-2-samitolvanen@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260413002616.1966468-2-samitolvanen@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/modules/linux.git tags/modules-7.1-rc1
X-PR-Tracked-Commit-Id: 663385f9155f27892a97a5824006f806a32eb8dc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 88b29f3f579987fff0d2bd726d5fa95a53f857fa
Message-Id: <177621471356.1543667.18442675068721489916.pr-tracker-bot@kernel.org>
Date: Wed, 15 Apr 2026 00:58:33 +0000
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, Daniel Gomez <da.gomez@kernel.org>, Joe Lawrence <joe.lawrence@redhat.com>, linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, Lucas De Marchi <demarchi@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Nicholas Sielicki <linux@opensource.nslick.com>, Petr Pavlu <petr.pavlu@suse.com>, Siddharth Nayyar <sidnayyar@google.com>, =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6248-lists,linux-modules=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-modules@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-modules];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EB28A3FF6CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The pull request you sent on Mon, 13 Apr 2026 00:26:14 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/modules/linux.git tags/modules-7.1-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/88b29f3f579987fff0d2bd726d5fa95a53f857fa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

