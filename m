Return-Path: <linux-modules+bounces-2663-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 292D79DB16C
	for <lists+linux-modules@lfdr.de>; Thu, 28 Nov 2024 03:22:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA081B20B0A
	for <lists+linux-modules@lfdr.de>; Thu, 28 Nov 2024 02:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A19A42065;
	Thu, 28 Nov 2024 02:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B5ViQ4Kx"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDDA33DF;
	Thu, 28 Nov 2024 02:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732760549; cv=none; b=Sq1fdSbyLZ1gqDHvGhxSnLKJvjJROZTS02OXUDgVmuWn7kOLrcLmdwqjSwX4RR7QqI4Ms81JfM2X4YVEuiV4iq6peSKy6lAuKrt+oqZicR9epfZ7NwES0FyYS2nonYs8HBe1ZKw/DAapthyOYFu625wCYZk2bDcl64z6vuKhBQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732760549; c=relaxed/simple;
	bh=ZDz1m5wguyNknjgwK4RvPulZTP4oicLjox5MGdn0e3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q6VCLgjj9Kj6i/Vu8KYMxtM9sXZITDuedpZFOmyWbMvAO2vUUPeXB2IG0r0K73MyfFrEX9C60mztE63DRIp0WN+veLKHMr8hCw1K0z2M6koIB6zH2UXyPB3PttAxdOIBJW2Aj7TbPMUSS7GVgDey4bycQkk8vvo4gkONFN/lPvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B5ViQ4Kx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 229BBC4CECC;
	Thu, 28 Nov 2024 02:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732760548;
	bh=ZDz1m5wguyNknjgwK4RvPulZTP4oicLjox5MGdn0e3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B5ViQ4KxhUqTQh3Lq9jlEBMSKA5+va9iKMuuJ4e7xchSdalr2tLgvkA73USjSyt1r
	 Hb+D4RWeWQ+FNyk9sTixhbHTZh6LGNRK2RdU5aggNsGCoGGQl5SmPACZ7GNo9sNp1O
	 APHe2pwVby0etTzGY6QTbLzIueq8+BCsYbE+tC3p/4Jf8H4I70aZphLXHh4YRE+bOw
	 dO5bvFqlPjSYqTQfcJF4sbyjMOvGM8N1s4m9QwZSSJ/pp0Vzn7xc37PTqP9ms4sbiG
	 pymxihgEDWXMwPFlzjsnrVh3EpyS2qXwSEo/a1touX6M406DoALfzRVONjjZjhNDOH
	 gCciNHUOIQXAg==
Date: Wed, 27 Nov 2024 18:22:26 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: samitolvanen@google.com, petr.pavlu@suse.com, da.gomez@samsung.com,
	linux-modules@vger.kernel.org, patches@lists.linux.dev,
	linux-kernel@vger.kernel.org, masahiroy@kernel.org,
	mmaurer@google.com, arnd@arndb.de, deller@gmx.de, song@kernel.org
Subject: Re: [GIT PULL] Modules changes for v6.13-rc1
Message-ID: <Z0fT4hC30NISjmi_@bombadil.infradead.org>
References: <Z0ZxiLw9hauUynTS@bombadil.infradead.org>
 <CAHk-=wjCkJsdLageTx6C4n--aYFoO6gSRe0Rwcbk1jQdOdiPfg@mail.gmail.com>
 <Z0eeuCyUGcKgsc5h@bombadil.infradead.org>
 <Z0eqiayuv1w4a_dc@bombadil.infradead.org>
 <CAHk-=wj+imfGvW73XoYn60bAMzRtPfXFqwFTUqBoEq4=u5_oUg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wj+imfGvW73XoYn60bAMzRtPfXFqwFTUqBoEq4=u5_oUg@mail.gmail.com>

On Wed, Nov 27, 2024 at 03:56:48PM -0800, Linus Torvalds wrote:
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

Ah, gobble gobble, got it. That was also fixed in the patch but it I
also changed the default build to go fast, ok we'll revert back to the
older defaults (TEST_KALLSYMS_LARGE now) now and just make it clear the
double build was the issue being fixed.

From f7da80262bd89a0d2c2c1a9e59f5a14b84e34f3f Mon Sep 17 00:00:00 2001
From: Luis Chamberlain <mcgrof@kernel.org>
Date: Wed, 27 Nov 2024 14:10:57 -0800
Subject: [PATCH v2] selftests: kallsyms: fix double build stupidity

