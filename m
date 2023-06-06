Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB1DA724B65
	for <lists+linux-modules@lfdr.de>; Tue,  6 Jun 2023 20:29:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233653AbjFFS3H (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Tue, 6 Jun 2023 14:29:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238143AbjFFS3G (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Tue, 6 Jun 2023 14:29:06 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A7E2170D
        for <linux-modules@vger.kernel.org>; Tue,  6 Jun 2023 11:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Wzv4tIvQ2JCxG0vwz92etX6nJHWaoFQgeH23tksz+9I=; b=3XdKnYQoqIuNvgMlmzI6gSHXXZ
        C+FtxOVpfAGNXPPp4bhCWWBgbnmVuTJWEmiUXL7bIJIqA6kSCgnIggDZYeqATtnlnIq3KMNeHxCYn
        vD815WIdiwiaSnsMIU60PueXZBC9bIhPXmsq5RLzi1z0jURLPdUrdSTsYFtVvQUJH6LRYEx9y+xBk
        jV0hAwPL1tPEB/sfaqp2vpm5cZa4Lb3HOPecm7vxhZ+eBV8nUUaOvpNkBmWy6NZ8rLNYIMDDqCrev
        hKCW6iTVLrK8cH9IrFeoQGwqSA6Hh/8pBYOHjVq1Oyt78vFXLgIiWQN/MMM49Paaq+6r3m9G+Jtr7
        Ma29KFRw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
        id 1q6bQU-002lqs-1K;
        Tue, 06 Jun 2023 18:29:02 +0000
Date:   Tue, 6 Jun 2023 11:29:02 -0700
From:   Luis Chamberlain <mcgrof@kernel.org>
To:     Lucas De Marchi <lucas.de.marchi@gmail.com>
Cc:     linux-modules@vger.kernel.org
Subject: Re: [PATCH 4/5] libkmod: Keep track of in-kernel compression support
Message-ID: <ZH967oybKMDMPsNt@bombadil.infradead.org>
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
