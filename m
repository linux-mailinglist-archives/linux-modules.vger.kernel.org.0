Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED0EE514530
	for <lists+linux-modules@lfdr.de>; Fri, 29 Apr 2022 11:15:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356265AbiD2JSf (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Fri, 29 Apr 2022 05:18:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237883AbiD2JSd (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Fri, 29 Apr 2022 05:18:33 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D63CF719E1;
        Fri, 29 Apr 2022 02:15:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id E05F3CE310F;
        Fri, 29 Apr 2022 09:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FF0C385A4;
        Fri, 29 Apr 2022 09:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651223711;
        bh=Rt1ur9nS0pMhrSDXxpNKo8guUozgMtHYvzS6ezjQrAo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KhNi1SPdn2Ww7LL6ne7QFCiwphU1Ky3CyPMi5kXt7eVyc8pn5ABDLHMMV1U+VV2iD
         32FZV4TzdxhpbxNo7QVounT3axefuUxPhJtcO1a7qpBPZMii7neI39Vk26ok/u6Whz
         O2RkSNk2Hw083dSUG1MhMcjAK8f6xGrjj/uyX9fQ87uwMDTlkvcVdiDU2YAp59ToKE
         mXLtn8rfDHCAANvuQ+g1fh3STE1J1CEr9M7LWC5zXqS5XDigR6BVsAiEb2npt0YNYP
         NI6fpYMJCK/Ae0YL56MP8Kp2+Wb8S0gyciOKbjqjpNjwiN3EGfu9GcBXtdpwtsVwT/
         u24iKzomoPJ/Q==
Date:   Fri, 29 Apr 2022 10:15:03 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>
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
Message-ID: <20220429101503.4048db5b@sal.lan>
In-Reply-To: <YmuiKcHgl+nABvo/@kroah.com>
References: <cover.1651212016.git.mchehab@kernel.org>
        <a078eb2e46d00ec59c8a91ea0afa5190730c9e58.1651212016.git.mchehab@kernel.org>
        <YmuZovuDaCYDDG4c@phenom.ffwll.local>
        <20220429090757.1acb943a@sal.lan>
        <YmuiKcHgl+nABvo/@kroah.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

HI Greg,

Em Fri, 29 Apr 2022 10:30:33 +0200
Greg KH <gregkh@linuxfoundation.org> escreveu:

> On Fri, Apr 29, 2022 at 09:07:57AM +0100, Mauro Carvalho Chehab wrote:
> > Hi Daniel,
> > 
> > Em Fri, 29 Apr 2022 09:54:10 +0200
> > Daniel Vetter <daniel@ffwll.ch> escreveu:
> >   
> > > On Fri, Apr 29, 2022 at 07:31:15AM +0100, Mauro Carvalho Chehab wrote:  
> > > > Sometimes, device drivers are bound using indirect references,
> > > > which is not visible when looking at /proc/modules or lsmod.
> > > > 
> > > > Add a function to allow setting up module references for such
> > > > cases.
> > > > 
> > > > Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> > > > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>    
> > > 
> > > This sounds like duct tape at the wrong level. We should have a
> > > device_link connecting these devices, and maybe device_link internally
> > > needs to make sure the respective driver modules stay around for long
> > > enough too. But open-coding this all over the place into every driver that
> > > has some kind of cross-driver dependency sounds terrible.
> > > 
> > > Or maybe the bug is that the snd driver keeps accessing the hw/component
> > > side when that is just plain gone. Iirc there's still fundamental issues
> > > there on the sound side of things, which have been attempted to paper over
> > > by timeouts and stuff like that in the past instead of enforcing a hard
> > > link between the snd and i915 side.  
> > 
> > I agree with you that the device link between snd-hda and the DRM driver
> > should properly handle unbinding on both directions. This is something
> > that require further discussions with ALSA and DRM people, and we should
> > keep working on it.
> > 
> > Yet, the binding between those drivers do exist, but, despite other
> > similar inter-driver bindings being properly reported by lsmod, this one
> > is invisible for userspace.
> > 
> > What this series does is to make such binding visible. As simple as that.  
> 
> It also increases the reference count, and creates a user/kernel api
> with the symlinks, right?  Will the reference count increase prevent the
> modules from now being unloadable?
>
> This feels like a very "weak" link between modules that should not be
> needed if reference counting is implemented properly (so that things are
> cleaned up in the correct order.)

The refcount increment exists even without this patch, as
hda_component_master_bind() at sound/hda/hdac_component.c uses 
try_module_get() when it creates the device link.

This series won't change anything with that regards. The only difference
is that it will now properly report userspace that snd-hda will be
using something inside the DRM driver (basically, it uses the DRM driver
to power-control the HDA hardware on modern CPU/GPUs).

-

Btw, this is not the only case where userspace invisible bindings between
two driver happen within the Kernel. On media, DVB drivers attach
the frontend/tuner drivers using I2C bus on a way where lsmod doesn't
current report any dependencies. See, for instance, PCTV 290e driver
(partial) dependency chain:

	$ lsmod
	Module                  Size  Used by
	rc_pinnacle_pctv_hd    16384  0
	em28xx_rc              20480  0
	tda18271               53248  1
	cxd2820r               45056  1
	em28xx_dvb             36864  0
	dvb_core              155648  2 cxd2820r,em28xx_dvb
	em28xx                106496  2 em28xx_rc,em28xx_dvb
	tveeprom               28672  1 em28xx
	videobuf2_vmalloc      20480  1 uvcvideo
	videobuf2_memops       20480  1 videobuf2_vmalloc
	videobuf2_common       69632  4 videobuf2_vmalloc,videobuf2_v4l2,uvcvideo,videobuf2_memops
	videodev              266240  4 videobuf2_v4l2,uvcvideo,videobuf2_common,em28xx
	mc                     65536  6 videodev,videobuf2_v4l2,uvcvideo,dvb_core,videobuf2_common,em28xx

In the above example, tda18271 is an I2C tuner driver which talks
to the hardware via the I2C bus registered by the em28xx driver.
It is loaded during em28xx probing time.

Again, lsmod doesn't show such dependencies. One can't remove the
tuner driver without first removing the em28xx driver, which is
the one that increments its refcount.

-

Back to the snd-hda issue, the problem is not with refcount. It is, instead,
to provide a way for userspace to know what's the correct order to 
remove/unbind modules.

Regards,
Mauro
