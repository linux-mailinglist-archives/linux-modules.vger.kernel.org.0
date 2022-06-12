Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93E5C547A0C
	for <lists+linux-modules@lfdr.de>; Sun, 12 Jun 2022 14:18:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236530AbiFLMSb (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Sun, 12 Jun 2022 08:18:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234382AbiFLMSa (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Sun, 12 Jun 2022 08:18:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A15FAE7E;
        Sun, 12 Jun 2022 05:18:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CFEF960EB6;
        Sun, 12 Jun 2022 12:18:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83C2CC34115;
        Sun, 12 Jun 2022 12:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655036305;
        bh=WgqWCXOvSOyYM9CA6unsEF9x7497RtdMdOYMhEwuXNA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hJVwSxcZhwtzLwx3w1QhqIA1+qrWZ1YGyKj5qHKKPQ++Yqa816Xz6ppZ1R/IDxtM8
         0mGodfwO2v8xthNHRtUQ7dsU9T6KZrnnSnwkX2Km4qoMD4VxgmypasgeO574/wxfWh
         iPI0tb5tr49puQN4NIA3CqGVLyVln/zbm8lBPZ8hG8qBmrK2oCj41WK75ev21hQO/v
         iwYspOZKGjKe7g7QShHcxe1rR10SCFSjyNkmdYBtuEMKE90L7FAENwgzstDNcN3N7s
         6bz8ns5CJW9GDL1c/9Wzb9AS47ccvnKE6Mk6uAYpYzfOmoKzOnrDABFX7VAQu5vWRi
         lMYiDZBwwPCeQ==
Date:   Sun, 12 Jun 2022 21:18:02 +0900
From:   Masami Hiramatsu (Google) <mhiramat@kernel.org>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Jarkko Sakkinen <jarkko@kernel.org>, Song Liu <song@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Guo Ren <guoren@kernel.org>,
        Jarkko Sakkinen <jarkko@profian.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathaniel McCallum <nathaniel@profian.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
        Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Kees Cook <keescook@chromium.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Marco Elver <elver@google.com>,
        Dan Li <ashimida@linux.alibaba.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Chen Zhongjin <chenzhongjin@huawei.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Mark Brown <broonie@kernel.org>,
        Luis Machado <luis.machado@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Joey Gouly <joey.gouly@arm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
        Guenter Roeck <linux@roeck-us.net>,
        Dave Anglin <dave.anglin@bell.net>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Alexei Starovoitov <ast@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Daniel Axtens <dja@axtens.net>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Jordan Niethe <jniethe5@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Changbin Du <changbin.du@intel.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Liao Chang <liaochang1@huawei.com>,
        Philipp Tomsich <philipp.tomsich@vrull.eu>,
        Wu Caize <zepan@sipeed.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Alexander Egorenkov <egorenar@linux.ibm.com>,
        Thomas Richter <tmricht@linux.ibm.com>,
        Tobias Huschle <huschle@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Michael Roth <michael.roth@amd.com>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Miroslav Benes <mbenes@suse.cz>,
        =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Aaron Tomlin <atomlin@redhat.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        linux-modules@vger.kernel.org
Subject: Re: [PATCH] kprobes: Enable tracing for mololithic kernel images
Message-Id: <20220612211802.30a16623e8b0a55122b02386@kernel.org>
In-Reply-To: <CAMj1kXGGyO-DL9hjKYKR2sp87s4KExiQybES8pp4JgqJcHkfLA@mail.gmail.com>
References: <20220608000014.3054333-1-jarkko@profian.com>
        <CAJF2gTQgCn2CyZ4+VBqEEBT2b4+1KxoEXxrd+Ritk=58+U8EFA@mail.gmail.com>
        <YqAy0qjI4Lktk/uJ@iki.fi>
        <20220608232115.ccd4399f4a1d133e9b65c2a9@kernel.org>
        <CAPhsuW6iUieQvA6KqzSLgtxmjkVSWCuVwNA338DATb_myHxo7w@mail.gmail.com>
        <YqHx1d+MwRLLzGQe@iki.fi>
        <CAMj1kXGGyO-DL9hjKYKR2sp87s4KExiQybES8pp4JgqJcHkfLA@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-9.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

On Thu, 9 Jun 2022 15:23:16 +0200
Ard Biesheuvel <ardb@kernel.org> wrote:

> On Thu, 9 Jun 2022 at 15:14, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> >
> > On Wed, Jun 08, 2022 at 09:12:34AM -0700, Song Liu wrote:
> > > On Wed, Jun 8, 2022 at 7:21 AM Masami Hiramatsu <mhiramat@kernel.org> wrote:
> > > >
> > > > Hi Jarkko,
> > > >
> > > > On Wed, 8 Jun 2022 08:25:38 +0300
> > > > Jarkko Sakkinen <jarkko@kernel.org> wrote:
> > > >
> > > > > On Wed, Jun 08, 2022 at 10:35:42AM +0800, Guo Ren wrote:
> > > > > > .
> > > > > >
> > > > > > On Wed, Jun 8, 2022 at 8:02 AM Jarkko Sakkinen <jarkko@profian.com> wrote:
> > > > > > >
> > > > > > > Tracing with kprobes while running a monolithic kernel is currently
> > > > > > > impossible because CONFIG_KPROBES is dependent of CONFIG_MODULES.  This
> > > > > > > dependency is a result of kprobes code using the module allocator for the
> > > > > > > trampoline code.
> > > > > > >
> > > > > > > Detaching kprobes from modules helps to squeeze down the user space,
> > > > > > > e.g. when developing new core kernel features, while still having all
> > > > > > > the nice tracing capabilities.
> > > > > > >
> > > > > > > For kernel/ and arch/*, move module_alloc() and module_memfree() to
> > > > > > > module_alloc.c, and compile as part of vmlinux when either CONFIG_MODULES
> > > > > > > or CONFIG_KPROBES is enabled.  In addition, flag kernel module specific
> > > > > > > code with CONFIG_MODULES.
> > > > > > >
> > > > > > > As the result, kprobes can be used with a monolithic kernel.
> > > > > > It's strange when MODULES is n, but vmlinux still obtains module_alloc.
> > > > > >
> > > > > > Maybe we need a kprobe_alloc, right?
> > > > >
> > > > > Perhaps not the best name but at least it documents the fact that
> > > > > they use the same allocator.
> > > > >
> > > > > Few years ago I carved up something "half-way there" for kprobes,
> > > > > and I used the name text_alloc() [*].
> > > > >
> > > > > [*] https://lore.kernel.org/all/20200724050553.1724168-1-jarkko.sakkinen@linux.intel.com/
> > > >
> > > > Yeah, I remember that. Thank you for updating your patch!
> > > > I think the idea (split module_alloc() from CONFIG_MODULE) is good to me.
> > > > If module support maintainers think this name is not good, you may be
> > > > able to rename it as text_alloc() and make the module_alloc() as a
> > > > wrapper of it.
> > >
> > > IIUC, most users of module_alloc() use it to allocate memory for text, except
> > > that module code uses it for both text and data. Therefore, I guess calling it
> > > text_alloc() is not 100% accurate until we change the module code (to use
> > > a different API to allocate memory for data).
> >
> > After reading the feedback, I'd stay on using module_alloc() because
> > it has arch-specific quirks baked in. Easier to deal with them in one
> > place.
> >
> 
> In that case, please ensure that you enable this only on architectures
> where it is needed. arm64 implements alloc_insn_page() without relying
> on module_alloc() so I would not expect to see any changes there.

Hmm, what about adding CONFIG_ARCH_HAVE_ALLOC_INSN_PAGE and check it?
If it is defined, kprobes will not define the __weak function, but
if not, it will use module_alloc()?

Thank you,

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
