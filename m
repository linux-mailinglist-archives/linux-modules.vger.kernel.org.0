Return-Path: <linux-modules+bounces-2368-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C196D9B4F40
	for <lists+linux-modules@lfdr.de>; Tue, 29 Oct 2024 17:25:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E54271C2271E
	for <lists+linux-modules@lfdr.de>; Tue, 29 Oct 2024 16:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC4A01991CD;
	Tue, 29 Oct 2024 16:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M4GoxcDi"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76834198E99
	for <linux-modules@vger.kernel.org>; Tue, 29 Oct 2024 16:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730219112; cv=none; b=LMULOo2aRJoXDyDifueiSc3ufHhkedxaFJ5srj5j3i4khI3wLRnBCunB99PDthbK1W/gVVQMAqSqx2aC5P+1Od4jMJzZMrdX+sBe27mNy8I3yCeqMCxgfwGAH8nAq7NHy9yU2iPrriDZv6rO/6prPpN9Wlz/tJhh2G3B6zd8k3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730219112; c=relaxed/simple;
	bh=wst9NCOhP9yui/XiYSq/wkqGCzcqSKCzU9QNQl/jnTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OoWv+cJesHR4R7CXFJGLYuJ7yDrsknCicFMpnI+1Gv/1Md8pK32l5k2TdQLQWtMDUo2Xz8cACd5Ywefvixr79eBDSi3/IA73TXi9uNPBYAw3Rg05WPN4uS/QJ/FJkSD5v9VQVlMn16iQmtpg/u9EPqSpUVjY2rqJfAc+DZOUpY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M4GoxcDi; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43150ea2db6so263145e9.0
        for <linux-modules@vger.kernel.org>; Tue, 29 Oct 2024 09:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730219109; x=1730823909; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEv9d8+SgpybU6wrl4Us2xApnW3bmNdYFOKHVQ/35tc=;
        b=M4GoxcDinujoX4nd36dyYF3czj1ZQ8OkflT+nhh5Hy4N/+4M5Szkp6OAFmc8BpLAkM
         AU6sgUL+PxT2j50asV/yK6svz6E/2xCjIW6XlNIETQA9zJaYaaarJuonTDOiIw6dTP4T
         iAq6BZBh72nzhHxX+o9aveTdwr2cc99SVpXmti/xd6G1qEa4DDkwnr5RSsfRck1ZKb4E
         oXfd0aZdECaV+Xz//WhBTAtVZN+c2BrmOvv4LF1PNNGS8BC558cUgXV/AYVBHLKQLxD4
         W7szRbIKsUM+FO/HVR92GdqoTgY1a+ZRKCDAkgvDvo1VnS6tDNE6/1kIa6ej8srNqadK
         lGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730219109; x=1730823909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QEv9d8+SgpybU6wrl4Us2xApnW3bmNdYFOKHVQ/35tc=;
        b=mrDN8a6T7r4jyizRoFJIWx0s9pp6gbcRkbyXQHIt2lgEr1e9uuHncTx3Du3N5KoJ0+
         NeW3c0DV+HnhaH1bDaHQhU+wFMM1tFwA/hlcVK9UmRsDS4S6oCfF7GGNSjxom+/Wyei+
         GIqdln/dnS0dj65ynB+eUFs8K6ozlkysXSCvGDfzLdqZnnmRho/CbTR/2PpV0z/T4k9h
         kHMmBWA9XWxC/yRqoL3HCXUyg1h7jJRNmlBv/Zqzj3ePJ2mkduN3vLYC5Wj/jkxodcXz
         pqgNOdpvMyz2RgQwP4BRMAQ3P+FDZhe32X4Gm3uTecvd/b6B7fF8/+rhsgDveFa389lM
         GQVQ==
X-Gm-Message-State: AOJu0YyRLBcFfviyE9Os8YoRnHGwbLKWgO29G0je4zmK0KsxsnbEpCiw
	lGSV7Zv7RVlz+17pvLqR+eDP5mqYijLK4kLsNkniVLL51UXF6dxwJzsGZFiPlcfBP30smoJIMDJ
	r4hl+rw2kxDQ14+zazKnJ+e2QwKNPXUIIHWot
X-Gm-Gg: ASbGncvhqGjp69PbKjQ0Yb0aK9FngpJudYCePy0tfGn14Xw6r3Lm3fyioqbwoXHsJ8N
	zD8I3RpYfyIZwHP5ND+MFLsSO60Q4
X-Google-Smtp-Source: AGHT+IEjg7tLGOf0RNWlIWCZEtoXA0fa4xP6dF+qxAfjCQh/ZG2TzSsk23bIMPrkhk0s/xBZY9zuys5zrZqmK4JnQ68=
X-Received: by 2002:a05:600c:b85:b0:42c:b0b0:513a with SMTP id
 5b1f17b1804b1-431b3c9a40dmr5630055e9.2.1730219108707; Tue, 29 Oct 2024
 09:25:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241021193310.2014131-1-mcgrof@kernel.org>
