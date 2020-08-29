Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AFFE2566C5
	for <lists+linux-modules@lfdr.de>; Sat, 29 Aug 2020 12:03:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbgH2KDm (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Sat, 29 Aug 2020 06:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbgH2KDm (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Sat, 29 Aug 2020 06:03:42 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C07D2C061236
        for <linux-modules@vger.kernel.org>; Sat, 29 Aug 2020 03:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=vI8CU+ZCGkwpW90YRbazkFoX2T1xZaJj8xp3Ts/U+dw=; b=RMH6rBsYoNDC7ympp6+i6W/s5l
        BFHjlpGtO8YaAlc5Lcv1+SV0Zzx7n5OjvaDaijw+bTt9PIFziTZ9sowDnmcOviMfFzk+Feu4uV9At
        93T1YDQBxLivJgarUvPkrQ8/ZQs+juEHvUE96r5UmOtp2+ZfU9p8oZGti352fLXbFA4ZMBP/4qQQ/
        yc7Duz6WFdXrKlkQcCERotJrn/FaiOlfsf7fgS0NdBgFxdqTx9qjq147GuPiPh43gZwOGlv0V4/2V
        jdUTWEQhzuWPu7nKz3kJcIJXxWOaOW8dhMaYvORM2awDoyrna6phemlqvQd1DUFD/ef+/mgUupBy/
        zb+w1OEA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kBxhy-0002xJ-Eo; Sat, 29 Aug 2020 10:03:38 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 29D0B3011F0;
        Sat, 29 Aug 2020 12:03:34 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 82D6222B8F163; Sat, 29 Aug 2020 12:03:34 +0200 (CEST)
Date:   Sat, 29 Aug 2020 12:03:34 +0200
From:   peterz@infradead.org
To:     Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc:     linux-modules@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, will@kernel.org,
        ardb@kernel.org, jeyu@kernel.org, masahiroy@kernel.org
Subject: Re: [ARM64][GCC10] Kernel can't load any module due to RWX check
Message-ID: <20200829100334.GK1362448@hirez.programming.kicks-ass.net>
References: <b3158cec-b722-cbe8-5a82-47890a227da4@gmx.com>
 <2d00ffc3-1176-1b80-20a5-e7f6babf924a@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d00ffc3-1176-1b80-20a5-e7f6babf924a@gmx.com>
Sender: owner-linux-modules@vger.kernel.org
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

On Sat, Aug 29, 2020 at 03:49:36PM +0800, Qu Wenruo wrote:

> Hi Peter, any idea how could this commit causing a regression on arm64
> but not on x86_64?

It's a bug^Wfeature in binutils-2.35.

See this thread: https://lkml.kernel.org/r/20200808101222.5103093e@coco.lan

People are working on a fix, see the tail of that thread.