Fix the stupid FORCE so that re-builds will only trigger
when really needed. While at it, document the sensible ranges
supported and fix the script to accept these alternatives.

Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 lib/Kconfig.debug                     | 32 ++++++++++++++++++++++++++-
 lib/tests/module/Makefile             |  2 +-
 lib/tests/module/gen_test_kallsyms.sh |  9 ++++++--
 3 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index b5929721fc63..da8c35bfaeaf 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2986,9 +2986,39 @@ config TEST_KALLSYMS_D
 	tristate
 	depends on m
 
+choice
+	prompt "Kallsym test range"
+	default TEST_KALLSYMS_LARGE
+	help
+	  Selecting something other than "Fast" will enable tests which slow
+	  down the build and may crash your build.
+
+config TEST_KALLSYMS_FAST
+	bool "Fast builds"
+	help
+	  You won't really be testing kallsysms, so this just helps fast builds
+	  when allmodconfig is used..
+
+config TEST_KALLSYMS_LARGE
+	bool "Enable testing kallsyms with large exports"
+	help
+	  This will enable larger number of symbols. Only enable this if you
+	  are a modules developer. This will slow down your build considerbly.
+
+config TEST_KALLSYMS_MAX
+	bool "Known kallsysms limits"
+	help
+	  This will enable exports to the point we know we'll start crashing
+	  builds.
+
+endchoice
+
 config TEST_KALLSYMS_NUMSYMS
 	int "test kallsyms number of symbols"
-	default 100
+	range 2 10000
+	default 2 if TEST_KALLSYMS_FAST
+	default 100 if TEST_KALLSYMS_LARGE
+	default 10000 if TEST_KALLSYMS_MAX
 	help
 	  The number of symbols to create on TEST_KALLSYMS_A, only one of which
 	  module TEST_KALLSYMS_B will use. This also will be used
diff --git a/lib/tests/module/Makefile b/lib/tests/module/Makefile
index af5c27b996cb..5436386d7aa0 100644
--- a/lib/tests/module/Makefile
+++ b/lib/tests/module/Makefile
@@ -3,7 +3,7 @@ obj-$(CONFIG_TEST_KALLSYMS_B) += test_kallsyms_b.o
 obj-$(CONFIG_TEST_KALLSYMS_C) += test_kallsyms_c.o
 obj-$(CONFIG_TEST_KALLSYMS_D) += test_kallsyms_d.o
 
-$(obj)/%.c: FORCE
+$(obj)/%.c: $(srctree)/lib/tests/module/gen_test_kallsyms.sh $(KCONFIG_CONFIG)
 	@$(kecho) "  GEN     $@"
 	$(Q)$(srctree)/lib/tests/module/gen_test_kallsyms.sh $@\
 		$(CONFIG_TEST_KALLSYMS_NUMSYMS) \
diff --git a/lib/tests/module/gen_test_kallsyms.sh b/lib/tests/module/gen_test_kallsyms.sh
index 3f2c626350ad..561dcac0f359 100755
--- a/lib/tests/module/gen_test_kallsyms.sh
+++ b/lib/tests/module/gen_test_kallsyms.sh
@@ -7,6 +7,11 @@ NUM_SYMS=$2
 SCALE_FACTOR=$3
 TEST_TYPE=$(echo $TARGET | sed -e 's|lib/tests/module/test_kallsyms_||g')
 TEST_TYPE=$(echo $TEST_TYPE | sed -e 's|.c||g')
+FIRST_B_LOOKUP=1
+
+if [[ $NUM_SYMS -gt 2 ]]; then
+	FIRST_B_LOOKUP=$((NUM_SYMS/2))
+fi
 
 gen_template_module_header()
 {
@@ -52,10 +57,10 @@ ____END_MODULE
 
 gen_template_module_data_b()
 {
-	printf "\nextern int auto_test_a_%010d;\n\n" 28
+	printf "\nextern int auto_test_a_%010d;\n\n" $FIRST_B_LOOKUP
 	echo "static int auto_runtime_test(void)"
 	echo "{"
-	printf "\nreturn auto_test_a_%010d;\n" 28
+	printf "\nreturn auto_test_a_%010d;\n" $FIRST_B_LOOKUP
 	echo "}"
 }
 
-- 
2.45.2


