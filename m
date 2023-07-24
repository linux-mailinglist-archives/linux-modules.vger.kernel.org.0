Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64230760093
	for <lists+linux-modules@lfdr.de>; Mon, 24 Jul 2023 22:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbjGXUha (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Mon, 24 Jul 2023 16:37:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbjGXUh3 (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Mon, 24 Jul 2023 16:37:29 -0400
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0A0410E2
        for <linux-modules@vger.kernel.org>; Mon, 24 Jul 2023 13:37:28 -0700 (PDT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6bb0ba9fc81so8666816a34.2
        for <linux-modules@vger.kernel.org>; Mon, 24 Jul 2023 13:37:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690231048; x=1690835848;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oJ7trwGgOy74ZMmx1WSYkhxwukYNWfMR8FKYB/XHJWk=;
        b=TZJCFI7TFg3ZVk+c0yoxkbIDpS1/Oxj4Cb3+kdCK9ZtbeCsWUFzddCCZ+mhkDvi3iE
         PxZN2StzlV90JaHDqJbyXfAeoLNDYcjFtWiFUW01N6K1bVAhF2EHK/Pb4lBFJYJ+XTco
         XQmkEiMFm57p2nDt2y2apsduf69LCMm49iYWf1qVPd2eZ0BhAe22c0XFTrcAl9nukC26
         uI/fNmV9+jGm+5dDQRO1OKYzYZLe+repkfO2gx8mfO0P/pI5n/CfZERlRmJR61KS3ql8
         +FJNe/pH7pcyvbII64kkp0AGhqB7eREMJctf5aCGYNwWhHU6WwQNQd4bKYsLv8YQ0GIs
         ZA6w==
X-Gm-Message-State: ABy/qLZYHhScLCijfWhPjEFS4nQ7uh8X41sDtyE7OR2W9K55CH2S3vpq
        QSR74EBocPt/o8SnzqpOUuzF6KvoxOsk9hiUlvnWBKpHC8pw
X-Google-Smtp-Source: APBJJlFWQnGftlrdER0j6SIMnKqOAkXNGK//D4qIZMkaaSZT9cyUVxOEEr75aCJTNAtgB0vgDsd0BSkGhTjvPdwIAwtEiZ9CyWSu
MIME-Version: 1.0
X-Received: by 2002:a9d:68cc:0:b0:6b4:5ee1:a988 with SMTP id
 i12-20020a9d68cc000000b006b45ee1a988mr11110645oto.5.1690231048090; Mon, 24
 Jul 2023 13:37:28 -0700 (PDT)
Date:   Mon, 24 Jul 2023 13:37:28 -0700
In-Reply-To: <ZL7fhuAHmlcEHj73@bombadil.infradead.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000035b866060141957e@google.com>
Subject: Re: [syzbot] [modules?] WARNING in init_module_from_file
From:   syzbot <syzbot+9c2bdc9d24e4a7abe741@syzkaller.appspotmail.com>
To:     bpf@vger.kernel.org, chris@chrisdown.name,
        linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
        llvm@lists.linux.dev, mcgrof@kernel.org, nathan@kernel.org,
        ndesaulniers@google.com, syzkaller-bugs@googlegroups.com,
        trix@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

drivers/gpu/drm/bridge/samsung-dsim.c:730: undefined reference to `phy_mipi_dphy_get_default_config_for_hsclk'


Tested on:

commit:         910e230d samples/hw_breakpoint: Fix kernel BUG 'invali..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
dashboard link: https://syzkaller.appspot.com/bug?extid=9c2bdc9d24e4a7abe741
compiler:       aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64

Note: no patches were applied.
