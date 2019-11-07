Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24DBEF2CA2
	for <lists+linux-modules@lfdr.de>; Thu,  7 Nov 2019 11:36:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387870AbfKGKgT (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Thu, 7 Nov 2019 05:36:19 -0500
Received: from monster.unsafe.ru ([5.9.28.80]:59148 "EHLO mail.unsafe.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726866AbfKGKgT (ORCPT <rfc822;linux-modules@vger.kernel.org>);
        Thu, 7 Nov 2019 05:36:19 -0500
X-Greylist: delayed 349 seconds by postgrey-1.27 at vger.kernel.org; Thu, 07 Nov 2019 05:36:18 EST
Received: from MacBook-PC.fortress (nat-pool-brq-t.redhat.com [213.175.37.10])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.unsafe.ru (Postfix) with ESMTPSA id A3C90C61AB1;
        Thu,  7 Nov 2019 10:30:27 +0000 (UTC)
Date:   Thu, 7 Nov 2019 11:30:25 +0100
From:   Alexey Gladkov <gladkov.alexey@gmail.com>
To:     linux-modules@vger.kernel.org
Cc:     Lucas De Marchi <lucas.de.marchi@gmail.com>
Subject: Re: [PATCH v1 0/4] Add modules.builtin.modinfo support
Message-ID: <20191107103025.ysgffcf4fj5avknh@MacBook-PC.fortress>
Mail-Followup-To: linux-modules@vger.kernel.org,
        Lucas De Marchi <lucas.de.marchi@gmail.com>
References: <20191011081956.4127892-1-gladkov.alexey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191011081956.4127892-1-gladkov.alexey@gmail.com>
Sender: owner-linux-modules@vger.kernel.org
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

On Fri, Oct 11, 2019 at 10:19:52AM +0200, Alexey Gladkov wrote:
> The kernel since version v5.2-rc1 exports information about built-in
> modules in the modules.builtin.modinfo. Now, kmod can show complete information
> about the built-in modules as well as about external modules. Also kmod can
> understand aliases of built-in modules.
> 
> Before:
> 
> $ modinfo block-major-9-1
> modinfo: ERROR: Module block-major-9-1 not found.
> 
> After:
> 
> $ modinfo block-major-9-1
> name:           md_mod
> filename:       (builtin)
> alias:          block-major-9-*
> alias:          md
> description:    MD RAID framework
> license:        GPL
> parm:           start_dirty_degraded:int
> parm:           create_on_open:bool

Please review.

> Alexey Gladkov (4):
>   libkmod: Add parser for modules.builtin.modinfo
>   libkmod: Add function to get list of built-in modules
>   Lookup aliases in the modules.builtin.modinfo
>   modinfo: Show information about built-in modules
> 
>  Makefile.am                |   1 +
>  libkmod/libkmod-builtin.c  | 231 +++++++++++++++++++++++++++++++++++++
>  libkmod/libkmod-internal.h |  10 ++
>  libkmod/libkmod-module.c   |  76 ++++++++++--
>  libkmod/libkmod.c          |  25 ++++
>  libkmod/libkmod.h          |   1 +
>  tools/depmod.c             |  63 ++++++++++
>  tools/modinfo.c            |  39 ++++---
>  8 files changed, 419 insertions(+), 27 deletions(-)
>  create mode 100644 libkmod/libkmod-builtin.c
> 
> -- 
> 2.21.0
> 

-- 
Rgrds, legion

