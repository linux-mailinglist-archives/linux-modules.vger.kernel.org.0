Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E2E165DAF2
	for <lists+linux-modules@lfdr.de>; Wed,  4 Jan 2023 18:07:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231423AbjADRH1 (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Wed, 4 Jan 2023 12:07:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240067AbjADRHT (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Wed, 4 Jan 2023 12:07:19 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 562C7DEF0;
        Wed,  4 Jan 2023 09:07:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EE851617C2;
        Wed,  4 Jan 2023 17:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF89C433A0;
        Wed,  4 Jan 2023 17:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672852037;
        bh=XIJG7ewqo5kzp9edbZOx9BOvNMni+jLemYlHy7gF5jg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kfExFvmItt4dG419jptDEGrPnxaHEl7ANZY3Su0tEfVP9fWO7oyj4EAKfTnr/om74
         ohRHZkSDujsAQxXMzO/wDVR6RAGymtNmL5Jla6eiFErIrtUKAuK3JntirLyOJtl9B8
         uSMx5PSyx7yu03mz4T7FX51KaNCSi8PNUGW/ekWS0FqraBIyMtW212zxsAcpGrdWQg
         PePwf21cYLqd27Do/l7O6V7q3kBK+EfOD2pWMqxHpdd98mRDuEXjt9IHslTaCyxNjh
         zhjmUGRMv8YiAqWQnalrYloStOP/QdV3iDytIohrGr9vQA0VfPChDY69BD+1qFN4xH
         xe+N83K8+1MpQ==
Received: by mail-lf1-f49.google.com with SMTP id b3so51334140lfv.2;
        Wed, 04 Jan 2023 09:07:17 -0800 (PST)
X-Gm-Message-State: AFqh2kp6krRbk5HI6C01pHOWYwSbvnqz/VXnixH+++djHrUFqw37CfSj
        kxn7jNO8nDsmZbOmJaV9JkaKs7YhRmHc7hcKDuE=
X-Google-Smtp-Source: AMrXdXundjKp8Y8z3TAzqVpDm1DiOwJOMJ1w4ildaIhc+9uQOPt8d+wG6ixJzIoFdowAOSSzx68CkqC0YZEraLz7J2w=
X-Received: by 2002:a05:6512:3f07:b0:4ca:f873:7cf3 with SMTP id
 y7-20020a0565123f0700b004caf8737cf3mr3156707lfa.89.1672852035170; Wed, 04 Jan
 2023 09:07:15 -0800 (PST)
MIME-Version: 1.0
References: <20221230112729.351-1-thunder.leizhen@huawei.com>
 <20221230112729.351-3-thunder.leizhen@huawei.com> <Y7WoZARt37xGpjXD@alley>
In-Reply-To: <Y7WoZARt37xGpjXD@alley>
From:   Song Liu <song@kernel.org>
Date:   Wed, 4 Jan 2023 09:07:02 -0800
X-Gmail-Original-Message-ID: <CAPhsuW6sZ9yQvZvKLd0g9m4FoabmUzwn-txX6T_A-_VYgJoXFg@mail.gmail.com>
Message-ID: <CAPhsuW6sZ9yQvZvKLd0g9m4FoabmUzwn-txX6T_A-_VYgJoXFg@mail.gmail.com>
Subject: Re: [PATCH 2/3] bpf: Optimize get_modules_for_addrs()
To:     Petr Mladek <pmladek@suse.com>
Cc:     Zhen Lei <thunder.leizhen@huawei.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Miroslav Benes <mbenes@suse.cz>,
        Joe Lawrence <joe.lawrence@redhat.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau <martin.lau@linux.dev>,
        Yonghong Song <yhs@fb.com>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>,
        Stanislav Fomichev <sdf@google.com>,
        Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, bpf@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, live-patching@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
        linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

On Wed, Jan 4, 2023 at 8:25 AM Petr Mladek <pmladek@suse.com> wrote:
>
> On Fri 2022-12-30 19:27:28, Zhen Lei wrote:
> > Function __module_address() can quickly return the pointer of the module
> > to which an address belongs. We do not need to traverse the symbols of all
> > modules to check whether each address in addrs[] is the start address of
> > the corresponding symbol, because register_fprobe_ips() will do this check
> > later.
> >
> > Assuming that there are m modules, each module has n symbols on average,
> > and the number of addresses 'addrs_cnt' is abbreviated as K. Then the time
> > complexity of the original method is O(K * log(K)) + O(m * n * log(K)),
> > and the time complexity of current method is O(K * (log(m) + M)), M <= m.
> > (m * n * log(K)) / (K * m) ==> n / log2(K). Even if n is 10 and K is 128,
> > the ratio is still greater than 1. Therefore, the new method will
> > generally have better performance.
> >
> > Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> > ---
> >  kernel/trace/bpf_trace.c | 101 ++++++++++++++++-----------------------
> >  1 file changed, 40 insertions(+), 61 deletions(-)
> >
> > diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
> > index 5f3be4bc16403a5..0ff9037098bd241 100644
> > --- a/kernel/trace/bpf_trace.c
> > +++ b/kernel/trace/bpf_trace.c
> > @@ -2684,69 +2684,55 @@ static void symbols_swap_r(void *a, void *b, int size, const void *priv)
> >       }
> >  }
> >
> > -struct module_addr_args {
> > -     unsigned long *addrs;
> > -     u32 addrs_cnt;
> > -     struct module **mods;
> > -     int mods_cnt;
> > -     int mods_cap;
> > -};
> > -
> > -static int module_callback(void *data, const char *name,
> > -                        struct module *mod, unsigned long addr)
> > +static int get_modules_for_addrs(struct module ***out_mods, unsigned long *addrs, u32 addrs_cnt)
> >  {
> > -     struct module_addr_args *args = data;
> > -     struct module **mods;
> > -
> > -     /* We iterate all modules symbols and for each we:
> > -      * - search for it in provided addresses array
> > -      * - if found we check if we already have the module pointer stored
> > -      *   (we iterate modules sequentially, so we can check just the last
> > -      *   module pointer)
> > -      * - take module reference and store it
> > -      */
> > -     if (!bsearch(&addr, args->addrs, args->addrs_cnt, sizeof(addr),
> > -                    bpf_kprobe_multi_addrs_cmp))
> > -             return 0;
> > +     int i, j, err;
> > +     int mods_cnt = 0;
> > +     int mods_cap = 0;
> > +     struct module *mod;
> > +     struct module **mods = NULL;
> >
> > -     if (args->mods && args->mods[args->mods_cnt - 1] == mod)
> > -             return 0;
> > +     for (i = 0; i < addrs_cnt; i++) {
> > +             mod = __module_address(addrs[i]);
>
> This must be called under module_mutex to make sure that the module
> would not disappear.

module_mutex is not available outside kernel/module/. The common
practice is to disable preempt before calling __module_address().
CONFIG_LOCKDEP should catch this.

Thanks,
Song

[...]
