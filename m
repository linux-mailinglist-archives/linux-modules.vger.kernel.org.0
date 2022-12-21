Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 044CC653113
	for <lists+linux-modules@lfdr.de>; Wed, 21 Dec 2022 13:51:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232901AbiLUMvX (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Wed, 21 Dec 2022 07:51:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233629AbiLUMvF (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Wed, 21 Dec 2022 07:51:05 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D39D1D0D5
        for <linux-modules@vger.kernel.org>; Wed, 21 Dec 2022 04:50:59 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id c133so6267922oif.1
        for <linux-modules@vger.kernel.org>; Wed, 21 Dec 2022 04:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=56U3L/n2SWLavdhRRg0Yc0+2596Qz1l4ZkRdkLejoUU=;
        b=Bd08IVPTLs1phQbB8s1mFDverCHManzQn9YhCQsI/rXKiQDxxFpcvfziYBpzg3bhyi
         0j7dqKeeDwngd8lqqqlLorixDjQHUtHWH/bRKcPkKsxFR0jUZ94nU326WIZ8ONZE0HVH
         qcYn24AvlP9r689+Z8cSjGhLS++OttFLlrMvYCwzd8SiYZjrqRbtrw7ziE19qn6EIzXI
         WfVacyuiehUF4T+S4iS02fGWeFIsMxfj/YvJJjnhBmyXQDkpJLifcL5Gz2XMRqFcplYd
         ZOP5OEUEn9Juo+YDUOKl/+kJFQlJpl8/rbH5L3FQDyCZnj6m1/8Ke2xFHRYucxkt/TK4
         Jdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=56U3L/n2SWLavdhRRg0Yc0+2596Qz1l4ZkRdkLejoUU=;
        b=ITmzevt1pRsOWFNGZClDovgpgTlrM2BrFHRqxpxG/nWKFkdTjuzuxq/zijU6x4YkrP
         +hzbLtrckgZC5ux76Wn/6Dcq1OV3Vlj9LJHgG/LEH1aPyqzgK83ULrOeQaS1ISs6SG7l
         gxZx4ASzyT3lT5IQLRt0J3lPKyuiJiP+81G+pkTDRJmEQXb4mhpuOcFV6k73ZMqiKlin
         8vm1yXmkSfHPqZ7eY5IMmxT7KF81/bEcD/qfULQblRzs4/bKOH14ENqV+nTqFMbyQe4r
         8poh+Q1WWkW6yrufT6KWzMc3fSSZPiGiHLoLQ/SfntbFjOA35zgOqy4FW6H5aLA79Xr1
         Biaw==
X-Gm-Message-State: ANoB5pn0N8MPt1TXxl5z3LeXW912POefPHEVfPNT7U7Biu2mwMZ/kesQ
        6TTSyhQpGLoX6ZdKUL0Ibb4Vb4eiuhLyC4gmrk4=
X-Google-Smtp-Source: AA0mqf7vhPpjM9/rV0Id6DSV4F2CZgME2MX5Mhi3RQYlgkddKGaL4yiTtPI36qr5vEE0G5aZZY7Agi2V/4VDKOOtKXk=
X-Received: by 2002:a05:6808:1a10:b0:35e:acce:1869 with SMTP id
 bk16-20020a0568081a1000b0035eacce1869mr2147954oib.106.1671627058757; Wed, 21
 Dec 2022 04:50:58 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6358:50ca:b0:df:c952:f7e5 with HTTP; Wed, 21 Dec 2022
 04:50:58 -0800 (PST)
Reply-To: westernuniont27@gmail.com
From:   Western Union Togo <kombatelibenandame@gmail.com>
Date:   Wed, 21 Dec 2022 12:50:58 +0000
Message-ID: <CADODSOrensh+1bj5qDaoE1sSo9nfH5cVC-CK_1xP0ewzbdFw6w@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.8 required=5.0 tests=BAYES_95,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:22e listed in]
        [list.dnswl.org]
        *  3.0 BAYES_95 BODY: Bayes spam probability is 95 to 99%
        *      [score: 0.9506]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [westernuniont27[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [kombatelibenandame[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

Your overdue fund payment has been approved for payment via Western Union
Money Transfer. Get back to us now for your payment. Note, your Transaction
Code is: TG104110KY.
