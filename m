Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C99A744504
	for <lists+linux-modules@lfdr.de>; Sat,  1 Jul 2023 01:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbjF3XJN (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Fri, 30 Jun 2023 19:09:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjF3XJM (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Fri, 30 Jun 2023 19:09:12 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FDAB2D60
        for <linux-modules@vger.kernel.org>; Fri, 30 Jun 2023 16:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=sQH8tccFhYX/NQeWTti+WtaVv10KvJyfQCLpKVIjTBE=; b=wd7Mqjy08sPiR4+0fwIdZ25XoR
        nZmIhg+DZ+mCOnOdGCP77YT3GSlTkAjuw27hceuVscfUKBj1Vg8bF5SU2z0o3VuQwB4OTtyjmRl6y
        9b4klXqEi3fYQiBks75szNI+m+TXMWLsxfppof15/7hnMk3iiElEZUWxLADM2K7wb5XniyM2pXmKJ
        SodL6SPun5c7XgRx1Y8lwK2FQ5BXkyJsMqtyxcitLozNkV1CFm+5LFRWE+0SHnQc7gcWAzfKs4Pyl
        NBuKXf6j3eYjbvNFV2xKkpTWv3jD59h3jqqcdg6vyaTlJmeGzWRfJVsnDlKbtUbXxvRdF4OL1cqND
        ozxePWLA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
        id 1qFNEh-004jg2-2c;
        Fri, 30 Jun 2023 23:09:07 +0000
Date:   Fri, 30 Jun 2023 16:09:07 -0700
From:   Luis Chamberlain <mcgrof@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>
Cc:     Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
        Dave Airlie <airlied@redhat.com>, linux-modules@vger.kernel.org
Subject: Re: [PATCH 2/2] modules/firmware: add a new option to denote a
 firmware group to choose one.
Message-ID: <ZJ9gk1Y9l1TUbu/t@bombadil.infradead.org>
References: <20230426042906.724352-1-airlied@gmail.com>
 <20230426042906.724352-2-airlied@gmail.com>
 <dd6bd147-6d5f-ee2c-4feb-ec3376c01a87@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd6bd147-6d5f-ee2c-4feb-ec3376c01a87@infradead.org>
Sender: Luis Chamberlain <mcgrof@infradead.org>
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

On Thu, Jun 22, 2023 at 02:12:32PM -0700, Randy Dunlap wrote:
> Is this going anywhere? It was posted about 2 months ago.

Last I heard Dave was still working with Lucas on this?

  Luis
