Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8139B64F3F0
	for <lists+linux-modules@lfdr.de>; Fri, 16 Dec 2022 23:17:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbiLPWRW (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Fri, 16 Dec 2022 17:17:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229979AbiLPWRV (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Fri, 16 Dec 2022 17:17:21 -0500
Received: from mail-il1-x14a.google.com (mail-il1-x14a.google.com [IPv6:2607:f8b0:4864:20::14a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 729C0286D9
        for <linux-modules@vger.kernel.org>; Fri, 16 Dec 2022 14:17:17 -0800 (PST)
Received: by mail-il1-x14a.google.com with SMTP id l13-20020a056e0212ed00b00304c6338d79so2458088iln.21
        for <linux-modules@vger.kernel.org>; Fri, 16 Dec 2022 14:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4m9/17/W1kdv8VNLbmTKSjFzkHpfUuXrqh07MxTcPP0=;
        b=awtmRWhSH5BBP5maTj8NUSByURHW3qElgQPLx05IV8E1WMxTZiRXcmKIrAjZTRWoc+
         0m8LjRSFO1A8x5T2kRQsY0zET9Kmo2xGrP+pMDoN26EIMRqA2EaVHTOhvMyrzABAwBnw
         AZbCW8b/nVhuxrMUmopTN9/20D34xhxNOwIv3Uz0cIN5GrIwX2fEAYwan0wv5526a4zB
         zsPd8wN8Rn3W0CJ+1BBlyoeKyUNXeoDlxrprjhHZ7Zj8kaB5E+VfSztDx9+nF/hXDffO
         LmvkTp/IVMaVGGc7wJc1RNegXaSgDDbUO+GB7hw3ExnQvxpPQZAkEOrfo7vxeUNKKBIG
         Wu3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4m9/17/W1kdv8VNLbmTKSjFzkHpfUuXrqh07MxTcPP0=;
        b=ou/NWgyXViqObWf4L2F4hkMuvLOJTwG54MJFmYmF/ZLdSXSWDqAoXCPJ7RxVGJSdxg
         znra9XDBw57r/6Qvn0ST1hPM7yjVZumv8pI2rMd8Ud1w/jlmghpAaY662CWnY/Dp7J0B
         Z7ZbDNYA5Zz7cYpQWarkySpFIrnCfbHkoP/NEFM/cwQIYRMQzi9G/zTTLtNRsef1OBt5
         +O4+5d4lskh2GAMrPh8KYtWG6T6Q6hr25WOp8PA5j5IF6lDiZCoGKK4RIfE8ptEqWyHX
         g4mv3zbU1SRVWZ53dl75wXmg8YClAjhWrJMkkeu4z0sDEirpzE0OEBFr2UQBxPcRG/uh
         459g==
X-Gm-Message-State: ANoB5pmOEaqflDhCGkEgewxJn7C7anDDZ6ycGDSHKfsY+3bqwf/IxV7t
        C93dJjtPVePiSPPYxCJzLltYk8uuUg3R4bAKnzJ8kDjZqSdmC96ccjugP0hQwLEYXRvO/1prgux
        toWlYaI2owhr4OU/KqzNld2mQSsKBxfctHECSc19ohkBDQ6NJ5n3RkXc6QOuYnW7zTZp9Lfb60i
        N5SVA=
X-Google-Smtp-Source: AA0mqf6kuFKB8N1S+8Y3w73Baf2yFjpFU9gX7RM8EzhYHrKd8Om3h9q3nkvEDuQvMYocfszIZJIqzsx37UAaSYo=
X-Received: from allenwebb.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:12e8])
 (user=allenwebb job=sendgmr) by 2002:a05:6638:4605:b0:38a:8db5:76b with SMTP
 id bw5-20020a056638460500b0038a8db5076bmr2888647jab.89.1671229036583; Fri, 16
 Dec 2022 14:17:16 -0800 (PST)
Date:   Fri, 16 Dec 2022 16:16:58 -0600
In-Reply-To: <Y5IA2NYE5IaAzNby@kroah.com>
Mime-Version: 1.0
References: <Y5IA2NYE5IaAzNby@kroah.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221216221703.294683-1-allenwebb@google.com>
Subject: [PATCH v7 0/5] Generate modules.builtin.alias from match ids
From:   Allen Webb <allenwebb@google.com>
To:     "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Allen Webb <allenwebb@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

Generate modules.builtin.alias from match ids

This patch series (v7) pivots to adding `modules.builtin.alias` from the
previous approach of adding a sysfs attribute. The goal is for tools
like USBGuard to leverage not only modules.aliases but also
`modules.builtin.aliases` to associate devices with the modules that may
be bound before deciding to authorize a device or not. This is
particularly useful in cases when new devices of a particular type
shouldn't be allowed part of the time like for lock screens.

Note that `modules.builtin.alias` is generated directly by modpost. This
differs from how `modules.alias` is generated because modpost converts
the match-id based module aliases into c-files that add additional
aliases to the module info. No such c-file is present for vmlinuz though
it would be possible to add one. A downside of this would be vmlinuz
would grow by 100-200kb for a typical ChromeOS kernel config.


--

# Generate modules.builtin.alias from match ids

Previous versions of this patch series addressed the same problem by
adding a sysfs attribute instead of `modules.builtin.alias`.
Consequently, they have a different name and include completely
different commits than this version.
Note, cover letters were first added in v5.

  RFC (broken patch): https://lore.kernel.org/lkml/CAJzde042-M4UbpNYKw0eDVg4JqYmwmPYSsmgK+kCMTqsi+-2Yw@mail.gmail.com/
  v1 (missing v1 label): https://lore.kernel.org/lkml/20221111152852.2837363-1-allenwebb@google.com/
  v2 (missing v2 label): https://lore.kernel.org/lkml/20221128201332.3482092-1-allenwebb@google.com/
  v3: https://lore.kernel.org/lkml/20221129224313.455862-1-allenwebb@google.com/
  v4: https://lore.kernel.org/lkml/20221130221447.1202206-1-allenwebb@google.com/
  v5: https://lore.kernel.org/lkml/20221201211630.101541-1-allenwebb@google.com/
  v6: https://lore.kernel.org/lkml/20221202224540.1446952-1-allenwebb@google.com/
  v7: This version


## Patch series status

This series is still going through revisions in response to comments.
This version generates match-id based aliases for all subsystems unlike
previous patch series versions which only implemented aliases for USB.

I believe there is potential to improve the Makefile part of the patch
series as well as an open question of whether modpost should generate
`modules.built.alias` directly or create a vmlinuz.mod.c containing the
missing module info for the match-id based aliases for built-in modules.

## Acknowledgements

Thanks to Greg Kroah-Hartman and the Linux maintainers for being patient
with me as I have worked through learning the kernel workflow to get
this series into a more presentable state.

Thanks to Luis Chamberlain for raising the alternative of using kmod to
address the primary motivation of the patch series.

Also, thanks to Intel's kernel test robot <lkp@intel.com> for catching
issues that showed up on different kernel configurations.




Allen Webb (5):
  module.h: MODULE_DEVICE_TABLE for built-in modules
  modpost: Track module name for built-in modules
  modpost: Add -b option for emitting built-in aliases
  file2alias.c: Implement builtin.alias generation
  build: Add modules.builtin.alias

 .gitignore               |  1 +
 Makefile                 |  1 +
 include/linux/module.h   | 10 ++++-
 scripts/Makefile.modpost | 17 +++++++-
 scripts/mod/file2alias.c | 92 +++++++++++++++++++++++++++++++---------
 scripts/mod/modpost.c    | 23 +++++++++-
 scripts/mod/modpost.h    |  2 +
 7 files changed, 121 insertions(+), 25 deletions(-)

-- 
2.37.3

