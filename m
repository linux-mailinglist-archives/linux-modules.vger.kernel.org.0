Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 850422A2C3D
	for <lists+linux-modules@lfdr.de>; Mon,  2 Nov 2020 15:03:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725768AbgKBODd (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Mon, 2 Nov 2020 09:03:33 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:6734 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbgKBODd (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Mon, 2 Nov 2020 09:03:33 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CPvlN0rnDzkdm2
        for <linux-modules@vger.kernel.org>; Mon,  2 Nov 2020 22:03:28 +0800 (CST)
Received: from [10.174.178.149] (10.174.178.149) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Mon, 2 Nov 2020 22:03:22 +0800
From:   Shuo Wang <wangshuo47@huawei.com>
To:     <linux-modules@vger.kernel.org>, <lucas.de.marchi@gmail.com>
CC:     Hushiyuan <hushiyuan@huawei.com>
Subject: [PATCH] NEWS: fix typo
Message-ID: <8e027904-f5b9-25cc-98f5-568358a9cdd0@huawei.com>
Date:   Mon, 2 Nov 2020 22:03:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.0.1
MIME-Version: 1.0
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.149]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

NEWS: fix typo
---
  NEWS | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/NEWS b/NEWS
index 1c80582..39fe945 100644
--- a/NEWS
+++ b/NEWS
@@ -415,7 +415,7 @@ kmod 11
  - New features:
  	- libkmod now keeps a file opened after the first call to
  	  kmod_module_get_{info,versions,symbols,dependency_symbols}. This
-	  reduces signficantly the amount of time depmod tool takes to
+	  reduces significantly the amount of time depmod tool takes to
  	  execute. Particularly if compressed modules are used.
  	- Remove --with-rootprefix from build system. It was not a great idea
  	  after all and should not be use since it causes more harm then
-- 
2.23.0
