Return-Path: <linux-modules+bounces-192-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B210D7E68D6
	for <lists+linux-modules@lfdr.de>; Thu,  9 Nov 2023 11:52:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17D38280F7E
	for <lists+linux-modules@lfdr.de>; Thu,  9 Nov 2023 10:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCB8B107BB;
	Thu,  9 Nov 2023 10:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gsccuNL9"
X-Original-To: linux-modules@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B97BD2F3;
	Thu,  9 Nov 2023 10:52:32 +0000 (UTC)
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81666270C;
	Thu,  9 Nov 2023 02:52:31 -0800 (PST)
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-586ad15f9aaso361910eaf.2;
        Thu, 09 Nov 2023 02:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699527151; x=1700131951; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KAOqnDpMNbOMMNgcliZ7OaUSPhsi2JDqBTtnhKhncro=;
        b=gsccuNL9v8Jp6qigbz+xAGAj2G2ra6FMV1oVOVZmnjl+zD7QdKoa5VDmSJJ541WEMV
         6k7l4bpfvs58IXET1gNbxJSiAuuiGntp9W53YQ68e0Lx+UXgJs5NyjGEbEQ03PK4JGH3
         dtzKAv8OPsUAbx/SWHI7FPYjqdAeA+h5VOx1MfP4za9xC3ZVsBJPwQCsBOvmEhbw4e/Y
         BW2oBaQSLDrANzPQ73w8wvafV2N6qXTHqEQP4O15YhcR39I4JLxwnkWWTxf1P3+txl9R
         JD4haVH9Ou+bHEbIkKX0RVjk6glrUHEcAobVuPlaPcmGy5CPDE4em7LHENyw+J/buV7p
         WqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699527151; x=1700131951;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KAOqnDpMNbOMMNgcliZ7OaUSPhsi2JDqBTtnhKhncro=;
        b=YK1C211gzf/7W6iuXZ/a64BTdP6FyL4xISTMTxBeoQt+c1M+JeGBfDPS2xJCzaJBJo
         vA2E7304AvIBgGAhW0jhJyBdEghaV1v2MOgGUAN4bPXTuz2a8gOJFCU/JFLuBdldGtGi
         eKI6MDFvjbrYUhrkxGenW2MtK3M7rZix+PDkiUdb/k5CrA87VoS3VnZhLZA5eae/tub2
         zEtNXQlH7AHLAM5mVGeu03c71RvxClYASMyFI1kC/KafGN+urduhGMX4ruKbrJpcw4Q7
         WPkj716CX2sa9aILQlQ2rP+J5qXdufcr9GmmBPqn/pVaT0ua2PdLH2o7k7BGHDdes4yQ
         qCTQ==
X-Gm-Message-State: AOJu0YxGhYDd9FltUHgTOs6PE7JdRAM/G6nvStRlX7WU4aJpqbUYIqFZ
	nsrE0KXLLwhIHqSNNf2rOQFZxt5OznMKVJfsY94=
X-Google-Smtp-Source: AGHT+IEMVB9nGYL9BAj5xM3M9jMord94wUjJC9D5YmMMavvqkvrIsFmhcICz8yHcCr2AhjrxJ6lKSEMeQsYhwEPKzxg=
X-Received: by 2002:a05:6820:1a47:b0:57b:7e41:9f11 with SMTP id
 br7-20020a0568201a4700b0057b7e419f11mr4859333oob.2.1699527150705; Thu, 09 Nov
 2023 02:52:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230914112739.112729-1-alessandro.carminati@gmail.com>
In-Reply-To: <20230914112739.112729-1-alessandro.carminati@gmail.com>
From: Alessandro Carminati <alessandro.carminati@gmail.com>
Date: Thu, 9 Nov 2023 11:51:54 +0100
Message-ID: <CAPp5cGSij=jOVOtq+jR_TYGvj-ZnvtAbv2sEAPKg6bN-5jhs+Q@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] Enhancing Boot Speed and Security with Delayed
 Module Signature Verification
To: Luis Chamberlain <mcgrof@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Prarit Bhargava <prarit@redhat.com>
Content-Type: text/plain; charset="UTF-8"

gentle ping


Il giorno gio 14 set 2023 alle ore 13:28 Alessandro Carminati (Red
Hat) <alessandro.carminati@gmail.com> ha scritto:
>
> This patch sets up a new feature to the Linux kernel to have the ability,
> while module signature checking is enabled, to delay the moment where
> these signatures are effectively checked. The feature is structure into
> two main key points, the feature can be enabled by a new command line
> kernel argument, while in delay mode, the kernel waits until the
> userspace communicates to start checking signature modules.
> This operation can be done by writing a value in a securityfs file,
> which works the same as /sys/kernel/security/lockdown.
>
> Patch 1/2: Modules: Introduce boot-time module signature flexibility
> The first patch in this set fundamentally alters the kernel's behavior
> at boot time by implementing a delayed module signature verification
> mechanism. It introduces a new boot-time kernel argument that allows
> users to request this delay. By doing so, we aim to capitalize on the
> cryptographic checks already performed on the kernel and initrd images
> during the secure boot process. As a result, we can significantly
> improve the boot speed without compromising system security.
>
> Patch 2/2: docs: Update kernel-parameters.txt for signature verification
> enhancement
> The second patch is just to update the kernel parameters list
> documentation.
>
> Background and Motivation
> In certain contexts, boot speed becomes crucial. This patch follows the
> recognition that security checks can at times be redundant. Therefore,
> it proves valuable to skip those checks that have already been validated.
>
> In a typical Secure Boot startup with an initrd, the bootloader is
> responsible for verifying artifacts before relinquishing control. In a
> verified initrd image, it is reasonable to assume that its content is
> also secure. Consequently, verifying module signatures may be deemed
> unnecessary.
> This patch introduces a feature to skip signature verification during
> the initrd boot phase.
>
> Alessandro Carminati (Red Hat) (2):
>   Modules: Introduce boot-time module signature flexibility
>   docs: Update kernel-parameters.txt for signature verification
>     enhancement
>
>  .../admin-guide/kernel-parameters.txt         |  9 +++
>  include/linux/module.h                        |  4 ++
>  kernel/module/main.c                          | 14 +++--
>  kernel/module/signing.c                       | 56 +++++++++++++++++++
>  4 files changed, 77 insertions(+), 6 deletions(-)
>
> --
> 2.34.1
>

