Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F06DE4B0335
	for <lists+linux-modules@lfdr.de>; Thu, 10 Feb 2022 03:18:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231316AbiBJCRt (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Wed, 9 Feb 2022 21:17:49 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230372AbiBJCRs (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Wed, 9 Feb 2022 21:17:48 -0500
Received: from condef-10.nifty.com (condef-10.nifty.com [202.248.20.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 258F222B14
        for <linux-modules@vger.kernel.org>; Wed,  9 Feb 2022 18:17:49 -0800 (PST)
Received: from conuserg-12.nifty.com ([10.126.8.75])by condef-10.nifty.com with ESMTP id 21A2Ex5s020843
        for <linux-modules@vger.kernel.org>; Thu, 10 Feb 2022 11:14:59 +0900
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 21A2ERFX000422;
        Thu, 10 Feb 2022 11:14:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 21A2ERFX000422
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1644459268;
        bh=piOL58+rcWqAFtD7Ov4m4Iy5XUSFEbl9fS0pyq8+xvg=;
        h=From:To:Cc:Subject:Date:From;
        b=IYyqGdfMklNoigh29IPDO82qWHnoTzdw64ecvcqRW/SZxsMWYCWCePkuP4OGW9ASw
         txQWNmI7bnstgaDixe37CzQxwODb4zBkenGcckLq4XJi8w4SWadlC1TE7/IRXJRs7Q
         vvLziDcovZaV2Fb5uMm6JrsfmK0XYmmQ0+mg50aF/djZyEC7slRTaMp8ohgDD6V1pG
         qa+L+45x1Ff5LY4CQo0exFQHhZB3dGSVdPPkuFyrVv/nQcO2cQPxJlHAHQnmMhiIr5
         LDCHr+7DWDfJL+BEsSyG5RusBcZ010lEDj7EDJ4/1U32ezBb/EdKePuDeAYaTrbAvH
         bRLlev6Co2KCg==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-modules@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/2] modprobe: fix the NULL-termination of new_argv
Date:   Thu, 10 Feb 2022 11:14:22 +0900
Message-Id: <20220210021423.3388827-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

The number of new arguments is (i + argc - 1) as it is set to *p_argc
one line below.

The correct location of NULL termination is new_argv[i + argc - 1].

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 tools/modprobe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/modprobe.c b/tools/modprobe.c
index 9387537..b6b2947 100644
--- a/tools/modprobe.c
+++ b/tools/modprobe.c
@@ -743,7 +743,7 @@ static char **prepend_options_from_env(int *p_argc, char **orig_argv)
 	}
 
 	memcpy(new_argv + i, orig_argv + 1, sizeof(char *) * (argc - 1));
-	new_argv[i + argc] = NULL;
+	new_argv[i + argc - 1] = NULL;
 	*p_argc = i + argc - 1;
 
 	return new_argv;
-- 
2.32.0

