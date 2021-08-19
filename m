Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 662D13F1CB7
	for <lists+linux-modules@lfdr.de>; Thu, 19 Aug 2021 17:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239578AbhHSP2w (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Thu, 19 Aug 2021 11:28:52 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:47288 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238643AbhHSP2v (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Thu, 19 Aug 2021 11:28:51 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 96D8F1FDB3;
        Thu, 19 Aug 2021 15:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1629386890;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kr6ax75RDQM75AhdKI4ptNi7kDlOeTak+FEaRlVGM4I=;
        b=UnZJzl2ACYxjLkiOKESSD91eFCGuA0Hv8/zsr3spWoXzkll6AtpwBt3eYQoufe1sPmeerV
        +/YwnqB2IM1m0txAv5DXNtmtCH7jSQCIWF8/39ABGDiDaDaRCENWNwMUp/IJse+nPn4n8s
        3I1+8CIQN9SDkKYW4OwnOs8M/RPyvwE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1629386890;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kr6ax75RDQM75AhdKI4ptNi7kDlOeTak+FEaRlVGM4I=;
        b=Y/nTBuCUygrRMpud1yy9+v0Fq0arHdCyBYQrrxnr9FcVQUC+jEexyGxzYeSMLsbeyRes1s
        qmefWxZ+9dtv65AA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 4306013A13;
        Thu, 19 Aug 2021 15:28:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id cSmPDYp4HmGpGwAAGKfGzw
        (envelope-from <pvorel@suse.cz>); Thu, 19 Aug 2021 15:28:10 +0000
Date:   Thu, 19 Aug 2021 17:28:08 +0200
From:   Petr Vorel <pvorel@suse.cz>
To:     Lucas De Marchi <lucas.demarchi@intel.com>
Cc:     linux-modules <linux-modules@vger.kernel.org>,
        Michal Suchanek <msuchanek@suse.de>,
        Takashi Iwai <tiwai@suse.de>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>
Subject: Re: [PATCH v2] libkmod: Set builtin to no when module is created
 from path.
Message-ID: <YR54iKYSJSsUBcPU@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20210818205159.6066-1-msuchanek@suse.de>
 <20210818212440.2224127-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818212440.2224127-1-lucas.demarchi@intel.com>
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

Hi all,

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr
