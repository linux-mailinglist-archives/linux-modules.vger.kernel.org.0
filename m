Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCD557732D7
	for <lists+linux-modules@lfdr.de>; Tue,  8 Aug 2023 00:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbjHGWMs (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Mon, 7 Aug 2023 18:12:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbjHGWMg (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Mon, 7 Aug 2023 18:12:36 -0400
Received: from mail-ot1-x346.google.com (mail-ot1-x346.google.com [IPv6:2607:f8b0:4864:20::346])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE30126A6
        for <linux-modules@vger.kernel.org>; Mon,  7 Aug 2023 15:11:49 -0700 (PDT)
Received: by mail-ot1-x346.google.com with SMTP id 46e09a7af769-6bc9d79cbf6so8998263a34.1
        for <linux-modules@vger.kernel.org>; Mon, 07 Aug 2023 15:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691446186; x=1692050986;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IbpbMWxtwQHfKpcdmTM26gLkMYaV2V50D6axm5j5Juw=;
        b=VUytHKJP7+fO4pCR/nIwsp1WZHInrTEtz4T6K1BFATydmjj6GaUGod9Pv83YCFEyQA
         uRGfwSKVJYg1K6/OqTyfRR1YNh5otC9YmUMqHfenitzAfVDFnKDP48uM+SgSrZeAchfi
         /pgKZvmk13eV3xuztCxF3DfWhw/RBY8Z5l9JQyBFd2BZUxhSRpbbFnR0Mkw3PzIMPim1
         5/Qe28eQjoQbOIK5qK/BgtQTgL4Qnu+oi/eioGZXN3NCIt8COINP2M0TIIrcGxFwV3FU
         5wTNX72fHEh7/jwDEny7mdrJfrUP2wEtpw7PWuOzSzI6LDsAgk640FmvxCRiXUItUqjm
         KiBQ==
X-Gm-Message-State: AOJu0Yxn8FBy5hw2hP/e256gnpZqtJknxCPiKcCyDhCqB3f+QLD4slVX
        c3EPYNCIzxvTdyLNFbP9oJ5thjrk21oV0GTMiSwBSnQQU+yK
X-Google-Smtp-Source: AGHT+IEduFwtdxrh+dLlyzbh5NbikP80BVHQF2BeYV5I9pFjtdMLw1auLZ7MNsAr6GJ8o7Xm4UJOf0qu7vj4mp34E3NWMDrQCIWQ
MIME-Version: 1.0
X-Received: by 2002:a05:6830:148c:b0:6b8:c631:5c5a with SMTP id
 s12-20020a056830148c00b006b8c6315c5amr12630266otq.4.1691446186238; Mon, 07
 Aug 2023 15:09:46 -0700 (PDT)
Date:   Mon, 07 Aug 2023 15:09:46 -0700
In-Reply-To: <0000000000000e4cc105ff68937b@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000166f9e06025c8139@google.com>
Subject: Re: [syzbot] [modules?] KASAN: invalid-access Read in init_module_from_file
From:   syzbot <syzbot+e3705186451a87fd93b8@syzkaller.appspotmail.com>
To:     bpf@vger.kernel.org, chris@chrisdown.name, linan122@huawei.com,
        linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
        llvm@lists.linux.dev, mcgrof@kernel.org, nathan@kernel.org,
        ndesaulniers@google.com, song@kernel.org,
        syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SORTED_RECIPS,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

syzbot suspects this issue was fixed by commit:

commit 125bfc7cd750e68c99f1d446e2c22abea08c237f
Author: Li Nan <linan122@huawei.com>
Date:   Fri Jun 9 09:43:20 2023 +0000

    md/raid10: fix the condition to call bio_end_io_acct()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15c26ba9a80000
start commit:   a901a3568fd2 Merge tag 'iomap-6.5-merge-1' of git://git.ke..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=f5e1158c5b2f83bb
dashboard link: https://syzkaller.appspot.com/bug?extid=e3705186451a87fd93b8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12518548a80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=124ccf70a80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: md/raid10: fix the condition to call bio_end_io_acct()

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
