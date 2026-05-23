Return-Path: <linux-modules+bounces-6522-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 43kSBj5ZEWq+kwYAu9opvQ
	(envelope-from <linux-modules+bounces-6522-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Sat, 23 May 2026 09:37:34 +0200
X-Original-To: lists+linux-modules@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 780455BDC2A
	for <lists+linux-modules@lfdr.de>; Sat, 23 May 2026 09:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E6063018296
	for <lists+linux-modules@lfdr.de>; Sat, 23 May 2026 07:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72BA5339705;
	Sat, 23 May 2026 07:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XvsPXqB/"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F9B3128CF
	for <linux-modules@vger.kernel.org>; Sat, 23 May 2026 07:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779521849; cv=none; b=pCgBXUFewlSpH8UkPSYuL5G31tgaO4EsUcq6bYDw7ILyYKsj9wItMykFcCdO8wnH3c+ZyZzE0cY2GK9rUfm2qwA9kp51A0mkAwQftEEh5OT+hHIZ9R8TeFtkBcT0SfvxmwIwyWA8dStCq6uLYrNgEXbC744TUxT5f2M9/Ta9d2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779521849; c=relaxed/simple;
	bh=gjb1LwytPPCXV/vKO+btziSfAR83uOfrDDl6TpYMfBU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ge/Bv9aIcCG28bDUsd9fGLgGOZwmdeHUlHVtyFQfMvEJQgWZFH1w3oIt3oKIdd/utaQMQFPTcTpp1Vuf4ex9krIdfzMH0hvsYDfZZV/74ROQnD+dU4m0o5gKrSgte16gj1vWyKBdKEZOpaAgCi997Gg4YnpBrHAQYn//cK/pX6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XvsPXqB/; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C698C1F000E9;
	Sat, 23 May 2026 07:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779521847;
	bh=J91g26O0bPxLuYaP1EfTJ1kWVfYXRBXLlwC3zSeWkBY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XvsPXqB/pJSeURlPNHKofYHOuFl5in4ns2WLtnZLqvxtoVk0JhXF7whaf81beSUZp
	 OobpMuC91YYZ01d2s7GU8guDy23M8mvemesH//svlUnjyaxtyZg9MRBeqtC3YtI7iV
	 PG6862Irk3RJy9kixpQ7X4dlmmzVIyt6q+pSG+Y55jHdQ4px2JGaM8m6y3YtICoMGq
	 bKcMdnI+JXKl1BMOylVJ6F8YN3MmAuwsROApAiSZgg2uu3l0XbgjeHK/vR2SBuEbsb
	 wwMiRBD4Qw8jysy6UfqPFC+Ihd4gYyF29d94S2g/Ri1q1XJzqtzcZXg+EAp1qBynJQ
	 mzx6DtLhPTFZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 22/24] selftests-dyndbg: add a dynamic_debug
 run_tests target
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jim Cromie" <jim.cromie@gmail.com>
Cc: linux-modules@vger.kernel.org
In-Reply-To: <20260523-dd-maint-2-v2-22-b937312aa083@gmail.com>
References: <20260523-dd-maint-2-v2-22-b937312aa083@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 23 May 2026 07:37:27 +0000
Message-Id: <20260523073727.C698C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6522-lists,linux-modules=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-modules@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-modules];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,sashiko.dev:url,lists.linux.dev:replyto]
X-Rspamd-Queue-Id: 780455BDC2A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Test failure conditions incorrectly exit with a success status (=
0), silently hiding test failures from the kselftest framework.
- [Medium] The script incorrectly assumes `.config` is available at runtime=
, which will cause false test failures when selftests are installed and run=
 on a target device.
--

commit 5991b9725cc8742537ed8b6a73204e4d44da0fc2
Author: Jim Cromie <jim.cromie@gmail.com>

selftests-dyndbg: add a dynamic_debug run_tests target

This commit adds a dynamic-debug selftest script that modifies pr_debug()
flags and checks their effects. It also integrates dynamic_debug into the
kselftest framework's TARGETS list.

> diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/t=
ools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
> new file mode 100755
> index 0000000000000..01c035fe8c9a2
> --- /dev/null
> +++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
> @@ -0,0 +1,257 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0-only

[ ... ]

> +[ -f "$KCONFIG_CONFIG" ] || KCONFIG_CONFIG=3D".config"
> +if [ -f "$KCONFIG_CONFIG" ]; then

[Severity: Medium]
Will this work reliably when selftests are installed and run on a target
device?  When tests are run via `make install` on a target, the source tree=
's
`.config` won't be available.

If the `.config` is missing, the script defaults to `LACK_DD_BUILTIN=3D0`, =
which
may cause false test failures if the target kernel doesn't actually have the
config enabled. Could runtime indicators be checked instead of build-time f=
iles?

> +    echo "# consulting KCONFIG_CONFIG: $KCONFIG_CONFIG"
> +    grep -q "CONFIG_DYNAMIC_DEBUG=3Dy" $KCONFIG_CONFIG ; LACK_DD_BUILTIN=
=3D$?
> +    grep -q "CONFIG_TEST_DYNAMIC_DEBUG=3Dm" $KCONFIG_CONFIG ; LACK_TMOD=
=3D$?

[ ... ]

> +function handle_exit_code() {
> +    local exp_exit_code=3D0
> +    [ $# =3D=3D 4 ] && exp_exit_code=3D$4
> +    if [ $3 -ne $exp_exit_code ]; then
> +        echo -e "${RED}: $BASH_SOURCE:$1 $2() expected to exit with code=
 $exp_exit_code"
> +	[ $3 =3D=3D 1 ] && echo "Error: '$error_msg'"
> +        exit $exp_exit_code

[Severity: Medium]
Does this mask test failures?  If the actual exit code (`$3`) does not match
`exp_exit_code` (which defaults to 0), the script calls `exit $exp_exit_cod=
e`.

Since `exp_exit_code` is typically 0 when expecting a command to succeed, t=
he
script will exit with 0 upon encountering an error, silently hiding the fai=
lure
from the kselftest framework.

> +    fi
> +}

[ ... ]

> +function check_match_ct {
> +    pattern=3D"\s$1\s"
> +    exp_cnt=3D0
> +
> +    [ "$3" =3D=3D "-r" ] && pattern=3D"$1"
> +    let cnt=3D$(ddgrep "$pattern" | wc -l)
> +    if [ $V -eq 1 ] || [ "$3" =3D=3D "-v" ] || [ "$4" =3D=3D "-v" ]; then
> +        echo -ne "${BLUE}" && ddgrep $pattern && echo -ne "${NC}"
> +    fi
> +    [ $# -gt 1 ] && exp_cnt=3D$2
> +    if [ $cnt -ne $exp_cnt ]; then
> +        echo -e "${RED}: $BASH_SOURCE:$BASH_LINENO check failed expected=
 $exp_cnt on $1, got $cnt"
> +        exit

[Severity: Medium]
Does this also mask test failures?  Calling `exit` without arguments returns
the status of the last executed command.

Since the `echo` command immediately preceding it will succeed with a 0 exit
code, the script exits with 0 and the kselftest framework will incorrectly =
mark
the failed test as passed. This same pattern appears to be used in several
other functions in the script.

> +    else
> +        echo ": $cnt matches on $1"
> +    fi
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260523-dd-maint-2=
-v2-0-b937312aa083@gmail.com?part=3D22

