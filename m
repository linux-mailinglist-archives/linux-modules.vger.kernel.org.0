Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70C852F17C8
	for <lists+linux-modules@lfdr.de>; Mon, 11 Jan 2021 15:15:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728008AbhAKOOG (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Mon, 11 Jan 2021 09:14:06 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:10955 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727668AbhAKOOF (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Mon, 11 Jan 2021 09:14:05 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DDwdb6HCyzj4dt;
        Mon, 11 Jan 2021 22:12:35 +0800 (CST)
Received: from huawei.com (10.174.176.87) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.498.0; Mon, 11 Jan 2021
 22:13:16 +0800
From:   Shuo Wang <wangshuo47@huawei.com>
To:     <lucas.de.marchi@gmail.com>, <patchwork-bot@kernel.org>,
        <linux-modules@vger.kernel.org>
CC:     <hushiyuan@huawei.com>
Subject: [PATCH] libkmod: assign values to variables to fix warnings
Date:   Mon, 11 Jan 2021 22:13:16 +0800
Message-ID: <20210111141316.23108-1-wangshuo47@huawei.com>
X-Mailer: git-send-email 2.19.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.176.87]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

gcc version 7.3.0 (GCC)

>what compiler?
>>libkmod/libkmod.c: In function 'kmod_lookup_alias_is_builtin':
>>./shared/util.h:73:9: warning: 'line' may be used uninitialized in this function [-Wmaybe-uninitialized]
>>         free(*(void**) p);
>>         ^~~~~~~~~~~~~~~~~
>>libkmod/libkmod.c:581:23: note: 'line' was declared here
>>  _cleanup_free_ char *line;
>>                       ^~~~
>>In file included from libkmod/libkmod-module.c:42:0:
>>libkmod/libkmod-module.c: In function 'kmod_module_probe_insert_module':
>>./shared/util.h:73:9: warning: 'cmd' may be used uninitialized in this function [-Wmaybe-uninitialized]
>>         free(*(void**) p);
>>         ^~~~~~~~~~~~~~~~~
>>libkmod/libkmod-module.c:1009:23: note: 'cmd' was declared here
>>  _cleanup_free_ char *cmd;
>>
>>---
>> libkmod/libkmod-module.c | 2 +-
>> libkmod/libkmod.c        | 2 +-
>> 2 files changed, 2 insertions(+), 2 deletions(-)
>>
>>diff --git a/libkmod/libkmod-module.c b/libkmod/libkmod-module.c
>>index 76a6dc3..2e973b5 100644
>>--- a/libkmod/libkmod-module.c
>>+++ b/libkmod/libkmod-module.c
>>@@ -1006,7 +1006,7 @@ static int module_do_install_commands(struct kmod_module *mod,
>> {
>> 	const char *command = kmod_module_get_install_commands(mod);
>> 	char *p;
>>-	_cleanup_free_ char *cmd;
>>+	_cleanup_free_ char *cmd = NULL;
>> 	int err;
>> 	size_t cmdlen, options_len, varlen;
>> 
>>diff --git a/libkmod/libkmod.c b/libkmod/libkmod.c
>>index 43423d6..66e658c 100644
>>--- a/libkmod/libkmod.c
>>+++ b/libkmod/libkmod.c
>>@@ -578,7 +578,7 @@ finish:
>> 
>> bool kmod_lookup_alias_is_builtin(struct kmod_ctx *ctx, const char *name)
>> {
>>-	_cleanup_free_ char *line;
>>+	_cleanup_free_ char *line = NULL;
>> 
>> 	line = lookup_builtin_file(ctx, name);
>> 
>>-- 
>>2.23.0

