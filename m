Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0E945E8C5B
	for <lists+linux-modules@lfdr.de>; Sat, 24 Sep 2022 14:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233903AbiIXMXa (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Sat, 24 Sep 2022 08:23:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233861AbiIXMXA (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Sat, 24 Sep 2022 08:23:00 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C010E2346;
        Sat, 24 Sep 2022 05:22:57 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MZSl74zgFzpVJh;
        Sat, 24 Sep 2022 20:20:03 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 24 Sep 2022 20:22:55 +0800
Received: from thunder-town.china.huawei.com (10.174.178.55) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 24 Sep 2022 20:22:54 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Josh Poimboeuf <jpoimboe@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Miroslav Benes <mbenes@suse.cz>,
        Petr Mladek <pmladek@suse.com>,
        Joe Lawrence <joe.lawrence@redhat.com>,
        <live-patching@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Jiri Olsa <jolsa@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Luis Chamberlain" <mcgrof@kernel.org>,
        <linux-modules@vger.kernel.org>,
        "Steven Rostedt" <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH v6 10/11] kallsyms: Delete an unused parameter related to kallsyms_on_each_symbol()
Date:   Sat, 24 Sep 2022 20:20:50 +0800
Message-ID: <20220924122051.362-11-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20220924122051.362-1-thunder.leizhen@huawei.com>
References: <20220924122051.362-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.178.55]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

The parameter 'struct module *' in the hook function associated with
kallsyms_on_each_symbol() is no longer used. Delete it.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 include/linux/kallsyms.h | 3 +--
 kernel/kallsyms.c        | 5 ++---
 kernel/trace/ftrace.c    | 3 +--
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/include/linux/kallsyms.h b/include/linux/kallsyms.h
index 2138219ae0296e9..015c7685765978e 100644
--- a/include/linux/kallsyms.h
+++ b/include/linux/kallsyms.h
@@ -66,8 +66,7 @@ static inline void *dereference_symbol_descriptor(void *ptr)
 }
 
 #ifdef CONFIG_KALLSYMS
-int kallsyms_on_each_symbol(int (*fn)(void *, const char *, struct module *,
-				      unsigned long),
+int kallsyms_on_each_symbol(int (*fn)(void *, const char *, unsigned long),
 			    void *data);
 int kallsyms_on_each_match_symbol(int (*fn)(void *, unsigned long),
 				  const char *name, void *data);
diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 309bee76d7f5ac0..8e7e83842bcfdd3 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -362,8 +362,7 @@ unsigned long kallsyms_lookup_name(const char *name)
  * Iterate over all symbols in vmlinux.  For symbols from modules use
  * module_kallsyms_on_each_symbol instead.
  */
-int kallsyms_on_each_symbol(int (*fn)(void *, const char *, struct module *,
-				      unsigned long),
+int kallsyms_on_each_symbol(int (*fn)(void *, const char *, unsigned long),
 			    void *data)
 {
 	char namebuf[KSYM_NAME_LEN];
@@ -373,7 +372,7 @@ int kallsyms_on_each_symbol(int (*fn)(void *, const char *, struct module *,
 
 	for (i = 0, off = 0; i < kallsyms_num_syms; i++) {
 		off = kallsyms_expand_symbol(off, namebuf, ARRAY_SIZE(namebuf));
-		ret = fn(data, namebuf, NULL, kallsyms_sym_address(i));
+		ret = fn(data, namebuf, kallsyms_sym_address(i));
 		if (ret != 0)
 			return ret;
 		cond_resched();
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 439e2ab6905ee1e..f135a0a334a3fcb 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -8250,8 +8250,7 @@ struct kallsyms_data {
 	size_t found;
 };
 
-static int kallsyms_callback(void *data, const char *name,
-			     struct module *mod, unsigned long addr)
+static int kallsyms_callback(void *data, const char *name, unsigned long addr)
 {
 	struct kallsyms_data *args = data;
 	const char **sym;
-- 
2.25.1

