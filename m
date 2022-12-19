Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5466E6512B1
	for <lists+linux-modules@lfdr.de>; Mon, 19 Dec 2022 20:19:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232455AbiLSTTL (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Mon, 19 Dec 2022 14:19:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232490AbiLSTTC (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Mon, 19 Dec 2022 14:19:02 -0500
Received: from mail-il1-x149.google.com (mail-il1-x149.google.com [IPv6:2607:f8b0:4864:20::149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7C0012ABB
        for <linux-modules@vger.kernel.org>; Mon, 19 Dec 2022 11:19:01 -0800 (PST)
Received: by mail-il1-x149.google.com with SMTP id i21-20020a056e021d1500b003041b04e3ebso7059723ila.7
        for <linux-modules@vger.kernel.org>; Mon, 19 Dec 2022 11:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SrckFgIzMRVl6+GO1T3v4CruUzPwCuVcCKFsHg7YtbI=;
        b=UUg8L5dKlwXq1e+434Szr7yJM4I3XvLE2Kj3IAUcBAJhzycVgHnpnDWZJixg41Bzu0
         Bglv5AuYNxO4yUAs5anz/yyS/SJZIxhFBGSp1o1H+JBbVbP4ZQPdtshdi2G7b6zQ2TRm
         a1ckZr585Q1ZQDCPi/esiX5NCl5hcCwsaHGRTgZLQPCmDpFuA8dGAPqVCPGDdTrSCyjc
         L9498BQ4QGUn0ANdxFu/Q6/wpthwE6O/mvrppdfsZIGK22MLbQE9BxASuBhA7zsI0xP3
         3oTjQw/sT5gVvSgvGlauwxYSrZBsMdrkBbJuPXF6dAxhgtkTuK7ZS3butDgZzyABglCb
         n70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SrckFgIzMRVl6+GO1T3v4CruUzPwCuVcCKFsHg7YtbI=;
        b=U7eY1kXuM/JqBN45TrhkTrtyZHydE4Vj5I+WhvF+UE68IFpLyfJ/DrAnflrfyJaTIs
         74BPUG9oTimHq7b3Kr9LzjkxWp+kskLrmVWaU+OafaHbXERfxTNkyMDp1bgOa8gbKR4d
         2gpwyoFtvt42Q3ESvEEI5TbRIBTkYjlf8PPld9IudNWbmCZd0Fg1OwC8wOK0dh4EQUZM
         l8e6sGmk1juNhuQL/kQSve7cTc9gpL4N4W2fMJU5ZbRmP0MKR034pc19EVXvofQSMwRc
         xbSKn+lCj5a+uIlgw7Qfh9yDnDzGDjlqdi19vgGtfveNihheSssikUoMpXbHhvAaFone
         gv+g==
X-Gm-Message-State: ANoB5pkpIN0+10gLdwL11+z3MJYP0L4Sz/dYtGaAorXXL4aAFETeJqRz
        f2HGlPfhhn5c8JXUi0Yu9u/56Gmunl+cQ8BgHj9rqPKV9QGRo/OfgLQrLLeQzz5pq7SDXSmndZL
        slPz8MDoNqV2zL5qTeaqAlu4uAiw/g5A/UkZ7Qguxr1J8COwql1fLYGYIX2IFyIGDjFsS6PlI7p
        bsuU8=
X-Google-Smtp-Source: AA0mqf6JCC52SozjS5ylrKtkpi02QdTsujBz6LZgGENwtkn6N6otc3tBkW107xbibsd3ona8Ic+arlAKgL/LDgo=
X-Received: from allenwebb.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:12e8])
 (user=allenwebb job=sendgmr) by 2002:a92:d750:0:b0:302:4bf3:237d with SMTP id
 e16-20020a92d750000000b003024bf3237dmr35832752ilq.312.1671477541236; Mon, 19
 Dec 2022 11:19:01 -0800 (PST)
Date:   Mon, 19 Dec 2022 13:18:48 -0600
In-Reply-To: <20221219191855.2010466-1-allenwebb@google.com>
Mime-Version: 1.0
References: <20221216221703.294683-1-allenwebb@google.com> <20221219191855.2010466-1-allenwebb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221219191855.2010466-3-allenwebb@google.com>
Subject: [PATCH v8 2/9] rockchip-mailbox: Fix typo
From:   Allen Webb <allenwebb@google.com>
To:     "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Allen Webb <allenwebb@google.com>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

A one character difference in the name supplied to MODULE_DEVICE_TABLE
breaks a future patch set, so fix the typo.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Allen Webb <allenwebb@google.com>
---
 drivers/mailbox/rockchip-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/rockchip-mailbox.c b/drivers/mailbox/rockchip-mailbox.c
index 979acc810f307..ca50f7f176f6a 100644
--- a/drivers/mailbox/rockchip-mailbox.c
+++ b/drivers/mailbox/rockchip-mailbox.c
@@ -159,7 +159,7 @@ static const struct of_device_id rockchip_mbox_of_match[] = {
 	{ .compatible = "rockchip,rk3368-mailbox", .data = &rk3368_drv_data},
 	{ },
 };
-MODULE_DEVICE_TABLE(of, rockchp_mbox_of_match);
+MODULE_DEVICE_TABLE(of, rockchip_mbox_of_match);
 
 static int rockchip_mbox_probe(struct platform_device *pdev)
 {
-- 
2.37.3

