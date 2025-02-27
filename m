Return-Path: <linux-modules+bounces-3295-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E57C0A4882E
	for <lists+linux-modules@lfdr.de>; Thu, 27 Feb 2025 19:50:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A076C169BBA
	for <lists+linux-modules@lfdr.de>; Thu, 27 Feb 2025 18:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C284C26B2BF;
	Thu, 27 Feb 2025 18:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="GlCtr5W9"
X-Original-To: linux-modules@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F08C1F5820;
	Thu, 27 Feb 2025 18:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740682189; cv=none; b=sK4gep1IdBxra4jSreX4fwObgEF1/+mdqJ6Vzt7tbRa4BDNlFaFPNwK3xgujDMx1y8tguBpULszb3NvDeT8Zbn+xg3vbJ9MwI1tUiSHxNDnG6nYd9Ud12KuQDRdjW6qsER0e8w41zgLJSgOzQR4rTfTZ3LAMQWPZPtZPZ1CxUFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740682189; c=relaxed/simple;
	bh=jD8IrSFKJ+w8OwiRwskbeXe3GSuxpQOGZpZcLLSKcp8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gu8ylHbEIjTf1cSAGb81rRLl3zyfdGaAre0HXntlWGCjf0ptNC5uIIM2+/y3pSjtc1pY5FHakYaBOkH+j8uvViusZ2ZdE2Xdw3t4zs4oO+J9WKKfhn+UjoCsNNobL+939LhQuY+shEb99Ug65lP9aYxgEo5vv9WGs08bcq8CmWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=GlCtr5W9; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from thinkpad-p16sg1.corp.microsoft.com (unknown [20.236.10.206])
	by linux.microsoft.com (Postfix) with ESMTPSA id A4279210EAC1;
	Thu, 27 Feb 2025 10:49:47 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A4279210EAC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740682187;
	bh=nz70CBPIYU1n5UuvgHW65DgzacxtlZnlMe0KudNX5Uo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GlCtr5W9NTY1BR4vDbGgcZSQoYn3+qfCRMDJAv2LO2ZhAfsHt7ie9A6zC3XeNqbpj
	 RH81gHKezlv57RQ8kdkkuC6Fr3QUudb87hIs2NMvozkSoyMKSHTk8Ps8lg9r/hRN3l
	 KdtPQtSMEe96dxCDjN0YZtpV8dN4LsvjacmxujR8=
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org
Cc: petr.pavlu@suse.com,
	code@tyhicks.com,
	linux@rasmusvillemoes.dk,
	christophe.leroy@csgroup.eu,
	hch@infradead.org,
	mcgrof@kernel.org,
	frkaya@linux.microsoft.com,
	vijayb@linux.microsoft.com,
	linux@weissschuh.net,
	samitolvanen@google.com,
	da.gomez@samsung.com,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	stable@kernel.org
Subject: [PATCH v4 4/4] drivers: base: handle module_kobject creation
Date: Thu, 27 Feb 2025 10:49:30 -0800
Message-Id: <20250227184930.34163-5-shyamsaini@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227184930.34163-1-shyamsaini@linux.microsoft.com>
References: <20250227184930.34163-1-shyamsaini@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

module_add_driver() relies on module_kset list for
/sys/module/<built-in-module>/drivers directory creation.

Since,
commit 96a1a2412acba ("kernel/params.c: defer most of param_sysfs_init() to late_initcall time")
drivers which are initialized from subsys_initcall() or any other
higher precedence initcall couldn't find the related kobject entry
in the module_kset list because module_kset is not fully populated
by the time module_add_driver() refers it. As a consequence,
module_add_driver() returns early without calling make_driver_name().
Therefore, /sys/module/<built-in-module>/drivers is never created.

Fix this issue by letting module_add_driver() handle module_kobject
creation itself.

Fixes: 96a1a2412acb ("kernel/params.c: defer most of param_sysfs_init() to late_initcall time")
Cc: stable@kernel.org
Suggested-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Signed-off-by: Shyam Saini <shyamsaini@linux.microsoft.com>
---
 drivers/base/module.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/base/module.c b/drivers/base/module.c
index 5bc71bea883a..218aaa096455 100644
--- a/drivers/base/module.c
+++ b/drivers/base/module.c
@@ -42,16 +42,13 @@ int module_add_driver(struct module *mod, const struct device_driver *drv)
 	if (mod)
 		mk = &mod->mkobj;
 	else if (drv->mod_name) {
-		struct kobject *mkobj;
-
-		/* Lookup built-in module entry in /sys/modules */
-		mkobj = kset_find_obj(module_kset, drv->mod_name);
-		if (mkobj) {
-			mk = container_of(mkobj, struct module_kobject, kobj);
+		/* Lookup or create built-in module entry in /sys/modules */
+		mk = lookup_or_create_module_kobject(drv->mod_name);
+		if (mk) {
 			/* remember our module structure */
 			drv->p->mkobj = mk;
-			/* kset_find_obj took a reference */
-			kobject_put(mkobj);
+			/* lookup_or_create_module_kobject took a reference */
+			kobject_put(&mk->kobj);
 		}
 	}
 
-- 
2.34.1


