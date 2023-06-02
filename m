Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7B76720067
	for <lists+linux-modules@lfdr.de>; Fri,  2 Jun 2023 13:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235245AbjFBL3f (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Fri, 2 Jun 2023 07:29:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235229AbjFBL3e (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Fri, 2 Jun 2023 07:29:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D09D118D
        for <linux-modules@vger.kernel.org>; Fri,  2 Jun 2023 04:29:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6CB4B64EF4
        for <linux-modules@vger.kernel.org>; Fri,  2 Jun 2023 11:29:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C15CAC433D2;
        Fri,  2 Jun 2023 11:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685705372;
        bh=n7vAGTnCrd43is2+uLpx8FdU9aTJkEgC1DMzVVpPbEA=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=F/cWmkBuh1LYpOWtXNKHXnGWHXnmEWmVuUT0ClELR80pazXOV61OzlRjGNtSL5vpW
         Z1Fk/XU5vkWfQ4mkvxysbr/9CCulzQrmiMoHmjbOKVQfTO4mSnYw2JTGXfx4kkIU1q
         QlK8Q87sEarJI+2DgUrUlBkxUoPYrSM7jStFq1jD9IMz6OCHSXQPnZwvOBzvn09Trg
         WynyikvBkHP3wl5253EV8AgQAEi4Ot11em38Y6M0k7hzjd8PUctSXkj2edoEWmIdvV
         e5ywHTI0XPA7CsGgPOp0CXeudjJX9CCWF0h8ke3GKQJYcutFNvvl9xiVp6/fujbwVH
         5yYljsnML1n1g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AD8C4E52BF5;
        Fri,  2 Jun 2023 11:29:32 +0000 (UTC)
Subject: Re: [GIT PULL] Modules fixes for v6.4-rc5 second pull request
From:   pr-tracker-bot@kernel.org
In-Reply-To: <ZHkQvyEdTqJRC3G/@bombadil.infradead.org>
References: <ZHkQvyEdTqJRC3G/@bombadil.infradead.org>
X-PR-Tracked-List-Id: <linux-modules.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZHkQvyEdTqJRC3G/@bombadil.infradead.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/ tags/modules-6.4-rc5-second-pull
X-PR-Tracked-Commit-Id: fadb74f9f2f609238070c7ca1b04933dc9400e4a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c43a6ff9f93f230cc0f448ebb5d86d277ad7771e
Message-Id: <168570537270.30896.7569334631442494188.pr-tracker-bot@kernel.org>
Date:   Fri, 02 Jun 2023 11:29:32 +0000
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-modules@vger.kernel.org,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>, mcgrof@kernel.org
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

The pull request you sent on Thu, 1 Jun 2023 14:42:23 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/ tags/modules-6.4-rc5-second-pull

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c43a6ff9f93f230cc0f448ebb5d86d277ad7771e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
