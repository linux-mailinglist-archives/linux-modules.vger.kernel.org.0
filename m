Return-Path: <linux-modules+bounces-2275-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCFD9A5FBF
	for <lists+linux-modules@lfdr.de>; Mon, 21 Oct 2024 11:14:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B451A1C2154A
	for <lists+linux-modules@lfdr.de>; Mon, 21 Oct 2024 09:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E49EB1E2859;
	Mon, 21 Oct 2024 09:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="az3cDt+Z"
X-Original-To: linux-modules@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35561E25E6
	for <linux-modules@vger.kernel.org>; Mon, 21 Oct 2024 09:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729502039; cv=none; b=n0abZp0S2pDAo7MVxeZVctccg7jVn2zD/AAWQQ/kXgqrVbOT1o331TAqkMesjnmql3WoGGxcQo07kpgusISPTUQYVuMUlT55zpATxtqjILv/BiFq+VHa2+f/JQFGNdG4uuBCfOyxyAyeLSsGf3D7HNx4oRNAG3ZOkTHVAwe1Vu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729502039; c=relaxed/simple;
	bh=Qpok900RIq0lalZ/bvNPZcgfy2eFsV4ECXKYjvsFsZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X3E4JrJG6jaPT3vl/VBeKAeTaMQqzWc7Zh6sf8Mt77vANnIV3zq5XVYFv6HhsV5aL6dNBgJk2p/hDX/B33RtKt6LFd35dd/yfeibl9u7PRnohG3cvpM+bWloROxSYruhU33Kyw8F71+Wc8Hod1NARtE95EfsKbUJY+JX8oCikmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=az3cDt+Z; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729502036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=laNZkwIbOwCUsbOEzRR8/YU1OhJt9JdhAA++t+a3gVA=;
	b=az3cDt+ZxDHq8M+ejK5hdsiVoCJiE5RDy4wU2GjBBroij9ALfmMIJhMkPlRcFkf1FO5ziB
	qXsCEWaTh0AEwk9ZjGYyWGM47D1MOpYOVlArMw1O11Pt2BSVe859pPWhcIzDuW2UuvLVGX
	DqyTqr8icLqcJ7u5Fxwa2eHPBatW9Ug=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-WQ8Ebj-GN4iBY8TUQ0iOow-1; Mon, 21 Oct 2024 05:13:52 -0400
X-MC-Unique: WQ8Ebj-GN4iBY8TUQ0iOow-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-37d4854fa0eso2464120f8f.2
        for <linux-modules@vger.kernel.org>; Mon, 21 Oct 2024 02:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729502031; x=1730106831;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=laNZkwIbOwCUsbOEzRR8/YU1OhJt9JdhAA++t+a3gVA=;
        b=C6c07B51kOjyElI4LxBXdwQ9ZIqMk1+LhipqTUhFm36PVf4uVt5Q0a/kAFLfvuWJU0
         QBDaNy2Nna+MbDFlQyJn6MZbjBx+S1034gWlzm3V0AcZtg7I9JVGj8LI6fd/BSPnEvnZ
         LlIzSOTIrzRUAOiV7ajkSFyzFHkUF4N/A8rPJwUmzkkf4vWUZSxWaVIf9Hv1LGQkw6eA
         82+AgwLe3Pd4+fKx8SPUwGSY0BlKFRLRAuSa9ckMy2tYcR7+zkfMxqnhlo4A7AsSzI+0
         QEuYVokvr7WLPZtOq+KZOIgQl46lHm+eiW8JaRuVudDYePe5w6InwGweSGEITocTZSIC
         v/4g==
X-Forwarded-Encrypted: i=1; AJvYcCUn9opDp6yaVjb0JXR52ycfjpPI/INIQeuJvnkWen7WIXJA8G6NbxUUF8N4J5Ms8b+3Ce+A298PuNW1oxWj@vger.kernel.org
X-Gm-Message-State: AOJu0YwzZvsBHMNgN8XT83sNo7s96pTFcLezBVMcu6kp6C6fwy3aXKl6
	SF/aaURIowXk7MpiIKEkiCvyqeeKPSzrjyQeR9qhgGopaOksAYfdGm/qIm+jHYBD0nXRcLHcc+L
	ZXCoAezpriCnbg2si79/7kx1731nq/nhj2I6m3JNXvuCqTZeqvFCUmeTdROXOOBs=
X-Received: by 2002:a5d:60cd:0:b0:37d:52d0:a59d with SMTP id ffacd0b85a97d-37eab72732cmr6823869f8f.10.1729502031068;
        Mon, 21 Oct 2024 02:13:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGf2q3ct7vDUcpXfTgq4f/Ogs1pSXSIZFsokW+/dUVWCwOUrBI/1w/NWhFvrEEHU/F3TQLS9Q==
