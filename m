Return-Path: <linux-modules+bounces-3289-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9742A48251
	for <lists+linux-modules@lfdr.de>; Thu, 27 Feb 2025 16:03:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42D1E161257
	for <lists+linux-modules@lfdr.de>; Thu, 27 Feb 2025 14:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F4CF25E828;
	Thu, 27 Feb 2025 14:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Fqg/ltkd"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0F825E81D
	for <linux-modules@vger.kernel.org>; Thu, 27 Feb 2025 14:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740668148; cv=none; b=Kpsmx/aEgt424Dw1dDYcS10CaU/EoY9XbTRFuiTEgq2H512cepLkw3LsPrPHrzLu7WnLHDWrc3l9GU6Z8TuOp8+7cmN3wttLYDoRtGq6802O8y6KYaMRAXhbnMAgmDEfrW4XZYEwkGFwvjqrI0De4nbDo9TVxVtdgUVxwo56+QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740668148; c=relaxed/simple;
	bh=04lXeR5WeBp3P02ZTmd2NJbVMZs6V5xG2AeeQAtEf/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hg8MgzBoAh2ZKkjhSSdhWehhF/PD962Dy5Ea5DGmHA1E/Lhzw/I5nQ9uHqXTs/mTf0zJKrmlP/8IdA1LTcfxX8EhbC9LfiGSvA2TyaF+hf7ZOoISfzCuRBMBYPRDMNBUaOHnpIP30ewYcpmCTmiu5xnXRu1XcUAOkWsQto83ZhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Fqg/ltkd; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-abbdc4a0b5aso198366566b.0
        for <linux-modules@vger.kernel.org>; Thu, 27 Feb 2025 06:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740668144; x=1741272944; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=psgfZ9yFHMKvZ3U/C+2q+GvpOcP5tp1ObOW+btX8RAI=;
        b=Fqg/ltkd6PSJeUE7abpVtA6aBiszv2SBSCT+RX4iPpwiH011okRBd0f0DG22WIZuR7
         WXbcDl6A50tpf+avl672ZdjX/se7KDnwigleDSQWlfFoca3/QluNSz9rykKO9NBb2G00
         3F/0LJd4HzFtIsr3hqOLk0zzY9Hfv9W8EZlJjcfrtKDeN58OBT1ChtobkBdbeTAUKSmp
         u9dNMzGX5FMgym3wBAcW6p8LukuYT92O7LiawtTWr6n3medIrXvyPQuvlunCm6uo4tCu
         bZgR6M22Xkq+YOstbsrVcmdEE8xGDwTMKvNWnIvA+v06PhFey3ljycdPN8syN5ivhwjo
         f5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740668144; x=1741272944;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=psgfZ9yFHMKvZ3U/C+2q+GvpOcP5tp1ObOW+btX8RAI=;
        b=UensO14/CZLjYPZiTgsY07ssO+R8poZPhCWSi80XVjGcvzgPM3ftLXYkzFDcaQAbmB
         2+6TrUGdVgpqC8mBSvMtD7MpJKaIA2IdastjuQrif7fjgByxsB4nzqaoMNyZXm/H1UNx
         e6+dtuGf5xntom59nspBs2EzQxnO3AXuvcgC5fdq9l/FQCA2M+T1VeSOFhl8sOaE9Lzc
         oojrjqV1G+80RqsncfsHuY1ja3Id5QtHhLGJl8zKvS8JX5L8mwzv865Wmzj6nnO9xjnU
         dd9YS0C1i/Mhtz56LIMQxc3TZHf6eWtogIIm8eUN/bnY7IsfS4JAJ/fu7QQxCox2TJBT
         9QIA==
X-Forwarded-Encrypted: i=1; AJvYcCUQru7NP1q1pa3nJ2K2G+jI+F0sFGJlJRtHNDvjYJQJm+eU9Hb3yi8FVQIy9OMvkjaJ26uhKlpdAJQlI3OD@vger.kernel.org
X-Gm-Message-State: AOJu0YwPVZKXbs3C5L2ngnOknevzS30LILdDPB48Z9dheJwi/EEt1yKY
	9Mn90mA9Or/db/qrTtWD4zGIfTtiBz7QE6SYURpsV43ksffjVZ0s+hW72nUNsN8=
X-Gm-Gg: ASbGnct2z/baTAYRZs3iHaVCTOjCUcJ13/L3ib0F1+yNIZdXx8yybPLpCQXJ4DAeGY2
	Ap1+TI7OwTORh5xm00Df5oKr6vSt/Vg5rJLj7z6dCGPalFs19C6hJY65eqKwsN1+0TrRRGKZ32G
	cJoBNts6IFF44VJ+3/IvT/MCTp8lXMbpIGA2Bu4VFAoU2BWvt2LP4BAU29Y9QmNUPYFu39NLTkd
	/Bve+1UAXxeH7zW5TBYEG+KZm22vSmyrGEtAJQHTd/2AJHFYPi0dAM/LIv94laZrS0P+W4fwbM6
	lPDuzzNkZ/PZdaTBsKsPexMvI53Opw==
