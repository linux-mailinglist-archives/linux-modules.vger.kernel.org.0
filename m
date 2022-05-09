Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7200151F383
	for <lists+linux-modules@lfdr.de>; Mon,  9 May 2022 06:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232382AbiEIEdj (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Mon, 9 May 2022 00:33:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233684AbiEIEan (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Mon, 9 May 2022 00:30:43 -0400
Received: from conssluserg-05.nifty.com (conssluserg-05.nifty.com [210.131.2.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A9731059F4;
        Sun,  8 May 2022 21:26:48 -0700 (PDT)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 2494PhcJ014643;
        Mon, 9 May 2022 13:25:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 2494PhcJ014643
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1652070344;
        bh=DM2Qvk/KSJwggZQc+f9r/EEPApKQ0miaQHjxBSW8IV8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=o6XYg2bwQfHrSq3bmQnG8Jpcnk1UTD3FhC5a1TUoXExRLyvujSGeOMFR3dfEqtIxx
         jZIb9XBWPLHupK1YnU+oibAr0NtF7JrU/xq9ge0bTvQxiXAsf5FSwZf/aBLkzokBSh
         4pYnoQJrhruoSCAZW5vQpqOKLKRG+TD+bP/cc+wlRqd1lkmZ6G/jPPJMKc6+GeRK0p
         yWn5WRjoA7b1nUAeCM1kGbAv1dll+XvcerBv59vD5767bpInjYSc63X4ghyeOgNpIk
         O+3kAqdTjgld9pwF/oKvzQSUpg5noc20wbQuZ1RetnGg5M/PlDZ6Y1JjaznJKcydLK
         Vxs0cbmmsKiPw==
X-Nifty-SrcIP: [209.85.216.52]
Received: by mail-pj1-f52.google.com with SMTP id iq2-20020a17090afb4200b001d93cf33ae9so15924784pjb.5;
        Sun, 08 May 2022 21:25:43 -0700 (PDT)
X-Gm-Message-State: AOAM532XfFh1WmMfSMp+sY5k4d+qirDaMgiWiE+DRPH+6AQNQno3rwId
        l8o+QZ4Kv6sNE/ZjyX4E+IjGA39jHZfvBylT3uE=
X-Google-Smtp-Source: ABdhPJz+EyiLX7j6uh3WzqWMOrMkF5hlrWDy6od+IPDFGCNr8NC4vk92cU3B82hmpcsJDxTmnQ5GEcRpm1eC9pqP+d0=
X-Received: by 2002:a17:902:7891:b0:15e:cae9:7620 with SMTP id
 q17-20020a170902789100b0015ecae97620mr14626650pll.136.1652070342778; Sun, 08
 May 2022 21:25:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220508190631.2386038-1-masahiroy@kernel.org>
In-Reply-To: <20220508190631.2386038-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 9 May 2022 13:24:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQtedww_RiemfTV7Ls=M01iKJhY14G3TiuAg=C3bvJjww@mail.gmail.com>
Message-ID: <CAK7LNAQtedww_RiemfTV7Ls=M01iKJhY14G3TiuAg=C3bvJjww@mail.gmail.com>
Subject: Re: [PATCH v4 00/14] kbuild: yet another series of cleanups (modpost,
 LTO, MODULE_REL_CRCS, export.h)
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-modules <linux-modules@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

On Mon, May 9, 2022 at 4:09 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This is the third batch of cleanups in this development cycle.
>
> Major changes in v4:
>  - Move static EXPORT_SYMBOL check to a script
>  - Some refactoring
>
> Major changes in v3:
>
>  - Generate symbol CRCs as C code, and remove CONFIG_MODULE_REL_CRCS.
>
> Major changes in v2:
>
>  - V1 did not work with CONFIG_MODULE_REL_CRCS.
>    I fixed this for v2.
>
>  - Reflect some review comments in v1
>
>  - Refactor the code more
>
>  - Avoid too long argument error

This series is available at
git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
lto-cleanup-v4




>
>
> Masahiro Yamada (14):
>   modpost: remove left-over cross_compile declaration
>   modpost: change the license of EXPORT_SYMBOL to bool type
>   modpost: split the section mismatch checks into section-check.c
>   modpost: add sym_find_with_module() helper
>   modpost: extract symbol versions from *.cmd files
>   kbuild: link symbol CRCs at final link, removing
>     CONFIG_MODULE_REL_CRCS
>   kbuild: stop merging *.symversions
>   genksyms: adjust the output format to modpost
>   kbuild: do not create *.prelink.o for Clang LTO or IBT
>   kbuild: check static EXPORT_SYMBOL* by script instead of modpost
>   kbuild: make built-in.a rule robust against too long argument error
>   kbuild: make *.mod rule robust against too long argument error
>   kbuild: add cmd_and_savecmd macro
>   kbuild: rebuild multi-object modules when objtool is updated
>
>  arch/powerpc/Kconfig            |    1 -
>  arch/s390/Kconfig               |    1 -
>  arch/um/Kconfig                 |    1 -
>  include/asm-generic/export.h    |   22 +-
>  include/linux/export-internal.h |   16 +
>  include/linux/export.h          |   30 +-
>  init/Kconfig                    |    4 -
>  kernel/module.c                 |   10 +-
>  scripts/Kbuild.include          |   10 +-
>  scripts/Makefile.build          |  134 +--
>  scripts/Makefile.lib            |    7 -
>  scripts/Makefile.modfinal       |    5 +-
>  scripts/Makefile.modpost        |    9 +-
>  scripts/check-local-export      |   48 +
>  scripts/genksyms/genksyms.c     |   18 +-
>  scripts/link-vmlinux.sh         |   33 +-
>  scripts/mod/Makefile            |    2 +-
>  scripts/mod/modpost.c           | 1499 ++++---------------------------
>  scripts/mod/modpost.h           |   35 +-
>  scripts/mod/section-check.c     | 1222 +++++++++++++++++++++++++
>  20 files changed, 1551 insertions(+), 1556 deletions(-)
>  create mode 100644 include/linux/export-internal.h
>  create mode 100755 scripts/check-local-export
>  create mode 100644 scripts/mod/section-check.c
>
> --
> 2.32.0
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20220508190631.2386038-1-masahiroy%40kernel.org.



-- 
Best Regards
Masahiro Yamada
