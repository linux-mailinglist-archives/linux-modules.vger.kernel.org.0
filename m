Return-Path: <linux-modules+bounces-1005-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EE1895587
	for <lists+linux-modules@lfdr.de>; Tue,  2 Apr 2024 15:39:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FDCD283207
	for <lists+linux-modules@lfdr.de>; Tue,  2 Apr 2024 13:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD6B84A52;
	Tue,  2 Apr 2024 13:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TwxX9fiw"
X-Original-To: linux-modules@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31F79463
	for <linux-modules@vger.kernel.org>; Tue,  2 Apr 2024 13:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712065174; cv=none; b=Z0qOKp+8aX46vCcIKE7KLRG0ahLjD58I0/EnUhnTN3GEqFT/419Jm20NLt4iSfeIepZ05vp0TF7ZnmTFgNsigk/Po4ZP4E9tORxDLWsUVhQ8SfN5Tip23Qz9xTJvoXrasn9JYpoqhc8+gdpBn5utaM3c7tL3QD4sS79lb5trt5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712065174; c=relaxed/simple;
	bh=0eERlPNpqBk7p87baO1sWVeDh6UKxluHdLHaO039lqM=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:Subject:
	 In-Reply-To:Content-Type; b=q2dvbcl/3bIDYJKVsvWw3SHbsBwrJV+fCy7UbBDvJRphOLUwtGPzy5S0vPNTv3IdmTSpfLTcPQY70fbERL1WHZSH5JtpQivuhO5et+AsAA6z5TasLHILhpfnU1EguqujLeY4SQlAc+40MLsVoR4F/+1XH+94NIegcfV3R/VGHAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TwxX9fiw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712065170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IvJRsOTWy2WNkKPLPyUqDhV14gTMv6DLmU0SB+9xQG4=;
	b=TwxX9fiwEWX8jot+ieP4HklBBGqUdhNh/U0fyi26RXI8STEqWF3XmedPB+2WS2xxr/nA4C
	AeheMFOlLgLTEGjY25Um7Pme3kTIHpCWheyfpcQXQQR2ZmLJ2Z1g0URlM0mV+GfHT0vn1s
	ovOXzyUL4mtwnQc6keiC/JUQyNg+fE4=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-Tn3xzgroNVyWIQeHX1tQ-A-1; Tue, 02 Apr 2024 09:39:27 -0400
X-MC-Unique: Tn3xzgroNVyWIQeHX1tQ-A-1
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3c3cbe8055bso6037176b6e.0
        for <linux-modules@vger.kernel.org>; Tue, 02 Apr 2024 06:39:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712065167; x=1712669967;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IvJRsOTWy2WNkKPLPyUqDhV14gTMv6DLmU0SB+9xQG4=;
        b=n5baJ5CkqX1S68Jf2AdVIipk+4tnNg8kKxuo+XN5dvBUOAFC4ZUcPEFzLmfeFiDDAA
         kk00uuPiFfecBvhpa9YEYPRzM6WuFCE8DW1beQAr5EeUvNj2fCpfA4t6gJ6mveJNo0Go
         c4RVWsI1eP4MRV3UCocUZn6KSahcrwMurs71XMyMsJVpfqBkDrlMVYhcrdODeZ2bNqrq
         qaTOE3Kxzqe/4ZAouzKrozIivumRTsttaCOii1QDaBAkaUKz/6w/ppmztx76Ny2/u/fb
         DM3JJ3h718sVWKeTA73peU0cAZs2WbNT5e9ZN81eh/QQjnrS+xg5GOfCVwH5Oqx6rB2l
         gx9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVk1XkgKQ/BadIjUsOZoE91EPHK7wdRCkqkjGGL/GbY1+zHHKqox40YYXYNVamv6N6YVzmPuuIqkF84igoNI0GV/IlGz6RcXTQnRjrIdA==