X-Google-Smtp-Source: AGHT+IHM3y5ddErBEWtI/Hb72dFlr7ja17jLO2hZ3jK+9ep11ghJNXBhohGfhuKxIG5xOI9T5kAR0A==
X-Received: by 2002:a17:906:6185:b0:abb:aa8f:c9cd with SMTP id a640c23a62f3a-abf062db58cmr468878666b.28.1740668144321;
        Thu, 27 Feb 2025 06:55:44 -0800 (PST)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0ba3dbsm134343466b.22.2025.02.27.06.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 06:55:43 -0800 (PST)
Message-ID: <aa7c1589-7c36-4721-b815-0ab065130b83@suse.com>
Date: Thu, 27 Feb 2025 15:55:42 +0100
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/6] rust: extend `module!` macro with integer
 parameter support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@samsung.com>,
 Sami Tolvanen <samitolvanen@google.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Adam Bratschi-Kaye <ark.email@gmail.com>, linux-kbuild@vger.kernel.org,
 Simona Vetter <simona.vetter@ffwll.ch>, Greg KH
 <gregkh@linuxfoundation.org>, linux-modules@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>
References: <JKqjFnoTeEbURcTQ5PpmUZWDS2VMEt0eZl68dWkgk3e8ROFpb2eTWH2mStKkkXJw__Ql5DdYvIR9I7qYks-lag==@protonmail.internalid>
 <20250218-module-params-v3-v7-0-5e1afabcac1b@kernel.org>
 <87ldtv1t1c.fsf@kernel.org> <0d9e596a-5316-4e00-862b-fd77552ae4b5@suse.com>
 <CANiq72nBK=HZ=ZL9bYhB8Z+U5QK3xmsQesO9axf_Fz0_1mWREA@mail.gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <CANiq72nBK=HZ=ZL9bYhB8Z+U5QK3xmsQesO9axf_Fz0_1mWREA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2/25/25 12:54, Miguel Ojeda wrote:
> On Tue, Feb 25, 2025 at 11:22 AM Petr Pavlu <petr.pavlu@suse.com> wrote:
>>
>> I'd say the easiest is for the entire series to go through the Rust
>> tree. I'd also propose that any updates go primarily through that tree
>> as well.
>>
>> Makes sense, I think it is useful for all changes to this code to be
>> looked at by both Rust and modules people. To that effect, we could add
>> the following under the MODULES SUPPORT entry:
>> F:      rust/kernel/module_param.rs
>> F:      rust/macros/module.rs
>>
>> My slight worry is that this might suggest the entirety of maintenance
>> is on the modules folks. Fortunately, adding the above and running
>> get_maintainer.pl on rust/kernel/module_param.rs gives me a list of
>> people for both Rust and modules, so this could be ok?
> 
> Up to you, of course -- a couple days ago (in the context of the
> hrtimer thread) I wrote a summary of the usual discussion we have
> around this (copy-pasting here for convenience):
> 
>     So far, what we have been doing is ask maintainers, first, if they
>     would be willing take the patches themselves -- they are the experts
>     of the subsystem, know what changes are incoming, etc. Some subsystems
>     have done this (e.g. KUnit). That is ideal, because the goal is to
>     scale and allows maintainers to be in full control.
> 
>     Of course, sometimes maintainers are not fully comfortable doing that,
>     since they may not have the bandwidth, or the setup, or the Rust
>     knowledge. In those cases, we typically ask if they would be willing
>     to have a co-maintainer (i.e. in their entry, e.g. like locking did),
>     or a sub-maintainer (i.e. in a new entry, e.g. like block did), that
>     would take care of the bulk of the work from them.
> 
>     I think that is a nice middle-ground -- the advantage of doing it like
>     that is that you get the benefits of knowing best what is going on
>     without too much work (hopefully), and it may allow you to get more
>     and more involved over time and confident on what is going on with the
>     Rust callers, typical issues that appear, etc. Plus the sub-maintainer
>     gets to learn more about the subsystem, its timelines, procedures,
>     etc., which you may welcome (if you are looking for new people to get
>     involved).
> 
>     I think that would be a nice middle-ground. As far as I understand,
>     Andreas would be happy to commit to maintain the Rust side as a
>     sub-maintainer (for instance). He would also need to make sure the
>     tree builds properly with Rust enabled and so on. He already does
>     something similar for Jens. Would that work for you?
> 
>     You could take the patches directly with his RoBs or Acked-bys, for
>     instance. Or perhaps it makes more sense to take PRs from him (on the
>     Rust code only, of course), to save you more work. Andreas does not
>     send PRs to anyone yet, but I think it would be a good time for him to
>     start learning how to apply patches himself etc.
> 
>     If not, then the last fallback would be putting it in the Rust tree as
>     a sub-entry or similar.
> 
>     I hope that clarifies (and thanks whatever you decide!).
> 
>     https://lore.kernel.org/rust-for-linux/CANiq72mpYoig2Ro76K0E-sUtP31fW+0403zYWd6MumCgFKfTDQ@mail.gmail.com/
> 
> Would any of those other options work for you?

From what I can see in this series, the bindings required adding
a number of generic functions to the Rust support code and also most
discussion revolved around that. I'm worried this might be the case also
for foreseeable future updates, until more building blocks are in place.
It then makes me think most changes to this code will need to go through
the Rust tree for now.

On the other hand, if the changes are reasonably limited to mostly
rust/kernel/module_param.rs and rust/macros/module.rs, then yes, I'd say
it should be ok to take the patches through the modules tree.

@Luis, Sami, Daniel, please shout if you see any problem with this.

-- 
Thanks,
Petr

