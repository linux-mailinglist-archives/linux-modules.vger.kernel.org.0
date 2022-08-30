Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44C855A7009
	for <lists+linux-modules@lfdr.de>; Tue, 30 Aug 2022 23:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232009AbiH3Vx2 (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Tue, 30 Aug 2022 17:53:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232137AbiH3VwY (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Tue, 30 Aug 2022 17:52:24 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBC5891D3B
        for <linux-modules@vger.kernel.org>; Tue, 30 Aug 2022 14:50:24 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id v5-20020a2583c5000000b006964324be8cso715271ybm.14
        for <linux-modules@vger.kernel.org>; Tue, 30 Aug 2022 14:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=tbrDSnAu2qp291q6FJVI5HAkVfDwcm9jT2uRBxykBxo=;
        b=kiiww/u+gNRUQ3btvqFql15o+OQdqGRa8iL5JT7J5S/FJUftRrKykzaiX80qCn3gMA
         N7fu/FadrPTfEuXGUmENdVvQNfb5Lc4hc7j+KvIJFmTYxMub96J2Dq6Qz7qLRmUGLg7U
         /uSKboJAjqTu07ETlC77WQsJyUV6n0Enhp4LQHtPzmOHIYGgLaodwOejnzgOW/A+KcGj
         gwCBB1i6MWj4k2p8na3VWnkGj14/Yz4lw5Y6xUMEQ+oozkWQlSuhUKUMfndEmuXu4exw
         3VsqAU7Bes2ONZTxN75FIe9AuWEsm6slCzF5WV8jRwyOqmL1j24ghFNHmneopZkYIiwV
         aIGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=tbrDSnAu2qp291q6FJVI5HAkVfDwcm9jT2uRBxykBxo=;
        b=6K+Ijf3m5rO2Q774MQtapjb0JXsOR76nmTuvme+H0pI2G8NEDcfpohYIpl6+5n+CME
         OGLwGsanXNekUPAlqPg23wO7cFyAbLJZaFdsOKOcg98lHrQtpZOgyCva/5MHXdban3yr
         +mFonHGJJnqy9p9rtLquibILAaj74mpM+fMGqvOghd4TQts4iAG+oji5UddKCljuedrI
         mVhCYuEfYcO4JyseYh3iP+RgAh0cCZY1oBtOHJDIsnTNqRr1NFOB1+wkrrhZM8TfRK6r
         q6FWGjjo57r6RVdrbSe25TcDnqlytGWzpLlkZbTWoVycepY4Qiqaea1tiGWCrT2Db9am
         xL9w==
X-Gm-Message-State: ACgBeo3Tm+cflp2JuQpkkHPS8UIakFCyoqfQrVqYZBALZkzeWig/Ucgs
        pUfXZuC2ukdYbFVHOpWgXA0yasO8R4o=
X-Google-Smtp-Source: AA6agR68X2SkqWShs2xXg87H6kYkH/5wxhQgvNByd1kyOXdUxqgguxdVIPa42ox8e5jz4qITJ7VUdF/uTQY=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:a005:55b3:6c26:b3e4])
 (user=surenb job=sendgmr) by 2002:a81:13d7:0:b0:324:7dcb:8d26 with SMTP id
 206-20020a8113d7000000b003247dcb8d26mr16712805ywt.452.1661896224365; Tue, 30
 Aug 2022 14:50:24 -0700 (PDT)
Date:   Tue, 30 Aug 2022 14:49:12 -0700
In-Reply-To: <20220830214919.53220-1-surenb@google.com>
Mime-Version: 1.0
References: <20220830214919.53220-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220830214919.53220-24-surenb@google.com>
Subject: [RFC PATCH 23/30] timekeeping: Add a missing include
From:   Suren Baghdasaryan <surenb@google.com>
To:     akpm@linux-foundation.org
Cc:     kent.overstreet@linux.dev, mhocko@suse.com, vbabka@suse.cz,
        hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de,
        dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com,
        void@manifault.com, peterz@infradead.org, juri.lelli@redhat.com,
        ldufour@linux.ibm.com, peterx@redhat.com, david@redhat.com,
        axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org,
        nathan@kernel.org, changbin.du@intel.com, ytcoode@gmail.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, bristot@redhat.com,
        vschneid@redhat.com, cl@linux.com, penberg@kernel.org,
        iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com,
        elver@google.com, dvyukov@google.com, shakeelb@google.com,
        songmuchun@bytedance.com, arnd@arndb.de, jbaron@akamai.com,
        rientjes@google.com, minchan@google.com, kaleshsingh@google.com,
        surenb@google.com, kernel-team@android.com, linux-mm@kvack.org,
        iommu@lists.linux.dev, kasan-dev@googlegroups.com,
        io-uring@vger.kernel.org, linux-arch@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

From: Kent Overstreet <kent.overstreet@linux.dev>

We need ktime.h for ktime_t.

Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
---
 include/linux/timekeeping.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/timekeeping.h b/include/linux/timekeeping.h
index fe1e467ba046..7c43e98cf211 100644
--- a/include/linux/timekeeping.h
+++ b/include/linux/timekeeping.h
@@ -4,6 +4,7 @@
 
 #include <linux/errno.h>
 #include <linux/clocksource_ids.h>
+#include <linux/ktime.h>
 
 /* Included from linux/ktime.h */
 
-- 
2.37.2.672.g94769d06f0-goog

