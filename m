Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E9D933451A
	for <lists+linux-modules@lfdr.de>; Wed, 10 Mar 2021 18:28:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230421AbhCJR1h (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Wed, 10 Mar 2021 12:27:37 -0500
Received: from mga18.intel.com ([134.134.136.126]:4247 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232830AbhCJR1I (ORCPT <rfc822;linux-modules@vger.kernel.org>);
        Wed, 10 Mar 2021 12:27:08 -0500
IronPort-SDR: 2GytNbB1+RJkgjOjGfJ0fRukXE9t2Hc9B/mqt0KWBxpyfrkaIxprpD43vfGOjrs/aTZV2pOvKE
 giZUOYucwo1A==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="176115596"
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; 
   d="scan'208";a="176115596"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2021 09:26:57 -0800
IronPort-SDR: ax74qRu91xNDFcS0hM6iDcj6/vycWYyic7JgI62VhzaJ//If3Qhhxl+RoWPg7r0eykDBN7VjH6
 rCwhOCWQU5ug==
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; 
   d="scan'208";a="437995216"
Received: from jerrycli-mobl.amr.corp.intel.com (HELO ldmartin-desk2.intel.com) ([10.209.26.189])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2021 09:26:57 -0800
From:   Lucas De Marchi <lucas.demarchi@intel.com>
To:     linux-modules@vger.kernel.org
Subject: [PATCH] libkmod-config: more chars allowed as space
Date:   Wed, 10 Mar 2021 09:26:52 -0800
Message-Id: <20210310172652.13638-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

Recently in a discussion I noticed that kernel allows more chars to be
considered as space in the kernel command line. Switch to the equivalent
of isspace() instead of considering only ' '.
---
 libkmod/libkmod-config.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/libkmod/libkmod-config.c b/libkmod/libkmod-config.c
index 2873f06..4fdd40f 100644
--- a/libkmod/libkmod-config.c
+++ b/libkmod/libkmod-config.c
@@ -543,11 +543,14 @@ static int kmod_config_parse_kcmdline(struct kmod_config *config)
 
 			break;
 		case '\0':
-		case '\n':
-			/* Stop iterating on new chars */
 			iter = false;
 			/* fall-through */
 		case ' ':
+		case '\n':
+		case '\t':
+		case '\v':
+		case '\f':
+		case '\r':
 			if (is_quoted && state == STATE_VALUE) {
 				/* no state change*/;
 			} else if (is_quoted) {
-- 
2.30.1

