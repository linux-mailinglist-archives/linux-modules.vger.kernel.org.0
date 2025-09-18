Return-Path: <linux-modules+bounces-4417-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 80306B584AB
	for <lists+linux-modules@lfdr.de>; Mon, 15 Sep 2025 20:34:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D56791A25F12
	for <lists+linux-modules@lfdr.de>; Mon, 15 Sep 2025 18:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1277C279788;
	Mon, 15 Sep 2025 18:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RBEgZaYC"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C2225D208
	for <linux-modules@vger.kernel.org>; Mon, 15 Sep 2025 18:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757961256; cv=none; b=hBME1JZ/VZOkOyTNxIn/dlAAR06QhPopkYygk9ziHjncADy4QwgFNgjKoaD6o6jk0IN22IQZavFZzlAe+fuiSEfNPDwxT7SegFBCJbCBSMAA9tFxGeWTMkm89K3g75/YiwF7cv/LW6zPBz7RchB+12I1A7SVpMGywLWoflj54EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757961256; c=relaxed/simple;
	bh=nFTNXAZf8eOkJqjopbYNGl88wQ2udJXBUKbd5JGYFJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qMLDfncOpPJMeN0ZYgCYzkd+O+PoFCJ+lbz3qXm3RWf+BYKb2DXT84cN6jJvJ3G+gQchIooTYJcWkJIpfLF8SvcUyBRij7i47ferdYkqcSdkgJ9FmCjtlJl2zgEq34o5VJfmeQ5IJm8r1O5pgoxYlhbN6gi53MGtHLAHteGbu0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RBEgZaYC; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-26763bb9a92so10008105ad.2
        for <linux-modules@vger.kernel.org>; Mon, 15 Sep 2025 11:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757961254; x=1758566054; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UNSXkkVhuHJlFNtXimgTWN2ssSCSJ/yVmF41qtJieAc=;
        b=RBEgZaYCGiZStA+ZMXctezvKgHiMZCVi6wCVzTK6Up2sHh2jlNu3iXSeWHTlGnSx+H
         nWY1jb2r2BSypZ+htrY23sA+5gomed92AdqSYmHsYxHHQbtMu7povkJai3WudSpgXNOd
         MWIvZ1UgXFtUM+aaXUUf89mTO3zyPYTt4p25M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757961254; x=1758566054;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UNSXkkVhuHJlFNtXimgTWN2ssSCSJ/yVmF41qtJieAc=;
        b=XAGz5Ft8YSAqs1IR7oR80CVaLNmmJtI2yu7NrQlJ2uqFHk2uBtPMMs4zEWMjkpx2zr
         o93LMsniakBJ1hiA8XYqTEdiVGssBYl+qPXxbqvuAGo72KjCr+SLxpYjE6ooz2dPi64J
         nUIXyh4kP4SwQClCB1GcgNFJcHOCB1o/MFnoYU2PD7JfDgv5+HFgQnwVcKFEwrTxH+1M
         5jzyuaOP7h5rKTQ0yMv4R92f7jEDP54fZldjTzaeSxynqwm1zul5fiYuY+iQTIwExPLI
         j9BkDKMeE3XHFJKv/bYMyvqW1ju8Z+5xHhiN6RcNh7E6oMkm5JD41J/n4NcCAAgcHTJP
         si0g==
X-Forwarded-Encrypted: i=1; AJvYcCUhM5Lwq/FwKZIVCzjXVST+LqVQ7uFDcJzE7OGo2errckhiT80ZySMZyEcnzk/u7kr53xZBgEYVNlmkq+pk@vger.kernel.org
X-Gm-Message-State: AOJu0YwEE33QSysLkTAoqSwqmQkK6HyWgzQv/m9j/ORlQ5h+HGGS3ATx
	09Am373uYcNG54/aRxH3Lj5xvep0wBujjIyBYqSsNPthTJP8SAjUES5DlM8H4hYZaA==
X-Gm-Gg: ASbGncukfQMMZ9H+675jgdd33N4Y6JPF+O0J4155pB/vcYCkUJA3+Pr3ezLCSIcIyMX
	F/bQzuGDL1urzrPmRKcFl7rwzNYM2Mkon9BCWkZ0tEefcmLqeNebH0Hq43L0Vu64FBzNa5Jyr2O
	gOlk2G5hkIyPnG74iiPYHFkAvQYULzg2wwmdiNIr0v/UcOSIExXX99JFtfJ2Tv2Co2U35xIdTfg
	EsRYM8520hI7kFmtAXpNqMjDvSQyaPgRiL7yWGD79qeqXjzt6SYQLs8s//PjNoh80yH0kmlvLbs
	ebXKIEq+uaNf0cGdohdXDLJjC24qxD3PC2gJ5HBCPvu6AlmOHQgG8cdEYjhaTdgfSJuH3rkfVBP
	+UUkgDeb4eyI7nNlGF/RcndL6hyzVBRUSQ3KaujloJ4riyOVSNglHxrph6znq
