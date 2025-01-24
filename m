Return-Path: <linux-modules+bounces-3088-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 25121A1B67A
	for <lists+linux-modules@lfdr.de>; Fri, 24 Jan 2025 14:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B70FB7A45B7
	for <lists+linux-modules@lfdr.de>; Fri, 24 Jan 2025 13:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E8E1DA21;
	Fri, 24 Jan 2025 13:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BGbtSYPC"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB8035949
	for <linux-modules@vger.kernel.org>; Fri, 24 Jan 2025 12:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737723602; cv=none; b=bxF9gn07wrYnevsO426OcGcRPFM13TQWoFgAyXw4hEKSQP/dXGeyGB0pJEfvIu/bOFjt2uUfXc/2jqGaGZVPs1V8zxppEDygQYVf4rv9mzhYjrQPew0E8P+FVd5MiQLid2bjwmpvBYyv4GRz5meDPq44inx5fQ7wHKJTJZgkewA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737723602; c=relaxed/simple;
	bh=048+X1MOxQiKIP2lifMdZPmBKfc4MBq+0baHP1eRuak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PRAa2OoTlPezxuO7g4i5dDUyJlc8Q4SzmefmGJbcJMC/pT9hcxaEcjKUAB2uTGSY1ShPo6UiBU/1uu+zaXDUe865C+5qnTewjPxkEVJMuDPDAIV17WagKyQnPI3emXs0F0M6Xt1QpA8oKrGmmxsXh8oyQ7Wd2NHLn6a4bkrXl9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BGbtSYPC; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso14076725e9.0
        for <linux-modules@vger.kernel.org>; Fri, 24 Jan 2025 04:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737723597; x=1738328397; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y4p8V7L+SybE9UNVkk/PglJRrxpw6EHRMFcIJ2bc0MU=;
        b=BGbtSYPC7sMV7QowIyTnnRudLohDj4MSK+t1pcHS+UdVJoQfIIxlXW9sDjsmJgf970
         w/y2bUnqkb/BRWgclxfMzz8DpVNilOeiU+hN9G24HA3L+fdN4s/BOCAT8T9wrMh/XSOG
         jEltks+RqiEf1u1vX9pP+ZNMvM/JYUH+MgfD1XO31b0vpbcgLoBptdOY/GB5m1MhwlgP
         Nn4NuruQfjH5E26whSVpbkg5znAsIktGv5UL8y27ZC5qAQpjVcg2e/zfLD75AMagnVKh
         5SSN4at0OeQjkny8fc9YufHDd9n272NmsFYxZFx1S79HjZ8YwNLqV/7i5m/nhnA/MZq/
         TNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737723597; x=1738328397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y4p8V7L+SybE9UNVkk/PglJRrxpw6EHRMFcIJ2bc0MU=;
        b=ayzVlz5Ixh9zcaOVX9A5L0EG1O+kmBI8Z4l7BZDtvIvZDDIMDl5SuOuhD59rnw2KGo
         FuhY13NmWOotrz+mfnAWMStW2t+5gQrxGV0xec2eAItZaHSQNhMiWlRGtfYj7ecij4OH
         LGCrbSeLeW/akazYOxVSzInDhAkcF2nfd10XdnqEmPZgeE9qXJWr/8F8oA5KgjiNB+e9
         x8bbhHcGuZnNpY0z/klkBz9G56GKZ1lk2D8g92FgGfrNWT3WkGonLOLX0vjRopd6gOGU
         qYrDS4Qvw4oJVzYzfZRLqgDZF9MinGjMbN+JvH4p4fA2yFQI+c3LMvQv0lCxyt70fEAG
         opOQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8DaVWkvzWE4jL2yUqYHa+P8v884aKW6J0bxXJaB+KIaEyKCQYtBXd9W+qG0taMf556l8tdDsV3eVzx+Eu@vger.kernel.org
X-Gm-Message-State: AOJu0YyiMCgeZxHgK6Nyr94YYpMeW7Jv1pcaniYTjvl1k89bpql3K+of
	+CqoXFX4c3LLirVE+MSIrPc8TJgSfQHELocoDYyjffRNtwp0snNrUtg8cXvArxI=
X-Gm-Gg: ASbGncvJ0kRufUkBqmDQo+UoOMybtV8e9N6Z+AIjOFsb/Ydz/ae4cEh0LR4BUiRL2kP
	wsEXUQdszoxxQeVYBFCmfOjVh4MTJHt1Tk1DHk3Bs+DFpDIMUcjUd69aWkJeDdPzQeuYT5Qcvl9
	IsNk0sl2I0tWnv/ztFzMh5bfAGxX2ih66sM1unWqJyyxG1TvqBECnz/2qlAHeCmwr50nrtroXrU
	ezlu/GLAVJJUfJ8+MsMA1TrTrqzeqCk9iSojpYMSadCOgljAoErj73jjceyXmaCtGPxyiz5GGlT
	iKEKyrhUnLXzPeGWKow=
X-Google-Smtp-Source: AGHT+IEDbDZN2m5CHXDDsa3oj6Ebp9OHdbtruLTcN0mhHSAJojPcoO/LDhDZ6xjm5yK5+6pSh7FY3A==
X-Received: by 2002:a05:600c:63d5:b0:438:a46b:1a6 with SMTP id 5b1f17b1804b1-438a46b0388mr219468875e9.18.1737723597250;
        Fri, 24 Jan 2025 04:59:57 -0800 (PST)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd501721sm25207325e9.9.2025.01.24.04.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 04:59:56 -0800 (PST)
