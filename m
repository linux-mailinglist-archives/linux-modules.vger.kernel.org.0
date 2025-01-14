Return-Path: <linux-modules+bounces-3034-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FE5A10C12
	for <lists+linux-modules@lfdr.de>; Tue, 14 Jan 2025 17:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B90B162806
	for <lists+linux-modules@lfdr.de>; Tue, 14 Jan 2025 16:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A3F1552FC;
	Tue, 14 Jan 2025 16:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=arulpandiyan.vadivel@siemens.com header.b="RxDpvD3i"
X-Original-To: linux-modules@vger.kernel.org
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE5012FB1B
	for <linux-modules@vger.kernel.org>; Tue, 14 Jan 2025 16:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736871501; cv=none; b=dpSJYAODFpDN+MNwBEkZ1Qg+98+1VaCWObc+9gEtgF+S1i6rG/aK6wmBPSQxpd7Wzsiw6MfvtE2bHh3MlLAbuTud55IyGHdYzNJaofbyT0MHvhpVq4KDdzwSyYgwZg5qIUDsiVSC7wKZuyx1kHtd5/ct5D2Ozq78CcsEy8rUER4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736871501; c=relaxed/simple;
	bh=OzjxDewEwUoFmZDlqj/rXaQEJ3MlmH9gIL7xuLQfnAM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VtnJwUbBG2jTddIcUiiTHYVwrES+//yVnv4Bwh6X9/fgGOvNorwNT17rvTHbid+QklZJPJxn1mxpb5nmuSbUWT5ACfiFQEey2vb6qB8IYuyijFsdFIBXTf1Nf3Xf3LqwHrplCelLqimMPJ1T2kcyHU9XJd5UlP5R1h+nG3jGocc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=arulpandiyan.vadivel@siemens.com header.b=RxDpvD3i; arc=none smtp.client-ip=185.136.65.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202501141618118687728aa7aa1145d1
        for <linux-modules@vger.kernel.org>;
        Tue, 14 Jan 2025 17:18:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=arulpandiyan.vadivel@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=m13rf/fo4REE8bUbLVn7lVoeLJdU0fGKILMfr63i7Cc=;
 b=RxDpvD3iUN/Ce+ZWZ24u7l3YWIHtoW6Wl67udRGPShiCnG+jcKC+j577CJuutnFtrCz6Iz
 O1xGcxQPzsYoxEG38vNpByQrACQNWK/9u57zw9NqlCyKCt/WoEv2c7SZz5h8yD58sRmL+dyc
 J44iBGZRXAAmhoBgr7IGYkIHZPC40Lo1+VJbxjD3Jmic9X7fMiWwUXFpn/PGzEmTqpa7NDSE
 9M+YwbZw4kS/WvfQg0VkJlaVv5n6F/W/L9JQu8BUByLjjwiV5XGenKGGCQaxILBPWltXFyrS
 l5Sf+fIVy7LVIZOyCY/nmkzvCkof0Z1jwIayLECMf1dQerEfgJQlT4Gw==;
From: Arulpandiyan Vadivel <arulpandiyan.vadivel@siemens.com>
To: linux-security-module@vger.kernel.org
Cc: linux-modules@vger.kernel.org,
	cedric.hombourger@siemens.com,
	srikanth.krishnakar@siemens.com,
	Arulpandiyan Vadivel <arulpandiyan.vadivel@siemens.com>
Subject: [PATCH V2] loadpin: remove MODULE_COMPRESS_NONE as it is no longer supported
Date: Tue, 14 Jan 2025 21:49:47 +0530
Message-Id: <20250114161947.77206-1-arulpandiyan.vadivel@siemens.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328317:519-21489:flowmailer

Updated the MODULE_COMPRESS_NONE with MODULE_COMPRESS as it was no longer
available from kernel modules.

Fixes: c7ff693fa209 ("module: Split modules_install compression and in-kernel decompression")
Signed-off-by: Arulpandiyan Vadivel <arulpandiyan.vadivel@siemens.com>
---
Changes in v2:
Reword the commit message
Modify logic and add Fixes tag.
---
 security/loadpin/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/loadpin/Kconfig b/security/loadpin/Kconfig
index 848f8b4a60190..d82bcdb34cc8a 100644
--- a/security/loadpin/Kconfig
+++ b/security/loadpin/Kconfig
@@ -16,7 +16,7 @@ config SECURITY_LOADPIN_ENFORCE
 	depends on SECURITY_LOADPIN
 	# Module compression breaks LoadPin unless modules are decompressed in
 	# the kernel.
-	depends on !MODULES || (MODULE_COMPRESS_NONE || MODULE_DECOMPRESS)
+	depends on !MODULES || (!MODULE_COMPRESS || MODULE_DECOMPRESS)
 	help
 	  If selected, LoadPin will enforce pinning at boot. If not
 	  selected, it can be enabled at boot with the kernel parameter
-- 
2.39.5


