Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8095708BB
	for <lists+linux-modules@lfdr.de>; Mon, 11 Jul 2022 19:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbiGKRR1 (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Mon, 11 Jul 2022 13:17:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230184AbiGKRR0 (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Mon, 11 Jul 2022 13:17:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 188D552462
        for <linux-modules@vger.kernel.org>; Mon, 11 Jul 2022 10:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657559844;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=RuxdtHaN7JPAU0rTxAVK2/b2DTkZRhnANKFtly46+HM=;
        b=ES1rwQS745mgvJ2gT4zoE01Yo5oPGrF/QLK2NF2TroBFL6EX78Li8Q8R0Uf5kdwnhmMC96
        IkS9pypn4PstU3oWtQRQ0MtRLVFmyLd+ekRLXSYrFjpxw2iw7QS7ggO8Cowusorq1V6k1G
        dDbfLiTNqP9m1T06O2zz46tzF8wz4Do=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-UL47qqOQMzilXkJVANjT1Q-1; Mon, 11 Jul 2022 13:17:23 -0400
X-MC-Unique: UL47qqOQMzilXkJVANjT1Q-1
Received: by mail-wr1-f70.google.com with SMTP id m7-20020adfa3c7000000b0021d7ae39d1dso819097wrb.12
        for <linux-modules@vger.kernel.org>; Mon, 11 Jul 2022 10:17:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RuxdtHaN7JPAU0rTxAVK2/b2DTkZRhnANKFtly46+HM=;
        b=R0dtg3ClayvXJ7eeNgD2yuhUasMq+06t2OkFwZH7mp425VMeNYbIBHPKMGlPxJMYpv
         OI4avBVBxNw8dmJbuHtuBcKWKWe931s1lGnv4BuuRuFC2CdJKp0UboMu1NFhgCRE2+UD
         SVzPvDEwfl6ON1tCnSZGR2H2HUOXm9o6E+rh0Kusg4hpqGIgfBz6ksPSwDYciszGuV56
         5Xq2c3XnVIaDroDW1ur+tKE8jSdD7hTCi1QdGyN/JpKgxndasWRhLs078mjvsdCi3p1I
         yAReWs/eyg4j/hm/Ru0OI9ZYQhd+CCrUZV7Yf+sZn2XMkqcT3WTk+rQoUbHu9OPTy4Gq
         yuDw==
X-Gm-Message-State: AJIora9kGhoaly7QRI++guaFsyIbm9/mjCQDmwAc48jr40PDrdCVClZd
        n/CkeD2aR1oXeP6KvKG83VlS+4DmPHGjmWdIwAPsMvq1o/0vrG0aaRQpztZOp/8+EmbKFHZgch3
        dKZINjqT9ZvBPOZWd5cLKVS2K
X-Received: by 2002:adf:d20e:0:b0:21d:7654:729b with SMTP id j14-20020adfd20e000000b0021d7654729bmr18251778wrh.239.1657559842001;
        Mon, 11 Jul 2022 10:17:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uUe7S1LU2j0Uqm6Qjn+vFgILtwINuWWoctbT5fitvIC7wyhJOe/CcmyIgtzLf/c1d1Rkweig==
X-Received: by 2002:adf:d20e:0:b0:21d:7654:729b with SMTP id j14-20020adfd20e000000b0021d7654729bmr18251756wrh.239.1657559841836;
        Mon, 11 Jul 2022 10:17:21 -0700 (PDT)
Received: from localhost (cpc111743-lutn13-2-0-cust979.9-3.cable.virginm.net. [82.17.115.212])
        by smtp.gmail.com with ESMTPSA id j6-20020a05600c2b8600b003a2e1883a27sm8380029wmc.18.2022.07.11.10.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 10:17:20 -0700 (PDT)
From:   Aaron Tomlin <atomlin@redhat.com>
To:     mcgrof@kernel.org, rostedt@goodmis.org
Cc:     cl@linux.com, pmladek@suse.com, mbenes@suse.cz,
        christophe.leroy@csgroup.eu, akpm@linux-foundation.org,
        linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
        atomlin@atomlin.com, ghalat@redhat.com, oleksandr@natalenko.name,
        neelx@redhat.com, daniel.thompson@linaro.org, hch@infradead.org,
        tglx@linutronix.de, adrian.hunter@intel.com,
        linux-rt-users@vger.kernel.org
Subject: [PATCH v3 -next 0/1] module: kallsyms: Ensure preemption in add_kallsyms() with PREEMPT_RT
Date:   Mon, 11 Jul 2022 18:17:18 +0100
Message-Id: <20220711171719.1244255-1-atomlin@redhat.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

Hi Luis,

Please note this was rebased on mcgrof/modules-linus, to date i.e. that
includes Adrian's commit 35adf9a4e55e ("modules: Fix corruption of
/proc/kallsyms").

Aaron Tomlin (1):
  module: kallsyms: Ensure preemption in add_kallsyms() with PREEMPT_RT

 kernel/module/kallsyms.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)


base-commit: 35adf9a4e55e0b0a9d5e313e65ad83681dc32e9a
prerequisite-patch-id: 523b361c5a0b563bf8066422e897960cb2a79412
prerequisite-patch-id: 480a05b3fd339ffdeae8790dc541a587bec71df1
prerequisite-patch-id: 25ef6425ba3c164e5afd5b9862042da3687e01ce

-- 
2.34.3

