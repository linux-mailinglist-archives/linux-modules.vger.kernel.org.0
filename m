Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D99D217EFC7
	for <lists+linux-modules@lfdr.de>; Tue, 10 Mar 2020 06:01:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgCJFBl (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Tue, 10 Mar 2020 01:01:41 -0400
Received: from mga07.intel.com ([134.134.136.100]:16457 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726211AbgCJFBl (ORCPT <rfc822;linux-modules@vger.kernel.org>);
        Tue, 10 Mar 2020 01:01:41 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Mar 2020 22:01:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,535,1574150400"; 
   d="scan'208";a="353525570"
Received: from ldmartin1-desk.jf.intel.com ([10.165.21.151])
  by fmsmga001.fm.intel.com with ESMTP; 09 Mar 2020 22:01:39 -0700
From:   Lucas De Marchi <lucas.demarchi@intel.com>
To:     linux-modules@vger.kernel.org
Cc:     Yanko Kaneti <yaneti@declera.com>, gladkov.alexey@gmail.com,
        auke-jan.h.kok@intel.com,
        Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/6] gitignore: ignore .cache.mk when building modules
Date:   Mon,  9 Mar 2020 22:00:24 -0700
Message-Id: <20200310050029.27678-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200310050029.27678-1-lucas.demarchi@intel.com>
References: <20200310050029.27678-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: owner-linux-modules@vger.kernel.org
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

---
 testsuite/module-playground/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testsuite/module-playground/.gitignore b/testsuite/module-playground/.gitignore
index db63fe4..fca12f3 100644
--- a/testsuite/module-playground/.gitignore
+++ b/testsuite/module-playground/.gitignore
@@ -2,6 +2,7 @@
 *.ko
 !mod-simple-*.ko
 !cache/*.ko
+.cache.mk
 *.mod.c
 .tmp_versions
 *.mod
-- 
2.25.1