Message-ID: <8c6972c4-c1bb-402a-a72d-f92b87ee5a89@suse.com>
Date: Fri, 24 Jan 2025 13:59:55 +0100
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/10] module: introduce MODULE_STATE_GONE
To: Mike Rapoport <rppt@kernel.org>
Cc: x86@kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Andy Lutomirski <luto@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Borislav Petkov <bp@alien8.de>, Brendan Higgins <brendan.higgins@linux.dev>,
 Daniel Gomez <da.gomez@samsung.com>, Daniel Thompson <danielt@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, David Gow <davidgow@google.com>,
 Douglas Anderson <dianders@chromium.org>, Ingo Molnar <mingo@redhat.com>,
 Jason Wessel <jason.wessel@windriver.com>, Jiri Kosina <jikos@kernel.org>,
 Joe Lawrence <joe.lawrence@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Petr Mladek <pmladek@suse.com>, Rae Moar <rmoar@google.com>,
 Richard Weinberger <richard@nod.at>, Sami Tolvanen
 <samitolvanen@google.com>, Shuah Khan <shuah@kernel.org>,
 Song Liu <song@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>, kgdb-bugreport@lists.sourceforge.net,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-um@lists.infradead.org, live-patching@vger.kernel.org
References: <20250121095739.986006-1-rppt@kernel.org>
 <20250121095739.986006-7-rppt@kernel.org>
 <4a9ca024-fc25-4fe0-94d5-65899b2cec6b@suse.com> <Z5N0UVLTJrrK8evM@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <Z5N0UVLTJrrK8evM@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/24/25 12:06, Mike Rapoport wrote:
> On Thu, Jan 23, 2025 at 03:16:28PM +0100, Petr Pavlu wrote:
>> On 1/21/25 10:57, Mike Rapoport wrote:
>>> In order to use execmem's API for temporal remapping of the memory
>>> allocated from ROX cache as writable, there is a need to distinguish
>>> between the state when the module is being formed and the state when it is
>>> deconstructed and freed so that when module_memory_free() is called from
>>> error paths during module loading it could restore ROX mappings.
>>>
>>> Replace open coded checks for MODULE_STATE_UNFORMED with a helper
>>> function module_is_formed() and add a new MODULE_STATE_GONE that will be
>>> set when the module is deconstructed and freed.
>>
>> I don't fully follow why this case requires a new module state. My
>> understanding it that the function load_module() has the necessary
>> context that after calling layout_and_allocate(), the updated ROX
>> mappings need to be restored. I would then expect the function to be
>> appropriately able to unwind this operation in case of an error. It
>> could be done by having a helper that walks the mappings and calls
>> execmem_restore_rox(), or if you want to keep it in module_memory_free()
>> as done in the patch #7 then a flag could be passed down to
>> module_deallocate() -> free_mod_mem() -> module_memory_free()?
> 
> Initially I wanted to track ROX <-> RW transitions in struct module_memory
> so that module_memory_free() could do the right thing depending on memory
> state. But that meant either ugly games with const'ness in strict_rwx.c,
> an additional helper or a new global module state. The latter seemed the
> most elegant to me.
> If a new global module state is really that intrusive, I can drop it in
> favor a helper that will be called from error handling paths. E.g.
> something like the patch below (on top of this series and with this patch
> reverted)
> 
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index 7164cd353a78..4a02503836d7 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -1268,13 +1268,20 @@ static int module_memory_alloc(struct module *mod, enum mod_mem_type type)
>  	return 0;
>  }
>  
> +static void module_memory_restore_rox(struct module *mod)
> +{
> +	for_class_mod_mem_type(type, text) {
> +		struct module_memory *mem = &mod->mem[type];
> +
> +		if (mem->is_rox)
> +			execmem_restore_rox(mem->base, mem->size);
> +	}
> +}
> +
>  static void module_memory_free(struct module *mod, enum mod_mem_type type)
>  {
>  	struct module_memory *mem = &mod->mem[type];
>  
> -	if (mod->state == MODULE_STATE_UNFORMED && mem->is_rox)
> -		execmem_restore_rox(mem->base, mem->size);
> -
>  	execmem_free(mem->base);
>  }
>  
> @@ -2617,6 +2624,7 @@ static int move_module(struct module *mod, struct load_info *info)
>  
>  	return 0;
>  out_err:
> +	module_memory_restore_rox(mod);
>  	for (t--; t >= 0; t--)
>  		module_memory_free(mod, t);
>  	if (codetag_section_found)
> @@ -3372,6 +3380,7 @@ static int load_module(struct load_info *info, const char __user *uargs,
>  				       mod->mem[type].size);
>  	}
>  
> +	module_memory_restore_rox(mod);
>  	module_deallocate(mod, info);
>   free_copy:
>  	/*
>  

This looks better to me.

My view is that the module_state tracks major stages of a module during
its lifecycle. It provides information to the module loader itself,
other subsystems that need to closely interact with modules, and to the
userspace via the initstate sysfs attribute.

Adding a new state means potentially more complexity for all these
parts. In this case, the state was needed because of a logic that is
local only to the module loader, or even just to the function
load_module(). I think it is better to avoid adding a new state only for
that.

-- 
Thanks,
Petr

