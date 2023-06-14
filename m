Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68DF6724B61
	for <lists+linux-modules@lfdr.de>; Tue,  6 Jun 2023 20:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237837AbjFFS2D (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Tue, 6 Jun 2023 14:28:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233653AbjFFS2C (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Tue, 6 Jun 2023 14:28:02 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FD3011D
        for <linux-modules@vger.kernel.org>; Tue,  6 Jun 2023 11:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=A7Dr9GNnbb9MbNBEdzsUPL5BkPUJm0/U5CXY00f7mDs=; b=FM24cEb9UB1k6rAmHjkubB0YYr
        PbtBO5pl7afbrCaoc1lreCz7qdRulWCZR8akOAOK6x6FIZUnCgeU3FeVVSShk8+9pqu0TnMzoJHJC
        mxEj4yYzSyyg+/65AcqK4cL7Sn6EQW9mpKF4BOviNehyvQ4S1fErSenaek8Rs3L+eN3KqsmNZdes5
        I1A2eI71tzxSjVowf7G5N9j48QnQZDN7dclvyJsSJ1lVTiRgkkAnyyaPyz+MJ/oETc/3aBDVpqPlV
        hD1pU1GcqxYNBdnfcC3GXPPkzFP5BpGyYi2/rcOOe8liDOQws2Cprilm2JK85CU7KV2uY40BDHWrl
        Jcd4th9A==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
        id 1q6bPV-002ll3-1K;
        Tue, 06 Jun 2023 18:28:01 +0000
Date:   Tue, 6 Jun 2023 11:28:01 -0700
From:   Luis Chamberlain <mcgrof@kernel.org>
To:     Lucas De Marchi <lucas.de.marchi@gmail.com>
Cc:     linux-modules@vger.kernel.org
Subject: Re: [PATCH 3/5] libkmod: Keep track of compression type
Message-ID: <ZH96sTpb56cE2L69@bombadil.infradead.org>
References: <20230601224001.23397-1-lucas.de.marchi@gmail.com>
 <20230601224001.23397-4-lucas.de.marchi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601224001.23397-4-lucas.de.marchi@gmail.com>
Sender: Luis Chamberlain <mcgrof@infradead.org>
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

On Thu, Jun 01, 2023 at 03:39:59PM -0700, Lucas De Marchi wrote:
> Do not only set the type as direct, but also keep track of the
> compression being used. This will allow using the in-kernel compression
> in future.
> 
> Signed-off-by: Lucas De Marchi <lucas.de.marchi@gmail.com>

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis
