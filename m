Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FB622FBB52
	for <lists+linux-modules@lfdr.de>; Tue, 19 Jan 2021 16:38:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731777AbhASPgB (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Tue, 19 Jan 2021 10:36:01 -0500
Received: from attila.bofh.it ([85.94.204.146]:53546 "EHLO attila.bofh.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391577AbhASPfz (ORCPT <rfc822;linux-modules@vger.kernel.org>);
        Tue, 19 Jan 2021 10:35:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.it;
 i=@linux.it; q=dns/txt; s=attila; t=1611070501; h=date : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to : from : from;
 bh=Q8/wmdeR6+kRyU/Ee/8H+zf+qWvYdFKqv209YU2YX2c=;
 b=iaIbQnaEHf7U1vlBmO6XEb+S+qlRRMtgzb1/jgP07HVgPPG84BGwUHuZl9bRx1evOxRBT
 zcTt2b00j2DujmsThoJWC3mskms4Rbk8lzYa+ZCEJ999S4gYb4ynIuhY3NFQzNUET5KOHdp
 Ivg4QeK+lye+90undzjp5tiwqkJ49bE=
Received: by attila.bofh.it (Postfix, from userid 10)
        id 2D02D12FC1B; Tue, 19 Jan 2021 16:35:01 +0100 (CET)
Received: by bongo.bofh.it (Postfix, from userid 1000)
        id D8C7E840C81; Tue, 19 Jan 2021 16:34:45 +0100 (CET)
Date:   Tue, 19 Jan 2021 16:34:45 +0100
To:     Lucas De Marchi <lucas.demarchi@intel.com>
Cc:     linux-modules@vger.kernel.org
Subject: Re: [PATCH 2/3] depmod: fix precedence order
Message-ID: <YAb8FfR+/I5YKxUq@bongo.bofh.it>
Mail-Followup-To: Lucas De Marchi <lucas.demarchi@intel.com>,
        linux-modules@vger.kernel.org
References: <20210119145238.12774-1-lucas.demarchi@intel.com>
 <20210119145238.12774-2-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xR3XgMmjQv9QgDeY"
Content-Disposition: inline
In-Reply-To: <20210119145238.12774-2-lucas.demarchi@intel.com>
From:   Marco d'Itri <md@Linux.IT>
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>


--xR3XgMmjQv9QgDeY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 19, Lucas De Marchi <lucas.demarchi@intel.com> wrote:

> Configuration in /etc should have higher prio than /run.
> Given how rarely configuration in /run is used with depmod, this is
> likely not to cause any problems, even if it's a change in behavior.
I agree. But the order is documented in the man pages, so you should=20
change it there as well.

--=20
ciao,
Marco

--xR3XgMmjQv9QgDeY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQnKUXNg20437dCfobLPsM64d7XgQUCYAb8FQAKCRDLPsM64d7X
gfc8AQDU4U3Gge4ccmtf8PUpbvKeC1zfA1rZIf5KesvYU4fNhwD9HWMBcOLSFNRp
vJs0I27q45mgnQqfL114bbFRc0p9GQY=
=3vGq
-----END PGP SIGNATURE-----

--xR3XgMmjQv9QgDeY--
