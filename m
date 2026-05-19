Return-Path: <linux-modules+bounces-6441-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBdSABEEDGojTwUAu9opvQ
	(envelope-from <linux-modules+bounces-6441-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Tue, 19 May 2026 08:32:49 +0200
X-Original-To: lists+linux-modules@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A1B57824D
	for <lists+linux-modules@lfdr.de>; Tue, 19 May 2026 08:32:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFECD3058BB9
	for <lists+linux-modules@lfdr.de>; Tue, 19 May 2026 06:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92258389444;
	Tue, 19 May 2026 06:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wwo4GUzM"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0C427816C;
	Tue, 19 May 2026 06:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779171977; cv=none; b=Ix3r6682G4emgDycoT5HY1/SrWxD9aiZNaP6VW5A34VGXPhdiH6GdDexWrntrclPV5MlNku2eXnlMRERX/XFi+a5dIP3APwAw40hsUrvQSsQN84ARPiZhLp8NiLeA59kHC3W/vkYqvRlS1IScTIs2lEqaNSwp78CRJlnSU9GzU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779171977; c=relaxed/simple;
	bh=M3dpPwalF2NocfqTid6q3XDvlD/d7Tn+i9Og7LQzuig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qFb6cSf+5lmS6N6bu5deUr80IsqZhir5rNPTYAe4IFqNyntY4D+QFChjxOGtRB/AtVEZNc0NGyzMP2naVTKSPljAOndBR8G7deo9Ey9MFJRaO4Uimqm3JxuLz5fdMFsB1cn44eJOA8YiUjZte9yGr+Z6743IUeJUK05apzLDs5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wwo4GUzM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B0FBC2BCFB;
	Tue, 19 May 2026 06:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1779171977; bh=M3dpPwalF2NocfqTid6q3XDvlD/d7Tn+i9Og7LQzuig=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=wwo4GUzMgBDhhtPS4J7hT530U+FIJci1rtMF0WfxgcULyFfkxuvTR/Hf6veg7kCSZ
	 Byl4nr+CiuDd7js7gnbt1bzEA7VSTxSQRTA99Uxkp4fD1L6mrCcD3nrU67XTsn03Zn
	 u5rV8JTBdipp9rrGBURR8724/EH8nwn7UlMxarsQ=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A420CD4F5B;
	Tue, 19 May 2026 06:26:17 +0000 (UTC)
From: Alvin Sun <alvin.sun@linux.dev>
Date: Tue, 19 May 2026 14:26:15 +0800
Subject: [PATCH 3/8] rust: drm: add `ThisModule` associated type to
 `Driver` trait
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-fix-fops-owner-v1-3-2ded9830da14@linux.dev>
References: <20260519-fix-fops-owner-v1-0-2ded9830da14@linux.dev>
In-Reply-To: <20260519-fix-fops-owner-v1-0-2ded9830da14@linux.dev>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-modules@vger.kernel.org, driver-core@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
 Alvin Sun <alvin.sun@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779171975; l=819;
 i=alvin.sun@linux.dev; s=20260317; h=from:subject:message-id;
 bh=M3dpPwalF2NocfqTid6q3XDvlD/d7Tn+i9Og7LQzuig=;
 b=dljVO2vk92ayJATiwozOI2qCWLcVZLtXkz//3VFX2GABwDBBjyg9sQBeD0lchTq996i2OwnoG
 n7BHGuiImStAmxErDZevujd6j3jUS4LrqRkaP0/+KeO9J+MGxSCUbWp
X-Developer-Key: i=alvin.sun@linux.dev; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for alvin.sun@linux.dev/20260317 with
 auth_id=684
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,suse.com,atomlin.com,linuxfoundation.org,gmail.com,ffwll.ch,collabora.com,arndb.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6441-lists,linux-modules=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alvin.sun@linux.dev,linux-modules@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-modules];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,linux.dev:mid,linux.dev:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 90A1B57824D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a `ThisModule` associated type bound by `ModuleMetadata` to the
`drm::Driver` trait, allowing DRM drivers to expose their module
pointer for use in file operations.

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
---
 rust/kernel/drm/driver.rs | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index 5233bdebc9fcd..c798961650c1a 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -115,6 +115,9 @@ pub trait Driver {
 
     /// IOCTL list. See `kernel::drm::ioctl::declare_drm_ioctls!{}`.
     const IOCTLS: &'static [drm::ioctl::DrmIoctlDescriptor];
+
+    /// The module implementing this driver.
+    type ThisModule: crate::ModuleMetadata;
 }
 
 /// The registration type of a `drm::Device`.

-- 
2.43.0



