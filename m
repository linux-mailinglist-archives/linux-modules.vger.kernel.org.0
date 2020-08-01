Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7F2C235324
	for <lists+linux-modules@lfdr.de>; Sat,  1 Aug 2020 17:58:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbgHAP6n (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Sat, 1 Aug 2020 11:58:43 -0400
Received: from out1.migadu.com ([91.121.223.63]:26358 "EHLO out1.migadu.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726309AbgHAP6n (ORCPT <rfc822;linux-modules@vger.kernel.org>);
        Sat, 1 Aug 2020 11:58:43 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=devup.no; s=default;
        t=1596297519;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0JGC3e1LXeeQdIbpDAmBVT0z2sUC50flD3YBBN24SY0=;
        b=PDEUsnyoVjbgsplGqJmf+knUwe2JntLW9FU1ToLCc4gu1CBoxURxkX7DZAym6X/l/76GRe
        FF6bdwoIxvmmXIvKOt26GnEFID8d2Oy75SRIMMjzDFbZRWx3/N0MviganHvruYhGjQhcT7
        7wgIHtQ1eZjoqvGgDjKKpFw7vQqO/WI=
From:   Marius Bakke <marius@devup.no>
To:     Lucas De Marchi <lucas.de.marchi@gmail.com>
Cc:     linux-modules <linux-modules@vger.kernel.org>
Subject: Re: [PATCH] testsuite: Add facility to skip tests.
In-Reply-To: <CAKi4VALpxWdmFfvSxKd9apSWisrKK3zK7pO-QaPiW_c=bby4bg@mail.gmail.com>
References: <20200516125412.12366-1-marius@devup.no> <CAKi4VALpxWdmFfvSxKd9apSWisrKK3zK7pO-QaPiW_c=bby4bg@mail.gmail.com>
Date:   Sat, 01 Aug 2020 17:58:12 +0200
Message-ID: <87k0yipdd7.fsf@gnu.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
X-Spam-Score: -2.51
Sender: owner-linux-modules@vger.kernel.org
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

--=-=-=
Content-Type: text/plain

Lucas De Marchi <lucas.de.marchi@gmail.com> writes:

> On Sat, May 16, 2020 at 6:04 AM Marius Bakke <marius@devup.no> wrote:
>>
>> The Makefile helpfully warns that some tests will fail when
>> --sysconfdir != /etc, but there are no provisions to easily disable
>> those.  This commit provides an escape hatch.
>
> nice... but are we missing a patch to actually make it skip?

Uh...  That makes sense.  (I maintained a list down-stream, derp.)

>> @@ -948,6 +949,14 @@ static inline int test_run_parent(const struct test *t, int fdout[2],
>>         int err;
>>         bool matchout, match_modules;
>>
>> +       if (t->skip == true) {
>
> only if (t->skip)  would be less verbose and preferred I think.

Fixed in v2, thanks!

Marius Bakke (2):
  testsuite: Add facility to skip tests.
  testsuite: Automatically skip tests that fail when sysconfdir != /etc.

 Makefile.am                | 12 +++++-------
 configure.ac               |  2 ++
 testsuite/test-blacklist.c |  3 +++
 testsuite/test-depmod.c    | 12 ++++++++++++
 testsuite/test-modprobe.c  |  6 ++++++
 testsuite/testsuite.c      |  9 +++++++++
 testsuite/testsuite.h      |  1 +
 7 files changed, 38 insertions(+), 7 deletions(-)

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCgAdFiEEu7At3yzq9qgNHeZDoqBt8qM6VPoFAl8lkRQACgkQoqBt8qM6
VPqumgf4zXUq7jQHvlqPkJx1Ccm7d+6VxROJ+CgBt6HHEx4HO3a95LXh9sms5WV3
r70c6Na78UGMzmdgBittepmTb8Wkl6+YeeaiXkqoXr5s4tl0ig4fziUNfH61aKty
cGA9mO/R1DcfS3cTCSpv7c75v8nr8A7nuN5FTbjAR9PWAeP8ZGCZSKIvil7NDHVT
MnH4QUUizsJhk65MVh0JwFI4jier0yn3f11SGflfRXhTOAFwDrbFyhGwpabJE8D+
L5qSxVJCyzifrw/kpAWA6ER7809SRC9v7p9i0qYbe3uln6kcW4/7877l3ORYBiKW
m9gSbLQZv68quBf3Ej3Gkd9qZYv3
=5K+q
-----END PGP SIGNATURE-----
--=-=-=--
