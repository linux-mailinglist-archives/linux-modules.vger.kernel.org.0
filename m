Return-Path: <linux-modules+bounces-6440-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKMHMAwEDGojTwUAu9opvQ
	(envelope-from <linux-modules+bounces-6440-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Tue, 19 May 2026 08:32:44 +0200
X-Original-To: lists+linux-modules@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 675E6578246
	for <lists+linux-modules@lfdr.de>; Tue, 19 May 2026 08:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65F1B30578F3
	for <lists+linux-modules@lfdr.de>; Tue, 19 May 2026 06:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91594388E53;
	Tue, 19 May 2026 06:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="P8rM12T0"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0431A682A;
	Tue, 19 May 2026 06:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779171977; cv=none; b=HoYoNu4NxSJk1YtNCoD2SAs3RdZ+7P9x6NgohmwIfedIwIDQWKpfB2f8Twy25bsDOZV/Ke3Lc5DgHAkgqgR0R4S64aILH/d6JPSTNGZVTZDfnaYpmqesfcs/DpD4GXJmc7F2J6ZJzzZRgODHpE/ADnSdfy2hdK9xrotq9W//cas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779171977; c=relaxed/simple;
	bh=vfc7PEfuAeEjqo+PGe1GnSXUHGllBagvhexmLDwXXe8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l24E7KggOxUxl8VAta0q8X0Lq565EThJgSpuyCwuWG4+tR4lL52lbrie3+q/iLYal1YRy+VSPzWzeGtw00TIQfOIA6+EY0wmdtSNlasdsb0uS1KBXCYw1Hin3u4OG2EOm7KJ5uNKMKkVgqWhvg1fiNgdnVtCi+mrUfar2KPOJDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=P8rM12T0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A978C2BCC6;
	Tue, 19 May 2026 06:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1779171977; bh=vfc7PEfuAeEjqo+PGe1GnSXUHGllBagvhexmLDwXXe8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P8rM12T04+ZuBv6GHundGYtIAaOiFQVmUSH7xably5MuOZQ8r7iLOc9QKjSDnaqHj
	 ffhhMsqcDAfQUTpMlh75x4ZMxFrqOtbIE6ktVNGwnd8YqYIC9l66CN/lrR07iXbABi
	 n7Q3gj5LIToe4RvmN8BIkAX2EuqEmobGxso5P/M8=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 095DCCD4851;
	Tue, 19 May 2026 06:26:17 +0000 (UTC)
From: Alvin Sun <alvin.sun@linux.dev>
Date: Tue, 19 May 2026 14:26:14 +0800
Subject: [PATCH 2/8] rust: driver: make `DriverModule` struct pub(crate) in
 `module_driver!`
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-fix-fops-owner-v1-2-2ded9830da14@linux.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779171975; l=796;
 i=alvin.sun@linux.dev; s=20260317; h=from:subject:message-id;
 bh=vfc7PEfuAeEjqo+PGe1GnSXUHGllBagvhexmLDwXXe8=;
 b=iHl0SVhJNpVhuwZ7fh48egK9TuW+0iU+YW7qNL4AsNI9HBq33i2CD/EuLLetzk/gmObncqGZY
 c1YeH3GB4bhDdkz58UDUJs4GIxBetIU7CQNTcDd16LTUVxnj/j/Y7aw
X-Developer-Key: i=alvin.sun@linux.dev; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for alvin.sun@linux.dev/20260317 with
 auth_id=684
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,suse.com,atomlin.com,linuxfoundation.org,gmail.com,ffwll.ch,collabora.com,arndb.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6440-lists,linux-modules=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alvin.sun@linux.dev,linux-modules@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-modules];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux.dev:email,linux.dev:mid,linux.dev:dkim]
X-Rspamd-Queue-Id: 675E6578246
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Expose the generated `DriverModule` struct as `pub(crate)` so that
driver implementations can reference it via `super::DriverModule`
for the `ThisModule` associated type.

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
---
 rust/kernel/driver.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/driver.rs b/rust/kernel/driver.rs
index 36de8098754d0..9c7c69c4d2af0 100644
--- a/rust/kernel/driver.rs
+++ b/rust/kernel/driver.rs
@@ -253,7 +253,7 @@ macro_rules! module_driver {
         type Ops<$gen_type> = $driver_ops;
 
         #[$crate::prelude::pin_data]
-        struct DriverModule {
+        pub(crate) struct DriverModule {
             #[pin]
             _driver: $crate::driver::Registration<Ops<$type>>,
         }

-- 
2.43.0



