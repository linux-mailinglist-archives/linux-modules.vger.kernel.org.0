Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AFE23F0D4D
	for <lists+linux-modules@lfdr.de>; Wed, 18 Aug 2021 23:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbhHRVZb (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Wed, 18 Aug 2021 17:25:31 -0400
Received: from mga03.intel.com ([134.134.136.65]:16751 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234014AbhHRVZa (ORCPT <rfc822;linux-modules@vger.kernel.org>);
        Wed, 18 Aug 2021 17:25:30 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="216463461"
X-IronPort-AV: E=Sophos;i="5.84,332,1620716400"; 
   d="scan'208";a="216463461"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2021 14:24:54 -0700
X-IronPort-AV: E=Sophos;i="5.84,332,1620716400"; 
   d="scan'208";a="531855765"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2021 14:24:54 -0700
From:   Lucas De Marchi <lucas.demarchi@intel.com>
To:     linux-modules <linux-modules@vger.kernel.org>
Cc:     Michal Suchanek <msuchanek@suse.de>, Takashi Iwai <tiwai@suse.de>,
        Petr Vorel <pvorel@suse.cz>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>
Subject: [PATCH] libkmod: Set builtin to no when module is created from path.
Date:   Wed, 18 Aug 2021 14:24:40 -0700
Message-Id: <20210818212440.2224127-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210818212440.2224127-1-lucas.demarchi@intel.com>
References: <20210818205159.6066-1-msuchanek@suse.de>
 <20210818212440.2224127-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

From: Michal Suchanek <msuchanek@suse.de>

A recent bug report showed that modinfo doesn't give the signature
information for certain modules, and it turned out to happen only on
the modules that are built-in on the running kernel; then modinfo
skips the signature check, as if the target module file never exists.
The behavior is, however, inconsistent when modinfo is performed for
external modules (no matter which kernel version is) and the module
file path is explicitly given by a command-line argument, which
guarantees the presence of the module file itself.

Fixes: e7e2cb61fa9f ("modinfo: Show information about built-in modules")
Link: https://lore.kernel.org/linux-modules/CAKi4VAJVvY3=JdSZm-GD1hJqyCPYaYz-jBJ_REeY5BakVb6_ww@mail.gmail.com/
BugLink: https://bugzilla.opensuse.org/show_bug.cgi?id=1189537
Suggested-by: Lucas De Marchi <lucas.de.marchi@gmail.com>
Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 libkmod/libkmod-module.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/libkmod/libkmod-module.c b/libkmod/libkmod-module.c
index 6e0ff1a..6f7747c 100644
--- a/libkmod/libkmod-module.c
+++ b/libkmod/libkmod-module.c
@@ -431,17 +431,18 @@ KMOD_EXPORT int kmod_module_new_from_path(struct kmod_ctx *ctx,
 			return -EEXIST;
 		}
 
-		*mod = kmod_module_ref(m);
-		return 0;
-	}
+		kmod_module_ref(m);
+	} else {
+		err = kmod_module_new(ctx, name, name, namelen, NULL, 0, &m);
+		if (err < 0) {
+			free(abspath);
+			return err;
+		}
 
-	err = kmod_module_new(ctx, name, name, namelen, NULL, 0, &m);
-	if (err < 0) {
-		free(abspath);
-		return err;
+		m->path = abspath;
 	}
 
-	m->path = abspath;
+	m->builtin = KMOD_MODULE_BUILTIN_NO;
 	*mod = m;
 
 	return 0;
-- 
2.31.1

