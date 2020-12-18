Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 336992DE722
	for <lists+linux-modules@lfdr.de>; Fri, 18 Dec 2020 17:03:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbgLRQC7 (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Fri, 18 Dec 2020 11:02:59 -0500
Received: from mga17.intel.com ([192.55.52.151]:59177 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726228AbgLRQC7 (ORCPT <rfc822;linux-modules@vger.kernel.org>);
        Fri, 18 Dec 2020 11:02:59 -0500
IronPort-SDR: VvB/BW8Wj0zJ3l1KtZgiYTOeud6VMzOLC57bLPPEaVdYMGhNzOe48z/6alnVGFAmvPy+igDSax
 M6islwnLnrXA==
X-IronPort-AV: E=McAfee;i="6000,8403,9839"; a="155257952"
X-IronPort-AV: E=Sophos;i="5.78,430,1599548400"; 
   d="scan'208";a="155257952"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2020 08:02:15 -0800
IronPort-SDR: lhyGISzeo398XhRkPw79BD12GzeIXmdn+z5zftN/QdNoKvpNbip8ALzqwpdgjNLUND7FP5b0uK
 UWpD8tlEfsaw==
X-IronPort-AV: E=Sophos;i="5.78,430,1599548400"; 
   d="scan'208";a="388582564"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2020 08:02:15 -0800
From:   Lucas De Marchi <lucas.demarchi@intel.com>
To:     linux-modules@vger.kernel.org
Cc:     Joe Buehler <aspam@cox.net>,
        Yauheni Kaliuta <yauheni.kaliuta@redhat.com>
Subject: [PATCH 1/3] depmod: unconditionally write builtin.alias.bin
Date:   Fri, 18 Dec 2020 08:02:07 -0800
Message-Id: <20201218160209.4037174-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218160209.4037174-1-lucas.demarchi@intel.com>
References: <20201218160209.4037174-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

The file is always created and unless we return an error, the temporary
file is renamed to its final destination. All other places write the
index without checking if the index is empty, so just do the same.

Reported-by: Joe Buehler <aspam@cox.net>
---
 tools/depmod.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tools/depmod.c b/tools/depmod.c
index 2c03dfe..3f31cdf 100644
--- a/tools/depmod.c
+++ b/tools/depmod.c
@@ -2419,7 +2419,7 @@ static int output_builtin_alias_bin(struct depmod *depmod, FILE *out)
 	if (ret < 0) {
 		if (ret == -ENOENT)
 			ret = 0;
-		goto fail;
+		goto out;
 	}
 
 	kmod_list_foreach(l, builtin) {
@@ -2429,7 +2429,7 @@ static int output_builtin_alias_bin(struct depmod *depmod, FILE *out)
 
 		ret = kmod_module_get_info(mod, &info_list);
 		if (ret < 0)
-			goto fail;
+			goto out;
 
 		kmod_list_foreach(ll, info_list) {
 			char alias[PATH_MAX];
@@ -2454,9 +2454,11 @@ static int output_builtin_alias_bin(struct depmod *depmod, FILE *out)
 		count++;
 	}
 
-	if (count)
+out:
+	/* do not bother writing the index if we are going to discard it */
+	if (!ret)
 		index_write(idx, out);
-fail:
+
 	if (builtin)
 		kmod_module_unref_list(builtin);
 
-- 
2.29.2

