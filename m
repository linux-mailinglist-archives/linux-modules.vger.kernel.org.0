Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9591560BC7B
	for <lists+linux-modules@lfdr.de>; Mon, 24 Oct 2022 23:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbiJXVtk (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Mon, 24 Oct 2022 17:49:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230430AbiJXVsj (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Mon, 24 Oct 2022 17:48:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2B8B285B5D
        for <linux-modules@vger.kernel.org>; Mon, 24 Oct 2022 13:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666641561;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4yFzP+SUyhmoWsUm8wlibl5IGQr01hdntFp1qHSNIyk=;
        b=RhqMTEncmTZda4tm9CFbA5CSCucJYOZrn4n+hfgpmQ0A5+fyrJgdFlbcY95rI0jY3Z4rbJ
        5+aNlBxbUbRKZO1qedR4TF/C84xbwpN/rL3oZFyR6wB5vNaWHv8uifgG/QyEiNj5j2IpZE
        IPE+Buj/H7LdmyBa65HrfQjfsePdFEA=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-606-kjVq95eNNWeqB01XeKZAWg-1; Mon, 24 Oct 2022 09:22:38 -0400
X-MC-Unique: kjVq95eNNWeqB01XeKZAWg-1
Received: by mail-qv1-f69.google.com with SMTP id jn13-20020ad45ded000000b004b1d055fbc7so5170609qvb.2
        for <linux-modules@vger.kernel.org>; Mon, 24 Oct 2022 06:22:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4yFzP+SUyhmoWsUm8wlibl5IGQr01hdntFp1qHSNIyk=;
        b=itB7avV18xWOwCRT4GVKEFjsKFH8MVbsqECT8P7Job8Ximpf0wMzwiWn2nF/xwVRtv
         jJM6qgFf76R/hvtfCnwbeDSjhkKU1Wyn415Ronga0vEUwqHO9Uy88boURtfWl7+WX6tR
         FMbav25C94BqnvDwc5MVOW4hjbwyHkDTMzUe3ONQ+5AloknNSPspL98WJA7mApGWvnVQ
         z+bfKd+pUqVEqREdYJZAICemNZKO7uECUN8kifYTmfGkGNSQ+mWZiJ1WLs49vuEBsYcB
         twndnXqmHkpx5vvh8zeWsLGRtt3KO9Z7w53iGF1LW5TzI+j52W8rTQ+UACV06/ymvyqp
         NXxQ==
X-Gm-Message-State: ACrzQf2rtOt5rltU8tsYfLEe6ViGQU2zUINea0nB92HGot7o1n7qKjW/
        MXFng4C6iyo8XQQZSXkf1t6W740lQ9yp+lbY1rmouBmwBUXxEz8GzCiYV5IKkIbBlDRaI1s3+pD
        uaH2ycQChR+m7d6xmVbiemjzNyw==
X-Received: by 2002:a05:620a:13e1:b0:6ee:9408:1f90 with SMTP id h1-20020a05620a13e100b006ee94081f90mr23038349qkl.502.1666617758388;
        Mon, 24 Oct 2022 06:22:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5/mEYrDkNwyLxqg2VNkiHN2kXMv4D8ir4idxS6UCSaxtUMTT//i1ZNYxV2Fp4BYylrhhi+6w==
X-Received: by 2002:a05:620a:13e1:b0:6ee:9408:1f90 with SMTP id h1-20020a05620a13e100b006ee94081f90mr23038322qkl.502.1666617757993;
        Mon, 24 Oct 2022 06:22:37 -0700 (PDT)
Received: from [10.16.222.26] (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id k11-20020a05620a414b00b006e99290e83fsm15183842qko.107.2022.10.24.06.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 06:22:37 -0700 (PDT)
Message-ID: <848276b0-f038-565a-cad1-30a0531cc851@redhat.com>
Date:   Mon, 24 Oct 2022 09:22:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 2/2] module: Merge same-name module load requests
Content-Language: en-US
To:     Petr Mladek <pmladek@suse.com>
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        Petr Pavlu <petr.pavlu@suse.com>,
        linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220919123233.8538-1-petr.pavlu@suse.com>
 <20220919123233.8538-3-petr.pavlu@suse.com>
 <YzdR0gRNQI2BGnJ9@bombadil.infradead.org>
 <aa8d9456-b260-d999-0296-8e6ab876af7a@suse.com>
 <Y07xX2ejlg0oFoEy@bombadil.infradead.org>
 <2342ef17-f8f9-501f-0f7b-5a69e85c2cf4@redhat.com> <Y1D2kFy+I8dgDkll@alley>
From:   Prarit Bhargava <prarit@redhat.com>
In-Reply-To: <Y1D2kFy+I8dgDkll@alley>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

On 10/20/22 03:19, Petr Mladek wrote:
> On Tue 2022-10-18 15:53:03, Prarit Bhargava wrote:
>> On 10/18/22 14:33, Luis Chamberlain wrote:
>>> On Sat, Oct 15, 2022 at 11:27:10AM +0200, Petr Pavlu wrote:
>>>> The patch does address a regression observed after commit 6e6de3dee51a
>>>> ("kernel/module.c: Only return -EEXIST for modules that have finished
>>>> loading"). I guess it can have a Fixes tag added to the patch.
>>>>
>>>> I think it is hard to split this patch into parts because the implemented
>>>> "optimization" is the fix.
>>>
>>> git describe --contains 6e6de3dee51a
>>> v5.3-rc1~38^2~6
>>>
>>> I'm a bit torn about this situation. Reverting 6e6de3dee51a would be the
>>> right thing to do, but without it, it still leaves the issue reported
>>> by Prarit Bhargava. We need a way to resolve the issue on stable and
>>> then your optimizations can be applied on top.
>>>
>>> Prarit Bhargava, please review Petry's work and see if you can come up
>>> with a sensible way to address this for stable.
>>
>> I found the original thread surrounding these changes and I do not think
>> this solution should have been committed to the kernel.  It is not a good
>> solution to the problem being solved and adds complexity where none is
>> needed IMO.
>>
>> Quoting from the original thread,
>>
>>>
>>> Motivation for this patch is to fix an issue observed on larger machines with
>>> many CPUs where it can take a significant amount of time during boot to run
>>> systemd-udev-trigger.service. An x86-64 system can have already intel_pstate
>>> active but as its CPUs can match also acpi_cpufreq and pcc_cpufreq, udev will
>>> attempt to load these modules too. The operation will eventually fail in the
>>> init function of a respective module where it gets recognized that another
>>> cpufreq driver is already loaded and -EEXIST is returned. However, one uevent
>>> is triggered for each CPU and so multiple loads of these modules will be
>>> present. The current code then processes all such loads individually and
>>> serializes them with the barrier in add_unformed_module().
>>>
>>
>> The way to solve this is not in the module loading code, but in the udev
>> code by adding a new event or in the userspace which handles the loading
>> events.
>>
>> Option 1)
>>
>> Write/modify a udev rule to to use a flock userspace file lock to prevent
>> repeated loading.  The problem with this is that it is still racy and still
>> consumes CPU time repeated load the ELF header and, depending on the system
>> (ie a large number of cpus) would still cause a boot delay.  This would be
>> better than what we have and is worth looking at as a simple solution.  I'd
>> like to see boot times with this change, and I'll try to come up with a
>> measurement on a large CPU system.
> 
> This sounds like a ping-pong between projects where to put the
> complexity. Honestly, I think that it would be more reliable if
> we serialized/squashed parallel loads on the kernel side.
> 

Well, that's the world we live in.  Module loading ping pongs between 
udev and the kernel.

> 
>> Option 2)
>>
>> Create a new udev action, "add_once" to indicate to userspace that the
>> module only needs to be loaded one time, and to ignore further load
>> requests.  This is a bit tricky as both kernel space and userspace would
>> have be modified.  The udev rule would end up looking very similar to what
>> we now.
>>
>> The benefit of option 2 is that driver writers themselves can choose which
>> drivers should issue "add_once" instead of add.  Drivers that are known to
>> run on all devices at once would call "add_once" to only issue a single
>> load.
> 
> My concern is how to distinguish first attempts and later (fixed)
> attempts.
> 
> I mean that the module load might fail at boot. But the user might
> fix the root of the problem and try to load the module once again
> without reboot. The other load need not be direct. It might be part
> of another more complex operation. Reload of another module.
> Restart of a service.
> 

This is an interesting complication, and something to think about.

P.


> It might be problematic to do this an user-friendly way.
> And it might be much more complicated in the end.


> 
> Best Regards,
> Petr
> 

