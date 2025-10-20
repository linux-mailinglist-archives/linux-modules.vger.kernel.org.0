Return-Path: <linux-modules+bounces-4654-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D06BF0EDA
	for <lists+linux-modules@lfdr.de>; Mon, 20 Oct 2025 13:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 172144E8AD6
	for <lists+linux-modules@lfdr.de>; Mon, 20 Oct 2025 11:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26DA8302CD5;
	Mon, 20 Oct 2025 11:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TONyoiwI"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0802FD7A4
	for <linux-modules@vger.kernel.org>; Mon, 20 Oct 2025 11:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760961237; cv=none; b=ZAWBM5bNGamA9dXidach/lbxr7dLkMMaPvSsyqqd1F4EErCnNJ64/c4mb/zd3+xV1KcL7shUBq3faqdzqdzhOjY2GMnSZ5syxwpSkaETkv7SVxw691uojD2ffxuWX97mjlWjwoVzkF3xEGDOPpetDYgMoF6nRk7y4RAKEjTgWBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760961237; c=relaxed/simple;
	bh=QRgtxPDFtUb5R9e3t7y6Kd+VvfoFw4kutBVEddZNlrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FQraQxFKAhIfM1gSlETPPmqLEWNr0xY7nB+9qgy1MDPx+kPSXEyEyuFnoKiuNyAV3ULWZfDAy7hlPlLdvAmy8VISfvXeI6WOe/0V61bEmqfLV3uzGiNxs/9BcCezODA1xgsJBd4cGr0HWjiwAturH4nGX8VzaZHbWDA+QBKhLQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TONyoiwI; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ee15b5435bso4438359f8f.0
        for <linux-modules@vger.kernel.org>; Mon, 20 Oct 2025 04:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760961233; x=1761566033; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nxLi65g4dGwi3ujksBH+bmbmQ5CpFWJvidjZ0C43bek=;
        b=TONyoiwI39GliHgQL37rOurmiPc9vvDF4waB1WeE7bpA8JqTuOEqlIYNgNoIt/0/tS
         +Gyhbmqi5qc5XDS2/tiOF3+wmHDS+tF/8uZpQWMVzr6aWVfdBTYQ334yrgEiNI8Ogy4z
         edV4MI2dG22DLTKxh8TuXgWJoRqvDgKHObTpcmtyHa65VWLiNzuzNAZMnwYU6lbxPmSF
         PouDLnee735chX2M2JYEZ2E6Y3lIgh22eibC82med8OPEJcUIm+M24wKltHWqimcLhxf
         HC9Cwck9owiukcWSvPWQj0wueeTVLsVQRtaC8dXpR1FYUlqbZjdH3SM6WYCp0WrlDr1A
         p1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760961233; x=1761566033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nxLi65g4dGwi3ujksBH+bmbmQ5CpFWJvidjZ0C43bek=;
        b=j5z1flD1RQB0uQdFPZVWNz4ra6sgS78M7da/CAXT1uKddeeejPtpEN4JcgC/Q1rPEk
         aI0frBIV3fsRKuUQizLI7uYLseneRKIpDLtkoqX0eED8WL/ZK8nvF31oZtFuvHmCqrR6
         QN10TPBjbV5iXiHhZLh+g7RmJNGwQSJ8v7nYVmJrA3dsgM1+visUAG9BjpRNMGcYPIAl
         iyHE+CviNT87eblCwKBqFKfjin+Myf+MbN0+zzd4spRXexid5lYfE78lIyf/R+FlhZzq
         EjRYy00eQHqNpLyFENTOdjKLwjt1cBLo2yIuFpnC6zTmMsfkyYIfxllSLVTUNO6VUKPL
         SLVg==
X-Forwarded-Encrypted: i=1; AJvYcCWUIMVbkz8plN2KGuS4/mBX9aTVqwdYi8zZT2iAACMVpYQ7WywbsDicZr4tZ6ecmlbdWw+w9HPG92+GWWG/@vger.kernel.org
X-Gm-Message-State: AOJu0YzaxyQAPc1zOf+xwot7JkpJyrY1Vs+iTVMGo4o7L4DsLGdAi40G
	hawgb8FRKmq+pDzh2Y2i0d4i6KQyeDOXsl9lhNLmPZLtw9NRov6pc0czX6u7BDcQ1Q8=
