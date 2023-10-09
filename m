Return-Path: <linux-modules+bounces-68-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E21B87BE5C1
	for <lists+linux-modules@lfdr.de>; Mon,  9 Oct 2023 18:01:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E54F1C20A5C
	for <lists+linux-modules@lfdr.de>; Mon,  9 Oct 2023 16:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0182C37CA0;
	Mon,  9 Oct 2023 16:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-modules@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F24B374F0
	for <linux-modules@vger.kernel.org>; Mon,  9 Oct 2023 16:01:43 +0000 (UTC)
Received: from a3.inai.de (a3.inai.de [IPv6:2a01:4f8:10b:45d8::f5])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E46939E;
	Mon,  9 Oct 2023 09:01:41 -0700 (PDT)
Received: by a3.inai.de (Postfix, from userid 25121)
	id EC00E588BB0A5; Mon,  9 Oct 2023 18:01:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by a3.inai.de (Postfix) with ESMTP id E97D860C0C523;
	Mon,  9 Oct 2023 18:01:39 +0200 (CEST)
Date: Mon, 9 Oct 2023 18:01:39 +0200 (CEST)
From: Jan Engelhardt <jengelh@inai.de>
To: Masahiro Yamada <masahiroy@kernel.org>
cc: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, 
    linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Nicolas Schier <nicolas@fjasle.eu>, linux-modules@vger.kernel.org, 
    Takashi Iwai <tiwai@suse.com>, Lucas De Marchi <lucas.de.marchi@gmail.com>, 
    =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
    Jiri Slaby <jslaby@suse.com>, Nathan Chancellor <nathan@kernel.org>, 
    Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH rebased] kbuild: rpm-pkg: Fix build with non-default
 MODLIB
In-Reply-To: <CAK7LNAQQMFUt4R1m_U8kBY5=BvxD_dMuE4MD4kpd48WK1E+AGA@mail.gmail.com>
Message-ID: <878439n7-r6p3-9504-p193-9q6110422815@vanv.qr>
References: <20231005150728.3429-1-msuchanek@suse.de> <CAK7LNAQh7vCQ859RPkL3SDr2d4ptt5OVCr66fkPKGcvxDUHtkw@mail.gmail.com> <20231009085208.GT6241@kitsune.suse.cz> <CAK7LNASeMEKVi5c0PEow5KSdN7rsm7UYEf2smWOSkYOhr_5fVQ@mail.gmail.com> <20231009140733.GV6241@kitsune.suse.cz>
 <CAK7LNAQQMFUt4R1m_U8kBY5=BvxD_dMuE4MD4kpd48WK1E+AGA@mail.gmail.com>
User-Agent: Alpine 2.26 (LSU 649 2022-06-02)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


On Monday 2023-10-09 17:14, Masahiro Yamada wrote:
>
>Let me add more context to my question.
>
>I am interested in the timing when
>'pkg-config --print-variables kmod | grep module_directory'
>is executed.
>
>1.  Build a SRPM on machine A
>2.  Copy the SRPM from machine A to machine B
>3.  Run rpmbuild on machine B to build the SRPM into a RPM
>4.  Copy the RPM from machine B to machine C
>5.  Install the RPM to machine C

In over 20 years of Linux distros existing, the one thing that
everyone has learned is that installing foreign RPM packages (or any
other format) is probably not going to work for one reason or
another. Different package names in Require: lines (just think of the
switch from modutils to kmod), different ABIs..

The overwhelming amount of package production that is going on these
days targets distro(A) == distro(B) == distro(C).


Yeah, the kernel package is kinda special because the files in it
are freestanding executables, but still..