X-Gm-Message-State: AOJu0YwSPEv13RH2DxDqnJXIEsMlRsP6NZo+97UYiJk5xahW4FPDV7mL
	fyuGAZ+U9kc9l/ENi56mN3+xSNXOmc5gtG3VrwhIh/dx5Vlq8voA5XTdz08XC0FBr48SPO8NJG1
	jWf0gXdygvzDiJd67qApsEGiJzgQ1a3gesgXBqc56B9jIGCFdc0XSkyflbhpf2rU=
X-Received: by 2002:a05:6808:2023:b0:3c3:8822:dc36 with SMTP id q35-20020a056808202300b003c38822dc36mr15867502oiw.28.1712065166792;
        Tue, 02 Apr 2024 06:39:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/GFTYK7xpSSV0N+UCmqT6UlsH+IDd/aVCXjTy4KkM9mXjUX7DNu+NBrYoah+Cqx4ASkV4/Q==
X-Received: by 2002:a05:6808:2023:b0:3c3:8822:dc36 with SMTP id q35-20020a056808202300b003c38822dc36mr15867480oiw.28.1712065166459;
        Tue, 02 Apr 2024 06:39:26 -0700 (PDT)
Received: from [192.168.1.32] (pool-68-160-135-240.bstnma.fios.verizon.net. [68.160.135.240])
        by smtp.gmail.com with ESMTPSA id ks28-20020a056214311c00b00696893597cfsm5524568qvb.13.2024.04.02.06.39.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Apr 2024 06:39:25 -0700 (PDT)
Message-ID: <f9780cb7-1071-7cb3-c18a-0681a741e0b4@redhat.com>
Date: Tue, 2 Apr 2024 09:39:24 -0400
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Yafang Shao <laoar.shao@gmail.com>, mbenes@suse.cz, pmladek@suse.com
Cc: jpoimboe@kernel.org, jikos@kernel.org, mcgrof@kernel.org,
 live-patching@vger.kernel.org, linux-modules@vger.kernel.org
References: <20240331133839.18316-1-laoar.shao@gmail.com>
 <ZgrMfYBo8TynjSKX@redhat.com>
 <CALOAHbDWiO+TbRnjxCN3j9YWD3Cz9NOg9g-xOhVqmaPmexqNoQ@mail.gmail.com>
From: Joe Lawrence <joe.lawrence@redhat.com>
Subject: Re: [PATCH] livepatch: Delete the associated module when replacing an
 old livepatch
In-Reply-To: <CALOAHbDWiO+TbRnjxCN3j9YWD3Cz9NOg9g-xOhVqmaPmexqNoQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/1/24 22:45, Yafang Shao wrote:
> On Mon, Apr 1, 2024 at 11:02 PM Joe Lawrence <joe.lawrence@redhat.com> wrote:
>>
>> On Sun, Mar 31, 2024 at 09:38:39PM +0800, Yafang Shao wrote:
>>> Enhance the functionality of kpatch to automatically remove the associated
>>> module when replacing an old livepatch with a new one. This ensures that no
>>> leftover modules remain in the system. For instance:
>>>
>>> - Load the first livepatch
>>>   $ kpatch load 6.9.0-rc1+/livepatch-test_0.ko
>>>   loading patch module: 6.9.0-rc1+/livepatch-test_0.ko
>>>   waiting (up to 15 seconds) for patch transition to complete...
>>>   transition complete (2 seconds)
>>>
>>>   $ kpatch list
>>>   Loaded patch modules:
>>>   livepatch_test_0 [enabled]
>>>
>>>   $ lsmod |grep livepatch
>>>   livepatch_test_0       16384  1
>>>
>>> - Load a new livepatch
>>>   $ kpatch load 6.9.0-rc1+/livepatch-test_1.ko
>>>   loading patch module: 6.9.0-rc1+/livepatch-test_1.ko
>>>   waiting (up to 15 seconds) for patch transition to complete...
>>>   transition complete (2 seconds)
>>>
>>>   $ kpatch list
>>>   Loaded patch modules:
>>>   livepatch_test_1 [enabled]
>>>
>>>   $ lsmod |grep livepatch
>>>   livepatch_test_1       16384  1
>>>   livepatch_test_0       16384  0   <<<< leftover
>>>
>>> With this improvement, executing
>>> `kpatch load 6.9.0-rc1+/livepatch-test_1.ko` will automatically remove the
>>> livepatch-test_0.ko module.
>>>
>>
>> Hi Yafang,
>>
>> I think it would be better if the commit message reasoning used
>> insmod/modprobe directly rather than the kpatch user utility wrapper.
>> That would be more generic and remove any potential kpatch utility
>> variants from the picture.  (For example, it is possible to add `rmmod`
>> in the wrapper and then this patch would be redundant.)
> 
> Hi Joe,
> 
> I attempted to incorporate an `rmmod` operation within the kpatch
> replacement process, but encountered challenges in devising a safe and
> effective solution. The difficulty arises from the uncertainty
> regarding which livepatch will be replaced in userspace, necessitating
> the operation to be conducted within the kernel itself.
> 

