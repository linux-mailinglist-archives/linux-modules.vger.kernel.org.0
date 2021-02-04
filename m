Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD46130EF7C
	for <lists+linux-modules@lfdr.de>; Thu,  4 Feb 2021 10:21:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233668AbhBDJSi (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Thu, 4 Feb 2021 04:18:38 -0500
Received: from mx2.suse.de ([195.135.220.15]:58336 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233593AbhBDJSg (ORCPT <rfc822;linux-modules@vger.kernel.org>);
        Thu, 4 Feb 2021 04:18:36 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 3F448B031;
        Thu,  4 Feb 2021 09:17:53 +0000 (UTC)
Date:   Thu, 4 Feb 2021 10:17:51 +0100
From:   Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To:     Lucas De Marchi <lucas.demarchi@intel.com>
Cc:     linux-modules@vger.kernel.org, Petr Vorel <petr.vorel@gmail.com>
Subject: Re: [PATCH 1/2] testsuite: compress modules if feature is enabled
Message-ID: <20210204091751.GA6564@kitsune.suse.cz>
References: <20210130023600.24239-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210130023600.24239-1-lucas.demarchi@intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

Hello,

thanks for the patch.

I tested it and it allows me to run tests with zstd disabled.

It also makes the code much clearer.

Reviewed-by: Michal Such�nek <msuchanek@suse.de>
Tested-by: Michal Such�nek <msuchanek@suse.de>

On Fri, Jan 29, 2021 at 06:35:59PM -0800, Lucas De Marchi wrote:
> Since the output needs to be the same, regardless if the module is
> compressed, change populate-modules.sh to conditionally compress the
> module if that feature is enabled.
> 
> This way we can execute the tests with any build-time configuration and
> it should still pass.
> 
> Suggested-by: Michal Such�nek <msuchanek@suse.de>
> ---
>  Makefile.am                   |  2 +-
>  testsuite/populate-modules.sh | 27 ++++++++++++++++++---------
>  testsuite/test-depmod.c       |  2 --
>  3 files changed, 19 insertions(+), 12 deletions(-)
> 
> diff --git a/Makefile.am b/Makefile.am
> index b29e943..24a586e 100644
> --- a/Makefile.am
> +++ b/Makefile.am
> @@ -249,7 +249,7 @@ CREATE_ROOTFS = $(AM_V_GEN) ( $(RM) -rf $(ROOTFS) && mkdir -p $(dir $(ROOTFS)) &
>  				find $(ROOTFS) -type d -exec chmod +w {} \; && \
>  				find $(ROOTFS) -type f -name .gitignore -exec rm -f {} \; && \
>  				$(top_srcdir)/testsuite/populate-modules.sh \
> -					$(MODULE_PLAYGROUND) $(ROOTFS) ) && \
> +					$(MODULE_PLAYGROUND) $(ROOTFS) $(top_builddir)/config.h ) && \
>  				touch testsuite/stamp-rootfs
>  
>  build-module-playground:
> diff --git a/testsuite/populate-modules.sh b/testsuite/populate-modules.sh
> index b0cc932..ae43884 100755
> --- a/testsuite/populate-modules.sh
> +++ b/testsuite/populate-modules.sh
> @@ -4,6 +4,12 @@ set -e
>  
>  MODULE_PLAYGROUND=$1
>  ROOTFS=$2
> +CONFIG_H=$3
> +
> +feature_enabled() {
> +	local feature=$1
> +	grep KMOD_FEATURES  $CONFIG_H | head -n 1 | grep -q \+$feature
> +}
>  
>  declare -A map
>  map=(
> @@ -99,15 +105,18 @@ done
>  
>  # start poking the final rootfs...
>  
> -# gzip these modules
> -for m in "${gzip_array[@]}"; do
> -    gzip "$ROOTFS/$m"
> -done
> -
> -# zstd-compress these modules
> -for m in "${zstd_array[@]}"; do
> -    zstd --rm $ROOTFS/$m
> -done
> +# compress modules with each format if feature is enabled
> +if feature_enabled ZLIB; then
> +	for m in "${gzip_array[@]}"; do
> +	    gzip "$ROOTFS/$m"
> +	done
> +fi
> +
> +if feature_enabled ZSTD; then
> +	for m in "${zstd_array[@]}"; do
> +	    zstd --rm $ROOTFS/$m
> +	done
> +fi
>  
>  for m in "${attach_sha1_array[@]}"; do
>      cat "${MODULE_PLAYGROUND}/dummy.sha1" >>"${ROOTFS}/$m"
> diff --git a/testsuite/test-depmod.c b/testsuite/test-depmod.c
> index 261559c..d7802d7 100644
> --- a/testsuite/test-depmod.c
> +++ b/testsuite/test-depmod.c
> @@ -25,7 +25,6 @@
>  
>  #include "testsuite.h"
>  
> -#ifdef ENABLE_ZLIB
>  #define MODULES_ORDER_UNAME "4.4.4"
>  #define MODULES_ORDER_ROOTFS TESTSUITE_ROOTFS "test-depmod/modules-order-compressed"
>  #define MODULES_ORDER_LIB_MODULES MODULES_ORDER_ROOTFS "/lib/modules/" MODULES_ORDER_UNAME
> @@ -57,7 +56,6 @@ DEFINE_TEST(depmod_modules_order_for_compressed,
>  			{ }
>  		},
>  	});
> -#endif
>  
>  #define SEARCH_ORDER_SIMPLE_ROOTFS TESTSUITE_ROOTFS "test-depmod/search-order-simple"
>  static noreturn int depmod_search_order_simple(const struct test *t)
> -- 
> 2.30.0
> 
