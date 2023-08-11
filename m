Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C50A877973E
	for <lists+linux-modules@lfdr.de>; Fri, 11 Aug 2023 20:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233928AbjHKSqJ (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Fri, 11 Aug 2023 14:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233418AbjHKSqG (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Fri, 11 Aug 2023 14:46:06 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 754543580
        for <linux-modules@vger.kernel.org>; Fri, 11 Aug 2023 11:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:
        Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description;
        bh=6Qehn4fXg0Ep3vgHeqIM19i1cKEfkMSOZj5FISDniEE=; b=WOaPIWsruBfAfcYq/tWSogv6x/
        o16JjhCiMhy3JGszZTIwkJpdcHOrx9+5b9F/rX+QwU8cKmGjYVX/LAvSy1vHtaN0o4dqGxLFCYRNQ
        P78aKGNn1VMLtnJUZRkXJb+CEkjI9fht/4POlTvfc5D2toF45wthF1WXonNszd9a1iXoqfEZh7M3u
        BBHMASBJZxCQXG+9PdlK0TWmlCGU+44tFEUb23dIiAhWGWgE3+XbtiPHx8u3lXblZzcbzM99cuKQn
        1zMCj6XFfOITW31WbBwwp1KKdADvpz/wnUZyU5/DEHNozVD7Ue7avLkc9oQCFX7WzKbhXydkFOEQM
        eYqUbPwg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
        id 1qUX94-00BO2e-0r;
        Fri, 11 Aug 2023 18:45:58 +0000
Date:   Fri, 11 Aug 2023 11:45:58 -0700
From:   Luis Chamberlain <mcgrof@kernel.org>
To:     Leslie Rhorer <lesrhorer@siliconventures.net>
Cc:     "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Subject: Re: module issues
Message-ID: <ZNaB5qHAcp1fxmgu@bombadil.infradead.org>
References: <c6d34094-7363-a462-5043-768f688aef66@siliconventures.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6d34094-7363-a462-5043-768f688aef66@siliconventures.net>
Sender: Luis Chamberlain <mcgrof@infradead.org>
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

On Thu, Aug 10, 2023 at 10:39:12PM -0500, Leslie Rhorer wrote:
> Hello all,
> 
>     About a yer or so ago, I upgraded one of my Debian servers to Bullseye,
> and it killed the 10G NIC on the server due to issues with the device driver
> in the Debian repository.  I jumped through all sorts of loops and hoops to
> try to get it working, but I finally had to give up and resort to using the
> 1G interface. Recently, I tried upgrading another server to the new Debian
> Bookworm, and it worked for that server, so apparently the issue has been
> fixed in Bookworm.
> 
>     With that in mind, I went ahead and upgraded the original server to
> Bookworm, but the NIC remains dead.  Unfortunately, I cannot find ny notes
> on what I did originally to try to get the 10G interface working and to shut
> it down in favor of a built-in port.  I do recall I tried compiling what was
> supposed to be the correct firmware driver and also changing the udev rules,
> but I do not recall the exact details.  I have tried several things,
> including re-installing the firmware, but nothing seems to work. The
> Ethernet interface does not appear on the system in order to be able to
> specify it in /etc/network/interfaces.  What can I do in order to try to get
> the 10G card working?
> 
>     The card is an Asus MCB-10G_PEB-10G NIC and uses the bnx2x.ko driver.
> The system uses an Asus AMD-64 motherboard.

Sounds like a networking driver issue, not a modules issue. So report
this to your driver maintainer and you can remove linux-modules from
the email.

./scripts/get_maintainer.pl drivers/net/ethernet/broadcom/bnx2x/
Ariel Elior <aelior@marvell.com> (supporter:BROADCOM BNX2X 10 GIGABIT ETHERNET DRIVER)
Sudarsana Kalluru <skalluru@marvell.com> (supporter:BROADCOM BNX2X 10 GIGABIT ETHERNET DRIVER)
Manish Chopra <manishc@marvell.com> (supporter:BROADCOM BNX2X 10 GIGABIT ETHERNET DRIVER)

<I'm skipping the generic networking maintainer list here>

netdev@vger.kernel.org (open list:BROADCOM BNX2X 10 GIGABIT ETHERNET DRIVER)
linux-kernel@vger.kernel.org (open list)

So email these folks, and you should be more specific about your kernel
version, and what the issue was. If its not an issue today, then you
need to be more specific about if its a regression present only in older
kernels.

  Luis
