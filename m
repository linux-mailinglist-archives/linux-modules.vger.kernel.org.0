Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 807684B3BAA
	for <lists+linux-modules@lfdr.de>; Sun, 13 Feb 2022 15:14:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236404AbiBMOOz (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Sun, 13 Feb 2022 09:14:55 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236348AbiBMOOz (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Sun, 13 Feb 2022 09:14:55 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D800E5F257
        for <linux-modules@vger.kernel.org>; Sun, 13 Feb 2022 06:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644761687;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6GDOxQGVDeSQrF28P9dVTC7+ArRcSB51YDX/25gUBmk=;
        b=CwIDRfHgHhKjzmg9E9encOU8yHIfqWMtzOjw2N5E0ypAdi/J9BJNYmfGVfe+uZe2zeSp8r
        WAxou3qgldiG4b7aK07DV3wUiU5ToiHmrFXZ353svfVYE1WoOdkQJXbGB6dSHJzMpTgLS9
        nHkd3bXicq+1rsVl6NG54gDDB9WANKM=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-8DZnUB1dP7i4uxjz2d2B5w-1; Sun, 13 Feb 2022 09:14:46 -0500
X-MC-Unique: 8DZnUB1dP7i4uxjz2d2B5w-1
Received: by mail-lf1-f70.google.com with SMTP id j11-20020a19f50b000000b00443304eab91so705854lfb.13
        for <linux-modules@vger.kernel.org>; Sun, 13 Feb 2022 06:14:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6GDOxQGVDeSQrF28P9dVTC7+ArRcSB51YDX/25gUBmk=;
        b=yDcI92FwoVjhmahs8pJiJ1eji1Tf+ZN/fSKmqMG32YYfC4gV4draTyPe1gbLreXFzj
         +chtWTrGvPmUssKPFgBFEyJy72hFemlnW50YfITnTued12NvqSVoGHaNZF+kO0Uv6qaJ
         1XMLR9uVWqpMusDN0xoaZgelVZWFKTV3YD2NGeqzbDiSHHS87cwxR9ZtGeevfVNKpYtp
         koN3VePt/Y21tNuS4mAC5KZk+sKXBxlLzALODIyH31pdS7gUH2TVwIQjdz4IA5nXbDkS
         XckZzYp9QhHz/sGcEZiRa4weW8i457Ho0o+fZ7eWd16ytdCm+Bf8lw9MBEdFkxRb/2Fu
         tjSA==
X-Gm-Message-State: AOAM533KohBL2ryuS4oaeFNTGR8lscMHeg8fy7+8u6Del+OVDuTqJGWh
        XssE8OzzbmXWAECBYIh7ZbjX2cPPs5IIZ8qLNwrgh8G1oOH0ikfQLPcNEpSkEHqU5C560UvoW57
        ViVSO0r3saXKpzaWFtm24NFeA4JXr3vwt6mz8qBAD
X-Received: by 2002:a05:6512:15a6:: with SMTP id bp38mr306537lfb.118.1644761685069;
        Sun, 13 Feb 2022 06:14:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz83mwJy3I8oyj2IUUhtEPCDsHcc8BfCTfKxbZpJ9hv+glH5AqSuXL7NCVk+fr+Wru9cOxrowgs5fTnrb6RBiU=
X-Received: by 2002:a05:6512:15a6:: with SMTP id bp38mr306524lfb.118.1644761684887;
 Sun, 13 Feb 2022 06:14:44 -0800 (PST)
MIME-Version: 1.0
References: <20220209171118.3269581-1-atomlin@redhat.com> <20220209171118.3269581-2-atomlin@redhat.com>
 <3a3cc6b3-7bac-3cfd-ce56-7c71abb2de60@csgroup.eu>
In-Reply-To: <3a3cc6b3-7bac-3cfd-ce56-7c71abb2de60@csgroup.eu>
From:   Aaron Tomlin <atomlin@redhat.com>
Date:   Sun, 13 Feb 2022 14:14:33 +0000
Message-ID: <CANfR36in5DJ_QwOcOPyzfd28V2CPK1PTir8uDauF9R+9wr2i_Q@mail.gmail.com>
Subject: Re: [PATCH v5 12/13] module: Move kdb_modules list out of core code
To:     Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     "mcgrof@kernel.org" <mcgrof@kernel.org>,
        "cl@linux.com" <cl@linux.com>,
        "pmladek@suse.com" <pmladek@suse.com>,
        "mbenes@suse.cz" <mbenes@suse.cz>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "jeyu@kernel.org" <jeyu@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
        "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>,
        "atomlin@atomlin.com" <atomlin@atomlin.com>,
        "ghalat@redhat.com" <ghalat@redhat.com>,
        "allen.lkml@gmail.com" <allen.lkml@gmail.com>,
        "void@manifault.com" <void@manifault.com>,
        "joe@perches.com" <joe@perches.com>,
        "msuchanek@suse.de" <msuchanek@suse.de>,
        "oleksandr@natalenko.name" <oleksandr@natalenko.name>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

On Thu 2022-02-10 14:05 +0000, Christophe Leroy wrote:
> > diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> > index 0852a537dad4..f101f5f078f4 100644
> > --- a/kernel/debug/kdb/kdb_main.c
> > +++ b/kernel/debug/kdb/kdb_main.c
> > @@ -59,6 +59,11 @@ EXPORT_SYMBOL(kdb_grepping_flag);
> >   int kdb_grep_leading;
> >   int kdb_grep_trailing;
> >
> > +#ifdef CONFIG_MODULES
> > +extern struct list_head modules;
>
> Should go in module.h

I disagree. Let's keep it restricted somewhat. The list of loaded/or added
modules is not widely used.

> > +struct list_head *kdb_modules = &modules; /* kdb needs the list of modules */
>
> Should be static and should be removed from kernel/debug/kdb/kdb_private.h

Agreed. It is only used in kernel/debug/kdb/kdb_main.c.

> > diff --git a/kernel/module/internal.h b/kernel/module/internal.h
> > index 52d30bf6d6b0..c49b4900b30b 100644
> > --- a/kernel/module/internal.h
> > +++ b/kernel/module/internal.h
> > @@ -225,6 +225,7 @@ static int mod_sysfs_setup(struct module *mod,
> >   {
> >       return 0;
> >   }
> > +
>
> This should go in previous patch if needed (patch 11 sysfs)

Agreed.


Kind regards,

-- 
Aaron Tomlin

