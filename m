Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02FE2282A7D
	for <lists+linux-modules@lfdr.de>; Sun,  4 Oct 2020 13:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbgJDLuI (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Sun, 4 Oct 2020 07:50:08 -0400
Received: from mx1.riseup.net ([198.252.153.129]:45460 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725840AbgJDLuI (ORCPT <rfc822;linux-modules@vger.kernel.org>);
        Sun, 4 Oct 2020 07:50:08 -0400
Received: from capuchin.riseup.net (capuchin-pn.riseup.net [10.0.1.176])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "*.riseup.net", Issuer "Sectigo RSA Domain Validation Secure Server CA" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4C421P0tgdzFgrc
        for <linux-modules@vger.kernel.org>; Sun,  4 Oct 2020 04:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1601811817; bh=IBQ+qrBa7eQapm943fIksR7KLzVUoZ6hY41YwNDsAHk=;
        h=Date:From:To:Subject:From;
        b=XBPWmUn2pAjhCnxkZwbjsAXiudP/keisSeOHZO60wy4amCRDVAt4iWjkMN6BqllOv
         vbxs/o8V84m/0Ub5pp7VGtYtwURmmct/Scd5SLwG2mPM63ExrKl2tJ+ql0K4n0wluO
         +tSQ2c1Cyp6eU+iZxx5JCWQSC/nTZpl+4SXug/uo=
X-Riseup-User-ID: 55C0BE1AA357476BEC9258C5DEC4C84A2129C7592CA44C9010C8F39AB6C23174
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by capuchin.riseup.net (Postfix) with ESMTPSA id 4C421N20K8z8tp9
        for <linux-modules@vger.kernel.org>; Sun,  4 Oct 2020 04:43:35 -0700 (PDT)
Date:   Sun, 4 Oct 2020 11:43:33 +0000
From:   Samanta Navarro <ferivoz@riseup.net>
To:     linux-modules@vger.kernel.org
Subject: [PATCH] man: fix typo
Message-ID: <20201004114333.ekwqf5hvncv5vnid@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

---
 man/modules.dep.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/modules.dep.xml b/man/modules.dep.xml
index e53293a..ed63369 100644
--- a/man/modules.dep.xml
+++ b/man/modules.dep.xml
@@ -48,7 +48,7 @@
       libkmod.
     </para>
     <para>
-      Its text counterpar is located in the same directory with the name
+      Its text counterpart is located in the same directory with the name
       <filename>modules.dep</filename>. The text version is maintained only
       for easy of reading by humans and is in no way used by any kmod tool.
     </para>
-- 
2.28.0

