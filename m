Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFD1437ADC6
	for <lists+linux-modules@lfdr.de>; Tue, 11 May 2021 20:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231459AbhEKSHm (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Tue, 11 May 2021 14:07:42 -0400
Received: from mga03.intel.com ([134.134.136.65]:17395 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231551AbhEKSHl (ORCPT <rfc822;linux-modules@vger.kernel.org>);
        Tue, 11 May 2021 14:07:41 -0400
IronPort-SDR: EyKipZCCQOTgwwD5t/S8IyelJuy3GsNgLVN2+SH26ckLuTw++BfBCZUFQkoRM8SjZ3BsgDZwvL
 ofwD8+ZSC7ag==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="199562602"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; 
   d="scan'208";a="199562602"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2021 11:06:34 -0700
IronPort-SDR: Lem5w9umnWwxnyNL59FeTupFA2Zuay5LGnuDYAVtyMOr/DjQSsGWn1sbzJDatP6moQX7lDE846
 FLcTZwDR0yRw==
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; 
   d="scan'208";a="609588629"
Received: from yueqiaor-mobl.amr.corp.intel.com (HELO ldmartin-desk2.intel.com) ([10.254.1.104])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2021 11:06:33 -0700
From:   Lucas De Marchi <lucas.demarchi@intel.com>
To:     linux-modules@vger.kernel.org
Cc:     Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: [PATCH 3/3] testsuite: update gitignore
Date:   Tue, 11 May 2021 11:06:15 -0700
Message-Id: <20210511180615.400191-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511180615.400191-1-lucas.demarchi@intel.com>
References: <20210511180615.400191-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

---
 testsuite/module-playground/.gitignore | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testsuite/module-playground/.gitignore b/testsuite/module-playground/.gitignore
index fca12f3..6d9c7b1 100644
--- a/testsuite/module-playground/.gitignore
+++ b/testsuite/module-playground/.gitignore
@@ -1,4 +1,3 @@
-*o.cmd
 *.ko
 !mod-simple-*.ko
 !cache/*.ko
@@ -8,6 +7,7 @@
 *.mod
 *.a
 *.cmd
+*.o.d
 
 modules.order
 Module.symvers
-- 
2.31.1