X-Received: by 2002:a5d:60cd:0:b0:37d:52d0:a59d with SMTP id ffacd0b85a97d-37eab72732cmr6823825f8f.10.1729502030651;
        Mon, 21 Oct 2024 02:13:50 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:36d3:2b96:a142:a05b? ([2a09:80c0:192:0:36d3:2b96:a142:a05b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b944fbsm3841034f8f.72.2024.10.21.02.13.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 02:13:50 -0700 (PDT)
Message-ID: <62a7eb3f-fb27-43f4-8365-0fa0456c2f01@redhat.com>
Date: Mon, 21 Oct 2024 11:13:48 +0200
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] alloc_tag: config to store page allocation tag
 refs in page flags
To: Michal Hocko <mhocko@suse.com>, Suren Baghdasaryan <surenb@google.com>
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
References: <cd848c5f-50cd-4834-a6dc-dff16c586e49@nvidia.com>
 <6a2a84f5-8474-432f-b97e-18552a9d993c@redhat.com>
 <CAJuCfpGkuaCh+PxKbzMbu-81oeEdzcfjFThoRk+-Cezf0oJWZg@mail.gmail.com>
 <9c81a8bb-18e5-4851-9925-769bf8535e46@redhat.com>
 <CAJuCfpH-YqwEi1aqUAF3rCZGByFpvKVSfDckATtCFm=J_4+QOw@mail.gmail.com>
 <ZxJcryjDUk_LzOuj@tiehlicka>
 <CAJuCfpGV3hwCRJj6D-SnSOc+VEe5=_045R1aGJEuYCL7WESsrg@mail.gmail.com>
 <ZxKWBfQ_Lps93fY1@tiehlicka>
 <CAJuCfpHa9qjugR+a3cs6Cud4PUcPWdvc+OgKTJ1qnryyJ9+WXA@mail.gmail.com>
 <CAJuCfpHFmmZhSrWo0iWST9+DGbwJZYdZx7zjHSHJLs_QY-7UbA@mail.gmail.com>
 <ZxYCK0jZVmKSksA4@tiehlicka>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
In-Reply-To: <ZxYCK0jZVmKSksA4@tiehlicka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Am 21.10.24 um 09:26 schrieb Michal Hocko:
> On Fri 18-10-24 14:57:26, Suren Baghdasaryan wrote:
>> On Fri, Oct 18, 2024 at 10:45 AM Suren Baghdasaryan <surenb@google.com> wrote:
>>>
>>> On Fri, Oct 18, 2024 at 10:08 AM Michal Hocko <mhocko@suse.com> wrote:
>>>
>>> Automatic fallback is possible during boot, when we decide whether to
>>> enable page extensions or not. So, if during boot we decide to disable
>>> page extensions and use page flags, we can't go back and re-enable
>>> page extensions after boot is complete. Since there is a possibility
>>> that we run out of page flags at runtime when we load a new module,
>>> this leaves this case when we can't reference the module tags and we
>>> can't fall back to page extensions, so we have to disable memory
>>> profiling.
>>> I could keep page extensions always on just in case this happens but
>>> that's a lot of memory waste to handle a rare case...
>>
>> After thinking more about this, I suggest a couple of changes that
>> IMHO would make configuration simpler:
>> 1. Change the CONFIG_PGALLOC_TAG_USE_PAGEFLAGS to an early boot
>> parameter.
> 
> This makes much more sense!
> 
>> Today we have a "mem_profiling" parameter to enable/disable
>> memory profiling. I suggest adding "mem_profiling_use_pgflags" to
>> switch the current behavior of using page extensions to use page
>> flags.
> 
> I do not want to bikeshed about this but to me it would make more sense
> to have an extension paramater to mem_profiling and call it something
> like compress or similar so that page flags are not really carved into
> naming. The docuemntation then can explain that the copression cannot be
> always guaranteed and it might fail so this is more of a optimistic and
> potentially failing optimization that might need to be dropped in some
> usege scenarios.

Maybe we can reuse the existing parameter (e.g., tristate). Only makes sense if 
we don't expect too many other modes though :)

> 
>> We keep the current behavior of using page extensions as
>> default (mem_profiling_use_pgflags=0) because it always works even
>> though it has higher overhead.
> 
> Yes this seems to be a safe default.

Agreed.

> 
>> 2. No auto-fallback. If mem_profiling_use_pgflags=1 and we don't have
>> enough page flags (at boot time or later when we load a module), we
>> simply disable memory profiling with a warning.

Sounds reasonable to me.

-- 
Cheers,

David / dhildenb


