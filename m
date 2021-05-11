Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 436CB37ADC4
	for <lists+linux-modules@lfdr.de>; Tue, 11 May 2021 20:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231777AbhEKSHm (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Tue, 11 May 2021 14:07:42 -0400
Received: from mga03.intel.com ([134.134.136.65]:17395 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231459AbhEKSHl (ORCPT <rfc822;linux-modules@vger.kernel.org>);
        Tue, 11 May 2021 14:07:41 -0400
IronPort-SDR: jwgmqumyiuMXRtx/Z5WSYXD2BsCLyIytFRDEz58Tlpd4Pv9WVNCEYUDSiK0sxlAWYUAigAJMQ7
 GGx46FiFL0Kw==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="199562592"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; 
   d="scan'208";a="199562592"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2021 11:06:33 -0700
IronPort-SDR: QuxbvEaPVrbDx6YjduPDeRnZd9DEugpG4bN03gSvlF7FyASwoIR8aiJUDl/2byVIFbu9ZvgCBF
 vn3L5smSJ5AA==
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; 
   d="scan'208";a="609588617"
Received: from yueqiaor-mobl.amr.corp.intel.com (HELO ldmartin-desk2.intel.com) ([10.254.1.104])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2021 11:06:33 -0700
From:   Lucas De Marchi <lucas.demarchi@intel.com>
To:     linux-modules@vger.kernel.org
Cc:     Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: [PATCH 0/3] Fix modules.builtin.alias.bin creation
Date:   Tue, 11 May 2021 11:06:12 -0700
Message-Id: <20210511180615.400191-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

When modules.builtin.modinfo is not present we shouldn't really write
an empty index. And when it is present, we shouln't truncate the file.

By differentiating empty index from 0-sized index, libkmod will later
know if it should fallback to the old modules.builtin index or if it
will give up searching for the module.

Lucas De Marchi (3):
  Fix return value doc for kmod_module_get_info()
  depmod: fix modules.builtin.alias.bin output
  testsuite: update gitignore

 libkmod/libkmod-module.c               | 2 +-
 testsuite/module-playground/.gitignore | 2 +-
 tools/depmod.c                         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.31.1