I wasn't suggesting that the kpatch user utility should or could solve
this problem, just that this scenario is not specific to kpatch.  And
since this is a kernel patch, it would be consistent to speak in terms
of livepatches: the repro can be phrased in terms of modprobe/insmod,
/sys/kernel/livepatch/ sysfs, rmmod, etc. for which those not using the
kpatch utility are more familiar with.

>>
>>> Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
>>> ---
>>>  include/linux/module.h  |  1 +
>>>  kernel/livepatch/core.c | 11 +++++++++--
>>>  kernel/module/main.c    | 43 ++++++++++++++++++++++++-----------------
>>>  3 files changed, 35 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/include/linux/module.h b/include/linux/module.h
>>> index 1153b0d99a80..9a95174a919b 100644
>>> --- a/include/linux/module.h
>>> +++ b/include/linux/module.h
>>> @@ -75,6 +75,7 @@ extern struct module_attribute module_uevent;
>>>  /* These are either module local, or the kernel's dummy ones. */
>>>  extern int init_module(void);
>>>  extern void cleanup_module(void);
>>> +extern void delete_module(struct module *mod);
>>>
>>>  #ifndef MODULE
>>>  /**
>>> diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
>>> index ecbc9b6aba3a..f1edc999f3ef 100644
>>> --- a/kernel/livepatch/core.c
>>> +++ b/kernel/livepatch/core.c
>>> @@ -711,6 +711,8 @@ static void klp_free_patch_start(struct klp_patch *patch)
>>>   */
>>>  static void klp_free_patch_finish(struct klp_patch *patch)
>>>  {
>>> +     struct module *mod = patch->mod;
>>> +
>>>       /*
>>>        * Avoid deadlock with enabled_store() sysfs callback by
>>>        * calling this outside klp_mutex. It is safe because
>>> @@ -721,8 +723,13 @@ static void klp_free_patch_finish(struct klp_patch *patch)
>>>       wait_for_completion(&patch->finish);
>>>
>>>       /* Put the module after the last access to struct klp_patch. */
>>> -     if (!patch->forced)
>>> -             module_put(patch->mod);
>>> +     if (!patch->forced)  {
>>> +             module_put(mod);
>>> +             if (module_refcount(mod))
>>> +                     return;
>>> +             mod->state = MODULE_STATE_GOING;
>>> +             delete_module(mod);
>>> +     }

I'm gonna have to read study code in kernel/module/ to be confident that
this is completely safe.  What happens if this code races a concurrent
`rmmod` from the user (perhaps that pesky kpatch utility)?  Can a stray
module reference sneak between the code here.  Etc.  The existing
delete_module syscall does some additional safety checks under the
module_mutex, which may or may not make sense for this use case... Petr,
Miroslav any thoughts?

Also, code-wise, it would be nice if the mod->state were only assigned
inside the kernel/module/main.c code... maybe this little sequence can
be pushed into that file so it's all in one place?

>>>  }
>>>
>>>  /*
>>> diff --git a/kernel/module/main.c b/kernel/module/main.c
>>> index e1e8a7a9d6c1..e863e1f87dfd 100644
>>> --- a/kernel/module/main.c
>>> +++ b/kernel/module/main.c
>>> @@ -695,12 +695,35 @@ EXPORT_SYMBOL(module_refcount);
>>>  /* This exists whether we can unload or not */
>>>  static void free_module(struct module *mod);
>>>
>>> +void delete_module(struct module *mod)
>>> +{
>>> +     char buf[MODULE_FLAGS_BUF_SIZE];
>>> +
>>> +     /* Final destruction now no one is using it. */
>>> +     if (mod->exit != NULL)
>>> +             mod->exit();
>>> +     blocking_notifier_call_chain(&module_notify_list,
>>> +                                  MODULE_STATE_GOING, mod);
>>> +     klp_module_going(mod);
>>> +     ftrace_release_mod(mod);
>>> +
>>> +     async_synchronize_full();
>>> +
>>> +     /* Store the name and taints of the last unloaded module for diagnostic purposes */
>>> +     strscpy(last_unloaded_module.name, mod->name, sizeof(last_unloaded_module.name));
>>> +     strscpy(last_unloaded_module.taints, module_flags(mod, buf, false),
>>> +             sizeof(last_unloaded_module.taints));
>>> +
>>> +     free_module(mod);
>>> +     /* someone could wait for the module in add_unformed_module() */
>>> +     wake_up_all(&module_wq);
>>> +}
>>> +
>>>  SYSCALL_DEFINE2(delete_module, const char __user *, name_user,
>>>               unsigned int, flags)
>>>  {
>>>       struct module *mod;
>>>       char name[MODULE_NAME_LEN];
>>> -     char buf[MODULE_FLAGS_BUF_SIZE];
>>>       int ret, forced = 0;
>>>
>>>       if (!capable(CAP_SYS_MODULE) || modules_disabled)
>>> @@ -750,23 +773,7 @@ SYSCALL_DEFINE2(delete_module, const char __user *, name_user,
>>>               goto out;
>>>
>>>       mutex_unlock(&module_mutex);
>>> -     /* Final destruction now no one is using it. */
>>> -     if (mod->exit != NULL)
>>> -             mod->exit();
>>> -     blocking_notifier_call_chain(&module_notify_list,
>>> -                                  MODULE_STATE_GOING, mod);
>>> -     klp_module_going(mod);
>>> -     ftrace_release_mod(mod);
>>> -
>>> -     async_synchronize_full();
>>> -
>>> -     /* Store the name and taints of the last unloaded module for diagnostic purposes */
>>> -     strscpy(last_unloaded_module.name, mod->name, sizeof(last_unloaded_module.name));
>>> -     strscpy(last_unloaded_module.taints, module_flags(mod, buf, false), sizeof(last_unloaded_module.taints));
>>> -
>>> -     free_module(mod);
>>> -     /* someone could wait for the module in add_unformed_module() */
>>> -     wake_up_all(&module_wq);
>>> +     delete_module(mod);
>>>       return 0;
>>>  out:
>>>       mutex_unlock(&module_mutex);
>>> --
>>> 2.39.1
>>>
>>
>> It's been a while since atomic replace was added and so I forget why the
>> implementation doesn't try this -- is it possible for the livepatch
>> module to have additional references that this patch would force its way
>> through?
> 
> In the klp_free_patch_finish() function, a check is performed on the
> reference count of the livepatch module. If the reference count is not
> zero, the function will skip further processing.
> 
>>
>> Also, this patch will break the "atomic replace livepatch" kselftest in
>> test-livepatch.sh [1].  I think it would need to drop the `unload_lp
>> $MOD_LIVEPATCH` command, the following 'live patched' greps and their
>> corresponding dmesg output in the test's final check_result() call.
> 
> Thanks for your information. I will check it.
> 

Let me know if you have any questions, I'm more familiar with that code
than the atomic replace / module interactions :)

-- 
Joe


