Return-Path: <linux-modules+bounces-6196-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JT1MZx4ymnk9AUAu9opvQ
	(envelope-from <linux-modules+bounces-6196-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Mon, 30 Mar 2026 15:20:28 +0200
X-Original-To: lists+linux-modules@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CE435BD05
	for <lists+linux-modules@lfdr.de>; Mon, 30 Mar 2026 15:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EAD51302B500
	for <lists+linux-modules@lfdr.de>; Mon, 30 Mar 2026 13:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB6F3D333C;
	Mon, 30 Mar 2026 13:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QPh2CZnx"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9825D3CFF59;
	Mon, 30 Mar 2026 13:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774876470; cv=none; b=ibd2I96+OB5k+hzfXJ14EhAjDRoN6k3re1QfU9MNoE3i0WhIhYFXfMBl3Mf1c1nA7PRZekSgzlCkAa7PHbzcHQDhV9tOtz09B4mu53aqtuFvGWIvfRoOCS0rWTEBaNUE+CMyXXd2vqcwsUv2i5wocvXVXHzwCEcX61jc/Uf0aVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774876470; c=relaxed/simple;
	bh=J5w76OZKJoezTQFTwN4qvp6wCgSb6Pk7O7sYRyFBtA4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AeJUCtqiTaI59zACaFouRsZK4L6FXxaU9uc3dd9JfMWNi7gC4lMq6wLQoP97zfuTnUcQPQR10BcuXHISuLZUsq8Wgz5aOwaO7KdvWtSMNgDy1a279PGLy7vieFG/mje5lMEcl9hRnY9oNrGneoHG+H3YU1GrQT6YXYUA5wW0r+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QPh2CZnx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06C76C4CEF7;
	Mon, 30 Mar 2026 13:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774876470;
	bh=J5w76OZKJoezTQFTwN4qvp6wCgSb6Pk7O7sYRyFBtA4=;
	h=From:To:Cc:Subject:Date:From;
	b=QPh2CZnx0izLyVG9tb5jJBhbb+CZ5Rdlu8TP2KsNVDMbRg0i4Cv38yV37Kv0jb3L7
	 gSKw+ZvCHmO7OJS4veiufzLWOHKMCp+yMNGOxGBl0X91rclgAe/Tk+PANMyvgDNS3n
	 5tseOW7aFlhc3ZMXNHfJ7rUEYauyZdYEKkv5DOUCbPTSci1/IsUAB70ShF+EyfCWCL
	 jiwbp5c0us/PV1f3pVXmI5q8HK/baI8njRzVppo9W/mE2irTOeYrMl2FfRoOnPj/eP
	 0BGHktTCsAfXjDmgI7hLbo+kJ9+gDSJJbP6iFqQXvIC9g9J+qYbZMSmtY9QLaaeVDB
	 g6+Cy7ELzb1Zw==
From: Lucas De Marchi <demarchi@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>
Cc: Lucas De Marchi <demarchi@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Phil Sutter <phil@nwl.cc>,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christophe Leroy <chleroy@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 0/2] module: Tweak return and warning
Date: Mon, 30 Mar 2026 08:13:50 -0500
Message-ID: <-v2-0-a3542e15111c@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1068; i=demarchi@kernel.org; h=from:subject:message-id; bh=J5w76OZKJoezTQFTwN4qvp6wCgSb6Pk7O7sYRyFBtA4=; b=owEBbQKS/ZANAwAKAZuipaYwy+pTAcsmYgBpynbgBvDY9FQMbsoMfPWR3GWO4+3TcJ+thgjZc jT8twkPGHuJAjMEAAEKAB0WIQTqszyWkAE8czkWrIOboqWmMMvqUwUCacp24AAKCRCboqWmMMvq U4XJD/oCPmCRYy5JXshuPl9VHSg38WyTO5Mv8QfB7ZhjZJrB0iShz85yE7+q3H0ukLIKQFG7k08 4mhVOwUUcAoSDE6Y9JQFkXlwB18Vt+9s8YBa8j1VGKcKZCjKv+klJkk5qlVSm6oQBHxDr2Umiyb GpqEyNK7sxzU+QC4vtlEooerIRwriSz72FZ/QHKItMPiRnyOlvrBHozavzlMhoUqULaUNlCXXJ4 6yt767vZwcBsaFkxGjXjR7R0d26ez29YeyZYAym01VEcdpxVgIUi9keg44xIVUSY7q4hTflzTYf QLw8o6oRrqbPyhdHpzvFb+obwZEWwTmYIxoNCQ/SVK/uFB1VFkg6WuQpaMZjFe2W3tEmZy1OR5j B3nYmbysLQx6aJQE4X0eZu0IcObl61a5eQ4xBUkAB4oiBFARXm4GpFn/RjLM1aObj0C0MiyKu0+ njOosGW5cYW62L1EVwHYmvYyRIqD3NjwevOkwjSpc/2PXueFBUo/aDfUBKW4LPLL1um1P6lNphF u7za2eKfMkJzBldbN7IGvXilWM/7VMC/jsbqUFVWIVOVqmuCroNfDs7BUBvq8sllSqAEypOi5Vf TiOADj/Ue5EKV4NpWYYrYWRy+aNEU3xrgZVeFFw1DedpVomBbPzrRA7dhJKamV10np7n1DyxjuB 2CEYgvBmi
 f/163A==
X-Developer-Key: i=demarchi@kernel.org; a=openpgp; fpr=EAB33C9690013C733916AC839BA2A5A630CBEA53
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6196-lists,linux-modules=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[demarchi@kernel.org,linux-modules@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-modules];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,atomlin.com:email]
X-Rspamd-Queue-Id: 45CE435BD05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Do not let userspace tools and end users confused on the return code and
log messages.

To: Luis Chamberlain <mcgrof@kernel.org>
To: Daniel Gomez <da.gomez@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Aaron Tomlin <atomlin@atomlin.com>
Cc: Petr Pavlu <petr.pavlu@suse.com>
Cc: Daniel Gomez <da.gomez@samsung.com>
Cc: Phil Sutter <phil@nwl.cc>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-modules@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

XXX    "from-thread": "20251013-module-warn-ret-v1-0-ab65b41af01f@intel.com"

XXX    "change-id": "20260324-module-warn-ret-7bde7d4851be",

---
Lucas De Marchi (2):
      module: Override -EEXISTS module return
      module: Simplify warning on positive returns from module_init()

 kernel/module/main.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)
---
base-commit: c369299895a591d96745d6492d4888259b004a9e
change-id: 

Best regards,
--  
Lucas De Marchi <demarchi@kernel.org>