X-Gm-Gg: ASbGncvQMxbg9+215kALd115g8Ba9tSiF0Ju66Kc9svJiOte4rbd94xyiw4vJtuKw9M
	5J7XUtwNosXAw5IrdpfEWOinEB1yZ76Cdy3MaAVF4/oboR2Kk976fbZK4LW5geYN8y6YJmRMuPf
	kTHDr1pqOgdW8DogNr527BUuMI3zGFIcGVK7thCiQCdiPOP845Rlave7nh/vKaeU3fEQWC8+3OK
	BZP0xB7pjW1ngGyHrzh0jo167Lr5PYT8YppWBbqSkJrKmru0MoAVe1jrGeIi4LOLruwzyDnlqu3
	tiIXKmJc0skhihSOm9XqvbzKttLvRttirrzCXk9SyltcrpwzqP5sK9lAS9osyibm7FZr6mpNldS
	r80AsD8/iCV5RrD/8OYi96+0l0MzNbKd8tbQgzP+LbvzX0BcKWkgtAZwob8xiQBGvKqxd/BdnLM
	YJIkhvcKUSFf9xvKmuxAev
X-Google-Smtp-Source: AGHT+IErqGtubFP6M8NiY7VOpNWyIz/IZypNc+TYzCMimJqqWR79oYHNIBLeUwbSgQtIWQOkjfgZRw==
X-Received: by 2002:a5d:5d01:0:b0:427:7ac:528f with SMTP id ffacd0b85a97d-42707ac53b8mr8364947f8f.33.1760961233199;
        Mon, 20 Oct 2025 04:53:53 -0700 (PDT)
Received: from [10.100.51.209] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-891cf590691sm544700785a.52.2025.10.20.04.53.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 04:53:52 -0700 (PDT)
Message-ID: <eca6031d-7f72-4f24-bbd4-95354d5c9ca5@suse.com>
Date: Mon, 20 Oct 2025 13:53:49 +0200
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] PCI: Support FIXUP quirks in modules
To: Brian Norris <briannorris@chromium.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Luis Chamberlain
 <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 linux-pci@vger.kernel.org, David Gow <davidgow@google.com>,
 Rae Moar <rmoar@google.com>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>,
 Sami Tolvanen <samitolvanen@google.com>, Richard Weinberger
 <richard@nod.at>, Wei Liu <wei.liu@kernel.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, kunit-dev@googlegroups.com,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-um@lists.infradead.org
References: <20250912230208.967129-1-briannorris@chromium.org>
 <20250912230208.967129-2-briannorris@chromium.org>
 <c84d6952-7977-47cd-8f09-6ea223217337@suse.com> <aNLb9g0AbBXZCJ4m@google.com>
 <2071b071-874c-4f85-8500-033c73dfaaab@suse.com> <aORJhL1yAPyV7YAW@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <aORJhL1yAPyV7YAW@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/7/25 12:58 AM, Brian Norris wrote:
