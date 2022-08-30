Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB0505A6FEA
	for <lists+linux-modules@lfdr.de>; Tue, 30 Aug 2022 23:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232008AbiH3VwY (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Tue, 30 Aug 2022 17:52:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232010AbiH3Vvd (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Tue, 30 Aug 2022 17:51:33 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 455F140E12
        for <linux-modules@vger.kernel.org>; Tue, 30 Aug 2022 14:50:11 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id f12-20020a25b6cc000000b0069a9e36de26so716954ybm.16
        for <linux-modules@vger.kernel.org>; Tue, 30 Aug 2022 14:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=PaZc/ErQmIz9CmZWuOwZKmMvFAFDhrfR0u4+oqULyqs=;
        b=hebs9Ab4jQ13PLVsrCINOWSpgoH5EATUTa9Cks3Eg1nmkxH7qE2oRwCx7AF5BNZXTH
         AHzIFQ24Or2oJnVcja+AOnCs2XgXBCldmNcsagLkjdyOLpIpceU0bsUf62DWg4fCi92e
         s30PWdmXxABwFMNU1JgUL6Fp0h2PBQ5hgdc0oQExPZeqJt/0xfqCgMF0cTxAmuBThoZJ
         frR4uwNwpRrRdJWEew4t7LzoFroWP+hLZBEH0mT+P1Yv4GgQEDG37uiXZMEF+0m6Voke
         PgoPiZ8qXrLB1DY6fUVv3gddg9c6Rea7O2e0xIyCiy2p7GROj3EzsKBaYmh74I5z0+5s
         1/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=PaZc/ErQmIz9CmZWuOwZKmMvFAFDhrfR0u4+oqULyqs=;
        b=jXvZlHlRKPG/+2itIK2dZCwc47jTIqIEl2uE3pRJjFlCuIDoyE/zQKhi5QrWp2ozD8
         K2AMBkh3j/TBeYJj2YItCTyQBV001DiaPGf1Z3hIaQ7QOo2Sti/iddTEqnbG7lQTRv7f
         0agakIeIK1orHh54rPiBCdpzMBw2SB/k5j9/rQpvl9IH5U1lkrzlHlizSEwKYVwQLY36
         1IYNVbC+64Al8PgU5WXKYjGnuHVQg/WRYQtsjNhp0KiYmpp0J/PEcoY2N2pLzV0YCL9R
         IDxTPSyBXPs2eOrppInahyZMVvvb3u3HKMaV6r/HQbfAQN5uOtHuvIZazu8FJxAzglAL
         GUGQ==
X-Gm-Message-State: ACgBeo2xn73ZL4zr/tQRVkXhz8v1aZT6qjn04AwxEjdF+DnzQiRej+lg
        w4z/Y4IIusl4Ed5CxCPjH7KaDi4PGuE=
X-Google-Smtp-Source: AA6agR60bKzipuEg+9xXy+Pee21QZvBbTBPOhKhJO0fVzuHKtaTXE6dCUM7Zh4tN5bptU+EiRysnFAQW6po=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:a005:55b3:6c26:b3e4])
 (user=surenb job=sendgmr) by 2002:a25:31d5:0:b0:677:28b:1451 with SMTP id
 x204-20020a2531d5000000b00677028b1451mr13217805ybx.437.1661896208990; Tue, 30
 Aug 2022 14:50:08 -0700 (PDT)
Date:   Tue, 30 Aug 2022 14:49:06 -0700
In-Reply-To: <20220830214919.53220-1-surenb@google.com>
Mime-Version: 1.0
References: <20220830214919.53220-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220830214919.53220-18-surenb@google.com>
Subject: [RFC PATCH 17/30] lib/string.c: strsep_no_empty()
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
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

From: Kent Overstreet <kent.overstreet@linux.dev>

This adds a new helper which is like strsep, except that it skips empty
tokens.

Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
---
 include/linux/string.h |  1 +
 lib/string.c           | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/linux/string.h b/include/linux/string.h
index 61ec7e4f6311..b950ac9cfa56 100644
--- a/include/linux/string.h
+++ b/include/linux/string.h
@@ -96,6 +96,7 @@ extern char * strpbrk(const char *,const char *);
 #ifndef __HAVE_ARCH_STRSEP
 extern char * strsep(char **,const char *);
 #endif
+extern char *strsep_no_empty(char **, const char *);
 #ifndef __HAVE_ARCH_STRSPN
 extern __kernel_size_t strspn(const char *,const char *);
 #endif
diff --git a/lib/string.c b/lib/string.c
index 6f334420f687..6939f5b751f2 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -596,6 +596,25 @@ char *strsep(char **s, const char *ct)
 EXPORT_SYMBOL(strsep);
 #endif
 
+/**
+ * strsep_no_empt - Split a string into tokens, but don't return empty tokens
+ * @s: The string to be searched
+ * @ct: The characters to search for
+ *
+ * strsep() updates @s to point after the token, ready for the next call.
+ */
+char *strsep_no_empty(char **s, const char *ct)
+{
+	char *ret;
+
+	do {
+		ret = strsep(s, ct);
+	} while (ret && !*ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(strsep_no_empty);
+
 #ifndef __HAVE_ARCH_MEMSET
 /**
  * memset - Fill a region of memory with the given value
-- 
2.37.2.672.g94769d06f0-goog

