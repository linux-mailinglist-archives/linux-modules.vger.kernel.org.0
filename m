Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EFF51258CB
	for <lists+linux-modules@lfdr.de>; Thu, 19 Dec 2019 01:45:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbfLSApr (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Wed, 18 Dec 2019 19:45:47 -0500
Received: from mga03.intel.com ([134.134.136.65]:47066 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726518AbfLSApr (ORCPT <rfc822;linux-modules@vger.kernel.org>);
        Wed, 18 Dec 2019 19:45:47 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Dec 2019 16:45:47 -0800
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; 
   d="scan'208";a="213081117"
Received: from ldmartin-desk1.jf.intel.com ([134.134.244.162])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Dec 2019 16:45:46 -0800
Date:   Wed, 18 Dec 2019 16:45:38 -0800
From:   Lucas De Marchi <lucas.demarchi@intel.com>
To:     Jorge Lucangeli Obes <jorgelo@google.com>
Cc:     linux-modules@vger.kernel.org
Subject: Re: Buffer overflow in modprobe
Message-ID: <20191219004538.aqlw354ivugk7vym@ldmartin-desk1.jf.intel.com>
References: <CAKYuF5QhGCPCazHQjN-=kFc5kHs7Ok8WqmmGLo31CiOEN8TYdA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAKYuF5QhGCPCazHQjN-=kFc5kHs7Ok8WqmmGLo31CiOEN8TYdA@mail.gmail.com>
Sender: owner-linux-modules@vger.kernel.org
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

On Thu, Dec 12, 2019 at 02:16:18PM -0500, Jorge Lucangeli Obes wrote:
>Reset the state of was_space to false between passes.
>For your assistance, we have provided the following code:
>
>--- libkmod-config.c            2018-06-21 17:59:48.633600181 +0100
>+++ libkmod-config.fixed        2018-09-12 21:42:34.499453017 +0100 @@
>-333,6 +333,8 @@
>                memcpy(dep->name ,modname ,modnamelen);
>+        was_space = false;
>+               /* copy strings */

this looks reasonable. Are you the author of such change? Could you send
this as a patch with git send-email?

It would be nice to have a test added to the testsuite too if you can.

thanks
Lucas De Marchi


>               itr = dep->name + modnamelen;
>               n_pre = 0;
