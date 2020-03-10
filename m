Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93F7417F1E0
	for <lists+linux-modules@lfdr.de>; Tue, 10 Mar 2020 09:25:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbgCJIZQ (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Tue, 10 Mar 2020 04:25:16 -0400
Received: from mga07.intel.com ([134.134.136.100]:27664 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725919AbgCJIZQ (ORCPT <rfc822;linux-modules@vger.kernel.org>);
        Tue, 10 Mar 2020 04:25:16 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Mar 2020 01:25:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,535,1574150400"; 
   d="scan'208";a="231245735"
Received: from ldmartin1-desk.jf.intel.com ([10.165.21.151])
  by orsmga007.jf.intel.com with ESMTP; 10 Mar 2020 01:25:15 -0700
From:   Lucas De Marchi <lucas.demarchi@intel.com>
To:     linux-modules@vger.kernel.org
Cc:     joao.moreira@intel.com, leandro.maciel.dorileo@intel.com,
        Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/2] libkmod: ignore kcmdline option if we fail to parse modname
Date:   Tue, 10 Mar 2020 01:23:07 -0700
Message-Id: <20200310082308.14318-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: owner-linux-modules@vger.kernel.org
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

The error message is saying we are ignoring the option on the kernel
command line, so just do it.
---
 libkmod/libkmod-config.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/libkmod/libkmod-config.c b/libkmod/libkmod-config.c
index 7b62367..971f20b 100644
--- a/libkmod/libkmod-config.c
+++ b/libkmod/libkmod-config.c
@@ -488,8 +488,9 @@ static void kcmdline_parse_result(struct kmod_config *config, char *modname,
 		if (underscores(modname) < 0) {
 			ERR(config->ctx, "Ignoring bad option on kernel command line while parsing module name: '%s'\n",
 			    modname);
+		} else {
+			kmod_config_add_options(config, modname, param);
 		}
-		kmod_config_add_options(config, modname, param);
 	}
 }
 
-- 
2.25.1

