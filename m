Return-Path: <linux-modules+bounces-2762-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C56139F398B
	for <lists+linux-modules@lfdr.de>; Mon, 16 Dec 2024 20:17:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A443916760B
	for <lists+linux-modules@lfdr.de>; Mon, 16 Dec 2024 19:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C04207DF9;
	Mon, 16 Dec 2024 19:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="KoAgE5FP"
X-Original-To: linux-modules@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40409207DE3;
	Mon, 16 Dec 2024 19:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734376624; cv=none; b=bKQm3cosn7ufWUp0fi0JcI7EdE+OV1yPGu0O0xvdhHCc4TXWG8Mi7KDXDZohm+KQo2Jz8t64EFitx7BGGR86L7vepvtVU89JNdg7Ixy7GjVDJjnnubdDSOBCRWFboHrC5iqvyaeGAF6YBPk3AU548zT2CrnLUWiOVnzKgtzf9Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734376624; c=relaxed/simple;
	bh=BREmyy2X+Lyrg1xWaxR9jZ1g33IfNfjC6Mi8ln5yPXg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Cl8QYEjmQyq+HP1t2uXp7EemNhGeE/ma/rfqPWfAOCDIwLnRvZvkFw2A4omn/gWhhcT+yiifhtQDXbn+n6aT0rI00G4i72We3hLZ8soNL/3B/7UqJgHO5BnygWrgL8mv6fgn6qXTbUjIK4kH6iGEZuUBMSTIe/2ESfXU6LAHS2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=KoAgE5FP; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734376618;
	bh=BREmyy2X+Lyrg1xWaxR9jZ1g33IfNfjC6Mi8ln5yPXg=;
	h=From:Subject:Date:To:Cc:From;
	b=KoAgE5FPL0I539YmLKn8eNWQb4VdPISklLyuvtrOItZtoCMrU0ozQvPLbRtRZtZXB
	 sbU5xcTjW1puVRxgkiiwPK400VCkMu88gB2t7/vKiuZc08uKJWO9eYy3HuFXWZXK7f
	 hNIK7srbYvEji+AJigs2pxInGpGDViJHRhPxgXJE=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/4] module: sysfs: Two cleanups and preparation for const
 struct bin_attribute
Date: Mon, 16 Dec 2024 20:16:40 +0100
Message-Id: <20241216-sysfs-const-bin_attr-module-v1-0-f81e49e54ce4@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJh8YGcC/x3MSwqEMAwA0KtI1gZs/aFXERmqRg1oK00dFPHuU
 2b5Nu8BIc8k0CYPePqysLMRKk1gXI1dCHmKBp3pQmlVotwyC47OSsCB7ceE4HF307kRDpSVeVE
 1eW0qiMPhaebrv3f9+/4AjnnAxG0AAAA=
X-Change-ID: 20241215-sysfs-const-bin_attr-module-be05346937a6
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734376617; l=719;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=BREmyy2X+Lyrg1xWaxR9jZ1g33IfNfjC6Mi8ln5yPXg=;
 b=n0bf4WOlsiRb0SEMNqckCUdhOXKZkLUrDHNyTVTUL8aWpKLRfpiAKbiimHFqb4Y7lsCsN/wwS
 yaIpBJxuBhNAgRVdhdMEBxJgi+ilJY8Yb+wZsEw24NBe3QM8W/KTjGu
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The sysfs core is switching to 'const struct bin_attribute's.
Prepare for that.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (4):
      module: sysfs: Drop member 'nsections'
      module: sysfs: Simplify section attribute allocation
      module: sysfs: Add notes attributes through attribute_group
      module: sysfs: Use const 'struct bin_attribute'

 kernel/module/sysfs.c | 85 +++++++++++++++++++++++++--------------------------
 1 file changed, 41 insertions(+), 44 deletions(-)
---
base-commit: 2d8308bf5b67dff50262d8a9260a50113b3628c6
change-id: 20241215-sysfs-const-bin_attr-module-be05346937a6

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


