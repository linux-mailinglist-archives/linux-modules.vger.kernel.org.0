Return-Path: <linux-modules+bounces-2353-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 998569AF5A4
	for <lists+linux-modules@lfdr.de>; Fri, 25 Oct 2024 01:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44DAE1F225E5
	for <lists+linux-modules@lfdr.de>; Thu, 24 Oct 2024 23:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 442FD218328;
	Thu, 24 Oct 2024 23:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="icxf1yBL"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D96E12D1F1
	for <linux-modules@vger.kernel.org>; Thu, 24 Oct 2024 23:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729810920; cv=none; b=X0MnDYQ6LbkBlJnBUS4/RG9kJV8QPx0BfnwhMRsm+8odjejLmUytS2QygeZonclDcEmCif5aORZHZ3m5s2Xmg0sixsXNBAoJymlhY8IEkIaZh/DK1i1w7whkokMFyJ72Y/kLGu88Ri1oJHsSXym+ukT0ep5hAaY+NPdT9H1+55g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729810920; c=relaxed/simple;
	bh=ybEBU/t/SJePZebl4iAjsIn1gGCyVGhTKSar4dgvytE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o6fNYcKlyjLI7ezHtcnAi+rtKdzWgpmHv9WlW979aeq2ULVB/FPohkpGGlZwfK0ezpF/a9EPkLIwyRa0nsytEVw9IgtpGmsgAZuR4ujXYPj7MF7Xd7BleZQgkgggJF5V0KXbAiXk4vJqICHMEPyOR52wge7I3Z4fidii2Q362yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=icxf1yBL; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20ca4877690so35355ad.1
        for <linux-modules@vger.kernel.org>; Thu, 24 Oct 2024 16:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729810918; x=1730415718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YWPqFC2idLXwWLVGXP8sgBtLusvgfrCXLHA1CgLV1iw=;
        b=icxf1yBLDguit0cVY9iCBraP7Qp4FL43FqAT2G6joQoC3FaY3fqe1Bg4Hl4HfK66JN
         95OmZuWqsKEGnpSs498al2+y9zlbrJEdF4F4BnYfApcpL/KLgzfQ09dAqjfao7WmGCa0
         I9Dh5GzkFvfAkKl97y9oebePwuig4qgYWd8l3RH1e5GPGUI++nF5ST7LSfPpWMuN2CPd
         O0+NCBGZRDYPItqTZDF6/IxK7tEBaRvRCtJVaSIniqgcKTi+voqu/3K9bhR6x2RmxbRe
         mYSp3OTJmd8drOIaQc5Hk8iNdAkYagVKV0it1iXsblzyxlLwVI9Xz3eX7PlaoGmsMp7e
         wT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729810918; x=1730415718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWPqFC2idLXwWLVGXP8sgBtLusvgfrCXLHA1CgLV1iw=;
        b=by/Xg6U8F9Hbhr/1kDhFHKjaE6V5+5dVNrqS1JCwkCsd4dDRLU03ZrQNA0JtDI1FqP
         c3IeVU7611YEVoVdO3lLs5CmS6dm/+h5vvQww0EOnlTzIlPGheEgeeL9dJSSVfH7EHIM
         QBFT/rXb7OUahEORFbPURAYDBN/fcZzEHz4TDl93AiI3IFmO5k7iLtsmvYoGf9le6CHX
         LHmhMxHps1ipiADP6JfxnTQwKoBki6s16N48RRQClRAZfbw+BuJ+JM/vp0D+xUfxm3uu
         dDNYe6Swh1KM2mQQCd6Ch5F4tkY1mZOFdsHGCWay+sgaSUptXXuXkpzabsKD3eek8XFD
         EorQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyokN7xCL5nekj7Lzoi0pb0yhalGOBg6t8KueXgeBZXJrslPQIrcunp/lw+ma82ZSELv4XsDJKmJPUL1wD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx90pY58oFwGrwabvB58PFWBa6n0H8RWp7L2rsv9zlrx2qCcmVX
	zQnyxqRFQwoXq/P1T0G4X/MV6DEbOKDhFp1qLlAMgsvuC698oPhyW0Lk/tI+4A==
X-Google-Smtp-Source: AGHT+IECEzj2j2R3HEQNqRkKqGUxd9Vcb7D0j4G32E56QFP5qsmcyNWJW/GLTUqkmxlzQwTttNdiEQ==
X-Received: by 2002:a17:902:cec8:b0:20c:a8cf:fa27 with SMTP id d9443c01a7336-20fc2219a8dmr1193475ad.18.1729810917420;
        Thu, 24 Oct 2024 16:01:57 -0700 (PDT)
Received: from google.com (254.80.82.34.bc.googleusercontent.com. [34.82.80.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e8e3572efbsm26644a91.22.2024.10.24.16.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 16:01:56 -0700 (PDT)
Date: Thu, 24 Oct 2024 23:01:52 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Matthew Maurer <mmaurer@google.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v7 2/3] modpost: Produce extended MODVERSIONS information
Message-ID: <20241024230152.GB1382412@google.com>
References: <20241023-extended-modversions-v7-0-339787b43373@google.com>
 <20241023-extended-modversions-v7-2-339787b43373@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023-extended-modversions-v7-2-339787b43373@google.com>

On Wed, Oct 23, 2024 at 02:31:29AM +0000, Matthew Maurer wrote:
> Generate both the existing modversions format and the new extended one
> when running modpost. Presence of this metadata in the final .ko is
> guarded by CONFIG_EXTENDED_MODVERSIONS.
> 
> We no longer generate an error on long symbols in modpost if
> CONFIG_EXTENDED_MODVERSIONS is set, as they can now be appropriately
> encoded in the extended section. These symbols will be skipped in the
> previous encoding. An error will still be generated if
> CONFIG_EXTENDED_MODVERSIONS is not set.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Thanks for fixing this, LGTM.

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami

