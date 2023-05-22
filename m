Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1A570CF0E
	for <lists+linux-modules@lfdr.de>; Tue, 23 May 2023 02:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231897AbjEWAYo (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Mon, 22 May 2023 20:24:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235144AbjEWAM4 (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Mon, 22 May 2023 20:12:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07FEDE6C;
        Mon, 22 May 2023 16:33:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 93310619EF;
        Mon, 22 May 2023 23:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0140CC433EF;
        Mon, 22 May 2023 23:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684798438;
        bh=BoE/AL38pXrSF4StDVPj+q72OKr21YQ0EEfYz+I4tKs=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=ReG1q9Kz+bFBuuBOfoc9N/MUCprN6w+WHVTvaFk8Mlc23y+9G+l8x3Okr94oWcRUP
         yg+ypeneQSRfkNt4MVaKRBBQMHHWDabjd/wRi3/TwSMongqqfMnY4Tv5DDHT6ivtet
         qPk4ZfdRMJJPXTcxSupKOY5WSMkXnp9s/d9C9ZTREZcOxcoKGB54E1jzX3Xe0SjCH+
         0QFXllXMpbJeC56z8zFu8nD8WMPXM7TVes5YYCH46gXGKc0KhPKiv6mw0lQQx+14j7
         45ieWvGGCAZqiTrLSASVLY5HNmxF8QomouHqEK0gVFJysa75NrPPT1/+sclrQEzduR
         1Q7f04FlbJkgQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D925CE22AEB;
        Mon, 22 May 2023 23:33:57 +0000 (UTC)
Subject: Re: [GIT PULL] Modules fixes for v6.4-rc4
From:   pr-tracker-bot@kernel.org
In-Reply-To: <ZGvev3uX1SjH+7od@bombadil.infradead.org>
References: <ZGvev3uX1SjH+7od@bombadil.infradead.org>
X-PR-Tracked-List-Id: <patches.lists.linux.dev>
X-PR-Tracked-Message-Id: <ZGvev3uX1SjH+7od@bombadil.infradead.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/ tags/modules-6.4-rc4
X-PR-Tracked-Commit-Id: d36f6efbe0cb422fe1e4475717d75f3737088832
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1177dcc9637661e05c18aa019a49821bcd6b3dc1
Message-Id: <168479843788.6623.422001700278816596.pr-tracker-bot@kernel.org>
Date:   Mon, 22 May 2023 23:33:57 +0000
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     torvalds@linux-foundation.org, patches@lists.linux.dev,
        linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
        harshit.m.mogalapalli@oracle.com, song@kernel.org,
        mcgrof@kernel.org
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

The pull request you sent on Mon, 22 May 2023 14:29:35 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/ tags/modules-6.4-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1177dcc9637661e05c18aa019a49821bcd6b3dc1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
