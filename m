Return-Path: <linux-modules+bounces-5908-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBP3H0Xpq2nUhwEAu9opvQ
	(envelope-from <linux-modules+bounces-5908-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Sat, 07 Mar 2026 10:00:53 +0100
X-Original-To: lists+linux-modules@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE96522AC75
	for <lists+linux-modules@lfdr.de>; Sat, 07 Mar 2026 10:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0ECD303EC3E
	for <lists+linux-modules@lfdr.de>; Sat,  7 Mar 2026 09:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA7B38737F;
	Sat,  7 Mar 2026 09:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nslick.com header.i=@nslick.com header.b="CwnRupca";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PMlJx67J"
X-Original-To: linux-modules@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2797387570;
	Sat,  7 Mar 2026 09:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772874027; cv=none; b=WLhhZ4h6glf2Na8XRkSSdJz3HwgRSN1frE96KsLF7amR+SpPVBuujAABiXQ7uYzkxTBLj1dMZxrbZFqs7nMk01BmS3LOxqYR+MW6hWB2BvpiX5Ou2j3k7oqIYcRA6DAXueCfJbC1pfWrqXhbsd/UqBkQ1kNvdKJDSC/iOSKurDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772874027; c=relaxed/simple;
	bh=4FUgOUrZ1hC5U7kxPWVLWjuecLqnImFCvvAOKygFs8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JYWU3UNSNGnr/E1ODfQQpEZr2pzWnXQmD2JG7ky35BsSBsr8y2P01ceL7M6MQLPLd4ovXDmAEMXZDfdHn0nFwldITTXi1DCbnn/3Id1EBYikxi0V/KaSP5TONLNCEA+YnnvmcKEWzuI2xDjmZW0ylta1vXH9XbWlrP79bPYQul8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=opensource.nslick.com; spf=none smtp.mailfrom=opensource.nslick.com; dkim=pass (2048-bit key) header.d=nslick.com header.i=@nslick.com header.b=CwnRupca; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PMlJx67J; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=opensource.nslick.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=opensource.nslick.com
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1717A7A0269;
	Sat,  7 Mar 2026 04:00:25 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sat, 07 Mar 2026 04:00:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nslick.com; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1772874024; x=
	1772960424; bh=1KxeQ6pIsqLba7ZzzJifr8CDCAYKv5nTwzGMM4oSELs=; b=C
	wnRupcalwbQotZPwwKH/WUxkOkFOl2hnXZ3vavRhxuzxeQJqqP1UUEyGdeitlzwV
	Zb8gPmK4fKpDjqxdYbcMbqNjJtNlx+sx9kqVImIzZPXSH6a2jpjxemqyJL1bmstr
	Dh1rtL5P/bQ6B4Dt6oDGOpQzl2FvEqVzBUvXQI5meLc+SsikGDgBzHHOiBJqz1XF
	P7GZvsg0lWuHazn0+5y20OseymEd5GfExNF85T7NnqbUwfd5osZmEqXeA1KdQe4P
	JZOQ+O7QPuB53LlG+lmW3m1sn+kugvQDT5Io/ZvDQQNNgS0reeouYW4gq2BeDze+
	ZCUaMAgtP7d6twRzrfPzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1772874024; x=1772960424; bh=1
	KxeQ6pIsqLba7ZzzJifr8CDCAYKv5nTwzGMM4oSELs=; b=PMlJx67JpN/syT8H6
	Syvaouami92MLjow2oOI+y6iOh1xI1B457MW/EM3xvmyTD+R6tD5FSP6P7LNIHTN
	dL7vo7K9gZlZAH+tF+UlGo1XX0DO+I4nqQrAPyNBbelbYaKlmIVZ4FLnD5va+HqD
	pdGwE6gJSQGwrgMKnx7aKn8+z0rCmrB3yXACY/JfeP12c8heS7Iqdf75nsmReyfH
	ljbT/q2FArSxQbgZUBNkNawUp2/gAUQVJvmCfdpJ73xQQE42i1ancwH18/RkLJgu
	DtZFK718wmNH5NEmq6+n+4dwoc1nZjwAvGVEBF3NH0BW9VTIYzIIQUPDQXxEKRQi
	2W0tg==
X-ME-Sender: <xms:KOmraakW8y4h0f6-djhLWDuSj_3-agRGDNIB3n6s9BpWR7TlUVwF8w>
    <xme:KOmraeP7iBbas1ymYgrMv2KofPM8ZhwdsfNIMPwchKBp0Ci2-WywppIiMpb5HwnNT
    HAaFcqsOrXZri-kKVkQRNyd9FwI4mwNr8Lm-u2ylK_1vb0zjKsAmc0>
X-ME-Received: <xmr:KOmradHCoPxzSLw5sVd4Q0sxQRHX5bzpeFY_WJXM4vnzvDF7aVKkGiDF08s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvjedukedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheppfhitghhohhl
    rghsucfuihgvlhhitghkihcuoehlihhnuhigsehophgvnhhsohhurhgtvgdrnhhslhhitg
    hkrdgtohhmqeenucggtffrrghtthgvrhhnpeetudevkeeuvefghfetleehkeegudeigfel
    gffhtedvkeevgfekueelfeevfeelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehlihhnuhigsehophgvnhhsohhurhgtvgdrnhhslhhitghk
    rdgtohhmpdhnsggprhgtphhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepmhgtghhrohhfsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehpvghtrhdrphgr
    vhhluhesshhushgvrdgtohhmpdhrtghpthhtohepuggrrdhgohhmvgiisehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehsrghmihhtohhlvhgrnhgvnhesghhoohhglhgvrdgtohhm
    pdhrtghpthhtoheprghtohhmlhhinhesrghtohhmlhhinhdrtghomhdprhgtphhtthhope
    hmrggvnhhnihgthhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgvthgvrhiisehi
    nhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheptghorhgsvghtsehlfihnrdhnvghtpd
    hrtghpthhtohepshhkhhgrnheslhhinhhugihfohhunhgurghtihhonhdrohhrgh
X-ME-Proxy: <xmx:KOmracvNW13Mz5nvEoSlW98YL2MIomrkoKKAGSrM5xq3_CilvZMdfQ>
    <xmx:KOmraVSh5ajyUPBsb60Fn1DPnol4YRcnSkb0_horsMm-mB2Z8I0zOg>
    <xmx:KOmraeNMjuXDEa2qr_g-S9i_RCc1qbTKENXe_tliSVNu88oywZOj3w>
    <xmx:KOmrab6zGeYtnmUzxBPewDoiTKB5AmYYDfOvdwq0E2AyjoM3GoUBTw>
    <xmx:KOmraUw7SqtJjkqtGHXZuXXTIu7ms1W04yB9Rj9BHv8n8nKCmtxMysuv>
Feedback-ID: i78f146c6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Mar 2026 04:00:24 -0500 (EST)
From: Nicholas Sielicki <linux@opensource.nslick.com>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Matthias Maennich <maennich@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-modules@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nicholas Sielicki <linux@opensource.nslick.com>
Subject: [PATCH v2 2/2] docs: symbol-namespaces: mention sysfs attribute
Date: Sat,  7 Mar 2026 03:00:10 -0600
Message-ID: <20260307090010.20828-3-linux@opensource.nslick.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260307090010.20828-1-linux@opensource.nslick.com>
References: <20260307090010.20828-1-linux@opensource.nslick.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EE96522AC75
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nslick.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nslick.com:s=fm2,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5908-lists,linux-modules=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[linux@opensource.nslick.com,linux-modules@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-modules];
	NEURAL_HAM(-0.00)[-0.986];
	DKIM_TRACE(0.00)[nslick.com:+,messagingengine.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[opensource.nslick.com:mid,nslick.com:dkim,nslick.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,messagingengine.com:dkim]
X-Rspamd-Action: no action

Reference the new /sys/module/*/import_ns sysfs attribute in docs as an
alternative to modinfo for inspecting imported namespaces of loaded
modules.

Signed-off-by: Nicholas Sielicki <linux@opensource.nslick.com>
---
 Documentation/core-api/symbol-namespaces.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/core-api/symbol-namespaces.rst b/Documentation/core-api/symbol-namespaces.rst
index 034898e81ba2..2304d5bffcce 100644
--- a/Documentation/core-api/symbol-namespaces.rst
+++ b/Documentation/core-api/symbol-namespaces.rst
@@ -114,6 +114,11 @@ inspected with modinfo::
 	import_ns:      USB_STORAGE
 	[...]
 
+For modules that are currently loaded, imported namespaces are also available
+via sysfs::
+
+	$ cat /sys/module/ums_karma/import_ns
+	USB_STORAGE
 
 It is advisable to add the MODULE_IMPORT_NS() statement close to other module
 metadata definitions like MODULE_AUTHOR() or MODULE_LICENSE().
-- 
2.53.0


