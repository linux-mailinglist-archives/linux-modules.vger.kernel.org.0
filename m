Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEE7C4E6BE9
	for <lists+linux-modules@lfdr.de>; Fri, 25 Mar 2022 02:22:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234024AbiCYBWo (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Thu, 24 Mar 2022 21:22:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbiCYBWn (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Thu, 24 Mar 2022 21:22:43 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 479C2BD897
        for <linux-modules@vger.kernel.org>; Thu, 24 Mar 2022 18:21:10 -0700 (PDT)
Received: from dggpeml500021.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KPkkq3pvPzCrRK
        for <linux-modules@vger.kernel.org>; Fri, 25 Mar 2022 09:18:59 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500021.china.huawei.com (7.185.36.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Mar 2022 09:21:08 +0800
Received: from huawei.com (10.174.179.133) by dggpeml100016.china.huawei.com
 (7.185.36.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Fri, 25 Mar
 2022 09:21:07 +0800
From:   Yang Yanchao <yangyanchao6@huawei.com>
To:     <linux-modules@vger.kernel.org>
CC:     <lucas.de.marchi@gmail.com>, <linfeilong@huawei.com>
Subject: depmod searches in dictionary order
Date:   Fri, 25 Mar 2022 09:21:07 +0800
Message-ID: <20220325012107.902-1-yangyanchao6@huawei.com>
X-Mailer: git-send-email 2.31.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.179.133]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml100016.china.huawei.com (7.185.36.216)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

Hello,

depmod uses readdir to traverse /lib/modules/`uname -r`/,
but readdir sorts files by d_off.

It means that if I create two links with the same name in the weak-updates
directory, for example:

weak-updates/opt/kernel1/extra/a.ko ->/ opt/kernel1/extra/a.ko
weak-updates/opt/kernel2/extra/a.ko ->/ opt/kernel2/extra/a.ko

Even with the same kernel, the same module may generate different
modules.dep on different machines, and it is impossible to predict which ko will be used

Maybe we can cache the directory name first and sort it?
If can develop in this direction, I will try to make a patch

Best Regards,
Yang Yanchao
