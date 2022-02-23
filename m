Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A817F4C0F63
	for <lists+linux-modules@lfdr.de>; Wed, 23 Feb 2022 10:41:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238506AbiBWJmH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-modules@lfdr.de>);
        Wed, 23 Feb 2022 04:42:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239330AbiBWJmG (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Wed, 23 Feb 2022 04:42:06 -0500
Received: from mail.spitalcalafat.ro (unknown [82.77.66.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF1305F4DA
        for <linux-modules@vger.kernel.org>; Wed, 23 Feb 2022 01:41:37 -0800 (PST)
Received: from [82.77.66.20] ([82.77.66.20])
        by mail.spitalcalafat.ro
        for linux-modules@vger.kernel.org;
        Wed, 23 Feb 2022 11:43:37 +0200
To:     linux-modules@vger.kernel.org
From:   "Cristian Crinteanu" <yoda@mail.spitalcalafat.ro>
Subject: kmod-29
Message-ID: <20220223094337.29ef4d0f@mail.spitalcalafat.ro>
Date:   Wed, 23 Feb 2022 11:43:37 +0200
X-User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101 Firefox/97.0
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,PDS_RDNS_DYNAMIC_FP,
        RDNS_DYNAMIC,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

everything worked fine until i reached  

https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/commit/?id=82972710196442c503cc1068a05651c354a865fb
doing modprobe and/or modinfo on unexisting module throws kmod into segfault 
eg:
modinfo blahblah
Segmentation fault
any ideea?
thx!
