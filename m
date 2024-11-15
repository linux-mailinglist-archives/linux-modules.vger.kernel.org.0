Return-Path: <linux-modules+bounces-2528-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 970CE9CDEA8
	for <lists+linux-modules@lfdr.de>; Fri, 15 Nov 2024 13:51:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CA0728385F
	for <lists+linux-modules@lfdr.de>; Fri, 15 Nov 2024 12:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4FF21BCA1B;
	Fri, 15 Nov 2024 12:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="YAqdgl0Z"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67ED5558BB;
	Fri, 15 Nov 2024 12:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731675097; cv=none; b=mJKA1BiNOQlg7l9js4r4M5pSdWMNN3zvbTekzjzjFzjMyJ6tKdQ94KoaDyRvLZQamRXq+1xu7ePDQl1BFzHcUuJKFYnctP8FQYLqwUbrVaMv0mClm5AOJnmVI9t9SuVXY0tbJj+nbJZSXGBWcLUzHohBlg7r5epsFzM5Of6h5HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731675097; c=relaxed/simple;
	bh=Gxh5SD2o3AZvE1R0wsLp3va2AjRJh+tsS2pl/p1tOOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ix/thORto98N/ffUY2BSrFxLRGOmeulOHKDUIlg7OcyYYqIS5UQibKkNDtCS3wIcM2Gz9xlwQ+debmlx/OOCP8KLuOpOYi4QCvan1w/zeldSPjP4kiSxVN3tJyO75TQTrKI7YWhzKVYCXy+tcZT9wUuaKMkbWA6OSIDIZo/qt4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=YAqdgl0Z; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from wse.fritz.box (p5de457db.dip0.t-ipconnect.de [93.228.87.219])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id EE2872FC0059;
	Fri, 15 Nov 2024 13:51:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1731675088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lzzThzBp51NN8jQZ1RQcQJROIdKCMgSV94iAx8zGQzs=;
	b=YAqdgl0ZlDRSn9J74NS2NkmMyXzyaiNq1gtVPOWAZjXwaP8rR7OR4AyT+rI+LA9ILv+VfM
	7pVobkLQssFtSOXRBFpCvL485F/zSb/GPeMqCqogaPIUUiSeNLkkv7xsspNdr/R+Mlq/T7
	w3Ll38upiHIYcdzI+hoYMnBwF+7XQN0=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: u.kleine-koenig@baylibre.com,
	mcgrof@kernel.org,
	petr.pavlu@suse.com,
	samitolvanen@google.com,
	da.gomez@samsung.com,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@leemhuis.info,
	vv@tuxedocomputers.com,
	cs@tuxedo.de
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH v2 1/2] module: Put known GPL offenders in an array
Date: Fri, 15 Nov 2024 13:49:39 +0100
Message-ID: <20241115125121.1242871-2-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241115125121.1242871-1-wse@tuxedocomputers.com>
References: <20241115125121.1242871-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König <ukleinek@kernel.org>

Instead of repeating the add_taint_module() call for each offender, create
an array and loop over that one. This simplifies adding new entries
considerably.

Signed-off-by: Uwe Kleine-König <ukleinek@kernel.org>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 kernel/module/main.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 49b9bca9de12f..905d7b60dd709 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2023,11 +2023,20 @@ static int rewrite_section_headers(struct load_info *info, int flags)
 	return 0;
 }
 
+static const char *module_license_offenders[] = {
+	/* driverloader was caught wrongly pretending to be under GPL */
+	"driverloader",
+
+	/* lve claims to be GPL but upstream won't provide source */
+	"lve",
+};
+
 /*
  * These calls taint the kernel depending certain module circumstances */
 static void module_augment_kernel_taints(struct module *mod, struct load_info *info)
 {
 	int prev_taint = test_taint(TAINT_PROPRIETARY_MODULE);
+	size_t i;
 
 	if (!get_modinfo(info, "intree")) {
 		if (!test_taint(TAINT_OOT_MODULE))
@@ -2076,15 +2085,11 @@ static void module_augment_kernel_taints(struct module *mod, struct load_info *i
 	if (strcmp(mod->name, "ndiswrapper") == 0)
 		add_taint(TAINT_PROPRIETARY_MODULE, LOCKDEP_NOW_UNRELIABLE);
 
-	/* driverloader was caught wrongly pretending to be under GPL */
-	if (strcmp(mod->name, "driverloader") == 0)
-		add_taint_module(mod, TAINT_PROPRIETARY_MODULE,
-				 LOCKDEP_NOW_UNRELIABLE);
-
-	/* lve claims to be GPL but upstream won't provide source */
-	if (strcmp(mod->name, "lve") == 0)
-		add_taint_module(mod, TAINT_PROPRIETARY_MODULE,
-				 LOCKDEP_NOW_UNRELIABLE);
+	for (i = 0; i < ARRAY_SIZE(module_license_offenders); ++i) {
+		if (strcmp(mod->name, module_license_offenders[i]) == 0)
+			add_taint_module(mod, TAINT_PROPRIETARY_MODULE,
+					 LOCKDEP_NOW_UNRELIABLE);
+	}
 
 	if (!prev_taint && test_taint(TAINT_PROPRIETARY_MODULE))
 		pr_warn("%s: module license taints kernel.\n", mod->name);
-- 
2.43.0


