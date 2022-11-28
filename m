Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76CB463A46D
	for <lists+linux-modules@lfdr.de>; Mon, 28 Nov 2022 10:13:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbiK1JNM (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Mon, 28 Nov 2022 04:13:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbiK1JNH (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Mon, 28 Nov 2022 04:13:07 -0500
X-Greylist: delayed 444 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 28 Nov 2022 01:13:02 PST
Received: from adamg.eu (adamg.eu [178.217.190.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61F7C9FEB
        for <linux-modules@vger.kernel.org>; Mon, 28 Nov 2022 01:13:02 -0800 (PST)
Received: from adamg by adamg.eu with local (Exim 4.95)
        (envelope-from <adamg@adamg.eu>)
        id 1oza4y-0001nd-0k
        for linux-modules@vger.kernel.org;
        Mon, 28 Nov 2022 10:05:32 +0100
Date:   Mon, 28 Nov 2022 10:05:31 +0100
From:   Adam =?utf-8?B?R2/FgsSZYmlvd3NraQ==?= <adamg@pld-linux.org>
To:     linux-modules@vger.kernel.org
Subject: [PATCH] autogen.sh: remove --with-rootprefix, it is gone since
 kmod-11
Message-ID: <Y4R52zzp1gKls8+x@adamg.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Operating-System: Linux adamg 4.9.288-1 
X-Clacks-Overhead: GNU Terry Pratchett
Sender:  <adamg@adamg.eu>
X-Clacks-Overhead: "GNU Terry Pratchett"
X-Spam-Status: No, score=1.0 required=5.0 tests=BAYES_50,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

Signed-off-by: Adam Gołębiowski <adamg@pld-linux.org>
---
 autogen.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/autogen.sh b/autogen.sh
index e4997c4..2616247 100755
--- a/autogen.sh
+++ b/autogen.sh
@@ -25,7 +25,6 @@ fi
 
 if [ ! -L /bin ]; then
     args="$args \
-        --with-rootprefix= \
         --with-rootlibdir=$(libdir /lib) \
         "
 fi
-- 
2.37.2

