Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 521B2724B5F
	for <lists+linux-modules@lfdr.de>; Tue,  6 Jun 2023 20:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233910AbjFFS1V (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Tue, 6 Jun 2023 14:27:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238524AbjFFS1V (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Tue, 6 Jun 2023 14:27:21 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F63D11D
        for <linux-modules@vger.kernel.org>; Tue,  6 Jun 2023 11:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=hjrTs0TxieL0YNzyDWEPIDruwOv/idGljdXgl+AVQ5s=; b=MJKGhxm9gG1Vp5thR+DB+s950Y
        LAMKrgYKPfEi6KEA/MHgDXaXkMAZMNGw7nO0shagMM7tyVV4U16iB9F30UUuKbzEX9tnhsdwAWRuX
        47vhWBXM3C7mobJAkn6o5VLynrz1GyRDrCbs/o9C1mbHBC3CYLRHbRTxls9s0tSHnjIebjbbaIwLy
        QI+JR9ZoqWe45LRJjOS5dEHEfHrdnZMpfJW9UcErASfT0oPQW+iIyRGSZEZffIHaI91KAF9bL7VSr
        PWHUFXup+8ud9EAvMxEAj0lB8ofcn3/SIN61okA1zzL83K9Zq8DequJlWRAexSNtxRIW0Q3k6BPKG
        dBpNm1ow==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
        id 1q6bOq-002lfq-0T;
        Tue, 06 Jun 2023 18:27:20 +0000
Date:   Tue, 6 Jun 2023 11:27:20 -0700
From:   Luis Chamberlain <mcgrof@kernel.org>
To:     Lucas De Marchi <lucas.de.marchi@gmail.com>
Cc:     linux-modules@vger.kernel.org
Subject: Re: [PATCH 2/5] libkmod: Extract finit_module vs init_module paths
Message-ID: <ZH96iKWhwcQNZvOK@bombadil.infradead.org>
References: <20230601224001.23397-1-lucas.de.marchi@gmail.com>
 <20230601224001.23397-3-lucas.de.marchi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601224001.23397-3-lucas.de.marchi@gmail.com>
Sender: Luis Chamberlain <mcgrof@infradead.org>
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

On Thu, Jun 01, 2023 at 03:39:58PM -0700, Lucas De Marchi wrote:
> Extract 2 functions to handle finit_module vs init_modules differences,
> with a fallback from the former to the latter.
> 
> Signed-off-by: Lucas De Marchi <lucas.de.marchi@gmail.com>

Other than not checking for the error for kmod_file_load_contents()
looks good to me.

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis
