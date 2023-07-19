Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59174759109
	for <lists+linux-modules@lfdr.de>; Wed, 19 Jul 2023 11:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbjGSJD5 (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Wed, 19 Jul 2023 05:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbjGSJDW (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Wed, 19 Jul 2023 05:03:22 -0400
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB5411FFA
        for <linux-modules@vger.kernel.org>; Wed, 19 Jul 2023 02:03:09 -0700 (PDT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3a034580aafso10884636b6e.0
        for <linux-modules@vger.kernel.org>; Wed, 19 Jul 2023 02:03:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689757389; x=1692349389;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8nbYqxFLkec4e6QPZk9zdoUroU9q7DW2YkK4qADra6Y=;
        b=E80cMbJGD291eYENWzCa8unTYyM7uT/NyKgbQAF5lsCnJkLvwDKj12wxIYiGFxE29Q
         2W8pDd1sMg83sTcaaaphrkZC2jIDqEY/fzfm9CwUVbBAlC47AUVk42yitPcBVr9qxBtu
         WkWAOmp0zhSowIcoEzL49G1b1HBQBD71DydVwSV47dlw0wZVewPoms848OKsE64YONEZ
         mG6kqX3E7xvmF6Y3jWzTFZ3KUc5kATgGoeDpDAkD8JjmQX01chK8F37uS939z1av6NiS
         6K7OSuW451ErNbB1mOKjPXyl2XRbj3Q37SdK4+OtH4oDxVOuV8p8LKT3UbtJUWSb4Uas
         QzBg==
X-Gm-Message-State: ABy/qLZCjNEsFiM9hAT5DdUqVNTei+O4esOFqTCGaCEKn67i0SLnrH78
        NNPAo3jCl9nrKBBlq4S401yKeGAlCjBxy1umf7wM3MzQic+7
X-Google-Smtp-Source: APBJJlGH+6Ekov7OzNGEpjw9UqrkwoC4TmKOuwK3Nty/cOEIwCFkW0DjdwKlwkJDeDQFZDiuH7xWuCjP+3k4F/UqSFnQMTKliVDW
MIME-Version: 1.0
X-Received: by 2002:a05:6808:130f:b0:3a3:fa79:24d2 with SMTP id
 y15-20020a056808130f00b003a3fa7924d2mr26355915oiv.9.1689757389174; Wed, 19
 Jul 2023 02:03:09 -0700 (PDT)
Date:   Wed, 19 Jul 2023 02:03:09 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f03d270600d34c07@google.com>
Subject: [syzbot] Monthly modules report (Jul 2023)
From:   syzbot <syzbot+lista106f8f60124dc0eda6e@syzkaller.appspotmail.com>
To:     linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
        mcgrof@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

Hello modules maintainers/developers,

This is a 31-day syzbot report for the modules subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/modules

During the period, 3 new issues were detected and 1 were fixed.
In total, 3 issues are still open and 5 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 337     Yes   KASAN: invalid-access Read in init_module_from_file
                  https://syzkaller.appspot.com/bug?extid=e3705186451a87fd93b8
<2> 84      Yes   general protection fault in sys_finit_module
                  https://syzkaller.appspot.com/bug?extid=9e4e94a2689427009d35
<3> 10      Yes   WARNING in do_page_fault
                  https://syzkaller.appspot.com/bug?extid=78c0d2c0b793eabb450d

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
