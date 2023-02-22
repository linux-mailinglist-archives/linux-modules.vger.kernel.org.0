Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BED269FE72
	for <lists+linux-modules@lfdr.de>; Wed, 22 Feb 2023 23:25:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232880AbjBVWZa (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Wed, 22 Feb 2023 17:25:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232817AbjBVWZ0 (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Wed, 22 Feb 2023 17:25:26 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A7DD41B57;
        Wed, 22 Feb 2023 14:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=L3thRE4eX8buSCZPs0bA9NvffhgYCEzUstyMSlWVQD0=; b=GntIox46Bim6bb6wBspzGRIGNv
        sVv8CifGU+deMJGnTQRtHGjCahRLKszq7hnLyXd9mTpc5Y2yU0w+kz1cS6/yuX5UC/na1hxObERUP
        umdcD70GPfLDwexs2OgxSF5ffpkp8bG5dq/jne4D6jAIbmDJ7S0SKhNayY5frmIgje+Kw7kl0tjie
        q8rr4iPj/fXpXYnFnKW719VhpUoUrrDHBJf9wwVOIvHr5GNzX9kUchWiyjDv3rgyf3fzAofuA33qc
        pj55hnm1o3IZaZdJPiZRtHZnVhxreRTmfDVDBWacEgojr5ECZM5Lr4XypDN2BL2Dp6SId9RhcQ0Oo
        tfEW0WtQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1pUxYB-00EId5-IQ; Wed, 22 Feb 2023 22:25:23 +0000
Date:   Wed, 22 Feb 2023 14:25:23 -0800
From:   Luis Chamberlain <mcgrof@kernel.org>
To:     Nick Alcock <nick.alcock@oracle.com>
Cc:     linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-kernel@vger.kernel.org, elena.zannoni@oracle.com
Subject: Re: [PATCH modules-next v10 00/13] kallsyms: reliable
 symbol->address lookup with /proc/kallmodsyms
Message-ID: <Y/aWU9VzkZcRyf/k@bombadil.infradead.org>
References: <20221205163157.269335-1-nick.alcock@oracle.com>
 <Y8b8TOJzd/RZXR8z@bombadil.infradead.org>
 <87r0uy3hkw.fsf@esperi.org.uk>
 <87bkm22y6e.fsf@esperi.org.uk>
 <Y/U8MuL24OZzbIIp@bombadil.infradead.org>
 <87edqhsy1f.fsf@esperi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87edqhsy1f.fsf@esperi.org.uk>
Sender: Luis Chamberlain <mcgrof@infradead.org>
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

On Wed, Feb 22, 2023 at 12:08:12PM +0000, Nick Alcock wrote:
> On 21 Feb 2023, Luis Chamberlain stated:
> 
> > On Thu, Feb 09, 2023 at 11:53:29PM +0000, Nick Alcock wrote:
> >> [most people trimmed from the Cc: list for this procedural question]
> >> 
> >> On 9 Feb 2023, Nick Alcock outgrape:
> >> > I am going to split this whole series into:
> >> >
> >> > 1. A series of patches (123 of them at present) Cc:ed to subsystem
> >> > maintainers as well as you, to comment out the MODULE_LICENSE usage.
> >> > These patches will have Suggested-by you. This series is rebased against
> >> > the latest modules-next and revalidated, and is ready to be mailed out;
> >> > will do so shortly.
> >> 
> >> One quick question: if/when you're happy with this series, are you
> >> planning to take it yourself via modules-next?
> >
> > It seems some maintainers are already taking patches in, so let's see
> > what folks take in, then if there are not takers I can just take what is
> > not merged on linux-next through modules-next.
> > 
> > So try to get them into each subsystem tree, and around rc3 send the
> > ones that are not merged and I'll just take them into modules-next.
> 
> Sounds good! I can trivially regenerate a new patch series containing
> only the still-missing bits without needing to do anything like track
> who took things, because nearly all of this is automated anyway.

Fantastic.

> ... at least I can if I can figure out where all the subsystem trees
> that people took them into are (not everyone might mention when they
> take one).

This is why I use linux-next. It represents all the latest trees merged.

> I might miss a few, but I suspect that's not a problem:
> taking the same commit by two different routes does not constitute a
> conflict, at least on its own.

Right.

  Luis
