Return-Path: <linux-modules+bounces-2172-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5832499DF5D
	for <lists+linux-modules@lfdr.de>; Tue, 15 Oct 2024 09:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1842D28284E
	for <lists+linux-modules@lfdr.de>; Tue, 15 Oct 2024 07:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F6A71A7AF1;
	Tue, 15 Oct 2024 07:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y7g/43L2"
X-Original-To: linux-modules@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C673217DFE3
	for <linux-modules@vger.kernel.org>; Tue, 15 Oct 2024 07:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728977531; cv=none; b=ZUVfkAE3E3AEqVRZwKHzteQJqvlmFRcIaMWKf9ZLbFQiJwwYhYnvdKt6sWN3TQBVHuoZHjm+npwvCR75dYvoN930RFCc/etF1igufwpZWwrKnX6wyRvPPqO0cU/vK0M6yrXNlAp4m8HNrZWt7m605cCKmHa6w2Dd9CqRd+MSvtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728977531; c=relaxed/simple;
	bh=LtOtInp2pAms8+4cw9LP3+VTg1rg2WveoUioIQeElcI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s5/tx2lOnEz/USIGUBf+WnRoTseAk8zE0EhaIIMy/uZBP3Ws8VMiNqnPOx061gqkvM70B3ZjGc8S8Fw+j7/GReS8b7zF5nA+97HZQtzv8Pgql9JNviOwmwUCoUF9fg586hjR0P+PRqXBWEQOLqyv7ZiH5qO00TUZIVUqhNAlYLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y7g/43L2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728977528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nyE9B7hpHS+Vt34gnY1OmDu8BxYtxG3M/5VWTg5iT2I=;
	b=Y7g/43L22YnHUd/7ueZZ1GScdbOP4HPSkJZ19JcJLyiXM3rz3o9Pit1Q2iDbrmBlInSYQc
	tX2vZ30XpTJXQklLcZ2q24lI4oIWrg0Xbl4vMp8t/4x2cu9dkj+7WDiByOVXuyeU4l0FGc
	c5Foae0CLnfPTv15igc6yG0823ad6fU=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-yV0c1O3aMlu5rqfzORpfLQ-1; Tue, 15 Oct 2024 03:32:07 -0400
X-MC-Unique: yV0c1O3aMlu5rqfzORpfLQ-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-539fbf73a2fso1283658e87.2
        for <linux-modules@vger.kernel.org>; Tue, 15 Oct 2024 00:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728977524; x=1729582324;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nyE9B7hpHS+Vt34gnY1OmDu8BxYtxG3M/5VWTg5iT2I=;
        b=BsSzoN6JXsVHgd3ZPRgOEsWpUcwYACzPSGvOcnzzdGT2Dowl4FQb2JKDsN7KgIum+l
         i3cg+tLOmI/ENV+i99KDefco4voKVMcsL3ml9SSJCMfJjj/gNydBBLpN4MMxlPVEUhL0
         2w8QSC03mz07mknCMwDyUwiFCExwVvjsuFVmKQR0hIu3Dw0yOQJDK2cqM3AWVJtHP1M+
         BFNATTTCE+3u/2EetVyucSvN7e4iMdbjMUkg6E/kjmZLhKc8JdH4eMZF6fhZqH7wWE38
         o1U8zBh3frr6+DJjhSgKMm30KIZDmOAjLxyIq7MAQSS6ysAMn3RlssKjYHzGzbkbwMqm
         zkzw==
X-Forwarded-Encrypted: i=1; AJvYcCUJqeyCIZoIYilRVB6/hIoGXrnN+/MpVtImAmRxiAgWbzqNM6wJVZbaXmcXglYduzXKlJ/UV4OI3pJKsZSJ@vger.kernel.org
X-Gm-Message-State: AOJu0YywTrDEHGPkiHigpec7Eqd8qDKSO0jB4oDiCnDBkbrqnlPt0Qqb
	2xL3I+I2XWyYQZH2iZ2I9JilxOoq/5bm4G4G4MHyD4CGwNsvBpswHz2dUsqMfJWN+E8NniWdH+I
	f/t1C644pwVW4M5RFt2HY+lAVciJ9xQOs+OCXOz/MMlUzX+UdzTQakBWy1vEwrvI=
