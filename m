Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80C7D514650
	for <lists+linux-modules@lfdr.de>; Fri, 29 Apr 2022 12:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357247AbiD2KNb (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Fri, 29 Apr 2022 06:13:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357252AbiD2KN3 (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Fri, 29 Apr 2022 06:13:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 499EF6335;
        Fri, 29 Apr 2022 03:10:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2F17C6230A;
        Fri, 29 Apr 2022 10:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10EDBC385AD;
        Fri, 29 Apr 2022 10:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1651227010;
        bh=/fZkfLjWpmIzhdcxrKUWxcmqUV1u1Y3FbmbQ8JbUy1Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OcZ3H86tp/Jk8BaNgocIT5hnynF3bb/7AyyykOP2bQIno2P9PAhMqBT8aY6HX1Xnp
         7E3bNt9X93xBxz7L8xUKzAFo+K/H4BP4R1ksbf9Ybo947jWW2YnkbghthPWkp6BEq8
         jieo7akxYIqUd6M2CjQoDFGgu1RCwZb88gR/WPB4=
Date:   Fri, 29 Apr 2022 12:10:07 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Luis Chamberlain <mcgrof@kernel.org>, mauro.chehab@intel.com,
        Kai Vehmanen <kai.vehmanen@intel.com>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@intel.com>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 1/2] module: add a function to add module references
Message-ID: <Ymu5f8EjdC1Mawzt@kroah.com>
References: <cover.1651212016.git.mchehab@kernel.org>
 <a078eb2e46d00ec59c8a91ea0afa5190730c9e58.1651212016.git.mchehab@kernel.org>
 <YmuZovuDaCYDDG4c@phenom.ffwll.local>
 <20220429090757.1acb943a@sal.lan>
 <YmuiKcHgl+nABvo/@kroah.com>
 <20220429101503.4048db5b@sal.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220429101503.4048db5b@sal.lan>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

On Fri, Apr 29, 2022 at 10:15:03AM +0100, Mauro Carvalho Chehab wrote:
> HI Greg,
> 
> Em Fri, 29 Apr 2022 10:30:33 +0200
> Greg KH <gregkh@linuxfoundation.org> escreveu:
> 
> > On Fri, Apr 29, 2022 at 09:07:57AM +0100, Mauro Carvalho Chehab wrote:
> > > Hi Daniel,
> > > 
> > > Em Fri, 29 Apr 2022 09:54:10 +0200
> > > Daniel Vetter <daniel@ffwll.ch> escreveu:
> > >   
> > > > On Fri, Apr 29, 2022 at 07:31:15AM +0100, Mauro Carvalho Chehab wrote:  
> > > > > Sometimes, device drivers are bound using indirect references,
> > > > > which is not visible when looking at /proc/modules or lsmod.
> > > > > 
> > > > > Add a function to allow setting up module references for such
> > > > > cases.
> > > > > 
> > > > > Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> > > > > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>    
> > > > 
> > > > This sounds like duct tape at the wrong level. We should have a
> > > > device_link connecting these devices, and maybe device_link internally
> > > > needs to make sure the respective driver modules stay around for long
> > > > enough too. But open-coding this all over the place into every driver that
> > > > has some kind of cross-driver dependency sounds terrible.
> > > > 
> > > > Or maybe the bug is that the snd driver keeps accessing the hw/component
> > > > side when that is just plain gone. Iirc there's still fundamental issues
> > > > there on the sound side of things, which have been attempted to paper over
> > > > by timeouts and stuff like that in the past instead of enforcing a hard
> > > > link between the snd and i915 side.  
> > > 
> > > I agree with you that the device link between snd-hda and the DRM driver
> > > should properly handle unbinding on both directions. This is something
> > > that require further discussions with ALSA and DRM people, and we should
> > > keep working on it.
> > > 
> > > Yet, the binding between those drivers do exist, but, despite other
> > > similar inter-driver bindings being properly reported by lsmod, this one
> > > is invisible for userspace.
> > > 
> > > What this series does is to make such binding visible. As simple as that.  
> > 
> > It also increases the reference count, and creates a user/kernel api
> > with the symlinks, right?  Will the reference count increase prevent the
> > modules from now being unloadable?
> >
> > This feels like a very "weak" link between modules that should not be
> > needed if reference counting is implemented properly (so that things are
> > cleaned up in the correct order.)
> 
> The refcount increment exists even without this patch, as
> hda_component_master_bind() at sound/hda/hdac_component.c uses 
> try_module_get() when it creates the device link.

Ok, then why shouldn't try_module_get() be creating this link instead of
having to manually do it this way again?  You don't want to have to go
around and add this call to all users of that function, right?

thanks,

greg k-h