In-Reply-To: <20241021193310.2014131-1-mcgrof@kernel.org>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 29 Oct 2024 09:24:30 -0700
Message-ID: <CABCJKudob+8GH2U_QLEngjqjOVmDfm8ZkEfn-Ya9ZG5OEOrRtQ@mail.gmail.com>
Subject: Re: [PATCH v3] selftests: add new kallsyms selftests
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	petr.pavlu@suse.com, da.gomez@samsung.com, masahiroy@kernel.org, 
	deller@gmx.de, linux-arch@vger.kernel.org, live-patching@vger.kernel.org, 
	kris.van.hees@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luis,

On Mon, Oct 21, 2024 at 12:33=E2=80=AFPM Luis Chamberlain <mcgrof@kernel.or=
g> wrote:
>
> diff --git a/lib/tests/module/gen_test_kallsyms.sh b/lib/tests/module/gen=
_test_kallsyms.sh
> new file mode 100755
> index 000000000000..e85f10dc11bd
> --- /dev/null
> +++ b/lib/tests/module/gen_test_kallsyms.sh
> @@ -0,0 +1,128 @@
[..]
> +gen_template_module_data_b()
> +{
> +       printf "\nextern int auto_test_a_%010d;\n\n" 28
> +       echo "static int auto_runtime_test(void)"
> +       echo "{"
> +       printf "\nreturn auto_test_a_%010d;\n" 28
> +       echo "}"
> +}

FYI, I get a warning when loading test_kallsyms_b because the init
function return value is >0:

# modprobe test_kallsyms_b
[   11.154496] do_init_module: 'test_kallsyms_b'->init suspiciously
returned 255, it should follow 0/-E convention
[   11.154496] do_init_module: loading module anyway...
[   11.156156] CPU: 3 UID: 0 PID: 116 Comm: modprobe Not tainted
6.12.0-rc5-00020-g897cb2ff413d #1
[   11.156832] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
BIOS rel-1.16.2-0-gea1b7a073390-prebuilt.qemu.org 04/01/2014
[   11.157762] Call Trace:
[   11.158914]  <TASK>
[   11.159253]  dump_stack_lvl+0x3f/0xb0
[   11.160279]  do_init_module+0x1f4/0x200
[   11.160586]  __se_sys_finit_module+0x30c/0x400
[   11.160948]  do_syscall_64+0xd0/0x1a0
[   11.161255]  ? arch_exit_to_user_mode_prepare+0x11/0x60
[   11.161659]  ? irqentry_exit_to_user_mode+0x8e/0xb0
[   11.162052]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   11.162598] RIP: 0033:0x7f5843968cf6
[   11.163076] Code: 48 89 57 30 48 8b 04 24 48 89 47 38 e9 1e 9a 02
00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24
08 0f 05 <48> 3d 01 f0 ff ff 0f 83 3a fd ff ff c3 48 c7 c6 01 00 00 00
e9 a1
[   11.164465] RSP: 002b:00007ffefcc92d68 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[   11.165046] RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f58439=
68cf6
[   11.165656] RDX: 0000000000000000 RSI: 00000000320429e0 RDI: 00000000000=
00003
[   11.166220] RBP: 00000000320429e0 R08: 0000000000000074 R09: 00000000000=
00000
[   11.166804] R10: 0000000000000000 R11: 0000000000000246 R12: 00000000320=
42b50
[   11.167378] R13: 0000000000000001 R14: 0000000032042c10 R15: 00000000000=
00000
[   11.168007]  </TASK>

> diff --git a/tools/testing/selftests/module/find_symbol.sh b/tools/testin=
g/selftests/module/find_symbol.sh
> new file mode 100755
> index 000000000000..140364d3c49f
> --- /dev/null
> +++ b/tools/testing/selftests/module/find_symbol.sh
> @@ -0,0 +1,81 @@
[..]
> +test_reqs()
> +{
> +       if ! which modprobe 2> /dev/null > /dev/null; then
> +               echo "$0: You need modprobe installed" >&2
> +               exit $ksft_skip
> +       fi
> +
> +       if ! which kmod 2> /dev/null > /dev/null; then
> +               echo "$0: You need kmod installed" >&2
> +               exit $ksft_skip
> +       fi

Is there a reason to test for kmod? I don't see it called directly in
this script.

Also, shouldn't you add the module directory to TARGETS in
tools/testing/selftests/Makefile? Otherwise the script won't be
installed with the rest of kselftests.

Sami