> Hi Petr,
> 
> On Wed, Sep 24, 2025 at 09:48:47AM +0200, Petr Pavlu wrote:
>> On 9/23/25 7:42 PM, Brian Norris wrote:
>>> Hi Petr,
>>>
>>> On Tue, Sep 23, 2025 at 02:55:34PM +0200, Petr Pavlu wrote:
>>>> On 9/13/25 12:59 AM, Brian Norris wrote:
>>>>> @@ -259,6 +315,12 @@ void pci_fixup_device(enum pci_fixup_pass pass, struct pci_dev *dev)
>>>>>  		return;
>>>>>  	}
>>>>>  	pci_do_fixups(dev, start, end);
>>>>> +
>>>>> +	struct pci_fixup_arg arg = {
>>>>> +		.dev = dev,
>>>>> +		.pass = pass,
>>>>> +	};
>>>>> +	module_for_each_mod(pci_module_fixup, &arg);
>>>>
>>>> The function module_for_each_mod() walks not only modules that are LIVE,
>>>> but also those in the COMING and GOING states. This means that this code
>>>> can potentially execute a PCI fixup from a module before its init
>>>> function is invoked, and similarly, a fixup can be executed after the
>>>> exit function has already run. Is this intentional?
>>>
>>> Thanks for the callout. I didn't really give this part much thought
>>> previously.
>>>
>>> Per the comments, COMING means "Full formed, running module_init". I
>>> believe that is a good thing, actually; specifically for controller
>>> drivers, module_init() might be probing the controller and enumerating
>>> child PCI devices to which we should apply these FIXUPs. That is a key
>>> case to support.
>>>
>>> GOING is not clearly defined in the header comments, but it seems like
>>> it's a relatively narrow window between determining there are no module
>>> refcounts (and transition to GOING) and starting to really tear it down
>>> (transitioning to UNFORMED before any significant teardown).
>>> module_exit() runs in the GOING phase.
>>>
>>> I think it does not make sense to execute FIXUPs on a GOING module; I'll
>>> make that change.
>>
>> Note that when walking the modules list using module_for_each_mod(),
>> the delete_module() operation can concurrently transition a module to
>> MODULE_STATE_GOING. If you are thinking about simply having
>> pci_module_fixup() check that mod->state isn't MODULE_STATE_GOING,
>> I believe this won't quite work.
> 
> Good point. I think this at least suggests that this should hook into
> some blocking point in the module-load sequence, such as the notifiers
> or even module_init() as you suggest below.
> 
>>> Re-quoting one piece:
>>>> This means that this code
>>>> can potentially execute a PCI fixup from a module before its init
>>>> function is invoked,
>>>
>>> IIUC, this part is not true? A module is put into COMING state before
>>> its init function is invoked.
>>
>> When loading a module, the load_module() function calls
>> complete_formation(), which puts the module into the COMING state. At
>> this point, the new code in pci_fixup_device() can see the new module
>> and potentially attempt to invoke its PCI fixups. However, such a module
>> has still a bit of way to go before its init function is called from
>> do_init_module(). The module hasn't yet had its arguments parsed, is not
>> linked in sysfs, isn't fully registered with codetag support, and hasn't
>> invoked its constructors (needed for gcov/kasan support).
> 
> It seems unlikely that sysfs, codetag, or arguments should matter much.
> gcov and kasan might be nice to have though.
> 
>> I don't know enough about PCI fixups and what is allowable in them, but
>> I suspect it would be better to ensure that no fixup can be invoked from
>> the module during this period.
> 
> I don't know of general rules, but they generally do pretty minimal work
> to adjust various fields in and around 'struct pci_dev', to account for
> broken IDs. Sometimes they need to read a few PCI registers. They may
> even tweak PM-related features. It varies based
> on what kind of "quriky" devices need to be handled, but it's usually
> pretty straightforward and well-contained -- not relying on any kind of
> global state, or even all that much specific to the module in question
> besides constant IDs.
> 
> (You can peruse drivers/pci/quirks.c or the various other files that use
> DECLARE_PCI_FIXUP_*() macros, if you're curious.)
> 
>> If the above makes sense, I think using module_for_each_mod() might not
>> be the right approach. Alternative options include registering a module
>> notifier or having modules explicitly register their PCI fixups in their
>> init function.
> 
> I agree module_for_each_mod() is probably not the right choice, but I'm
> not sure what the right choice is.
> 
> register_module_notifier() + keying off MODULE_STATE_COMING before
> pulling in the '.pci_fixup*' list seems attractive, but it still comes
> before gcov/kasan.
> 
> It seems like "first thing in module_init()" would be the right choice,
> but I don't know of a great way to do that.

We could introduce a new module state and have the module notifier fire
with this state at the required point. This seems to align best with how
other code is hooked into the module loader, although I dislike the idea
of introducing a new module state.

It might also be possible to insert a quirk registration function into
.init_array so it is called by do_mod_ctors().

> I could insert PCI-related
> calls directly into do_init_module() / delete_module(), but that doesn't
> seem very elegant. I could also mess with the module_{init,exit}()
> macros, but that seems a bit strange too.

I don't think you want to modify module_{init,exit}(), but you could
introduce something like module_pci_controller(), along with
pci_register_quirks() and pci_unregister_quirks(), which would handle
quirk registration, somewhat similar to how module_pci_driver() works.

> 
> I'm open to suggestions. Or else maybe I'll just go with
> register_module_notifier(), and accept that there may some small
> downsides still.

If it turns out there is no better way than register_module_notifier(),
then as mentioned above, it is possible to add a new module state to
properly support this case.

-- 
Thanks,
Petr

