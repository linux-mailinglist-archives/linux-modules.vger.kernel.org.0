Return-Path: <linux-modules+bounces-2891-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBD3A00298
	for <lists+linux-modules@lfdr.de>; Fri,  3 Jan 2025 03:06:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E2031883C38
	for <lists+linux-modules@lfdr.de>; Fri,  3 Jan 2025 02:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C02154BF0;
	Fri,  3 Jan 2025 02:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="G/S+fHVn"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0581DFD1
	for <linux-modules@vger.kernel.org>; Fri,  3 Jan 2025 02:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735869975; cv=none; b=NlhrkJMeS5bernR2DX8a/vjmX5CaMjij0cfdjepdcq0Kfk1qAHBBPB3kssAKt0E21gRKE3XGg9ZFOJb8JAwvYdoxtbtHwktzA9HQbTqTHaASdu9V9Stnl+U7GqhJZMFmzSdbDqKKkKU22PkEzKHlwwTXGfu0HhDZRMqHJv5Wzsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735869975; c=relaxed/simple;
	bh=6XxDgsDh63Hd8YUnQX8bX7YEs2+jNWGRYTJCUK51Cww=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=RqW5BU+GHwJrJSkucU0yvKmDCm7z0wdkMrte/TbUj7EfBQnxDtc/+s5fFvKkJHi1Wib435QcDCP4ngzfcdyw+0duEASK0ac3vEY7gCjvDJWnFE4LnUAwtuNOViMBYC21xK+vWKziosCcmZx6rktGa/AuNK2BcNdPkwpfkDYJmQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=G/S+fHVn; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4361815b96cso78225005e9.1
        for <linux-modules@vger.kernel.org>; Thu, 02 Jan 2025 18:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1735869973; x=1736474773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6XxDgsDh63Hd8YUnQX8bX7YEs2+jNWGRYTJCUK51Cww=;
        b=G/S+fHVnbWbAONAVtd22PAE7Z4zPtYI2bW4ZzxfdiSoyogWRlo2abTDF8AIywIvBNg
         6yZ3ivx3x4QmptrRicoEDyvh7xIe7gMxkbkk1WRPEkIzgbdP1mQfPqL58ZRquBhfYizb
         4dboeaE/d4Q0tjFPPRjW9hU4HrznyoWDRb9fM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735869973; x=1736474773;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XxDgsDh63Hd8YUnQX8bX7YEs2+jNWGRYTJCUK51Cww=;
        b=HK4uRsUJNL2aMU9MEaxmAy5WZf6/vchCMjCLKdGY9H8k7pIvLDCkKPTqaA+TJniMt1
         MxJ4l1IJK6KZAMgca3oicSpF5vaB55a5pV6GYff42qvP0rf9kNGcDue6+Z6RBEos+yL1
         YgFdyLz0Qw/2bJzzNaOilELst7Hcbj4WzAQYUW+TMD00ZHXyCpZxka+4QWmq1q+FqgdP
         uUgcIczVaToS1DVMqtjQ9VZqiSrBzJbH7PmJKU8W3XaP+1FGKhpQJ5hdoLVH6KHj6ctN
         yZGlZXQCjX1Duxaa2iuCn4TynPKZHwy97F7oITZtuAo60YKgDKe82+3gZeDuFM3rufhI
         vm4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXmkQxa0bS2qxJVsV3xCuA+OZsxmzwqVeFe4ESvWlDHkYvyoRXhW5Vrxxq4p8jmA79TtUpizyYznDJQgVAT@vger.kernel.org
X-Gm-Message-State: AOJu0YxsPv7g/fC21bNW43I5/qDWG3oGCwkDBQ2BuGypPZRTXm4ODQQn
	BLGpC1OTCOHA5VbVen8U8yRrKP8J0dQewaNa3uxUW+aWeMioCQIW2la8w+niRSE=
X-Gm-Gg: ASbGncsBSW4e8uoUVd0vWAM1mlbkojH7uNSqsH3Q5sWHYaLlacU9wKnRc0Ib1YsuPfd
	k49R8jaXt6+uULGeKTQxJT5fTlfy7BSoK0biBD2IRdZXLaNk+DGqIrhj4lzavqUvRCpHtWWaM1b
	brSvHYHADioP3nAvm2FoBPDTjxFgjDJruaZdawpfaAC6X3jKM0vLAreN+E/Rgkb/4DrVFsm+MlA
	qrnSCwaChXOL14DsEz/IwIcqZBJHZZ7Ik2M1M5TgPyiqt9WlxsLoPNfYrUVWEq+1JfomquVhhOY
	EgOTfHPMzCZ4YzXCUhur
X-Google-Smtp-Source: AGHT+IFX7s7OIdyOwqMqiHQ7Dij0fiev/6kDOgtgCa70BnwOXZiReSdRdJxFbmyfksFhQWRa5CI5/Q==
X-Received: by 2002:a05:600c:1c09:b0:434:9e46:5bc with SMTP id 5b1f17b1804b1-43668643750mr507478795e9.10.1735869972697;
        Thu, 02 Jan 2025 18:06:12 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c508sm468771585e9.33.2025.01.02.18.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 18:06:12 -0800 (PST)
Message-ID: <d48193a3-65fe-4aa9-98f6-dd5869bd9127@citrix.com>
Date: Fri, 3 Jan 2025 02:06:10 +0000
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: lorenzo.stoakes@oracle.com
Cc: akpm@linux-foundation.org, anton.ivanov@cambridgegreys.com, bp@alien8.de,
 brendan.higgins@linux.dev, da.gomez@samsung.com, danielt@kernel.org,
 dave.hansen@linux.intel.com, davidgow@google.com, dianders@chromium.org,
 hpa@zytor.com, jason.wessel@windriver.com, jikos@kernel.org,
 joe.lawrence@redhat.com, johannes@sipsolutions.net, jpoimboe@kernel.org,
 kgdb-bugreport@lists.sourceforge.net, kirill.shutemov@linux.intel.com,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-um@lists.infradead.org, live-patching@vger.kernel.org,
 luto@kernel.org, mark.rutland@arm.com, mbenes@suse.cz, mcgrof@kernel.org,
 mhiramat@kernel.org, mingo@redhat.com, peterz@infradead.org,
 petr.pavlu@suse.com, pmladek@suse.com, richard@nod.at, rmoar@google.com,
 rostedt@goodmis.org, rppt@kernel.org, samitolvanen@google.com,
 shuah@kernel.org, song@kernel.org, tglx@linutronix.de, x86@kernel.org,
 Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <86eba318-464b-4b9b-a79e-64039b17be34@lucifer.local>
Subject: Re: [PATCH 6/8] modules: switch to execmem API for remapping as RW
 and restoring ROX
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <86eba318-464b-4b9b-a79e-64039b17be34@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> Hi Mike,
>
> This commit is making my intel box not boot in mm-unstable :>) I bisected it to
> this commit.

For what it's worth, we've found the same under Xen too.

There's one concrete bug in the series, failing to cope with the absence
of superpages (fix in
https://lore.kernel.org/xen-devel/6bb03333-74ca-4c2c-85a8-72549b85a5b4@suse.com/
but not formally posted yet AFAICT).

The rest of the thread then found a crash looking to be the same as
reported here, but you've made better progress narrowing it down than we
have.

~Andrew