X-Google-Smtp-Source: AGHT+IH+aA/qD9/tWA4T9bKeTNV4qwrmPWyIWt6h2dj375FkW7TVjYU5fI9lcYTNhfQ0zBY5pwIDPA==
X-Received: by 2002:a17:902:ebc9:b0:24b:4a9a:703a with SMTP id d9443c01a7336-25d24da7536mr207524775ad.17.1757961253707;
        Mon, 15 Sep 2025 11:34:13 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:fd49:49b1:16e7:2c97])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-26175efc667sm75235655ad.112.2025.09.15.11.34.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 11:34:12 -0700 (PDT)
Date: Mon, 15 Sep 2025 11:34:10 -0700
From: Brian Norris <briannorris@chromium.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>, linux-pci@vger.kernel.org,
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	Sami Tolvanen <samitolvanen@google.com>,
	Richard Weinberger <richard@nod.at>, Wei Liu <wei.liu@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	kunit-dev@googlegroups.com,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	linux-um@lists.infradead.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH 1/4] PCI: Support FIXUP quirks in modules
Message-ID: <aMhcIsO3KmthtrIL@google.com>
References: <20250912230208.967129-1-briannorris@chromium.org>
 <20250912230208.967129-2-briannorris@chromium.org>
 <8e75d6cc3847899ba8d6a0cbd0ef3ac57eabf009.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e75d6cc3847899ba8d6a0cbd0ef3ac57eabf009.camel@sipsolutions.net>

Hi Johannes,

On Mon, Sep 15, 2025 at 08:33:08AM +0200, Johannes Berg wrote:
> On Fri, 2025-09-12 at 15:59 -0700, Brian Norris wrote:
> > The PCI framework supports "quirks" for PCI devices via several
> > DECLARE_PCI_FIXUP_*() macros. These macros allow arch or driver code to
> > match device IDs to provide customizations or workarounds for broken
> > devices.
> > 
> > This mechanism is generally used in code that can only be built into the
> > kernel, but there are a few occasions where this mechanism is used in
> > drivers that can be modules. For example, see commit 574f29036fce ("PCI:
> > iproc: Apply quirk_paxc_bridge() for module as well as built-in").
> > 
> > The PCI fixup mechanism only works for built-in code, however, because
> > pci_fixup_device() only scans the ".pci_fixup_*" linker sections found
> > in the main kernel; it never touches modules.
> > 
> > Extend the fixup approach to modules.
> 
> This _feels_ a bit odd to me - what if you reload a module, should the
> fixup be done twice?�Right now this was not possible in a module, which
> is a bit of a gotcha, but at least that's only one for developers, not
> for users (unless someone messes up and puts it into modular code, as in
> the example you gave.)

My assumption was that FIXUPs in modules are only legitimate if they
apply to a dependency chain that involves the module they are built
into. So for example, the fixup could apply to a bridge that is
supported only by the module (driver) in question; or it could apply
only to devices that sit under the controller in question [1].

Everything I see that could potentially be in a module works like this
AFAICT.

To answer your question: no, the fixup should not be done twice, unless
the device is removed and recreated. More below.

[1] The quirks in drivers/pci/controller/dwc/pci-keystone.c look like
this. (Side note: pci-keystone.c cannot be built as a module today.)

> Although, come to think of it, you don't even apply the fixup when the
> module is loaded, so what I just wrote isn't really true. That almost
> seems like an oversight though, now the module has to be loaded before
> the PCI device is enumerated, which is unlikely to happen in practice?
> But then we get the next gotcha - the device is already enumerated, so
> the fixups cannot be applied at the various enumeration stages, and
> you're back to having to load the module before PCI enumeration, which
> could be tricky, or somehow forcing re-enumeration of a given device
> from userspace, but then you're firmly in "gotcha for the user"
> territory again ...

With my assumption above, none of this would really be needed. The
relevant device(s) will only exist after the module is loaded, and they
will go away when the module is gone.

Or am I misreading your problem statements?

> I don't really have any skin in this game, but overall I'd probably
> argue it's better to occasionally have to fix things such as in the
> commit you point out but have a predictable system, than apply things
> from modules.

FWIW, I believe some folks are working on making *more* controller
drivers modular. So this problem will bite more people. (Specifically, I
believe Manivannan was working on
drivers/pci/controller/dwc/pcie-qcom.c, and it has plenty of FIXUPs.)

I also don't think it makes things much less predictable, as long as
developers abide by my above assumption. I think that's a perfectly
reasonable assumption (it's not so different than, say,
MODULE_DEVICE_TABLE), but I could perhaps be convinced otherwise.

> Perhaps it'd be better to extend the section checking infrastructure to
> catch and error out on these sections in modules instead, so we catch it
> at build time, rather than finding things missing at runtime?

Maybe I'm missing something here, but it seems like it'd be pretty easy
to do something like:

#ifdef MODULE
#define DECLARE_PCI_FIXUP_SECTION...) BUILD_BUG()
#else
... real definitions ...
#endif

I'd prefer not doing this though, if we can help it, since I believe
(a) FIXUPs are useful in perfectly reasonable ways for controller
    drivers and
(b) controller drivers can potentially be modules (yes, there are some
    pitfalls besides $subject).

> And yeah, now I've totally ignored the kunit angle, but ... not sure how
> to combine the two requirements if they are, as I think, conflicting.

Right, either we support FIXUPs in modules, or we should outlaw them.

For kunit: we could still add tests, but just force them to be built-in.
It wouldn't be the first kernel subsystem to need that.

Brian

