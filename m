Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F93F6F5AC6
	for <lists+linux-modules@lfdr.de>; Wed,  3 May 2023 17:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbjECPS7 (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Wed, 3 May 2023 11:18:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230337AbjECPSy (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Wed, 3 May 2023 11:18:54 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17C6C6E85
        for <linux-modules@vger.kernel.org>; Wed,  3 May 2023 08:18:53 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-55a5a830238so34332997b3.3
        for <linux-modules@vger.kernel.org>; Wed, 03 May 2023 08:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683127132; x=1685719132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4wxKwRBUKexs/Rpj6bBCWyCDPYyPPHlLlNupBtzYaw=;
        b=uY9LZ4++hkvUyhbn5c4syfgYI214i342bZOqq7w3PZ5UnX1WOR8kP1Dd5DgdTFpHBZ
         YFrejpNwEwyVtgjJ2h7DJZZwM3wlarwFrdmlWF4/IbYdcLzhZu9eWfASeY3cBcMIJeWN
         TmMwBt2giD3P+L/dV8xN4DWdOteVRuLxU576D+QIIYn5IEbMmRqCsDy6wH6RisaS2En+
         77gau1VuW9LbpE+De59atSjH+/wZB+Rihg2dpbAxr/rgo94K50BySclFMG/5QR1qXpJU
         YHFq9FmHNI3H6tgkwrY1pQTOJWYJg3qmXEmnIBPxV25YxcUtyGvErDZS2P4I8lHhi3Z5
         NkBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683127132; x=1685719132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i4wxKwRBUKexs/Rpj6bBCWyCDPYyPPHlLlNupBtzYaw=;
        b=WrT53TeGd3NpP36S/KGyE2mBs9niD6rnb0Kqd3P3UN3/aVPfZPHZTwdMNJF9iGcI4K
         K2KaD7Xpdw3pCN7lx9gUvuH41e3XqbIS7ItWj0Nkc6Wrsr6UJ9q/oQrjzVY0CtwZBNcH
         mWMzLgrrT8E7/11RhB9KZnCCVs9r5sqZL4HzGkW5xGynIpy53c1GWiVEMxFhr5Qar+ze
         nSlEVU98LZFXzn/z4XpLGHotcWqNnNY5W5gnXExdu+ymKmJZHl4ohLGUsz2Qe4m2IiD+
         HtrstLpj+8Jijmj0LCFDfIH+axvLc6te+edeBpZCpa/3UzxgnEeLQamAU+0EFchKPyH5
         obXg==
X-Gm-Message-State: AC+VfDzLqwz0/b7wUMMFU44nKt/GyNdYR8x7yh7vUWw/yNHqusTtOMVI
        cwPzeGRIpnx4qDuxlQT26WSp4qRYaQYP2G1HG2MUYA==
X-Google-Smtp-Source: ACHHUZ4K+d9eu2MhiXikUKkPbraytc5q+SB8DjlC4OAFlU81ddI4JrxvOKqNrFRbhuXyiN7N0776W6I4xeufDIeaumw=
X-Received: by 2002:a25:6844:0:b0:b9d:90d1:6301 with SMTP id
 d65-20020a256844000000b00b9d90d16301mr17445969ybc.47.1683127131990; Wed, 03
 May 2023 08:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230501165450.15352-1-surenb@google.com> <20230501165450.15352-35-surenb@google.com>
 <ZFIO3tXCbmTn53uv@dhcp22.suse.cz>
In-Reply-To: <ZFIO3tXCbmTn53uv@dhcp22.suse.cz>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Wed, 3 May 2023 08:18:39 -0700
Message-ID: <CAJuCfpHrZ4kWYFPvA3W9J+CmNMuOtGa_ZMXE9fOmKsPQeNt2tg@mail.gmail.com>
Subject: Re: [PATCH 34/40] lib: code tagging context capture support
To:     Michal Hocko <mhocko@suse.com>
Cc:     akpm@linux-foundation.org, kent.overstreet@linux.dev,
        vbabka@suse.cz, hannes@cmpxchg.org, roman.gushchin@linux.dev,
        mgorman@suse.de, dave@stgolabs.net, willy@infradead.org,
        liam.howlett@oracle.com, corbet@lwn.net, void@manifault.com,
        peterz@infradead.org, juri.lelli@redhat.com, ldufour@linux.ibm.com,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
        x86@kernel.org, peterx@redhat.com, david@redhat.com,
        axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org,
        nathan@kernel.org, dennis@kernel.org, tj@kernel.org,
        muchun.song@linux.dev, rppt@kernel.org, paulmck@kernel.org,
        pasha.tatashin@soleen.com, yosryahmed@google.com,
        yuzhao@google.com, dhowells@redhat.com, hughd@google.com,
        andreyknvl@gmail.com, keescook@chromium.org,
        ndesaulniers@google.com, gregkh@linuxfoundation.org,
        ebiggers@google.com, ytcoode@gmail.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        bristot@redhat.com, vschneid@redhat.com, cl@linux.com,
        penberg@kernel.org, iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com,
        glider@google.com, elver@google.com, dvyukov@google.com,
        shakeelb@google.com, songmuchun@bytedance.com, jbaron@akamai.com,
        rientjes@google.com, minchan@google.com, kaleshsingh@google.com,
        kernel-team@android.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-modules@vger.kernel.org,
        kasan-dev@googlegroups.com, cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

On Wed, May 3, 2023 at 12:36=E2=80=AFAM Michal Hocko <mhocko@suse.com> wrot=
e:
>
> On Mon 01-05-23 09:54:44, Suren Baghdasaryan wrote:
> [...]
> > +static inline void add_ctx(struct codetag_ctx *ctx,
> > +                        struct codetag_with_ctx *ctc)
> > +{
> > +     kref_init(&ctx->refcount);
> > +     spin_lock(&ctc->ctx_lock);
> > +     ctx->flags =3D CTC_FLAG_CTX_PTR;
> > +     ctx->ctc =3D ctc;
> > +     list_add_tail(&ctx->node, &ctc->ctx_head);
> > +     spin_unlock(&ctc->ctx_lock);
>
> AFAIU every single tracked allocation will get its own codetag_ctx.
> There is no aggregation per allocation site or anything else. This looks
> like a scalability and a memory overhead red flag to me.

True. The allocations here would not be limited. We could introduce a
global limit to the amount of memory that we can use to store contexts
and maybe reuse the oldest entry (in LRU fashion) when we hit that
limit?

>
> > +}
> > +
> > +static inline void rem_ctx(struct codetag_ctx *ctx,
> > +                        void (*free_ctx)(struct kref *refcount))
> > +{
> > +     struct codetag_with_ctx *ctc =3D ctx->ctc;
> > +
> > +     spin_lock(&ctc->ctx_lock);
>
> This could deadlock when allocator is called from the IRQ context.

I see. spin_lock_irqsave() then?

Thanks for the feedback!
Suren.

>
> > +     /* ctx might have been removed while we were using it */
> > +     if (!list_empty(&ctx->node))
> > +             list_del_init(&ctx->node);
> > +     spin_unlock(&ctc->ctx_lock);
> > +     kref_put(&ctx->refcount, free_ctx);
> --
> Michal Hocko
> SUSE Labs
