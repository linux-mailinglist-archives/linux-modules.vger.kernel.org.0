Return-Path: <linux-modules+bounces-2662-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C072E9DB15A
	for <lists+linux-modules@lfdr.de>; Thu, 28 Nov 2024 03:10:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A1E6280FC4
	for <lists+linux-modules@lfdr.de>; Thu, 28 Nov 2024 02:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B9D63BBE5;
	Thu, 28 Nov 2024 02:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f6HMrNGb"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C26535D8;
	Thu, 28 Nov 2024 02:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732759822; cv=none; b=u7OA23Qf7o7EBOT1B5o6yQR3WmJ4Ql2Q/gpCtUgQddbAGSJ4o8zyWJh7dSmiHFWbPQrIGeMizeHM/RUhcMYNlf5GR6AZSOKwrK8pVqdQUclCt1OYFkNJaFF/lCLzja6FQGgurvcyr+F1AVaGIt+E6V7OzIrOwPWnparQZL6QhAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732759822; c=relaxed/simple;
	bh=YX1D5e/FRew05/8KQ3wt7LTC+rcwVLOoX6FnMCmCyhk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cc0no36rfK36Gl3pHuukZeYkIndvZ7hgBCbP8Ig+l8zKUuyYeTbe59WnulWgLqgw3dLvWErEay2DM6kkvKvqam3m09fOLuu+absY34ap+DyTgmoXg8zYts40iQmOmd1PMghKewZx+u+9OPdYp+LOeKv8rr7RTSyYwlft3NJPhP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f6HMrNGb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5FE9C4CED7;
	Thu, 28 Nov 2024 02:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732759821;
	bh=YX1D5e/FRew05/8KQ3wt7LTC+rcwVLOoX6FnMCmCyhk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f6HMrNGbGl1EZWUn0dSe9HN+UC+j8gLdEDk5HrRDDuRmbB7MdMp/IgFbfWj41Cl2y
	 ayRpWLf3hatk58Va6nnNiI6yU85h9VFMz6trtKd6mGqHfktnwETPWz1Tarm5S5e64K
	 4EKoB9fKyKg1ItD5Up4c8aNKxw34aOUJ+GDHZYb/5E5G9/V9syWeAKvH8AY3B7qauS
	 WVeuNisw1fKRQqthZCHuOBgvoYphMD+EES97yg2b7qpcwgsT3miMnOgIM3kM4tg86C
	 0taG89cHcuTaxGvEueJAGO0jlOxE+U7Hp+TJTcBI++VxOzQAWlS1I9NOsOgoixqGc5
	 eyLfpoES5C+jA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53dd2fdcebcso309598e87.0;
        Wed, 27 Nov 2024 18:10:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX/41V+P1tb9Kfk75K0qaZSNM4v8K5LLl6gT4X5LP4tlq2FZKFg78cEBLFzoxAU0zSasdwbiRt7XAWF38g=@vger.kernel.org, AJvYcCXvO5WnChtjgqAmBGD8nJhM+ai9FovVhfNaZDWxAcNjvFnoBpaePJBiVPl8phsJjw36KAHFjo7OtEBLKbB92w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+ZXXuEHC1uk5xAZy8/EwnrUQgQdapKg1jyUdjGx3CF9crMKhd
	7Jmvdi9UPjJcWQu15nOCFSGkgeWPgY81hxTrosfJNdhnSIVfCO82f7vI7le8Q7j6zQLhHZU9cSo
	cB6Y+g/jah6AxyhrYnfRsm0sJZJA=
