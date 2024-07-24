Return-Path: <linux-modules+bounces-1612-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 467A593AC30
	for <lists+linux-modules@lfdr.de>; Wed, 24 Jul 2024 07:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 597B91F233D0
	for <lists+linux-modules@lfdr.de>; Wed, 24 Jul 2024 05:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E7C46B91;
	Wed, 24 Jul 2024 05:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B4PnM2Hq"
X-Original-To: linux-modules@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6F3374D4;
	Wed, 24 Jul 2024 05:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721797937; cv=none; b=TLDjG63OmXhiMHxBsM0SzfJ1riINgUuuQV6HqbXbVyYsv7mdBEwNC2S29nFPrBnyv6NDT5dwxzfn88d+C9KsW4aQyIhs5+XK3T/9zThDd0M0R+2VPeo8gDAULmWG0gK6LTDg/2wpgP0fDOMkB1/4ScXad69PZHWnXHA5xISWnL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721797937; c=relaxed/simple;
	bh=bc37Fmnc4bs/LY8ezz0jXZwfB0rMa7/4BR0Y+Ehaol4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E3t4p0o9gNoUb/3Gv8tRamdFdT3Zy0nd5jrB1HHegRcu1fO5UD4/ZKkvR8Mra3bi6Ed/p9kh6LpChfHKPkHW6k+huDZ+bb/Joj+Z59Fot+tWHmGk8vpLBi73XgRA8Q8K4u+ai1Nzmu2jN9htewHtlAKD+cM/EIM5O0fXnb/n48M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B4PnM2Hq; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721797934; x=1753333934;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bc37Fmnc4bs/LY8ezz0jXZwfB0rMa7/4BR0Y+Ehaol4=;
  b=B4PnM2HqfItwF2SZROUE9WoemuoPEOHjptcM7zB+NRItebU7hvVMDxkJ
   p36RQ4M2e1DlcjtYyyXmyzAWXeRoO3jQhTGrMMDafThyKFFTh24vnfvS8
   DzF8sZ6ZDJS8VLfb0/YcatodReci6A+4GDsgv/CLEOReky94erMffz0ys
   f0adFpv/Cz1TFMHkTrpDKbsMPKLsXHBZSlOpdcyGBfovzE2OHwIQBViHx
   rhCQ9BxeVvo5Bel+j5cM8RD/LY45GbjHVcn0LPi7wJtrzOVSyzp/nwP+X
   UHqSc6LjWDLsSPEViN9R6jxbYrS9Pkm/X7IE1WgRtVwWAI6EETMlxAwqH
   w==;
X-CSE-ConnectionGUID: 3vWj342USki7RTjhjYgzeA==
X-CSE-MsgGUID: xYVNdj3aSa6jAO4fX1PGjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19148317"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="19148317"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 22:12:13 -0700
X-CSE-ConnectionGUID: HJj2DOetTJ+q7MLftwXyKw==
X-CSE-MsgGUID: MG3UP/W/QrKIFz56YmEDsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="52340486"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Jul 2024 22:12:06 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWUIG-000mh6-1S;
	Wed, 24 Jul 2024 05:12:04 +0000
Date: Wed, 24 Jul 2024 13:11:43 +0800
From: kernel test robot <lkp@intel.com>
To: Zheng Yejian <zhengyejian@huaweicloud.com>, masahiroy@kernel.org,
	peterz@infradead.org, rostedt@goodmis.org, mhiramat@kernel.org,
	mark.rutland@arm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, naveen.n.rao@linux.ibm.com,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, mcgrof@kernel.org,
	mathieu.desnoyers@efficios.com, nathan@kernel.org,
	nicolas@fjasle.eu, ojeda@kernel.org, akpm@linux-foundation.org,
	surenb@google.com, pasha.tatashin@soleen.com,
	kent.overstreet@linux.dev, james.clark@arm.com, jpoimboe@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Subject: Re: [PATCH v2 1/5] kallsyms: Emit symbol at the holes in the text
Message-ID: <202407241240.RuRWmbzm-lkp@intel.com>
References: <20240723063258.2240610-2-zhengyejian@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723063258.2240610-2-zhengyejian@huaweicloud.com>

