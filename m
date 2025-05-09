Return-Path: <linux-modules+bounces-3614-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC788AB1AC3
	for <lists+linux-modules@lfdr.de>; Fri,  9 May 2025 18:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFBE916EBB2
	for <lists+linux-modules@lfdr.de>; Fri,  9 May 2025 16:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1372B238157;
	Fri,  9 May 2025 16:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kZW1EQaY"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC19D238140;
	Fri,  9 May 2025 16:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746809016; cv=none; b=d6CW2ADs/xWnpm/Sa7e/N7BxINjBca8OblLE5cDI75zMBY4mN1ScYbIsPnZI9AymJstf3Q4R+3igjdRO290pji+kyn7IeAf/P4A+y9C+rKZtIuvM88+3hBSV5KZI0abYNuZ1JHYU0uzWCforCw5km4dXP8T0b/yWGIvozOCwiuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746809016; c=relaxed/simple;
	bh=AzvE08+Vtmh2j/LN2k0JUwxxFHlnrEYfshug5ur5K8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FyaSTCfDuHJxjy8rTQpNVV4GckZ+VN3mVpzV+XIh2JJxUMWjjB2mpZO/udJOMgREAWzbTaVbPIlEEpsiAHraXFQXKpvz9aGxT6nVIXymPCHK0a71wrAr+4jb23cfK+lM823HYW/a0wNLI6ooQ7rpN2aqHOR7mPU9Hn+qZU6uPLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kZW1EQaY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9423C4CEED;
	Fri,  9 May 2025 16:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746809015;
	bh=AzvE08+Vtmh2j/LN2k0JUwxxFHlnrEYfshug5ur5K8g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kZW1EQaY1ydHvO59/282mepX/xt5ZPcKjOaRnc0SFOgruHky/dnKCb1T+8pPud/et
	 9rYH3tniJhi/J6EO/JMWwM7R+gNBJ3Poj+ZTkrqfnA9HMDcSwBxfvI7RLluwkpPwpr
	 zgETsqb18b/iPlV7SMcHcg7XXV0y8Os5Teth8ymbLpiZo2emxFQdEosEAkoYcrGLD0
	 NLwTWDhuxoM2XgfQR9QuSnheGD2xWQqC5TsEvgzGkOyZjW9fMv2PJRYpVcQ1Xi2XPC
	 kPeNAccIfDm/8fEUlD/CfROwdlTb95Is6MlX0L8iWCFj1Ey4AFy2PAef5486ah2CJm
	 gAtWq+YZ7ymtw==
From: Alexey Gladkov <legion@kernel.org>
To: Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Alexey Gladkov <legion@kernel.org>,
	Khalid Aziz <khalid@gonehiking.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [PATCH v2 1/6] scsi: Define MODULE_DEVICE_TABLE only if necessary
Date: Fri,  9 May 2025 18:42:32 +0200
Message-ID: <20250509164237.2886508-2-legion@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745591072.git.legion@kernel.org>
References: <cover.1745591072.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define MODULE_DEVICE_TABLE only if a structure is defined for it.

drivers/scsi/BusLogic.c:3735:26: error: use of undeclared identifier 'blogic_pci_tbl'
 3735 | MODULE_DEVICE_TABLE(pci, blogic_pci_tbl);

Fixes: 1079a2d251f2 ("[SCSI] BusLogic: stop using check_region")
Cc: Khalid Aziz <khalid@gonehiking.org>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Signed-off-by: Alexey Gladkov <legion@kernel.org>
---
 drivers/scsi/BusLogic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/BusLogic.c b/drivers/scsi/BusLogic.c
index 1f100270cd38..8ce2ac9293a3 100644
--- a/drivers/scsi/BusLogic.c
+++ b/drivers/scsi/BusLogic.c
@@ -3731,8 +3731,8 @@ static const struct pci_device_id blogic_pci_tbl[] = {
 	{PCI_DEVICE(PCI_VENDOR_ID_BUSLOGIC, PCI_DEVICE_ID_BUSLOGIC_FLASHPOINT)},
 	{0, },
 };
-#endif
 MODULE_DEVICE_TABLE(pci, blogic_pci_tbl);
+#endif
 
 module_init(blogic_init);
 module_exit(blogic_exit);
-- 
2.49.0


