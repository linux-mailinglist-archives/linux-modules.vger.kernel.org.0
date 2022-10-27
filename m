Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1684960F015
	for <lists+linux-modules@lfdr.de>; Thu, 27 Oct 2022 08:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233067AbiJ0G2B (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Thu, 27 Oct 2022 02:28:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbiJ0G17 (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Thu, 27 Oct 2022 02:27:59 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64732C068B;
        Wed, 26 Oct 2022 23:27:57 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MybHc01XXzpW51;
        Thu, 27 Oct 2022 14:24:28 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 14:27:54 +0800
Received: from [10.174.178.55] (10.174.178.55) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 14:27:53 +0800
Subject: Re: [PATCH v7 00/11] kallsyms: Optimizes the performance of lookup
 symbols
From:   "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
To:     Luis Chamberlain <mcgrof@kernel.org>
CC:     Josh Poimboeuf <jpoimboe@kernel.org>,
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
        <linux-modules@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        "Ingo Molnar" <mingo@redhat.com>
References: <20221017064950.2038-1-thunder.leizhen@huawei.com>
 <Y0/nEngJF6bbINEx@bombadil.infradead.org>
 <ad9e51c6-f77d-d9e9-9c13-42fcbbde7147@huawei.com>
 <Y1gisUFzgt1D1Jle@bombadil.infradead.org>
 <77f1c8f0-5e67-0e57-9285-15ba613044fb@huawei.com>
 <Y1mEiIvbld4SX1lx@bombadil.infradead.org>
 <4f06547b-456f-e1ec-c535-16577f502ff1@huawei.com>
Message-ID: <d7393d45-84bb-9e7b-99f4-412eb9223208@huawei.com>
Date:   Thu, 27 Oct 2022 14:27:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <4f06547b-456f-e1ec-c535-16577f502ff1@huawei.com>
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



On 2022/10/27 11:26, Leizhen (ThunderTown) wrote:
> 
> 
> On 2022/10/27 3:03, Luis Chamberlain wrote:
>> On Wed, Oct 26, 2022 at 02:44:36PM +0800, Leizhen (ThunderTown) wrote:
>>> On 2022/10/26 1:53, Luis Chamberlain wrote:
>>>> This answers how we don't use a hash table, the question was *should* we
>>>> use one?
>>>
>>> I'm not the original author, and I can only answer now based on my understanding. Maybe
>>> the original author didn't think of the hash method, or he has weighed it out.
>>>
>>> Hash is a good solution if only performance is required and memory overhead is not
>>> considered. Using hash will increase the memory size by up to "4 * kallsyms_num_syms +
>>> 4 * ARRAY_SIZE(hashtable)" bytes, kallsyms_num_syms is about 1-2 million.

Sorry, 1-2 million ==> 0.1~0.2 million

>>>
>>> Because I don't know what hash algorithm will be used, the cost of generating the
>>> hash value corresponding to the symbol name is unknown now. But I think it's gonna
>>> be small. But it definitely needs a simpler algorithm, the tool needs to implement
>>> the same hash algorithm.
>>
>> For instance, you can look at evaluating if alloc_large_system_hash() would help.
> 
> OK, I found the right hash function. In this way, the tool does not need to consider
> the byte order.

https://en.wikipedia.org/wiki/Jenkins_hash_function

Let's go with jenkins_one_at_a_time_hash(), which looks simpler and doesn't even
have to think about sizeof(long). It seems to be closest to our current needs.

uint32_t jenkins_one_at_a_time_hash(const uint8_t* key, size_t length) {
	size_t i = 0;
	uint32_t hash = 0;

	while (i != length) {
		hash += key[i++];
		hash += hash << 10;
		hash ^= hash >> 6;
	}
	hash += hash << 3;
	hash ^= hash >> 11;
	hash += hash << 15;

	return hash;
}

> 
> include/linux/stringhash.h
> 
> /*
>  * Version 1: one byte at a time.  Example of use:
>  *
>  * unsigned long hash = init_name_hash;
>  * while (*p)
>  *      hash = partial_name_hash(tolower(*p++), hash);
>  * hash = end_name_hash(hash);
> 
> 
>>
>>   Luis
>> .
>>
> 

-- 
Regards,
  Zhen Lei
