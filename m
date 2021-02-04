Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1BD30F09C
	for <lists+linux-modules@lfdr.de>; Thu,  4 Feb 2021 11:30:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235457AbhBDKZi (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Thu, 4 Feb 2021 05:25:38 -0500
Received: from mx2.suse.de ([195.135.220.15]:58750 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235452AbhBDKZb (ORCPT <rfc822;linux-modules@vger.kernel.org>);
        Thu, 4 Feb 2021 05:25:31 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id D5629B009;
        Thu,  4 Feb 2021 10:24:49 +0000 (UTC)
Date:   Thu, 4 Feb 2021 11:24:48 +0100
From:   Petr Vorel <pvorel@suse.cz>
To:     Lucas De Marchi <lucas.demarchi@intel.com>
Cc:     linux-modules@vger.kernel.org,
        Michal =?iso-8859-2?Q?Such=E1nek?= <msuchanek@suse.de>
Subject: Re: [PATCH 1/2] testsuite: compress modules if feature is enabled
Message-ID: <20210130023600.24239-1-lucas.demarchi@intel.com>
Reply-To: Petr Vorel <pvorel@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

Hi,

Reviewed-by: Petr Vorel <pvorel@suse.cz>
Great, thank you!

> +feature_enabled() {
> +	local feature=$1
> +	grep KMOD_FEATURES  $CONFIG_H | head -n 1 | grep -q \+$feature
nit: using grep single time is IMHO enough
grep -q "define KMOD_FEATURES.*\+$feature" $CONFIG_H
> +}

Kind regards,
Petr
