Return-Path: <linux-modules+bounces-1883-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 248A09683D8
	for <lists+linux-modules@lfdr.de>; Mon,  2 Sep 2024 11:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEEC028029B
	for <lists+linux-modules@lfdr.de>; Mon,  2 Sep 2024 09:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8A21D2F4B;
	Mon,  2 Sep 2024 09:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BVi0Da/2"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75A61C3314
	for <linux-modules@vger.kernel.org>; Mon,  2 Sep 2024 09:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725271036; cv=none; b=Sq1PJY0MYguKcuR24cBk0elUySBqPDJplxKqTFU/uzE60J5WxwbY1gIpVLjsfuAu0TWw8U2kIFCLZeOKa7ikjAg7+PvBv7CSwQPxjs/A9WItIymH9qQctMTAIW92dq3JwQKMPq8XEnMkE7UbbdKBC8cj9kGA5VRItFHiThxGyh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725271036; c=relaxed/simple;
	bh=azrlqXQHeE9U6sT5l2klpYX/5FeFDtmF4VwChR6aHvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BTqNKQxHt9cs7GFN7+3HS7Ex7ASXNgDv1eGjNKUnf1Z4OQCbqGdZqKhgMG9XvvfS6vOw7ijewsxgQxjMM6JNw23z1kqSWwt9bKlfLkdXeAsZp12e8y7cI3syNRL4SujeQP23KRIdVrp9NMKEoZ1h8iGK+QtkBQoBOUp0QWIuRP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BVi0Da/2; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f3e071eb64so55469611fa.1
        for <linux-modules@vger.kernel.org>; Mon, 02 Sep 2024 02:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725271033; x=1725875833; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yjsZv7veQRgQQOgF16n7lr/LWeiZhMmKVsEed9iOcZQ=;
        b=BVi0Da/25t3SwHmcVZ6lPp0M3a94OPnlzqPrUx/ManSaBaiHDKjpwq9TzXNy5m5PqI
         i4uBewQyVAsQB1ZSexGA9QMWBYH23jAlTL+j//8ZUn1ZuTW2Je7wk5t5rzVfXjuvDPjs
         6eglK3f1QgsBX+nw4aj7L2akOV8dmJhS4C52l9amoKInYCh2933BkMW0ze2CK02NyE8u
         v0H6pVzs4P7N+4dUy5U4LpLrSsfqUf0akJY6AeS/0PsN2Vp2wNtNhyVIENc6XTqFEDC8
         S3+rVAH+Ms3hOMxEBoWg11DmHh7QqWqPYfmCArTBlc48+TgwTG08yuxuz8wjBs6i9v32
         qXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725271033; x=1725875833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yjsZv7veQRgQQOgF16n7lr/LWeiZhMmKVsEed9iOcZQ=;
        b=SqKhRy0zg6SrD9YevxOfvKnH3EucEYi1QAq8XHOz8z/uHTNn53XGRdl2usPcD9dC9O
         QriPKTEEywh56/QcZIgMKEHP25aLAaaIBkLLMr6BTA1wJ1n1/7GKPF4jz4n0vmbkpfvg
         PTOhA5ESyG/HYQUXs7BFfFKTOqhscvNgvwM1zHIRa8hl5fzT/Uqbl//+wFK04YD7zmZJ
         58jXtJpugtwRuKVfRrAWOL2aLJaMzsqGmueJw0ZnnfnTO3JbfOLVOHUbog3uTk5gSYJv
         5cOmAQVEXKHVmcTIdqgTfjSTb8x4E26aTd+GuqTI3VVkjtjQHEu+nfaqfoLMS+mnNKKk
         DRGw==
X-Forwarded-Encrypted: i=1; AJvYcCWhgPpVmo+tybqCxwRpNpKu99pU16N2l+Rz0g8yL4gMmvgW7nSYlQ9nYVZbTetEI1HdZeh2FOZLjg7SxaTY@vger.kernel.org
X-Gm-Message-State: AOJu0YxA1ApsAUqUtMNVsoIaFPKwcbp1jad7d6UskMQZSEhSW8JilYRi
	eEz1NEWbdyYjGuXsswc9YUM4xogmxDHz3uvBGxaZOcNGiofeQ+UyvrFM6vDXA0w=
X-Google-Smtp-Source: AGHT+IH7z8FryQZ6mKwNMkGnRP2RrSvLwrgspXmgco9jQNTg8+KhqeedDLVTW9djucaR8HYMG7P+gw==
X-Received: by 2002:a05:651c:19a3:b0:2ef:c8a1:ff4 with SMTP id 38308e7fff4ca-2f6105c49a9mr116896891fa.7.1725271032683;
        Mon, 02 Sep 2024 02:57:12 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c7bf90sm5031726a12.43.2024.09.02.02.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 02:57:12 -0700 (PDT)
Message-ID: <20420395-28ed-4579-84e1-4f7e7641363e@suse.com>
Date: Mon, 2 Sep 2024 11:57:11 +0200
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/19] Implement DWARF modversions
To: Sami Tolvanen <samitolvanen@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>,
 Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>,
 Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
 Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <CAK7LNAQ0dHq3eALkvGDSCyVKOvhBqwCEG3BTQ0h52Xq_1YNu2A@mail.gmail.com>
 <20240828225302.GH2130480@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20240828225302.GH2130480@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/29/24 00:53, Sami Tolvanen wrote:
> On Wed, Aug 28, 2024 at 04:04:09PM +0900, Masahiro Yamada wrote:
>> On Fri, Aug 16, 2024 at 2:39 AM Sami Tolvanen <samitolvanen@google.com> wrote:
>>> - Added a --symtypes flag for generating a genksyms-style
>>>   symtypes output based on Petr's feedback, and refactored
>>>   symbol version calculations to be based on symtypes instead
>>>   of raw --dump-dies output.
>>
>>
>>
>> I do not know if this is worthwhile.
> 
> Greg, Petr, do you want to comment on the usefulness of the symtypes
> output? I was under the impression it was a useful tool for figuring
> out exactly what caused the versions to change?

Right, the symtypes data is useful if distributions wish to maintain
stable kABI for their kernels. The data can be compressed/consolidated
and stored together with the source code for the distribution kernel,
serving as a reference kABI. Later, when the kernel is updated and CRCs
of some symbols change, the reference can be compared with the new
symtypes data to understand what has actually changed.

The previous discussion was under v1 of the series:
https://lore.kernel.org/linux-modules/0b2697fd-7ab4-469f-83a6-ec9ebc701ba0@suse.com/t/#u

-- 
Cheers,
Petr