X-Google-Smtp-Source: AGHT+IGJl1MVVpustJ2ts2Pio5dLzBKWLqVoYYvsx3ccT201+1nWm8YVMnCydOOQg35CI1c8yA12VrmouApP27aeKhc=
X-Received: by 2002:a05:6512:3d89:b0:539:f9b9:e6d2 with SMTP id
 2adb3069b0e04-53df00ff7c6mr3300348e87.35.1732759820389; Wed, 27 Nov 2024
 18:10:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z0ZxiLw9hauUynTS@bombadil.infradead.org> <CAHk-=wjCkJsdLageTx6C4n--aYFoO6gSRe0Rwcbk1jQdOdiPfg@mail.gmail.com>
 <Z0eeuCyUGcKgsc5h@bombadil.infradead.org> <Z0eqiayuv1w4a_dc@bombadil.infradead.org>
 <CAHk-=wj+imfGvW73XoYn60bAMzRtPfXFqwFTUqBoEq4=u5_oUg@mail.gmail.com>
In-Reply-To: <CAHk-=wj+imfGvW73XoYn60bAMzRtPfXFqwFTUqBoEq4=u5_oUg@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 28 Nov 2024 11:09:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQyhxPZfpK3hVPtYvCYjad4pTUim5jVsEsuXqefY8KhWQ@mail.gmail.com>
Message-ID: <CAK7LNAQyhxPZfpK3hVPtYvCYjad4pTUim5jVsEsuXqefY8KhWQ@mail.gmail.com>
Subject: Re: [GIT PULL] Modules changes for v6.13-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>, Luis Chamberlain <mcgrof@kernel.org>
Cc: samitolvanen@google.com, petr.pavlu@suse.com, da.gomez@samsung.com, 
	linux-modules@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, mmaurer@google.com, arnd@arndb.de, 
	deller@gmx.de, song@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus and Luis,


On Thu, Nov 28, 2024 at 8:57=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, 27 Nov 2024 at 15:26, Luis Chamberlain <mcgrof@kernel.org> wrote:
> >
> > On Wed, Nov 27, 2024 at 02:35:36PM -0800, Luis Chamberlain wrote:
> > > Sorry about that, I'm on it.
> >
> > OK here is a fix, goes double build tested and then run time tested.
>
> No, you misunderstand.
>
> I don't mind the tests being built. That's *good*.
>
> I mind them being built *twice*. That means that there's some
> seriously broken lack of dependency logic.
>
>             Linus


Right.

The lib/tests/module/test_kallsyms_*.c files
are always regenerated due to the 'FORCE'.

lib/tests/module/Makefile:

$(obj)/%.c: FORCE




The following diff will fix the issue.
(I used 'foreach' to factor out similar lines, but it is just a bonus clean=
-up).


diff --git a/lib/tests/module/Makefile b/lib/tests/module/Makefile
index af5c27b996cb..8cfc4ae600a9 100644
--- a/lib/tests/module/Makefile
+++ b/lib/tests/module/Makefile
@@ -3,13 +3,12 @@ obj-$(CONFIG_TEST_KALLSYMS_B) +=3D test_kallsyms_b.o
 obj-$(CONFIG_TEST_KALLSYMS_C) +=3D test_kallsyms_c.o
 obj-$(CONFIG_TEST_KALLSYMS_D) +=3D test_kallsyms_d.o

-$(obj)/%.c: FORCE
-       @$(kecho) "  GEN     $@"
-       $(Q)$(srctree)/lib/tests/module/gen_test_kallsyms.sh $@\
-               $(CONFIG_TEST_KALLSYMS_NUMSYMS) \
-               $(CONFIG_TEST_KALLSYMS_SCALE_FACTOR)
+quiet_cmd_gen_test_kallsyms =3D GEN     $@
+      cmd_gen_test_kallsyms =3D $< $@ \
+       $(CONFIG_TEST_KALLSYMS_NUMSYMS) \
+       $(CONFIG_TEST_KALLSYMS_SCALE_FACTOR)

-clean-files +=3D test_kallsyms_a.c
-clean-files +=3D test_kallsyms_b.c
-clean-files +=3D test_kallsyms_c.c
-clean-files +=3D test_kallsyms_d.c
+$(obj)/%.c: $(src)/gen_test_kallsyms.sh FORCE
+       $(call if_changed,gen_test_kallsyms)
+
+targets +=3D $(foreach x, a b c d, test_kallsyms_$(x).c)








--=20
Best Regards
Masahiro Yamada

