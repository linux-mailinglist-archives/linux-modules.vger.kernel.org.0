Return-Path: <linux-modules+bounces-2279-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2776B9A6EB9
	for <lists+linux-modules@lfdr.de>; Mon, 21 Oct 2024 17:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D68B1F22C9E
	for <lists+linux-modules@lfdr.de>; Mon, 21 Oct 2024 15:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89161CC15E;
	Mon, 21 Oct 2024 15:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dpXoFcbV"
X-Original-To: linux-modules@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41BB1CB521
	for <linux-modules@vger.kernel.org>; Mon, 21 Oct 2024 15:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729525797; cv=none; b=pVdmcTbPE3WbLOzXlzqbGPa4eSRWg46EhVyCDU32b4BDTbXvyVPNDlV/s8juzXjlv54je9wmsSm9trsDC7FR0hPHutTRHA6aT8wa0PfiU4q4jK2WUsbfioZ7HCQh00VQ+iq4k6S5MXMk/zrmU8SZoo8lDGErHD8oHbYQ8HGyR1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729525797; c=relaxed/simple;
	bh=19WLTpYWJkGRmLSsj50kcsAeG7szpGXaFhGZH2s9wjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tegN4DzNe8QSW0CdCW+DaNKMIS8aTb8aAwUQ+X3HqwCxqGKJqIVobRX2qHhCf92mzcrAkkTLnfj/GL0mL7eAQjJ9OR0qUbYgp9XIlAKef4S0tKbS+bGd2h/KYTsLSStFlDNdnogjVDEgn3vvRhQ6QJNQeA4PnpKc9gQq1g3LWsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dpXoFcbV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729525794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=efcXjh+m4lj41VC8CVaT7/IlXAp2xnsDsUqQOW0CtfM=;
	b=dpXoFcbVSb+jPraWdZWS3DM1yMBrOhRPeVPuOUxsjwmpOsl70o9goYcWYKWwzwKGECmRnF
	FYecyZhEom2HcgVFYksGyVXhP1sK9NgKuE4sUggyXQeJDFxmYTVoqElnZZ3wAM0tBCgKNk
	08swsaRYXtA9eJruxurWdVn1MSyK/lI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-oKWPvFrbMk6CSX6Lugr7-w-1; Mon, 21 Oct 2024 11:49:39 -0400
X-MC-Unique: oKWPvFrbMk6CSX6Lugr7-w-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4314f1e0f2bso31848835e9.1
        for <linux-modules@vger.kernel.org>; Mon, 21 Oct 2024 08:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729525778; x=1730130578;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=efcXjh+m4lj41VC8CVaT7/IlXAp2xnsDsUqQOW0CtfM=;
        b=lLRbGY5nJK5vpN6wyuDHayX3x+kkslosbrcxe/HTonhXtegt7FJ5E0ts+dauZpMnqa
         gZHazdJn0m8BTb83rs4MEjcYGzPJXCNIaYcNp9FzSgcTR5TWgZ6HO8Mc9i+41Hqq0k3L
         qq8mgepHEJde6MOmMmHnSKR8/iYN74byOo+roRWjexGQRiSC2lO42QniZsTlXIBrOrig
         YChrIusujdFwaSZcM1UMPM1F2fVqb7mGiuxWZ/qXCoRaAfF2QwXmLC+qN+uJq5KLhCTt
         FXC8K4Ph2Pi0hnk37p8KmKoitbrj5O3nl/6tCwc2LfSiCjnGY2uo/cIvGW+f7gr935vT
         gk3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7fuK4KVQ6Mt5olCGoYo9mwlbc7HlQJtRaC7O4a4/kIsnYsr3Cr5RCT5MsYLVUXTN9FVJXnn7dN1r6jzsQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwKWr/pENW2cb0KBObLpR2DnRYTRomCHCorUUxrYKMtxxnM/kcL
	QJnj+CQMtpkUykUB4C9dHdvFsUJLHKLiuWip/EgwoRgm47y2oa95n9f/cjhWiQw/TyQkgsArozO
	iCcpdnaJ5goYJ7YcwZ4uD2WLHiSgBfeRZtuib2wSxQGIDCH4rpLp7PUI5tjkBYNs=
X-Received: by 2002:a5d:4fd0:0:b0:37d:4cee:55b with SMTP id ffacd0b85a97d-37eab742f2emr7733847f8f.59.1729525778325;
        Mon, 21 Oct 2024 08:49:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQW/lPtX5ZaJBI46W/Xfc+ktzjvzoS3kEq/NZAdwet1X5hc2QGUN9hZx5Rm1AB6r8VqB0rCw==
X-Received: by 2002:a5d:4fd0:0:b0:37d:4cee:55b with SMTP id ffacd0b85a97d-37eab742f2emr7733826f8f.59.1729525777829;
        Mon, 21 Oct 2024 08:49:37 -0700 (PDT)