Hi Zheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.10]
[cannot apply to mcgrof/modules-next masahiroy-kbuild/for-next masahiroy-kbuild/fixes powerpc/next powerpc/fixes tip/x86/core next-20240723]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zheng-Yejian/kallsyms-Emit-symbol-at-the-holes-in-the-text/20240723-152513
base:   linus/master
patch link:    https://lore.kernel.org/r/20240723063258.2240610-2-zhengyejian%40huaweicloud.com
patch subject: [PATCH v2 1/5] kallsyms: Emit symbol at the holes in the text
config: i386-randconfig-003-20240724 (https://download.01.org/0day-ci/archive/20240724/202407241240.RuRWmbzm-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407241240.RuRWmbzm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407241240.RuRWmbzm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol __fentry__
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol strcmp
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol _printk
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol strlen
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol strncmp
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol pcpu_hot
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol __kmalloc_noprof
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol call_rcu
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol sched_set_fifo
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol torture_sched_setaffinity
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol kfree
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol kernel_power_off
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol rcu_barrier
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol bitmap_parselist
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol sprintf
>> depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol __stack_chk_guard
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol set_user_nice
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol schedule_timeout_uninterruptible
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol jiffies
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol __warn_printk
>> depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol __stack_chk_fail
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol schedule_timeout_interruptible
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol __const_udelay
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol __SCT__preempt_schedule
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol sched_set_normal
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol _raw_spin_lock
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol _raw_spin_unlock
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol _raw_spin_lock_irqsave
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol _raw_spin_unlock_irqrestore
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol _raw_write_lock
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol _raw_write_unlock
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol _raw_read_lock
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol _raw_read_unlock
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol _raw_write_lock_irqsave
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol _raw_write_unlock_irqrestore
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol _raw_read_lock_irqsave
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol _raw_read_unlock_irqrestore
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol __mutex_init
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol mutex_lock_nested
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol __ubsan_handle_out_of_bounds
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol __ubsan_handle_shift_out_of_bounds
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol mutex_unlock
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol debug_check_no_locks_freed
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol lockdep_init_map_type
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol lock_acquire
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol __list_add_valid_or_report
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol ww_mutex_lock
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol ww_mutex_unlock
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol oops_in_progress
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol __list_del_entry_valid_or_report
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol debug_locks_off
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol debug_locks_silent
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol lock_release
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol __rt_mutex_init
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol rt_mutex_lock_nested
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol rt_mutex_unlock
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol down_write
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol up_write
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol down_read
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol up_read
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol __percpu_init_rwsem
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol __ubsan_handle_builtin_unreachable
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol percpu_free_rwsem
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol percpu_down_write
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol percpu_up_write
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol __might_sleep
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol __SCT__might_resched
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol preempt_count_add
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol debug_lockdep_rcu_enabled
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol rcu_read_lock_any_held
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol preempt_count_sub
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol lockdep_rcu_suspicious
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol __percpu_down_read
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol rcuwait_wake_up
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol start_poll_synchronize_rcu
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol param_ops_int
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/locktorture.ko needs unknown symbol param_ops_charp
>> depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol __fentry__
>> depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol __stack_chk_guard
>> depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol _printk
>> depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol get_random_u64
>> depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol alloc_workqueue
>> depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol memset
>> depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol __mutex_init
>> depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol pcpu_hot
>> depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol debug_check_no_locks_freed
>> depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol lockdep_init_map_type
>> depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol lock_acquire
>> depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol __init_swait_queue_head
>> depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol system_wq
>> depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol queue_work_on
>> depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol wait_for_completion
>> depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol ww_mutex_lock
>> depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol complete
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol wait_for_completion_timeout
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol ww_mutex_unlock
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol jiffies
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol completion_done
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol __might_resched
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol __SCT__cond_resched
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol flush_work
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol ww_mutex_trylock
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol oops_in_progress
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol debug_locks_off
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol debug_locks_silent
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol __warn_printk
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol __stack_chk_fail
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol destroy_workqueue
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol kmalloc_caches
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol __kmalloc_cache_noprof
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol __flush_workqueue
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol mutex_destroy
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol kfree
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol __kmalloc_noprof
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol lock_release
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol usleep_range_state
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol __list_add_valid_or_report
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol __list_del_entry_valid_or_report
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol __get_random_u32_below
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol _raw_spin_lock
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol prandom_u32_state
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/locking/test-ww_mutex.ko needs unknown symbol _raw_spin_unlock
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol __fentry__
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol __stack_chk_guard
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol strcmp
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol _printk
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol srcu_check_nmi_safety
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol __srcu_read_lock
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol synchronize_srcu
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol __srcu_read_unlock
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol __ubsan_handle_out_of_bounds
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol down_read
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol up_read
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol down_write
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol up_write
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol pcpu_hot
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol rcu_trace_lock_map
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol synchronize_rcu_tasks_trace
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol rcu_read_unlock_trace_special
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol mutex_lock_nested
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol mutex_unlock
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol __warn_printk
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol __list_add_valid_or_report
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol __kmalloc_noprof
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol jiffies
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol __cpuhp_setup_state
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol kernel_power_off
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol __stack_chk_fail
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol __might_sleep
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol __SCT__might_resched
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol init_wait_entry
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol prepare_to_wait_event
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol schedule
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol finish_wait
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol kfree
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol unregister_oom_notifier
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol rcu_get_gp_kthreads_prio
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol __cpuhp_remove_state
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol kmem_cache_create
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol kmem_cache_alloc_noprof
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol mem_dump_obj
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol kmem_cache_free
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol kmem_cache_destroy
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol kmalloc_caches
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol __kmalloc_cache_noprof
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol vmalloc_noprof
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol vfree
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol rcu_gp_is_expedited
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol rcu_gp_is_normal
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol _raw_spin_unlock_bh
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol _raw_spin_lock_bh
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol __udelay
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol debug_lockdep_rcu_enabled
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol rcu_read_lock_held
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol lockdep_rcu_suspicious
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol __list_del_entry_valid_or_report
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol rcu_unexpedite_gp
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol rcu_expedite_gp
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol rcu_inkernel_boot_has_ended
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol sched_set_normal
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol tracing_off
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol rcu_cpu_stall_suppress
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol ftrace_dump
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol __cpu_online_mask
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol set_user_nice
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol init_timer_key
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol mod_timer
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol schedule_timeout_interruptible
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol timer_delete_sync
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol schedule_hrtimeout
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol kthread_should_stop
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol kthread_create_on_cpu
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol wake_up_process
   depmod: WARNING: /tmp/kernel/i386-randconfig-003-20240724/clang-18/dbae13ff5e8d04476cede99ca67c4be77c2a7886/lib/modules/6.10.0-12031-gdbae13ff5e8d/kernel/kernel/rcu/rcutorture.ko needs unknown symbol __raw_spin_lock_init

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

