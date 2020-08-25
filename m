Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBB86251DE1
	for <lists+linux-modules@lfdr.de>; Tue, 25 Aug 2020 19:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726432AbgHYRNS (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Tue, 25 Aug 2020 13:13:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726483AbgHYRNM (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Tue, 25 Aug 2020 13:13:12 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF301C061574
        for <linux-modules@vger.kernel.org>; Tue, 25 Aug 2020 10:13:11 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id 2so2365878wrj.10
        for <linux-modules@vger.kernel.org>; Tue, 25 Aug 2020 10:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wZE/FcAPVxJaBdE/8VzHAH/HqdqTSevuA2NzCYcqtI4=;
        b=h8BDugKdGsQejw+aQqH20uN+3tO3yb03ulESn/nRKpdqDwr2G7AzSqBUHeYF6GQXPz
         f8fX5MyrrPh9b/+m3uql4sR/ELH9u6n0UWz0cn75+YCDhT1CPyPXAYQu+ihQjKnrEOzQ
         VIJH9x9Y6X3hR9rvChU3UcCWRyfgxlde9QAjAdleW3r+3w/HQGjpTmbEmWle1aIgM2M+
         gmozlpSgtkN9aGtQVgWebs3eqPWsepRyuBcuKaP2pxYl+ssx5QrRrxwwbUrjaYuHQTUs
         pWxuSyR5uLpYKqcZJpUEnALPOnIxNZ7BKaJ65hd8q1H3OwP/s1atYdNZboQbVvtIy2ca
         Stsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wZE/FcAPVxJaBdE/8VzHAH/HqdqTSevuA2NzCYcqtI4=;
        b=NWXS7cq7/VLDDudO0EUrsXbAxeVBfm4FrP2/PcZpxirKUFj9JwEB5C0Ke3Ejp/pg16
         xan3SEjmpQDkHI/HHmGt77oZACU1I83WYskG78lgCX1ihkzVI90frGaDAN53Zq8qoJ1x
         W/741hn7qIGa875QhI9wtVEjq8W7KBl87Df1AEi+FqYkX87UelvihdbS0jNoq0VJ7RW4
         CRHNpzHEDStw5Hswh5LGNt1v2UmilkTxXRoogcJIHdaAKU0iEYr5UG67sUarIvtEUKyr
         ZFmlTgODOdNYXSqIxMqxKYqz02WXzifR8iAdov//k2/tel+d18FIpN8t/3qUc6A5QOaO
         YjqA==
X-Gm-Message-State: AOAM530nYJIyP0UuvLMGAX7I+egKQeVLaR5aypQCb/0gmx9oOfl8Ooq1
        iv69RNEDDsWqrcfcP7ntS2+Kc50fMoaTEkU5vU0=
X-Google-Smtp-Source: ABdhPJwrLJVMdghkwrGIxYrvKYe9qCJmghj7ppysJeYG7GF3se5YgG/YCqsCPfsheZ605/AiFFjZe9U+cgtevnTCNoo=
X-Received: by 2002:adf:93a3:: with SMTP id 32mr11136660wrp.424.1598375590399;
 Tue, 25 Aug 2020 10:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200821224501.196413-1-openglfreak@googlemail.com>
In-Reply-To: <20200821224501.196413-1-openglfreak@googlemail.com>
From:   Lucas De Marchi <lucas.de.marchi@gmail.com>
Date:   Tue, 25 Aug 2020 10:12:57 -0700
Message-ID: <CAKi4VALQVkiqP3pXswwVKJ2_q0kAOHfj8f_UN-B7w+sahcS9EA@mail.gmail.com>
Subject: Re: [PATCH] Add Zstandard support
To:     Torge Matthies <openglfreak@googlemail.com>
Cc:     linux-modules <linux-modules@vger.kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Dave Reisner <dreisner@archlinux.org>
Content-Type: text/plain; charset="UTF-8"
Sender: owner-linux-modules@vger.kernel.org
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

Hi,

On Fri, Aug 21, 2020 at 3:46 PM Torge Matthies
<openglfreak@googlemail.com> wrote:
>
> I was not able to find any existing zstd patch for kmod, so I wrote my own.

thanks a lot for adding this.

>
> I was struggling to get the C code below the 80 character line length limit,
> that's why I used gotos. I used descriptive label names, and it still looks
> clean enough in my opinion.

Humn.. I'd rather prefer not to be on 80 chars than using some of the gotos,
but take a look below

>
> I changed the style of the hackargs variable in autogen.sh to multiline
> because said line was becoming a bit long with the new --with-zstd arg
> added.

ok

>
> This patch has been running on my two Arch Linux installations (with an
> accompanying mkinitcpio patch) for several months over many kernel updates
> without any issues.

great. Is Arch already using zstd for the kernel? Once this lands, is
it going to
zstd for modules?

+Dave


> Any additional testing and/or patch review would of course be appreciated.
>
> Signed-off-by: Torge Matthies <openglfreak@googlemail.com>
> ---
>  .semaphore/semaphore.yml     |   4 +-
>  .travis.yml                  |   1 +
>  Makefile.am                  |   4 +-
>  autogen.sh                   |   9 ++-
>  configure.ac                 |  13 +++-
>  libkmod/libkmod-file.c       | 119 +++++++++++++++++++++++++++++++++++
>  libkmod/libkmod.pc.in        |   2 +-
>  shared/util.c                |   3 +
>  testsuite/mkosi/mkosi.fedora |   1 +
>  testsuite/test-util.c        |   3 +
>  10 files changed, 153 insertions(+), 6 deletions(-)
>
> diff --git a/.semaphore/semaphore.yml b/.semaphore/semaphore.yml
> index db47ca1..fe1d78a 100644
> --- a/.semaphore/semaphore.yml
> +++ b/.semaphore/semaphore.yml
> @@ -22,7 +22,7 @@ blocks:
>        prologue:
>          commands:
>            - sudo apt update
> -          - sudo apt --yes install docbook-xsl liblzma-dev zlib1g-dev cython linux-headers-generic libssl-dev
> +          - sudo apt --yes install docbook-xsl libzstd-dev liblzma-dev zlib1g-dev cython linux-headers-generic libssl-dev
>            - checkout
>
>        epilogue:
> @@ -42,5 +42,5 @@ blocks:
>        prologue:
>          commands:
>            - sudo apt update
> -          - sudo apt --yes install docbook-xsl liblzma-dev zlib1g-dev cython linux-headers-generic libssl-dev
> +          - sudo apt --yes install docbook-xsl libzstd-dev liblzma-dev zlib1g-dev cython linux-headers-generic libssl-dev
>            - checkout
> diff --git a/.travis.yml b/.travis.yml
> index 02c753e..0fcce14 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -14,6 +14,7 @@ matrix:
>  before_install:
>    - sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
>    - sudo apt-get update -qq
> +  - sudo apt-get install -qq libzstd-dev
>    - sudo apt-get install -qq liblzma-dev
>    - sudo apt-get install -qq zlib1g-dev
>    - sudo apt-get install -qq xsltproc docbook-xsl
> diff --git a/Makefile.am b/Makefile.am
> index 8eadb99..37d840b 100644
> --- a/Makefile.am
> +++ b/Makefile.am
> @@ -31,6 +31,8 @@ SED_PROCESS = \
>         -e 's,@exec_prefix\@,$(exec_prefix),g' \
>         -e 's,@libdir\@,$(libdir),g' \
>         -e 's,@includedir\@,$(includedir),g' \
> +       -e 's,@libzstd_CFLAGS\@,${libzstd_CFLAGS},g' \
> +       -e 's,@libzstd_LIBS\@,${libzstd_LIBS},g' \
>         -e 's,@liblzma_CFLAGS\@,${liblzma_CFLAGS},g' \
>         -e 's,@liblzma_LIBS\@,${liblzma_LIBS},g' \
>         -e 's,@zlib_CFLAGS\@,${zlib_CFLAGS},g' \
> @@ -90,7 +92,7 @@ libkmod_libkmod_la_DEPENDENCIES = \
>         ${top_srcdir}/libkmod/libkmod.sym
>  libkmod_libkmod_la_LIBADD = \
>         shared/libshared.la \
> -       ${liblzma_LIBS} ${zlib_LIBS} ${libcrypto_LIBS}
> +       ${libzstd_LIBS} ${liblzma_LIBS} ${zlib_LIBS} ${libcrypto_LIBS}
>
>  noinst_LTLIBRARIES += libkmod/libkmod-internal.la
>  libkmod_libkmod_internal_la_SOURCES = $(libkmod_libkmod_la_SOURCES)
> diff --git a/autogen.sh b/autogen.sh
> index 67b119f..e4997c4 100755
> --- a/autogen.sh
> +++ b/autogen.sh
> @@ -32,7 +32,14 @@ fi
>
>  cd $oldpwd
>
> -hackargs="--enable-debug --enable-python --with-xz --with-zlib --with-openssl"
> +hackargs="\
> +--enable-debug \
> +--enable-python \
> +--with-zstd \
> +--with-xz \
> +--with-zlib \
> +--with-openssl \
> +"
>
>  if [ "x$1" = "xc" ]; then
>          shift
> diff --git a/configure.ac b/configure.ac
> index 4a65d6b..a49f6b9 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -83,6 +83,17 @@ AC_ARG_WITH([rootlibdir],
>          [], [with_rootlibdir=$libdir])
>  AC_SUBST([rootlibdir], [$with_rootlibdir])
>
> +AC_ARG_WITH([zstd],
> +       AS_HELP_STRING([--with-zstd], [handle Zstandard-compressed modules @<:@default=disabled@:>@]),
> +       [], [with_zstd=no])
> +AS_IF([test "x$with_zstd" != "xno"], [
> +       PKG_CHECK_MODULES([libzstd], [libzstd >= 1.4.4])
> +       AC_DEFINE([ENABLE_ZSTD], [1], [Enable Zstandard for modules.])
> +], [
> +       AC_MSG_NOTICE([Zstandard support not requested])
> +])
> +CC_FEATURE_APPEND([with_features], [with_zstd], [ZSTD])
> +
>  AC_ARG_WITH([xz],
>         AS_HELP_STRING([--with-xz], [handle Xz-compressed modules @<:@default=disabled@:>@]),
>         [], [with_xz=no])
> @@ -307,7 +318,7 @@ AC_MSG_RESULT([
>         tools:                  ${enable_tools}
>         python bindings:        ${enable_python}
>         logging:                ${enable_logging}
> -       compression:            xz=${with_xz}  zlib=${with_zlib}
> +       compression:            zstd=${with_zstd}  xz=${with_xz}  zlib=${with_zlib}
>         debug:                  ${enable_debug}
>         coverage:               ${enable_coverage}
>         doc:                    ${enable_gtk_doc}
> diff --git a/libkmod/libkmod-file.c b/libkmod/libkmod-file.c
> index 5eeba6a..1a2e753 100644
> --- a/libkmod/libkmod-file.c
> +++ b/libkmod/libkmod-file.c
> @@ -26,6 +26,9 @@
>  #include <sys/stat.h>
>  #include <sys/types.h>
>  #include <unistd.h>
> +#ifdef ENABLE_ZSTD
> +#include <zstd.h>
> +#endif
>  #ifdef ENABLE_XZ
>  #include <lzma.h>
>  #endif
> @@ -45,6 +48,9 @@ struct file_ops {
>  };
>
>  struct kmod_file {
> +#ifdef ENABLE_ZSTD
> +       bool zstd_used;
> +#endif
>  #ifdef ENABLE_XZ
>         bool xz_used;
>  #endif
> @@ -60,6 +66,116 @@ struct kmod_file {
>         struct kmod_elf *elf;
>  };
>
> +#ifdef ENABLE_ZSTD
> +static int load_zstd(struct kmod_file *file)
> +{
> +       ZSTD_DStream *dstr = NULL;
> +       size_t in_buf_size, out_buf_min_size, out_buf_size;
> +       uint8_t *in_buf = NULL, *out_buf = NULL;
> +       ZSTD_inBuffer zst_input;
> +       ZSTD_outBuffer zst_output;
> +       int ret = -EINVAL;
> +
> +       dstr = ZSTD_createDStream();
> +       if (dstr == NULL) {
> +               ERR(file->ctx, "zstd: Failed to create decompression stream\n");
> +               ret = -EINVAL;
> +               goto out;
> +       }
> +
> +       in_buf_size = ZSTD_initDStream(dstr);
> +       in_buf = malloc(in_buf_size);
> +       if (in_buf == NULL) {
> +               ERR(file->ctx, "zstd: %s\n", strerror(ENOMEM));

no big deal, but malloc() should set errno, so you could use
ret = -errno before printing and then use %m in the message.

Same thing in other places.

> +               ret = -ENOMEM;
> +               goto out;
> +       }
> +
> +       out_buf_size = out_buf_min_size = ZSTD_DStreamOutSize();
> +       out_buf = malloc(out_buf_size);
> +       if (out_buf == NULL) {
> +               ERR(file->ctx, "zstd: %s\n", strerror(ENOMEM));
> +               ret = -ENOMEM;
> +               goto out;
> +       }
> +
> +       zst_input.src = in_buf;
> +       zst_output.dst = out_buf;
> +       zst_output.size = out_buf_size;
> +       zst_output.pos = 0;
> +       while (true) {
> +               ssize_t rdret;
> +               size_t dsret;
> +               uint8_t *tmp;
> +
> +               rdret = read(file->fd, in_buf, in_buf_size);
> +               if (rdret < 0) {
> +                       ret = -errno;
> +                       goto out;
> +               }
> +               if (rdret == 0)
> +                       break;
> +
> +               zst_input.size = rdret;
> +               zst_input.pos = 0;
> +
> +               if (zst_output.size - zst_output.pos < out_buf_min_size)
> +                       goto realloc_buffer;

this could be a helper function to realloc the buffer. It can even be shared
for the first alloc if you initialize zst_output.size to 0.. Then you
have something like:

> +
> +try_decompress:
> +               dsret = ZSTD_decompressStream(dstr, &zst_output, &zst_input);
> +               if (ZSTD_isError(dsret)) {
> +                       ERR(file->ctx, "zstd: %s\n", ZSTD_getErrorName(dsret));
> +                       ret = -EINVAL;
> +                       goto out;
> +               }
> +
> +               if (zst_output.pos < zst_output.size
> +                       && zst_output.size - zst_output.pos
> +                       >= out_buf_min_size) {
> +                       if (zst_input.pos < zst_input.size)
> +                               goto try_decompress;

this looks like a while/for loop. Could even be in a helper function


> +                       else
> +                               continue;
> +               }
> +
> +realloc_buffer:
> +               tmp = realloc(out_buf, out_buf_size + out_buf_min_size);
> +               if (tmp == NULL) {
> +                       ret = -errno;
> +                       goto out;
> +               }
> +               out_buf_size += out_buf_min_size;
> +               out_buf = tmp;
> +               zst_output.dst = out_buf;
> +               zst_output.size = out_buf_size;
> +               goto try_decompress;
> +       }
> +
> +       ZSTD_freeDStream(dstr);
> +       free(in_buf);
> +       file->zstd_used = true;
> +       file->memory = out_buf;
> +       file->size = zst_output.pos;
> +       return 0;
> +out:
> +       if (dstr != NULL)
> +               ZSTD_freeDStream(dstr);
> +       free(out_buf);
> +       free(in_buf);
> +       return ret;
> +}
> +
> +static void unload_zstd(struct kmod_file *file)
> +{
> +       if (!file->zstd_used)
> +               return;
> +       free(file->memory);
> +}
> +
> +static const char magic_zstd[] = {0x28, 0xB5, 0x2F, 0xFD};
> +#endif
> +
>  #ifdef ENABLE_XZ
>  static void xz_uncompress_belch(struct kmod_file *file, lzma_ret ret)
>  {
> @@ -238,6 +354,9 @@ static const struct comp_type {
>         const char *magic_bytes;
>         const struct file_ops ops;
>  } comp_types[] = {
> +#ifdef ENABLE_ZSTD
> +       {sizeof(magic_zstd), magic_zstd, {load_zstd, unload_zstd}},
> +#endif
>  #ifdef ENABLE_XZ
>         {sizeof(magic_xz), magic_xz, {load_xz, unload_xz}},
>  #endif
> diff --git a/libkmod/libkmod.pc.in b/libkmod/libkmod.pc.in
> index e4fdf21..3acca6a 100644
> --- a/libkmod/libkmod.pc.in
> +++ b/libkmod/libkmod.pc.in
> @@ -7,5 +7,5 @@ Name: libkmod
>  Description: Library to deal with kernel modules
>  Version: @VERSION@
>  Libs: -L${libdir} -lkmod
> -Libs.private: @liblzma_LIBS@ @zlib_LIBS@
> +Libs.private: @libzstd_LIBS@ @liblzma_LIBS@ @zlib_LIBS@
>  Cflags: -I${includedir}
> diff --git a/shared/util.c b/shared/util.c
> index fd2028d..b487b5f 100644
> --- a/shared/util.c
> +++ b/shared/util.c
> @@ -45,6 +45,9 @@ static const struct kmod_ext {
>  #endif
>  #ifdef ENABLE_XZ
>         {".ko.xz", sizeof(".ko.xz") - 1},
> +#endif
> +#ifdef ENABLE_ZSTD
> +       {".ko.zst", sizeof(".ko.zst") - 1},
>  #endif
>         { }
>  };
> diff --git a/testsuite/mkosi/mkosi.fedora b/testsuite/mkosi/mkosi.fedora
> index 5252f87..7a2ee5e 100644
> --- a/testsuite/mkosi/mkosi.fedora
> +++ b/testsuite/mkosi/mkosi.fedora
> @@ -19,6 +19,7 @@ BuildPackages =
>         make
>         pkgconf-pkg-config
>         xml-common
> +       libzstd-devel
>         xz-devel
>         zlib-devel
>         openssl-devel
> diff --git a/testsuite/test-util.c b/testsuite/test-util.c
> index 5e25e58..621446b 100644
> --- a/testsuite/test-util.c
> +++ b/testsuite/test-util.c
> @@ -156,6 +156,9 @@ static int test_path_ends_with_kmod_ext(const struct test *t)
>  #endif
>  #ifdef ENABLE_XZ
>                 { "/bla.ko.xz", true },
> +#endif
> +#ifdef ENABLE_ZSTD
> +               { "/bla.ko.zst", true },

I think we want a zstd-compressed module in the testsuite as well to test this.

thanks
Lucas De Marchi

>  #endif
>                 { "/bla.ko.x", false },
>                 { "/bla.ko.", false },
> --
> 2.28.0
>
