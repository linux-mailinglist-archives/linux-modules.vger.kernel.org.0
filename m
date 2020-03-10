Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27F9517EFC8
	for <lists+linux-modules@lfdr.de>; Tue, 10 Mar 2020 06:01:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbgCJFBl (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Tue, 10 Mar 2020 01:01:41 -0400
Received: from mga01.intel.com ([192.55.52.88]:53932 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725947AbgCJFBk (ORCPT <rfc822;linux-modules@vger.kernel.org>);
        Tue, 10 Mar 2020 01:01:40 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Mar 2020 22:01:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,535,1574150400"; 
   d="scan'208";a="353525584"
Received: from ldmartin1-desk.jf.intel.com ([10.165.21.151])
  by fmsmga001.fm.intel.com with ESMTP; 09 Mar 2020 22:01:40 -0700
From:   Lucas De Marchi <lucas.demarchi@intel.com>
To:     linux-modules@vger.kernel.org
Cc:     Yanko Kaneti <yaneti@declera.com>, gladkov.alexey@gmail.com,
        auke-jan.h.kok@intel.com,
        Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 5/6] libkmod: allow modules.alias.builtin to be optional
Date:   Mon,  9 Mar 2020 22:00:28 -0700
Message-Id: <20200310050029.27678-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200310050029.27678-1-lucas.demarchi@intel.com>
References: <20200310050029.27678-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: owner-linux-modules@vger.kernel.org
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

---
 libkmod/libkmod.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/libkmod/libkmod.c b/libkmod/libkmod.c
index ab5c1e8..43423d6 100644
--- a/libkmod/libkmod.c
+++ b/libkmod/libkmod.c
@@ -855,8 +855,8 @@ KMOD_EXPORT int kmod_validate_resources(struct kmod_ctx *ctx)
  */
 KMOD_EXPORT int kmod_load_resources(struct kmod_ctx *ctx)
 {
+	int ret = 0;
 	size_t i;
-	int ret;
 
 	if (ctx == NULL)
 		return -ENOENT;
@@ -874,8 +874,17 @@ KMOD_EXPORT int kmod_load_resources(struct kmod_ctx *ctx)
 							index_files[i].fn);
 		ret = index_mm_open(ctx, path, &ctx->indexes_stamp[i],
 				    &ctx->indexes[i]);
-		if (ret)
-			break;
+
+		/*
+		 * modules.builtin.alias are considered optional since it's
+		 * recently added and older installations may not have it;
+		 * we allow failing for any reason
+		 */
+		if (ret) {
+			if (i != KMOD_INDEX_MODULES_BUILTIN_ALIAS)
+				break;
+			ret = 0;
+		}
 	}
 
 	if (ret)
-- 
2.25.1

