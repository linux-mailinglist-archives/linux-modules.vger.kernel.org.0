Return-Path: <linux-modules+bounces-38-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BCE7B536A
	for <lists+linux-modules@lfdr.de>; Mon,  2 Oct 2023 14:49:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id CE56D2841BD
	for <lists+linux-modules@lfdr.de>; Mon,  2 Oct 2023 12:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2DB15499;
	Mon,  2 Oct 2023 12:49:11 +0000 (UTC)
X-Original-To: linux-modules@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE0610A26
	for <linux-modules@vger.kernel.org>; Mon,  2 Oct 2023 12:49:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77CF0AD;
	Mon,  2 Oct 2023 05:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696250946; x=1727786946;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JdWihm9gO/6oM/PwFuet3kJDZhfqZNY17EGbfixewkM=;
  b=hiPP8XvIAU5pjdLmrwr2eDODoDFec6e9UClNE3ETPJVGTM9PrBq/b205
   hcOz5solsk7b4/HabIhCf+Q9EdYY68JqCxstm755ZOfSKQBBcgFBXAYiH
   qPZAviuzMMfxLVyqCjvzEwijMo2vdRFAC9lkHeSPQXmWIT+zrhdV4qx4B
   4xCfSkAMZnwgVggZa5jg5f24by2pX/JORuWSKPpEqTWCJJrJsbGo+Wq8z
   5xsjotj487kZZahBmv6ZvDdjwOH6dwCYadJazNTohnZmGJMCH4M+J+MI0
   I7DxjLXLACgvlZrtNcOgMiUhZxiXzm+HcOC8+YyusebKUc+EctMVxiBgM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="381517986"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="381517986"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 05:49:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="894127810"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="894127810"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 02 Oct 2023 05:47:42 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 23104157E; Mon,  2 Oct 2023 15:49:02 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 4/5] params: Sort headers
Date: Mon,  2 Oct 2023 15:48:55 +0300
Message-Id: <20231002124856.2455696-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20231002124856.2455696-1-andriy.shevchenko@linux.intel.com>
References: <20231002124856.2455696-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Sort the headers in alphabetic order in order to ease
the maintenance for this part.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 kernel/params.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/kernel/params.c b/kernel/params.c
index c3a029fe183d..eb55b32399b4 100644
--- a/kernel/params.c
+++ b/kernel/params.c
@@ -3,18 +3,18 @@
    Copyright (C) 2001 Rusty Russell.
 
 */
+#include <linux/ctype.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/kstrtox.h>
-#include <linux/string.h>
-#include <linux/errno.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/device.h>
-#include <linux/err.h>
 #include <linux/overflow.h>
-#include <linux/slab.h>
-#include <linux/ctype.h>
 #include <linux/security.h>
+#include <linux/slab.h>
+#include <linux/string.h>
 
 #ifdef CONFIG_SYSFS
 /* Protects all built-in parameters, modules use their own param_lock */
-- 
2.40.0.1.gaa8946217a0b


