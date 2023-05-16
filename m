Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B41E704B40
	for <lists+linux-modules@lfdr.de>; Tue, 16 May 2023 12:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232016AbjEPK7w (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Tue, 16 May 2023 06:59:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232505AbjEPK7p (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Tue, 16 May 2023 06:59:45 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CECB04EC9
        for <linux-modules@vger.kernel.org>; Tue, 16 May 2023 03:59:38 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6ab15dbef23so7938479a34.3
        for <linux-modules@vger.kernel.org>; Tue, 16 May 2023 03:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684234778; x=1686826778;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :reply-to:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qs6YQuKaR+Jj8cYfLUlwzIsnjJiio9siuMvBa7Y9KQA=;
        b=UywEEzYzqypWr7pjWmds9qAMq1NUH4A5kMeoQMh/2xI+MkbgZTwK92l+P94Wquv6JA
         yKgFZnHbcCpzR0SfGK2NgFpKecHT04Agw4j8K/59RWrDwRCRMFjZzKf6UGCwpvwUPO1d
         xFMfpMr5oYdsf1KOJm3Ptir/P1RTMd0mNxrAV+sW/Rhn5XHq4WtZxB0hstmzJgi1RLcx
         O+Vi8sCVAAMbbavuerFC2bFIQ6UNa4cj3cz15aKtHbMNY7KuAiZMm1QO8PMIgXla0P3+
         Nqt2Isjxl3mDSasq7JcxAaJ8Jc/MgzJFDgtHLLGLiY2cBxETeQSvLOYfuVhZY7hNk3oy
         xm1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684234778; x=1686826778;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qs6YQuKaR+Jj8cYfLUlwzIsnjJiio9siuMvBa7Y9KQA=;
        b=lVgan6muzmiLo3IHlmrjpeKaZSRVs8vh2CCzJGZ9YEAzkjGm0wxrZ/byXUkiBH5UAL
         0dm3kuojVmLFUR+5nx0RLOOjHInpmqDNpUngSeZpDrRpS9SsYXKRa+aOmG/KzApFlLUZ
         5Fqebov20V2HO9qmj9A1p3bk0henKH91tsuUjXwJbiOOrC47RKZc+HsQ6+bgohmhpFaW
         Xoto6Q/XLgWlzFNOC37juG4UZfthcgPQwQOm0sIeSg2Y7C1FFw3iW60XlB8FfersA5pY
         0hDXM8Jqb4jYWqOB2l+4VzgStlksDCKAICSbAiIRqSAD8JdAnVFsHng8f6cjkzTDLRDN
         U4fA==
X-Gm-Message-State: AC+VfDzSG4jkvrYK/JDdWFR3VgoEYeUUO//s40woeuNGtgVB9FOwEGNt
        9fOL4iGMeeJ+KNyQEL0OqUfscD6ScN8OcBoJ8D4=
X-Google-Smtp-Source: ACHHUZ42kr2eCvmq+65Fvh2rE/ioy44xHfSbWu2pxNasjgzhG+KHMeIQyoV0jsRdKbuB6x2Fw+QWJv0ZASu2eSKK5zg=
X-Received: by 2002:a05:6808:10d6:b0:396:2d58:2d4b with SMTP id
 s22-20020a05680810d600b003962d582d4bmr912506ois.18.1684234777857; Tue, 16 May
 2023 03:59:37 -0700 (PDT)
MIME-Version: 1.0
Reply-To: salkavar2@gmail.com
Sender: maxwellkojo880@gmail.com
Received: by 2002:ac9:5742:0:b0:4d9:4845:c52c with HTTP; Tue, 16 May 2023
 03:59:37 -0700 (PDT)
From:   "Mr.Sal kavar" <salkavar2@gmail.com>
Date:   Tue, 16 May 2023 03:59:37 -0700
X-Google-Sender-Auth: 11M5EWVmsqkwgtbzpfsfQy48asc
Message-ID: <CAGUcSJZPOB+BWUMr7Xxhf+Th7=k+2yv0Q-pDUUr_4TrDC6H6tA@mail.gmail.com>
Subject: Yours Faithful,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,LOTS_OF_MONEY,
        MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:32a listed in]
        [list.dnswl.org]
        * -0.0 BAYES_20 BODY: Bayes spam probability is 5 to 20%
        *      [score: 0.0750]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [maxwellkojo880[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [salkavar2[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [maxwellkojo880[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  2.2 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  2.7 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

ScKgYXNzdW1lwqB5b3XCoGFuZMKgeW91csKgZmFtaWx5wqBhcmXCoGluwqBnb29kwqBoZWFsdGgu
DQoNClN1bcKgb2bCoChGaWZ0ZWVuwqBNaWxsaW9uwqBGaXZlwqBIdW5kcmVkwqBUaG91c2FuZMKg
RG9sbGFycynCoHdoZW7CoHRoZQ0KYWNjb3VudMKgaG9sZGVywqBzdWRkZW5secKgcGFzc2VkwqBv
bizCoGhlwqBsZWZ0wqBub8KgYmVuZWZpY2lhcnnCoHdob8Kgd291bGTCoGJlDQplbnRpdGxlZMKg
dG/CoHRoZcKgcmVjZWlwdMKgb2bCoHRoaXPCoGZ1bmQuwqBGb3LCoHRoaXPCoHJlYXNvbizCoEnC
oGhhdmXCoGZvdW5kwqBpdA0KZXhwZWRpZW50wqB0b8KgdHJhbnNmZXLCoHRoaXPCoGZ1bmTCoHRv
wqBhwqB0cnVzdHdvcnRoecKgaW5kaXZpZHVhbMKgd2l0aA0KY2FwYWNpdHnCoHRvwqBhY3TCoGFz
wqBmb3JlaWduwqBidXNpbmVzc8KgcGFydG5lci4NCg0KWW91wqB3aWxswqB0YWtlwqA0NSXCoDEw
JcKgd2lsbMKgYmXCoHNoYXJlZMKgdG/CoENoYXJpdHnCoGluwqBib3RowqBjb3VudHJpZXPCoGFu
ZA0KNDUlwqB3aWxswqBiZcKgZm9ywqBtZS4NCg0KDQpNci5TYWzCoEthdmFyLg0K
