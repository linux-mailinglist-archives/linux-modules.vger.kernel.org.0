Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4183057B3EB
	for <lists+linux-modules@lfdr.de>; Wed, 20 Jul 2022 11:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbiGTJci (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Wed, 20 Jul 2022 05:32:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbiGTJci (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Wed, 20 Jul 2022 05:32:38 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ED665A894
        for <linux-modules@vger.kernel.org>; Wed, 20 Jul 2022 02:32:36 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id b6so9951887wmq.5
        for <linux-modules@vger.kernel.org>; Wed, 20 Jul 2022 02:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v22FUqElTjijRY7S6FC4Y1I46Wvlr5f3k95qZS0WK6o=;
        b=O9TiAh18VwjICX9Px7zvMrHUWs2pBLDuTtnlp6TtXFvQGTDUZI3Z9O71++Mba9JKm7
         FTilSLh0LH9G9ZGYS5JuAbdkghgcH8g47cLUTpWWuSU24qx+XMpDHncBm2AuobJSLcXd
         QlqHbMA6zYb8nph1AqKUXWwLd7/bz1SMgIpVc7kPGNnVnLwwYSIIuT08ipOoCFC/Ssw/
         YwEXDpVlKjAMCWCDhdLxz1PXsqCio/+Qq7evxkuh2u73gDEuoSUZAumJ8+IiU15N1cS4
         8AUq6Fk7nFNa17E61UAz8gGCrmjQiX5tcEGXutOiIgdTTDgQlrhJllVWvHCB+mSkPMaS
         lbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v22FUqElTjijRY7S6FC4Y1I46Wvlr5f3k95qZS0WK6o=;
        b=eIfGbWkeP+5JJwDMO3ipM1AQhuPt/7mkO4WALZGDfvvh/QlGOG3cdsW83MvQwUKK6k
         /pASr7wkVb+k454EeOm/EgEkxSBxaoHGSH4nIER6PYvZbWfPZsooq1q2ZpKxJWeCGp6b
         OlzAkV8F6kFsGwlnQt1IXcGtT96EJ8nR1qmWVDtY50QXSdBS+UcZRE6GnNYADX7bzwfD
         vMXOE5PKBjMF4aZqusQWyWJOObFd7KuFhBwfUol1+wqYHdpVGDq35mv+ZXfUaaJhiL6J
         ei7yGnQvkHx/j+mPRWsSx4hG7pYl/raIWPH4Ze8LdqvAKtOanoLkzz5k+/g5Iiv8EGAR
         kBGg==
X-Gm-Message-State: AJIora++QtwkgGAvqGfGA8IeRZNcnpLPbSgQAFk7O90EapihJ7tYcADX
        i2X++AA2d8QVB2JgIMppVuP/KPBtH9xDzDNAtsUaFA==
X-Google-Smtp-Source: AGRyM1vDMif7d2tIFvV4zCU/lON860YmX8asq31iwtRwC1y4FfhOdoAuEMs/wnsqwBdPw2jfQft6F+0dOarmOwHRmpU=
X-Received: by 2002:a05:600c:4fcd:b0:3a3:1be9:965c with SMTP id
 o13-20020a05600c4fcd00b003a31be9965cmr2931884wmq.60.1658309555110; Wed, 20
 Jul 2022 02:32:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220713005221.1926290-1-davidgow@google.com> <YtbwixbViJr9zkv8@bombadil.infradead.org>
In-Reply-To: <YtbwixbViJr9zkv8@bombadil.infradead.org>
From:   David Gow <davidgow@google.com>
Date:   Wed, 20 Jul 2022 17:32:23 +0800
Message-ID: <CABVgOSm4=Zz3ypK7uPh3phE9NqOc9mP50Di5pGAdwh2cs538jQ@mail.gmail.com>
Subject: Re: [PATCH] module: kunit: Load .kunit_test_suites section when CONFIG_KUNIT=m
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Daniel Latypov <dlatypov@google.com>,
        Jeremy Kerr <jk@codeconstruct.com.au>,
        linux-modules@vger.kernel.org,
        KUnit Development <kunit-dev@googlegroups.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="000000000000f94f1a05e4394781"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

--000000000000f94f1a05e4394781
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 20, 2022 at 1:57 AM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> On Wed, Jul 13, 2022 at 08:52:20AM +0800, David Gow wrote:
> > The new KUnit module handling has KUnit test suites listed in a
> > .kunit_test_suites section of each module. This should be loaded when
> > the module is, but at the moment this only happens if KUnit is built-in.
> >
>
> This commit log does not describe what functionality is broken exactly
> without this commit. What functionality from kunit is provided when
> .kunit_test_suites is available?
>

Sorry: the explanation is a bit obtuse, I admit.

Basically, when kunit itself is built as a module, no tests run. This
is because the code to load the .kunit_test_suites section is compiled
out if kunit is not built-in, but it should be present even if kunit
is built as a module.

> > Also load this when KUnit is enabled as a module: it'll not be usable
> > unless KUnit is loaded,
>
> What benefit is there to load a kunit module without kunit?
>

None whatsoever, and it should be impossible. This was just rationale
for the overhead of loading the section being likely insignificant,
but it's worded pretty poorly.

> > but such modules are likely to depend on KUnit
> > anyway, so it's unlikely to ever be loaded needlessly.
> >
> > Fixes: 3d6e44623841 ("kunit: unify module and builtin suite definitions")
> > Signed-off-by: David Gow <davidgow@google.com>

I'll update the commit message when I send a new version of this out.

Cheers,
-- David

--000000000000f94f1a05e4394781
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIPnwYJKoZIhvcNAQcCoIIPkDCCD4wCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ggz5MIIEtjCCA56gAwIBAgIQeAMYYHb81ngUVR0WyMTzqzANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA3MjgwMDAwMDBaFw0yOTAzMTgwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFIzIFNNSU1FIENBIDIwMjAwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCvLe9xPU9W
dpiHLAvX7kFnaFZPuJLey7LYaMO8P/xSngB9IN73mVc7YiLov12Fekdtn5kL8PjmDBEvTYmWsuQS
6VBo3vdlqqXZ0M9eMkjcKqijrmDRleudEoPDzTumwQ18VB/3I+vbN039HIaRQ5x+NHGiPHVfk6Rx
c6KAbYceyeqqfuJEcq23vhTdium/Bf5hHqYUhuJwnBQ+dAUcFndUKMJrth6lHeoifkbw2bv81zxJ
I9cvIy516+oUekqiSFGfzAqByv41OrgLV4fLGCDH3yRh1tj7EtV3l2TngqtrDLUs5R+sWIItPa/4
AJXB1Q3nGNl2tNjVpcSn0uJ7aFPbAgMBAAGjggGKMIIBhjAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0l
BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFHzM
CmjXouseLHIb0c1dlW+N+/JjMB8GA1UdIwQYMBaAFI/wS3+oLkUkrk1Q+mOai97i3Ru8MHsGCCsG
AQUFBwEBBG8wbTAuBggrBgEFBQcwAYYiaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL3Jvb3Ry
MzA7BggrBgEFBQcwAoYvaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvcm9vdC1y
My5jcnQwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9yb290LXIz
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
z/tQRXr3iPeVmZCr7nttMEwGA1UdIARFMEMwQQYJKwYBBAGgMgEoMDQwMgYIKwYBBQUHAgEWJmh0
dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQCMAAwgZoGCCsG
AQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9jYS9n
c2F0bGFzcjNzbWltZWNhMjAyMDBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5nbG9iYWxzaWdu
LmNvbS9jYWNlcnQvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3J0MB8GA1UdIwQYMBaAFHzMCmjXouse
LHIb0c1dlW+N+/JjMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20v
Y2EvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3JsMA0GCSqGSIb3DQEBCwUAA4IBAQAx+EQjLATc/sze
VoZkH7OLz+/no1+y31x4BQ3wjW7lKfay9DAAVym896b7ECttSo95GEvS7pYMikzud57WypK7Bjpi
ep8YLarLRDrvyyvBuYtyDrIewkuASHtV1oy5E6QZZe2VOxMm6e2oJnFFjbflot4A08D3SwqDwV0i
OOYwT0BUtHYR/3903Dmdx5Alq+NDvUHDjozgo0f6oIkwDXT3yBV36utQ/jFisd36C8RD5mM+NFpu
3aqLXARRbKtxw29ErCwulof2dcAonG7cd5j+gmS84sLhKU+BhL1OQVXnJ5tj7xZ5Ri5I23brcwk0
lk/gWqfgs3ppT9Xk7zVit9q8MYICajCCAmYCAQEwaDBUMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQ
R2xvYmFsU2lnbiBudi1zYTEqMCgGA1UEAxMhR2xvYmFsU2lnbiBBdGxhcyBSMyBTTUlNRSBDQSAy
MDIwAhABh9LgIPnlfMFHR0Die8n7MA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCA0
kprqb70GhqJ+/ovkrTxBisrd22RaxKnFUDeCUxXIiTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMjA3MjAwOTMyMzVaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAcG63GNO+rH8c8WU+oIeF
JuS9DflsZN5bDTjxcsHAG3gv9eFcfy3VLWpFvzdam3rpee6LBw3nb/aI/W3QtxmSHOet5YaDBgZh
QmgdWAPP9oUskwg7Du/NwaeCKtXnShMwTIyTrTzyYrFmKfphKLXwoWH3z6r4VCig6c7MWSnuQBpc
nLCYLzpyxbomF3sGTSNGLfIPbjRuFlgu0RUart76apnUsJKvjs9lBsrquzwIdZv+SWlfpIB4Rc9k
OCjlOGb4yu/c6LxWHEJonWSWiqHmg1oYkKHa/xO3Hg7f3FSYr/g9gI84TQ7k6fvosnznGZIGMYp9
2jE63hemtur43JpN5A==
--000000000000f94f1a05e4394781--
