Return-Path: <linux-modules+bounces-1385-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9650A903FA1
	for <lists+linux-modules@lfdr.de>; Tue, 11 Jun 2024 17:07:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BF7F1F256EC
	for <lists+linux-modules@lfdr.de>; Tue, 11 Jun 2024 15:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ED562E417;
	Tue, 11 Jun 2024 15:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qjMOfDDT"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB282C6B6
	for <linux-modules@vger.kernel.org>; Tue, 11 Jun 2024 15:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718118304; cv=none; b=EKsLYvuGVyJk6B+A0AdD68uJn4svz4fo9EXAfDG/QBY4PNzOvgrH1hnLcMA1Rec7O6hz1Q8M1ngcawrF9O8v56OSKnF83e2QY4JNcybdvWYqS5MWX82KwBDglN2j4mTKwbj29EpPy0RdFMojeBe7YmfwVwQyMbyrMgGpikgxSJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718118304; c=relaxed/simple;
	bh=RFkOy+VcBIp8PGf6CZ7uyHIwi3+bmpr7lx7YYLx8y/o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dNfm3B4EDORvv3+isvHZg/9/LbFBUMdOCSy4drHhF9o9QmbYYjYShEWeYUbCEOudwP2pN7EpVAWu5TbIdVP7yPEtJSuvxmpZh6teDizzKx7ihdzvjbfigHNY99uQQt5FTRO1qAJMhRGSj5TMjeXstV3GnzgqHgDLR/cGOI1gi0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qjMOfDDT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1E506C32789;
	Tue, 11 Jun 2024 15:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718118304;
	bh=RFkOy+VcBIp8PGf6CZ7uyHIwi3+bmpr7lx7YYLx8y/o=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=qjMOfDDTo0VHXBg5lR1TYv0OrXa23NEcWeLW/SqvCg/tsVgnKpi0mF+6V+Fe5U2mr
	 uigtbGEgYy3yResCyngm77c+bHZYn3v8OTS6xnoyN5KdDNEsRsQMSj1HLDr5LF6hXh
	 bU9RMhpCi1WyGICrZScg3HRmJQQXH6Xr/dFA+Pi+dIvl0xMgc6BGtldsApR/mdzVvo
	 dclykqFOWVgWCKPTaDQFYny7L68GC7I5u4TvEhcytXuW5JNIrEUMFXJbnNYMA+EkDS
	 dE37hBpek3h50bc6rIyGTJ9tZW9ze5QLEMoz4EdeiANa7/uEQGkXqVeyGPFr6/YUwi
	 Lr/L3Dq42GT1A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08567C27C75;
	Tue, 11 Jun 2024 15:05:04 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Subject: [PATCH kmod 00/20] man: convert to scdoc and minor improvements
Date: Tue, 11 Jun 2024 16:05:00 +0100
Message-Id: <20240611-man-v1-0-bd6864d49639@gmail.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJxnaGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDUyNj3dzEPF1zE+MUs1RTw9QkszQloMqCotS0zAqwKdGxtbUAATAKBFU
 AAAA=
To: linux-modules@vger.kernel.org
Cc: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718118301; l=3692;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=RFkOy+VcBIp8PGf6CZ7uyHIwi3+bmpr7lx7YYLx8y/o=;
 b=4aKm1XCgvdlf7i4+ouL0Rawlym2O9TweVQxok/8omATRQOe9AP3rKh/64Wx/nmHtsF0RAPVR3
 suB1nzQUuY0Ap5G8jucmgaEkStxaYQG9tQNNzhzwcmHtVAnePnFa+01
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received: by B4 Relay for emil.l.velikov@gmail.com/20230301 with
 auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: emil.l.velikov@gmail.com

Hello all,

As mentioned previously, here is a series converting the existing xml
based documentation to scdoc.

Despite the size of this series, one should be able to review nearly all
of it during their first morning coffee ;-)

I've went ahead with scdoc instead of other solutions since it's a
simple 1K LoC, C99 program with trivial markdown-like syntax. Which is
practically available for any distro [1].

A quick search in Arch shows that over 50 packages/projects use scdoc.

This series:
 - patch 1 - simple comparison script of man page _output_ (the roff
   files themselves vary significantly) - DO NOT MERGE
 - patch 2 - the scdoc files themselves, including typos to make diff vs
   original smaller
 - patch 3 - wires scdoc to the build and removes the old xml files

 - patch 4-9 - trivial fixes as white space, punctuation, etc
 - patch 10-18 - expand documentation around {depmod,modprobe}.d handling

 - patch 19 - remove "maintained by" references
 - patch 20 - list short and long options on separate lines

The last two might be little controversial, so feel free to drop them.

NOTE: Some patches have respective question or two within.

As always - comments and suggestions are greatly appreciated.

[1] https://repology.org/project/scdoc/versions
[2] https://archlinux.org/packages/extra/x86_64/scdoc/

---
Emil Velikov (20):
      man: add script to generate/compare the xslt vs upcoming scdoc
      man: add scdoc based man pages
      man: build the scdoc based man pages
      man: remove no longer used XML files
      man: add some extra bold/italic annotations
      man: white space fixes
      man: misc punctuation fixes
      man: some options take an argument, mention that
      man: couple of grammar/language fixes
      man: stop removing DISTCONFDIR lines
      man: depmod.d: document the config file order handling
      man: depmod.d: factor out a CONFIGURATION FORMAT section
      man: depmod.d: rework the opening description sentence
      man: depmod: remove hard-coded /etc/depmod.d references
      man: modprobe.d: document the config file order handling
      man: modprobe.d: factor out a CONFIGURATION FORMAT section
      man: modprobe.d: mention about MODPROBE_OPTIONS
      man: modprobe: remove hard-coded /etc/modprobe.d references
      man: remove the "Maintained by" references
      man: list options one per line

 configure.ac          |   2 +-
 man/Makefile.am       |  30 +--
 man/compare.sh        |  63 ++++++
 man/depmod.8.scd      | 139 +++++++++++++
 man/depmod.8.xml      | 343 -------------------------------
 man/depmod.d.5.scd    | 115 +++++++++++
 man/depmod.d.5.xml    | 164 ---------------
 man/insmod.8.scd      |  35 ++++
 man/insmod.8.xml      |  87 --------
 man/kmod.8.scd        |  49 +++++
 man/kmod.8.xml        | 120 -----------
 man/lsmod.8.scd       |  29 +++
 man/lsmod.8.xml       |  73 -------
 man/modinfo.8.scd     |  84 ++++++++
 man/modinfo.8.xml     | 201 -------------------
 man/modprobe.8.scd    | 232 +++++++++++++++++++++
 man/modprobe.8.xml    | 544 --------------------------------------------------
 man/modprobe.d.5.scd  | 187 +++++++++++++++++
 man/modprobe.d.5.xml  | 265 ------------------------
 man/modules.dep.5.scd |  43 ++++
 man/modules.dep.5.xml |  80 --------
 man/modules.dep.bin.5 |   1 +
 man/rmmod.8.scd       |  53 +++++
 man/rmmod.8.xml       | 148 --------------
 24 files changed, 1041 insertions(+), 2046 deletions(-)
---
base-commit: 8837461494761d58be579641f20cc043274adddf
change-id: 20240523-man-743d6e51eb6f

Best regards,
-- 
Emil Velikov <emil.l.velikov@gmail.com>



