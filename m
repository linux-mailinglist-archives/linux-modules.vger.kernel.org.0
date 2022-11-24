Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EF0A63707E
	for <lists+linux-modules@lfdr.de>; Thu, 24 Nov 2022 03:36:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbiKXCgf (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Wed, 23 Nov 2022 21:36:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbiKXCgb (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Wed, 23 Nov 2022 21:36:31 -0500
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC26C5E9C3;
        Wed, 23 Nov 2022 18:36:28 -0800 (PST)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.55])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NHhqp0tmqzJnsc;
        Thu, 24 Nov 2022 10:33:10 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 24 Nov 2022 10:36:25 +0800
Received: from [10.174.178.55] (10.174.178.55) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 24 Nov 2022 10:36:24 +0800
Subject: Re: [PATCH v8 6/9] livepatch: Use kallsyms_on_each_match_symbol() to
 improve performance
To:     Petr Mladek <pmladek@suse.com>
CC:     Josh Poimboeuf <jpoimboe@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Miroslav Benes <mbenes@suse.cz>,
        Joe Lawrence <joe.lawrence@redhat.com>,
        <live-patching@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Masahiro Yamada" <masahiroy@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Jiri Olsa <jolsa@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        <linux-modules@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        "Ingo Molnar" <mingo@redhat.com>,
        David Laight <David.Laight@aculab.com>
References: <20221102084921.1615-1-thunder.leizhen@huawei.com>
 <20221102084921.1615-7-thunder.leizhen@huawei.com> <Y34f+IqqSGbtC82V@alley>
From:   "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <45a28bcf-c6e1-8d39-613a-d30bd7b685f0@huawei.com>
Date:   Thu, 24 Nov 2022 10:36:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <Y34f+IqqSGbtC82V@alley>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>



On 2022/11/23 21:28, Petr Mladek wrote:
> Hi,
> 
> I am sorry for the late review. I have been snowed under another
> tasks.
> 
> On Wed 2022-11-02 16:49:18, Zhen Lei wrote:
>> Based on the test results of kallsyms_on_each_match_symbol() and
>> kallsyms_on_each_symbol(), the average performance can be improved by
>> more than 1500 times.
> 
> Sounds great.
> 
>> --- a/kernel/livepatch/core.c
>> +++ b/kernel/livepatch/core.c
>> @@ -153,6 +153,24 @@ static int klp_find_callback(void *data, const char *name,
>>  	return 0;
>>  }
>>  
>> +static int klp_match_callback(void *data, unsigned long addr)
>> +{
>> +	struct klp_find_arg *args = data;
>> +
>> +	args->addr = addr;
>> +	args->count++;
>> +
>> +	/*
>> +	 * Finish the search when the symbol is found for the desired position
>> +	 * or the position is not defined for a non-unique symbol.
>> +	 */
>> +	if ((args->pos && (args->count == args->pos)) ||
>> +	    (!args->pos && (args->count > 1)))
>> +		return 1;
>> +
>> +	return 0;
> 
> This duplicates most of the klp_find_callback(). Please, call this
> new function in klp_find_callback() instead of the duplicated code.
> I mean to do:
> 
> static int klp_find_callback(void *data, const char *name, unsigned long addr)
> {
> 	struct klp_find_arg *args = data;
> 
> 	if (strcmp(args->name, name))
> 		return 0;
> 
> 	return klp_match_callback(data, addr);
> }

Good idea. But these patches have been merged into linux-next, how about I post
a new cleanup patch after v6.2-rc1?

> 
> Otherwise, it looks good.
> 
> Best Regards,
> Petr
> .
> 

-- 
Regards,
  Zhen Lei
