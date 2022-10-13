Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B77A5FDD56
	for <lists+linux-modules@lfdr.de>; Thu, 13 Oct 2022 17:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbiJMPm5 (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Thu, 13 Oct 2022 11:42:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbiJMPml (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Thu, 13 Oct 2022 11:42:41 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9C28137296
        for <linux-modules@vger.kernel.org>; Thu, 13 Oct 2022 08:41:03 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id k6so2227695vsp.0
        for <linux-modules@vger.kernel.org>; Thu, 13 Oct 2022 08:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bkPlrEU0eqs8S991soADoiELCwGAztcBrNAWTDmFHiw=;
        b=J9sS2C44ACJpqoc4Ana3xBVPcmq3cvpeQqNhCxqY9ghX7SGfinPIjB+m4k7xJBUS7i
         znOho6rlimy21LkHtpSbsTMSbPsQvp/kyQkvq4vW2v5KtJJE83lqA2qSlQKfimpC0mtP
         IgUhq4pEbyydzT1FArp0+jiSyIO7EYhimVQ1HH3as7xQBota9yUAsJBL252ayNqosojM
         k/oMAVyFtn2koEBFwBpNGXqzY4DuslQj+fHE99d7sfqB21BxYX0pjRALZLXGWra0pcH9
         7d4jr7phhc4n2z9THUvpCIUlcvYi/QLPs4Ouvd4Fkvgk3osdbMylTFPcdBMV8BbDYJgi
         Pxug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bkPlrEU0eqs8S991soADoiELCwGAztcBrNAWTDmFHiw=;
        b=FsFytAVuIfsqEas97L5l77nw1HKQT64uzuJ0zRZpk9P+JGUYHSgehFx4I/VIF1aWTW
         nq+47rQg5SiB94mR/naBgzc1wODQ0KivU0Qjvgwjc3KQw63jJ50hYlP+EKilbTJIeLPF
         5FoKKtAAo/mBU6AIbCRTDDO24hCbgWDNMeVVgSjXL0TlUmkqM3fjVoeDXlwNAaBmoeJS
         EFQk0N0iUMR2e3Cm7UdEvnAKp7stkRya2hy/YvPbxN+7YcuaDpkcaSZtxygDa7eZRioD
         /P+H//vZ2DPM36MMhJe+kcGP6ce1nL+mOPdqOSG0EYuHmrPDv3fWClf4uf+c796eC/De
         /hAA==
X-Gm-Message-State: ACrzQf3gQijeox4zFD7tRZN2CkrZlV8L16V+45BLP9Jj9tgVCwxuI829
        aCEPuQORJwquBnA8rCP25QHfy1ylu34R3Xd7KQA=
X-Google-Smtp-Source: AMsMyM5CHNOuwiDII2Jpp+e4hsxJ1ao8qEDajI/e2pujzcE/GqQg2w/OE/WZEv3X9GRayX7WFOS9EQQOe84UxXKZkxE=
X-Received: by 2002:a05:6102:c88:b0:3a7:868b:5637 with SMTP id
 f8-20020a0561020c8800b003a7868b5637mr137546vst.23.1665675660020; Thu, 13 Oct
 2022 08:41:00 -0700 (PDT)
MIME-Version: 1.0
References: <148c7e0e-3de9-e3ad-81a3-5444864e9bfe@gmail.com>
In-Reply-To: <148c7e0e-3de9-e3ad-81a3-5444864e9bfe@gmail.com>
From:   jim.cromie@gmail.com
Date:   Thu, 13 Oct 2022 09:40:33 -0600
Message-ID: <CAJfuBxy+U6eK=3SM6JE4zW7cuQU=rq-0ePR0duEnNb718PEOEQ@mail.gmail.com>
Subject: Re: Faster, incremental depmod when adding modules?
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     kernelnewbies@kernelnewbies.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

On Sun, Aug 21, 2022 at 12:46 PM Ian Pilcher <arequipeno@gmail.com> wrote:
>
> When installing 1 or more out-of-tree modules within
> /lib/modules/$UNAME, is it possible to run depmod in an incremental
> fashion - adding symbols from the new modules to modules.dep[.bin]
> without re-scanning all of the other modules from that kernel version?
>
> I've tried specifying the new module files, but that seems to create a
> completely new modules.dep containing *only* the symbols from the new
> modules (which obviously isn't very useful).
>

OPTIONS
       -a, --all
           Probe all modules. This option is enabled by default if no
file names are given in the command-line.

       -A, --quick
           This option scans to see if any modules are newer than the
modules.dep file before any work is done: if not, it silently exits
rather than regenerating the files.

2nd looks like what u want