Received: from [192.168.3.141] (p5b0c6747.dip0.t-ipconnect.de. [91.12.103.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a4b26dsm4625630f8f.45.2024.10.21.08.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 08:49:37 -0700 (PDT)
Message-ID: <f2dada61-0e20-48b1-bb2f-9c9f02583005@redhat.com>
Date: Mon, 21 Oct 2024 17:49:35 +0200
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] alloc_tag: config to store page allocation tag
 refs in page flags
To: Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Yosry Ahmed <yosryahmed@google.com>,
 akpm@linux-foundation.org, kent.overstreet@linux.dev, corbet@lwn.net,
 arnd@arndb.de, mcgrof@kernel.org, rppt@kernel.org, paulmck@kernel.org,
 thuth@redhat.com, tglx@linutronix.de, bp@alien8.de,
 xiongwei.song@windriver.com, ardb@kernel.org, vbabka@suse.cz,
 hannes@cmpxchg.org, roman.gushchin@linux.dev, dave@stgolabs.net,
 willy@infradead.org, liam.howlett@oracle.com, pasha.tatashin@soleen.com,
 souravpanda@google.com, keescook@chromium.org, dennis@kernel.org,
 yuzhao@google.com, vvvvvv@google.com, rostedt@goodmis.org,
 iamjoonsoo.kim@lge.com, rientjes@google.com, minchan@google.com,
 kaleshsingh@google.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-modules@vger.kernel.org, kernel-team@android.com
References: <9c81a8bb-18e5-4851-9925-769bf8535e46@redhat.com>
 <CAJuCfpH-YqwEi1aqUAF3rCZGByFpvKVSfDckATtCFm=J_4+QOw@mail.gmail.com>
 <ZxJcryjDUk_LzOuj@tiehlicka>
 <CAJuCfpGV3hwCRJj6D-SnSOc+VEe5=_045R1aGJEuYCL7WESsrg@mail.gmail.com>
 <ZxKWBfQ_Lps93fY1@tiehlicka>
 <CAJuCfpHa9qjugR+a3cs6Cud4PUcPWdvc+OgKTJ1qnryyJ9+WXA@mail.gmail.com>
 <CAJuCfpHFmmZhSrWo0iWST9+DGbwJZYdZx7zjHSHJLs_QY-7UbA@mail.gmail.com>
 <ZxYCK0jZVmKSksA4@tiehlicka>
 <62a7eb3f-fb27-43f4-8365-0fa0456c2f01@redhat.com>
 <CAJuCfpE_aSyjokF=xuwXvq9-jpjDfC+OH0etspK=G6PS7SvMFg@mail.gmail.com>
 <ZxZ0eh95AfFcQSFV@tiehlicka>
 <CAJuCfpGHKHJ_6xN4Ur4pjLgwTQ2QLkbWuAOhQQPinXNQVONxEA@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CAJuCfpGHKHJ_6xN4Ur4pjLgwTQ2QLkbWuAOhQQPinXNQVONxEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21.10.24 17:41, Suren Baghdasaryan wrote:
> On Mon, Oct 21, 2024 at 8:34 AM Michal Hocko <mhocko@suse.com> wrote:
>>
>> On Mon 21-10-24 08:05:16, Suren Baghdasaryan wrote:
>> [...]
>>> Yeah, I thought about adding new values to "mem_profiling" but it's a
>>> bit complicated. Today it's a tristate:
>>>
>>> mem_profiling=0|1|never
>>>
>>> 0/1 means we disable/enable memory profiling by default but the user
>>> can enable it at runtime using a sysctl. This means that we enable
>>> page_ext at boot even when it's set to 0.
>>> "never" means we do not enable page_ext, memory profiling is disabled
>>> and sysctl to enable it will not be exposed. Used when a distribution
>>> has CONFIG_MEM_ALLOC_PROFILING=y but the user does not use it and does
>>> not want to waste memory on enabling page_ext.
>>>
>>> I can add another option like "pgflags" but then it also needs to
>>> specify whether we should enable or disable profiling by default
>>> (similar to 0|1 for page_ext mode). IOW we will need to encode also
>>> the default state we want. Something like this:
>>>
>>> mem_profiling=0|1|never|pgflags_on|pgflags_off
>>>
>>> Would this be acceptable?
>>
>> Isn't this overcomplicating it? Why cannot you simply go with
>> mem_profiling={0|never|1}[,$YOUR_OPTIONS]
>>
>> While $YOUR_OPTIONS could be compress,fallback,ponies and it would apply
>> or just be ignored if that is not applicable.
> 
> Oh, you mean having 2 parts in the parameter with supported options being:
> 
> mem_profiling=never
> mem_profiling=0
> mem_profiling=1
> mem_profiling=0,pgflags
> mem_profiling=1,pgflags
> 

That's also a viable solution indeed.

-- 
Cheers,

David / dhildenb


