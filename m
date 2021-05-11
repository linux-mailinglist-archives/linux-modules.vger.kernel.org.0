Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAFF637ADC3
	for <lists+linux-modules@lfdr.de>; Tue, 11 May 2021 20:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231561AbhEKSHl (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Tue, 11 May 2021 14:07:41 -0400
Received: from mga03.intel.com ([134.134.136.65]:17395 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231459AbhEKSHk (ORCPT <rfc822;linux-modules@vger.kernel.org>);
        Tue, 11 May 2021 14:07:40 -0400
IronPort-SDR: BR++npvhxQqQSb3yjWpHXljUVsvuHNuLaVbSLSDkmDNxHKd3Kbhgg/VLbgpzT9EsDfEpOqqutU
 zhk/Gj/xqjng==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="199562599"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; 
   d="scan'208";a="199562599"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2021 11:06:33 -0700
IronPort-SDR: FDUgRtoAlwMgYE3ihFgztGnidlYyctIuc6F+bWzuOWaucf7mNuAmjsoT7086qtfhGvqwEyB/sj
 HY0cyku4G/fw==
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; 
   d="scan'208";a="609588624"
Received: from yueqiaor-mobl.amr.corp.intel.com (HELO ldmartin-desk2.intel.com) ([10.254.1.104])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2021 11:06:33 -0700
From:   Lucas De Marchi <lucas.demarchi@intel.com>
To:     linux-modules@vger.kernel.org
Cc:     Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: [PATCH 2/3] depmod: fix modules.builtin.alias.bin output
Date:   Tue, 11 May 2021 11:06:14 -0700
Message-Id: <20210511180615.400191-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511180615.400191-1-lucas.demarchi@intel.com>
References: <20210511180615.400191-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

Due to wrong documentation on kmod_module_get_info() we ended up
checking for 0 as return. Check for > 0 to decided if we want to write
the index to the file, otherwise we would output a 0-sized index on
success.
---
 tools/depmod.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/depmod.c b/tools/depmod.c
index 170a1d8..eb810b8 100644
--- a/tools/depmod.c
+++ b/tools/depmod.c
@@ -2457,7 +2457,7 @@ static int output_builtin_alias_bin(struct depmod *depmod, FILE *out)
 
 out:
 	/* do not bother writing the index if we are going to discard it */
-	if (!ret)
+	if (ret > 0)
 		index_write(idx, out);
 
 	if (builtin)
-- 
2.31.1