X-Received: by 2002:a05:6512:3b26:b0:52b:de5b:1b30 with SMTP id 2adb3069b0e04-539e573166dmr5316984e87.44.1728977524538;
        Tue, 15 Oct 2024 00:32:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZcIBtnyo7fVIGARq8By3CJHYUF1aICDo+0e1ZaipF2PWW33IBZ9UT9s1U9mblrwDccZYPiA==
X-Received: by 2002:a05:6512:3b26:b0:52b:de5b:1b30 with SMTP id 2adb3069b0e04-539e573166dmr5316936e87.44.1728977524005;
        Tue, 15 Oct 2024 00:32:04 -0700 (PDT)
Received: from ?IPV6:2003:cb:c730:9700:d653:fb19:75e5:ab5c? (p200300cbc7309700d653fb1975e5ab5c.dip0.t-ipconnect.de. [2003:cb:c730:9700:d653:fb19:75e5:ab5c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4313f6c4a41sm9185105e9.41.2024.10.15.00.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 00:32:03 -0700 (PDT)
Message-ID: <6a2a84f5-8474-432f-b97e-18552a9d993c@redhat.com>
Date: Tue, 15 Oct 2024 09:32:01 +0200
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] alloc_tag: config to store page allocation tag
 refs in page flags
To: John Hubbard <jhubbard@nvidia.com>, Yosry Ahmed <yosryahmed@google.com>,
 Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, corbet@lwn.net,
 arnd@arndb.de, mcgrof@kernel.org, rppt@kernel.org, paulmck@kernel.org,
 thuth@redhat.com, tglx@linutronix.de, bp@alien8.de,
 xiongwei.song@windriver.com, ardb@kernel.org, vbabka@suse.cz,
 mhocko@suse.com, hannes@cmpxchg.org, roman.gushchin@linux.dev,
 dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com,
 pasha.tatashin@soleen.com, souravpanda@google.com, keescook@chromium.org,
 dennis@kernel.org, yuzhao@google.com, vvvvvv@google.com,
 rostedt@goodmis.org, iamjoonsoo.kim@lge.com, rientjes@google.com,
 minchan@google.com, kaleshsingh@google.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-modules@vger.kernel.org, kernel-team@android.com
References: <20241014203646.1952505-1-surenb@google.com>
 <20241014203646.1952505-6-surenb@google.com>
 <CAJD7tkY0zzwX1BCbayKSXSxwKEGiEJzzKggP8dJccdajsr_bKw@mail.gmail.com>
 <cd848c5f-50cd-4834-a6dc-dff16c586e49@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63XOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <cd848c5f-50cd-4834-a6dc-dff16c586e49@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15.10.24 01:53, John Hubbard wrote:
> On 10/14/24 4:48 PM, Yosry Ahmed wrote:
>> On Mon, Oct 14, 2024 at 1:37 PM Suren Baghdasaryan <surenb@google.com> wrote:
>>>
>>> Add CONFIG_PGALLOC_TAG_USE_PAGEFLAGS to store allocation tag
>>> references directly in the page flags. This eliminates memory
>>> overhead caused by page_ext and results in better performance
>>> for page allocations.
>>> If the number of available page flag bits is insufficient to
>>> address all kernel allocations, profiling falls back to using
>>> page extensions with an appropriate warning to disable this
>>> config.
>>> If dynamically loaded modules add enough tags that they can't
>>> be addressed anymore with available page flag bits, memory
>>> profiling gets disabled and a warning is issued.
>>
>> Just curious, why do we need a config option? If there are enough bits
>> in page flags, why not use them automatically or fallback to page_ext
>> otherwise?
> 
> Or better yet, *always* fall back to page_ext, thus leaving the
> scarce and valuable page flags available for other features?
> 
> Sorry Suren, to keep coming back to this suggestion, I know
> I'm driving you crazy here! But I just keep thinking it through
> and failing to see why this feature deserves to consume so
> many page flags.

My 2 cents: there is nothing wrong about consuming unused page flags in 
a configuration. No need to let them stay unused in a configuration :)

The real issue starts once another feature wants to make use of some of 
them ... in such configuration there would be less available for 
allocation tags and the performance of allocations tags might 
consequently get worse again.

-- 
Cheers,

David / dhildenb


