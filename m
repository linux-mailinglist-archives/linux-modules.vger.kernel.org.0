Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7696523E3B
	for <lists+linux-modules@lfdr.de>; Wed, 11 May 2022 22:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347472AbiEKUBP (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Wed, 11 May 2022 16:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347510AbiEKUBC (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Wed, 11 May 2022 16:01:02 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9267E3669D;
        Wed, 11 May 2022 13:00:53 -0700 (PDT)
Received: from leknes.fjasle.eu ([46.142.98.214]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MxVbb-1o0Lhb1Ltx-00xtXp; Wed, 11 May 2022 21:57:46 +0200
Received: from localhost.fjasle.eu (bergen.fjasle.eu [IPv6:fdda:8718:be81:0:6f0:21ff:fe91:394])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by leknes.fjasle.eu (Postfix) with ESMTPS id F36C23C09D;
        Wed, 11 May 2022 21:57:39 +0200 (CEST)
Authentication-Results: leknes.fjasle.eu; dkim=none; dkim-atps=neutral
Received: by localhost.fjasle.eu (Postfix, from userid 1000)
        id 8F8C22C6; Wed, 11 May 2022 21:57:38 +0200 (CEST)
Date:   Wed, 11 May 2022 21:57:38 +0200
From:   Nicolas Schier <nicolas@fjasle.eu>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-modules@vger.kernel.org, llvm@lists.linux.dev,
        Ard Biesheuvel <ardb@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH v5 04/12] kbuild: link symbol CRCs at final link,
 removing CONFIG_MODULE_REL_CRCS
Message-ID: <YnwVMkVHTscGGnoG@bergen.fjasle.eu>
References: <20220511164514.2741934-1-masahiroy@kernel.org>
 <20220511164514.2741934-5-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220511164514.2741934-5-masahiroy@kernel.org>
Jabber-ID: nicolas@jabber.no
X-Operating-System: Debian GNU/Linux bookworm/sid
X-Provags-ID: V03:K1:CtoSehSX3sJArj1APd/rq3RAJrdmEdZRNseLeqnxpun9vWJYGHA
 97kVUpPohDweUMHxYcgFQpDBDW+ccD6r5R9X90SGUOwwct3dcgBZYmL5Op4tlUjDvzOQzqA
 evf7KxRNjo5qbXGg3ea8vXs/lYdMiAsakozYkk8m4Qb5qffS9wIz0Tt1qyCmWQfZV2OvigE
 awBpzgW1bcrza7nn0L0rg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+6WBOxLiLtg=:XAxg2lkTx6jcjGabz+wBzK
 dAqceqLSnv68qRlOHe+i/+N+UFRX4SeXvipBCac1bMG5VS4a9beDeCKrHWaT/jtDR1fFDKqdP
 CvpIOufKEU66N9mgZduN2a2YhEjxDm+s5qYU0lydjPvXdj6iddwAwAOd74vq3D6QylkJfGYzT
 nX4YA7H7ZVX51SHpgP9Z1UGkfP0IT1FyS7oKZ3VreKwIa+mmGXzJK18LrJ39tHb3fC3EXQ4DK
 aPkzq8O4tnbwW6xoF2ylHTHzyz7cfi7/9NNhgbElpum2GnHan2DCCcbgQbgtY8nuvU3aLW7Vj
 ERrg0TxT/pucvKBtrUAm+o/sXL8uirr8cpGi452oVBcsQMGX8S4GfcNPZ+4xZ8M7g7/mCLk3W
 0syGcsiHYfErKPhvZEMz3m1cWrIh0QsXrwW0MezZHBUkREPpXTGCfuB8kR8gutcSzagLO/Ckh
 /SW46354+tECl/Sk0vcy1PYSwkEuphgyHXtTwRvcdY0oXzevniXQ/119kUmj9Hz7tiC6mrpI4
 i+mADGI8YSHgj5ohA0aqA0swDz+5RQlNNSgoUzA5zDOEQxh+PWSfMRir+GZuVTugJtvIdx9SI
 ZbMA5ZM4nd5GHOvonIxoEF0kYNjHH7ePFY4I/I1koxYiiifdm7BH6zBZ/KeT+7rlnZKYdrIit
 O74uCeTKxWyLXAe/JKBLhlONeBTP99JZTrNNzM8/pZggOS9T4+MG4YHqI8E55vDj8Zyc=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

On Thu 12 May 2022 01:45:06, Masahiro Yamada wrote:
> include/{linux,asm-generic}/export.h defines a weak symbol, __crc_*
> as a placeholder.
> 
> Genksyms writes the version CRCs into the linker script, which will be
> used for filling the __crc_* symbols. The linker script format depends
> on CONFIG_MODULE_REL_CRCS. If it is enabled, __crc_* holds the offset
> to the reference of CRC.
> 
> It is time to get rid of this complexity.
> 
> Now that modpost parses text files (.*.cmd) to collect all the CRCs,
> it can generate C code that will be linked to the vmlinux or modules.
> 
> Generate a new C file, .vmlinux.export.c, which contains the CRCs of
> symbols exported by vmlinux. It is compiled and linked to vmlinux in
> scripts/link-vmlinux.sh.
> 
> Put the CRCs of symbols exported by modules into the existing *.mod.c
> files. No additional build step is needed for modules. As before,
> *.mod.c are compiled and linked to *.ko in scripts/Makefile.modfinal.
> 
> No linker magic is used here. The new C implementation works in the
> same way, whether CONFIG_RELOCATABLE is enabled or not.
> CONFIG_MODULE_REL_CRCS is no longer needed.
> 
> Previously, Kbuild invoked additional $(LD) to update the CRCs in
> objects, but this step is unneeded too.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Tested-by: Nathan Chancellor <nathan@kernel.org>
> ---
> 
> Changes in v5:
>   - Fix the build error when CONFIG_DEBUG_INFO_BTF=y (reported by Nathan)
>   - Clean up arch/m68k/include/asm/export.h (Nick)
>   - Keep gen_symversions (and will be removed by a later patch)
> 
> Changes in v4:
>   - Rename .vmlinux-symver.c to .vmlinux.export.c
>     because I notice this approach is useful for further cleanups,
>     not only for modversioning but also for overall EXPORT_SYMBOL.
> 
> Changes in v3:
>   - New patch
> 
>  arch/m68k/include/asm/Kbuild    |  1 +
>  arch/m68k/include/asm/export.h  |  2 --
>  arch/powerpc/Kconfig            |  1 -
>  arch/s390/Kconfig               |  1 -
>  arch/um/Kconfig                 |  1 -
>  include/asm-generic/export.h    | 22 ++++++++--------------
>  include/linux/export-internal.h | 16 ++++++++++++++++
>  include/linux/export.h          | 30 ++++++++----------------------
>  init/Kconfig                    |  4 ----
>  kernel/module.c                 | 10 +---------
>  scripts/Makefile.build          | 27 ++++-----------------------
>  scripts/genksyms/genksyms.c     | 18 ++++--------------
>  scripts/link-vmlinux.sh         | 14 +++++++++++++-
>  scripts/mod/modpost.c           | 28 ++++++++++++++++++++++++----
>  14 files changed, 79 insertions(+), 96 deletions(-)
>  delete mode 100644 arch/m68k/include/asm/export.h
>  create mode 100644 include/linux/export-internal.h
> 
> diff --git a/arch/m68k/include/asm/Kbuild b/arch/m68k/include/asm/Kbuild
> index 0dbf9c5c6fae..1b720299deb1 100644
> --- a/arch/m68k/include/asm/Kbuild
> +++ b/arch/m68k/include/asm/Kbuild
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  generated-y += syscall_table.h
> +generic-y += export.h
>  generic-y += extable.h
>  generic-y += kvm_para.h
>  generic-y += mcs_spinlock.h
> diff --git a/arch/m68k/include/asm/export.h b/arch/m68k/include/asm/export.h
> deleted file mode 100644
> index b53008b67ce1..000000000000
> --- a/arch/m68k/include/asm/export.h
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -#define KCRC_ALIGN 2
> -#include <asm-generic/export.h>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 174edabb74fa..a4e8dd889e29 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -566,7 +566,6 @@ config RELOCATABLE
>  	bool "Build a relocatable kernel"
>  	depends on PPC64 || (FLATMEM && (44x || FSL_BOOKE))
>  	select NONSTATIC_KERNEL
> -	select MODULE_REL_CRCS if MODVERSIONS
>  	help
>  	  This builds a kernel image that is capable of running at the
>  	  location the kernel is loaded at. For ppc32, there is no any
> diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
> index 77b5a03de13a..aa5848004c76 100644
> --- a/arch/s390/Kconfig
> +++ b/arch/s390/Kconfig
> @@ -567,7 +567,6 @@ endchoice
>  
>  config RELOCATABLE
>  	bool "Build a relocatable kernel"
> -	select MODULE_REL_CRCS if MODVERSIONS
>  	default y
>  	help
>  	  This builds a kernel image that retains relocation information
> diff --git a/arch/um/Kconfig b/arch/um/Kconfig
> index 4d398b80aea8..e8983d098e73 100644
> --- a/arch/um/Kconfig
> +++ b/arch/um/Kconfig
> @@ -106,7 +106,6 @@ config LD_SCRIPT_DYN
>  	bool
>  	default y
>  	depends on !LD_SCRIPT_STATIC
> -	select MODULE_REL_CRCS if MODVERSIONS
>  
>  config LD_SCRIPT_DYN_RPATH
>  	bool "set rpath in the binary" if EXPERT
> diff --git a/include/asm-generic/export.h b/include/asm-generic/export.h
> index 07a36a874dca..5e4b1f2369d2 100644
> --- a/include/asm-generic/export.h
> +++ b/include/asm-generic/export.h
> @@ -2,6 +2,14 @@
>  #ifndef __ASM_GENERIC_EXPORT_H
>  #define __ASM_GENERIC_EXPORT_H
>  
> +/*
> + * This comment block is used by fixdep. Please do not remove.
> + *
> + * When CONFIG_MODVERSIONS is changed from n to y, all source files having
> + * EXPORT_SYMBOL variants must be re-compiled because genksyms is run as a
> + * side effect of the *.o build rule.
> + */
> +
>  #ifndef KSYM_FUNC
>  #define KSYM_FUNC(x) x
>  #endif
> @@ -12,9 +20,6 @@
>  #else
>  #define KSYM_ALIGN 4
>  #endif
> -#ifndef KCRC_ALIGN
> -#define KCRC_ALIGN 4
> -#endif
>  
>  .macro __put, val, name
>  #ifdef CONFIG_HAVE_ARCH_PREL32_RELOCATIONS
> @@ -43,17 +48,6 @@ __ksymtab_\name:
>  __kstrtab_\name:
>  	.asciz "\name"
>  	.previous
> -#ifdef CONFIG_MODVERSIONS
> -	.section ___kcrctab\sec+\name,"a"
> -	.balign KCRC_ALIGN
> -#if defined(CONFIG_MODULE_REL_CRCS)
> -	.long __crc_\name - .
> -#else
> -	.long __crc_\name
> -#endif
> -	.weak __crc_\name
> -	.previous
> -#endif
>  #endif
>  .endm
>  
> diff --git a/include/linux/export-internal.h b/include/linux/export-internal.h
> new file mode 100644
> index 000000000000..77175d561058
> --- /dev/null
> +++ b/include/linux/export-internal.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Please do not include this explicitly.
> + * This is used by C files generated by modpost.
> + */
> +
> +#ifndef __LINUX_EXPORT_INTERNAL_H__
> +#define __LINUX_EXPORT_INTERNAL_H__
> +
> +#include <linux/compiler.h>
> +#include <linux/types.h>
> +
> +#define SYMBOL_CRC(sym, crc, sec)   \
> +	u32 __section("___kcrctab" sec "+" #sym) __crc_##sym = crc
> +
> +#endif /* __LINUX_EXPORT_INTERNAL_H__ */
> diff --git a/include/linux/export.h b/include/linux/export.h
> index 27d848712b90..565c5ffcb26f 100644
> --- a/include/linux/export.h
> +++ b/include/linux/export.h
> @@ -11,6 +11,14 @@
>   * hackers place grumpy comments in header files.
>   */
>  
> +/*
> + * This comment block is used by fixdep. Please do not remove.
> + *
> + * When CONFIG_MODVERSIONS is changed from n to y, all source files having
> + * EXPORT_SYMBOL variants must be re-compiled because genksyms is run as a
> + * side effect of the *.o build rule.
> + */
> +
>  #ifndef __ASSEMBLY__
>  #ifdef MODULE
>  extern struct module __this_module;
> @@ -19,26 +27,6 @@ extern struct module __this_module;
>  #define THIS_MODULE ((struct module *)0)
>  #endif
>  
> -#ifdef CONFIG_MODVERSIONS
> -/* Mark the CRC weak since genksyms apparently decides not to
> - * generate a checksums for some symbols */
> -#if defined(CONFIG_MODULE_REL_CRCS)
> -#define __CRC_SYMBOL(sym, sec)						\
> -	asm("	.section \"___kcrctab" sec "+" #sym "\", \"a\"	\n"	\
> -	    "	.weak	__crc_" #sym "				\n"	\
> -	    "	.long	__crc_" #sym " - .			\n"	\
> -	    "	.previous					\n")
> -#else
> -#define __CRC_SYMBOL(sym, sec)						\
> -	asm("	.section \"___kcrctab" sec "+" #sym "\", \"a\"	\n"	\
> -	    "	.weak	__crc_" #sym "				\n"	\
> -	    "	.long	__crc_" #sym "				\n"	\
> -	    "	.previous					\n")
> -#endif
> -#else
> -#define __CRC_SYMBOL(sym, sec)
> -#endif
> -
>  #ifdef CONFIG_HAVE_ARCH_PREL32_RELOCATIONS
>  #include <linux/compiler.h>
>  /*
> @@ -85,7 +73,6 @@ struct kernel_symbol {
>  /*
>   * For every exported symbol, do the following:
>   *
> - * - If applicable, place a CRC entry in the __kcrctab section.
>   * - Put the name of the symbol and namespace (empty string "" for none) in
>   *   __ksymtab_strings.
>   * - Place a struct kernel_symbol entry in the __ksymtab section.
> @@ -98,7 +85,6 @@ struct kernel_symbol {
>  	extern typeof(sym) sym;							\
>  	extern const char __kstrtab_##sym[];					\
>  	extern const char __kstrtabns_##sym[];					\
> -	__CRC_SYMBOL(sym, sec);							\
>  	asm("	.section \"__ksymtab_strings\",\"aMS\",%progbits,1	\n"	\
>  	    "__kstrtab_" #sym ":					\n"	\
>  	    "	.asciz 	\"" #sym "\"					\n"	\
> diff --git a/init/Kconfig b/init/Kconfig
> index ddcbefe535e9..f5b14318dfcb 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -2136,10 +2136,6 @@ config ASM_MODVERSIONS
>  	  assembly. This can be enabled only when the target architecture
>  	  supports it.
>  
> -config MODULE_REL_CRCS
> -	bool
> -	depends on MODVERSIONS
> -
>  config MODULE_SRCVERSION_ALL
>  	bool "Source checksum for all modules"
>  	help
> diff --git a/kernel/module.c b/kernel/module.c
> index 6cea788fd965..c9e2342da28e 100644
> --- a/kernel/module.c
> +++ b/kernel/module.c
> @@ -1231,11 +1231,6 @@ static int try_to_force_load(struct module *mod, const char *reason)
>  
>  #ifdef CONFIG_MODVERSIONS
>  
> -static u32 resolve_rel_crc(const s32 *crc)
> -{
> -	return *(u32 *)((void *)crc + *crc);
> -}
> -
>  static int check_version(const struct load_info *info,
>  			 const char *symname,
>  			 struct module *mod,
> @@ -1264,10 +1259,7 @@ static int check_version(const struct load_info *info,
>  		if (strcmp(versions[i].name, symname) != 0)
>  			continue;
>  
> -		if (IS_ENABLED(CONFIG_MODULE_REL_CRCS))
> -			crcval = resolve_rel_crc(crc);
> -		else
> -			crcval = *crc;
> +		crcval = *crc;
>  		if (versions[i].crc == crcval)
>  			return 1;
>  		pr_debug("Found checksum %X vs module %lX\n",
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index a1023868775f..ddd9080fc028 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -128,7 +128,6 @@ $(obj)/%.i: $(src)/%.c FORCE
>  
>  genksyms = scripts/genksyms/genksyms		\
>  	$(if $(1), -T $(2))			\
> -	$(if $(CONFIG_MODULE_REL_CRCS), -R)	\
>  	$(if $(KBUILD_PRESERVE), -p)		\
>  	-r $(or $(wildcard $(2:.symtypes=.symref)), /dev/null)
>  
> @@ -162,19 +161,11 @@ ifdef CONFIG_MODVERSIONS
>  # o if <file>.o doesn't contain a __ksymtab version, i.e. does
>  #   not export symbols, it's done.
>  # o otherwise, we calculate symbol versions using the good old
> -#   genksyms on the preprocessed source and postprocess them in a way
> -#   that they are usable as a linker script
> -# o generate .tmp_<file>.o from <file>.o using the linker to
> -#   replace the unresolved symbols __crc_exported_symbol with
> -#   the actual value of the checksum generated by genksyms
> -# o remove .tmp_<file>.o to <file>.o
> +#   genksyms on the preprocessed source and dump them into the .cmd file.
> +# o modpost will extract versions from that file and create *.c files that will
> +#   be compiled and linked to the kernel and/or modules.
>  
> -# Generate .o.symversions files for each .o with exported symbols, and link these
> -# to the kernel and/or modules at the end.
> -
> -genksyms_format_rel_crc := [^_]*__crc_\([^ ]*\) = \.; LONG(\([^)]*\)).*
> -genksyms_format_normal := __crc_\(.*\) = \(.*\);
> -genksyms_format := $(if $(CONFIG_MODULE_REL_CRCS),$(genksyms_format_rel_crc),$(genksyms_format_normal))
> +genksyms_format := __crc_\(.*\) = \(.*\);
>  
>  gen_symversions =								\
>  	if $(NM) $@ 2>/dev/null | grep -q __ksymtab; then			\
> @@ -188,12 +179,6 @@ gen_symversions =								\
>  
>  cmd_gen_symversions_c =	$(call gen_symversions,c)
>  
> -cmd_modversions =								\
> -	if [ -r $@.symversions ]; then						\
> -		$(LD) $(KBUILD_LDFLAGS) -r -o $(@D)/.tmp_$(@F) $@ 		\
> -			-T $@.symversions;					\
> -		mv -f $(@D)/.tmp_$(@F) $@;					\
> -	fi
>  endif
>  
>  ifdef CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
> @@ -273,7 +258,6 @@ define rule_cc_o_c
>  	$(call cmd,checkdoc)
>  	$(call cmd,gen_objtooldep)
>  	$(call cmd,gen_symversions_c)
> -	$(if $(CONFIG_LTO_CLANG),,$(call cmd,modversions))
>  	$(call cmd,record_mcount)
>  endef
>  
> @@ -282,7 +266,6 @@ define rule_as_o_S
>  	$(call cmd,gen_ksymdeps)
>  	$(call cmd,gen_objtooldep)
>  	$(call cmd,gen_symversions_S)
> -	$(call cmd,modversions)
>  endef
>  
>  # Built-in and composite module parts
> @@ -296,8 +279,6 @@ ifneq ($(CONFIG_LTO_CLANG)$(CONFIG_X86_KERNEL_IBT),)
>  quiet_cmd_cc_prelink_modules = LD [M]  $@
>        cmd_cc_prelink_modules =						\
>  	$(LD) $(ld_flags) -r -o $@					\
> -               $(shell [ -s $(@:.prelink.o=.o.symversions) ] &&		\
> -                       echo -T $(@:.prelink.o=.o.symversions))		\
>  		--whole-archive $(filter-out FORCE,$^)			\
>  		$(cmd_objtool)
>  
> diff --git a/scripts/genksyms/genksyms.c b/scripts/genksyms/genksyms.c
> index 4827c5abe5b7..67b23cc0df0f 100644
> --- a/scripts/genksyms/genksyms.c
> +++ b/scripts/genksyms/genksyms.c
> @@ -33,7 +33,7 @@ char *cur_filename;
>  int in_source_file;
>  
>  static int flag_debug, flag_dump_defs, flag_reference, flag_dump_types,
> -	   flag_preserve, flag_warnings, flag_rel_crcs;
> +	   flag_preserve, flag_warnings;
>  
>  static int errors;
>  static int nsyms;
> @@ -680,11 +680,7 @@ void export_symbol(const char *name)
>  		if (flag_dump_defs)
>  			fputs(">\n", debugfile);
>  
> -		/* Used as a linker script. */
> -		printf(!flag_rel_crcs ? "__crc_%s = 0x%08lx;\n" :
> -		       "SECTIONS { .rodata : ALIGN(4) { "
> -		       "__crc_%s = .; LONG(0x%08lx); } }\n",
> -		       name, crc);
> +		printf("__crc_%s = 0x%08lx;\n", name, crc);
>  	}
>  }
>  
> @@ -733,7 +729,6 @@ static void genksyms_usage(void)
>  	      "  -q, --quiet           Disable warnings (default)\n"
>  	      "  -h, --help            Print this message\n"
>  	      "  -V, --version         Print the release version\n"
> -	      "  -R, --relative-crc    Emit section relative symbol CRCs\n"
>  #else				/* __GNU_LIBRARY__ */
>  	      "  -s                    Select symbol prefix\n"
>  	      "  -d                    Increment the debug level (repeatable)\n"
> @@ -745,7 +740,6 @@ static void genksyms_usage(void)
>  	      "  -q                    Disable warnings (default)\n"
>  	      "  -h                    Print this message\n"
>  	      "  -V                    Print the release version\n"
> -	      "  -R                    Emit section relative symbol CRCs\n"
>  #endif				/* __GNU_LIBRARY__ */
>  	      , stderr);
>  }
> @@ -766,14 +760,13 @@ int main(int argc, char **argv)
>  		{"preserve", 0, 0, 'p'},
>  		{"version", 0, 0, 'V'},
>  		{"help", 0, 0, 'h'},
> -		{"relative-crc", 0, 0, 'R'},
>  		{0, 0, 0, 0}
>  	};
>  
> -	while ((o = getopt_long(argc, argv, "s:dwqVDr:T:phR",
> +	while ((o = getopt_long(argc, argv, "s:dwqVDr:T:ph",
>  				&long_opts[0], NULL)) != EOF)
>  #else				/* __GNU_LIBRARY__ */
> -	while ((o = getopt(argc, argv, "s:dwqVDr:T:phR")) != EOF)
> +	while ((o = getopt(argc, argv, "s:dwqVDr:T:ph")) != EOF)
>  #endif				/* __GNU_LIBRARY__ */
>  		switch (o) {
>  		case 'd':
> @@ -813,9 +806,6 @@ int main(int argc, char **argv)
>  		case 'h':
>  			genksyms_usage();
>  			return 0;
> -		case 'R':
> -			flag_rel_crcs = 1;
> -			break;
>  		default:
>  			genksyms_usage();
>  			return 1;
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index eceb3ee7ec06..7313cbd755df 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -90,7 +90,6 @@ modpost_link()
>  
>  		if is_enabled CONFIG_MODVERSIONS; then
>  			gen_symversions
> -			lds="${lds} -T .tmp_symversions.lds"
>  		fi
>  
>  		# This might take a while, so indicate that we're doing
> @@ -183,6 +182,10 @@ vmlinux_link()
>  		libs="${KBUILD_VMLINUX_LIBS}"
>  	fi
>  
> +	if is_enabled CONFIG_MODULES; then
> +		objs="${objs} .vmlinux.export.o"
> +	fi
> +
>  	if [ "${SRCARCH}" = "um" ]; then
>  		wl=-Wl,
>  		ld="${CC}"
> @@ -312,6 +315,7 @@ cleanup()
>  	rm -f vmlinux.o
>  	rm -f .vmlinux.d
>  	rm -f .vmlinux.objs
> +	rm -f .vmlinux.export.c
>  }
>  
>  # Use "make V=1" to debug this script
> @@ -363,6 +367,14 @@ info GEN modules.builtin
>  tr '\0' '\n' < modules.builtin.modinfo | sed -n 's/^[[:alnum:]:_]*\.file=//p' |
>  	tr ' ' '\n' | uniq | sed -e 's:^:kernel/:' -e 's/$/.ko/' > modules.builtin
>  
> +if is_enabled CONFIG_MODULES; then
> +	info CC .vmlinux.export.c
> +	${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} \
> +	      ${KBUILD_CPPFLAGS} ${KBUILD_CFLAGS} \
> +	      ${KBUILD_CFLAGS_KERNEL} ${CFLAGS_KERNEL} \
> +	      -c -o .vmlinux.export.o .vmlinux.export.c
> +fi
> +
>  btf_vmlinux_bin_o=""
>  if is_enabled CONFIG_DEBUG_INFO_BTF; then
>  	btf_vmlinux_bin_o=.btf.vmlinux.bin.o
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index e0f9c02d9f83..6b47a8723389 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1040,6 +1040,7 @@ static void add_header(struct buffer *b, struct module *mod)
>  	buf_printf(b, "#define INCLUDE_VERMAGIC\n");
>  	buf_printf(b, "#include <linux/build-salt.h>\n");
>  	buf_printf(b, "#include <linux/elfnote-lto.h>\n");
> +	buf_printf(b, "#include <linux/export-internal.h>\n");
>  	buf_printf(b, "#include <linux/vermagic.h>\n");
>  	buf_printf(b, "#include <linux/compiler.h>\n");
>  	buf_printf(b, "\n");
> @@ -1074,20 +1075,26 @@ static void add_header(struct buffer *b, struct module *mod)
>  		buf_printf(b, "\nMODULE_INFO(staging, \"Y\");\n");
>  }
>  
> -static void check_symversions(struct module *mod)
> +static void add_exported_symbols(struct buffer *buf, struct module *mod)
>  {
>  	struct symbol *sym;
>  
>  	if (!modversions)
>  		return;
>  
> +	/* record CRCs for exported symbols */
> +	buf_printf(buf, "\n");
>  	list_for_each_entry(sym, &mod->exported_symbols, list) {
>  		if (!sym->crc_valid) {
>  			warn("EXPORT symbol \"%s\" [%s%s] version generation failed, symbol will not be versioned.\n"
>  			     "Is \"%s\" prototyped in <asm/asm-prototypes.h>?\n",
>  			     sym->name, mod->name, mod->is_vmlinux ? "" : ".ko",
>  			     sym->name);
> +			continue;
>  		}
> +
> +		buf_printf(buf, "SYMBOL_CRC(%s, 0x%08x, \"%s\");\n",
> +			   sym->name, sym->crc, sym->is_gpl_only ? "_gpl" : "");
>  	}
>  }
>  
> @@ -1224,6 +1231,18 @@ static void write_if_changed(struct buffer *b, const char *fname)
>  	write_buf(b, fname);
>  }
>  
> +static void write_vmlinux_export_c_file(struct module *mod)
> +{
> +	struct buffer buf = { };
> +
> +	buf_printf(&buf,
> +		   "#include <linux/export-internal.h>\n");
> +
> +	add_exported_symbols(&buf, mod);
> +	write_if_changed(&buf, ".vmlinux.export.c");
> +	free(buf.p);
> +}
> +
>  /* do sanity checks, and generate *.mod.c file */
>  static void write_mod_c_file(struct module *mod)
>  {
> @@ -1235,6 +1254,7 @@ static void write_mod_c_file(struct module *mod)
>  	check_exports(mod);
>  
>  	add_header(&buf, mod);
> +	add_exported_symbols(&buf, mod);
>  	add_versions(&buf, mod);
>  	add_depends(&buf, mod);
>  	add_moddevtable(&buf, mod);
> @@ -1432,9 +1452,9 @@ int main(int argc, char **argv)
>  		if (mod->from_dump)
>  			continue;
>  
> -		check_symversions(mod);
> -
> -		if (!mod->is_vmlinux)
> +		if (mod->is_vmlinux)
> +			write_vmlinux_export_c_file(mod);
> +		else
>  			write_mod_c_file(mod);
>  	}
>  
> -- 
> 2.32.0

Tested-by: Nicolas Schier <nicolas@fjasle.eu>
Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
