Return-Path: <linux-modules+bounces-6413-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Ll9GVBgB2q90wIAu9opvQ
	(envelope-from <linux-modules+bounces-6413-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Fri, 15 May 2026 20:05:04 +0200
X-Original-To: lists+linux-modules@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA53E555E28
	for <lists+linux-modules@lfdr.de>; Fri, 15 May 2026 20:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FDC931DA209
	for <lists+linux-modules@lfdr.de>; Fri, 15 May 2026 17:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B3C33DA7FC;
	Fri, 15 May 2026 17:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="NFh5RQ9n"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811703D9DB3
	for <linux-modules@vger.kernel.org>; Fri, 15 May 2026 17:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778865639; cv=none; b=CuXI9Y9SSfldbdr5pNizG3se/6G3Cz9gRFdxEhnMahEJvEqzjz9g9nVc1qaksrtPla1T9GEZeEclm/q1SjYlMV05YRZioHyezuyqWjCfXJIUVFD5WVIRSuXLYM2ZckIQjrCinNn04OzTBEu2Pg395K/E2MIG9ZLuwI2/rP5tu18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778865639; c=relaxed/simple;
	bh=fFuadDs+H7/u75qOFSKI7F2nBapOds8GkF/7nX3dyVM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FG0Rk6H9jvQSbPy+Wgj+0LBjtBdT+T6a1V2q9rvRveiowGxv8G3XSWwVk7IubdzeA6CdyhnDtXParqPoI71kG+npOUxjT2GPbzZad3h2MVk8vNr19pcmyhAqRKi6WcHIVFhElXb3qcbJfjeO7O0dBae9epT8EOacf4iZBo/Cn2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=NFh5RQ9n; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso345005e9.1
        for <linux-modules@vger.kernel.org>; Fri, 15 May 2026 10:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1778865635; x=1779470435; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2lUoioocy03AcJ42VfqZTQUoHuPSfrkeCK7eee51wvo=;
        b=NFh5RQ9nGW+ou2o0CRt8La7iVjjqBmPaRey10VaBOZxSS+Sn5jC+B2KlRhx4cOvEi6
         vlIAckHmnmdQPaX3Ch2ogltWFfR15MmIR+DCp6D9oeLVScjlkpcOUQmB7vNgDfACcvgY
         YcOfu8f7D9xbNx7LnG4YuVE8HS23Hvv+pqAHxmHr3eFrbEMEqw2/Wx81wKAcntn/D8He
         nCwn1Hjt9tJT3PtFWAS/+gfjQX+XtKZwLNyspP4Aukd7aTAfOTO49d3lL3nFiXxFhTlK
         ZWzOjjbRfunHDvpoZ7MRGKkHX22aiED026zY2UkugeVdeKoZkiWfJS5VkMdyxQt1Pj3A
         Wxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778865635; x=1779470435;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2lUoioocy03AcJ42VfqZTQUoHuPSfrkeCK7eee51wvo=;
        b=MD+NJAwN8wK56fxKCwn2jKJwtMF7NL/yZb56yJXkRN7RJW0HFpD1y8lBB9//UNcC2O
         e9e71houc8jUCbzJGCyKOLrpvRyO0dlVd1OAmmoZ8l3UsY0AEZ0oXxnO6sUV0plcpZ8W
         JMXcqPsux2ae+jZkU5v2jzLH3ZhKlEvVItdADIWR/o6EUkWaMun7ZqIVdJjUp67ermOT
         hbxZQw8niXZN3lbYWFMO/rBkc9iWVy/pKAc4jP1ofldYcPolnr7y6e+WY8e1GUGyYQU5
         uWv6CQ6G8xed3Y++ZDMH73sGoe2/xMyn3o3Ilw0lIipmbDK7pZyshRjZ6sjaRUZ2NWp0
         httA==
X-Forwarded-Encrypted: i=1; AFNElJ+HT8ihhMtioFhL/+y5P2CacfEI9SHsV4WFohtUHXCKXHcpQdVScOebCX9bypZ7rNFt4m6DBQoMU8bQMIE2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7DfaUSVOrCGxaydR+KvKp/I8R+N7U231uMZdR2ZsYPlbjjte+
	oQW+UC5kg9gDxrmwYTTsFEeYwnCEinJiQyvb9wBS9mkzsl83TbcnZHgr5QZ77yjPUYBhy9H+bIx
	VgJo=
X-Gm-Gg: Acq92OGI9mDLyg483zWB9H87gjjG1+tvDzSqf61z/7WK9l6BC2HeHKbYe1an+qjJdut
	7ml+8TlvBAdHU/dx52NpS0Pt159JBMkTdjm3W6k1l/yTeXZzymfapb+yAMHi0EkUolrxx/GxSfI
	MQR559xoIFAplCOcdKFSPC2Py6sFRHcxxdpmWe9B6Fxx7J/7BZ3dcepAaU8ohSThlqkFKkXmdDk
	U7optIVuHJiLwQh5A3DeIc6rWDF7WRdQ2r9R8ZW34EX4yuBJqd2kL0VuPR2AJspbeVzGWjqhgNm
	2yIxYZYTgJytONsYBQFqMqwBx6S/y9qsFQ2Om04ScixesmbQjDIp+E+gMXhI+5Lv8DqPj8iFHUM
	7vlWD6dKGa+csmS8gpZyBSzYrJbAWgXY2MeIldR5Cat01FXBO9xKCHcO2aW/HxsSqO1JTuQnIfO
	TC8uIobpDVAw6mMb5KO0HUdck0Ljw7fripuZNfRss=
X-Received: by 2002:a05:600c:3e07:b0:48f:d1c0:721e with SMTP id 5b1f17b1804b1-48fe60d7823mr75476505e9.12.1778865634776;
        Fri, 15 May 2026 10:20:34 -0700 (PDT)
Received: from [192.168.2.212] ([185.209.196.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe537ccf5sm77251515e9.14.2026.05.15.10.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 10:20:34 -0700 (PDT)
From: Michal Gorlas <michal.gorlas@9elements.com>
Subject: [PATCH 0/2] module: restrict module auto-loading to privileged
 users
Date: Fri, 15 May 2026 19:20:18 +0200
Message-Id: <20260515-autoload_restrict-v1-0-40b7c03ddd04@9elements.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrBvQUA14lSIlnYx2ihiZiSKId
 zfV5Vv8v4OSMCm0xQ5CKyvHKaN6FIBfPw1kOGSDLW1T1lVt/JLiGH14C2kSxmSw942zDp/BWcj
 dLNTzdj1f3W1dPj/C9B/BcZz9FRLIdQAAAA==
X-Change-ID: 20260515-autoload_restrict-cfa6727c4d72
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
 Aaron Tomlin <atomlin@atomlin.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-modules@vger.kernel.org, Michal Gorlas <michal.gorlas@9elements.com>
X-Mailer: b4 0.15.0
X-Rspamd-Queue-Id: CA53E555E28
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[9elements.com,quarantine];
	R_DKIM_ALLOW(-0.20)[9elements.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[9elements.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6413-lists,linux-modules=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-modules];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.gorlas@9elements.com,linux-modules@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[systemd.io:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add option to restrict the module auto-loading to CAP_SYS_ADMIN.
This is heavily inspired by CONFIG_GRKERNSEC_MODHARDEN of the latest
available Grsecurity patches [1]. Instead of checking whether the
callers' UID is 0, check whether the calling process has CAP_SYS_ADMIN.
The reasoning here is that many modules are autoloaded by systemd
services which are running as privileged users, but do not have UID 0.
While systemd-udevd runs as root, systemd-network (which often
auto-loads a module) for example runs as system user (UID range 6 to
999).

When enabled, reduces attack surface where unprivileged users can trigger
vulnerable module to be auto-loaded, to then exploit it. Recent LPEs
(CopyFail [3], DirtyFrag [4]) for example, would have been mitigated
with this option enabled as long as the vulnerable modules are not built-in
(or already loaded at the point of running the exploit). 

[1] - https://github.com/minipli/linux-unofficial_grsec/blob/linux-4.9.x-unofficial_grsec/kernel/kmod.c#L153
[2] - https://systemd.io/UIDS-GIDS/
[3] - https://github.com/theori-io/copy-fail-CVE-2026-31431
[4] - https://github.com/V4bel/dirtyfrag

Signed-off-by: Michal Gorlas <michal.gorlas@9elements.com>
---
Michal Gorlas (2):
      module: add CONFIG_MODULE_RESTRICT_AUTOLOAD
      module: restrict autoload to CAP_SYS_ADMIN if  CONFIG_MODULE_RESTRICT_AUTOLOAD

 Documentation/admin-guide/kernel-parameters.txt |  5 +++++
 kernel/module/Kconfig                           | 15 +++++++++++++++
 kernel/module/internal.h                        |  1 +
 kernel/module/kmod.c                            |  5 +++++
 kernel/module/main.c                            | 11 +++++++++++
 5 files changed, 37 insertions(+)
---
base-commit: 663385f9155f27892a97a5824006f806a32eb8dc
change-id: 20260515-autoload_restrict-cfa6727c4d72

Best regards,
--  
Michal Gorlas <michal.gorlas@9elements.com>


