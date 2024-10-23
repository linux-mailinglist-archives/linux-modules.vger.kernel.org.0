Return-Path: <linux-modules+bounces-2333-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 986539AD3F3
	for <lists+linux-modules@lfdr.de>; Wed, 23 Oct 2024 20:29:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 442FC284677
	for <lists+linux-modules@lfdr.de>; Wed, 23 Oct 2024 18:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03EE61D0E13;
	Wed, 23 Oct 2024 18:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="l41O1iFV"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D6D1D0957
	for <linux-modules@vger.kernel.org>; Wed, 23 Oct 2024 18:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729708174; cv=none; b=tgUwNcekyNyCQg3UzPL0rRKbODzpKyR0vhl+Gh/TD1V6Rgpf8Lr5ZCJaax1I2kNwzM9JkcNsul0V3LjoDMWReeruFaE4/9buLY7zz3IGj0VlTUv3pT1J4lof1cXLrL1KVnX6MgGdw8d5MmTq/bxoK/Oc1xRmjFHc0Usg08yyq4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729708174; c=relaxed/simple;
	bh=YhPnAykY09uvgHUZD+9d/UbZg3530EutzeGDcUlZqBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MPon2FfYSGHT65SzJjJadJycw3WVcwNiRfxljnlfoCw8PKlJXSejjOGaqa5cHyREDpYgBGEDgCJrDdIWRC3PB3ERhFdDZ4h1cH6eJxLf+GC3x1wPhtAdWzVQSezLYEn3hzRHBQlkt6ejMbGi5C3CplbL1rMG/q4UK8LG8pJZ/tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=l41O1iFV; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b155cca097so9816285a.1
        for <linux-modules@vger.kernel.org>; Wed, 23 Oct 2024 11:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1729708172; x=1730312972; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YhPnAykY09uvgHUZD+9d/UbZg3530EutzeGDcUlZqBw=;
        b=l41O1iFVAutM2hz7AGWo/j6xOhU2PFxEx3MEZgiIdS1XCq8chZmIyY+pa137USSA72
         wBm4IkA64jiTRSMqaXveII1QTDyGbG361pd8P8q+P3Q9/12va0P/2LxDr6rxDoy4EjJj
         S953rHYLlQp6cDidA7++Ho7HkFeyDwoeXh2UYzwhikaMMfJtK/tCSr1EqdenurZjynxy
         L9o/xzIc52UvRHV6MAtS88SejRaNR+dFjKRrDq+u1D94aNnkYb1FHngQrY8u+TzKbEw0
         5LgxCA2TWPGcqqvixL4/vSbYrMqlMoQoFj3roXHKF6uhjjh7xJZ6GUQY8VUSCYnqhcBR
         2tWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729708172; x=1730312972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YhPnAykY09uvgHUZD+9d/UbZg3530EutzeGDcUlZqBw=;
        b=ljdYsTEb0PKpcpITzp4r3Ajp84PZW1NGIEIAXKn2GTgsVnlJDPFQimKNa51MHorME7
         vvwky9rIvpTfWSDh1eFXedf/uXJ0DRAmsAFHDSMU7jOr/pz3mKycSyZVSw3ciHdOEZI7
         Si4oNLww9ZbJN8wo3IxyAAmMpXf1vq2pYiuUSwfM6EkUhjD57IPnM+IOnXXv+TXT4ziH
         2B8svZgg7h0tWi/U9tLItevNfGUnjAaobYoJmmFanNBfH0S/qY0MKNgLWTHsdAt47+AE
         hX4HbxOL8R2BPE7HJ6pRYYCAm6TR2wA1or6Wj8UdtTd33IpHyKhkcmOG50bgGeQLDNy3
         2z2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUGUaG++zKpuhqf3f6AYjiWuNLM2Kv0bdGGGyZcOEIHZN3LowdAIpvV0KMunvk+fxGWlAPHNon0k5FB48RC@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4RjEHN//840+Ghbz5BlulY7Ivu3tkMD5+cpRkajDMXrWvVS7l
	MruF1CsSnxqMbi8TroyIij3yAgfSujfsaDQLbAoVC2BIH+oF8mvSOnUrI+aPhBJOv1lePxbwN69
	HmlY7YVLpU3pVNW/0DKzxdzw0VFaDhXTkYKYZcA==
X-Google-Smtp-Source: AGHT+IHN7Nn8TYgf6aogO4v+tavfp3Kp07Bk8F4db26KNztW0AXCpL0TnRtSVX9bTG1k+0/2LMpyl/hzTzQRoJaHQbk=
X-Received: by 2002:a05:620a:1994:b0:7ac:b95b:7107 with SMTP id
 af79cd13be357-7b175583433mr1343572285a.12.1729708172364; Wed, 23 Oct 2024
 11:29:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023170759.999909-1-surenb@google.com> <20241023170759.999909-5-surenb@google.com>
In-Reply-To: <20241023170759.999909-5-surenb@google.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 23 Oct 2024 14:28:54 -0400
Message-ID: <CA+CK2bD9UQsh8224QqTTAQ_Ybz23BE-DFeubLkf41psXBsMA=A@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] alloc_tag: populate memory for module tags as needed
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, corbet@lwn.net, 
	arnd@arndb.de, mcgrof@kernel.org, rppt@kernel.org, paulmck@kernel.org, 
	thuth@redhat.com, tglx@linutronix.de, bp@alien8.de, 
	xiongwei.song@windriver.com, ardb@kernel.org, david@redhat.com, 
	vbabka@suse.cz, mhocko@suse.com, hannes@cmpxchg.org, roman.gushchin@linux.dev, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	souravpanda@google.com, keescook@chromium.org, dennis@kernel.org, 
	jhubbard@nvidia.com, urezki@gmail.com, hch@infradead.org, petr.pavlu@suse.com, 
	samitolvanen@google.com, da.gomez@samsung.com, yuzhao@google.com, 
	vvvvvv@google.com, rostedt@goodmis.org, iamjoonsoo.kim@lge.com, 
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	maple-tree@lists.infradead.org, linux-modules@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 1:08=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> The memory reserved for module tags does not need to be backed by
> physical pages until there are tags to store there. Change the way
> we reserve this memory to allocate only virtual area for the tags
> and populate it with physical pages as needed when we load a module.
>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

