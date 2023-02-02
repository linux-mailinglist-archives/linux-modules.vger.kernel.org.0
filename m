Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 846F9688744
	for <lists+linux-modules@lfdr.de>; Thu,  2 Feb 2023 20:01:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233088AbjBBTBd (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Thu, 2 Feb 2023 14:01:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232217AbjBBTBc (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Thu, 2 Feb 2023 14:01:32 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A34D23DA9
        for <linux-modules@vger.kernel.org>; Thu,  2 Feb 2023 11:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=hNMff7YdqX1wpbCJF+Ho0oW0FT6is8jIzrJyVsVqTPc=; b=y7qntC5cJ8a0evOnb1Q1wWHIyS
        QMMQtWT/aW4HEFfqK9o+y6QcxiJ2H9LxsNybPhNAViuGXhMnvHBDA2cA3tq8hu96vntB0fkS9nXce
        mzs0Zgw+ykr8MbrA4GySbHt6JjUTgnt5GKhl9plvEJvZxeHd/4WMqf7EBzypx+Q12SkqKgN6cE5yO
        cgSchW7J4LiO1Ba1Eugcx1umSXu8m9F6EkcIffPK+hQfvtQDW+1TdkLp0D/cN3LG+54ZmN0nScPWT
        uHCSuZpg+8miWudiKYfQpY5xEBomBd82qMYMB/oa/hKMR61yZjfrnwUeOxKgcu0ANCfZqnillcwGA
        dyK3m1Yw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1pNepu-00H1bR-7s; Thu, 02 Feb 2023 19:01:30 +0000
Date:   Thu, 2 Feb 2023 11:01:30 -0800
From:   Luis Chamberlain <mcgrof@kernel.org>
To:     Yauheni Kaliuta <ykaliuta@redhat.com>
Cc:     linux-modules@vger.kernel.org, lucas.de.marchi@gmail.com
Subject: Re: [PATCH] man/rmmod: explain why modprobe -r is more useful
Message-ID: <Y9wIiub1mlxJEYU8@bombadil.infradead.org>
References: <20230202134736.405778-1-ykaliuta@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230202134736.405778-1-ykaliuta@redhat.com>
Sender: Luis Chamberlain <mcgrof@infradead.org>
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

On Thu, Feb 02, 2023 at 03:47:36PM +0200, Yauheni Kaliuta wrote:
> Improve user experience by explaining the option so the user may
> not search explanations in other manpages (modprobe).
> 
> Signed-off-by: Yauheni Kaliuta <ykaliuta@redhat.com>

Good idea,

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis
