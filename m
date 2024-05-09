Return-Path: <linux-modules+bounces-1319-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1678C0E0C
	for <lists+linux-modules@lfdr.de>; Thu,  9 May 2024 12:16:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04902B20CC5
	for <lists+linux-modules@lfdr.de>; Thu,  9 May 2024 10:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 628F014AD2E;
	Thu,  9 May 2024 10:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OPPc9Lo8"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DAC101E3
	for <linux-modules@vger.kernel.org>; Thu,  9 May 2024 10:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715249772; cv=none; b=BsUzZsB/jaxQidqnke3eD2yODpDHyHHsMBgbfR9ucq2qoaOzkC64RzhUlWu2XIsKW8GUu9e43gJ7lBJEeKXuesrtsKqJcDyGXBuJEwIvzFIsuD9uo2xh6hcKdMsRRE4eJXutDmcw06YtDDm9VeMle9NZqQvOUl75G9uaFwcOJfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715249772; c=relaxed/simple;
	bh=BQTsY+QYWkqzuPo9ysu87ZBDzqxQ33iY2jNZGI1Qrq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LpCsNKVgqPFferdAeco8UQ+V/0u52iCOFJOlMFrCCRkSy8M2hb7657KiUicFXKeLdtCfVjhUWmbYjbx1LzzvHnF1pddAyS/wwkPtCB10uLHPzxThZ30x70K6gBU3O2a8Hm7smCx1RSzB/ajWaR4KoFdIKX5xZFiyuxxzaSRoa8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OPPc9Lo8; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-51f60817e34so827332e87.2
        for <linux-modules@vger.kernel.org>; Thu, 09 May 2024 03:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715249768; x=1715854568; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FFO/jadRt4SPPUwoVVPLNioOizVZIMtK7I2U+xwwzps=;
        b=OPPc9Lo8+UjwpAC7aKEka3WjsSDQ855sVBgUoOPavOIFpU75lIulpOSCdASvkrXQK6
         6byXGxBHrpWEz7yP2KIhdxZ8T668RuJEzUI8t2dzt+oZQkgaOmgWZRNo/4eo81dnNjtL
         w3L7YhuiuV/3FTf00wYb4L2glMZihQ6AHS1M61en1K5BPcMK8lHOq+3ugzE1UtPXj/Xu
         SAn1WtdqlJ3zxUgL0HnI+dqzuuWgv3wYc2BjmgLiaryYzKoK4Vu227+BQbio5efArYFe
         jqFQVidMLqAqeTbB70yGJIS2zF13k4LFTI26r3RjHYSXlD/dXIrBaO/osUoB/rSox0zV
         6diQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715249768; x=1715854568;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FFO/jadRt4SPPUwoVVPLNioOizVZIMtK7I2U+xwwzps=;
        b=NEFNlW+jlEzQYp+Wqu3Fv9Cd25BIifXUNug4rGWjI4KYFSrG3s5FyFzAWfw79iBaor
         LyNh6jm+Kssgg/gDCG27r7hhM14eQDyUbP/+4jp+2ugdgVWHvnjefLAy0i6rxeVjntwq
         Dl+f+KKl4NKcTW1rg/wugAduKcAMG8y9BZi2+TqtUmQwbtQlHIthSyYVRN4A2R4rxFeK
         TGd4DFOpLbWICCLLxnrhM7m/KKtgiZfCWjyOZ0Tj83cYXk+LmeYD1Js5lc49SQuxXto+
         o3SIG4EwClHtH5RVWuhWLbhq0YnwpFwAXgRpBLt3PPSQ1MLAPDDCDnSaAdOzDIFQ4YnZ
         5vAA==
X-Forwarded-Encrypted: i=1; AJvYcCU3ElQfaousYphOcPJk5/IBnMX6T5WHmS31DzlGdrp6xJMuRMCgndcxibbNXNKOBJ3W+afP7HjGTpd/NbEVHVLQPG+jOl+VX4wIDmULXQ==
X-Gm-Message-State: AOJu0YxZ33oAlgmhwR/bB1YQ0XpbkkOCGkxso+1NPorCjFuNkTfZfjT3
	PA1Ivk3yo2BL8UGnLrJLxd1Yg2Cb3gPkEgd3hA4A9hSdlu34KF6lJh2TsvcfJAo=
X-Google-Smtp-Source: AGHT+IFCnmf8QAgKAdd7zmv9M9NzKV5flwTJZfiv4SkELlgUMZ+kSlztAk6A1Z+RF/l+HsWms7knvQ==
X-Received: by 2002:a19:8c4d:0:b0:51e:e703:d11c with SMTP id 2adb3069b0e04-5217c26e7e9mr2987242e87.12.1715249768301;
        Thu, 09 May 2024 03:16:08 -0700 (PDT)
Received: from pathway ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fd97e842csm10458755e9.24.2024.05.09.03.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 03:16:07 -0700 (PDT)
Date: Thu, 9 May 2024 12:16:05 +0200
From: Petr Mladek <pmladek@suse.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, jikos@kernel.org, mbenes@suse.cz,
	joe.lawrence@redhat.com, mcgrof@kernel.org,
	live-patching@vger.kernel.org, linux-modules@vger.kernel.org
Subject: Re: [PATCH v2 2/2] livepatch: Delete the associated module of
 disabled livepatch
Message-ID: <ZjyiZfC9GqQ4akVJ@pathway>
References: <20240503211434.wce2g4gtpwr73tya@treble>
 <Zji_w3dLEKMghMxr@pathway.suse.cz>
 <20240507023522.zk5xygvpac6gnxkh@treble>
 <CALOAHbArS+WVnfU-RUzbgFJTH5_H=m_x44+GvXPS_C3AKj1j8w@mail.gmail.com>
 <20240508051629.ihxqffq2xe22hwbh@treble>
 <CALOAHbDn=t7=Q9upg1MGwNcbo5Su9W5JTAc901jq2BAyNGSDrg@mail.gmail.com>
 <20240508070308.mk7vnny5d27fo5l6@treble>
 <CALOAHbCdO+myNZ899CQ6yD24k0xK6ZQtLYxqg4vU53c32Nha4w@mail.gmail.com>
 <20240509052007.jhsnssdoaumxmkbs@treble>
 <CALOAHbBAQ580+qjxYbc1bNJxZ8wxxDqP3ua__pqKzCg9An3yGA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALOAHbBAQ580+qjxYbc1bNJxZ8wxxDqP3ua__pqKzCg9An3yGA@mail.gmail.com>

On Thu 2024-05-09 13:53:17, Yafang Shao wrote:
> On Thu, May 9, 2024 at 1:20 PM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> >
> > On Thu, May 09, 2024 at 10:17:43AM +0800, Yafang Shao wrote:
> > > On Wed, May 8, 2024 at 3:03 PM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> > > >
> > > > On Wed, May 08, 2024 at 02:01:29PM +0800, Yafang Shao wrote:
> > > > > On Wed, May 8, 2024 at 1:16 PM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> > > > > > If klp_patch.replace is set on the new patch then it will replace all
> > > > > > previous patches.
> > > > >
> > > > > A scenario exists wherein a user could simultaneously disable a loaded
> > > > > livepatch, potentially resulting in it not being replaced by the new
> > > > > patch. While theoretical, this possibility is not entirely
> > > > > implausible.
> > > >
> > > > Why does it matter whether it was replaced, or was disabled beforehand?
> > > > Either way the end result is the same.
> > >
> > > When users disable the livepatch, the corresponding kernel module may
> > > sometimes be removed, while other times it remains intact. This
> > > inconsistency has the potential to confuse users.
> >
> > I'm afraid I don't understand.  Can you give an example scenario?
> >
> 
> As previously mentioned, this scenario may occur if user-space tools
> remove all pertinent kernel modules from /sys/livepatch/* while a user
> attempts to load a new atomic-replace livepatch.
> 
> For instance:
> 
> User-A                                                       User-B
> 
> echo 0 > /sys/livepatch/A/enable              insmod atomic-replace-patch.ko
> 
> >From User-A's viewpoint, the A.ko module might sometimes be removed,
> while at other times it remains intact. The reason is that User-B
> removed a module that he shouldn't remove.

Why would User-A want to keep the module, please? The livepatches
could not longer be re-enabled since the commit 958ef1e39d24d6
("livepatch: Simplify API by removing registration step") which
was added in v5.1-rc1.

The only problem might be that User-A can't remove the module
because it has already been removed by User-B or vice versa.
Is this really a problem?

Have you seen the problem in practice or is it just theoretical?

Is anyone really combining livepatches with and without atomic
replace?

Best Regards,
Petr

