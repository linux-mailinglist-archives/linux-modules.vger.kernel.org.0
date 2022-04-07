Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D96C4F8AD6
	for <lists+linux-modules@lfdr.de>; Fri,  8 Apr 2022 02:55:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232259AbiDGWmn (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Thu, 7 Apr 2022 18:42:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232349AbiDGWmj (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Thu, 7 Apr 2022 18:42:39 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F7621104
        for <linux-modules@vger.kernel.org>; Thu,  7 Apr 2022 15:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649371239; x=1680907239;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9SkfOj1ZxRtuZePifUOOJAEYz0RAqHe5+sfEwb+V0vc=;
  b=SA0+CcvYR4DTVchzQO1S0mREZBzyD70HvqxyD2rRcec8Xt1XjLFGGqoK
   d9iG6t7xxs8y/9RVrUwe157MMeq/+OxgpUoXeGlosDSt/51MBBGg81FyF
   PDLS4D7HwyV4PwuxIZvK+saQENt3jDGfLqv+GBuNaBvn1Uts2HljJ/590
   KlvgaMXELoRp8Y4G04EikrFOBpnExTc3lViCFImwtmWQno+2r7t8tZUeZ
   IG2c7EZ5+vkAqxoW3Ys5UlhlJlfJ2n8TnAzzTD/ZbhUJHaw2BFKSs+2ux
   /gn+Y8bTrag2JYFhh22OMma2I2PAwytsVkjtlVL7qpSv8PjUq3fdyTv6J
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="261148413"
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; 
   d="scan'208";a="261148413"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2022 15:40:37 -0700
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; 
   d="scan'208";a="589000529"
Received: from ldmartin-desk2.jf.intel.com ([134.134.244.73])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2022 15:40:37 -0700
Date:   Thu, 7 Apr 2022 15:40:37 -0700
From:   Lucas De Marchi <lucas.demarchi@intel.com>
To:     Yang Yanchao <yangyanchao6@huawei.com>
Cc:     linux-modules@vger.kernel.org, lucas.de.marchi@gmail.com,
        linfeilong@huawei.com
Subject: Re: depmod searches in dictionary order
Message-ID: <20220407224037.bkrqxb5qqjair34n@ldmartin-desk2.jf.intel.com>
References: <20220325012107.902-1-yangyanchao6@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220325012107.902-1-yangyanchao6@huawei.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

On Fri, Mar 25, 2022 at 09:21:07AM +0800, Yang Yanchao wrote:
>Hello,
>
>depmod uses readdir to traverse /lib/modules/`uname -r`/,
>but readdir sorts files by d_off.
>
>It means that if I create two links with the same name in the weak-updates
>directory, for example:
>
>weak-updates/opt/kernel1/extra/a.ko ->/ opt/kernel1/extra/a.ko
>weak-updates/opt/kernel2/extra/a.ko ->/ opt/kernel2/extra/a.ko

what are these kernel1 and kernel2?

depmod respects the priority configured in depmod.d for searching,
but here it seems you have only weak-updates configured in your depmod.d
so both of them have the same priority.

Looks rather like you want this in your config rather than using
symlinks:

	external * /opt/kernel1/extra /opt/kernel2/extra

but I don't know what kernel1 and kernel2 are in your setup.


Lucas De Marchi

>
>Even with the same kernel, the same module may generate different
>modules.dep on different machines, and it is impossible to predict which ko will be used
>
>Maybe we can cache the directory name first and sort it?
>If can develop in this direction, I will try to make a patch
>
>Best Regards,
>Yang Yanchao
