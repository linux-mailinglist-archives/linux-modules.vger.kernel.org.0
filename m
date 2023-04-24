Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CBF96ED838
	for <lists+linux-modules@lfdr.de>; Tue, 25 Apr 2023 00:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232290AbjDXW5A (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Mon, 24 Apr 2023 18:57:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232064AbjDXW47 (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Mon, 24 Apr 2023 18:56:59 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E5E8658F
        for <linux-modules@vger.kernel.org>; Mon, 24 Apr 2023 15:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=HzgjvK0ubj+ERQ1LfdXCjji6k+DvtKZctwDhlZRvBX8=; b=h7dfZeFWODQdL55Xv4rMJoQ0VU
        8Auf/8mLAQebtblG9YCG/QgnwvOTGYf23iClnaJQNnNmq261w85lu3/nMIqiK3TV9XpNyPJi03LAh
        eJs/i9l9HdvYLmI7L0kW7imDFKxKt4J/TH4QjDCUH9QmcbxKfnonbbbvJSN0k7pmrkKZy9PFQsSyu
        2CJmyfYIv1KAzMQ7bkq641c1+6AhMZh9Fgmt7LekAdidEw0dJB5GdzkOxZgJ2Q5RrgO7udxQk510/
        ZjzKo7XLo4G0YSJP4lCoEoSqq+ZUwC3JrGZWj7oqnKKPeszpdAbobsudxNF6B7baegH5O/h70Tr31
        tXo3HbjQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
        id 1pr577-00HJon-2V;
        Mon, 24 Apr 2023 22:56:53 +0000
Date:   Mon, 24 Apr 2023 15:56:53 -0700
From:   Luis Chamberlain <mcgrof@kernel.org>
To:     Lucas De Marchi <lucas.demarchi@intel.com>
Cc:     Dave Airlie <airlied@gmail.com>, Dave Airlie <airlied@redhat.com>,
        dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org
Subject: Re: [PATCH] modules/firmware: add a new option to denote a firmware
 group to choose one.
Message-ID: <ZEcJNcz+ArLfUSJ1@bombadil.infradead.org>
References: <20230419043652.1773413-1-airlied@gmail.com>
 <ck2dzxvllhhh74oa3vjlacutc7rdmgl7cfrfq7vgx4w3jcufrz@7jbgxcat42yn>
 <CAPM=9tw0Y2A4DvuTHT_yd58Eit+tUmo63pbEOHwRJ66LeqznEQ@mail.gmail.com>
 <fsleccud43leoioli6bj4xoydwbdcjb5qr4denuf6morhgtqki@t6xya2mygon5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fsleccud43leoioli6bj4xoydwbdcjb5qr4denuf6morhgtqki@t6xya2mygon5>
Sender: Luis Chamberlain <mcgrof@infradead.org>
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

On Mon, Apr 24, 2023 at 10:01:13AM -0700, Lucas De Marchi wrote:
> On Mon, Apr 24, 2023 at 03:44:18PM +1000, Dave Airlie wrote:
> > On Fri, 21 Apr 2023 at 05:09, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> > > 
> > > On Wed, Apr 19, 2023 at 02:36:52PM +1000, Dave Airlie wrote:
> > > >From: Dave Airlie <airlied@redhat.com>
> > > >
> > > >This adds a tag that will go into the module info, only one firmware from
> > > >the group given needs to be available for this driver to work. This allows
> > > >dracut to avoid adding in firmware that aren't needed.
> > > >
> > > >This just brackets a module list in the modinfo, the modules in the list
> > > >will get entries in reversed order so the last module in the list is the
> > > >preferred one.
> > > >
> > > >The corresponding dracut code it at:
> > > >https://github.com/dracutdevs/dracut/pull/2309
> > > 
> > > it would be good to have the example usage in the commit message here so
> > > it can be easily checked as reference for other drivers.
> > 
> > Good point.
> > 
> > > 
> > > I don't think we ever had any ordering in modinfo being relevant for
> > > other things. Considering the use case and that we could also use a
> > > similar thing for i915 / xe modules wrt to the major version,
> > > couldn't we do something like below?
> > > 
> > >         MODULE_FIRMWARE_GROUP("nvidia/ga106/gsp/gsp");
> > >         MODULE_FIRMWARE("nvidia/ga106/gsp/gsp-5258902.bin");
> > >         MODULE_FIRMWARE("nvidia/ga106/gsp/gsp-5303002.bin");
> > > 
> > > so the group is created by startswith() rather than by the order the
> > > modinfo appears in the elf section. In i915 we'd have:
> > 
> > The way userspace parses these is reverse order, and it doesn't see
> 
> the main issue I have with it is that it relies on a order that is
> implicit rather than intended. The order comes from how the .modinfo ELF
> section is assembled together... so the fact that your call to
> kmod_module_get_info() returns a list with the keys in the reverse order
> of the MODULE_FIRMWARE() definitions, is basically because the compiler
> toolchain did it did that way.
> 
> It's worse when those sections come from different compilation units as
> the order then is not predictable and can easily break with changes to
> the build infra if the files are linked in different order.
> 
> I think the grouping thing here would only be supported with firmware
> defined on the same compilation unit, but it's something to keep in mind
> and document.

I had provided a simple API to help with explicit linker order years ago:

https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/log/?h=20170620-linker-tables-v8

Other than that you have to rely on the order in the Makefile or way
in which they are declared.

> > the GROUP until after the FIRMWARE, so this can't work, as it already
> > will have included all the ones below, hence why I bracketed top and
> > bottom with a group.
> 
> well... that is something that can be adapted easily by using a 2 pass
> approach, filtering out the list based on the groups.
> 
> I agree that yours is simpler though.  If we can rely on the
> order produced by the compiler and we document the expectations of
> MODULE_FIRMWARE_GROUP_ONLY_ONE, then I believe we can stay with the
> simpler approach.
> 
> Luis, any thoughts here?

I see the Dracut code indicates that the order says now that you should
put the preferred firmware last, and that seems to match most coding
conventions, ie, new firmwares likely get added last, so it's a nice
coincidence. Will this always work? I don't know. But if you like to
hedge, then this seems fine so long as I'm folks follow up to fix issues
later. I think it should and the simplicity is preferred, worth a shot
I think.

But the examples on both sides are pretty terrible. I'd just like to ask
all this gets extended in proper kdoc form and we are able to get users
and developers to read this under "Module support" in:

https://docs.kernel.org/core-api/kernel-api.html

So go to town with a new section for:

Documentation/core-api/kernel-api.rst

  Luis
