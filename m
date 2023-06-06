Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCD80724B6E
	for <lists+linux-modules@lfdr.de>; Tue,  6 Jun 2023 20:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232684AbjFFSaw (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Tue, 6 Jun 2023 14:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233949AbjFFSav (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Tue, 6 Jun 2023 14:30:51 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B5781702
        for <linux-modules@vger.kernel.org>; Tue,  6 Jun 2023 11:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Wzv4tIvQ2JCxG0vwz92etX6nJHWaoFQgeH23tksz+9I=; b=Nvba9MzCZZFdXInVguG9FAnwo+
        EHEfBLBjoBl+hev2AejUbLHDnPHcqhcpYUQGfSETdCeK4LGlPYnJ0bKp7eJiLeETEvukpw87f56AO
        PgGf87J8v/Iir9G5veB9GyKPX/vI6et2bHlsq9HmRcW3CBm6H9frjbf32RtKnOJ3NydsFOvezLVTi
        zTsqeXjVuyq0brG7hAVp9/nopwR05iyLiZjkHkdzRfFTQkxbHJi9dW0Z5cx5pwfxjZCilo89rcdNO
        0mzFdiM0+HFG94/qCyy208hFulmEmuWUdswx2gjzubUcX/l+hdvn+7KVw8uOm7pHirERN2sztRX01
        crZMK9MA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
        id 1q6bSE-002m2s-1G;
        Tue, 06 Jun 2023 18:30:50 +0000
Date:   Tue, 6 Jun 2023 11:30:50 -0700
From:   Luis Chamberlain <mcgrof@kernel.org>
To:     Lucas De Marchi <lucas.de.marchi@gmail.com>
Cc:     linux-modules@vger.kernel.org
Subject: Re: [PATCH 4/5] libkmod: Keep track of in-kernel compression support
Message-ID: <ZH97Wq7JM4uq7fTQ@bombadil.infradead.org>
References: <20230601224001.23397-1-lucas.de.marchi@gmail.com>
 <20230601224001.23397-5-lucas.de.marchi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601224001.23397-5-lucas.de.marchi@gmail.com>
Sender: Luis Chamberlain <mcgrof@infradead.org>
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

On Thu, Jun 01, 2023 at 03:40:00PM -0700, Lucas De Marchi wrote:
> When creating the context, read /sys/kernel/compression to check what's
> the compression type supported by the kernel. This will later be used
> when loading modules to check if the decompression step has to happen in
> userspace or if it can be delegated to the kernel.
> 
> Signed-off-by: Lucas De Marchi <lucas.de.marchi@gmail.com>

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis
