Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2588CC8A8
	for <lists+linux-modules@lfdr.de>; Sat,  5 Oct 2019 09:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727274AbfJEH7L (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Sat, 5 Oct 2019 03:59:11 -0400
Received: from condef-05.nifty.com ([202.248.20.70]:26779 "EHLO
        condef-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbfJEH7K (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Sat, 5 Oct 2019 03:59:10 -0400
Received: from conssluserg-05.nifty.com ([10.126.8.84])by condef-05.nifty.com with ESMTP id x957smaY011535
        for <linux-modules@vger.kernel.org>; Sat, 5 Oct 2019 16:54:48 +0900
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x957sXmH016806;
        Sat, 5 Oct 2019 16:54:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x957sXmH016806
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1570262074;
        bh=p9yHPmji7rhXxbD1ueOLfyVRDRN+WWX9cUEoagUBsPo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gYqhjfCqvHItsTpdrBo64s26DGk+jMGl1G5HlzdZGM0ZXovjrsAoOi5a+5oQx6BQG
         xKKbciHExcILv3ZFipkp9bbNdOhF6VTrnbMzVFvxzwJnzvAS51a30hiSlmmaKG12ev
         G0ZfsCE65zadJbg0Md9Wwocj6Zl6f3v04MjppagFM6JAvmbXWmFeQ5pmEahHPHgk+e
         M4wNnD3X1u7wIgHH9WuxnBQrevnCAgt/optHmEl+oBluf2oPIu2Ug7PpShIxTOuchL
         dc7jlB0bI7K/eoNpQvBDPr1mMa/ig5VQKPoAFmGtFuZGwXNKkVCcvzDvK2DtcEnirI
         UDWLB8pm5yzSQ==
X-Nifty-SrcIP: [209.85.221.171]
Received: by mail-vk1-f171.google.com with SMTP id w3so1980215vkm.3;
        Sat, 05 Oct 2019 00:54:34 -0700 (PDT)
X-Gm-Message-State: APjAAAXbhwX1dd1f3VTiTrj9b2sFPuEhnxnUxyGhYTZezTAXiWMMHxAt
        HeIw+vqfakshMoeKUGiBLWeO+8uoNXwV1XwZanc=
X-Google-Smtp-Source: APXvYqzDurXQq2dsaaJqF1yLKd5J5UZj/D5REygO26wC83Bq3c7adyD3TqS2rt1AYxtM25e98I5dwg/MlwdK3tiwXjk=
X-Received: by 2002:a1f:6d84:: with SMTP id i126mr9857322vkc.73.1570262072838;
 Sat, 05 Oct 2019 00:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190917231031.81341-1-maennich@google.com> <20191004095748.223119-1-maennich@google.com>
 <CAKi4VALPF7r25SJ+9jazeRz612pv_4MmhjOsJ8aumW_JO29VvA@mail.gmail.com>
In-Reply-To: <CAKi4VALPF7r25SJ+9jazeRz612pv_4MmhjOsJ8aumW_JO29VvA@mail.gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 5 Oct 2019 16:53:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ10xCm52PrgUvE=Z+d4BabuATSRpw+kL9Xm=O-ik_Duw@mail.gmail.com>
Message-ID: <CAK7LNAQ10xCm52PrgUvE=Z+d4BabuATSRpw+kL9Xm=O-ik_Duw@mail.gmail.com>
Subject: Re: [PATCH] depmod: create and use System.map.no_namespaces
To:     Lucas De Marchi <lucas.de.marchi@gmail.com>
Cc:     Matthias Maennich <maennich@google.com>,
        lkml <linux-kernel@vger.kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Jessica Yu <jeyu@kernel.org>,
        Martijn Coenen <maco@android.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-modules <linux-modules@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: owner-linux-modules@vger.kernel.org
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

On Sat, Oct 5, 2019 at 3:25 AM Lucas De Marchi
<lucas.de.marchi@gmail.com> wrote:
>
> On Fri, Oct 4, 2019 at 2:57 AM Matthias Maennich <maennich@google.com> wrote:
> >
> > depmod in its current version is not aware of symbol namespace in
> > ksymtab entries introduced with 8651ec01daed ("module: add support for
> > symbol namespaces."). They have the form
> >
> >   __ksymtab_NAMESPACE.symbol_name
> >
> > A fix for kmod's depmod has been proposed [1]. In order to support older
> > versions of depmod as well, create a System.map.no_namespaces during
> > scripts/depmod.sh that has the pre-namespaces format. That way users do
> > not immediately upgrade the userspace tool.
> >
> > [1] https://lore.kernel.org/linux-modules/20191004094136.166621-1-maennich@google.com/
> >
> > Reported-by: Stefan Wahren <stefan.wahren@i2se.com>
> > Fixes: 8651ec01daed ("module: add support for symbol namespaces.")
> > Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> > Cc: Lucas De Marchi <lucas.de.marchi@gmail.com>
> > Cc: Jessica Yu <jeyu@kernel.org>
> > Cc: Martijn Coenen <maco@android.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: linux-modules@vger.kernel.org
> > Signed-off-by: Matthias Maennich <maennich@google.com>
> > ---
> >
> > Please note this depends on the new ksymtab entry format proposed in
> > https://lore.kernel.org/lkml/20191003075826.7478-2-yamada.masahiro@socionext.com/
>
> I don't really agree with that thought, more below.
>
> >
> > That is likely to be merged soon as well as it fixes problems in 5.4-rc*, hence
> > this patch depends on it.
> >
> > Cheers,
> > Matthias
> >
> >  .gitignore        | 1 +
> >  scripts/depmod.sh | 8 +++++++-
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/.gitignore b/.gitignore
> > index 70580bdd352c..5ed58a7cb433 100644
> > --- a/.gitignore
> > +++ b/.gitignore
> > @@ -59,6 +59,7 @@ modules.order
> >  /vmlinux-gdb.py
> >  /vmlinuz
> >  /System.map
> > +/System.map.no_namespaces
> >  /Module.markers
> >  /modules.builtin.modinfo
> >
> > diff --git a/scripts/depmod.sh b/scripts/depmod.sh
> > index e083bcae343f..602e1af072c7 100755
> > --- a/scripts/depmod.sh
> > +++ b/scripts/depmod.sh
> > @@ -39,7 +39,13 @@ if $depmod_hack_needed; then
> >         KERNELRELEASE=99.98.$KERNELRELEASE
> >  fi
> >
> > -set -- -ae -F System.map
> > +# Older versions of depmod do not support symbol namespaces in ksymtab entries,
> > +# hence create an alternative System.map with namespace patched out to use for
> > +# depmod. I.e. transform entries as follows:
> > +#    __ksymtab_NAMESPACE.symbol_name -> __ksymtab_symbol_name
> > +sed 's/__ksymtab_.*\./__ksymtab_/' System.map > System.map.no_namespaces
>
> So people with old kmod will have to know they need to pass
> System.map.no_namespaces rather than the usual
> System.map. Also, distros will need to be update to also copy the new
> file to the kernel package (or upgrade/patch kmod).
>
> I'd rather maintain the current format and fix the bug that patch is
> fixing. The namespace
> in the end IMO is just a small annoyance with a reason to  exist.

I agree, this fix is bad.
We should not bother kmod or any tools.
And System.map.no_namespaces is a cheesy workaround.


BTW, I expressed my negative opinion in the review process
for the patch set. I am still not convinced with the
namespace feature, but anyway it was merged
(with poor review and test).



Get back on track, probably the right fix would be to
stop using __ksymtab_<namespace>.<symbol>.

It is not used for any purposes but passing
<namespace> / <symbol> pairs to modpost.


For example, __kstrtabns_##sym points to
the namespace string, so it would be possible
to parse it from modpost?

Then, asm("__ksymtab_" #ns NS_SEPARATOR #sym)
will go away.



Masahiro




> Lucas De Marchi
>
> > +
> > +set -- -ae -F System.map.no_namespaces
> >  if test -n "$INSTALL_MOD_PATH"; then
> >         set -- "$@" -b "$INSTALL_MOD_PATH"
> >  fi
> > --
> > 2.23.0.581.g78d2f28ef7-goog
> >
>
>
> --
> Lucas De Marchi



-- 
Best Regards
Masahiro Yamada
