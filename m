Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C70517B7D4
	for <lists+linux-modules@lfdr.de>; Fri,  6 Mar 2020 09:00:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbgCFIAB (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Fri, 6 Mar 2020 03:00:01 -0500
Received: from mga17.intel.com ([192.55.52.151]:16832 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725869AbgCFIAB (ORCPT <rfc822;linux-modules@vger.kernel.org>);
        Fri, 6 Mar 2020 03:00:01 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Mar 2020 00:00:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,521,1574150400"; 
   d="scan'208";a="287909499"
Received: from ldmartin1-desk.jf.intel.com ([10.165.21.151])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Mar 2020 00:00:00 -0800
From:   Lucas De Marchi <lucas.demarchi@intel.com>
To:     linux-modules@vger.kernel.org
Cc:     Yanko Kaneti <yaneti@declera.com>, gladkov.alexey@gmail.com,
        Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/2] depmod: just add .bin suffix to builtin.modinfo
Date:   Thu,  5 Mar 2020 23:59:34 -0800
Message-Id: <20200306075934.3104-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200306075934.3104-1-lucas.demarchi@intel.com>
References: <20200306075934.3104-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: owner-linux-modules@vger.kernel.org
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

For all the other indexes what we do is to add a .bin to the original
filename to denote it's the indexed version of that file. It was
kernel's decision to name it modules.builtin.modinfo, so respect that.

Fix: b866b2165ae6 ("Lookup aliases in the modules.builtin.modinfo")
---
 tools/depmod.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/depmod.c b/tools/depmod.c
index 875e314..fe1c54d 100644
--- a/tools/depmod.c
+++ b/tools/depmod.c
@@ -2402,7 +2402,7 @@ static int output_devname(struct depmod *depmod, FILE *out)
 	return 0;
 }
 
-static int output_builtin_alias_bin(struct depmod *depmod, FILE *out)
+static int output_builtin_modinfo_bin(struct depmod *depmod, FILE *out)
 {
 	int ret = 0, count = 0;
 	struct index_node *idx;
@@ -2482,7 +2482,7 @@ static int depmod_output(struct depmod *depmod, FILE *out)
 		{ "modules.symbols", output_symbols },
 		{ "modules.symbols.bin", output_symbols_bin },
 		{ "modules.builtin.bin", output_builtin_bin },
-		{ "modules.builtin.alias.bin", output_builtin_alias_bin },
+		{ "modules.builtin.modinfo.bin", output_builtin_modinfo_bin },
 		{ "modules.devname", output_devname },
 		{ }
 	};
-- 
2.25.1

