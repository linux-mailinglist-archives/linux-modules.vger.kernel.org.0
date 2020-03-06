Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF73717B7D3
	for <lists+linux-modules@lfdr.de>; Fri,  6 Mar 2020 09:00:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725873AbgCFIAB (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Fri, 6 Mar 2020 03:00:01 -0500
Received: from mga17.intel.com ([192.55.52.151]:16832 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725853AbgCFIAA (ORCPT <rfc822;linux-modules@vger.kernel.org>);
        Fri, 6 Mar 2020 03:00:00 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Mar 2020 00:00:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,521,1574150400"; 
   d="scan'208";a="287909496"
Received: from ldmartin1-desk.jf.intel.com ([10.165.21.151])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Mar 2020 23:59:59 -0800
From:   Lucas De Marchi <lucas.demarchi@intel.com>
To:     linux-modules@vger.kernel.org
Cc:     Yanko Kaneti <yaneti@declera.com>, gladkov.alexey@gmail.com,
        Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/2] depmod: do not output .bin to stdout
Date:   Thu,  5 Mar 2020 23:59:33 -0800
Message-Id: <20200306075934.3104-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: owner-linux-modules@vger.kernel.org
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

index_write() relies on fseek/ftell to manage the position to which we
are write and thus needs the file stream to support it.

Right now when trying to write the index to stdout we fail with:

	depmod: tools/depmod.c:416: index_write: Assertion `initial_offset >= 0' failed.
	Aborted (core dumped)

We have no interest in outputting our index to stdout, so just skip it
like is done with other indexes.

While at it, add/remove some newlines to improve readability.

Reported-by: Yanko Kaneti <yaneti@declera.com>
Fix: b866b2165ae6 ("Lookup aliases in the modules.builtin.modinfo")
---
 tools/depmod.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/depmod.c b/tools/depmod.c
index fbbce10..875e314 100644
--- a/tools/depmod.c
+++ b/tools/depmod.c
@@ -2408,8 +2408,10 @@ static int output_builtin_alias_bin(struct depmod *depmod, FILE *out)
 	struct index_node *idx;
 	struct kmod_list *l, *builtin = NULL;
 
-	idx = index_create();
+	if (out == stdout)
+		return 0;
 
+	idx = index_create();
 	if (idx == NULL) {
 		ret = -ENOMEM;
 		goto fail;
@@ -2456,7 +2458,9 @@ static int output_builtin_alias_bin(struct depmod *depmod, FILE *out)
 
 	if (count)
 		index_write(idx, out);
+
 	index_destroy(idx);
+
 fail:
 	if (builtin)
 		kmod_module_unref_list(builtin);
-- 
2.25.1

