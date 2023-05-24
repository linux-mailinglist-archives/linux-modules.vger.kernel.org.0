Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1DBD70ECF1
	for <lists+linux-modules@lfdr.de>; Wed, 24 May 2023 07:16:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239057AbjEXFQf (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Wed, 24 May 2023 01:16:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232661AbjEXFQe (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Wed, 24 May 2023 01:16:34 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37C6AB5;
        Tue, 23 May 2023 22:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=I9IqEb8no59A924FX6sU6z+dubgGYogOVjLvHQykSkI=; b=0Mw7IVNe0sCggk3tYv0BpZkfDs
        +m7oibUrcxXWfT3cOiW8BJ2g0rL3JySdtNZpI8ERUEK72aagGvD7GydGm0j2UWZ5w7WSBUiuyKjCk
        u2shan7Yy9drc/3mpMSDNM+JrA7kY5kGvHWe14y7gljJwqCU1HrJx8Xgr6ZAImLedP2mGRj8/+ycW
        r0MjJmJnPtlxzZbpp3Gd0mqJco0kFCvEVc2KqjwU9FmI7btUhq5EG52d3H1PO2NJefV0qYEfplp+K
        XaVTTy+/UafCWtRgK3kh4xU6THzfDQFk8H2XyfcIcRN0HJwbVt5llLt3S3OQnF8PVdND3+p3p6vXP
        RkoPS5PQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
        id 1q1grB-00COCy-26;
        Wed, 24 May 2023 05:16:17 +0000
Date:   Tue, 23 May 2023 22:16:17 -0700
From:   Luis Chamberlain <mcgrof@kernel.org>
To:     kernel test robot <yujie.liu@intel.com>
Cc:     oe-lkp@lists.linux.dev, lkp@intel.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-modules@vger.kernel.org
Subject: Re: [linus:master] [module] 8660484ed1:
 WARNING:at_kernel/module/dups.c:#kmod_dup_request_exists_wait
Message-ID: <ZG2doZJrCK7Nlrqf@bombadil.infradead.org>
References: <202305221508.753c7b78-yujie.liu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202305221508.753c7b78-yujie.liu@intel.com>
Sender: Luis Chamberlain <mcgrof@infradead.org>
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        UPPERCASE_50_75 autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

On Mon, May 22, 2023 at 03:51:59PM +0800, kernel test robot wrote:
> Hello,
> 
> kernel test robot noticed "WARNING:at_kernel/module/dups.c:#kmod_dup_request_exists_wait" on:
> 
> commit: 8660484ed1cf3261e89e0bad94c6395597e87599 ("module: add debugging auto-load duplicate module support")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> [test failed on linux-next/master 798d276b39e984345d52b933a900a71fa0815928]
> 
> in testcase: boot
> 
> compiler: gcc-11
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> We are not sure if this is expected as this patch is for debugging
> duplicate module requests issues, so we are sending this report for
> your information. Thanks.
> 
> 
> If you fix the issue, kindly add following tag
> | Reported-by: kernel test robot <yujie.liu@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202305221508.753c7b78-yujie.liu@intel.com
> 
> 
> [   48.705567][    T1] ------------[ cut here ]------------
> [   48.706519][    T1] module-autoload: duplicate request for module intel_qat
> [ 48.707866][ T1] WARNING: CPU: 0 PID: 1 at kernel/module/dups.c:183 kmod_dup_request_exists_wait (kernel/module/dups.c:183 (discriminator 1)) 

This is a real issue since CONFIG_MODULE_DEBUG_AUTOLOAD_DUPS_TRACE was enabled.
If you enable CONFIG_MODULE_DEBUG_AUTOLOAD_DUPS_TRACE and these warnings
come up a bette detailed report would be better. In this case the goal
was to capture races of request_module() and so the idea for developers
is to identify the module that caused this, in this case intel_qat, and
then see who called the request_module() for it. They could try things
like try_module_get(), but could also ensure that multiple requests
won't be done in the code by using locking schemes or whatever. Only
one request should be issued.

The trace below would show possible users but I don't even see
drivers/crypto/qat/qat_c3xxx/adf_drv.c in my kernel tree.

If you don't to deal with this reporting you can just disable this
config option.

  Luis

> [   48.709747][    T1] Modules linked in:
> [   48.710593][    T1] CPU: 0 PID: 1 Comm: swapper Not tainted 6.3.0-rc1-00121-g8660484ed1cf #1
> [ 48.712267][ T1] RIP: 0010:kmod_dup_request_exists_wait (kernel/module/dups.c:183 (discriminator 1)) 
> [ 48.713599][ T1] Code: c7 80 e3 2a 83 e8 ba 9f fe 00 48 89 ef e8 fe 4c 17 00 80 3d 87 15 0e 02 00 4c 89 e6 74 10 48 c7 c7 20 c0 47 82 e8 d8 ba f2 ff <0f> 0b eb 0c 48 c7 c7 80 c0 47 82 e8 f7 73 fc ff 45 84 f6 75 3a 48
> All code
> ========
>    0:	c7 80 e3 2a 83 e8 ba 	movl   $0xfe9fba,-0x177cd51d(%rax)
>    7:	9f fe 00 
>    a:	48 89 ef             	mov    %rbp,%rdi
>    d:	e8 fe 4c 17 00       	call   0x174d10
>   12:	80 3d 87 15 0e 02 00 	cmpb   $0x0,0x20e1587(%rip)        # 0x20e15a0
>   19:	4c 89 e6             	mov    %r12,%rsi
>   1c:	74 10                	je     0x2e
>   1e:	48 c7 c7 20 c0 47 82 	mov    $0xffffffff8247c020,%rdi
>   25:	e8 d8 ba f2 ff       	call   0xfffffffffff2bb02
>   2a:*	0f 0b                	ud2		<-- trapping instruction
>   2c:	eb 0c                	jmp    0x3a
>   2e:	48 c7 c7 80 c0 47 82 	mov    $0xffffffff8247c080,%rdi
>   35:	e8 f7 73 fc ff       	call   0xfffffffffffc7431
>   3a:	45 84 f6             	test   %r14b,%r14b
>   3d:	75 3a                	jne    0x79
>   3f:	48                   	rex.W
> 
> Code starting with the faulting instruction
> ===========================================
>    0:	0f 0b                	ud2
>    2:	eb 0c                	jmp    0x10
>    4:	48 c7 c7 80 c0 47 82 	mov    $0xffffffff8247c080,%rdi
>    b:	e8 f7 73 fc ff       	call   0xfffffffffffc7407
>   10:	45 84 f6             	test   %r14b,%r14b
>   13:	75 3a                	jne    0x4f
>   15:	48                   	rex.W
> [   48.717441][    T1] RSP: 0000:ffffc9000001fc48 EFLAGS: 00010286
> [   48.718679][    T1] RAX: 0000000000000000 RBX: ffffc9000001fcb8 RCX: 0000000000000000
> [   48.720263][    T1] RDX: ffffc9000001f96f RSI: 0000000000000008 RDI: fffff52000003f7f
> [   48.721791][    T1] RBP: ffff88812ec34000 R08: 0000000000000000 R09: ffffc9000001fa17
> [   48.723349][    T1] R10: 0000000000000001 R11: ffffffff81199faf R12: ffffc9000001fd08
> [   48.724701][    T1] R13: ffff88812a9cd800 R14: 0000000000000001 R15: 0000000000000001
> [   48.726139][    T1] FS:  0000000000000000(0000) GS:ffffffff82cb6000(0000) knlGS:0000000000000000
> [   48.727857][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   48.729151][    T1] CR2: ffff88843ffff000 CR3: 0000000002c6d000 CR4: 00000000000406b0
> [   48.730703][    T1] Call Trace:
> [   48.731336][    T1]  <TASK>
> [ 48.731859][ T1] ? adfdrv_init (drivers/crypto/qat/qat_c3xxx/adf_drv.c:254) 
> [ 48.732687][ T1] __request_module (kernel/module/kmod.c:168) 
> [ 48.733637][ T1] ? free_modprobe_argv (kernel/module/kmod.c:133) 
> [ 48.734681][ T1] ? w1_ds2760_family_init (drivers/power/supply/ds2760_battery.c:801) 
> [ 48.735699][ T1] ? rcu_read_lock_sched_held (kernel/rcu/update.c:125) 
> [ 48.736791][ T1] ? adfdrv_init (drivers/crypto/qat/qat_c62x/adf_drv.c:251) 
> [ 48.737658][ T1] adfdrv_init (drivers/crypto/qat/qat_c3xxx/adf_drv.c:254) 
> [ 48.738518][ T1] do_one_initcall (init/main.c:1306) 
> [ 48.739479][ T1] ? rcu_lock_acquire (kernel/notifier.c:262) 
> [ 48.740637][ T1] ? rcu_read_lock_sched_held (kernel/rcu/update.c:125) 
> [ 48.741731][ T1] ? lock_is_held (include/linux/sched.h:1572) 
> [ 48.742565][ T1] do_initcalls (init/main.c:1378 init/main.c:1395) 
> [ 48.743358][ T1] kernel_init_freeable (init/main.c:1638) 
> [ 48.744281][ T1] ? rest_init (init/main.c:1514) 
> [ 48.745140][ T1] kernel_init (init/main.c:1524) 
> [ 48.745996][ T1] ret_from_fork (arch/x86/entry/entry_64.S:314) 
> [   48.746959][    T1]  </TASK>
> [   48.747563][    T1] irq event stamp: 2359969
> [ 48.748417][ T1] hardirqs last enabled at (2359977): __up_console_sem (arch/x86/include/asm/irqflags.h:26 (discriminator 3) arch/x86/include/asm/irqflags.h:67 (discriminator 3) arch/x86/include/asm/irqflags.h:127 (discriminator 3) kernel/printk/printk.c:345 (discriminator 3)) 
> [ 48.750315][ T1] hardirqs last disabled at (2359986): __up_console_sem (kernel/printk/printk.c:343 (discriminator 3)) 
> [ 48.752231][ T1] softirqs last enabled at (2359662): __do_softirq (arch/x86/include/asm/preempt.h:27 kernel/softirq.c:415 kernel/softirq.c:600) 
> [ 48.754058][ T1] softirqs last disabled at (2359653): irq_exit (kernel/softirq.c:445 kernel/softirq.c:650 kernel/softirq.c:674) 
> [   48.755866][    T1] ---[ end trace 0000000000000000 ]---
> [ 48.757648][ T1] initcall adfdrv_init+0x0/0x45 returned 0 after 52170 usecs 
> [ 48.759132][ T1] calling adfdrv_init+0x0/0x45 @ 1 
> 
> 
> To reproduce:
> 
>         # build kernel
> 	cd linux
> 	cp config-6.3.0-rc1-00121-g8660484ed1cf .config
> 	make HOSTCC=gcc-11 CC=gcc-11 ARCH=x86_64 olddefconfig prepare modules_prepare bzImage modules
> 	make HOSTCC=gcc-11 CC=gcc-11 ARCH=x86_64 INSTALL_MOD_PATH=<mod-install-dir> modules_install
> 	cd <mod-install-dir>
> 	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
> 
> 
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script is attached in this email
> 
>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
> 
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/x86_64 6.3.0-rc1 Kernel Configuration
> #
> CONFIG_CC_VERSION_TEXT="gcc-11 (Debian 11.3.0-12) 11.3.0"
> CONFIG_CC_IS_GCC=y
> CONFIG_GCC_VERSION=110300
> CONFIG_CLANG_VERSION=0
> CONFIG_AS_IS_GNU=y
> CONFIG_AS_VERSION=24000
> CONFIG_LD_IS_BFD=y
> CONFIG_LD_VERSION=24000
> CONFIG_LLD_VERSION=0
> CONFIG_CC_CAN_LINK=y
> CONFIG_CC_CAN_LINK_STATIC=y
> CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
> CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y
> CONFIG_CC_HAS_ASM_INLINE=y
> CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
> CONFIG_PAHOLE_VERSION=125
> CONFIG_CONSTRUCTORS=y
> CONFIG_IRQ_WORK=y
> CONFIG_BUILDTIME_TABLE_SORT=y
> CONFIG_THREAD_INFO_IN_TASK=y
> 
> #
> # General setup
> #
> CONFIG_BROKEN_ON_SMP=y
> CONFIG_INIT_ENV_ARG_LIMIT=32
> # CONFIG_COMPILE_TEST is not set
> # CONFIG_WERROR is not set
> # CONFIG_UAPI_HEADER_TEST is not set
> CONFIG_LOCALVERSION=""
> CONFIG_LOCALVERSION_AUTO=y
> CONFIG_BUILD_SALT=""
> CONFIG_HAVE_KERNEL_GZIP=y
> CONFIG_HAVE_KERNEL_BZIP2=y
> CONFIG_HAVE_KERNEL_LZMA=y
> CONFIG_HAVE_KERNEL_XZ=y
> CONFIG_HAVE_KERNEL_LZO=y
> CONFIG_HAVE_KERNEL_LZ4=y
> CONFIG_HAVE_KERNEL_ZSTD=y
> # CONFIG_KERNEL_GZIP is not set
> # CONFIG_KERNEL_BZIP2 is not set
> # CONFIG_KERNEL_LZMA is not set
> # CONFIG_KERNEL_XZ is not set
> # CONFIG_KERNEL_LZO is not set
> CONFIG_KERNEL_LZ4=y
> # CONFIG_KERNEL_ZSTD is not set
> CONFIG_DEFAULT_INIT=""
> CONFIG_DEFAULT_HOSTNAME="(none)"
> CONFIG_SYSVIPC=y
> CONFIG_SYSVIPC_SYSCTL=y
> CONFIG_SYSVIPC_COMPAT=y
> # CONFIG_POSIX_MQUEUE is not set
> # CONFIG_WATCH_QUEUE is not set
> # CONFIG_CROSS_MEMORY_ATTACH is not set
> # CONFIG_USELIB is not set
> # CONFIG_AUDIT is not set
> CONFIG_HAVE_ARCH_AUDITSYSCALL=y
> 
> #
> # IRQ subsystem
> #
> CONFIG_GENERIC_IRQ_PROBE=y
> CONFIG_GENERIC_IRQ_SHOW=y
> CONFIG_GENERIC_IRQ_INJECTION=y
> CONFIG_HARDIRQS_SW_RESEND=y
> CONFIG_IRQ_DOMAIN=y
> CONFIG_IRQ_SIM=y
> CONFIG_IRQ_DOMAIN_HIERARCHY=y
> CONFIG_GENERIC_MSI_IRQ=y
> CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
> CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
> CONFIG_IRQ_FORCED_THREADING=y
> CONFIG_SPARSE_IRQ=y
> CONFIG_GENERIC_IRQ_DEBUGFS=y
> # end of IRQ subsystem
> 
> CONFIG_CLOCKSOURCE_WATCHDOG=y
> CONFIG_ARCH_CLOCKSOURCE_INIT=y
> CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
> CONFIG_GENERIC_TIME_VSYSCALL=y
> CONFIG_GENERIC_CLOCKEVENTS=y
> CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
> CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
> CONFIG_GENERIC_CMOS_UPDATE=y
> CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=y
> CONFIG_POSIX_CPU_TIMERS_TASK_WORK=y
> 
> #
> # Timers subsystem
> #
> CONFIG_TICK_ONESHOT=y
> CONFIG_NO_HZ_COMMON=y
> # CONFIG_HZ_PERIODIC is not set
> CONFIG_NO_HZ_IDLE=y
> CONFIG_NO_HZ=y
> # CONFIG_HIGH_RES_TIMERS is not set
> CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=125
> # end of Timers subsystem
> 
> CONFIG_BPF=y
> CONFIG_HAVE_EBPF_JIT=y
> CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y
> 
> #
> # BPF subsystem
> #
> # CONFIG_BPF_SYSCALL is not set
> # CONFIG_BPF_JIT is not set
> # end of BPF subsystem
> 
> CONFIG_PREEMPT_VOLUNTARY_BUILD=y
> # CONFIG_PREEMPT_NONE is not set
> CONFIG_PREEMPT_VOLUNTARY=y
> # CONFIG_PREEMPT is not set
> CONFIG_PREEMPT_COUNT=y
> # CONFIG_PREEMPT_DYNAMIC is not set
> 
> #
> # CPU/Task time and stats accounting
> #
> CONFIG_TICK_CPU_ACCOUNTING=y
> # CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
> CONFIG_IRQ_TIME_ACCOUNTING=y
> CONFIG_BSD_PROCESS_ACCT=y
> CONFIG_BSD_PROCESS_ACCT_V3=y
> # CONFIG_TASKSTATS is not set
> CONFIG_PSI=y
> CONFIG_PSI_DEFAULT_DISABLED=y
> # end of CPU/Task time and stats accounting
> 
> #
> # RCU Subsystem
> #
> CONFIG_TINY_RCU=y
> # CONFIG_RCU_EXPERT is not set
> CONFIG_SRCU=y
> CONFIG_TINY_SRCU=y
> CONFIG_TASKS_RCU_GENERIC=y
> CONFIG_TASKS_RUDE_RCU=y
> CONFIG_RCU_NEED_SEGCBLIST=y
> # end of RCU Subsystem
> 
> CONFIG_IKCONFIG=y
> CONFIG_IKCONFIG_PROC=y
> CONFIG_IKHEADERS=m
> CONFIG_LOG_BUF_SHIFT=20
> CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
> # CONFIG_PRINTK_INDEX is not set
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y
> 
> #
> # Scheduler features
> #
> # end of Scheduler features
> 
> CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
> CONFIG_CC_HAS_INT128=y
> CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
> CONFIG_GCC11_NO_ARRAY_BOUNDS=y
> CONFIG_GCC12_NO_ARRAY_BOUNDS=y
> CONFIG_CC_NO_ARRAY_BOUNDS=y
> CONFIG_ARCH_SUPPORTS_INT128=y
> CONFIG_CGROUPS=y
> # CONFIG_CGROUP_FAVOR_DYNMODS is not set
> # CONFIG_MEMCG is not set
> # CONFIG_CGROUP_SCHED is not set
> # CONFIG_CGROUP_PIDS is not set
> # CONFIG_CGROUP_RDMA is not set
> # CONFIG_CGROUP_FREEZER is not set
> # CONFIG_CGROUP_DEVICE is not set
> # CONFIG_CGROUP_CPUACCT is not set
> # CONFIG_CGROUP_PERF is not set
> # CONFIG_CGROUP_MISC is not set
> # CONFIG_CGROUP_DEBUG is not set
> CONFIG_NAMESPACES=y
> CONFIG_UTS_NS=y
> CONFIG_TIME_NS=y
> # CONFIG_IPC_NS is not set
> CONFIG_USER_NS=y
> CONFIG_PID_NS=y
> CONFIG_NET_NS=y
> # CONFIG_CHECKPOINT_RESTORE is not set
> # CONFIG_SCHED_AUTOGROUP is not set
> # CONFIG_SYSFS_DEPRECATED is not set
> CONFIG_RELAY=y
> CONFIG_BLK_DEV_INITRD=y
> CONFIG_INITRAMFS_SOURCE=""
> CONFIG_RD_GZIP=y
> CONFIG_RD_BZIP2=y
> CONFIG_RD_LZMA=y
> CONFIG_RD_XZ=y
> CONFIG_RD_LZO=y
> CONFIG_RD_LZ4=y
> CONFIG_RD_ZSTD=y
> # CONFIG_BOOT_CONFIG is not set
> CONFIG_INITRAMFS_PRESERVE_MTIME=y
> # CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
> CONFIG_CC_OPTIMIZE_FOR_SIZE=y
> CONFIG_LD_ORPHAN_WARN=y
> CONFIG_LD_ORPHAN_WARN_LEVEL="warn"
> CONFIG_SYSCTL=y
> CONFIG_HAVE_UID16=y
> CONFIG_SYSCTL_EXCEPTION_TRACE=y
> CONFIG_HAVE_PCSPKR_PLATFORM=y
> CONFIG_EXPERT=y
> CONFIG_UID16=y
> CONFIG_MULTIUSER=y
> # CONFIG_SGETMASK_SYSCALL is not set
> CONFIG_SYSFS_SYSCALL=y
> CONFIG_FHANDLE=y
> CONFIG_POSIX_TIMERS=y
> CONFIG_PRINTK=y
> CONFIG_BUG=y
> CONFIG_PCSPKR_PLATFORM=y
> CONFIG_BASE_FULL=y
> CONFIG_FUTEX=y
> CONFIG_FUTEX_PI=y
> CONFIG_EPOLL=y
> CONFIG_SIGNALFD=y
> CONFIG_TIMERFD=y
> # CONFIG_EVENTFD is not set
> CONFIG_SHMEM=y
> # CONFIG_AIO is not set
> # CONFIG_IO_URING is not set
> # CONFIG_ADVISE_SYSCALLS is not set
> CONFIG_MEMBARRIER=y
> CONFIG_KALLSYMS=y
> # CONFIG_KALLSYMS_SELFTEST is not set
> CONFIG_KALLSYMS_ALL=y
> CONFIG_KALLSYMS_BASE_RELATIVE=y
> CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
> CONFIG_KCMP=y
> # CONFIG_RSEQ is not set
> CONFIG_EMBEDDED=y
> CONFIG_HAVE_PERF_EVENTS=y
> # CONFIG_PC104 is not set
> 
> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=y
> # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> # end of Kernel Performance Events And Counters
> 
> # CONFIG_PROFILING is not set
> CONFIG_TRACEPOINTS=y
> # end of General setup
> 
> CONFIG_64BIT=y
> CONFIG_X86_64=y
> CONFIG_X86=y
> CONFIG_INSTRUCTION_DECODER=y
> CONFIG_OUTPUT_FORMAT="elf64-x86-64"
> CONFIG_LOCKDEP_SUPPORT=y
> CONFIG_STACKTRACE_SUPPORT=y
> CONFIG_MMU=y
> CONFIG_ARCH_MMAP_RND_BITS_MIN=28
> CONFIG_ARCH_MMAP_RND_BITS_MAX=32
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
> CONFIG_GENERIC_ISA_DMA=y
> CONFIG_GENERIC_CSUM=y
> CONFIG_GENERIC_BUG=y
> CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
> CONFIG_ARCH_MAY_HAVE_PC_FDC=y
> CONFIG_GENERIC_CALIBRATE_DELAY=y
> CONFIG_ARCH_HAS_CPU_RELAX=y
> CONFIG_ARCH_HIBERNATION_POSSIBLE=y
> CONFIG_ARCH_SUSPEND_POSSIBLE=y
> CONFIG_AUDIT_ARCH=y
> CONFIG_KASAN_SHADOW_OFFSET=0xdffffc0000000000
> CONFIG_ARCH_SUPPORTS_UPROBES=y
> CONFIG_FIX_EARLYCON_MEM=y
> CONFIG_PGTABLE_LEVELS=5
> CONFIG_CC_HAS_SANE_STACKPROTECTOR=y
> 
> #
> # Processor type and features
> #
> # CONFIG_SMP is not set
> CONFIG_X86_FEATURE_NAMES=y
> # CONFIG_X86_X2APIC is not set
> CONFIG_X86_MPPARSE=y
> # CONFIG_GOLDFISH is not set
> CONFIG_X86_CPU_RESCTRL=y
> # CONFIG_X86_EXTENDED_PLATFORM is not set
> # CONFIG_X86_INTEL_LPSS is not set
> # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> CONFIG_IOSF_MBI=y
> # CONFIG_IOSF_MBI_DEBUG is not set
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_HYPERVISOR_GUEST=y
> CONFIG_PARAVIRT=y
> # CONFIG_PARAVIRT_DEBUG is not set
> CONFIG_X86_HV_CALLBACK_VECTOR=y
> # CONFIG_XEN is not set
> CONFIG_KVM_GUEST=y
> CONFIG_ARCH_CPUIDLE_HALTPOLL=y
> # CONFIG_PVH is not set
> # CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
> CONFIG_PARAVIRT_CLOCK=y
> # CONFIG_JAILHOUSE_GUEST is not set
> # CONFIG_ACRN_GUEST is not set
> # CONFIG_MK8 is not set
> # CONFIG_MPSC is not set
> # CONFIG_MCORE2 is not set
> # CONFIG_MATOM is not set
> CONFIG_GENERIC_CPU=y
> CONFIG_X86_INTERNODE_CACHE_SHIFT=6
> CONFIG_X86_L1_CACHE_SHIFT=6
> CONFIG_X86_TSC=y
> CONFIG_X86_CMPXCHG64=y
> CONFIG_X86_CMOV=y
> CONFIG_X86_MINIMUM_CPU_FAMILY=64
> CONFIG_X86_DEBUGCTLMSR=y
> CONFIG_IA32_FEAT_CTL=y
> CONFIG_X86_VMX_FEATURE_NAMES=y
> CONFIG_PROCESSOR_SELECT=y
> CONFIG_CPU_SUP_INTEL=y
> # CONFIG_CPU_SUP_AMD is not set
> # CONFIG_CPU_SUP_HYGON is not set
> # CONFIG_CPU_SUP_CENTAUR is not set
> # CONFIG_CPU_SUP_ZHAOXIN is not set
> CONFIG_HPET_TIMER=y
> # CONFIG_DMI is not set
> CONFIG_BOOT_VESA_SUPPORT=y
> CONFIG_NR_CPUS_RANGE_BEGIN=1
> CONFIG_NR_CPUS_RANGE_END=1
> CONFIG_NR_CPUS_DEFAULT=1
> CONFIG_NR_CPUS=1
> CONFIG_UP_LATE_INIT=y
> CONFIG_X86_LOCAL_APIC=y
> CONFIG_X86_IO_APIC=y
> CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
> # CONFIG_X86_MCE is not set
> 
> #
> # Performance monitoring
> #
> CONFIG_PERF_EVENTS_INTEL_UNCORE=m
> CONFIG_PERF_EVENTS_INTEL_RAPL=m
> # CONFIG_PERF_EVENTS_INTEL_CSTATE is not set
> # end of Performance monitoring
> 
> # CONFIG_X86_16BIT is not set
> CONFIG_X86_VSYSCALL_EMULATION=y
> CONFIG_X86_IOPL_IOPERM=y
> # CONFIG_MICROCODE is not set
> CONFIG_X86_MSR=y
> # CONFIG_X86_CPUID is not set
> CONFIG_X86_5LEVEL=y
> CONFIG_X86_DIRECT_GBPAGES=y
> # CONFIG_X86_CPA_STATISTICS is not set
> CONFIG_ARCH_SPARSEMEM_ENABLE=y
> CONFIG_ARCH_SPARSEMEM_DEFAULT=y
> CONFIG_ARCH_MEMORY_PROBE=y
> CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
> CONFIG_X86_CHECK_BIOS_CORRUPTION=y
> CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK=y
> # CONFIG_MTRR is not set
> # CONFIG_X86_UMIP is not set
> CONFIG_CC_HAS_IBT=y
> CONFIG_X86_KERNEL_IBT=y
> # CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS is not set
> CONFIG_X86_INTEL_TSX_MODE_OFF=y
> # CONFIG_X86_INTEL_TSX_MODE_ON is not set
> # CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
> # CONFIG_EFI is not set
> # CONFIG_HZ_100 is not set
> CONFIG_HZ_250=y
> # CONFIG_HZ_300 is not set
> # CONFIG_HZ_1000 is not set
> CONFIG_HZ=250
> # CONFIG_KEXEC is not set
> # CONFIG_KEXEC_FILE is not set
> CONFIG_CRASH_DUMP=y
> CONFIG_PHYSICAL_START=0x1000000
> # CONFIG_RELOCATABLE is not set
> CONFIG_PHYSICAL_ALIGN=0x200000
> CONFIG_DYNAMIC_MEMORY_LAYOUT=y
> # CONFIG_COMPAT_VDSO is not set
> CONFIG_LEGACY_VSYSCALL_XONLY=y
> # CONFIG_LEGACY_VSYSCALL_NONE is not set
> # CONFIG_CMDLINE_BOOL is not set
> CONFIG_MODIFY_LDT_SYSCALL=y
> # CONFIG_STRICT_SIGALTSTACK_SIZE is not set
> CONFIG_HAVE_LIVEPATCH=y
> # end of Processor type and features
> 
> CONFIG_CC_HAS_SLS=y
> CONFIG_CC_HAS_RETURN_THUNK=y
> CONFIG_CC_HAS_ENTRY_PADDING=y
> CONFIG_FUNCTION_PADDING_CFI=11
> CONFIG_FUNCTION_PADDING_BYTES=16
> # CONFIG_SPECULATION_MITIGATIONS is not set
> CONFIG_ARCH_HAS_ADD_PAGES=y
> CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y
> 
> #
> # Power management and ACPI options
> #
> # CONFIG_SUSPEND is not set
> # CONFIG_PM is not set
> CONFIG_ARCH_SUPPORTS_ACPI=y
> CONFIG_ACPI=y
> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
> CONFIG_ACPI_TABLE_LIB=y
> # CONFIG_ACPI_DEBUGGER is not set
> CONFIG_ACPI_SPCR_TABLE=y
> # CONFIG_ACPI_FPDT is not set
> CONFIG_ACPI_LPIT=y
> CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
> # CONFIG_ACPI_EC_DEBUGFS is not set
> CONFIG_ACPI_AC=y
> CONFIG_ACPI_BATTERY=y
> CONFIG_ACPI_BUTTON=y
> CONFIG_ACPI_VIDEO=m
> CONFIG_ACPI_FAN=y
> # CONFIG_ACPI_DOCK is not set
> CONFIG_ACPI_CPU_FREQ_PSS=y
> CONFIG_ACPI_PROCESSOR_CSTATE=y
> CONFIG_ACPI_PROCESSOR_IDLE=y
> CONFIG_ACPI_PROCESSOR=y
> # CONFIG_ACPI_IPMI is not set
> # CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
> CONFIG_ACPI_THERMAL=y
> CONFIG_ACPI_PLATFORM_PROFILE=m
> CONFIG_ACPI_CUSTOM_DSDT_FILE=""
> CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
> CONFIG_ACPI_TABLE_UPGRADE=y
> # CONFIG_ACPI_DEBUG is not set
> # CONFIG_ACPI_PCI_SLOT is not set
> # CONFIG_ACPI_CONTAINER is not set
> # CONFIG_ACPI_HOTPLUG_MEMORY is not set
> CONFIG_ACPI_HOTPLUG_IOAPIC=y
> # CONFIG_ACPI_SBS is not set
> # CONFIG_ACPI_HED is not set
> # CONFIG_ACPI_CUSTOM_METHOD is not set
> # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
> CONFIG_HAVE_ACPI_APEI=y
> CONFIG_HAVE_ACPI_APEI_NMI=y
> # CONFIG_ACPI_APEI is not set
> # CONFIG_ACPI_DPTF is not set
> # CONFIG_ACPI_CONFIGFS is not set
> # CONFIG_ACPI_PFRUT is not set
> # CONFIG_ACPI_FFH is not set
> # CONFIG_PMIC_OPREGION is not set
> CONFIG_X86_PM_TIMER=y
> 
> #
> # CPU Frequency scaling
> #
> CONFIG_CPU_FREQ=y
> CONFIG_CPU_FREQ_GOV_ATTR_SET=y
> CONFIG_CPU_FREQ_GOV_COMMON=y
> # CONFIG_CPU_FREQ_STAT is not set
> CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
> # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
> CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
> CONFIG_CPU_FREQ_GOV_POWERSAVE=m
> CONFIG_CPU_FREQ_GOV_USERSPACE=m
> CONFIG_CPU_FREQ_GOV_ONDEMAND=m
> CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
> 
> #
> # CPU frequency scaling drivers
> #
> CONFIG_CPUFREQ_DT=m
> CONFIG_CPUFREQ_DT_PLATDEV=y
> CONFIG_X86_INTEL_PSTATE=y
> # CONFIG_X86_PCC_CPUFREQ is not set
> # CONFIG_X86_AMD_PSTATE is not set
> # CONFIG_X86_AMD_PSTATE_UT is not set
> # CONFIG_X86_ACPI_CPUFREQ is not set
> # CONFIG_X86_SPEEDSTEP_CENTRINO is not set
> CONFIG_X86_P4_CLOCKMOD=y
> 
> #
> # shared options
> #
> CONFIG_X86_SPEEDSTEP_LIB=y
> # end of CPU Frequency scaling
> 
> #
> # CPU Idle
> #
> CONFIG_CPU_IDLE=y
> # CONFIG_CPU_IDLE_GOV_LADDER is not set
> CONFIG_CPU_IDLE_GOV_MENU=y
> # CONFIG_CPU_IDLE_GOV_TEO is not set
> CONFIG_CPU_IDLE_GOV_HALTPOLL=y
> CONFIG_HALTPOLL_CPUIDLE=y
> # end of CPU Idle
> 
> # CONFIG_INTEL_IDLE is not set
> # end of Power management and ACPI options
> 
> #
> # Bus options (PCI etc.)
> #
> CONFIG_PCI_DIRECT=y
> CONFIG_PCI_MMCONFIG=y
> CONFIG_MMCONF_FAM10H=y
> CONFIG_PCI_CNB20LE_QUIRK=y
> CONFIG_ISA_BUS=y
> CONFIG_ISA_DMA_API=y
> # end of Bus options (PCI etc.)
> 
> #
> # Binary Emulations
> #
> CONFIG_IA32_EMULATION=y
> CONFIG_X86_X32_ABI=y
> CONFIG_COMPAT_32=y
> CONFIG_COMPAT=y
> CONFIG_COMPAT_FOR_U64_ALIGNMENT=y
> # end of Binary Emulations
> 
> CONFIG_HAVE_KVM=y
> # CONFIG_VIRTUALIZATION is not set
> CONFIG_AS_AVX512=y
> CONFIG_AS_SHA1_NI=y
> CONFIG_AS_SHA256_NI=y
> CONFIG_AS_TPAUSE=y
> CONFIG_AS_GFNI=y
> 
> #
> # General architecture-dependent options
> #
> CONFIG_GENERIC_ENTRY=y
> CONFIG_KPROBES=y
> # CONFIG_JUMP_LABEL is not set
> # CONFIG_STATIC_CALL_SELFTEST is not set
> CONFIG_OPTPROBES=y
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
> CONFIG_ARCH_USE_BUILTIN_BSWAP=y
> CONFIG_KRETPROBES=y
> CONFIG_KRETPROBE_ON_RETHOOK=y
> CONFIG_HAVE_IOREMAP_PROT=y
> CONFIG_HAVE_KPROBES=y
> CONFIG_HAVE_KRETPROBES=y
> CONFIG_HAVE_OPTPROBES=y
> CONFIG_HAVE_KPROBES_ON_FTRACE=y
> CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=y
> CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
> CONFIG_HAVE_NMI=y
> CONFIG_TRACE_IRQFLAGS_SUPPORT=y
> CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=y
> CONFIG_HAVE_ARCH_TRACEHOOK=y
> CONFIG_HAVE_DMA_CONTIGUOUS=y
> CONFIG_GENERIC_SMP_IDLE_THREAD=y
> CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
> CONFIG_ARCH_HAS_SET_MEMORY=y
> CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
> CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
> CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
> CONFIG_ARCH_WANTS_NO_INSTR=y
> CONFIG_HAVE_ASM_MODVERSIONS=y
> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
> CONFIG_HAVE_RSEQ=y
> CONFIG_HAVE_RUST=y
> CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
> CONFIG_HAVE_HW_BREAKPOINT=y
> CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
> CONFIG_HAVE_USER_RETURN_NOTIFIER=y
> CONFIG_HAVE_PERF_EVENTS_NMI=y
> CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
> CONFIG_HAVE_PERF_REGS=y
> CONFIG_HAVE_PERF_USER_STACK_DUMP=y
> CONFIG_HAVE_ARCH_JUMP_LABEL=y
> CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
> CONFIG_MMU_GATHER_TABLE_FREE=y
> CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
> CONFIG_MMU_GATHER_MERGE_VMAS=y
> CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
> CONFIG_ARCH_HAS_NMI_SAFE_THIS_CPU_OPS=y
> CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
> CONFIG_HAVE_CMPXCHG_LOCAL=y
> CONFIG_HAVE_CMPXCHG_DOUBLE=y
> CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=y
> CONFIG_ARCH_WANT_OLD_COMPAT_IPC=y
> CONFIG_HAVE_ARCH_SECCOMP=y
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
> # CONFIG_SECCOMP is not set
> CONFIG_HAVE_ARCH_STACKLEAK=y
> CONFIG_HAVE_STACKPROTECTOR=y
> CONFIG_STACKPROTECTOR=y
> # CONFIG_STACKPROTECTOR_STRONG is not set
> CONFIG_ARCH_SUPPORTS_LTO_CLANG=y
> CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=y
> CONFIG_LTO_NONE=y
> CONFIG_ARCH_SUPPORTS_CFI_CLANG=y
> CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
> CONFIG_HAVE_CONTEXT_TRACKING_USER=y
> CONFIG_HAVE_CONTEXT_TRACKING_USER_OFFSTACK=y
> CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
> CONFIG_HAVE_MOVE_PUD=y
> CONFIG_HAVE_MOVE_PMD=y
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=y
> CONFIG_HAVE_ARCH_HUGE_VMAP=y
> CONFIG_HAVE_ARCH_HUGE_VMALLOC=y
> CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
> CONFIG_HAVE_ARCH_SOFT_DIRTY=y
> CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
> CONFIG_MODULES_USE_ELF_RELA=y
> CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
> CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
> CONFIG_SOFTIRQ_ON_OWN_STACK=y
> CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
> CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
> CONFIG_HAVE_EXIT_THREAD=y
> CONFIG_ARCH_MMAP_RND_BITS=28
> CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=y
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS=8
> CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES=y
> CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
> CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
> CONFIG_HAVE_OBJTOOL=y
> CONFIG_HAVE_JUMP_LABEL_HACK=y
> CONFIG_HAVE_NOINSTR_HACK=y
> CONFIG_HAVE_NOINSTR_VALIDATION=y
> CONFIG_HAVE_UACCESS_VALIDATION=y
> CONFIG_HAVE_STACK_VALIDATION=y
> CONFIG_HAVE_RELIABLE_STACKTRACE=y
> CONFIG_ISA_BUS_API=y
> CONFIG_OLD_SIGSUSPEND3=y
> CONFIG_COMPAT_OLD_SIGACTION=y
> CONFIG_COMPAT_32BIT_TIME=y
> CONFIG_HAVE_ARCH_VMAP_STACK=y
> CONFIG_VMAP_STACK=y
> CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
> # CONFIG_RANDOMIZE_KSTACK_OFFSET is not set
> CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
> CONFIG_STRICT_KERNEL_RWX=y
> CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
> CONFIG_STRICT_MODULE_RWX=y
> CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
> # CONFIG_LOCK_EVENT_COUNTS is not set
> CONFIG_ARCH_HAS_MEM_ENCRYPT=y
> CONFIG_HAVE_STATIC_CALL=y
> CONFIG_HAVE_STATIC_CALL_INLINE=y
> CONFIG_HAVE_PREEMPT_DYNAMIC=y
> CONFIG_HAVE_PREEMPT_DYNAMIC_CALL=y
> CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
> CONFIG_ARCH_SUPPORTS_PAGE_TABLE_CHECK=y
> CONFIG_ARCH_HAS_ELFCORE_COMPAT=y
> CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=y
> CONFIG_DYNAMIC_SIGFRAME=y
> CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG=y
> 
> #
> # GCOV-based kernel profiling
> #
> # CONFIG_GCOV_KERNEL is not set
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
> # end of GCOV-based kernel profiling
> 
> CONFIG_HAVE_GCC_PLUGINS=y
> # CONFIG_GCC_PLUGINS is not set
> CONFIG_FUNCTION_ALIGNMENT_4B=y
> CONFIG_FUNCTION_ALIGNMENT_16B=y
> CONFIG_FUNCTION_ALIGNMENT=16
> # end of General architecture-dependent options
> 
> CONFIG_RT_MUTEXES=y
> CONFIG_BASE_SMALL=0
> CONFIG_MODULES=y
> CONFIG_MODULE_DEBUG=y
> # CONFIG_MODULE_STATS is not set
> CONFIG_MODULE_DEBUG_AUTOLOAD_DUPS=y
> CONFIG_MODULE_DEBUG_AUTOLOAD_DUPS_TRACE=y
> # CONFIG_MODULE_FORCE_LOAD is not set
> # CONFIG_MODULE_UNLOAD is not set
> # CONFIG_MODVERSIONS is not set
> # CONFIG_MODULE_SRCVERSION_ALL is not set
> # CONFIG_MODULE_SIG is not set
> CONFIG_MODULE_COMPRESS_NONE=y
> # CONFIG_MODULE_COMPRESS_GZIP is not set
> # CONFIG_MODULE_COMPRESS_XZ is not set
> # CONFIG_MODULE_COMPRESS_ZSTD is not set
> # CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
> CONFIG_MODPROBE_PATH="/sbin/modprobe"
> # CONFIG_TRIM_UNUSED_KSYMS is not set
> CONFIG_MODULES_TREE_LOOKUP=y
> # CONFIG_BLOCK is not set
> CONFIG_ASN1=y
> CONFIG_UNINLINE_SPIN_UNLOCK=y
> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
> CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
> CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
> CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
> CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=y
> CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y
> 
> #
> # Executable file formats
> #
> CONFIG_BINFMT_ELF=y
> CONFIG_COMPAT_BINFMT_ELF=y
> CONFIG_ELFCORE=y
> CONFIG_BINFMT_SCRIPT=y
> # CONFIG_BINFMT_MISC is not set
> # CONFIG_COREDUMP is not set
> # end of Executable file formats
> 
> #
> # Memory Management options
> #
> 
> #
> # SLAB allocator options
> #
> # CONFIG_SLAB is not set
> CONFIG_SLUB=y
> # CONFIG_SLOB_DEPRECATED is not set
> # CONFIG_SLUB_TINY is not set
> CONFIG_SLAB_MERGE_DEFAULT=y
> # CONFIG_SLAB_FREELIST_RANDOM is not set
> CONFIG_SLAB_FREELIST_HARDENED=y
> # CONFIG_SLUB_STATS is not set
> # end of SLAB allocator options
> 
> CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
> # CONFIG_COMPAT_BRK is not set
> CONFIG_SPARSEMEM=y
> CONFIG_SPARSEMEM_EXTREME=y
> CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
> CONFIG_SPARSEMEM_VMEMMAP=y
> CONFIG_HAVE_FAST_GUP=y
> CONFIG_MEMORY_ISOLATION=y
> CONFIG_EXCLUSIVE_SYSTEM_RAM=y
> CONFIG_HAVE_BOOTMEM_INFO_NODE=y
> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
> CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
> CONFIG_MEMORY_HOTPLUG=y
> CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE=y
> CONFIG_MEMORY_HOTREMOVE=y
> CONFIG_MHP_MEMMAP_ON_MEMORY=y
> CONFIG_SPLIT_PTLOCK_CPUS=4
> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
> CONFIG_COMPACTION=y
> CONFIG_COMPACT_UNEVICTABLE_DEFAULT=1
> CONFIG_PAGE_REPORTING=y
> CONFIG_MIGRATION=y
> CONFIG_DEVICE_MIGRATION=y
> CONFIG_ARCH_ENABLE_THP_MIGRATION=y
> CONFIG_CONTIG_ALLOC=y
> CONFIG_PHYS_ADDR_T_64BIT=y
> # CONFIG_KSM is not set
> CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
> CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
> CONFIG_ARCH_WANTS_THP_SWAP=y
> CONFIG_TRANSPARENT_HUGEPAGE=y
> # CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS is not set
> CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=y
> # CONFIG_READ_ONLY_THP_FOR_FS is not set
> CONFIG_NEED_PER_CPU_KM=y
> CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
> CONFIG_HAVE_SETUP_PER_CPU_AREA=y
> CONFIG_CMA=y
> CONFIG_CMA_DEBUG=y
> CONFIG_CMA_DEBUGFS=y
> # CONFIG_CMA_SYSFS is not set
> CONFIG_CMA_AREAS=7
> CONFIG_GENERIC_EARLY_IOREMAP=y
> # CONFIG_IDLE_PAGE_TRACKING is not set
> CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
> CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
> CONFIG_ARCH_HAS_PTE_DEVMAP=y
> CONFIG_ARCH_HAS_ZONE_DMA_SET=y
> CONFIG_ZONE_DMA=y
> CONFIG_ZONE_DMA32=y
> CONFIG_ZONE_DEVICE=y
> CONFIG_GET_FREE_REGION=y
> CONFIG_DEVICE_PRIVATE=y
> # CONFIG_VM_EVENT_COUNTERS is not set
> # CONFIG_PERCPU_STATS is not set
> # CONFIG_GUP_TEST is not set
> CONFIG_ARCH_HAS_PTE_SPECIAL=y
> CONFIG_MAPPING_DIRTY_HELPERS=y
> CONFIG_KMAP_LOCAL=y
> # CONFIG_SECRETMEM is not set
> CONFIG_USERFAULTFD=y
> CONFIG_HAVE_ARCH_USERFAULTFD_WP=y
> CONFIG_HAVE_ARCH_USERFAULTFD_MINOR=y
> CONFIG_PTE_MARKER_UFFD_WP=y
> # CONFIG_LRU_GEN is not set
> 
> #
> # Data Access Monitoring
> #
> # CONFIG_DAMON is not set
> # end of Data Access Monitoring
> # end of Memory Management options
> 
> CONFIG_NET=y
> 
> #
> # Networking options
> #
> CONFIG_PACKET=y
> # CONFIG_PACKET_DIAG is not set
> CONFIG_UNIX=y
> CONFIG_UNIX_SCM=y
> CONFIG_AF_UNIX_OOB=y
> # CONFIG_UNIX_DIAG is not set
> # CONFIG_TLS is not set
> # CONFIG_XFRM_USER is not set
> # CONFIG_NET_KEY is not set
> CONFIG_INET=y
> # CONFIG_IP_MULTICAST is not set
> # CONFIG_IP_ADVANCED_ROUTER is not set
> CONFIG_IP_PNP=y
> CONFIG_IP_PNP_DHCP=y
> # CONFIG_IP_PNP_BOOTP is not set
> # CONFIG_IP_PNP_RARP is not set
> # CONFIG_NET_IPIP is not set
> # CONFIG_NET_IPGRE_DEMUX is not set
> CONFIG_NET_IP_TUNNEL=y
> # CONFIG_SYN_COOKIES is not set
> # CONFIG_NET_IPVTI is not set
> # CONFIG_NET_FOU is not set
> # CONFIG_NET_FOU_IP_TUNNELS is not set
> # CONFIG_INET_AH is not set
> # CONFIG_INET_ESP is not set
> # CONFIG_INET_IPCOMP is not set
> CONFIG_INET_TABLE_PERTURB_ORDER=16
> CONFIG_INET_TUNNEL=y
> CONFIG_INET_DIAG=y
> CONFIG_INET_TCP_DIAG=y
> # CONFIG_INET_UDP_DIAG is not set
> # CONFIG_INET_RAW_DIAG is not set
> # CONFIG_INET_DIAG_DESTROY is not set
> # CONFIG_TCP_CONG_ADVANCED is not set
> CONFIG_TCP_CONG_CUBIC=y
> CONFIG_DEFAULT_TCP_CONG="cubic"
> # CONFIG_TCP_MD5SIG is not set
> CONFIG_IPV6=y
> # CONFIG_IPV6_ROUTER_PREF is not set
> # CONFIG_IPV6_OPTIMISTIC_DAD is not set
> # CONFIG_INET6_AH is not set
> # CONFIG_INET6_ESP is not set
> # CONFIG_INET6_IPCOMP is not set
> # CONFIG_IPV6_MIP6 is not set
> # CONFIG_IPV6_VTI is not set
> CONFIG_IPV6_SIT=y
> # CONFIG_IPV6_SIT_6RD is not set
> CONFIG_IPV6_NDISC_NODETYPE=y
> # CONFIG_IPV6_TUNNEL is not set
> # CONFIG_IPV6_MULTIPLE_TABLES is not set
> # CONFIG_IPV6_MROUTE is not set
> # CONFIG_IPV6_SEG6_LWTUNNEL is not set
> # CONFIG_IPV6_SEG6_HMAC is not set
> # CONFIG_IPV6_RPL_LWTUNNEL is not set
> # CONFIG_IPV6_IOAM6_LWTUNNEL is not set
> # CONFIG_NETLABEL is not set
> # CONFIG_MPTCP is not set
> # CONFIG_NETWORK_SECMARK is not set
> CONFIG_NET_PTP_CLASSIFY=y
> # CONFIG_NETWORK_PHY_TIMESTAMPING is not set
> # CONFIG_NETFILTER is not set
> # CONFIG_BPFILTER is not set
> # CONFIG_IP_DCCP is not set
> # CONFIG_IP_SCTP is not set
> # CONFIG_RDS is not set
> # CONFIG_TIPC is not set
> # CONFIG_ATM is not set
> # CONFIG_L2TP is not set
> # CONFIG_BRIDGE is not set
> # CONFIG_NET_DSA is not set
> # CONFIG_VLAN_8021Q is not set
> # CONFIG_LLC2 is not set
> # CONFIG_ATALK is not set
> # CONFIG_X25 is not set
> # CONFIG_LAPB is not set
> # CONFIG_PHONET is not set
> # CONFIG_6LOWPAN is not set
> # CONFIG_IEEE802154 is not set
> # CONFIG_NET_SCHED is not set
> # CONFIG_DCB is not set
> CONFIG_DNS_RESOLVER=m
> # CONFIG_BATMAN_ADV is not set
> # CONFIG_OPENVSWITCH is not set
> # CONFIG_VSOCKETS is not set
> # CONFIG_NETLINK_DIAG is not set
> # CONFIG_MPLS is not set
> # CONFIG_NET_NSH is not set
> # CONFIG_HSR is not set
> # CONFIG_NET_SWITCHDEV is not set
> # CONFIG_NET_L3_MASTER_DEV is not set
> # CONFIG_QRTR is not set
> # CONFIG_NET_NCSI is not set
> # CONFIG_CGROUP_NET_PRIO is not set
> # CONFIG_CGROUP_NET_CLASSID is not set
> CONFIG_NET_RX_BUSY_POLL=y
> CONFIG_BQL=y
> 
> #
> # Network testing
> #
> # CONFIG_NET_PKTGEN is not set
> # CONFIG_NET_DROP_MONITOR is not set
> # end of Network testing
> # end of Networking options
> 
> # CONFIG_HAMRADIO is not set
> # CONFIG_CAN is not set
> # CONFIG_BT is not set
> # CONFIG_AF_RXRPC is not set
> # CONFIG_AF_KCM is not set
> # CONFIG_MCTP is not set
> CONFIG_WIRELESS=y
> # CONFIG_CFG80211 is not set
> 
> #
> # CFG80211 needs to be enabled for MAC80211
> #
> CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
> # CONFIG_RFKILL is not set
> CONFIG_NET_9P=y
> CONFIG_NET_9P_FD=y
> CONFIG_NET_9P_VIRTIO=y
> # CONFIG_NET_9P_DEBUG is not set
> # CONFIG_CAIF is not set
> # CONFIG_CEPH_LIB is not set
> # CONFIG_NFC is not set
> # CONFIG_PSAMPLE is not set
> # CONFIG_NET_IFE is not set
> # CONFIG_LWTUNNEL is not set
> CONFIG_DST_CACHE=y
> CONFIG_GRO_CELLS=y
> CONFIG_FAILOVER=m
> CONFIG_ETHTOOL_NETLINK=y
> 
> #
> # Device Drivers
> #
> CONFIG_HAVE_EISA=y
> # CONFIG_EISA is not set
> CONFIG_HAVE_PCI=y
> CONFIG_PCI=y
> CONFIG_PCI_DOMAINS=y
> CONFIG_PCIEPORTBUS=y
> CONFIG_HOTPLUG_PCI_PCIE=y
> # CONFIG_PCIEAER is not set
> CONFIG_PCIEASPM=y
> # CONFIG_PCIEASPM_DEFAULT is not set
> CONFIG_PCIEASPM_POWERSAVE=y
> # CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
> # CONFIG_PCIEASPM_PERFORMANCE is not set
> CONFIG_PCIE_PTM=y
> CONFIG_PCI_MSI=y
> CONFIG_PCI_QUIRKS=y
> # CONFIG_PCI_DEBUG is not set
> CONFIG_PCI_REALLOC_ENABLE_AUTO=y
> CONFIG_PCI_STUB=y
> CONFIG_PCI_PF_STUB=m
> CONFIG_PCI_ATS=y
> CONFIG_PCI_DOE=y
> CONFIG_PCI_ECAM=y
> CONFIG_PCI_LOCKLESS_CONFIG=y
> CONFIG_PCI_IOV=y
> # CONFIG_PCI_PRI is not set
> # CONFIG_PCI_PASID is not set
> # CONFIG_PCI_P2PDMA is not set
> CONFIG_PCI_LABEL=y
> # CONFIG_PCIE_BUS_TUNE_OFF is not set
> # CONFIG_PCIE_BUS_DEFAULT is not set
> # CONFIG_PCIE_BUS_SAFE is not set
> CONFIG_PCIE_BUS_PERFORMANCE=y
> # CONFIG_PCIE_BUS_PEER2PEER is not set
> # CONFIG_VGA_ARB is not set
> CONFIG_HOTPLUG_PCI=y
> # CONFIG_HOTPLUG_PCI_ACPI is not set
> CONFIG_HOTPLUG_PCI_CPCI=y
> CONFIG_HOTPLUG_PCI_CPCI_ZT5550=y
> # CONFIG_HOTPLUG_PCI_CPCI_GENERIC is not set
> # CONFIG_HOTPLUG_PCI_SHPC is not set
> 
> #
> # PCI controller drivers
> #
> CONFIG_PCI_FTPCI100=y
> CONFIG_PCI_HOST_COMMON=y
> CONFIG_PCI_HOST_GENERIC=y
> CONFIG_PCIE_XILINX=y
> # CONFIG_VMD is not set
> CONFIG_PCIE_MICROCHIP_HOST=y
> 
> #
> # DesignWare PCI Core Support
> #
> CONFIG_PCIE_DW=y
> CONFIG_PCIE_DW_HOST=y
> CONFIG_PCIE_DW_PLAT=y
> CONFIG_PCIE_DW_PLAT_HOST=y
> CONFIG_PCIE_INTEL_GW=y
> CONFIG_PCI_MESON=y
> # end of DesignWare PCI Core Support
> 
> #
> # Mobiveil PCIe Core Support
> #
> # end of Mobiveil PCIe Core Support
> 
> #
> # Cadence PCIe controllers support
> #
> CONFIG_PCIE_CADENCE=y
> CONFIG_PCIE_CADENCE_HOST=y
> CONFIG_PCIE_CADENCE_PLAT=y
> CONFIG_PCIE_CADENCE_PLAT_HOST=y
> CONFIG_PCI_J721E=y
> CONFIG_PCI_J721E_HOST=y
> # end of Cadence PCIe controllers support
> # end of PCI controller drivers
> 
> #
> # PCI Endpoint
> #
> # CONFIG_PCI_ENDPOINT is not set
> # end of PCI Endpoint
> 
> #
> # PCI switch controller drivers
> #
> CONFIG_PCI_SW_SWITCHTEC=m
> # end of PCI switch controller drivers
> 
> CONFIG_CXL_BUS=y
> CONFIG_CXL_PCI=m
> # CONFIG_CXL_MEM_RAW_COMMANDS is not set
> CONFIG_CXL_ACPI=y
> CONFIG_CXL_MEM=m
> CONFIG_CXL_PORT=y
> CONFIG_CXL_REGION=y
> # CONFIG_CXL_REGION_INVALIDATION_TEST is not set
> CONFIG_PCCARD=y
> CONFIG_PCMCIA=m
> # CONFIG_PCMCIA_LOAD_CIS is not set
> CONFIG_CARDBUS=y
> 
> #
> # PC-card bridges
> #
> CONFIG_YENTA=m
> CONFIG_YENTA_O2=y
> CONFIG_YENTA_RICOH=y
> # CONFIG_YENTA_TI is not set
> CONFIG_YENTA_TOSHIBA=y
> CONFIG_PD6729=m
> CONFIG_I82092=m
> CONFIG_PCCARD_NONSTATIC=y
> CONFIG_RAPIDIO=y
> CONFIG_RAPIDIO_TSI721=m
> CONFIG_RAPIDIO_DISC_TIMEOUT=30
> # CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS is not set
> CONFIG_RAPIDIO_DEBUG=y
> # CONFIG_RAPIDIO_ENUM_BASIC is not set
> # CONFIG_RAPIDIO_CHMAN is not set
> # CONFIG_RAPIDIO_MPORT_CDEV is not set
> 
> #
> # RapidIO Switch drivers
> #
> CONFIG_RAPIDIO_CPS_XX=y
> CONFIG_RAPIDIO_CPS_GEN2=y
> CONFIG_RAPIDIO_RXS_GEN3=m
> # end of RapidIO Switch drivers
> 
> #
> # Generic Driver Options
> #
> CONFIG_AUXILIARY_BUS=y
> CONFIG_UEVENT_HELPER=y
> CONFIG_UEVENT_HELPER_PATH=""
> CONFIG_DEVTMPFS=y
> CONFIG_DEVTMPFS_MOUNT=y
> # CONFIG_DEVTMPFS_SAFE is not set
> # CONFIG_STANDALONE is not set
> CONFIG_PREVENT_FIRMWARE_BUILD=y
> 
> #
> # Firmware loader
> #
> CONFIG_FW_LOADER=y
> CONFIG_FW_LOADER_PAGED_BUF=y
> CONFIG_FW_LOADER_SYSFS=y
> CONFIG_EXTRA_FIRMWARE=""
> CONFIG_FW_LOADER_USER_HELPER=y
> CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
> CONFIG_FW_LOADER_COMPRESS=y
> CONFIG_FW_LOADER_COMPRESS_XZ=y
> CONFIG_FW_LOADER_COMPRESS_ZSTD=y
> CONFIG_FW_UPLOAD=y
> # end of Firmware loader
> 
> CONFIG_WANT_DEV_COREDUMP=y
> CONFIG_ALLOW_DEV_COREDUMP=y
> CONFIG_DEV_COREDUMP=y
> # CONFIG_DEBUG_DRIVER is not set
> CONFIG_DEBUG_DEVRES=y
> # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> # CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
> CONFIG_GENERIC_CPU_AUTOPROBE=y
> CONFIG_GENERIC_CPU_VULNERABILITIES=y
> CONFIG_REGMAP=y
> CONFIG_REGMAP_I2C=y
> CONFIG_REGMAP_SLIMBUS=m
> CONFIG_REGMAP_SPI=y
> CONFIG_REGMAP_SPMI=m
> CONFIG_REGMAP_W1=m
> CONFIG_REGMAP_MMIO=y
> CONFIG_REGMAP_IRQ=y
> CONFIG_REGMAP_SCCB=m
> CONFIG_REGMAP_SPI_AVMM=m
> CONFIG_DMA_SHARED_BUFFER=y
> CONFIG_DMA_FENCE_TRACE=y
> # end of Generic Driver Options
> 
> #
> # Bus devices
> #
> # CONFIG_MOXTET is not set
> # CONFIG_MHI_BUS is not set
> CONFIG_MHI_BUS_EP=m
> # end of Bus devices
> 
> # CONFIG_CONNECTOR is not set
> 
> #
> # Firmware Drivers
> #
> 
> #
> # ARM System Control and Management Interface Protocol
> #
> # end of ARM System Control and Management Interface Protocol
> 
> CONFIG_EDD=y
> CONFIG_EDD_OFF=y
> CONFIG_FIRMWARE_MEMMAP=y
> CONFIG_FW_CFG_SYSFS=y
> CONFIG_FW_CFG_SYSFS_CMDLINE=y
> CONFIG_SYSFB=y
> CONFIG_SYSFB_SIMPLEFB=y
> # CONFIG_GOOGLE_FIRMWARE is not set
> 
> #
> # Tegra firmware driver
> #
> # end of Tegra firmware driver
> # end of Firmware Drivers
> 
> CONFIG_GNSS=m
> CONFIG_GNSS_SERIAL=m
> CONFIG_GNSS_MTK_SERIAL=m
> CONFIG_GNSS_SIRF_SERIAL=m
> CONFIG_GNSS_UBX_SERIAL=m
> # CONFIG_GNSS_USB is not set
> CONFIG_MTD=m
> # CONFIG_MTD_TESTS is not set
> 
> #
> # Partition parsers
> #
> CONFIG_MTD_AR7_PARTS=m
> CONFIG_MTD_CMDLINE_PARTS=m
> CONFIG_MTD_OF_PARTS=m
> CONFIG_MTD_REDBOOT_PARTS=m
> CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
> CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=y
> CONFIG_MTD_REDBOOT_PARTS_READONLY=y
> # end of Partition parsers
> 
> #
> # User Modules And Translation Layers
> #
> # CONFIG_MTD_OOPS is not set
> # CONFIG_MTD_PARTITIONED_MASTER is not set
> 
> #
> # RAM/ROM/Flash chip drivers
> #
> CONFIG_MTD_CFI=m
> CONFIG_MTD_JEDECPROBE=m
> CONFIG_MTD_GEN_PROBE=m
> CONFIG_MTD_CFI_ADV_OPTIONS=y
> # CONFIG_MTD_CFI_NOSWAP is not set
> # CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
> CONFIG_MTD_CFI_LE_BYTE_SWAP=y
> CONFIG_MTD_CFI_GEOMETRY=y
> CONFIG_MTD_MAP_BANK_WIDTH_1=y
> CONFIG_MTD_MAP_BANK_WIDTH_2=y
> # CONFIG_MTD_MAP_BANK_WIDTH_4 is not set
> # CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
> CONFIG_MTD_MAP_BANK_WIDTH_16=y
> # CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
> # CONFIG_MTD_CFI_I1 is not set
> CONFIG_MTD_CFI_I2=y
> CONFIG_MTD_CFI_I4=y
> CONFIG_MTD_CFI_I8=y
> # CONFIG_MTD_OTP is not set
> # CONFIG_MTD_CFI_INTELEXT is not set
> CONFIG_MTD_CFI_AMDSTD=m
> CONFIG_MTD_CFI_STAA=m
> CONFIG_MTD_CFI_UTIL=m
> CONFIG_MTD_RAM=m
> CONFIG_MTD_ROM=m
> # CONFIG_MTD_ABSENT is not set
> # end of RAM/ROM/Flash chip drivers
> 
> #
> # Mapping drivers for chip access
> #
> CONFIG_MTD_COMPLEX_MAPPINGS=y
> # CONFIG_MTD_PHYSMAP is not set
> # CONFIG_MTD_AMD76XROM is not set
> CONFIG_MTD_ICHXROM=m
> # CONFIG_MTD_ESB2ROM is not set
> # CONFIG_MTD_CK804XROM is not set
> CONFIG_MTD_SCB2_FLASH=m
> # CONFIG_MTD_NETtel is not set
> CONFIG_MTD_L440GX=m
> CONFIG_MTD_PCI=m
> CONFIG_MTD_PCMCIA=m
> CONFIG_MTD_PCMCIA_ANONYMOUS=y
> CONFIG_MTD_INTEL_VR_NOR=m
> CONFIG_MTD_PLATRAM=m
> # end of Mapping drivers for chip access
> 
> #
> # Self-contained MTD device drivers
> #
> # CONFIG_MTD_PMC551 is not set
> # CONFIG_MTD_DATAFLASH is not set
> CONFIG_MTD_MCHP23K256=m
> CONFIG_MTD_MCHP48L640=m
> CONFIG_MTD_SST25L=m
> # CONFIG_MTD_SLRAM is not set
> CONFIG_MTD_PHRAM=m
> CONFIG_MTD_MTDRAM=m
> CONFIG_MTDRAM_TOTAL_SIZE=4096
> CONFIG_MTDRAM_ERASE_SIZE=128
> 
> #
> # Disk-On-Chip Device Drivers
> #
> CONFIG_MTD_DOCG3=m
> CONFIG_BCH_CONST_M=14
> CONFIG_BCH_CONST_T=4
> # end of Self-contained MTD device drivers
> 
> #
> # NAND
> #
> CONFIG_MTD_NAND_CORE=m
> CONFIG_MTD_ONENAND=m
> CONFIG_MTD_ONENAND_VERIFY_WRITE=y
> # CONFIG_MTD_ONENAND_GENERIC is not set
> CONFIG_MTD_ONENAND_OTP=y
> CONFIG_MTD_ONENAND_2X_PROGRAM=y
> # CONFIG_MTD_RAW_NAND is not set
> CONFIG_MTD_SPI_NAND=m
> 
> #
> # ECC engine support
> #
> CONFIG_MTD_NAND_ECC=y
> # CONFIG_MTD_NAND_ECC_SW_HAMMING is not set
> CONFIG_MTD_NAND_ECC_SW_BCH=y
> CONFIG_MTD_NAND_ECC_MXIC=y
> # end of ECC engine support
> # end of NAND
> 
> #
> # LPDDR & LPDDR2 PCM memory drivers
> #
> # CONFIG_MTD_LPDDR is not set
> # end of LPDDR & LPDDR2 PCM memory drivers
> 
> CONFIG_MTD_SPI_NOR=m
> # CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
> # CONFIG_MTD_SPI_NOR_SWP_DISABLE is not set
> # CONFIG_MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE is not set
> CONFIG_MTD_SPI_NOR_SWP_KEEP=y
> CONFIG_MTD_UBI=m
> CONFIG_MTD_UBI_WL_THRESHOLD=4096
> CONFIG_MTD_UBI_BEB_LIMIT=20
> # CONFIG_MTD_UBI_FASTMAP is not set
> CONFIG_MTD_UBI_GLUEBI=m
> CONFIG_MTD_HYPERBUS=m
> CONFIG_OF=y
> # CONFIG_OF_UNITTEST is not set
> CONFIG_OF_KOBJ=y
> CONFIG_OF_DYNAMIC=y
> CONFIG_OF_ADDRESS=y
> CONFIG_OF_IRQ=y
> # CONFIG_OF_OVERLAY is not set
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
> CONFIG_PARPORT=m
> CONFIG_PARPORT_PC=m
> # CONFIG_PARPORT_SERIAL is not set
> # CONFIG_PARPORT_PC_FIFO is not set
> CONFIG_PARPORT_PC_SUPERIO=y
> # CONFIG_PARPORT_PC_PCMCIA is not set
> # CONFIG_PARPORT_1284 is not set
> CONFIG_PARPORT_NOT_PC=y
> CONFIG_PNP=y
> CONFIG_PNP_DEBUG_MESSAGES=y
> 
> #
> # Protocols
> #
> CONFIG_PNPACPI=y
> 
> #
> # NVME Support
> #
> # end of NVME Support
> 
> #
> # Misc devices
> #
> CONFIG_SENSORS_LIS3LV02D=m
> CONFIG_AD525X_DPOT=m
> CONFIG_AD525X_DPOT_I2C=m
> # CONFIG_AD525X_DPOT_SPI is not set
> # CONFIG_DUMMY_IRQ is not set
> # CONFIG_IBM_ASM is not set
> # CONFIG_PHANTOM is not set
> CONFIG_TIFM_CORE=y
> CONFIG_TIFM_7XX1=y
> CONFIG_ICS932S401=y
> # CONFIG_ENCLOSURE_SERVICES is not set
> # CONFIG_SMPRO_ERRMON is not set
> CONFIG_SMPRO_MISC=m
> # CONFIG_HI6421V600_IRQ is not set
> CONFIG_HP_ILO=y
> CONFIG_APDS9802ALS=m
> # CONFIG_ISL29003 is not set
> CONFIG_ISL29020=y
> # CONFIG_SENSORS_TSL2550 is not set
> CONFIG_SENSORS_BH1770=m
> CONFIG_SENSORS_APDS990X=y
> # CONFIG_HMC6352 is not set
> CONFIG_DS1682=y
> # CONFIG_LATTICE_ECP3_CONFIG is not set
> # CONFIG_SRAM is not set
> CONFIG_DW_XDATA_PCIE=y
> # CONFIG_PCI_ENDPOINT_TEST is not set
> # CONFIG_XILINX_SDFEC is not set
> CONFIG_MISC_RTSX=m
> CONFIG_HISI_HIKEY_USB=m
> CONFIG_VCPU_STALL_DETECTOR=m
> CONFIG_C2PORT=y
> # CONFIG_C2PORT_DURAMAR_2150 is not set
> 
> #
> # EEPROM support
> #
> CONFIG_EEPROM_AT24=m
> # CONFIG_EEPROM_AT25 is not set
> CONFIG_EEPROM_LEGACY=m
> CONFIG_EEPROM_MAX6875=m
> CONFIG_EEPROM_93CX6=m
> CONFIG_EEPROM_93XX46=m
> CONFIG_EEPROM_IDT_89HPESX=y
> # CONFIG_EEPROM_EE1004 is not set
> # end of EEPROM support
> 
> CONFIG_CB710_CORE=m
> # CONFIG_CB710_DEBUG is not set
> CONFIG_CB710_DEBUG_ASSUMPTIONS=y
> 
> #
> # Texas Instruments shared transport line discipline
> #
> # CONFIG_TI_ST is not set
> # end of Texas Instruments shared transport line discipline
> 
> # CONFIG_SENSORS_LIS3_I2C is not set
> CONFIG_ALTERA_STAPL=y
> CONFIG_INTEL_MEI=m
> CONFIG_INTEL_MEI_ME=m
> CONFIG_INTEL_MEI_TXE=m
> # CONFIG_VMWARE_VMCI is not set
> CONFIG_GENWQE=m
> CONFIG_GENWQE_PLATFORM_ERROR_RECOVERY=0
> CONFIG_ECHO=m
> CONFIG_BCM_VK=y
> # CONFIG_BCM_VK_TTY is not set
> CONFIG_MISC_ALCOR_PCI=y
> # CONFIG_MISC_RTSX_PCI is not set
> CONFIG_MISC_RTSX_USB=m
> CONFIG_PVPANIC=y
> CONFIG_PVPANIC_MMIO=m
> CONFIG_PVPANIC_PCI=m
> # CONFIG_GP_PCI1XXXX is not set
> # end of Misc devices
> 
> #
> # SCSI device support
> #
> # end of SCSI device support
> 
> # CONFIG_FUSION is not set
> 
> #
> # IEEE 1394 (FireWire) support
> #
> # CONFIG_FIREWIRE is not set
> # CONFIG_FIREWIRE_NOSY is not set
> # end of IEEE 1394 (FireWire) support
> 
> # CONFIG_MACINTOSH_DRIVERS is not set
> CONFIG_NETDEVICES=y
> CONFIG_NET_CORE=y
> # CONFIG_BONDING is not set
> # CONFIG_DUMMY is not set
> # CONFIG_WIREGUARD is not set
> # CONFIG_EQUALIZER is not set
> # CONFIG_NET_TEAM is not set
> # CONFIG_MACVLAN is not set
> # CONFIG_IPVLAN is not set
> # CONFIG_VXLAN is not set
> # CONFIG_GENEVE is not set
> # CONFIG_BAREUDP is not set
> # CONFIG_GTP is not set
> # CONFIG_MACSEC is not set
> # CONFIG_NETCONSOLE is not set
> # CONFIG_RIONET is not set
> # CONFIG_TUN is not set
> # CONFIG_TUN_VNET_CROSS_LE is not set
> # CONFIG_VETH is not set
> CONFIG_VIRTIO_NET=m
> # CONFIG_NLMON is not set
> # CONFIG_ARCNET is not set
> CONFIG_ETHERNET=y
> CONFIG_NET_VENDOR_3COM=y
> # CONFIG_PCMCIA_3C574 is not set
> # CONFIG_PCMCIA_3C589 is not set
> # CONFIG_VORTEX is not set
> # CONFIG_TYPHOON is not set
> CONFIG_NET_VENDOR_ADAPTEC=y
> # CONFIG_ADAPTEC_STARFIRE is not set
> CONFIG_NET_VENDOR_AGERE=y
> # CONFIG_ET131X is not set
> CONFIG_NET_VENDOR_ALACRITECH=y
> # CONFIG_SLICOSS is not set
> CONFIG_NET_VENDOR_ALTEON=y
> # CONFIG_ACENIC is not set
> # CONFIG_ALTERA_TSE is not set
> CONFIG_NET_VENDOR_AMAZON=y
> # CONFIG_ENA_ETHERNET is not set
> # CONFIG_NET_VENDOR_AMD is not set
> CONFIG_NET_VENDOR_AQUANTIA=y
> # CONFIG_AQTION is not set
> CONFIG_NET_VENDOR_ARC=y
> CONFIG_NET_VENDOR_ASIX=y
> # CONFIG_SPI_AX88796C is not set
> CONFIG_NET_VENDOR_ATHEROS=y
> # CONFIG_ATL2 is not set
> # CONFIG_ATL1 is not set
> # CONFIG_ATL1E is not set
> # CONFIG_ATL1C is not set
> # CONFIG_ALX is not set
> # CONFIG_CX_ECAT is not set
> CONFIG_NET_VENDOR_BROADCOM=y
> # CONFIG_B44 is not set
> # CONFIG_BCMGENET is not set
> # CONFIG_BNX2 is not set
> # CONFIG_CNIC is not set
> # CONFIG_TIGON3 is not set
> # CONFIG_BNX2X is not set
> # CONFIG_SYSTEMPORT is not set
> # CONFIG_BNXT is not set
> CONFIG_NET_VENDOR_CADENCE=y
> # CONFIG_MACB is not set
> CONFIG_NET_VENDOR_CAVIUM=y
> # CONFIG_THUNDER_NIC_PF is not set
> # CONFIG_THUNDER_NIC_VF is not set
> # CONFIG_THUNDER_NIC_BGX is not set
> # CONFIG_THUNDER_NIC_RGX is not set
> # CONFIG_CAVIUM_PTP is not set
> # CONFIG_LIQUIDIO is not set
> # CONFIG_LIQUIDIO_VF is not set
> CONFIG_NET_VENDOR_CHELSIO=y
> # CONFIG_CHELSIO_T1 is not set
> # CONFIG_CHELSIO_T3 is not set
> # CONFIG_CHELSIO_T4 is not set
> # CONFIG_CHELSIO_T4VF is not set
> CONFIG_NET_VENDOR_CISCO=y
> # CONFIG_ENIC is not set
> CONFIG_NET_VENDOR_CORTINA=y
> # CONFIG_GEMINI_ETHERNET is not set
> CONFIG_NET_VENDOR_DAVICOM=y
> # CONFIG_DM9051 is not set
> # CONFIG_DNET is not set
> CONFIG_NET_VENDOR_DEC=y
> # CONFIG_NET_TULIP is not set
> CONFIG_NET_VENDOR_DLINK=y
> # CONFIG_DL2K is not set
> # CONFIG_SUNDANCE is not set
> CONFIG_NET_VENDOR_EMULEX=y
> # CONFIG_BE2NET is not set
> CONFIG_NET_VENDOR_ENGLEDER=y
> # CONFIG_TSNEP is not set
> CONFIG_NET_VENDOR_EZCHIP=y
> # CONFIG_EZCHIP_NPS_MANAGEMENT_ENET is not set
> CONFIG_NET_VENDOR_FUJITSU=y
> # CONFIG_PCMCIA_FMVJ18X is not set
> CONFIG_NET_VENDOR_FUNGIBLE=y
> # CONFIG_FUN_ETH is not set
> CONFIG_NET_VENDOR_GOOGLE=y
> # CONFIG_GVE is not set
> CONFIG_NET_VENDOR_HUAWEI=y
> # CONFIG_HINIC is not set
> CONFIG_NET_VENDOR_I825XX=y
> CONFIG_NET_VENDOR_INTEL=y
> # CONFIG_E100 is not set
> CONFIG_E1000=y
> # CONFIG_E1000E is not set
> # CONFIG_IGB is not set
> # CONFIG_IGBVF is not set
> # CONFIG_IXGB is not set
> # CONFIG_IXGBE is not set
> # CONFIG_IXGBEVF is not set
> # CONFIG_I40E is not set
> # CONFIG_I40EVF is not set
> # CONFIG_ICE is not set
> # CONFIG_FM10K is not set
> # CONFIG_IGC is not set
> CONFIG_NET_VENDOR_WANGXUN=y
> # CONFIG_NGBE is not set
> # CONFIG_TXGBE is not set
> # CONFIG_JME is not set
> CONFIG_NET_VENDOR_ADI=y
> CONFIG_NET_VENDOR_LITEX=y
> # CONFIG_LITEX_LITEETH is not set
> CONFIG_NET_VENDOR_MARVELL=y
> # CONFIG_MVMDIO is not set
> # CONFIG_SKGE is not set
> # CONFIG_SKY2 is not set
> # CONFIG_OCTEON_EP is not set
> CONFIG_NET_VENDOR_MELLANOX=y
> # CONFIG_MLX4_EN is not set
> # CONFIG_MLX5_CORE is not set
> # CONFIG_MLXSW_CORE is not set
> # CONFIG_MLXFW is not set
> CONFIG_NET_VENDOR_MICREL=y
> # CONFIG_KS8851 is not set
> # CONFIG_KS8851_MLL is not set
> # CONFIG_KSZ884X_PCI is not set
> CONFIG_NET_VENDOR_MICROCHIP=y
> # CONFIG_ENC28J60 is not set
> # CONFIG_ENCX24J600 is not set
> # CONFIG_LAN743X is not set
> # CONFIG_VCAP is not set
> CONFIG_NET_VENDOR_MICROSEMI=y
> CONFIG_NET_VENDOR_MICROSOFT=y
> CONFIG_NET_VENDOR_MYRI=y
> # CONFIG_MYRI10GE is not set
> CONFIG_NET_VENDOR_NI=y
> # CONFIG_NI_XGE_MANAGEMENT_ENET is not set
> CONFIG_NET_VENDOR_NATSEMI=y
> # CONFIG_NATSEMI is not set
> # CONFIG_NS83820 is not set
> CONFIG_NET_VENDOR_NETERION=y
> # CONFIG_S2IO is not set
> CONFIG_NET_VENDOR_NETRONOME=y
> # CONFIG_NFP is not set
> CONFIG_NET_VENDOR_8390=y
> # CONFIG_PCMCIA_AXNET is not set
> # CONFIG_NE2K_PCI is not set
> # CONFIG_PCMCIA_PCNET is not set
> CONFIG_NET_VENDOR_NVIDIA=y
> # CONFIG_FORCEDETH is not set
> CONFIG_NET_VENDOR_OKI=y
> # CONFIG_ETHOC is not set
> CONFIG_NET_VENDOR_PACKET_ENGINES=y
> # CONFIG_HAMACHI is not set
> # CONFIG_YELLOWFIN is not set
> CONFIG_NET_VENDOR_PENSANDO=y
> # CONFIG_IONIC is not set
> CONFIG_NET_VENDOR_QLOGIC=y
> # CONFIG_QLA3XXX is not set
> # CONFIG_QLCNIC is not set
> # CONFIG_NETXEN_NIC is not set
> # CONFIG_QED is not set
> CONFIG_NET_VENDOR_BROCADE=y
> # CONFIG_BNA is not set
> CONFIG_NET_VENDOR_QUALCOMM=y
> # CONFIG_QCA7000_SPI is not set
> # CONFIG_QCA7000_UART is not set
> # CONFIG_QCOM_EMAC is not set
> # CONFIG_RMNET is not set
> CONFIG_NET_VENDOR_RDC=y
> # CONFIG_R6040 is not set
> CONFIG_NET_VENDOR_REALTEK=y
> # CONFIG_ATP is not set
> # CONFIG_8139CP is not set
> # CONFIG_8139TOO is not set
> # CONFIG_R8169 is not set
> CONFIG_NET_VENDOR_RENESAS=y
> CONFIG_NET_VENDOR_ROCKER=y
> CONFIG_NET_VENDOR_SAMSUNG=y
> # CONFIG_SXGBE_ETH is not set
> CONFIG_NET_VENDOR_SEEQ=y
> CONFIG_NET_VENDOR_SILAN=y
> # CONFIG_SC92031 is not set
> CONFIG_NET_VENDOR_SIS=y
> # CONFIG_SIS900 is not set
> # CONFIG_SIS190 is not set
> CONFIG_NET_VENDOR_SOLARFLARE=y
> # CONFIG_SFC is not set
> # CONFIG_SFC_FALCON is not set
> # CONFIG_SFC_SIENA is not set
> CONFIG_NET_VENDOR_SMSC=y
> # CONFIG_PCMCIA_SMC91C92 is not set
> # CONFIG_EPIC100 is not set
> # CONFIG_SMSC911X is not set
> # CONFIG_SMSC9420 is not set
> CONFIG_NET_VENDOR_SOCIONEXT=y
> CONFIG_NET_VENDOR_STMICRO=y
> # CONFIG_STMMAC_ETH is not set
> CONFIG_NET_VENDOR_SUN=y
> # CONFIG_HAPPYMEAL is not set
> # CONFIG_SUNGEM is not set
> # CONFIG_CASSINI is not set
> # CONFIG_NIU is not set
> CONFIG_NET_VENDOR_SYNOPSYS=y
> # CONFIG_DWC_XLGMAC is not set
> CONFIG_NET_VENDOR_TEHUTI=y
> # CONFIG_TEHUTI is not set
> CONFIG_NET_VENDOR_TI=y
> # CONFIG_TI_CPSW_PHY_SEL is not set
> # CONFIG_TLAN is not set
> CONFIG_NET_VENDOR_VERTEXCOM=y
> # CONFIG_MSE102X is not set
> CONFIG_NET_VENDOR_VIA=y
> # CONFIG_VIA_RHINE is not set
> # CONFIG_VIA_VELOCITY is not set
> CONFIG_NET_VENDOR_WIZNET=y
> # CONFIG_WIZNET_W5100 is not set
> # CONFIG_WIZNET_W5300 is not set
> CONFIG_NET_VENDOR_XILINX=y
> # CONFIG_XILINX_EMACLITE is not set
> # CONFIG_XILINX_AXI_EMAC is not set
> # CONFIG_XILINX_LL_TEMAC is not set
> CONFIG_NET_VENDOR_XIRCOM=y
> # CONFIG_PCMCIA_XIRC2PS is not set
> # CONFIG_FDDI is not set
> # CONFIG_HIPPI is not set
> # CONFIG_NET_SB1000 is not set
> # CONFIG_PHYLIB is not set
> # CONFIG_MICREL_KS8995MA is not set
> # CONFIG_PSE_CONTROLLER is not set
> # CONFIG_MDIO_DEVICE is not set
> 
> #
> # PCS device drivers
> #
> # end of PCS device drivers
> 
> # CONFIG_PLIP is not set
> # CONFIG_PPP is not set
> # CONFIG_SLIP is not set
> CONFIG_USB_NET_DRIVERS=y
> # CONFIG_USB_CATC is not set
> # CONFIG_USB_KAWETH is not set
> # CONFIG_USB_PEGASUS is not set
> # CONFIG_USB_RTL8150 is not set
> # CONFIG_USB_RTL8152 is not set
> # CONFIG_USB_LAN78XX is not set
> # CONFIG_USB_USBNET is not set
> # CONFIG_USB_IPHETH is not set
> CONFIG_WLAN=y
> CONFIG_WLAN_VENDOR_ADMTEK=y
> CONFIG_WLAN_VENDOR_ATH=y
> # CONFIG_ATH_DEBUG is not set
> # CONFIG_ATH5K_PCI is not set
> CONFIG_WLAN_VENDOR_ATMEL=y
> CONFIG_WLAN_VENDOR_BROADCOM=y
> CONFIG_WLAN_VENDOR_CISCO=y
> CONFIG_WLAN_VENDOR_INTEL=y
> CONFIG_WLAN_VENDOR_INTERSIL=y
> # CONFIG_HOSTAP is not set
> CONFIG_WLAN_VENDOR_MARVELL=y
> CONFIG_WLAN_VENDOR_MEDIATEK=y
> CONFIG_WLAN_VENDOR_MICROCHIP=y
> CONFIG_WLAN_VENDOR_PURELIFI=y
> CONFIG_WLAN_VENDOR_RALINK=y
> CONFIG_WLAN_VENDOR_REALTEK=y
> CONFIG_WLAN_VENDOR_RSI=y
> CONFIG_WLAN_VENDOR_SILABS=y
> CONFIG_WLAN_VENDOR_ST=y
> CONFIG_WLAN_VENDOR_TI=y
> CONFIG_WLAN_VENDOR_ZYDAS=y
> CONFIG_WLAN_VENDOR_QUANTENNA=y
> # CONFIG_PCMCIA_RAYCS is not set
> # CONFIG_WAN is not set
> 
> #
> # Wireless WAN
> #
> # CONFIG_WWAN is not set
> # end of Wireless WAN
> 
> # CONFIG_VMXNET3 is not set
> # CONFIG_FUJITSU_ES is not set
> # CONFIG_USB4_NET is not set
> # CONFIG_NETDEVSIM is not set
> CONFIG_NET_FAILOVER=m
> # CONFIG_ISDN is not set
> 
> #
> # Input device support
> #
> CONFIG_INPUT=y
> CONFIG_INPUT_LEDS=m
> # CONFIG_INPUT_FF_MEMLESS is not set
> CONFIG_INPUT_SPARSEKMAP=m
> # CONFIG_INPUT_MATRIXKMAP is not set
> CONFIG_INPUT_VIVALDIFMAP=y
> 
> #
> # Userland interfaces
> #
> # CONFIG_INPUT_MOUSEDEV is not set
> # CONFIG_INPUT_JOYDEV is not set
> # CONFIG_INPUT_EVDEV is not set
> # CONFIG_INPUT_EVBUG is not set
> 
> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=y
> # CONFIG_KEYBOARD_ADP5588 is not set
> # CONFIG_KEYBOARD_ADP5589 is not set
> CONFIG_KEYBOARD_ATKBD=y
> # CONFIG_KEYBOARD_QT1050 is not set
> # CONFIG_KEYBOARD_QT1070 is not set
> # CONFIG_KEYBOARD_QT2160 is not set
> # CONFIG_KEYBOARD_DLINK_DIR685 is not set
> # CONFIG_KEYBOARD_LKKBD is not set
> # CONFIG_KEYBOARD_GPIO is not set
> # CONFIG_KEYBOARD_GPIO_POLLED is not set
> # CONFIG_KEYBOARD_TCA6416 is not set
> # CONFIG_KEYBOARD_TCA8418 is not set
> # CONFIG_KEYBOARD_MATRIX is not set
> # CONFIG_KEYBOARD_LM8323 is not set
> # CONFIG_KEYBOARD_LM8333 is not set
> # CONFIG_KEYBOARD_MAX7359 is not set
> # CONFIG_KEYBOARD_MCS is not set
> # CONFIG_KEYBOARD_MPR121 is not set
> # CONFIG_KEYBOARD_NEWTON is not set
> # CONFIG_KEYBOARD_OPENCORES is not set
> # CONFIG_KEYBOARD_PINEPHONE is not set
> # CONFIG_KEYBOARD_SAMSUNG is not set
> # CONFIG_KEYBOARD_STOWAWAY is not set
> # CONFIG_KEYBOARD_SUNKBD is not set
> # CONFIG_KEYBOARD_OMAP4 is not set
> # CONFIG_KEYBOARD_TC3589X is not set
> # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
> # CONFIG_KEYBOARD_TWL4030 is not set
> # CONFIG_KEYBOARD_XTKBD is not set
> # CONFIG_KEYBOARD_CAP11XX is not set
> # CONFIG_KEYBOARD_BCM is not set
> # CONFIG_KEYBOARD_CYPRESS_SF is not set
> CONFIG_INPUT_MOUSE=y
> CONFIG_MOUSE_PS2=y
> CONFIG_MOUSE_PS2_ALPS=y
> CONFIG_MOUSE_PS2_BYD=y
> CONFIG_MOUSE_PS2_LOGIPS2PP=y
> CONFIG_MOUSE_PS2_SYNAPTICS=y
> CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=y
> CONFIG_MOUSE_PS2_CYPRESS=y
> CONFIG_MOUSE_PS2_TRACKPOINT=y
> # CONFIG_MOUSE_PS2_ELANTECH is not set
> # CONFIG_MOUSE_PS2_SENTELIC is not set
> # CONFIG_MOUSE_PS2_TOUCHKIT is not set
> CONFIG_MOUSE_PS2_FOCALTECH=y
> # CONFIG_MOUSE_PS2_VMMOUSE is not set
> CONFIG_MOUSE_PS2_SMBUS=y
> # CONFIG_MOUSE_SERIAL is not set
> # CONFIG_MOUSE_APPLETOUCH is not set
> # CONFIG_MOUSE_BCM5974 is not set
> # CONFIG_MOUSE_CYAPA is not set
> # CONFIG_MOUSE_ELAN_I2C is not set
> # CONFIG_MOUSE_VSXXXAA is not set
> # CONFIG_MOUSE_GPIO is not set
> # CONFIG_MOUSE_SYNAPTICS_I2C is not set
> # CONFIG_MOUSE_SYNAPTICS_USB is not set
> # CONFIG_INPUT_JOYSTICK is not set
> # CONFIG_INPUT_TABLET is not set
> # CONFIG_INPUT_TOUCHSCREEN is not set
> # CONFIG_INPUT_MISC is not set
> # CONFIG_RMI4_CORE is not set
> 
> #
> # Hardware I/O ports
> #
> CONFIG_SERIO=y
> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
> CONFIG_SERIO_I8042=y
> CONFIG_SERIO_SERPORT=y
> # CONFIG_SERIO_CT82C710 is not set
> # CONFIG_SERIO_PARKBD is not set
> # CONFIG_SERIO_PCIPS2 is not set
> CONFIG_SERIO_LIBPS2=y
> # CONFIG_SERIO_RAW is not set
> # CONFIG_SERIO_ALTERA_PS2 is not set
> # CONFIG_SERIO_PS2MULT is not set
> # CONFIG_SERIO_ARC_PS2 is not set
> # CONFIG_SERIO_APBPS2 is not set
> # CONFIG_SERIO_GPIO_PS2 is not set
> # CONFIG_USERIO is not set
> CONFIG_GAMEPORT=m
> CONFIG_GAMEPORT_NS558=m
> CONFIG_GAMEPORT_L4=m
> CONFIG_GAMEPORT_EMU10K1=m
> CONFIG_GAMEPORT_FM801=m
> # end of Hardware I/O ports
> # end of Input device support
> 
> #
> # Character devices
> #
> CONFIG_TTY=y
> # CONFIG_VT is not set
> CONFIG_UNIX98_PTYS=y
> CONFIG_LEGACY_PTYS=y
> CONFIG_LEGACY_PTY_COUNT=256
> CONFIG_LEGACY_TIOCSTI=y
> CONFIG_LDISC_AUTOLOAD=y
> 
> #
> # Serial drivers
> #
> CONFIG_SERIAL_EARLYCON=y
> CONFIG_SERIAL_8250=y
> CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
> CONFIG_SERIAL_8250_PNP=y
> # CONFIG_SERIAL_8250_16550A_VARIANTS is not set
> # CONFIG_SERIAL_8250_FINTEK is not set
> CONFIG_SERIAL_8250_CONSOLE=y
> CONFIG_SERIAL_8250_PCILIB=y
> CONFIG_SERIAL_8250_PCI=y
> CONFIG_SERIAL_8250_EXAR=y
> # CONFIG_SERIAL_8250_CS is not set
> # CONFIG_SERIAL_8250_MEN_MCB is not set
> CONFIG_SERIAL_8250_NR_UARTS=4
> CONFIG_SERIAL_8250_RUNTIME_UARTS=4
> # CONFIG_SERIAL_8250_EXTENDED is not set
> CONFIG_SERIAL_8250_PCI1XXXX=y
> CONFIG_SERIAL_8250_DWLIB=y
> # CONFIG_SERIAL_8250_DW is not set
> # CONFIG_SERIAL_8250_RT288X is not set
> CONFIG_SERIAL_8250_LPSS=y
> CONFIG_SERIAL_8250_MID=y
> CONFIG_SERIAL_8250_PERICOM=y
> # CONFIG_SERIAL_OF_PLATFORM is not set
> 
> #
> # Non-8250 serial port support
> #
> # CONFIG_SERIAL_MAX3100 is not set
> # CONFIG_SERIAL_MAX310X is not set
> # CONFIG_SERIAL_UARTLITE is not set
> CONFIG_SERIAL_CORE=y
> CONFIG_SERIAL_CORE_CONSOLE=y
> # CONFIG_SERIAL_JSM is not set
> # CONFIG_SERIAL_SIFIVE is not set
> # CONFIG_SERIAL_LANTIQ is not set
> # CONFIG_SERIAL_SCCNXP is not set
> # CONFIG_SERIAL_SC16IS7XX is not set
> # CONFIG_SERIAL_ALTERA_JTAGUART is not set
> # CONFIG_SERIAL_ALTERA_UART is not set
> # CONFIG_SERIAL_XILINX_PS_UART is not set
> # CONFIG_SERIAL_ARC is not set
> # CONFIG_SERIAL_RP2 is not set
> # CONFIG_SERIAL_FSL_LPUART is not set
> # CONFIG_SERIAL_FSL_LINFLEXUART is not set
> # CONFIG_SERIAL_CONEXANT_DIGICOLOR is not set
> # CONFIG_SERIAL_MEN_Z135 is not set
> # CONFIG_SERIAL_SPRD is not set
> # CONFIG_SERIAL_LITEUART is not set
> # end of Serial drivers
> 
> CONFIG_SERIAL_MCTRL_GPIO=y
> # CONFIG_SERIAL_NONSTANDARD is not set
> # CONFIG_N_GSM is not set
> # CONFIG_NOZOMI is not set
> # CONFIG_NULL_TTY is not set
> # CONFIG_RPMSG_TTY is not set
> CONFIG_SERIAL_DEV_BUS=m
> # CONFIG_TTY_PRINTK is not set
> # CONFIG_PRINTER is not set
> # CONFIG_PPDEV is not set
> # CONFIG_VIRTIO_CONSOLE is not set
> CONFIG_IPMI_HANDLER=y
> CONFIG_IPMI_PLAT_DATA=y
> # CONFIG_IPMI_PANIC_EVENT is not set
> CONFIG_IPMI_DEVICE_INTERFACE=m
> CONFIG_IPMI_SI=y
> CONFIG_IPMI_SSIF=m
> # CONFIG_IPMI_IPMB is not set
> CONFIG_IPMI_WATCHDOG=m
> CONFIG_IPMI_POWEROFF=m
> CONFIG_SSIF_IPMI_BMC=m
> # CONFIG_IPMB_DEVICE_INTERFACE is not set
> CONFIG_HW_RANDOM=y
> CONFIG_HW_RANDOM_TIMERIOMEM=m
> # CONFIG_HW_RANDOM_INTEL is not set
> # CONFIG_HW_RANDOM_AMD is not set
> # CONFIG_HW_RANDOM_BA431 is not set
> CONFIG_HW_RANDOM_VIA=y
> CONFIG_HW_RANDOM_VIRTIO=m
> CONFIG_HW_RANDOM_CCTRNG=y
> # CONFIG_HW_RANDOM_XIPHERA is not set
> CONFIG_APPLICOM=y
> 
> #
> # PCMCIA character devices
> #
> # CONFIG_SYNCLINK_CS is not set
> # CONFIG_CARDMAN_4000 is not set
> # CONFIG_CARDMAN_4040 is not set
> # CONFIG_SCR24X is not set
> # CONFIG_IPWIRELESS is not set
> # end of PCMCIA character devices
> 
> # CONFIG_MWAVE is not set
> CONFIG_DEVMEM=y
> CONFIG_NVRAM=m
> CONFIG_DEVPORT=y
> # CONFIG_HPET is not set
> # CONFIG_HANGCHECK_TIMER is not set
> CONFIG_TCG_TPM=m
> # CONFIG_HW_RANDOM_TPM is not set
> CONFIG_TCG_TIS_CORE=m
> CONFIG_TCG_TIS=m
> # CONFIG_TCG_TIS_SPI is not set
> CONFIG_TCG_TIS_I2C=m
> # CONFIG_TCG_TIS_I2C_CR50 is not set
> # CONFIG_TCG_TIS_I2C_ATMEL is not set
> CONFIG_TCG_TIS_I2C_INFINEON=m
> CONFIG_TCG_TIS_I2C_NUVOTON=m
> # CONFIG_TCG_NSC is not set
> # CONFIG_TCG_ATMEL is not set
> # CONFIG_TCG_INFINEON is not set
> # CONFIG_TCG_CRB is not set
> CONFIG_TCG_VTPM_PROXY=m
> CONFIG_TCG_TIS_ST33ZP24=m
> CONFIG_TCG_TIS_ST33ZP24_I2C=m
> # CONFIG_TCG_TIS_ST33ZP24_SPI is not set
> CONFIG_TELCLOCK=m
> CONFIG_XILLYBUS_CLASS=m
> CONFIG_XILLYBUS=m
> CONFIG_XILLYBUS_PCIE=m
> CONFIG_XILLYBUS_OF=m
> # CONFIG_XILLYUSB is not set
> # end of Character devices
> 
> #
> # I2C support
> #
> CONFIG_I2C=y
> CONFIG_ACPI_I2C_OPREGION=y
> CONFIG_I2C_BOARDINFO=y
> # CONFIG_I2C_COMPAT is not set
> CONFIG_I2C_CHARDEV=y
> CONFIG_I2C_MUX=m
> 
> #
> # Multiplexer I2C Chip support
> #
> # CONFIG_I2C_ARB_GPIO_CHALLENGE is not set
> CONFIG_I2C_MUX_GPIO=m
> CONFIG_I2C_MUX_GPMUX=m
> CONFIG_I2C_MUX_LTC4306=m
> CONFIG_I2C_MUX_PCA9541=m
> CONFIG_I2C_MUX_PCA954x=m
> CONFIG_I2C_MUX_PINCTRL=m
> # CONFIG_I2C_MUX_REG is not set
> CONFIG_I2C_DEMUX_PINCTRL=m
> # CONFIG_I2C_MUX_MLXCPLD is not set
> # end of Multiplexer I2C Chip support
> 
> CONFIG_I2C_HELPER_AUTO=y
> CONFIG_I2C_SMBUS=y
> CONFIG_I2C_ALGOBIT=y
> 
> #
> # I2C Hardware Bus support
> #
> 
> #
> # PC SMBus host controller drivers
> #
> # CONFIG_I2C_ALI1535 is not set
> CONFIG_I2C_ALI1563=m
> # CONFIG_I2C_ALI15X3 is not set
> # CONFIG_I2C_AMD756 is not set
> # CONFIG_I2C_AMD8111 is not set
> # CONFIG_I2C_AMD_MP2 is not set
> CONFIG_I2C_I801=y
> # CONFIG_I2C_ISCH is not set
> CONFIG_I2C_ISMT=y
> CONFIG_I2C_PIIX4=y
> # CONFIG_I2C_NFORCE2 is not set
> # CONFIG_I2C_NVIDIA_GPU is not set
> CONFIG_I2C_SIS5595=y
> CONFIG_I2C_SIS630=m
> # CONFIG_I2C_SIS96X is not set
> CONFIG_I2C_VIA=y
> # CONFIG_I2C_VIAPRO is not set
> 
> #
> # ACPI drivers
> #
> # CONFIG_I2C_SCMI is not set
> 
> #
> # I2C system bus drivers (mostly embedded / system-on-chip)
> #
> CONFIG_I2C_CBUS_GPIO=y
> CONFIG_I2C_DESIGNWARE_CORE=m
> CONFIG_I2C_DESIGNWARE_SLAVE=y
> CONFIG_I2C_DESIGNWARE_PLATFORM=m
> # CONFIG_I2C_DESIGNWARE_AMDPSP is not set
> # CONFIG_I2C_DESIGNWARE_BAYTRAIL is not set
> # CONFIG_I2C_DESIGNWARE_PCI is not set
> CONFIG_I2C_EMEV2=y
> # CONFIG_I2C_GPIO is not set
> # CONFIG_I2C_KEMPLD is not set
> # CONFIG_I2C_OCORES is not set
> # CONFIG_I2C_PCA_PLATFORM is not set
> CONFIG_I2C_RK3X=y
> # CONFIG_I2C_SIMTEC is not set
> CONFIG_I2C_XILINX=m
> 
> #
> # External I2C/SMBus adapter drivers
> #
> # CONFIG_I2C_DIOLAN_U2C is not set
> CONFIG_I2C_DLN2=m
> CONFIG_I2C_CP2615=m
> CONFIG_I2C_PARPORT=m
> CONFIG_I2C_PCI1XXXX=y
> # CONFIG_I2C_ROBOTFUZZ_OSIF is not set
> # CONFIG_I2C_TAOS_EVM is not set
> # CONFIG_I2C_TINY_USB is not set
> 
> #
> # Other I2C/SMBus bus drivers
> #
> CONFIG_I2C_MLXCPLD=m
> CONFIG_I2C_FSI=m
> # CONFIG_I2C_VIRTIO is not set
> # end of I2C Hardware Bus support
> 
> # CONFIG_I2C_STUB is not set
> CONFIG_I2C_SLAVE=y
> CONFIG_I2C_SLAVE_EEPROM=y
> CONFIG_I2C_SLAVE_TESTUNIT=y
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> # end of I2C support
> 
> CONFIG_I3C=y
> CONFIG_CDNS_I3C_MASTER=m
> CONFIG_DW_I3C_MASTER=y
> CONFIG_SVC_I3C_MASTER=y
> # CONFIG_MIPI_I3C_HCI is not set
> CONFIG_SPI=y
> # CONFIG_SPI_DEBUG is not set
> CONFIG_SPI_MASTER=y
> CONFIG_SPI_MEM=y
> 
> #
> # SPI Master Controller Drivers
> #
> # CONFIG_SPI_ALTERA is not set
> CONFIG_SPI_AXI_SPI_ENGINE=m
> CONFIG_SPI_BITBANG=y
> # CONFIG_SPI_BUTTERFLY is not set
> CONFIG_SPI_CADENCE=m
> CONFIG_SPI_CADENCE_QUADSPI=m
> CONFIG_SPI_CADENCE_XSPI=y
> CONFIG_SPI_DESIGNWARE=m
> # CONFIG_SPI_DW_DMA is not set
> CONFIG_SPI_DW_PCI=m
> CONFIG_SPI_DW_MMIO=m
> CONFIG_SPI_DLN2=m
> CONFIG_SPI_FSI=m
> # CONFIG_SPI_NXP_FLEXSPI is not set
> CONFIG_SPI_GPIO=y
> CONFIG_SPI_INTEL=y
> CONFIG_SPI_INTEL_PCI=y
> CONFIG_SPI_INTEL_PLATFORM=m
> # CONFIG_SPI_LM70_LLP is not set
> # CONFIG_SPI_FSL_SPI is not set
> CONFIG_SPI_MICROCHIP_CORE=y
> CONFIG_SPI_MICROCHIP_CORE_QSPI=y
> # CONFIG_SPI_LANTIQ_SSC is not set
> CONFIG_SPI_OC_TINY=m
> CONFIG_SPI_PCI1XXXX=y
> # CONFIG_SPI_PXA2XX is not set
> # CONFIG_SPI_ROCKCHIP is not set
> CONFIG_SPI_SC18IS602=y
> CONFIG_SPI_SIFIVE=y
> # CONFIG_SPI_SN_F_OSPI is not set
> CONFIG_SPI_MXIC=m
> CONFIG_SPI_XCOMM=y
> # CONFIG_SPI_XILINX is not set
> # CONFIG_SPI_ZYNQMP_GQSPI is not set
> # CONFIG_SPI_AMD is not set
> 
> #
> # SPI Multiplexer support
> #
> CONFIG_SPI_MUX=m
> 
> #
> # SPI Protocol Masters
> #
> CONFIG_SPI_SPIDEV=m
> # CONFIG_SPI_LOOPBACK_TEST is not set
> # CONFIG_SPI_TLE62X0 is not set
> CONFIG_SPI_SLAVE=y
> # CONFIG_SPI_SLAVE_TIME is not set
> CONFIG_SPI_SLAVE_SYSTEM_CONTROL=m
> CONFIG_SPI_DYNAMIC=y
> CONFIG_SPMI=m
> # CONFIG_SPMI_HISI3670 is not set
> CONFIG_HSI=m
> CONFIG_HSI_BOARDINFO=y
> 
> #
> # HSI controllers
> #
> 
> #
> # HSI clients
> #
> # CONFIG_HSI_CHAR is not set
> CONFIG_PPS=y
> # CONFIG_PPS_DEBUG is not set
> 
> #
> # PPS clients support
> #
> CONFIG_PPS_CLIENT_KTIMER=m
> # CONFIG_PPS_CLIENT_LDISC is not set
> CONFIG_PPS_CLIENT_PARPORT=m
> # CONFIG_PPS_CLIENT_GPIO is not set
> 
> #
> # PPS generators support
> #
> 
> #
> # PTP clock support
> #
> CONFIG_PTP_1588_CLOCK=y
> CONFIG_PTP_1588_CLOCK_OPTIONAL=y
> 
> #
> # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
> #
> CONFIG_PTP_1588_CLOCK_KVM=y
> # CONFIG_PTP_1588_CLOCK_IDT82P33 is not set
> # CONFIG_PTP_1588_CLOCK_IDTCM is not set
> # CONFIG_PTP_1588_CLOCK_VMW is not set
> # CONFIG_PTP_1588_CLOCK_OCP is not set
> # end of PTP clock support
> 
> CONFIG_PINCTRL=y
> CONFIG_GENERIC_PINCTRL_GROUPS=y
> CONFIG_PINMUX=y
> CONFIG_GENERIC_PINMUX_FUNCTIONS=y
> CONFIG_PINCONF=y
> CONFIG_GENERIC_PINCONF=y
> CONFIG_DEBUG_PINCTRL=y
> # CONFIG_PINCTRL_AMD is not set
> CONFIG_PINCTRL_AS3722=m
> CONFIG_PINCTRL_CY8C95X0=y
> # CONFIG_PINCTRL_EQUILIBRIUM is not set
> CONFIG_PINCTRL_MCP23S08_I2C=y
> CONFIG_PINCTRL_MCP23S08_SPI=y
> CONFIG_PINCTRL_MCP23S08=y
> CONFIG_PINCTRL_MICROCHIP_SGPIO=y
> CONFIG_PINCTRL_OCELOT=m
> CONFIG_PINCTRL_PALMAS=m
> CONFIG_PINCTRL_RK805=y
> # CONFIG_PINCTRL_SINGLE is not set
> CONFIG_PINCTRL_STMFX=y
> CONFIG_PINCTRL_SX150X=y
> CONFIG_PINCTRL_MADERA=y
> CONFIG_PINCTRL_CS47L35=y
> 
> #
> # Intel pinctrl drivers
> #
> # CONFIG_PINCTRL_BAYTRAIL is not set
> # CONFIG_PINCTRL_CHERRYVIEW is not set
> # CONFIG_PINCTRL_LYNXPOINT is not set
> # CONFIG_PINCTRL_ALDERLAKE is not set
> # CONFIG_PINCTRL_BROXTON is not set
> # CONFIG_PINCTRL_CANNONLAKE is not set
> # CONFIG_PINCTRL_CEDARFORK is not set
> # CONFIG_PINCTRL_DENVERTON is not set
> # CONFIG_PINCTRL_ELKHARTLAKE is not set
> # CONFIG_PINCTRL_EMMITSBURG is not set
> # CONFIG_PINCTRL_GEMINILAKE is not set
> # CONFIG_PINCTRL_ICELAKE is not set
> # CONFIG_PINCTRL_JASPERLAKE is not set
> # CONFIG_PINCTRL_LAKEFIELD is not set
> # CONFIG_PINCTRL_LEWISBURG is not set
> # CONFIG_PINCTRL_METEORLAKE is not set
> # CONFIG_PINCTRL_SUNRISEPOINT is not set
> # CONFIG_PINCTRL_TIGERLAKE is not set
> # end of Intel pinctrl drivers
> 
> #
> # Renesas pinctrl drivers
> #
> # end of Renesas pinctrl drivers
> 
> CONFIG_GPIOLIB=y
> CONFIG_GPIOLIB_FASTPATH_LIMIT=512
> CONFIG_OF_GPIO=y
> CONFIG_GPIO_ACPI=y
> CONFIG_GPIOLIB_IRQCHIP=y
> # CONFIG_DEBUG_GPIO is not set
> # CONFIG_GPIO_SYSFS is not set
> # CONFIG_GPIO_CDEV is not set
> CONFIG_GPIO_GENERIC=y
> CONFIG_GPIO_MAX730X=y
> CONFIG_GPIO_IDIO_16=m
> 
> #
> # Memory mapped GPIO drivers
> #
> CONFIG_GPIO_74XX_MMIO=y
> CONFIG_GPIO_ALTERA=y
> # CONFIG_GPIO_AMDPT is not set
> CONFIG_GPIO_CADENCE=y
> # CONFIG_GPIO_DWAPB is not set
> # CONFIG_GPIO_EXAR is not set
> # CONFIG_GPIO_FTGPIO010 is not set
> CONFIG_GPIO_GENERIC_PLATFORM=m
> # CONFIG_GPIO_GRGPIO is not set
> CONFIG_GPIO_HLWD=m
> CONFIG_GPIO_ICH=m
> CONFIG_GPIO_LOGICVC=y
> CONFIG_GPIO_MB86S7X=m
> CONFIG_GPIO_MENZ127=m
> CONFIG_GPIO_SIFIVE=y
> CONFIG_GPIO_SIOX=m
> CONFIG_GPIO_SYSCON=y
> CONFIG_GPIO_VX855=y
> CONFIG_GPIO_WCD934X=m
> CONFIG_GPIO_XILINX=m
> # CONFIG_GPIO_AMD_FCH is not set
> # end of Memory mapped GPIO drivers
> 
> #
> # Port-mapped I/O GPIO drivers
> #
> CONFIG_GPIO_F7188X=m
> # CONFIG_GPIO_IT87 is not set
> # CONFIG_GPIO_SCH is not set
> # CONFIG_GPIO_SCH311X is not set
> # CONFIG_GPIO_WINBOND is not set
> CONFIG_GPIO_WS16C48=y
> # end of Port-mapped I/O GPIO drivers
> 
> #
> # I2C GPIO expanders
> #
> # CONFIG_GPIO_ADNP is not set
> CONFIG_GPIO_GW_PLD=y
> CONFIG_GPIO_MAX7300=m
> CONFIG_GPIO_MAX732X=m
> CONFIG_GPIO_PCA953X=m
> # CONFIG_GPIO_PCA953X_IRQ is not set
> # CONFIG_GPIO_PCA9570 is not set
> # CONFIG_GPIO_PCF857X is not set
> # CONFIG_GPIO_TPIC2810 is not set
> # end of I2C GPIO expanders
> 
> #
> # MFD GPIO expanders
> #
> CONFIG_GPIO_ARIZONA=y
> # CONFIG_GPIO_BD71815 is not set
> # CONFIG_GPIO_BD71828 is not set
> # CONFIG_GPIO_BD9571MWV is not set
> CONFIG_GPIO_DA9052=m
> # CONFIG_GPIO_DA9055 is not set
> # CONFIG_GPIO_DLN2 is not set
> CONFIG_GPIO_JANZ_TTL=m
> CONFIG_GPIO_KEMPLD=m
> # CONFIG_GPIO_LP3943 is not set
> CONFIG_GPIO_LP873X=y
> CONFIG_GPIO_LP87565=y
> CONFIG_GPIO_MADERA=m
> CONFIG_GPIO_PALMAS=y
> # CONFIG_GPIO_TC3589X is not set
> # CONFIG_GPIO_TPS65086 is not set
> CONFIG_GPIO_TPS65218=m
> CONFIG_GPIO_TPS65910=y
> CONFIG_GPIO_TPS65912=m
> # CONFIG_GPIO_TWL4030 is not set
> CONFIG_GPIO_WM831X=m
> CONFIG_GPIO_WM8994=y
> # end of MFD GPIO expanders
> 
> #
> # PCI GPIO expanders
> #
> # CONFIG_GPIO_AMD8111 is not set
> CONFIG_GPIO_BT8XX=m
> # CONFIG_GPIO_ML_IOH is not set
> CONFIG_GPIO_PCI_IDIO_16=m
> # CONFIG_GPIO_PCIE_IDIO_24 is not set
> # CONFIG_GPIO_RDC321X is not set
> # CONFIG_GPIO_SODAVILLE is not set
> # end of PCI GPIO expanders
> 
> #
> # SPI GPIO expanders
> #
> CONFIG_GPIO_74X164=m
> CONFIG_GPIO_MAX3191X=m
> CONFIG_GPIO_MAX7301=y
> CONFIG_GPIO_MC33880=y
> CONFIG_GPIO_PISOSR=m
> CONFIG_GPIO_XRA1403=y
> # end of SPI GPIO expanders
> 
> #
> # USB GPIO expanders
> #
> # end of USB GPIO expanders
> 
> #
> # Virtual GPIO drivers
> #
> CONFIG_GPIO_AGGREGATOR=y
> CONFIG_GPIO_LATCH=y
> # CONFIG_GPIO_MOCKUP is not set
> CONFIG_GPIO_VIRTIO=y
> CONFIG_GPIO_SIM=y
> # end of Virtual GPIO drivers
> 
> CONFIG_W1=y
> 
> #
> # 1-wire Bus Masters
> #
> CONFIG_W1_MASTER_MATROX=y
> CONFIG_W1_MASTER_DS2490=y
> # CONFIG_W1_MASTER_DS2482 is not set
> CONFIG_W1_MASTER_GPIO=y
> CONFIG_W1_MASTER_SGI=m
> # end of 1-wire Bus Masters
> 
> #
> # 1-wire Slaves
> #
> # CONFIG_W1_SLAVE_THERM is not set
> # CONFIG_W1_SLAVE_SMEM is not set
> # CONFIG_W1_SLAVE_DS2405 is not set
> # CONFIG_W1_SLAVE_DS2408 is not set
> CONFIG_W1_SLAVE_DS2413=m
> CONFIG_W1_SLAVE_DS2406=y
> CONFIG_W1_SLAVE_DS2423=m
> CONFIG_W1_SLAVE_DS2805=m
> CONFIG_W1_SLAVE_DS2430=y
> CONFIG_W1_SLAVE_DS2431=m
> CONFIG_W1_SLAVE_DS2433=m
> CONFIG_W1_SLAVE_DS2433_CRC=y
> # CONFIG_W1_SLAVE_DS2438 is not set
> CONFIG_W1_SLAVE_DS250X=y
> CONFIG_W1_SLAVE_DS2780=m
> CONFIG_W1_SLAVE_DS2781=m
> # CONFIG_W1_SLAVE_DS28E04 is not set
> CONFIG_W1_SLAVE_DS28E17=y
> # end of 1-wire Slaves
> 
> CONFIG_POWER_RESET=y
> CONFIG_POWER_RESET_AS3722=y
> CONFIG_POWER_RESET_ATC260X=m
> # CONFIG_POWER_RESET_GPIO is not set
> # CONFIG_POWER_RESET_GPIO_RESTART is not set
> # CONFIG_POWER_RESET_LTC2952 is not set
> # CONFIG_POWER_RESET_REGULATOR is not set
> # CONFIG_POWER_RESET_RESTART is not set
> CONFIG_POWER_RESET_TPS65086=y
> # CONFIG_POWER_RESET_SYSCON is not set
> CONFIG_POWER_RESET_SYSCON_POWEROFF=y
> CONFIG_REBOOT_MODE=y
> CONFIG_SYSCON_REBOOT_MODE=y
> CONFIG_NVMEM_REBOOT_MODE=y
> CONFIG_POWER_SUPPLY=y
> # CONFIG_POWER_SUPPLY_DEBUG is not set
> CONFIG_IP5XXX_POWER=m
> # CONFIG_MAX8925_POWER is not set
> # CONFIG_WM831X_BACKUP is not set
> # CONFIG_WM831X_POWER is not set
> # CONFIG_TEST_POWER is not set
> CONFIG_BATTERY_88PM860X=y
> CONFIG_CHARGER_ADP5061=y
> CONFIG_BATTERY_ACT8945A=m
> CONFIG_BATTERY_CW2015=y
> CONFIG_BATTERY_DS2760=y
> CONFIG_BATTERY_DS2780=m
> # CONFIG_BATTERY_DS2781 is not set
> CONFIG_BATTERY_DS2782=y
> # CONFIG_BATTERY_SAMSUNG_SDI is not set
> # CONFIG_BATTERY_SBS is not set
> CONFIG_CHARGER_SBS=y
> CONFIG_MANAGER_SBS=m
> CONFIG_BATTERY_BQ27XXX=y
> # CONFIG_BATTERY_BQ27XXX_I2C is not set
> # CONFIG_BATTERY_BQ27XXX_HDQ is not set
> CONFIG_BATTERY_DA9030=y
> CONFIG_BATTERY_DA9052=y
> # CONFIG_BATTERY_DA9150 is not set
> CONFIG_BATTERY_MAX17040=y
> # CONFIG_BATTERY_MAX17042 is not set
> CONFIG_BATTERY_MAX1721X=m
> CONFIG_CHARGER_88PM860X=m
> # CONFIG_CHARGER_ISP1704 is not set
> # CONFIG_CHARGER_MAX8903 is not set
> CONFIG_CHARGER_LP8727=m
> # CONFIG_CHARGER_GPIO is not set
> CONFIG_CHARGER_MANAGER=m
> CONFIG_CHARGER_LT3651=y
> # CONFIG_CHARGER_LTC4162L is not set
> # CONFIG_CHARGER_MAX14577 is not set
> # CONFIG_CHARGER_DETECTOR_MAX14656 is not set
> # CONFIG_CHARGER_MAX77976 is not set
> CONFIG_CHARGER_MT6360=m
> # CONFIG_CHARGER_BQ2415X is not set
> CONFIG_CHARGER_BQ24190=y
> CONFIG_CHARGER_BQ24257=y
> # CONFIG_CHARGER_BQ24735 is not set
> CONFIG_CHARGER_BQ2515X=m
> CONFIG_CHARGER_BQ25890=m
> # CONFIG_CHARGER_BQ25980 is not set
> CONFIG_CHARGER_BQ256XX=y
> CONFIG_CHARGER_RK817=y
> CONFIG_CHARGER_SMB347=y
> CONFIG_CHARGER_TPS65217=y
> # CONFIG_BATTERY_GAUGE_LTC2941 is not set
> # CONFIG_BATTERY_GOLDFISH is not set
> # CONFIG_BATTERY_RT5033 is not set
> # CONFIG_CHARGER_RT9455 is not set
> CONFIG_CHARGER_RT9467=m
> # CONFIG_CHARGER_RT9471 is not set
> CONFIG_CHARGER_UCS1002=y
> CONFIG_CHARGER_BD99954=m
> CONFIG_BATTERY_UG3105=y
> CONFIG_HWMON=m
> CONFIG_HWMON_VID=m
> CONFIG_HWMON_DEBUG_CHIP=y
> 
> #
> # Native drivers
> #
> CONFIG_SENSORS_SMPRO=m
> CONFIG_SENSORS_AD7314=m
> # CONFIG_SENSORS_AD7414 is not set
> CONFIG_SENSORS_AD7418=m
> CONFIG_SENSORS_ADM1025=m
> # CONFIG_SENSORS_ADM1026 is not set
> # CONFIG_SENSORS_ADM1029 is not set
> CONFIG_SENSORS_ADM1031=m
> CONFIG_SENSORS_ADM1177=m
> CONFIG_SENSORS_ADM9240=m
> # CONFIG_SENSORS_ADT7310 is not set
> # CONFIG_SENSORS_ADT7410 is not set
> CONFIG_SENSORS_ADT7411=m
> # CONFIG_SENSORS_ADT7462 is not set
> CONFIG_SENSORS_ADT7470=m
> CONFIG_SENSORS_ADT7475=m
> CONFIG_SENSORS_AHT10=m
> # CONFIG_SENSORS_AQUACOMPUTER_D5NEXT is not set
> CONFIG_SENSORS_AS370=m
> CONFIG_SENSORS_ASC7621=m
> CONFIG_SENSORS_AXI_FAN_CONTROL=m
> # CONFIG_SENSORS_K8TEMP is not set
> # CONFIG_SENSORS_APPLESMC is not set
> CONFIG_SENSORS_ASB100=m
> CONFIG_SENSORS_ATXP1=m
> # CONFIG_SENSORS_CORSAIR_CPRO is not set
> # CONFIG_SENSORS_CORSAIR_PSU is not set
> # CONFIG_SENSORS_DS620 is not set
> # CONFIG_SENSORS_DS1621 is not set
> CONFIG_SENSORS_DELL_SMM=m
> # CONFIG_I8K is not set
> CONFIG_SENSORS_DA9052_ADC=m
> CONFIG_SENSORS_DA9055=m
> # CONFIG_SENSORS_I5K_AMB is not set
> CONFIG_SENSORS_F71805F=m
> CONFIG_SENSORS_F71882FG=m
> CONFIG_SENSORS_F75375S=m
> CONFIG_SENSORS_GSC=m
> # CONFIG_SENSORS_MC13783_ADC is not set
> CONFIG_SENSORS_FSCHMD=m
> CONFIG_SENSORS_GL518SM=m
> CONFIG_SENSORS_GL520SM=m
> # CONFIG_SENSORS_G760A is not set
> CONFIG_SENSORS_G762=m
> # CONFIG_SENSORS_GPIO_FAN is not set
> CONFIG_SENSORS_HIH6130=m
> # CONFIG_SENSORS_IBMAEM is not set
> # CONFIG_SENSORS_IBMPEX is not set
> CONFIG_SENSORS_I5500=m
> # CONFIG_SENSORS_CORETEMP is not set
> CONFIG_SENSORS_IT87=m
> CONFIG_SENSORS_JC42=m
> CONFIG_SENSORS_POWR1220=m
> CONFIG_SENSORS_LINEAGE=m
> # CONFIG_SENSORS_LTC2945 is not set
> CONFIG_SENSORS_LTC2947=m
> CONFIG_SENSORS_LTC2947_I2C=m
> # CONFIG_SENSORS_LTC2947_SPI is not set
> CONFIG_SENSORS_LTC2990=m
> # CONFIG_SENSORS_LTC2992 is not set
> CONFIG_SENSORS_LTC4151=m
> CONFIG_SENSORS_LTC4215=m
> CONFIG_SENSORS_LTC4222=m
> # CONFIG_SENSORS_LTC4245 is not set
> # CONFIG_SENSORS_LTC4260 is not set
> CONFIG_SENSORS_LTC4261=m
> CONFIG_SENSORS_MAX1111=m
> CONFIG_SENSORS_MAX127=m
> # CONFIG_SENSORS_MAX16065 is not set
> CONFIG_SENSORS_MAX1619=m
> # CONFIG_SENSORS_MAX1668 is not set
> CONFIG_SENSORS_MAX197=m
> CONFIG_SENSORS_MAX31722=m
> CONFIG_SENSORS_MAX31730=m
> CONFIG_SENSORS_MAX31760=m
> CONFIG_SENSORS_MAX6620=m
> CONFIG_SENSORS_MAX6621=m
> CONFIG_SENSORS_MAX6639=m
> CONFIG_SENSORS_MAX6650=m
> CONFIG_SENSORS_MAX6697=m
> CONFIG_SENSORS_MAX31790=m
> CONFIG_SENSORS_MC34VR500=m
> # CONFIG_SENSORS_MCP3021 is not set
> # CONFIG_SENSORS_TC654 is not set
> # CONFIG_SENSORS_TPS23861 is not set
> # CONFIG_SENSORS_MR75203 is not set
> # CONFIG_SENSORS_ADCXX is not set
> CONFIG_SENSORS_LM63=m
> # CONFIG_SENSORS_LM70 is not set
> CONFIG_SENSORS_LM73=m
> CONFIG_SENSORS_LM75=m
> CONFIG_SENSORS_LM77=m
> CONFIG_SENSORS_LM78=m
> CONFIG_SENSORS_LM80=m
> CONFIG_SENSORS_LM83=m
> # CONFIG_SENSORS_LM85 is not set
> # CONFIG_SENSORS_LM87 is not set
> CONFIG_SENSORS_LM90=m
> CONFIG_SENSORS_LM92=m
> # CONFIG_SENSORS_LM93 is not set
> CONFIG_SENSORS_LM95234=m
> CONFIG_SENSORS_LM95241=m
> CONFIG_SENSORS_LM95245=m
> # CONFIG_SENSORS_PC87360 is not set
> CONFIG_SENSORS_PC87427=m
> CONFIG_SENSORS_NCT6683=m
> CONFIG_SENSORS_NCT6775_CORE=m
> # CONFIG_SENSORS_NCT6775 is not set
> CONFIG_SENSORS_NCT6775_I2C=m
> # CONFIG_SENSORS_NCT7802 is not set
> # CONFIG_SENSORS_NPCM7XX is not set
> # CONFIG_SENSORS_NZXT_KRAKEN2 is not set
> # CONFIG_SENSORS_NZXT_SMART2 is not set
> # CONFIG_SENSORS_OCC_P8_I2C is not set
> # CONFIG_SENSORS_OXP is not set
> CONFIG_SENSORS_PCF8591=m
> CONFIG_PMBUS=m
> # CONFIG_SENSORS_PMBUS is not set
> # CONFIG_SENSORS_ADM1266 is not set
> # CONFIG_SENSORS_ADM1275 is not set
> # CONFIG_SENSORS_BEL_PFE is not set
> # CONFIG_SENSORS_BPA_RS600 is not set
> # CONFIG_SENSORS_DELTA_AHE50DC_FAN is not set
> # CONFIG_SENSORS_FSP_3Y is not set
> CONFIG_SENSORS_IBM_CFFPS=m
> CONFIG_SENSORS_DPS920AB=m
> CONFIG_SENSORS_INSPUR_IPSPS=m
> # CONFIG_SENSORS_IR35221 is not set
> CONFIG_SENSORS_IR36021=m
> CONFIG_SENSORS_IR38064=m
> CONFIG_SENSORS_IR38064_REGULATOR=y
> # CONFIG_SENSORS_IRPS5401 is not set
> CONFIG_SENSORS_ISL68137=m
> CONFIG_SENSORS_LM25066=m
> # CONFIG_SENSORS_LM25066_REGULATOR is not set
> # CONFIG_SENSORS_LT7182S is not set
> CONFIG_SENSORS_LTC2978=m
> # CONFIG_SENSORS_LTC2978_REGULATOR is not set
> # CONFIG_SENSORS_LTC3815 is not set
> # CONFIG_SENSORS_MAX15301 is not set
> CONFIG_SENSORS_MAX16064=m
> # CONFIG_SENSORS_MAX16601 is not set
> CONFIG_SENSORS_MAX20730=m
> # CONFIG_SENSORS_MAX20751 is not set
> CONFIG_SENSORS_MAX31785=m
> CONFIG_SENSORS_MAX34440=m
> CONFIG_SENSORS_MAX8688=m
> # CONFIG_SENSORS_MP2888 is not set
> # CONFIG_SENSORS_MP2975 is not set
> CONFIG_SENSORS_MP5023=m
> CONFIG_SENSORS_MPQ7932_REGULATOR=y
> CONFIG_SENSORS_MPQ7932=m
> # CONFIG_SENSORS_PIM4328 is not set
> CONFIG_SENSORS_PLI1209BC=m
> # CONFIG_SENSORS_PLI1209BC_REGULATOR is not set
> CONFIG_SENSORS_PM6764TR=m
> # CONFIG_SENSORS_PXE1610 is not set
> # CONFIG_SENSORS_Q54SJ108A2 is not set
> # CONFIG_SENSORS_STPDDC60 is not set
> CONFIG_SENSORS_TDA38640=m
> # CONFIG_SENSORS_TDA38640_REGULATOR is not set
> CONFIG_SENSORS_TPS40422=m
> CONFIG_SENSORS_TPS53679=m
> CONFIG_SENSORS_TPS546D24=m
> CONFIG_SENSORS_UCD9000=m
> CONFIG_SENSORS_UCD9200=m
> # CONFIG_SENSORS_XDPE152 is not set
> # CONFIG_SENSORS_XDPE122 is not set
> CONFIG_SENSORS_ZL6100=m
> CONFIG_SENSORS_SBTSI=m
> # CONFIG_SENSORS_SBRMI is not set
> # CONFIG_SENSORS_SHT15 is not set
> CONFIG_SENSORS_SHT21=m
> CONFIG_SENSORS_SHT3x=m
> CONFIG_SENSORS_SHT4x=m
> CONFIG_SENSORS_SHTC1=m
> CONFIG_SENSORS_SIS5595=m
> CONFIG_SENSORS_SY7636A=m
> CONFIG_SENSORS_DME1737=m
> CONFIG_SENSORS_EMC1403=m
> CONFIG_SENSORS_EMC2103=m
> CONFIG_SENSORS_EMC2305=m
> CONFIG_SENSORS_EMC6W201=m
> CONFIG_SENSORS_SMSC47M1=m
> CONFIG_SENSORS_SMSC47M192=m
> CONFIG_SENSORS_SMSC47B397=m
> CONFIG_SENSORS_STTS751=m
> # CONFIG_SENSORS_SMM665 is not set
> # CONFIG_SENSORS_ADC128D818 is not set
> # CONFIG_SENSORS_ADS7828 is not set
> # CONFIG_SENSORS_ADS7871 is not set
> CONFIG_SENSORS_AMC6821=m
> # CONFIG_SENSORS_INA209 is not set
> CONFIG_SENSORS_INA2XX=m
> # CONFIG_SENSORS_INA238 is not set
> CONFIG_SENSORS_INA3221=m
> CONFIG_SENSORS_TC74=m
> CONFIG_SENSORS_THMC50=m
> # CONFIG_SENSORS_TMP102 is not set
> CONFIG_SENSORS_TMP103=m
> CONFIG_SENSORS_TMP108=m
> CONFIG_SENSORS_TMP401=m
> CONFIG_SENSORS_TMP421=m
> # CONFIG_SENSORS_TMP464 is not set
> CONFIG_SENSORS_TMP513=m
> CONFIG_SENSORS_VIA_CPUTEMP=m
> CONFIG_SENSORS_VIA686A=m
> # CONFIG_SENSORS_VT1211 is not set
> CONFIG_SENSORS_VT8231=m
> CONFIG_SENSORS_W83773G=m
> # CONFIG_SENSORS_W83781D is not set
> CONFIG_SENSORS_W83791D=m
> # CONFIG_SENSORS_W83792D is not set
> CONFIG_SENSORS_W83793=m
> CONFIG_SENSORS_W83795=m
> # CONFIG_SENSORS_W83795_FANCTRL is not set
> # CONFIG_SENSORS_W83L785TS is not set
> # CONFIG_SENSORS_W83L786NG is not set
> CONFIG_SENSORS_W83627HF=m
> CONFIG_SENSORS_W83627EHF=m
> CONFIG_SENSORS_WM831X=m
> # CONFIG_SENSORS_INTEL_M10_BMC_HWMON is not set
> 
> #
> # ACPI drivers
> #
> # CONFIG_SENSORS_ACPI_POWER is not set
> # CONFIG_SENSORS_ATK0110 is not set
> # CONFIG_SENSORS_ASUS_WMI is not set
> # CONFIG_SENSORS_ASUS_EC is not set
> CONFIG_THERMAL=y
> # CONFIG_THERMAL_NETLINK is not set
> # CONFIG_THERMAL_STATISTICS is not set
> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
> CONFIG_THERMAL_OF=y
> CONFIG_THERMAL_ACPI=y
> CONFIG_THERMAL_WRITABLE_TRIPS=y
> # CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
> CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE=y
> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> CONFIG_THERMAL_GOV_FAIR_SHARE=y
> # CONFIG_THERMAL_GOV_STEP_WISE is not set
> CONFIG_THERMAL_GOV_BANG_BANG=y
> CONFIG_THERMAL_GOV_USER_SPACE=y
> # CONFIG_CPU_THERMAL is not set
> CONFIG_THERMAL_EMULATION=y
> # CONFIG_THERMAL_MMIO is not set
> 
> #
> # Intel thermal drivers
> #
> # CONFIG_INTEL_POWERCLAMP is not set
> CONFIG_X86_THERMAL_VECTOR=y
> # CONFIG_X86_PKG_TEMP_THERMAL is not set
> # CONFIG_INTEL_SOC_DTS_THERMAL is not set
> 
> #
> # ACPI INT340X thermal drivers
> #
> # CONFIG_INT340X_THERMAL is not set
> # end of ACPI INT340X thermal drivers
> 
> CONFIG_INTEL_PCH_THERMAL=y
> # CONFIG_INTEL_TCC_COOLING is not set
> # CONFIG_INTEL_MENLOW is not set
> # CONFIG_INTEL_HFI_THERMAL is not set
> # end of Intel thermal drivers
> 
> # CONFIG_WATCHDOG is not set
> CONFIG_SSB_POSSIBLE=y
> CONFIG_SSB=m
> CONFIG_SSB_PCIHOST_POSSIBLE=y
> # CONFIG_SSB_PCIHOST is not set
> CONFIG_SSB_PCMCIAHOST_POSSIBLE=y
> # CONFIG_SSB_PCMCIAHOST is not set
> # CONFIG_SSB_DRIVER_GPIO is not set
> CONFIG_BCMA_POSSIBLE=y
> CONFIG_BCMA=m
> CONFIG_BCMA_HOST_PCI_POSSIBLE=y
> # CONFIG_BCMA_HOST_PCI is not set
> CONFIG_BCMA_HOST_SOC=y
> CONFIG_BCMA_DRIVER_PCI=y
> CONFIG_BCMA_SFLASH=y
> # CONFIG_BCMA_DRIVER_GMAC_CMN is not set
> CONFIG_BCMA_DRIVER_GPIO=y
> CONFIG_BCMA_DEBUG=y
> 
> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=y
> CONFIG_MFD_ACT8945A=y
> CONFIG_MFD_AS3711=y
> CONFIG_MFD_SMPRO=y
> CONFIG_MFD_AS3722=y
> # CONFIG_PMIC_ADP5520 is not set
> # CONFIG_MFD_AAT2870_CORE is not set
> CONFIG_MFD_ATMEL_FLEXCOM=m
> # CONFIG_MFD_ATMEL_HLCDC is not set
> CONFIG_MFD_BCM590XX=y
> CONFIG_MFD_BD9571MWV=y
> # CONFIG_MFD_AXP20X_I2C is not set
> CONFIG_MFD_MADERA=y
> CONFIG_MFD_MADERA_I2C=m
> CONFIG_MFD_MADERA_SPI=y
> # CONFIG_MFD_CS47L15 is not set
> CONFIG_MFD_CS47L35=y
> # CONFIG_MFD_CS47L85 is not set
> # CONFIG_MFD_CS47L90 is not set
> # CONFIG_MFD_CS47L92 is not set
> CONFIG_PMIC_DA903X=y
> CONFIG_PMIC_DA9052=y
> CONFIG_MFD_DA9052_SPI=y
> # CONFIG_MFD_DA9052_I2C is not set
> CONFIG_MFD_DA9055=y
> # CONFIG_MFD_DA9062 is not set
> CONFIG_MFD_DA9063=y
> CONFIG_MFD_DA9150=m
> CONFIG_MFD_DLN2=m
> CONFIG_MFD_GATEWORKS_GSC=m
> CONFIG_MFD_MC13XXX=y
> CONFIG_MFD_MC13XXX_SPI=y
> CONFIG_MFD_MC13XXX_I2C=m
> # CONFIG_MFD_MP2629 is not set
> # CONFIG_MFD_HI6421_PMIC is not set
> # CONFIG_MFD_HI6421_SPMI is not set
> # CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
> CONFIG_LPC_ICH=y
> CONFIG_LPC_SCH=y
> # CONFIG_INTEL_SOC_PMIC_MRFLD is not set
> CONFIG_MFD_INTEL_LPSS=y
> # CONFIG_MFD_INTEL_LPSS_ACPI is not set
> CONFIG_MFD_INTEL_LPSS_PCI=y
> # CONFIG_MFD_INTEL_PMC_BXT is not set
> # CONFIG_MFD_IQS62X is not set
> CONFIG_MFD_JANZ_CMODIO=m
> CONFIG_MFD_KEMPLD=y
> CONFIG_MFD_88PM800=y
> # CONFIG_MFD_88PM805 is not set
> CONFIG_MFD_88PM860X=y
> CONFIG_MFD_MAX14577=m
> # CONFIG_MFD_MAX77620 is not set
> # CONFIG_MFD_MAX77650 is not set
> CONFIG_MFD_MAX77686=m
> # CONFIG_MFD_MAX77693 is not set
> # CONFIG_MFD_MAX77714 is not set
> CONFIG_MFD_MAX77843=y
> # CONFIG_MFD_MAX8907 is not set
> CONFIG_MFD_MAX8925=y
> # CONFIG_MFD_MAX8997 is not set
> CONFIG_MFD_MAX8998=y
> CONFIG_MFD_MT6360=y
> CONFIG_MFD_MT6370=m
> # CONFIG_MFD_MT6397 is not set
> # CONFIG_MFD_MENF21BMC is not set
> CONFIG_MFD_OCELOT=m
> # CONFIG_EZX_PCAP is not set
> CONFIG_MFD_CPCAP=m
> # CONFIG_MFD_VIPERBOARD is not set
> CONFIG_MFD_NTXEC=y
> CONFIG_MFD_RETU=m
> # CONFIG_MFD_PCF50633 is not set
> CONFIG_MFD_SY7636A=y
> CONFIG_MFD_RDC321X=m
> CONFIG_MFD_RT4831=y
> CONFIG_MFD_RT5033=m
> # CONFIG_MFD_RT5120 is not set
> # CONFIG_MFD_RC5T583 is not set
> CONFIG_MFD_RK808=y
> # CONFIG_MFD_RN5T618 is not set
> CONFIG_MFD_SEC_CORE=m
> # CONFIG_MFD_SI476X_CORE is not set
> CONFIG_MFD_SIMPLE_MFD_I2C=y
> CONFIG_MFD_SM501=y
> CONFIG_MFD_SM501_GPIO=y
> CONFIG_MFD_SKY81452=m
> # CONFIG_MFD_STMPE is not set
> CONFIG_MFD_SYSCON=y
> CONFIG_MFD_TI_AM335X_TSCADC=y
> CONFIG_MFD_LP3943=y
> # CONFIG_MFD_LP8788 is not set
> CONFIG_MFD_TI_LMU=y
> CONFIG_MFD_PALMAS=y
> CONFIG_TPS6105X=y
> # CONFIG_TPS65010 is not set
> CONFIG_TPS6507X=m
> CONFIG_MFD_TPS65086=y
> # CONFIG_MFD_TPS65090 is not set
> CONFIG_MFD_TPS65217=y
> CONFIG_MFD_TI_LP873X=y
> CONFIG_MFD_TI_LP87565=y
> CONFIG_MFD_TPS65218=m
> # CONFIG_MFD_TPS65219 is not set
> # CONFIG_MFD_TPS6586X is not set
> CONFIG_MFD_TPS65910=y
> CONFIG_MFD_TPS65912=m
> CONFIG_MFD_TPS65912_I2C=m
> # CONFIG_MFD_TPS65912_SPI is not set
> CONFIG_TWL4030_CORE=y
> # CONFIG_MFD_TWL4030_AUDIO is not set
> # CONFIG_TWL6040_CORE is not set
> # CONFIG_MFD_WL1273_CORE is not set
> # CONFIG_MFD_LM3533 is not set
> CONFIG_MFD_TC3589X=y
> # CONFIG_MFD_TQMX86 is not set
> CONFIG_MFD_VX855=y
> # CONFIG_MFD_LOCHNAGAR is not set
> CONFIG_MFD_ARIZONA=y
> CONFIG_MFD_ARIZONA_I2C=m
> CONFIG_MFD_ARIZONA_SPI=y
> # CONFIG_MFD_CS47L24 is not set
> CONFIG_MFD_WM5102=y
> CONFIG_MFD_WM5110=y
> # CONFIG_MFD_WM8997 is not set
> # CONFIG_MFD_WM8998 is not set
> CONFIG_MFD_WM8400=y
> CONFIG_MFD_WM831X=y
> CONFIG_MFD_WM831X_I2C=y
> # CONFIG_MFD_WM831X_SPI is not set
> # CONFIG_MFD_WM8350_I2C is not set
> CONFIG_MFD_WM8994=y
> CONFIG_MFD_ROHM_BD718XX=y
> CONFIG_MFD_ROHM_BD71828=y
> CONFIG_MFD_ROHM_BD957XMUF=m
> # CONFIG_MFD_STPMIC1 is not set
> CONFIG_MFD_STMFX=y
> CONFIG_MFD_WCD934X=m
> CONFIG_MFD_ATC260X=m
> CONFIG_MFD_ATC260X_I2C=m
> CONFIG_MFD_QCOM_PM8008=y
> CONFIG_RAVE_SP_CORE=m
> CONFIG_MFD_INTEL_M10_BMC_CORE=m
> CONFIG_MFD_INTEL_M10_BMC_SPI=m
> CONFIG_MFD_RSMU_I2C=m
> CONFIG_MFD_RSMU_SPI=y
> # end of Multifunction device drivers
> 
> CONFIG_REGULATOR=y
> # CONFIG_REGULATOR_DEBUG is not set
> CONFIG_REGULATOR_FIXED_VOLTAGE=y
> # CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
> # CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
> CONFIG_REGULATOR_88PG86X=y
> CONFIG_REGULATOR_88PM800=y
> CONFIG_REGULATOR_88PM8607=m
> CONFIG_REGULATOR_ACT8865=y
> CONFIG_REGULATOR_ACT8945A=m
> CONFIG_REGULATOR_AD5398=y
> CONFIG_REGULATOR_AS3711=m
> # CONFIG_REGULATOR_AS3722 is not set
> CONFIG_REGULATOR_ATC260X=m
> CONFIG_REGULATOR_BCM590XX=m
> CONFIG_REGULATOR_BD71815=m
> # CONFIG_REGULATOR_BD71828 is not set
> CONFIG_REGULATOR_BD718XX=y
> # CONFIG_REGULATOR_BD9571MWV is not set
> CONFIG_REGULATOR_BD957XMUF=m
> CONFIG_REGULATOR_CPCAP=m
> # CONFIG_REGULATOR_DA903X is not set
> # CONFIG_REGULATOR_DA9052 is not set
> CONFIG_REGULATOR_DA9055=y
> CONFIG_REGULATOR_DA9063=y
> # CONFIG_REGULATOR_DA9121 is not set
> CONFIG_REGULATOR_DA9210=y
> CONFIG_REGULATOR_DA9211=y
> CONFIG_REGULATOR_FAN53555=m
> # CONFIG_REGULATOR_FAN53880 is not set
> # CONFIG_REGULATOR_GPIO is not set
> CONFIG_REGULATOR_ISL9305=y
> CONFIG_REGULATOR_ISL6271A=m
> # CONFIG_REGULATOR_LM363X is not set
> CONFIG_REGULATOR_LP3971=y
> # CONFIG_REGULATOR_LP3972 is not set
> # CONFIG_REGULATOR_LP872X is not set
> CONFIG_REGULATOR_LP873X=y
> CONFIG_REGULATOR_LP8755=m
> # CONFIG_REGULATOR_LP87565 is not set
> CONFIG_REGULATOR_LTC3589=m
> CONFIG_REGULATOR_LTC3676=m
> CONFIG_REGULATOR_MAX14577=m
> # CONFIG_REGULATOR_MAX1586 is not set
> CONFIG_REGULATOR_MAX8649=y
> CONFIG_REGULATOR_MAX8660=y
> CONFIG_REGULATOR_MAX8893=y
> # CONFIG_REGULATOR_MAX8925 is not set
> CONFIG_REGULATOR_MAX8952=m
> CONFIG_REGULATOR_MAX8973=m
> # CONFIG_REGULATOR_MAX8998 is not set
> # CONFIG_REGULATOR_MAX20086 is not set
> # CONFIG_REGULATOR_MAX20411 is not set
> CONFIG_REGULATOR_MAX77686=m
> # CONFIG_REGULATOR_MAX77693 is not set
> # CONFIG_REGULATOR_MAX77802 is not set
> CONFIG_REGULATOR_MAX77826=y
> CONFIG_REGULATOR_MC13XXX_CORE=y
> CONFIG_REGULATOR_MC13783=y
> CONFIG_REGULATOR_MC13892=y
> CONFIG_REGULATOR_MCP16502=y
> # CONFIG_REGULATOR_MP5416 is not set
> CONFIG_REGULATOR_MP8859=m
> # CONFIG_REGULATOR_MP886X is not set
> CONFIG_REGULATOR_MPQ7920=m
> # CONFIG_REGULATOR_MT6311 is not set
> CONFIG_REGULATOR_MT6315=m
> CONFIG_REGULATOR_MT6360=m
> CONFIG_REGULATOR_MT6370=m
> # CONFIG_REGULATOR_PALMAS is not set
> CONFIG_REGULATOR_PCA9450=m
> CONFIG_REGULATOR_PF8X00=m
> CONFIG_REGULATOR_PFUZE100=m
> # CONFIG_REGULATOR_PV88060 is not set
> CONFIG_REGULATOR_PV88080=y
> # CONFIG_REGULATOR_PV88090 is not set
> CONFIG_REGULATOR_QCOM_SPMI=m
> CONFIG_REGULATOR_QCOM_USB_VBUS=m
> CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY=m
> # CONFIG_REGULATOR_RK808 is not set
> CONFIG_REGULATOR_ROHM=y
> CONFIG_REGULATOR_RT4801=m
> # CONFIG_REGULATOR_RT4831 is not set
> # CONFIG_REGULATOR_RT5033 is not set
> # CONFIG_REGULATOR_RT5190A is not set
> CONFIG_REGULATOR_RT5759=m
> CONFIG_REGULATOR_RT6160=y
> CONFIG_REGULATOR_RT6190=y
> CONFIG_REGULATOR_RT6245=y
> # CONFIG_REGULATOR_RTQ2134 is not set
> # CONFIG_REGULATOR_RTMV20 is not set
> CONFIG_REGULATOR_RTQ6752=y
> CONFIG_REGULATOR_S2MPA01=m
> CONFIG_REGULATOR_S2MPS11=m
> CONFIG_REGULATOR_S5M8767=m
> CONFIG_REGULATOR_SKY81452=m
> # CONFIG_REGULATOR_SLG51000 is not set
> # CONFIG_REGULATOR_SY7636A is not set
> CONFIG_REGULATOR_SY8106A=m
> # CONFIG_REGULATOR_SY8824X is not set
> CONFIG_REGULATOR_SY8827N=m
> # CONFIG_REGULATOR_TPS51632 is not set
> CONFIG_REGULATOR_TPS6105X=y
> # CONFIG_REGULATOR_TPS62360 is not set
> # CONFIG_REGULATOR_TPS6286X is not set
> # CONFIG_REGULATOR_TPS65023 is not set
> CONFIG_REGULATOR_TPS6507X=y
> # CONFIG_REGULATOR_TPS65086 is not set
> # CONFIG_REGULATOR_TPS65132 is not set
> # CONFIG_REGULATOR_TPS65217 is not set
> CONFIG_REGULATOR_TPS65218=m
> # CONFIG_REGULATOR_TPS6524X is not set
> CONFIG_REGULATOR_TPS65910=y
> CONFIG_REGULATOR_TPS65912=m
> CONFIG_REGULATOR_TWL4030=y
> CONFIG_REGULATOR_VCTRL=m
> CONFIG_REGULATOR_WM831X=m
> # CONFIG_REGULATOR_WM8400 is not set
> # CONFIG_REGULATOR_WM8994 is not set
> CONFIG_REGULATOR_QCOM_LABIBB=m
> # CONFIG_RC_CORE is not set
> CONFIG_CEC_CORE=m
> CONFIG_CEC_NOTIFIER=y
> 
> #
> # CEC support
> #
> # CONFIG_MEDIA_CEC_SUPPORT is not set
> # end of CEC support
> 
> CONFIG_MEDIA_SUPPORT=y
> # CONFIG_MEDIA_SUPPORT_FILTER is not set
> # CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
> 
> #
> # Media device types
> #
> CONFIG_MEDIA_CAMERA_SUPPORT=y
> CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
> CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
> CONFIG_MEDIA_RADIO_SUPPORT=y
> CONFIG_MEDIA_SDR_SUPPORT=y
> CONFIG_MEDIA_PLATFORM_SUPPORT=y
> CONFIG_MEDIA_TEST_SUPPORT=y
> # end of Media device types
> 
> #
> # Media core support
> #
> CONFIG_VIDEO_DEV=m
> CONFIG_MEDIA_CONTROLLER=y
> CONFIG_DVB_CORE=m
> # end of Media core support
> 
> #
> # Video4Linux options
> #
> CONFIG_VIDEO_V4L2_I2C=y
> CONFIG_VIDEO_V4L2_SUBDEV_API=y
> CONFIG_VIDEO_ADV_DEBUG=y
> # CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
> CONFIG_VIDEO_TUNER=m
> CONFIG_V4L2_FWNODE=m
> CONFIG_V4L2_ASYNC=m
> # end of Video4Linux options
> 
> #
> # Media controller options
> #
> CONFIG_MEDIA_CONTROLLER_DVB=y
> # end of Media controller options
> 
> #
> # Digital TV options
> #
> CONFIG_DVB_MMAP=y
> CONFIG_DVB_NET=y
> CONFIG_DVB_MAX_ADAPTERS=16
> # CONFIG_DVB_DYNAMIC_MINORS is not set
> CONFIG_DVB_DEMUX_SECTION_LOSS_LOG=y
> CONFIG_DVB_ULE_DEBUG=y
> # end of Digital TV options
> 
> #
> # Media drivers
> #
> 
> #
> # Media drivers
> #
> CONFIG_MEDIA_USB_SUPPORT=y
> 
> #
> # Webcam devices
> #
> CONFIG_USB_GSPCA=m
> CONFIG_USB_GSPCA_BENQ=m
> # CONFIG_USB_GSPCA_CONEX is not set
> # CONFIG_USB_GSPCA_CPIA1 is not set
> CONFIG_USB_GSPCA_DTCS033=m
> CONFIG_USB_GSPCA_ETOMS=m
> # CONFIG_USB_GSPCA_FINEPIX is not set
> CONFIG_USB_GSPCA_JEILINJ=m
> CONFIG_USB_GSPCA_JL2005BCD=m
> CONFIG_USB_GSPCA_KINECT=m
> CONFIG_USB_GSPCA_KONICA=m
> CONFIG_USB_GSPCA_MARS=m
> CONFIG_USB_GSPCA_MR97310A=m
> CONFIG_USB_GSPCA_NW80X=m
> CONFIG_USB_GSPCA_OV519=m
> # CONFIG_USB_GSPCA_OV534 is not set
> CONFIG_USB_GSPCA_OV534_9=m
> CONFIG_USB_GSPCA_PAC207=m
> # CONFIG_USB_GSPCA_PAC7302 is not set
> CONFIG_USB_GSPCA_PAC7311=m
> CONFIG_USB_GSPCA_SE401=m
> # CONFIG_USB_GSPCA_SN9C2028 is not set
> CONFIG_USB_GSPCA_SN9C20X=m
> # CONFIG_USB_GSPCA_SONIXB is not set
> # CONFIG_USB_GSPCA_SONIXJ is not set
> CONFIG_USB_GSPCA_SPCA1528=m
> CONFIG_USB_GSPCA_SPCA500=m
> CONFIG_USB_GSPCA_SPCA501=m
> # CONFIG_USB_GSPCA_SPCA505 is not set
> CONFIG_USB_GSPCA_SPCA506=m
> CONFIG_USB_GSPCA_SPCA508=m
> # CONFIG_USB_GSPCA_SPCA561 is not set
> CONFIG_USB_GSPCA_SQ905=m
> # CONFIG_USB_GSPCA_SQ905C is not set
> CONFIG_USB_GSPCA_SQ930X=m
> # CONFIG_USB_GSPCA_STK014 is not set
> CONFIG_USB_GSPCA_STK1135=m
> CONFIG_USB_GSPCA_STV0680=m
> CONFIG_USB_GSPCA_SUNPLUS=m
> CONFIG_USB_GSPCA_T613=m
> CONFIG_USB_GSPCA_TOPRO=m
> CONFIG_USB_GSPCA_TOUPTEK=m
> CONFIG_USB_GSPCA_TV8532=m
> CONFIG_USB_GSPCA_VC032X=m
> # CONFIG_USB_GSPCA_VICAM is not set
> CONFIG_USB_GSPCA_XIRLINK_CIT=m
> # CONFIG_USB_GSPCA_ZC3XX is not set
> # CONFIG_USB_GL860 is not set
> CONFIG_USB_M5602=m
> # CONFIG_USB_STV06XX is not set
> CONFIG_USB_PWC=m
> # CONFIG_USB_PWC_DEBUG is not set
> CONFIG_USB_PWC_INPUT_EVDEV=y
> CONFIG_USB_S2255=m
> CONFIG_USB_VIDEO_CLASS=m
> CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV=y
> 
> #
> # Analog TV USB devices
> #
> # CONFIG_VIDEO_HDPVR is not set
> CONFIG_VIDEO_PVRUSB2=m
> CONFIG_VIDEO_PVRUSB2_SYSFS=y
> CONFIG_VIDEO_PVRUSB2_DVB=y
> CONFIG_VIDEO_PVRUSB2_DEBUGIFC=y
> CONFIG_VIDEO_STK1160_COMMON=m
> CONFIG_VIDEO_STK1160=m
> 
> #
> # Analog/digital TV USB devices
> #
> # CONFIG_VIDEO_AU0828 is not set
> CONFIG_VIDEO_CX231XX=m
> CONFIG_VIDEO_CX231XX_DVB=m
> 
> #
> # Digital TV USB devices
> #
> # CONFIG_DVB_AS102 is not set
> CONFIG_DVB_B2C2_FLEXCOP_USB=m
> # CONFIG_DVB_B2C2_FLEXCOP_USB_DEBUG is not set
> CONFIG_DVB_USB_V2=m
> CONFIG_DVB_USB_AF9015=m
> # CONFIG_DVB_USB_AF9035 is not set
> # CONFIG_DVB_USB_ANYSEE is not set
> CONFIG_DVB_USB_AU6610=m
> CONFIG_DVB_USB_AZ6007=m
> CONFIG_DVB_USB_CE6230=m
> CONFIG_DVB_USB_DVBSKY=m
> CONFIG_DVB_USB_EC168=m
> CONFIG_DVB_USB_GL861=m
> CONFIG_DVB_USB_MXL111SF=m
> # CONFIG_DVB_USB_RTL28XXU is not set
> CONFIG_DVB_USB_ZD1301=m
> CONFIG_SMS_USB_DRV=m
> CONFIG_DVB_TTUSB_BUDGET=m
> # CONFIG_DVB_TTUSB_DEC is not set
> 
> #
> # Webcam, TV (analog/digital) USB devices
> #
> CONFIG_VIDEO_EM28XX=m
> # CONFIG_VIDEO_EM28XX_V4L2 is not set
> CONFIG_VIDEO_EM28XX_DVB=m
> 
> #
> # Software defined radio USB devices
> #
> CONFIG_USB_AIRSPY=m
> CONFIG_USB_HACKRF=m
> CONFIG_USB_MSI2500=m
> # CONFIG_MEDIA_PCI_SUPPORT is not set
> # CONFIG_RADIO_ADAPTERS is not set
> CONFIG_MEDIA_PLATFORM_DRIVERS=y
> # CONFIG_V4L_PLATFORM_DRIVERS is not set
> CONFIG_SDR_PLATFORM_DRIVERS=y
> CONFIG_DVB_PLATFORM_DRIVERS=y
> # CONFIG_V4L_MEM2MEM_DRIVERS is not set
> 
> #
> # Allegro DVT media platform drivers
> #
> 
> #
> # Amlogic media platform drivers
> #
> 
> #
> # Amphion drivers
> #
> 
> #
> # Aspeed media platform drivers
> #
> 
> #
> # Atmel media platform drivers
> #
> 
> #
> # Cadence media platform drivers
> #
> CONFIG_VIDEO_CADENCE_CSI2RX=m
> # CONFIG_VIDEO_CADENCE_CSI2TX is not set
> 
> #
> # Chips&Media media platform drivers
> #
> 
> #
> # Intel media platform drivers
> #
> 
> #
> # Marvell media platform drivers
> #
> 
> #
> # Mediatek media platform drivers
> #
> 
> #
> # Microchip Technology, Inc. media platform drivers
> #
> 
> #
> # NVidia media platform drivers
> #
> 
> #
> # NXP media platform drivers
> #
> 
> #
> # Qualcomm media platform drivers
> #
> 
> #
> # Renesas media platform drivers
> #
> 
> #
> # Rockchip media platform drivers
> #
> 
> #
> # Samsung media platform drivers
> #
> 
> #
> # STMicroelectronics media platform drivers
> #
> 
> #
> # Sunxi media platform drivers
> #
> 
> #
> # Texas Instruments drivers
> #
> 
> #
> # Verisilicon media platform drivers
> #
> 
> #
> # VIA media platform drivers
> #
> 
> #
> # Xilinx media platform drivers
> #
> # CONFIG_V4L_TEST_DRIVERS is not set
> # CONFIG_DVB_TEST_DRIVERS is not set
> CONFIG_MEDIA_COMMON_OPTIONS=y
> 
> #
> # common driver options
> #
> CONFIG_CYPRESS_FIRMWARE=m
> CONFIG_UVC_COMMON=m
> CONFIG_VIDEO_CX2341X=m
> CONFIG_VIDEO_TVEEPROM=m
> CONFIG_DVB_B2C2_FLEXCOP=m
> CONFIG_SMS_SIANO_MDTV=m
> CONFIG_VIDEOBUF2_CORE=m
> CONFIG_VIDEOBUF2_V4L2=m
> CONFIG_VIDEOBUF2_MEMOPS=m
> CONFIG_VIDEOBUF2_VMALLOC=m
> # end of Media drivers
> 
> #
> # Media ancillary drivers
> #
> CONFIG_MEDIA_ATTACH=y
> 
> #
> # Camera sensor devices
> #
> CONFIG_VIDEO_APTINA_PLL=m
> CONFIG_VIDEO_CCS_PLL=m
> CONFIG_VIDEO_AR0521=m
> CONFIG_VIDEO_HI556=m
> CONFIG_VIDEO_HI846=m
> CONFIG_VIDEO_HI847=m
> CONFIG_VIDEO_IMX208=m
> # CONFIG_VIDEO_IMX214 is not set
> CONFIG_VIDEO_IMX219=m
> CONFIG_VIDEO_IMX258=m
> CONFIG_VIDEO_IMX274=m
> CONFIG_VIDEO_IMX290=m
> CONFIG_VIDEO_IMX296=m
> CONFIG_VIDEO_IMX319=m
> # CONFIG_VIDEO_IMX334 is not set
> # CONFIG_VIDEO_IMX335 is not set
> CONFIG_VIDEO_IMX355=m
> CONFIG_VIDEO_IMX412=m
> CONFIG_VIDEO_IMX415=m
> CONFIG_VIDEO_MT9M001=m
> # CONFIG_VIDEO_MT9M032 is not set
> # CONFIG_VIDEO_MT9M111 is not set
> CONFIG_VIDEO_MT9P031=m
> # CONFIG_VIDEO_MT9T001 is not set
> CONFIG_VIDEO_MT9T112=m
> # CONFIG_VIDEO_MT9V011 is not set
> CONFIG_VIDEO_MT9V032=m
> CONFIG_VIDEO_MT9V111=m
> # CONFIG_VIDEO_NOON010PC30 is not set
> CONFIG_VIDEO_OG01A1B=m
> CONFIG_VIDEO_OV02A10=m
> # CONFIG_VIDEO_OV08D10 is not set
> CONFIG_VIDEO_OV08X40=m
> CONFIG_VIDEO_OV13858=m
> # CONFIG_VIDEO_OV13B10 is not set
> # CONFIG_VIDEO_OV2640 is not set
> CONFIG_VIDEO_OV2659=m
> CONFIG_VIDEO_OV2680=m
> CONFIG_VIDEO_OV2685=m
> # CONFIG_VIDEO_OV2740 is not set
> CONFIG_VIDEO_OV4689=m
> CONFIG_VIDEO_OV5640=m
> CONFIG_VIDEO_OV5645=m
> CONFIG_VIDEO_OV5647=m
> # CONFIG_VIDEO_OV5670 is not set
> # CONFIG_VIDEO_OV5675 is not set
> CONFIG_VIDEO_OV5693=m
> CONFIG_VIDEO_OV5695=m
> CONFIG_VIDEO_OV6650=m
> CONFIG_VIDEO_OV7251=m
> CONFIG_VIDEO_OV7640=m
> # CONFIG_VIDEO_OV7670 is not set
> CONFIG_VIDEO_OV772X=m
> # CONFIG_VIDEO_OV7740 is not set
> CONFIG_VIDEO_OV8856=m
> # CONFIG_VIDEO_OV9282 is not set
> CONFIG_VIDEO_OV9640=m
> CONFIG_VIDEO_OV9650=m
> # CONFIG_VIDEO_OV9734 is not set
> # CONFIG_VIDEO_RDACM20 is not set
> # CONFIG_VIDEO_RDACM21 is not set
> # CONFIG_VIDEO_RJ54N1 is not set
> CONFIG_VIDEO_S5C73M3=m
> CONFIG_VIDEO_S5K5BAF=m
> # CONFIG_VIDEO_S5K6A3 is not set
> # CONFIG_VIDEO_S5K6AA is not set
> # CONFIG_VIDEO_SR030PC30 is not set
> CONFIG_VIDEO_ST_VGXY61=m
> # CONFIG_VIDEO_VS6624 is not set
> CONFIG_VIDEO_CCS=m
> # CONFIG_VIDEO_ET8EK8 is not set
> # CONFIG_VIDEO_M5MOLS is not set
> # end of Camera sensor devices
> 
> #
> # Lens drivers
> #
> # CONFIG_VIDEO_AD5820 is not set
> CONFIG_VIDEO_AK7375=m
> # CONFIG_VIDEO_DW9714 is not set
> CONFIG_VIDEO_DW9768=m
> CONFIG_VIDEO_DW9807_VCM=m
> # end of Lens drivers
> 
> #
> # Flash devices
> #
> CONFIG_VIDEO_ADP1653=m
> CONFIG_VIDEO_LM3560=m
> CONFIG_VIDEO_LM3646=m
> # end of Flash devices
> 
> #
> # Audio decoders, processors and mixers
> #
> CONFIG_VIDEO_CS3308=m
> CONFIG_VIDEO_CS5345=m
> CONFIG_VIDEO_CS53L32A=m
> CONFIG_VIDEO_MSP3400=m
> CONFIG_VIDEO_SONY_BTF_MPX=m
> CONFIG_VIDEO_TDA7432=m
> # CONFIG_VIDEO_TDA9840 is not set
> CONFIG_VIDEO_TEA6415C=m
> # CONFIG_VIDEO_TEA6420 is not set
> CONFIG_VIDEO_TLV320AIC23B=m
> CONFIG_VIDEO_TVAUDIO=m
> CONFIG_VIDEO_UDA1342=m
> CONFIG_VIDEO_VP27SMPX=m
> # CONFIG_VIDEO_WM8739 is not set
> CONFIG_VIDEO_WM8775=m
> # end of Audio decoders, processors and mixers
> 
> #
> # RDS decoders
> #
> # CONFIG_VIDEO_SAA6588 is not set
> # end of RDS decoders
> 
> #
> # Video decoders
> #
> CONFIG_VIDEO_ADV7180=m
> CONFIG_VIDEO_ADV7183=m
> CONFIG_VIDEO_ADV748X=m
> CONFIG_VIDEO_ADV7604=m
> CONFIG_VIDEO_ADV7604_CEC=y
> CONFIG_VIDEO_ADV7842=m
> CONFIG_VIDEO_ADV7842_CEC=y
> CONFIG_VIDEO_BT819=m
> CONFIG_VIDEO_BT856=m
> CONFIG_VIDEO_BT866=m
> CONFIG_VIDEO_ISL7998X=m
> # CONFIG_VIDEO_KS0127 is not set
> CONFIG_VIDEO_MAX9286=m
> CONFIG_VIDEO_ML86V7667=m
> CONFIG_VIDEO_SAA7110=m
> CONFIG_VIDEO_SAA711X=m
> CONFIG_VIDEO_TC358743=m
> # CONFIG_VIDEO_TC358743_CEC is not set
> CONFIG_VIDEO_TVP514X=m
> CONFIG_VIDEO_TVP5150=m
> CONFIG_VIDEO_TVP7002=m
> CONFIG_VIDEO_TW2804=m
> CONFIG_VIDEO_TW9903=m
> CONFIG_VIDEO_TW9906=m
> # CONFIG_VIDEO_TW9910 is not set
> CONFIG_VIDEO_VPX3220=m
> 
> #
> # Video and audio decoders
> #
> CONFIG_VIDEO_SAA717X=m
> CONFIG_VIDEO_CX25840=m
> # end of Video decoders
> 
> #
> # Video encoders
> #
> # CONFIG_VIDEO_AD9389B is not set
> # CONFIG_VIDEO_ADV7170 is not set
> # CONFIG_VIDEO_ADV7175 is not set
> CONFIG_VIDEO_ADV7343=m
> # CONFIG_VIDEO_ADV7393 is not set
> CONFIG_VIDEO_AK881X=m
> CONFIG_VIDEO_SAA7127=m
> CONFIG_VIDEO_SAA7185=m
> CONFIG_VIDEO_THS8200=m
> # end of Video encoders
> 
> #
> # Video improvement chips
> #
> CONFIG_VIDEO_UPD64031A=m
> # CONFIG_VIDEO_UPD64083 is not set
> # end of Video improvement chips
> 
> #
> # Audio/Video compression chips
> #
> # CONFIG_VIDEO_SAA6752HS is not set
> # end of Audio/Video compression chips
> 
> #
> # SDR tuner chips
> #
> # CONFIG_SDR_MAX2175 is not set
> # end of SDR tuner chips
> 
> #
> # Miscellaneous helper chips
> #
> CONFIG_VIDEO_I2C=m
> # CONFIG_VIDEO_M52790 is not set
> # CONFIG_VIDEO_ST_MIPID02 is not set
> # CONFIG_VIDEO_THS7303 is not set
> # end of Miscellaneous helper chips
> 
> #
> # Media SPI Adapters
> #
> CONFIG_CXD2880_SPI_DRV=m
> CONFIG_VIDEO_GS1662=m
> # end of Media SPI Adapters
> 
> CONFIG_MEDIA_TUNER=y
> 
> #
> # Customize TV tuners
> #
> CONFIG_MEDIA_TUNER_E4000=m
> # CONFIG_MEDIA_TUNER_FC0011 is not set
> CONFIG_MEDIA_TUNER_FC0012=m
> CONFIG_MEDIA_TUNER_FC0013=y
> # CONFIG_MEDIA_TUNER_FC2580 is not set
> CONFIG_MEDIA_TUNER_IT913X=y
> CONFIG_MEDIA_TUNER_M88RS6000T=m
> CONFIG_MEDIA_TUNER_MAX2165=m
> # CONFIG_MEDIA_TUNER_MC44S803 is not set
> CONFIG_MEDIA_TUNER_MSI001=m
> # CONFIG_MEDIA_TUNER_MT2060 is not set
> CONFIG_MEDIA_TUNER_MT2063=m
> CONFIG_MEDIA_TUNER_MT20XX=y
> CONFIG_MEDIA_TUNER_MT2131=y
> CONFIG_MEDIA_TUNER_MT2266=m
> CONFIG_MEDIA_TUNER_MXL301RF=y
> CONFIG_MEDIA_TUNER_MXL5005S=m
> # CONFIG_MEDIA_TUNER_MXL5007T is not set
> # CONFIG_MEDIA_TUNER_QM1D1B0004 is not set
> # CONFIG_MEDIA_TUNER_QM1D1C0042 is not set
> CONFIG_MEDIA_TUNER_QT1010=y
> CONFIG_MEDIA_TUNER_R820T=y
> # CONFIG_MEDIA_TUNER_SI2157 is not set
> CONFIG_MEDIA_TUNER_SIMPLE=m
> # CONFIG_MEDIA_TUNER_TDA18212 is not set
> # CONFIG_MEDIA_TUNER_TDA18218 is not set
> CONFIG_MEDIA_TUNER_TDA18250=m
> CONFIG_MEDIA_TUNER_TDA18271=m
> CONFIG_MEDIA_TUNER_TDA827X=m
> CONFIG_MEDIA_TUNER_TDA8290=m
> CONFIG_MEDIA_TUNER_TDA9887=m
> # CONFIG_MEDIA_TUNER_TEA5761 is not set
> CONFIG_MEDIA_TUNER_TEA5767=y
> # CONFIG_MEDIA_TUNER_TUA9001 is not set
> CONFIG_MEDIA_TUNER_XC2028=y
> # CONFIG_MEDIA_TUNER_XC4000 is not set
> # CONFIG_MEDIA_TUNER_XC5000 is not set
> # end of Customize TV tuners
> 
> #
> # Customise DVB Frontends
> #
> 
> #
> # Multistandard (satellite) frontends
> #
> CONFIG_DVB_M88DS3103=m
> CONFIG_DVB_MXL5XX=m
> # CONFIG_DVB_STB0899 is not set
> CONFIG_DVB_STB6100=m
> # CONFIG_DVB_STV090x is not set
> CONFIG_DVB_STV0910=m
> CONFIG_DVB_STV6110x=m
> CONFIG_DVB_STV6111=m
> 
> #
> # Multistandard (cable + terrestrial) frontends
> #
> CONFIG_DVB_DRXK=m
> CONFIG_DVB_MN88472=m
> CONFIG_DVB_MN88473=m
> CONFIG_DVB_SI2165=m
> CONFIG_DVB_TDA18271C2DD=m
> 
> #
> # DVB-S (satellite) frontends
> #
> # CONFIG_DVB_CX24110 is not set
> CONFIG_DVB_CX24116=m
> CONFIG_DVB_CX24117=m
> CONFIG_DVB_CX24120=m
> CONFIG_DVB_CX24123=m
> CONFIG_DVB_DS3000=m
> CONFIG_DVB_MB86A16=m
> CONFIG_DVB_MT312=m
> CONFIG_DVB_S5H1420=m
> # CONFIG_DVB_SI21XX is not set
> CONFIG_DVB_STB6000=m
> CONFIG_DVB_STV0288=m
> CONFIG_DVB_STV0299=m
> CONFIG_DVB_STV0900=m
> CONFIG_DVB_STV6110=m
> # CONFIG_DVB_TDA10071 is not set
> CONFIG_DVB_TDA10086=m
> # CONFIG_DVB_TDA8083 is not set
> # CONFIG_DVB_TDA8261 is not set
> CONFIG_DVB_TDA826X=m
> CONFIG_DVB_TS2020=m
> CONFIG_DVB_TUA6100=m
> CONFIG_DVB_TUNER_CX24113=m
> CONFIG_DVB_TUNER_ITD1000=m
> # CONFIG_DVB_VES1X93 is not set
> CONFIG_DVB_ZL10036=m
> CONFIG_DVB_ZL10039=m
> 
> #
> # DVB-T (terrestrial) frontends
> #
> CONFIG_DVB_AF9013=m
> # CONFIG_DVB_CX22700 is not set
> CONFIG_DVB_CX22702=m
> # CONFIG_DVB_CXD2820R is not set
> # CONFIG_DVB_CXD2841ER is not set
> CONFIG_DVB_DIB3000MB=m
> CONFIG_DVB_DIB3000MC=m
> # CONFIG_DVB_DIB7000M is not set
> # CONFIG_DVB_DIB7000P is not set
> CONFIG_DVB_DIB9000=m
> # CONFIG_DVB_DRXD is not set
> CONFIG_DVB_EC100=m
> CONFIG_DVB_L64781=m
> CONFIG_DVB_MT352=m
> CONFIG_DVB_NXT6000=m
> # CONFIG_DVB_RTL2830 is not set
> CONFIG_DVB_RTL2832=m
> CONFIG_DVB_RTL2832_SDR=m
> CONFIG_DVB_S5H1432=m
> CONFIG_DVB_SI2168=m
> CONFIG_DVB_SP887X=m
> CONFIG_DVB_STV0367=m
> CONFIG_DVB_TDA10048=m
> CONFIG_DVB_TDA1004X=m
> CONFIG_DVB_ZD1301_DEMOD=m
> CONFIG_DVB_ZL10353=m
> CONFIG_DVB_CXD2880=m
> 
> #
> # DVB-C (cable) frontends
> #
> CONFIG_DVB_STV0297=m
> CONFIG_DVB_TDA10021=m
> CONFIG_DVB_TDA10023=m
> CONFIG_DVB_VES1820=m
> 
> #
> # ATSC (North American/Korean Terrestrial/Cable DTV) frontends
> #
> CONFIG_DVB_AU8522=m
> CONFIG_DVB_AU8522_DTV=m
> CONFIG_DVB_AU8522_V4L=m
> CONFIG_DVB_BCM3510=m
> # CONFIG_DVB_LG2160 is not set
> # CONFIG_DVB_LGDT3305 is not set
> CONFIG_DVB_LGDT3306A=m
> # CONFIG_DVB_LGDT330X is not set
> CONFIG_DVB_MXL692=m
> CONFIG_DVB_NXT200X=m
> CONFIG_DVB_OR51132=m
> CONFIG_DVB_OR51211=m
> CONFIG_DVB_S5H1409=m
> # CONFIG_DVB_S5H1411 is not set
> 
> #
> # ISDB-T (terrestrial) frontends
> #
> CONFIG_DVB_DIB8000=m
> # CONFIG_DVB_MB86A20S is not set
> CONFIG_DVB_S921=m
> 
> #
> # ISDB-S (satellite) & ISDB-T (terrestrial) frontends
> #
> CONFIG_DVB_MN88443X=m
> CONFIG_DVB_TC90522=m
> 
> #
> # Digital terrestrial only tuners/PLL
> #
> CONFIG_DVB_PLL=m
> CONFIG_DVB_TUNER_DIB0070=m
> CONFIG_DVB_TUNER_DIB0090=m
> 
> #
> # SEC control devices for DVB-S
> #
> CONFIG_DVB_A8293=m
> CONFIG_DVB_AF9033=m
> CONFIG_DVB_ASCOT2E=m
> CONFIG_DVB_ATBM8830=m
> CONFIG_DVB_HELENE=m
> # CONFIG_DVB_HORUS3A is not set
> CONFIG_DVB_ISL6405=m
> # CONFIG_DVB_ISL6421 is not set
> CONFIG_DVB_ISL6423=m
> CONFIG_DVB_IX2505V=m
> CONFIG_DVB_LGS8GL5=m
> CONFIG_DVB_LGS8GXX=m
> CONFIG_DVB_LNBH25=m
> CONFIG_DVB_LNBH29=m
> # CONFIG_DVB_LNBP21 is not set
> CONFIG_DVB_LNBP22=m
> CONFIG_DVB_M88RS2000=m
> CONFIG_DVB_TDA665x=m
> CONFIG_DVB_DRX39XYJ=m
> 
> #
> # Common Interface (EN50221) controller drivers
> #
> CONFIG_DVB_CXD2099=m
> CONFIG_DVB_SP2=m
> # end of Customise DVB Frontends
> 
> #
> # Tools to develop new frontends
> #
> # CONFIG_DVB_DUMMY_FE is not set
> # end of Media ancillary drivers
> 
> #
> # Graphics support
> #
> CONFIG_VIDEO_NOMODESET=y
> CONFIG_AGP=m
> CONFIG_AGP_INTEL=m
> CONFIG_AGP_SIS=m
> CONFIG_AGP_VIA=m
> CONFIG_INTEL_GTT=m
> # CONFIG_VGA_SWITCHEROO is not set
> CONFIG_DRM=m
> CONFIG_DRM_MIPI_DBI=m
> CONFIG_DRM_MIPI_DSI=y
> CONFIG_DRM_KMS_HELPER=m
> CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS=y
> # CONFIG_DRM_DEBUG_MODESET_LOCK is not set
> CONFIG_DRM_LOAD_EDID_FIRMWARE=y
> CONFIG_DRM_DP_AUX_BUS=m
> CONFIG_DRM_DISPLAY_HELPER=m
> CONFIG_DRM_DISPLAY_DP_HELPER=y
> CONFIG_DRM_DISPLAY_HDCP_HELPER=y
> # CONFIG_DRM_DP_AUX_CHARDEV is not set
> # CONFIG_DRM_DP_CEC is not set
> CONFIG_DRM_TTM=m
> CONFIG_DRM_VRAM_HELPER=m
> CONFIG_DRM_TTM_HELPER=m
> CONFIG_DRM_GEM_DMA_HELPER=m
> CONFIG_DRM_GEM_SHMEM_HELPER=m
> CONFIG_DRM_SCHED=m
> 
> #
> # I2C encoder or helper chips
> #
> CONFIG_DRM_I2C_CH7006=m
> # CONFIG_DRM_I2C_SIL164 is not set
> CONFIG_DRM_I2C_NXP_TDA998X=m
> CONFIG_DRM_I2C_NXP_TDA9950=m
> # end of I2C encoder or helper chips
> 
> #
> # ARM devices
> #
> CONFIG_DRM_KOMEDA=m
> # end of ARM devices
> 
> # CONFIG_DRM_RADEON is not set
> # CONFIG_DRM_AMDGPU is not set
> # CONFIG_DRM_NOUVEAU is not set
> # CONFIG_DRM_I915 is not set
> CONFIG_DRM_VGEM=m
> CONFIG_DRM_VKMS=m
> CONFIG_DRM_VMWGFX=m
> CONFIG_DRM_VMWGFX_MKSSTATS=y
> CONFIG_DRM_GMA500=m
> # CONFIG_DRM_UDL is not set
> CONFIG_DRM_AST=m
> # CONFIG_DRM_MGAG200 is not set
> # CONFIG_DRM_QXL is not set
> CONFIG_DRM_PANEL=y
> 
> #
> # Display Panels
> #
> # CONFIG_DRM_PANEL_ABT_Y030XX067A is not set
> CONFIG_DRM_PANEL_ARM_VERSATILE=m
> # CONFIG_DRM_PANEL_ASUS_Z00T_TM5P5_NT35596 is not set
> CONFIG_DRM_PANEL_AUO_A030JTN01=m
> CONFIG_DRM_PANEL_BOE_BF060Y8M_AJ0=m
> CONFIG_DRM_PANEL_BOE_HIMAX8279D=m
> CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=m
> CONFIG_DRM_PANEL_DSI_CM=m
> CONFIG_DRM_PANEL_LVDS=m
> CONFIG_DRM_PANEL_EBBG_FT8719=m
> # CONFIG_DRM_PANEL_ELIDA_KD35T133 is not set
> CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02=m
> CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D=m
> # CONFIG_DRM_PANEL_HIMAX_HX8394 is not set
> CONFIG_DRM_PANEL_ILITEK_IL9322=m
> CONFIG_DRM_PANEL_ILITEK_ILI9341=m
> CONFIG_DRM_PANEL_ILITEK_ILI9881C=m
> CONFIG_DRM_PANEL_INNOLUX_EJ030NA=m
> CONFIG_DRM_PANEL_INNOLUX_P079ZCA=m
> CONFIG_DRM_PANEL_JADARD_JD9365DA_H3=m
> CONFIG_DRM_PANEL_JDI_LT070ME05000=m
> CONFIG_DRM_PANEL_JDI_R63452=m
> # CONFIG_DRM_PANEL_KHADAS_TS050 is not set
> CONFIG_DRM_PANEL_KINGDISPLAY_KD097D04=m
> # CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W is not set
> CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829=m
> CONFIG_DRM_PANEL_SAMSUNG_LD9040=m
> CONFIG_DRM_PANEL_LG_LB035Q02=m
> CONFIG_DRM_PANEL_LG_LG4573=m
> CONFIG_DRM_PANEL_NEC_NL8048HL11=m
> # CONFIG_DRM_PANEL_NEWVISION_NV3051D is not set
> CONFIG_DRM_PANEL_NEWVISION_NV3052C=m
> CONFIG_DRM_PANEL_NOVATEK_NT35510=m
> CONFIG_DRM_PANEL_NOVATEK_NT35560=m
> # CONFIG_DRM_PANEL_NOVATEK_NT35950 is not set
> CONFIG_DRM_PANEL_NOVATEK_NT36672A=m
> CONFIG_DRM_PANEL_NOVATEK_NT39016=m
> CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
> # CONFIG_DRM_PANEL_OLIMEX_LCD_OLINUXINO is not set
> # CONFIG_DRM_PANEL_ORISETECH_OTA5601A is not set
> CONFIG_DRM_PANEL_ORISETECH_OTM8009A=m
> CONFIG_DRM_PANEL_OSD_OSD101T2587_53TS=m
> CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00=m
> # CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
> # CONFIG_DRM_PANEL_RAYDIUM_RM67191 is not set
> # CONFIG_DRM_PANEL_RAYDIUM_RM68200 is not set
> CONFIG_DRM_PANEL_RONBO_RB070D30=m
> CONFIG_DRM_PANEL_SAMSUNG_DB7430=m
> CONFIG_DRM_PANEL_SAMSUNG_S6D16D0=m
> # CONFIG_DRM_PANEL_SAMSUNG_S6D27A1 is not set
> # CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2 is not set
> CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03=m
> # CONFIG_DRM_PANEL_SAMSUNG_S6E63M0 is not set
> # CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01 is not set
> # CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0 is not set
> CONFIG_DRM_PANEL_SAMSUNG_SOFEF00=m
> CONFIG_DRM_PANEL_SEIKO_43WVF1G=m
> # CONFIG_DRM_PANEL_SHARP_LQ101R1SX01 is not set
> CONFIG_DRM_PANEL_SHARP_LS037V7DW01=m
> CONFIG_DRM_PANEL_SHARP_LS043T1LE01=m
> CONFIG_DRM_PANEL_SHARP_LS060T1SX01=m
> # CONFIG_DRM_PANEL_SITRONIX_ST7701 is not set
> CONFIG_DRM_PANEL_SITRONIX_ST7703=m
> CONFIG_DRM_PANEL_SITRONIX_ST7789V=m
> CONFIG_DRM_PANEL_SONY_ACX565AKM=m
> CONFIG_DRM_PANEL_SONY_TULIP_TRULY_NT35521=m
> # CONFIG_DRM_PANEL_TDO_TL070WSH30 is not set
> CONFIG_DRM_PANEL_TPO_TD028TTEC1=m
> # CONFIG_DRM_PANEL_TPO_TD043MTEA1 is not set
> CONFIG_DRM_PANEL_TPO_TPG110=m
> # CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA is not set
> CONFIG_DRM_PANEL_VISIONOX_RM69299=m
> CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
> # CONFIG_DRM_PANEL_WIDECHIPS_WS2401 is not set
> CONFIG_DRM_PANEL_XINPENG_XPP055C272=m
> # end of Display Panels
> 
> CONFIG_DRM_BRIDGE=y
> CONFIG_DRM_PANEL_BRIDGE=y
> 
> #
> # Display Interface Bridges
> #
> CONFIG_DRM_CHIPONE_ICN6211=m
> CONFIG_DRM_CHRONTEL_CH7033=m
> CONFIG_DRM_DISPLAY_CONNECTOR=m
> CONFIG_DRM_ITE_IT6505=m
> # CONFIG_DRM_LONTIUM_LT8912B is not set
> # CONFIG_DRM_LONTIUM_LT9211 is not set
> # CONFIG_DRM_LONTIUM_LT9611 is not set
> CONFIG_DRM_LONTIUM_LT9611UXC=m
> # CONFIG_DRM_ITE_IT66121 is not set
> CONFIG_DRM_LVDS_CODEC=m
> # CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW is not set
> # CONFIG_DRM_NWL_MIPI_DSI is not set
> # CONFIG_DRM_NXP_PTN3460 is not set
> # CONFIG_DRM_PARADE_PS8622 is not set
> CONFIG_DRM_PARADE_PS8640=m
> CONFIG_DRM_SIL_SII8620=m
> CONFIG_DRM_SII902X=m
> CONFIG_DRM_SII9234=m
> CONFIG_DRM_SIMPLE_BRIDGE=m
> # CONFIG_DRM_THINE_THC63LVD1024 is not set
> CONFIG_DRM_TOSHIBA_TC358762=m
> CONFIG_DRM_TOSHIBA_TC358764=m
> # CONFIG_DRM_TOSHIBA_TC358767 is not set
> CONFIG_DRM_TOSHIBA_TC358768=m
> # CONFIG_DRM_TOSHIBA_TC358775 is not set
> CONFIG_DRM_TI_DLPC3433=m
> CONFIG_DRM_TI_TFP410=m
> CONFIG_DRM_TI_SN65DSI83=m
> CONFIG_DRM_TI_SN65DSI86=m
> CONFIG_DRM_TI_TPD12S015=m
> # CONFIG_DRM_ANALOGIX_ANX6345 is not set
> # CONFIG_DRM_ANALOGIX_ANX78XX is not set
> CONFIG_DRM_ANALOGIX_ANX7625=m
> CONFIG_DRM_I2C_ADV7511=m
> # CONFIG_DRM_I2C_ADV7511_CEC is not set
> CONFIG_DRM_CDNS_DSI=m
> # CONFIG_DRM_CDNS_DSI_J721E is not set
> # CONFIG_DRM_CDNS_MHDP8546 is not set
> # end of Display Interface Bridges
> 
> CONFIG_DRM_ETNAVIV=m
> CONFIG_DRM_ETNAVIV_THERMAL=y
> CONFIG_DRM_LOGICVC=m
> # CONFIG_DRM_ARCPGU is not set
> # CONFIG_DRM_BOCHS is not set
> CONFIG_DRM_CIRRUS_QEMU=m
> CONFIG_DRM_GM12U320=m
> CONFIG_DRM_PANEL_MIPI_DBI=m
> # CONFIG_DRM_SIMPLEDRM is not set
> CONFIG_TINYDRM_HX8357D=m
> CONFIG_TINYDRM_ILI9163=m
> CONFIG_TINYDRM_ILI9225=m
> CONFIG_TINYDRM_ILI9341=m
> CONFIG_TINYDRM_ILI9486=m
> CONFIG_TINYDRM_MI0283QT=m
> CONFIG_TINYDRM_REPAPER=m
> CONFIG_TINYDRM_ST7586=m
> CONFIG_TINYDRM_ST7735R=m
> CONFIG_DRM_VBOXVIDEO=m
> CONFIG_DRM_GUD=m
> CONFIG_DRM_SSD130X=m
> CONFIG_DRM_SSD130X_I2C=m
> CONFIG_DRM_SSD130X_SPI=m
> CONFIG_DRM_LEGACY=y
> CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=m
> 
> #
> # Frame buffer Devices
> #
> CONFIG_FB_CMDLINE=y
> # CONFIG_FB is not set
> # end of Frame buffer Devices
> 
> #
> # Backlight & LCD device support
> #
> CONFIG_LCD_CLASS_DEVICE=m
> CONFIG_LCD_L4F00242T03=m
> CONFIG_LCD_LMS283GF05=m
> CONFIG_LCD_LTV350QV=m
> CONFIG_LCD_ILI922X=m
> CONFIG_LCD_ILI9320=m
> CONFIG_LCD_TDO24M=m
> CONFIG_LCD_VGG2432A4=m
> CONFIG_LCD_PLATFORM=m
> CONFIG_LCD_AMS369FG06=m
> CONFIG_LCD_LMS501KF03=m
> # CONFIG_LCD_HX8357 is not set
> CONFIG_LCD_OTM3225A=m
> CONFIG_BACKLIGHT_CLASS_DEVICE=y
> CONFIG_BACKLIGHT_KTD253=m
> # CONFIG_BACKLIGHT_KTZ8866 is not set
> CONFIG_BACKLIGHT_DA903X=m
> # CONFIG_BACKLIGHT_DA9052 is not set
> CONFIG_BACKLIGHT_MAX8925=y
> # CONFIG_BACKLIGHT_MT6370 is not set
> # CONFIG_BACKLIGHT_APPLE is not set
> CONFIG_BACKLIGHT_QCOM_WLED=y
> # CONFIG_BACKLIGHT_RT4831 is not set
> # CONFIG_BACKLIGHT_SAHARA is not set
> # CONFIG_BACKLIGHT_WM831X is not set
> # CONFIG_BACKLIGHT_ADP8860 is not set
> # CONFIG_BACKLIGHT_ADP8870 is not set
> CONFIG_BACKLIGHT_88PM860X=y
> CONFIG_BACKLIGHT_LM3639=m
> CONFIG_BACKLIGHT_PANDORA=m
> CONFIG_BACKLIGHT_SKY81452=m
> CONFIG_BACKLIGHT_TPS65217=m
> # CONFIG_BACKLIGHT_AS3711 is not set
> # CONFIG_BACKLIGHT_GPIO is not set
> CONFIG_BACKLIGHT_LV5207LP=y
> CONFIG_BACKLIGHT_BD6107=y
> # CONFIG_BACKLIGHT_ARCXCNN is not set
> # CONFIG_BACKLIGHT_RAVE_SP is not set
> CONFIG_BACKLIGHT_LED=m
> # end of Backlight & LCD device support
> 
> CONFIG_VIDEOMODE_HELPERS=y
> CONFIG_HDMI=y
> # end of Graphics support
> 
> # CONFIG_DRM_ACCEL is not set
> # CONFIG_SOUND is not set
> CONFIG_HID_SUPPORT=y
> CONFIG_HID=y
> # CONFIG_HID_BATTERY_STRENGTH is not set
> # CONFIG_HIDRAW is not set
> # CONFIG_UHID is not set
> CONFIG_HID_GENERIC=y
> 
> #
> # Special HID drivers
> #
> # CONFIG_HID_A4TECH is not set
> # CONFIG_HID_ACCUTOUCH is not set
> # CONFIG_HID_ACRUX is not set
> # CONFIG_HID_APPLE is not set
> # CONFIG_HID_APPLEIR is not set
> # CONFIG_HID_ASUS is not set
> # CONFIG_HID_AUREAL is not set
> # CONFIG_HID_BELKIN is not set
> # CONFIG_HID_BETOP_FF is not set
> # CONFIG_HID_BIGBEN_FF is not set
> # CONFIG_HID_CHERRY is not set
> # CONFIG_HID_CHICONY is not set
> # CONFIG_HID_CORSAIR is not set
> # CONFIG_HID_COUGAR is not set
> # CONFIG_HID_MACALLY is not set
> # CONFIG_HID_CMEDIA is not set
> # CONFIG_HID_CREATIVE_SB0540 is not set
> # CONFIG_HID_CYPRESS is not set
> # CONFIG_HID_DRAGONRISE is not set
> # CONFIG_HID_EMS_FF is not set
> # CONFIG_HID_ELAN is not set
> # CONFIG_HID_ELECOM is not set
> # CONFIG_HID_ELO is not set
> # CONFIG_HID_EVISION is not set
> # CONFIG_HID_EZKEY is not set
> # CONFIG_HID_GEMBIRD is not set
> # CONFIG_HID_GFRM is not set
> # CONFIG_HID_GLORIOUS is not set
> # CONFIG_HID_HOLTEK is not set
> # CONFIG_HID_VIVALDI is not set
> # CONFIG_HID_GT683R is not set
> # CONFIG_HID_KEYTOUCH is not set
> # CONFIG_HID_KYE is not set
> # CONFIG_HID_UCLOGIC is not set
> # CONFIG_HID_WALTOP is not set
> # CONFIG_HID_VIEWSONIC is not set
> # CONFIG_HID_VRC2 is not set
> # CONFIG_HID_XIAOMI is not set
> # CONFIG_HID_GYRATION is not set
> # CONFIG_HID_ICADE is not set
> # CONFIG_HID_ITE is not set
> # CONFIG_HID_JABRA is not set
> # CONFIG_HID_TWINHAN is not set
> # CONFIG_HID_KENSINGTON is not set
> # CONFIG_HID_LCPOWER is not set
> # CONFIG_HID_LED is not set
> # CONFIG_HID_LENOVO is not set
> # CONFIG_HID_LETSKETCH is not set
> # CONFIG_HID_LOGITECH is not set
> # CONFIG_HID_MAGICMOUSE is not set
> # CONFIG_HID_MALTRON is not set
> # CONFIG_HID_MAYFLASH is not set
> # CONFIG_HID_MEGAWORLD_FF is not set
> # CONFIG_HID_REDRAGON is not set
> # CONFIG_HID_MICROSOFT is not set
> # CONFIG_HID_MONTEREY is not set
> # CONFIG_HID_MULTITOUCH is not set
> # CONFIG_HID_NINTENDO is not set
> # CONFIG_HID_NTI is not set
> # CONFIG_HID_NTRIG is not set
> # CONFIG_HID_ORTEK is not set
> # CONFIG_HID_PANTHERLORD is not set
> # CONFIG_HID_PENMOUNT is not set
> # CONFIG_HID_PETALYNX is not set
> # CONFIG_HID_PICOLCD is not set
> # CONFIG_HID_PLANTRONICS is not set
> # CONFIG_HID_PLAYSTATION is not set
> # CONFIG_HID_PXRC is not set
> # CONFIG_HID_RAZER is not set
> # CONFIG_HID_PRIMAX is not set
> # CONFIG_HID_RETRODE is not set
> # CONFIG_HID_ROCCAT is not set
> # CONFIG_HID_SAITEK is not set
> # CONFIG_HID_SAMSUNG is not set
> # CONFIG_HID_SEMITEK is not set
> # CONFIG_HID_SIGMAMICRO is not set
> # CONFIG_HID_SONY is not set
> # CONFIG_HID_SPEEDLINK is not set
> # CONFIG_HID_STEAM is not set
> # CONFIG_HID_STEELSERIES is not set
> # CONFIG_HID_SUNPLUS is not set
> # CONFIG_HID_RMI is not set
> # CONFIG_HID_GREENASIA is not set
> # CONFIG_HID_SMARTJOYPLUS is not set
> # CONFIG_HID_TIVO is not set
> # CONFIG_HID_TOPSEED is not set
> # CONFIG_HID_TOPRE is not set
> # CONFIG_HID_THINGM is not set
> # CONFIG_HID_THRUSTMASTER is not set
> # CONFIG_HID_UDRAW_PS3 is not set
> # CONFIG_HID_U2FZERO is not set
> # CONFIG_HID_WACOM is not set
> # CONFIG_HID_WIIMOTE is not set
> # CONFIG_HID_XINMO is not set
> # CONFIG_HID_ZEROPLUS is not set
> # CONFIG_HID_ZYDACRON is not set
> # CONFIG_HID_SENSOR_HUB is not set
> # CONFIG_HID_ALPS is not set
> # CONFIG_HID_MCP2221 is not set
> # end of Special HID drivers
> 
> #
> # HID-BPF support
> #
> # end of HID-BPF support
> 
> #
> # USB HID support
> #
> CONFIG_USB_HID=y
> # CONFIG_HID_PID is not set
> # CONFIG_USB_HIDDEV is not set
> # end of USB HID support
> 
> CONFIG_I2C_HID=y
> # CONFIG_I2C_HID_ACPI is not set
> # CONFIG_I2C_HID_OF is not set
> # CONFIG_I2C_HID_OF_ELAN is not set
> # CONFIG_I2C_HID_OF_GOODIX is not set
> 
> #
> # Intel ISH HID support
> #
> # CONFIG_INTEL_ISH_HID is not set
> # end of Intel ISH HID support
> 
> #
> # AMD SFH HID Support
> #
> # CONFIG_AMD_SFH_HID is not set
> # end of AMD SFH HID Support
> 
> CONFIG_USB_OHCI_LITTLE_ENDIAN=y
> CONFIG_USB_SUPPORT=y
> CONFIG_USB_COMMON=y
> CONFIG_USB_ULPI_BUS=m
> # CONFIG_USB_CONN_GPIO is not set
> CONFIG_USB_ARCH_HAS_HCD=y
> CONFIG_USB=y
> CONFIG_USB_PCI=y
> # CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set
> 
> #
> # Miscellaneous USB options
> #
> # CONFIG_USB_DEFAULT_PERSIST is not set
> # CONFIG_USB_FEW_INIT_RETRIES is not set
> CONFIG_USB_DYNAMIC_MINORS=y
> # CONFIG_USB_OTG_PRODUCTLIST is not set
> CONFIG_USB_OTG_DISABLE_EXTERNAL_HUB=y
> CONFIG_USB_AUTOSUSPEND_DELAY=2
> # CONFIG_USB_MON is not set
> 
> #
> # USB Host Controller Drivers
> #
> CONFIG_USB_C67X00_HCD=m
> CONFIG_USB_XHCI_HCD=m
> # CONFIG_USB_XHCI_DBGCAP is not set
> CONFIG_USB_XHCI_PCI=m
> # CONFIG_USB_XHCI_PCI_RENESAS is not set
> CONFIG_USB_XHCI_PLATFORM=m
> CONFIG_USB_EHCI_HCD=m
> CONFIG_USB_EHCI_ROOT_HUB_TT=y
> # CONFIG_USB_EHCI_TT_NEWSCHED is not set
> CONFIG_USB_EHCI_PCI=m
> # CONFIG_USB_EHCI_FSL is not set
> CONFIG_USB_EHCI_HCD_PLATFORM=m
> CONFIG_USB_OXU210HP_HCD=y
> # CONFIG_USB_ISP116X_HCD is not set
> # CONFIG_USB_MAX3421_HCD is not set
> CONFIG_USB_OHCI_HCD=y
> CONFIG_USB_OHCI_HCD_PCI=m
> CONFIG_USB_OHCI_HCD_PLATFORM=y
> CONFIG_USB_UHCI_HCD=m
> CONFIG_USB_SL811_HCD=y
> CONFIG_USB_SL811_HCD_ISO=y
> CONFIG_USB_SL811_CS=m
> # CONFIG_USB_R8A66597_HCD is not set
> CONFIG_USB_HCD_BCMA=m
> CONFIG_USB_HCD_SSB=m
> # CONFIG_USB_HCD_TEST_MODE is not set
> 
> #
> # USB Device Class drivers
> #
> # CONFIG_USB_ACM is not set
> CONFIG_USB_PRINTER=y
> # CONFIG_USB_WDM is not set
> CONFIG_USB_TMC=m
> 
> #
> # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
> #
> 
> #
> # also be needed; see USB_STORAGE Help for more info
> #
> 
> #
> # USB Imaging devices
> #
> CONFIG_USB_MDC800=y
> # CONFIG_USBIP_CORE is not set
> 
> #
> # USB dual-mode controller drivers
> #
> CONFIG_USB_CDNS_SUPPORT=m
> CONFIG_USB_CDNS3=m
> # CONFIG_USB_CDNS3_HOST is not set
> CONFIG_USB_CDNS3_PCI_WRAP=m
> # CONFIG_USB_CDNSP_PCI is not set
> CONFIG_USB_MUSB_HDRC=m
> CONFIG_USB_MUSB_HOST=y
> 
> #
> # Platform Glue Layer
> #
> 
> #
> # MUSB DMA mode
> #
> CONFIG_MUSB_PIO_ONLY=y
> CONFIG_USB_DWC3=y
> CONFIG_USB_DWC3_HOST=y
> 
> #
> # Platform Glue Driver Support
> #
> CONFIG_USB_DWC3_PCI=y
> # CONFIG_USB_DWC3_HAPS is not set
> CONFIG_USB_DWC3_OF_SIMPLE=y
> CONFIG_USB_DWC2=m
> CONFIG_USB_DWC2_HOST=y
> 
> #
> # Gadget/Dual-role mode requires USB Gadget support to be enabled
> #
> CONFIG_USB_DWC2_PCI=m
> # CONFIG_USB_DWC2_DEBUG is not set
> # CONFIG_USB_DWC2_TRACK_MISSED_SOFS is not set
> CONFIG_USB_CHIPIDEA=m
> # CONFIG_USB_CHIPIDEA_HOST is not set
> CONFIG_USB_CHIPIDEA_PCI=m
> # CONFIG_USB_CHIPIDEA_MSM is not set
> CONFIG_USB_CHIPIDEA_IMX=m
> CONFIG_USB_CHIPIDEA_GENERIC=m
> CONFIG_USB_CHIPIDEA_TEGRA=m
> CONFIG_USB_ISP1760=m
> CONFIG_USB_ISP1760_HCD=y
> CONFIG_USB_ISP1760_HOST_ROLE=y
> 
> #
> # USB port drivers
> #
> CONFIG_USB_USS720=m
> # CONFIG_USB_SERIAL is not set
> 
> #
> # USB Miscellaneous drivers
> #
> CONFIG_USB_EMI62=m
> # CONFIG_USB_EMI26 is not set
> # CONFIG_USB_ADUTUX is not set
> CONFIG_USB_SEVSEG=y
> CONFIG_USB_LEGOTOWER=m
> CONFIG_USB_LCD=y
> CONFIG_USB_CYPRESS_CY7C63=y
> # CONFIG_USB_CYTHERM is not set
> CONFIG_USB_IDMOUSE=m
> # CONFIG_USB_FTDI_ELAN is not set
> CONFIG_USB_APPLEDISPLAY=m
> CONFIG_APPLE_MFI_FASTCHARGE=y
> # CONFIG_USB_SISUSBVGA is not set
> CONFIG_USB_LD=y
> # CONFIG_USB_TRANCEVIBRATOR is not set
> # CONFIG_USB_IOWARRIOR is not set
> # CONFIG_USB_TEST is not set
> # CONFIG_USB_EHSET_TEST_FIXTURE is not set
> CONFIG_USB_ISIGHTFW=y
> # CONFIG_USB_YUREX is not set
> CONFIG_USB_EZUSB_FX2=m
> CONFIG_USB_HUB_USB251XB=y
> # CONFIG_USB_HSIC_USB3503 is not set
> # CONFIG_USB_HSIC_USB4604 is not set
> # CONFIG_USB_LINK_LAYER_TEST is not set
> CONFIG_USB_CHAOSKEY=m
> CONFIG_USB_ONBOARD_HUB=m
> 
> #
> # USB Physical Layer drivers
> #
> CONFIG_USB_PHY=y
> CONFIG_NOP_USB_XCEIV=y
> # CONFIG_USB_GPIO_VBUS is not set
> # CONFIG_TAHVO_USB is not set
> CONFIG_USB_ISP1301=m
> # end of USB Physical Layer drivers
> 
> # CONFIG_USB_GADGET is not set
> CONFIG_TYPEC=m
> CONFIG_TYPEC_TCPM=m
> CONFIG_TYPEC_TCPCI=m
> CONFIG_TYPEC_RT1711H=m
> # CONFIG_TYPEC_MT6360 is not set
> # CONFIG_TYPEC_TCPCI_MT6370 is not set
> CONFIG_TYPEC_TCPCI_MAXIM=m
> CONFIG_TYPEC_FUSB302=m
> CONFIG_TYPEC_UCSI=m
> CONFIG_UCSI_CCG=m
> # CONFIG_UCSI_ACPI is not set
> # CONFIG_UCSI_STM32G0 is not set
> CONFIG_TYPEC_TPS6598X=m
> CONFIG_TYPEC_ANX7411=m
> CONFIG_TYPEC_RT1719=m
> CONFIG_TYPEC_HD3SS3220=m
> CONFIG_TYPEC_STUSB160X=m
> CONFIG_TYPEC_WUSB3801=m
> 
> #
> # USB Type-C Multiplexer/DeMultiplexer Switch support
> #
> CONFIG_TYPEC_MUX_FSA4480=m
> # CONFIG_TYPEC_MUX_GPIO_SBU is not set
> # CONFIG_TYPEC_MUX_PI3USB30532 is not set
> # CONFIG_TYPEC_MUX_INTEL_PMC is not set
> # end of USB Type-C Multiplexer/DeMultiplexer Switch support
> 
> #
> # USB Type-C Alternate Mode drivers
> #
> CONFIG_TYPEC_DP_ALTMODE=m
> CONFIG_TYPEC_NVIDIA_ALTMODE=m
> # end of USB Type-C Alternate Mode drivers
> 
> CONFIG_USB_ROLE_SWITCH=m
> # CONFIG_USB_ROLES_INTEL_XHCI is not set
> # CONFIG_MMC is not set
> CONFIG_MEMSTICK=y
> CONFIG_MEMSTICK_DEBUG=y
> 
> #
> # MemoryStick drivers
> #
> CONFIG_MEMSTICK_UNSAFE_RESUME=y
> 
> #
> # MemoryStick Host Controller Drivers
> #
> # CONFIG_MEMSTICK_TIFM_MS is not set
> # CONFIG_MEMSTICK_JMICRON_38X is not set
> CONFIG_MEMSTICK_R592=y
> CONFIG_MEMSTICK_REALTEK_USB=m
> CONFIG_NEW_LEDS=y
> CONFIG_LEDS_CLASS=m
> # CONFIG_LEDS_CLASS_FLASH is not set
> CONFIG_LEDS_CLASS_MULTICOLOR=m
> CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=y
> 
> #
> # LED drivers
> #
> # CONFIG_LEDS_88PM860X is not set
> # CONFIG_LEDS_AN30259A is not set
> # CONFIG_LEDS_AW2013 is not set
> # CONFIG_LEDS_BCM6328 is not set
> CONFIG_LEDS_BCM6358=m
> CONFIG_LEDS_CPCAP=m
> CONFIG_LEDS_CR0014114=m
> # CONFIG_LEDS_EL15203000 is not set
> CONFIG_LEDS_LM3530=m
> # CONFIG_LEDS_LM3532 is not set
> CONFIG_LEDS_LM3642=m
> CONFIG_LEDS_LM3692X=m
> # CONFIG_LEDS_PCA9532 is not set
> CONFIG_LEDS_GPIO=m
> CONFIG_LEDS_LP3944=m
> # CONFIG_LEDS_LP3952 is not set
> CONFIG_LEDS_LP50XX=m
> # CONFIG_LEDS_LP55XX_COMMON is not set
> # CONFIG_LEDS_LP8860 is not set
> # CONFIG_LEDS_PCA955X is not set
> # CONFIG_LEDS_PCA963X is not set
> # CONFIG_LEDS_WM831X_STATUS is not set
> CONFIG_LEDS_DA903X=m
> CONFIG_LEDS_DA9052=m
> # CONFIG_LEDS_DAC124S085 is not set
> CONFIG_LEDS_REGULATOR=m
> # CONFIG_LEDS_BD2802 is not set
> CONFIG_LEDS_LT3593=m
> CONFIG_LEDS_MC13783=m
> # CONFIG_LEDS_TCA6507 is not set
> # CONFIG_LEDS_TLC591XX is not set
> CONFIG_LEDS_LM355x=m
> CONFIG_LEDS_IS31FL319X=m
> CONFIG_LEDS_IS31FL32XX=m
> 
> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
> #
> # CONFIG_LEDS_BLINKM is not set
> CONFIG_LEDS_MLXREG=m
> CONFIG_LEDS_USER=m
> # CONFIG_LEDS_NIC78BX is not set
> CONFIG_LEDS_SPI_BYTE=m
> CONFIG_LEDS_TI_LMU_COMMON=m
> # CONFIG_LEDS_LM3697 is not set
> CONFIG_LEDS_LM36274=m
> # CONFIG_LEDS_TPS6105X is not set
> CONFIG_LEDS_LGM=m
> 
> #
> # Flash and Torch LED drivers
> #
> 
> #
> # RGB LED drivers
> #
> 
> #
> # LED Triggers
> #
> # CONFIG_LEDS_TRIGGERS is not set
> 
> #
> # Simple LED drivers
> #
> # CONFIG_ACCESSIBILITY is not set
> # CONFIG_INFINIBAND is not set
> CONFIG_EDAC_ATOMIC_SCRUB=y
> CONFIG_EDAC_SUPPORT=y
> CONFIG_EDAC=y
> # CONFIG_EDAC_LEGACY_SYSFS is not set
> CONFIG_EDAC_DEBUG=y
> # CONFIG_EDAC_E752X is not set
> CONFIG_EDAC_I82975X=m
> # CONFIG_EDAC_I3000 is not set
> # CONFIG_EDAC_I3200 is not set
> CONFIG_EDAC_IE31200=m
> CONFIG_EDAC_X38=m
> CONFIG_EDAC_I5400=m
> CONFIG_EDAC_I5100=m
> CONFIG_EDAC_I7300=y
> CONFIG_RTC_LIB=y
> CONFIG_RTC_MC146818_LIB=y
> CONFIG_RTC_CLASS=y
> # CONFIG_RTC_HCTOSYS is not set
> CONFIG_RTC_SYSTOHC=y
> CONFIG_RTC_SYSTOHC_DEVICE="rtc0"
> # CONFIG_RTC_DEBUG is not set
> CONFIG_RTC_NVMEM=y
> 
> #
> # RTC interfaces
> #
> # CONFIG_RTC_INTF_SYSFS is not set
> CONFIG_RTC_INTF_PROC=y
> CONFIG_RTC_INTF_DEV=y
> # CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
> # CONFIG_RTC_DRV_TEST is not set
> 
> #
> # I2C RTC drivers
> #
> # CONFIG_RTC_DRV_88PM860X is not set
> CONFIG_RTC_DRV_88PM80X=m
> CONFIG_RTC_DRV_ABB5ZES3=y
> # CONFIG_RTC_DRV_ABEOZ9 is not set
> CONFIG_RTC_DRV_ABX80X=y
> CONFIG_RTC_DRV_AS3722=y
> CONFIG_RTC_DRV_DS1307=m
> CONFIG_RTC_DRV_DS1307_CENTURY=y
> # CONFIG_RTC_DRV_DS1374 is not set
> CONFIG_RTC_DRV_DS1672=y
> # CONFIG_RTC_DRV_HYM8563 is not set
> CONFIG_RTC_DRV_MAX6900=y
> # CONFIG_RTC_DRV_MAX8925 is not set
> CONFIG_RTC_DRV_MAX8998=y
> # CONFIG_RTC_DRV_MAX77686 is not set
> # CONFIG_RTC_DRV_NCT3018Y is not set
> # CONFIG_RTC_DRV_RK808 is not set
> CONFIG_RTC_DRV_RS5C372=y
> CONFIG_RTC_DRV_ISL1208=m
> CONFIG_RTC_DRV_ISL12022=m
> CONFIG_RTC_DRV_ISL12026=m
> # CONFIG_RTC_DRV_X1205 is not set
> CONFIG_RTC_DRV_PCF8523=m
> CONFIG_RTC_DRV_PCF85063=y
> CONFIG_RTC_DRV_PCF85363=m
> CONFIG_RTC_DRV_PCF8563=m
> CONFIG_RTC_DRV_PCF8583=y
> CONFIG_RTC_DRV_M41T80=m
> CONFIG_RTC_DRV_M41T80_WDT=y
> # CONFIG_RTC_DRV_BD70528 is not set
> # CONFIG_RTC_DRV_BQ32K is not set
> CONFIG_RTC_DRV_TWL4030=m
> # CONFIG_RTC_DRV_PALMAS is not set
> CONFIG_RTC_DRV_TPS65910=y
> CONFIG_RTC_DRV_S35390A=m
> # CONFIG_RTC_DRV_FM3130 is not set
> CONFIG_RTC_DRV_RX8010=m
> CONFIG_RTC_DRV_RX8581=y
> # CONFIG_RTC_DRV_RX8025 is not set
> CONFIG_RTC_DRV_EM3027=y
> CONFIG_RTC_DRV_RV3028=m
> CONFIG_RTC_DRV_RV3032=m
> CONFIG_RTC_DRV_RV8803=m
> CONFIG_RTC_DRV_S5M=m
> CONFIG_RTC_DRV_SD3078=m
> 
> #
> # SPI RTC drivers
> #
> CONFIG_RTC_DRV_M41T93=y
> CONFIG_RTC_DRV_M41T94=m
> # CONFIG_RTC_DRV_DS1302 is not set
> # CONFIG_RTC_DRV_DS1305 is not set
> # CONFIG_RTC_DRV_DS1343 is not set
> CONFIG_RTC_DRV_DS1347=m
> # CONFIG_RTC_DRV_DS1390 is not set
> CONFIG_RTC_DRV_MAX6916=m
> CONFIG_RTC_DRV_R9701=m
> CONFIG_RTC_DRV_RX4581=y
> # CONFIG_RTC_DRV_RS5C348 is not set
> # CONFIG_RTC_DRV_MAX6902 is not set
> CONFIG_RTC_DRV_PCF2123=m
> CONFIG_RTC_DRV_MCP795=m
> CONFIG_RTC_I2C_AND_SPI=y
> 
> #
> # SPI and I2C RTC drivers
> #
> CONFIG_RTC_DRV_DS3232=m
> CONFIG_RTC_DRV_DS3232_HWMON=y
> CONFIG_RTC_DRV_PCF2127=y
> CONFIG_RTC_DRV_RV3029C2=y
> CONFIG_RTC_DRV_RX6110=m
> 
> #
> # Platform RTC drivers
> #
> # CONFIG_RTC_DRV_CMOS is not set
> CONFIG_RTC_DRV_DS1286=m
> CONFIG_RTC_DRV_DS1511=y
> CONFIG_RTC_DRV_DS1553=y
> CONFIG_RTC_DRV_DS1685_FAMILY=m
> # CONFIG_RTC_DRV_DS1685 is not set
> # CONFIG_RTC_DRV_DS1689 is not set
> CONFIG_RTC_DRV_DS17285=y
> # CONFIG_RTC_DRV_DS17485 is not set
> # CONFIG_RTC_DRV_DS17885 is not set
> CONFIG_RTC_DRV_DS1742=y
> CONFIG_RTC_DRV_DS2404=m
> CONFIG_RTC_DRV_DA9052=m
> CONFIG_RTC_DRV_DA9055=m
> CONFIG_RTC_DRV_DA9063=m
> CONFIG_RTC_DRV_STK17TA8=y
> CONFIG_RTC_DRV_M48T86=m
> CONFIG_RTC_DRV_M48T35=m
> CONFIG_RTC_DRV_M48T59=y
> CONFIG_RTC_DRV_MSM6242=m
> # CONFIG_RTC_DRV_BQ4802 is not set
> # CONFIG_RTC_DRV_RP5C01 is not set
> CONFIG_RTC_DRV_WM831X=y
> # CONFIG_RTC_DRV_ZYNQMP is not set
> CONFIG_RTC_DRV_NTXEC=y
> 
> #
> # on-CPU RTC drivers
> #
> CONFIG_RTC_DRV_CADENCE=m
> CONFIG_RTC_DRV_FTRTC010=m
> CONFIG_RTC_DRV_MC13XXX=m
> CONFIG_RTC_DRV_R7301=y
> CONFIG_RTC_DRV_CPCAP=m
> 
> #
> # HID Sensor RTC drivers
> #
> CONFIG_RTC_DRV_GOLDFISH=m
> # CONFIG_DMADEVICES is not set
> 
> #
> # DMABUF options
> #
> CONFIG_SYNC_FILE=y
> CONFIG_SW_SYNC=y
> # CONFIG_UDMABUF is not set
> # CONFIG_DMABUF_MOVE_NOTIFY is not set
> CONFIG_DMABUF_DEBUG=y
> # CONFIG_DMABUF_SELFTESTS is not set
> # CONFIG_DMABUF_HEAPS is not set
> CONFIG_DMABUF_SYSFS_STATS=y
> # end of DMABUF options
> 
> CONFIG_AUXDISPLAY=y
> CONFIG_CHARLCD=y
> CONFIG_LINEDISP=m
> CONFIG_HD44780_COMMON=m
> # CONFIG_HD44780 is not set
> CONFIG_KS0108=m
> CONFIG_KS0108_PORT=0x378
> CONFIG_KS0108_DELAY=2
> CONFIG_IMG_ASCII_LCD=m
> CONFIG_LCD2S=y
> CONFIG_PARPORT_PANEL=m
> CONFIG_PANEL_PARPORT=0
> CONFIG_PANEL_PROFILE=5
> CONFIG_PANEL_CHANGE_MESSAGE=y
> CONFIG_PANEL_BOOT_MESSAGE=""
> # CONFIG_CHARLCD_BL_OFF is not set
> # CONFIG_CHARLCD_BL_ON is not set
> CONFIG_CHARLCD_BL_FLASH=y
> CONFIG_PANEL=m
> CONFIG_UIO=m
> CONFIG_UIO_CIF=m
> CONFIG_UIO_PDRV_GENIRQ=m
> # CONFIG_UIO_DMEM_GENIRQ is not set
> # CONFIG_UIO_AEC is not set
> # CONFIG_UIO_SERCOS3 is not set
> # CONFIG_UIO_PCI_GENERIC is not set
> CONFIG_UIO_NETX=m
> # CONFIG_UIO_PRUSS is not set
> CONFIG_UIO_MF624=m
> # CONFIG_VFIO is not set
> # CONFIG_VIRT_DRIVERS is not set
> CONFIG_VIRTIO_ANCHOR=y
> CONFIG_VIRTIO=y
> # CONFIG_VIRTIO_MENU is not set
> # CONFIG_VDPA is not set
> # CONFIG_VHOST_MENU is not set
> 
> #
> # Microsoft Hyper-V guest support
> #
> # CONFIG_HYPERV is not set
> # end of Microsoft Hyper-V guest support
> 
> # CONFIG_GREYBUS is not set
> # CONFIG_COMEDI is not set
> CONFIG_STAGING=y
> # CONFIG_RTL8192U is not set
> # CONFIG_RTLLIB is not set
> # CONFIG_STAGING_MEDIA is not set
> CONFIG_STAGING_BOARD=y
> # CONFIG_LTE_GDM724X is not set
> # CONFIG_PI433 is not set
> # CONFIG_XIL_AXIS_FIFO is not set
> CONFIG_FIELDBUS_DEV=y
> CONFIG_HMS_ANYBUSS_BUS=y
> CONFIG_ARCX_ANYBUS_CONTROLLER=m
> CONFIG_HMS_PROFINET=m
> # CONFIG_QLGE is not set
> # CONFIG_VME_BUS is not set
> # CONFIG_CHROME_PLATFORMS is not set
> # CONFIG_MELLANOX_PLATFORM is not set
> # CONFIG_SURFACE_PLATFORMS is not set
> CONFIG_X86_PLATFORM_DEVICES=y
> CONFIG_ACPI_WMI=m
> CONFIG_WMI_BMOF=m
> # CONFIG_HUAWEI_WMI is not set
> # CONFIG_MXM_WMI is not set
> # CONFIG_PEAQ_WMI is not set
> # CONFIG_NVIDIA_WMI_EC_BACKLIGHT is not set
> # CONFIG_XIAOMI_WMI is not set
> # CONFIG_GIGABYTE_WMI is not set
> # CONFIG_YOGABOOK_WMI is not set
> # CONFIG_ACERHDF is not set
> # CONFIG_ACER_WIRELESS is not set
> # CONFIG_ACER_WMI is not set
> # CONFIG_AMD_PMF is not set
> # CONFIG_AMD_PMC is not set
> # CONFIG_ADV_SWBUTTON is not set
> # CONFIG_APPLE_GMUX is not set
> # CONFIG_ASUS_LAPTOP is not set
> # CONFIG_ASUS_WIRELESS is not set
> # CONFIG_ASUS_WMI is not set
> # CONFIG_ASUS_TF103C_DOCK is not set
> # CONFIG_MERAKI_MX100 is not set
> # CONFIG_EEEPC_LAPTOP is not set
> CONFIG_X86_PLATFORM_DRIVERS_DELL=y
> CONFIG_ALIENWARE_WMI=m
> # CONFIG_DCDBAS is not set
> CONFIG_DELL_RBU=m
> CONFIG_DELL_SMBIOS=m
> CONFIG_DELL_SMBIOS_WMI=y
> CONFIG_DELL_SMO8800=m
> CONFIG_DELL_WMI_AIO=m
> CONFIG_DELL_WMI_DESCRIPTOR=m
> CONFIG_DELL_WMI_DDV=m
> CONFIG_DELL_WMI_LED=m
> # CONFIG_FUJITSU_LAPTOP is not set
> # CONFIG_FUJITSU_TABLET is not set
> # CONFIG_GPD_POCKET_FAN is not set
> CONFIG_X86_PLATFORM_DRIVERS_HP=y
> CONFIG_HP_ACCEL=m
> CONFIG_HP_WMI=m
> # CONFIG_WIRELESS_HOTKEY is not set
> CONFIG_IBM_RTL=y
> # CONFIG_SENSORS_HDAPS is not set
> # CONFIG_THINKPAD_ACPI is not set
> # CONFIG_THINKPAD_LMI is not set
> CONFIG_INTEL_ATOMISP2_PDX86=y
> CONFIG_INTEL_ATOMISP2_LED=m
> # CONFIG_INTEL_SAR_INT1092 is not set
> # CONFIG_INTEL_SKL_INT3472 is not set
> # CONFIG_INTEL_PMC_CORE is not set
> # CONFIG_INTEL_PMT_TELEMETRY is not set
> # CONFIG_INTEL_PMT_CRASHLOG is not set
> 
> #
> # Intel Speed Select Technology interface support
> #
> # CONFIG_INTEL_SPEED_SELECT_INTERFACE is not set
> # end of Intel Speed Select Technology interface support
> 
> # CONFIG_INTEL_WMI_SBL_FW_UPDATE is not set
> # CONFIG_INTEL_WMI_THUNDERBOLT is not set
> 
> #
> # Intel Uncore Frequency Control
> #
> # CONFIG_INTEL_UNCORE_FREQ_CONTROL is not set
> # end of Intel Uncore Frequency Control
> 
> # CONFIG_INTEL_HID_EVENT is not set
> # CONFIG_INTEL_VBTN is not set
> # CONFIG_INTEL_PUNIT_IPC is not set
> # CONFIG_INTEL_RST is not set
> CONFIG_INTEL_SDSI=y
> # CONFIG_INTEL_SMARTCONNECT is not set
> CONFIG_INTEL_TPMI=m
> CONFIG_INTEL_VSEC=y
> # CONFIG_MSI_WMI is not set
> # CONFIG_PCENGINES_APU2 is not set
> CONFIG_BARCO_P50_GPIO=y
> # CONFIG_SAMSUNG_LAPTOP is not set
> # CONFIG_SAMSUNG_Q10 is not set
> # CONFIG_TOSHIBA_BT_RFKILL is not set
> # CONFIG_TOSHIBA_HAPS is not set
> # CONFIG_TOSHIBA_WMI is not set
> # CONFIG_ACPI_CMPC is not set
> # CONFIG_LG_LAPTOP is not set
> # CONFIG_PANASONIC_LAPTOP is not set
> # CONFIG_SYSTEM76_ACPI is not set
> # CONFIG_TOPSTAR_LAPTOP is not set
> # CONFIG_SERIAL_MULTI_INSTANTIATE is not set
> CONFIG_MLX_PLATFORM=m
> # CONFIG_INTEL_IPS is not set
> CONFIG_INTEL_SCU_IPC=y
> CONFIG_INTEL_SCU=y
> CONFIG_INTEL_SCU_PCI=y
> # CONFIG_INTEL_SCU_PLATFORM is not set
> CONFIG_INTEL_SCU_IPC_UTIL=m
> # CONFIG_SIEMENS_SIMATIC_IPC is not set
> # CONFIG_WINMATE_FM07_KEYS is not set
> CONFIG_P2SB=y
> CONFIG_HAVE_CLK=y
> CONFIG_HAVE_CLK_PREPARE=y
> CONFIG_COMMON_CLK=y
> CONFIG_COMMON_CLK_WM831X=y
> CONFIG_LMK04832=y
> CONFIG_COMMON_CLK_MAX77686=m
> CONFIG_COMMON_CLK_MAX9485=m
> CONFIG_COMMON_CLK_RK808=m
> CONFIG_COMMON_CLK_SI5341=m
> # CONFIG_COMMON_CLK_SI5351 is not set
> # CONFIG_COMMON_CLK_SI514 is not set
> # CONFIG_COMMON_CLK_SI544 is not set
> # CONFIG_COMMON_CLK_SI570 is not set
> # CONFIG_COMMON_CLK_CDCE706 is not set
> CONFIG_COMMON_CLK_CDCE925=m
> # CONFIG_COMMON_CLK_CS2000_CP is not set
> CONFIG_COMMON_CLK_S2MPS11=m
> # CONFIG_COMMON_CLK_AXI_CLKGEN is not set
> CONFIG_COMMON_CLK_PALMAS=m
> # CONFIG_COMMON_CLK_RS9_PCIE is not set
> CONFIG_COMMON_CLK_VC5=m
> # CONFIG_COMMON_CLK_VC7 is not set
> CONFIG_COMMON_CLK_BD718XX=y
> # CONFIG_COMMON_CLK_FIXED_MMIO is not set
> # CONFIG_CLK_LGM_CGU is not set
> CONFIG_XILINX_VCU=m
> # CONFIG_COMMON_CLK_XLNX_CLKWZRD is not set
> # CONFIG_HWSPINLOCK is not set
> 
> #
> # Clock Source drivers
> #
> CONFIG_CLKEVT_I8253=y
> CONFIG_I8253_LOCK=y
> CONFIG_CLKBLD_I8253=y
> # end of Clock Source drivers
> 
> # CONFIG_MAILBOX is not set
> # CONFIG_IOMMU_SUPPORT is not set
> 
> #
> # Remoteproc drivers
> #
> CONFIG_REMOTEPROC=y
> CONFIG_REMOTEPROC_CDEV=y
> # end of Remoteproc drivers
> 
> #
> # Rpmsg drivers
> #
> CONFIG_RPMSG=y
> # CONFIG_RPMSG_CHAR is not set
> CONFIG_RPMSG_CTRL=m
> CONFIG_RPMSG_NS=y
> CONFIG_RPMSG_VIRTIO=y
> # end of Rpmsg drivers
> 
> CONFIG_SOUNDWIRE=y
> 
> #
> # SoundWire Devices
> #
> 
> #
> # SOC (System On Chip) specific Drivers
> #
> 
> #
> # Amlogic SoC drivers
> #
> # end of Amlogic SoC drivers
> 
> #
> # Broadcom SoC drivers
> #
> # end of Broadcom SoC drivers
> 
> #
> # NXP/Freescale QorIQ SoC drivers
> #
> # end of NXP/Freescale QorIQ SoC drivers
> 
> #
> # fujitsu SoC drivers
> #
> # end of fujitsu SoC drivers
> 
> #
> # i.MX SoC drivers
> #
> # end of i.MX SoC drivers
> 
> #
> # Enable LiteX SoC Builder specific drivers
> #
> CONFIG_LITEX=y
> CONFIG_LITEX_SOC_CONTROLLER=m
> # end of Enable LiteX SoC Builder specific drivers
> 
> # CONFIG_WPCM450_SOC is not set
> 
> #
> # Qualcomm SoC drivers
> #
> # CONFIG_QCOM_PMIC_GLINK is not set
> # end of Qualcomm SoC drivers
> 
> CONFIG_SOC_TI=y
> 
> #
> # Xilinx SoC drivers
> #
> # end of Xilinx SoC drivers
> # end of SOC (System On Chip) specific Drivers
> 
> # CONFIG_PM_DEVFREQ is not set
> CONFIG_EXTCON=y
> 
> #
> # Extcon Device Drivers
> #
> # CONFIG_EXTCON_FSA9480 is not set
> CONFIG_EXTCON_GPIO=m
> # CONFIG_EXTCON_INTEL_INT3496 is not set
> # CONFIG_EXTCON_MAX14577 is not set
> CONFIG_EXTCON_MAX3355=m
> CONFIG_EXTCON_MAX77843=m
> CONFIG_EXTCON_PALMAS=m
> # CONFIG_EXTCON_PTN5150 is not set
> CONFIG_EXTCON_RT8973A=y
> CONFIG_EXTCON_SM5502=m
> CONFIG_EXTCON_USB_GPIO=y
> # CONFIG_EXTCON_USBC_TUSB320 is not set
> # CONFIG_MEMORY is not set
> # CONFIG_IIO is not set
> CONFIG_NTB=m
> CONFIG_NTB_MSI=y
> # CONFIG_NTB_AMD is not set
> CONFIG_NTB_IDT=m
> CONFIG_NTB_INTEL=m
> CONFIG_NTB_EPF=m
> CONFIG_NTB_SWITCHTEC=m
> CONFIG_NTB_PINGPONG=m
> # CONFIG_NTB_TOOL is not set
> CONFIG_NTB_PERF=m
> # CONFIG_NTB_MSI_TEST is not set
> # CONFIG_NTB_TRANSPORT is not set
> # CONFIG_PWM is not set
> 
> #
> # IRQ chip support
> #
> CONFIG_IRQCHIP=y
> # CONFIG_AL_FIC is not set
> CONFIG_MADERA_IRQ=y
> CONFIG_XILINX_INTC=y
> # end of IRQ chip support
> 
> CONFIG_IPACK_BUS=y
> # CONFIG_BOARD_TPCI200 is not set
> # CONFIG_SERIAL_IPOCTAL is not set
> CONFIG_RESET_CONTROLLER=y
> CONFIG_RESET_INTEL_GW=y
> CONFIG_RESET_SIMPLE=y
> CONFIG_RESET_TI_SYSCON=y
> # CONFIG_RESET_TI_TPS380X is not set
> 
> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=y
> CONFIG_GENERIC_PHY_MIPI_DPHY=y
> # CONFIG_USB_LGM_PHY is not set
> CONFIG_PHY_CAN_TRANSCEIVER=y
> 
> #
> # PHY drivers for Broadcom platforms
> #
> CONFIG_BCM_KONA_USB2_PHY=y
> # end of PHY drivers for Broadcom platforms
> 
> # CONFIG_PHY_CADENCE_TORRENT is not set
> CONFIG_PHY_CADENCE_DPHY=m
> CONFIG_PHY_CADENCE_DPHY_RX=m
> CONFIG_PHY_CADENCE_SIERRA=y
> # CONFIG_PHY_CADENCE_SALVO is not set
> CONFIG_PHY_PXA_28NM_HSIC=y
> CONFIG_PHY_PXA_28NM_USB2=m
> CONFIG_PHY_LAN966X_SERDES=y
> CONFIG_PHY_MAPPHONE_MDM6600=m
> CONFIG_PHY_OCELOT_SERDES=m
> CONFIG_PHY_QCOM_USB_HS=m
> CONFIG_PHY_QCOM_USB_HSIC=m
> # CONFIG_PHY_SAMSUNG_USB2 is not set
> # CONFIG_PHY_TUSB1210 is not set
> CONFIG_PHY_INTEL_LGM_COMBO=y
> CONFIG_PHY_INTEL_LGM_EMMC=m
> # end of PHY Subsystem
> 
> # CONFIG_POWERCAP is not set
> CONFIG_MCB=m
> # CONFIG_MCB_PCI is not set
> CONFIG_MCB_LPC=m
> 
> #
> # Performance monitor support
> #
> # end of Performance monitor support
> 
> CONFIG_RAS=y
> CONFIG_USB4=y
> CONFIG_USB4_DEBUGFS_WRITE=y
> CONFIG_USB4_DEBUGFS_MARGINING=y
> # CONFIG_USB4_DMA_TEST is not set
> 
> #
> # Android
> #
> # CONFIG_ANDROID_BINDER_IPC is not set
> # end of Android
> 
> # CONFIG_DAX is not set
> CONFIG_NVMEM=y
> CONFIG_NVMEM_SYSFS=y
> CONFIG_NVMEM_RAVE_SP_EEPROM=m
> CONFIG_NVMEM_RMEM=y
> # CONFIG_NVMEM_SPMI_SDAM is not set
> # CONFIG_NVMEM_U_BOOT_ENV is not set
> 
> #
> # HW tracing support
> #
> CONFIG_STM=y
> CONFIG_STM_PROTO_BASIC=m
> # CONFIG_STM_PROTO_SYS_T is not set
> CONFIG_STM_DUMMY=y
> CONFIG_STM_SOURCE_CONSOLE=m
> CONFIG_STM_SOURCE_HEARTBEAT=y
> CONFIG_STM_SOURCE_FTRACE=y
> # CONFIG_INTEL_TH is not set
> # end of HW tracing support
> 
> # CONFIG_FPGA is not set
> CONFIG_FSI=m
> # CONFIG_FSI_NEW_DEV_NODE is not set
> CONFIG_FSI_MASTER_GPIO=m
> # CONFIG_FSI_MASTER_HUB is not set
> # CONFIG_FSI_MASTER_ASPEED is not set
> # CONFIG_FSI_SCOM is not set
> # CONFIG_FSI_SBEFIFO is not set
> CONFIG_MULTIPLEXER=y
> 
> #
> # Multiplexer drivers
> #
> # CONFIG_MUX_ADG792A is not set
> CONFIG_MUX_ADGS1408=y
> CONFIG_MUX_GPIO=y
> CONFIG_MUX_MMIO=m
> # end of Multiplexer drivers
> 
> CONFIG_PM_OPP=y
> CONFIG_SIOX=m
> # CONFIG_SIOX_BUS_GPIO is not set
> CONFIG_SLIMBUS=m
> CONFIG_SLIM_QCOM_CTRL=m
> CONFIG_INTERCONNECT=y
> # CONFIG_COUNTER is not set
> # CONFIG_MOST is not set
> # CONFIG_PECI is not set
> CONFIG_HTE=y
> # end of Device Drivers
> 
> #
> # File systems
> #
> CONFIG_DCACHE_WORD_ACCESS=y
> CONFIG_VALIDATE_FS_PARSER=y
> # CONFIG_FS_DAX is not set
> CONFIG_FS_POSIX_ACL=y
> CONFIG_EXPORTFS=y
> CONFIG_EXPORTFS_BLOCK_OPS=y
> CONFIG_FILE_LOCKING=y
> # CONFIG_FS_ENCRYPTION is not set
> # CONFIG_FS_VERITY is not set
> CONFIG_FSNOTIFY=y
> # CONFIG_DNOTIFY is not set
> CONFIG_INOTIFY_USER=y
> CONFIG_FANOTIFY=y
> CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
> # CONFIG_QUOTA is not set
> CONFIG_AUTOFS4_FS=y
> CONFIG_AUTOFS_FS=y
> CONFIG_FUSE_FS=m
> CONFIG_CUSE=m
> CONFIG_VIRTIO_FS=m
> # CONFIG_OVERLAY_FS is not set
> 
> #
> # Caches
> #
> CONFIG_NETFS_SUPPORT=m
> # CONFIG_NETFS_STATS is not set
> # CONFIG_FSCACHE is not set
> # end of Caches
> 
> #
> # Pseudo filesystems
> #
> CONFIG_PROC_FS=y
> # CONFIG_PROC_KCORE is not set
> CONFIG_PROC_VMCORE=y
> # CONFIG_PROC_VMCORE_DEVICE_DUMP is not set
> CONFIG_PROC_SYSCTL=y
> CONFIG_PROC_PAGE_MONITOR=y
> # CONFIG_PROC_CHILDREN is not set
> CONFIG_PROC_PID_ARCH_STATUS=y
> CONFIG_PROC_CPU_RESCTRL=y
> CONFIG_KERNFS=y
> CONFIG_SYSFS=y
> CONFIG_TMPFS=y
> # CONFIG_TMPFS_POSIX_ACL is not set
> # CONFIG_TMPFS_XATTR is not set
> # CONFIG_TMPFS_INODE64 is not set
> # CONFIG_HUGETLBFS is not set
> CONFIG_ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=y
> CONFIG_MEMFD_CREATE=y
> CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
> CONFIG_CONFIGFS_FS=y
> # end of Pseudo filesystems
> 
> # CONFIG_MISC_FILESYSTEMS is not set
> CONFIG_NETWORK_FILESYSTEMS=y
> CONFIG_NFS_FS=y
> CONFIG_NFS_V2=y
> CONFIG_NFS_V3=y
> # CONFIG_NFS_V3_ACL is not set
> CONFIG_NFS_V4=m
> # CONFIG_NFS_V4_1 is not set
> # CONFIG_ROOT_NFS is not set
> # CONFIG_NFS_USE_LEGACY_DNS is not set
> CONFIG_NFS_USE_KERNEL_DNS=y
> CONFIG_NFS_DISABLE_UDP_SUPPORT=y
> # CONFIG_NFSD is not set
> CONFIG_GRACE_PERIOD=y
> CONFIG_LOCKD=y
> CONFIG_LOCKD_V4=y
> CONFIG_NFS_COMMON=y
> CONFIG_SUNRPC=y
> CONFIG_SUNRPC_GSS=y
> CONFIG_RPCSEC_GSS_KRB5=y
> CONFIG_RPCSEC_GSS_KRB5_CRYPTOSYSTEM=y
> CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_AES_SHA1=y
> # CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_AES_SHA2 is not set
> # CONFIG_SUNRPC_DEBUG is not set
> # CONFIG_CEPH_FS is not set
> CONFIG_CIFS=m
> CONFIG_CIFS_STATS2=y
> CONFIG_CIFS_ALLOW_INSECURE_LEGACY=y
> # CONFIG_CIFS_UPCALL is not set
> # CONFIG_CIFS_XATTR is not set
> CONFIG_CIFS_DEBUG=y
> # CONFIG_CIFS_DEBUG2 is not set
> # CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
> # CONFIG_CIFS_DFS_UPCALL is not set
> # CONFIG_CIFS_SWN_UPCALL is not set
> # CONFIG_SMB_SERVER is not set
> CONFIG_SMBFS_COMMON=m
> # CONFIG_CODA_FS is not set
> # CONFIG_AFS_FS is not set
> # CONFIG_9P_FS is not set
> CONFIG_NLS=y
> CONFIG_NLS_DEFAULT="iso8859-1"
> CONFIG_NLS_CODEPAGE_437=y
> # CONFIG_NLS_CODEPAGE_737 is not set
> # CONFIG_NLS_CODEPAGE_775 is not set
> CONFIG_NLS_CODEPAGE_850=y
> CONFIG_NLS_CODEPAGE_852=y
> CONFIG_NLS_CODEPAGE_855=m
> CONFIG_NLS_CODEPAGE_857=y
> CONFIG_NLS_CODEPAGE_860=y
> CONFIG_NLS_CODEPAGE_861=y
> # CONFIG_NLS_CODEPAGE_862 is not set
> # CONFIG_NLS_CODEPAGE_863 is not set
> # CONFIG_NLS_CODEPAGE_864 is not set
> # CONFIG_NLS_CODEPAGE_865 is not set
> # CONFIG_NLS_CODEPAGE_866 is not set
> CONFIG_NLS_CODEPAGE_869=m
> CONFIG_NLS_CODEPAGE_936=y
> CONFIG_NLS_CODEPAGE_950=m
> CONFIG_NLS_CODEPAGE_932=y
> # CONFIG_NLS_CODEPAGE_949 is not set
> CONFIG_NLS_CODEPAGE_874=m
> CONFIG_NLS_ISO8859_8=m
> # CONFIG_NLS_CODEPAGE_1250 is not set
> # CONFIG_NLS_CODEPAGE_1251 is not set
> CONFIG_NLS_ASCII=y
> CONFIG_NLS_ISO8859_1=y
> # CONFIG_NLS_ISO8859_2 is not set
> # CONFIG_NLS_ISO8859_3 is not set
> # CONFIG_NLS_ISO8859_4 is not set
> # CONFIG_NLS_ISO8859_5 is not set
> CONFIG_NLS_ISO8859_6=m
> CONFIG_NLS_ISO8859_7=y
> CONFIG_NLS_ISO8859_9=m
> CONFIG_NLS_ISO8859_13=m
> CONFIG_NLS_ISO8859_14=y
> # CONFIG_NLS_ISO8859_15 is not set
> CONFIG_NLS_KOI8_R=y
> CONFIG_NLS_KOI8_U=m
> CONFIG_NLS_MAC_ROMAN=y
> CONFIG_NLS_MAC_CELTIC=y
> CONFIG_NLS_MAC_CENTEURO=m
> CONFIG_NLS_MAC_CROATIAN=m
> CONFIG_NLS_MAC_CYRILLIC=m
> CONFIG_NLS_MAC_GAELIC=m
> CONFIG_NLS_MAC_GREEK=y
> CONFIG_NLS_MAC_ICELAND=m
> CONFIG_NLS_MAC_INUIT=m
> CONFIG_NLS_MAC_ROMANIAN=y
> CONFIG_NLS_MAC_TURKISH=y
> CONFIG_NLS_UTF8=y
> # CONFIG_DLM is not set
> CONFIG_UNICODE=m
> # CONFIG_UNICODE_NORMALIZATION_SELFTEST is not set
> # end of File systems
> 
> #
> # Security options
> #
> CONFIG_KEYS=y
> # CONFIG_KEYS_REQUEST_CACHE is not set
> # CONFIG_PERSISTENT_KEYRINGS is not set
> # CONFIG_TRUSTED_KEYS is not set
> # CONFIG_ENCRYPTED_KEYS is not set
> # CONFIG_KEY_DH_OPERATIONS is not set
> # CONFIG_SECURITY_DMESG_RESTRICT is not set
> CONFIG_SECURITY=y
> CONFIG_SECURITYFS=y
> # CONFIG_SECURITY_NETWORK is not set
> CONFIG_SECURITY_PATH=y
> CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
> CONFIG_HARDENED_USERCOPY=y
> CONFIG_FORTIFY_SOURCE=y
> CONFIG_STATIC_USERMODEHELPER=y
> CONFIG_STATIC_USERMODEHELPER_PATH="/sbin/usermode-helper"
> # CONFIG_SECURITY_SMACK is not set
> # CONFIG_SECURITY_TOMOYO is not set
> # CONFIG_SECURITY_APPARMOR is not set
> CONFIG_SECURITY_YAMA=y
> CONFIG_SECURITY_SAFESETID=y
> # CONFIG_SECURITY_LOCKDOWN_LSM is not set
> CONFIG_SECURITY_LANDLOCK=y
> # CONFIG_INTEGRITY is not set
> CONFIG_DEFAULT_SECURITY_DAC=y
> CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,bpf"
> 
> #
> # Kernel hardening options
> #
> 
> #
> # Memory initialization
> #
> CONFIG_INIT_STACK_NONE=y
> # CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
> CONFIG_INIT_ON_FREE_DEFAULT_ON=y
> CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
> # CONFIG_ZERO_CALL_USED_REGS is not set
> # end of Memory initialization
> 
> CONFIG_RANDSTRUCT_NONE=y
> # end of Kernel hardening options
> # end of Security options
> 
> CONFIG_CRYPTO=y
> 
> #
> # Crypto core or helper
> #
> CONFIG_CRYPTO_ALGAPI=y
> CONFIG_CRYPTO_ALGAPI2=y
> CONFIG_CRYPTO_AEAD=y
> CONFIG_CRYPTO_AEAD2=y
> CONFIG_CRYPTO_SKCIPHER=y
> CONFIG_CRYPTO_SKCIPHER2=y
> CONFIG_CRYPTO_HASH=y
> CONFIG_CRYPTO_HASH2=y
> CONFIG_CRYPTO_RNG=y
> CONFIG_CRYPTO_RNG2=y
> CONFIG_CRYPTO_RNG_DEFAULT=y
> CONFIG_CRYPTO_AKCIPHER2=y
> CONFIG_CRYPTO_AKCIPHER=y
> CONFIG_CRYPTO_KPP2=y
> CONFIG_CRYPTO_KPP=y
> CONFIG_CRYPTO_ACOMP2=y
> CONFIG_CRYPTO_MANAGER=y
> CONFIG_CRYPTO_MANAGER2=y
> # CONFIG_CRYPTO_USER is not set
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
> CONFIG_CRYPTO_NULL=y
> CONFIG_CRYPTO_NULL2=y
> CONFIG_CRYPTO_CRYPTD=y
> CONFIG_CRYPTO_AUTHENC=y
> # CONFIG_CRYPTO_TEST is not set
> CONFIG_CRYPTO_SIMD=y
> CONFIG_CRYPTO_ENGINE=y
> # end of Crypto core or helper
> 
> #
> # Public-key cryptography
> #
> CONFIG_CRYPTO_RSA=y
> CONFIG_CRYPTO_DH=y
> # CONFIG_CRYPTO_DH_RFC7919_GROUPS is not set
> CONFIG_CRYPTO_ECC=y
> CONFIG_CRYPTO_ECDH=y
> CONFIG_CRYPTO_ECDSA=m
> # CONFIG_CRYPTO_ECRDSA is not set
> CONFIG_CRYPTO_SM2=m
> CONFIG_CRYPTO_CURVE25519=y
> # end of Public-key cryptography
> 
> #
> # Block ciphers
> #
> CONFIG_CRYPTO_AES=y
> CONFIG_CRYPTO_AES_TI=m
> CONFIG_CRYPTO_ARIA=y
> CONFIG_CRYPTO_BLOWFISH=y
> CONFIG_CRYPTO_BLOWFISH_COMMON=y
> # CONFIG_CRYPTO_CAMELLIA is not set
> CONFIG_CRYPTO_CAST_COMMON=y
> CONFIG_CRYPTO_CAST5=y
> CONFIG_CRYPTO_CAST6=y
> # CONFIG_CRYPTO_DES is not set
> # CONFIG_CRYPTO_FCRYPT is not set
> CONFIG_CRYPTO_SERPENT=y
> CONFIG_CRYPTO_SM4=y
> CONFIG_CRYPTO_SM4_GENERIC=y
> CONFIG_CRYPTO_TWOFISH=y
> CONFIG_CRYPTO_TWOFISH_COMMON=y
> # end of Block ciphers
> 
> #
> # Length-preserving ciphers and modes
> #
> CONFIG_CRYPTO_ADIANTUM=m
> CONFIG_CRYPTO_CHACHA20=y
> CONFIG_CRYPTO_CBC=y
> # CONFIG_CRYPTO_CFB is not set
> CONFIG_CRYPTO_CTR=y
> CONFIG_CRYPTO_CTS=m
> CONFIG_CRYPTO_ECB=y
> CONFIG_CRYPTO_HCTR2=m
> CONFIG_CRYPTO_KEYWRAP=y
> CONFIG_CRYPTO_LRW=m
> CONFIG_CRYPTO_OFB=m
> CONFIG_CRYPTO_PCBC=y
> CONFIG_CRYPTO_XCTR=m
> CONFIG_CRYPTO_XTS=m
> CONFIG_CRYPTO_NHPOLY1305=y
> # end of Length-preserving ciphers and modes
> 
> #
> # AEAD (authenticated encryption with associated data) ciphers
> #
> CONFIG_CRYPTO_AEGIS128=y
> CONFIG_CRYPTO_CHACHA20POLY1305=y
> CONFIG_CRYPTO_CCM=m
> CONFIG_CRYPTO_GCM=m
> CONFIG_CRYPTO_SEQIV=y
> # CONFIG_CRYPTO_ECHAINIV is not set
> # CONFIG_CRYPTO_ESSIV is not set
> # end of AEAD (authenticated encryption with associated data) ciphers
> 
> #
> # Hashes, digests, and MACs
> #
> # CONFIG_CRYPTO_BLAKE2B is not set
> CONFIG_CRYPTO_CMAC=m
> CONFIG_CRYPTO_GHASH=m
> CONFIG_CRYPTO_HMAC=y
> CONFIG_CRYPTO_MD4=m
> CONFIG_CRYPTO_MD5=y
> # CONFIG_CRYPTO_MICHAEL_MIC is not set
> CONFIG_CRYPTO_POLYVAL=m
> CONFIG_CRYPTO_POLY1305=y
> CONFIG_CRYPTO_RMD160=y
> CONFIG_CRYPTO_SHA1=y
> CONFIG_CRYPTO_SHA256=y
> CONFIG_CRYPTO_SHA512=y
> CONFIG_CRYPTO_SHA3=y
> CONFIG_CRYPTO_SM3=m
> CONFIG_CRYPTO_SM3_GENERIC=m
> # CONFIG_CRYPTO_STREEBOG is not set
> # CONFIG_CRYPTO_VMAC is not set
> CONFIG_CRYPTO_WP512=m
> CONFIG_CRYPTO_XCBC=y
> CONFIG_CRYPTO_XXHASH=m
> # end of Hashes, digests, and MACs
> 
> #
> # CRCs (cyclic redundancy checks)
> #
> CONFIG_CRYPTO_CRC32C=m
> CONFIG_CRYPTO_CRC32=y
> CONFIG_CRYPTO_CRCT10DIF=y
> CONFIG_CRYPTO_CRC64_ROCKSOFT=m
> # end of CRCs (cyclic redundancy checks)
> 
> #
> # Compression
> #
> CONFIG_CRYPTO_DEFLATE=m
> CONFIG_CRYPTO_LZO=y
> CONFIG_CRYPTO_842=y
> # CONFIG_CRYPTO_LZ4 is not set
> CONFIG_CRYPTO_LZ4HC=y
> # CONFIG_CRYPTO_ZSTD is not set
> # end of Compression
> 
> #
> # Random number generation
> #
> CONFIG_CRYPTO_ANSI_CPRNG=y
> CONFIG_CRYPTO_DRBG_MENU=y
> CONFIG_CRYPTO_DRBG_HMAC=y
> CONFIG_CRYPTO_DRBG_HASH=y
> # CONFIG_CRYPTO_DRBG_CTR is not set
> CONFIG_CRYPTO_DRBG=y
> CONFIG_CRYPTO_JITTERENTROPY=y
> # end of Random number generation
> 
> #
> # Userspace interface
> #
> # CONFIG_CRYPTO_USER_API_HASH is not set
> # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
> # CONFIG_CRYPTO_USER_API_RNG is not set
> # CONFIG_CRYPTO_USER_API_AEAD is not set
> # end of Userspace interface
> 
> CONFIG_CRYPTO_HASH_INFO=y
> 
> #
> # Accelerated Cryptographic Algorithms for CPU (x86)
> #
> CONFIG_CRYPTO_CURVE25519_X86=y
> CONFIG_CRYPTO_AES_NI_INTEL=m
> CONFIG_CRYPTO_BLOWFISH_X86_64=y
> CONFIG_CRYPTO_CAMELLIA_X86_64=y
> CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=y
> # CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64 is not set
> CONFIG_CRYPTO_CAST5_AVX_X86_64=y
> CONFIG_CRYPTO_CAST6_AVX_X86_64=m
> # CONFIG_CRYPTO_DES3_EDE_X86_64 is not set
> CONFIG_CRYPTO_SERPENT_SSE2_X86_64=y
> # CONFIG_CRYPTO_SERPENT_AVX_X86_64 is not set
> # CONFIG_CRYPTO_SERPENT_AVX2_X86_64 is not set
> CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64=m
> CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64=m
> CONFIG_CRYPTO_TWOFISH_X86_64=m
> CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=m
> CONFIG_CRYPTO_TWOFISH_AVX_X86_64=m
> CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64=y
> CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64=y
> CONFIG_CRYPTO_ARIA_GFNI_AVX512_X86_64=y
> CONFIG_CRYPTO_CHACHA20_X86_64=m
> CONFIG_CRYPTO_AEGIS128_AESNI_SSE2=y
> CONFIG_CRYPTO_NHPOLY1305_SSE2=y
> CONFIG_CRYPTO_NHPOLY1305_AVX2=y
> CONFIG_CRYPTO_BLAKE2S_X86=y
> # CONFIG_CRYPTO_POLYVAL_CLMUL_NI is not set
> # CONFIG_CRYPTO_POLY1305_X86_64 is not set
> CONFIG_CRYPTO_SHA1_SSSE3=m
> # CONFIG_CRYPTO_SHA256_SSSE3 is not set
> CONFIG_CRYPTO_SHA512_SSSE3=y
> CONFIG_CRYPTO_SM3_AVX_X86_64=m
> CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=y
> CONFIG_CRYPTO_CRC32C_INTEL=y
> CONFIG_CRYPTO_CRC32_PCLMUL=y
> # end of Accelerated Cryptographic Algorithms for CPU (x86)
> 
> CONFIG_CRYPTO_HW=y
> CONFIG_CRYPTO_DEV_PADLOCK=y
> # CONFIG_CRYPTO_DEV_PADLOCK_AES is not set
> CONFIG_CRYPTO_DEV_PADLOCK_SHA=m
> CONFIG_CRYPTO_DEV_ATMEL_I2C=y
> CONFIG_CRYPTO_DEV_ATMEL_ECC=m
> CONFIG_CRYPTO_DEV_ATMEL_SHA204A=y
> # CONFIG_CRYPTO_DEV_CCP is not set
> CONFIG_CRYPTO_DEV_QAT=y
> # CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
> CONFIG_CRYPTO_DEV_QAT_C3XXX=y
> CONFIG_CRYPTO_DEV_QAT_C62X=y
> # CONFIG_CRYPTO_DEV_QAT_4XXX is not set
> # CONFIG_CRYPTO_DEV_QAT_DH895xCCVF is not set
> CONFIG_CRYPTO_DEV_QAT_C3XXXVF=m
> CONFIG_CRYPTO_DEV_QAT_C62XVF=y
> CONFIG_CRYPTO_DEV_NITROX=y
> CONFIG_CRYPTO_DEV_NITROX_CNN55XX=y
> # CONFIG_CRYPTO_DEV_VIRTIO is not set
> CONFIG_CRYPTO_DEV_SAFEXCEL=y
> # CONFIG_CRYPTO_DEV_CCREE is not set
> CONFIG_CRYPTO_DEV_AMLOGIC_GXL=y
> CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG=y
> # CONFIG_ASYMMETRIC_KEY_TYPE is not set
> 
> #
> # Certificates for signature checking
> #
> # CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
> # end of Certificates for signature checking
> 
> CONFIG_BINARY_PRINTF=y
> 
> #
> # Library routines
> #
> CONFIG_LINEAR_RANGES=y
> # CONFIG_PACKING is not set
> CONFIG_BITREVERSE=y
> CONFIG_GENERIC_STRNCPY_FROM_USER=y
> CONFIG_GENERIC_STRNLEN_USER=y
> CONFIG_GENERIC_NET_UTILS=y
> CONFIG_CORDIC=m
> CONFIG_PRIME_NUMBERS=m
> CONFIG_RATIONAL=y
> CONFIG_GENERIC_PCI_IOMAP=y
> CONFIG_GENERIC_IOMAP=y
> CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
> CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
> CONFIG_ARCH_USE_SYM_ANNOTATIONS=y
> 
> #
> # Crypto library routines
> #
> CONFIG_CRYPTO_LIB_UTILS=y
> CONFIG_CRYPTO_LIB_AES=y
> CONFIG_CRYPTO_LIB_GF128MUL=m
> CONFIG_CRYPTO_ARCH_HAVE_LIB_BLAKE2S=y
> CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
> CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=m
> CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
> CONFIG_CRYPTO_LIB_CHACHA=m
> CONFIG_CRYPTO_ARCH_HAVE_LIB_CURVE25519=y
> CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
> CONFIG_CRYPTO_LIB_CURVE25519=m
> CONFIG_CRYPTO_LIB_DES=y
> CONFIG_CRYPTO_LIB_POLY1305_RSIZE=11
> CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
> # CONFIG_CRYPTO_LIB_POLY1305 is not set
> # CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
> CONFIG_CRYPTO_LIB_SHA1=y
> CONFIG_CRYPTO_LIB_SHA256=y
> # end of Crypto library routines
> 
> CONFIG_CRC_CCITT=m
> CONFIG_CRC16=y
> # CONFIG_CRC_T10DIF is not set
> CONFIG_CRC64_ROCKSOFT=m
> CONFIG_CRC_ITU_T=m
> CONFIG_CRC32=y
> # CONFIG_CRC32_SELFTEST is not set
> # CONFIG_CRC32_SLICEBY8 is not set
> # CONFIG_CRC32_SLICEBY4 is not set
> # CONFIG_CRC32_SARWATE is not set
> CONFIG_CRC32_BIT=y
> CONFIG_CRC64=m
> CONFIG_CRC4=m
> # CONFIG_CRC7 is not set
> CONFIG_LIBCRC32C=m
> CONFIG_CRC8=y
> CONFIG_XXHASH=y
> # CONFIG_RANDOM32_SELFTEST is not set
> CONFIG_842_COMPRESS=y
> CONFIG_842_DECOMPRESS=y
> CONFIG_ZLIB_INFLATE=y
> CONFIG_ZLIB_DEFLATE=m
> CONFIG_LZO_COMPRESS=y
> CONFIG_LZO_DECOMPRESS=y
> CONFIG_LZ4_COMPRESS=m
> CONFIG_LZ4HC_COMPRESS=y
> CONFIG_LZ4_DECOMPRESS=y
> CONFIG_ZSTD_COMMON=y
> CONFIG_ZSTD_DECOMPRESS=y
> CONFIG_XZ_DEC=y
> # CONFIG_XZ_DEC_X86 is not set
> # CONFIG_XZ_DEC_POWERPC is not set
> CONFIG_XZ_DEC_IA64=y
> # CONFIG_XZ_DEC_ARM is not set
> CONFIG_XZ_DEC_ARMTHUMB=y
> CONFIG_XZ_DEC_SPARC=y
> CONFIG_XZ_DEC_MICROLZMA=y
> CONFIG_XZ_DEC_BCJ=y
> # CONFIG_XZ_DEC_TEST is not set
> CONFIG_DECOMPRESS_GZIP=y
> CONFIG_DECOMPRESS_BZIP2=y
> CONFIG_DECOMPRESS_LZMA=y
> CONFIG_DECOMPRESS_XZ=y
> CONFIG_DECOMPRESS_LZO=y
> CONFIG_DECOMPRESS_LZ4=y
> CONFIG_DECOMPRESS_ZSTD=y
> CONFIG_GENERIC_ALLOCATOR=y
> CONFIG_BCH=m
> CONFIG_XARRAY_MULTI=y
> CONFIG_ASSOCIATIVE_ARRAY=y
> CONFIG_HAS_IOMEM=y
> CONFIG_HAS_IOPORT_MAP=y
> CONFIG_HAS_DMA=y
> CONFIG_NEED_SG_DMA_LENGTH=y
> CONFIG_NEED_DMA_MAP_STATE=y
> CONFIG_ARCH_DMA_ADDR_T_64BIT=y
> CONFIG_SWIOTLB=y
> CONFIG_DMA_CMA=y
> # CONFIG_DMA_PERNUMA_CMA is not set
> 
> #
> # Default contiguous memory area size:
> #
> CONFIG_CMA_SIZE_MBYTES=0
> CONFIG_CMA_SIZE_PERCENTAGE=0
> # CONFIG_CMA_SIZE_SEL_MBYTES is not set
> # CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
> CONFIG_CMA_SIZE_SEL_MIN=y
> # CONFIG_CMA_SIZE_SEL_MAX is not set
> CONFIG_CMA_ALIGNMENT=8
> # CONFIG_DMA_API_DEBUG is not set
> # CONFIG_DMA_MAP_BENCHMARK is not set
> CONFIG_SGL_ALLOC=y
> CONFIG_DQL=y
> CONFIG_GLOB=y
> # CONFIG_GLOB_SELFTEST is not set
> CONFIG_NLATTR=y
> CONFIG_CLZ_TAB=y
> # CONFIG_IRQ_POLL is not set
> CONFIG_MPILIB=y
> CONFIG_OID_REGISTRY=y
> CONFIG_HAVE_GENERIC_VDSO=y
> CONFIG_GENERIC_GETTIMEOFDAY=y
> CONFIG_GENERIC_VDSO_TIME_NS=y
> CONFIG_ARCH_HAS_PMEM_API=y
> CONFIG_MEMREGION=y
> CONFIG_ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION=y
> CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
> CONFIG_ARCH_HAS_COPY_MC=y
> CONFIG_ARCH_STACKWALK=y
> CONFIG_STACKDEPOT=y
> CONFIG_STACKDEPOT_ALWAYS_INIT=y
> # end of Library routines
> 
> #
> # Kernel hacking
> #
> 
> #
> # printk and dmesg options
> #
> CONFIG_PRINTK_TIME=y
> CONFIG_PRINTK_CALLER=y
> # CONFIG_STACKTRACE_BUILD_ID is not set
> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
> CONFIG_CONSOLE_LOGLEVEL_QUIET=4
> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
> # CONFIG_BOOT_PRINTK_DELAY is not set
> # CONFIG_DYNAMIC_DEBUG is not set
> # CONFIG_DYNAMIC_DEBUG_CORE is not set
> # CONFIG_SYMBOLIC_ERRNAME is not set
> CONFIG_DEBUG_BUGVERBOSE=y
> # end of printk and dmesg options
> 
> CONFIG_DEBUG_KERNEL=y
> # CONFIG_DEBUG_MISC is not set
> 
> #
> # Compile-time checks and compiler options
> #
> CONFIG_DEBUG_INFO=y
> CONFIG_AS_HAS_NON_CONST_LEB128=y
> # CONFIG_DEBUG_INFO_NONE is not set
> CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
> # CONFIG_DEBUG_INFO_DWARF4 is not set
> # CONFIG_DEBUG_INFO_DWARF5 is not set
> CONFIG_DEBUG_INFO_REDUCED=y
> CONFIG_DEBUG_INFO_COMPRESSED_NONE=y
> # CONFIG_DEBUG_INFO_COMPRESSED_ZLIB is not set
> # CONFIG_DEBUG_INFO_SPLIT is not set
> CONFIG_PAHOLE_HAS_SPLIT_BTF=y
> CONFIG_PAHOLE_HAS_LANG_EXCLUDE=y
> # CONFIG_GDB_SCRIPTS is not set
> CONFIG_FRAME_WARN=8192
> # CONFIG_STRIP_ASM_SYMS is not set
> CONFIG_READABLE_ASM=y
> CONFIG_HEADERS_INSTALL=y
> CONFIG_DEBUG_SECTION_MISMATCH=y
> CONFIG_SECTION_MISMATCH_WARN_ONLY=y
> # CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B is not set
> CONFIG_OBJTOOL=y
> CONFIG_VMLINUX_MAP=y
> # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> # end of Compile-time checks and compiler options
> 
> #
> # Generic Kernel Debugging Instruments
> #
> CONFIG_MAGIC_SYSRQ=y
> CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
> CONFIG_MAGIC_SYSRQ_SERIAL=y
> CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=""
> CONFIG_DEBUG_FS=y
> # CONFIG_DEBUG_FS_ALLOW_ALL is not set
> CONFIG_DEBUG_FS_DISALLOW_MOUNT=y
> # CONFIG_DEBUG_FS_ALLOW_NONE is not set
> CONFIG_HAVE_ARCH_KGDB=y
> # CONFIG_KGDB is not set
> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
> CONFIG_UBSAN=y
> # CONFIG_UBSAN_TRAP is not set
> CONFIG_CC_HAS_UBSAN_BOUNDS=y
> CONFIG_UBSAN_BOUNDS=y
> CONFIG_UBSAN_ONLY_BOUNDS=y
> CONFIG_UBSAN_SHIFT=y
> # CONFIG_UBSAN_DIV_ZERO is not set
> # CONFIG_UBSAN_BOOL is not set
> # CONFIG_UBSAN_ENUM is not set
> # CONFIG_UBSAN_ALIGNMENT is not set
> CONFIG_UBSAN_SANITIZE_ALL=y
> # CONFIG_TEST_UBSAN is not set
> CONFIG_HAVE_ARCH_KCSAN=y
> CONFIG_HAVE_KCSAN_COMPILER=y
> # end of Generic Kernel Debugging Instruments
> 
> #
> # Networking Debugging
> #
> # CONFIG_NET_DEV_REFCNT_TRACKER is not set
> # CONFIG_NET_NS_REFCNT_TRACKER is not set
> # CONFIG_DEBUG_NET is not set
> # end of Networking Debugging
> 
> #
> # Memory Debugging
> #
> CONFIG_PAGE_EXTENSION=y
> # CONFIG_DEBUG_PAGEALLOC is not set
> CONFIG_SLUB_DEBUG=y
> # CONFIG_SLUB_DEBUG_ON is not set
> CONFIG_PAGE_OWNER=y
> CONFIG_PAGE_TABLE_CHECK=y
> # CONFIG_PAGE_TABLE_CHECK_ENFORCED is not set
> CONFIG_PAGE_POISONING=y
> CONFIG_DEBUG_PAGE_REF=y
> # CONFIG_DEBUG_RODATA_TEST is not set
> CONFIG_ARCH_HAS_DEBUG_WX=y
> # CONFIG_DEBUG_WX is not set
> CONFIG_GENERIC_PTDUMP=y
> CONFIG_PTDUMP_CORE=y
> CONFIG_PTDUMP_DEBUGFS=y
> CONFIG_HAVE_DEBUG_KMEMLEAK=y
> CONFIG_DEBUG_KMEMLEAK=y
> CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE=16000
> # CONFIG_DEBUG_KMEMLEAK_TEST is not set
> # CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF is not set
> # CONFIG_DEBUG_KMEMLEAK_AUTO_SCAN is not set
> CONFIG_DEBUG_OBJECTS=y
> # CONFIG_DEBUG_OBJECTS_SELFTEST is not set
> # CONFIG_DEBUG_OBJECTS_FREE is not set
> # CONFIG_DEBUG_OBJECTS_TIMERS is not set
> # CONFIG_DEBUG_OBJECTS_WORK is not set
> # CONFIG_DEBUG_OBJECTS_RCU_HEAD is not set
> # CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER is not set
> CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
> # CONFIG_SHRINKER_DEBUG is not set
> CONFIG_DEBUG_STACK_USAGE=y
> # CONFIG_SCHED_STACK_END_CHECK is not set
> CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
> # CONFIG_DEBUG_VM is not set
> # CONFIG_DEBUG_VM_PGTABLE is not set
> CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
> # CONFIG_DEBUG_VIRTUAL is not set
> CONFIG_DEBUG_MEMORY_INIT=y
> CONFIG_DEBUG_KMAP_LOCAL=y
> CONFIG_ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP=y
> CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP=y
> CONFIG_HAVE_ARCH_KASAN=y
> CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
> CONFIG_CC_HAS_KASAN_GENERIC=y
> CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
> CONFIG_KASAN=y
> CONFIG_KASAN_GENERIC=y
> # CONFIG_KASAN_OUTLINE is not set
> CONFIG_KASAN_INLINE=y
> CONFIG_KASAN_STACK=y
> CONFIG_KASAN_VMALLOC=y
> # CONFIG_KASAN_MODULE_TEST is not set
> CONFIG_HAVE_ARCH_KFENCE=y
> # CONFIG_KFENCE is not set
> CONFIG_HAVE_ARCH_KMSAN=y
> # end of Memory Debugging
> 
> CONFIG_DEBUG_SHIRQ=y
> 
> #
> # Debug Oops, Lockups and Hangs
> #
> CONFIG_PANIC_ON_OOPS=y
> CONFIG_PANIC_ON_OOPS_VALUE=1
> CONFIG_PANIC_TIMEOUT=0
> CONFIG_LOCKUP_DETECTOR=y
> CONFIG_SOFTLOCKUP_DETECTOR=y
> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
> CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
> # CONFIG_HARDLOCKUP_DETECTOR is not set
> CONFIG_DETECT_HUNG_TASK=y
> CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=480
> # CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
> CONFIG_WQ_WATCHDOG=y
> # CONFIG_TEST_LOCKUP is not set
> # end of Debug Oops, Lockups and Hangs
> 
> #
> # Scheduler Debugging
> #
> CONFIG_SCHED_DEBUG=y
> # CONFIG_SCHEDSTATS is not set
> # end of Scheduler Debugging
> 
> # CONFIG_DEBUG_TIMEKEEPING is not set
> 
> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> CONFIG_LOCK_DEBUGGING_SUPPORT=y
> CONFIG_PROVE_LOCKING=y
> # CONFIG_PROVE_RAW_LOCK_NESTING is not set
> CONFIG_LOCK_STAT=y
> CONFIG_DEBUG_RT_MUTEXES=y
> CONFIG_DEBUG_SPINLOCK=y
> CONFIG_DEBUG_MUTEXES=y
> CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
> CONFIG_DEBUG_RWSEMS=y
> CONFIG_DEBUG_LOCK_ALLOC=y
> CONFIG_LOCKDEP=y
> CONFIG_LOCKDEP_BITS=15
> CONFIG_LOCKDEP_CHAINS_BITS=16
> CONFIG_LOCKDEP_STACK_TRACE_BITS=19
> CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
> CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
> # CONFIG_DEBUG_LOCKDEP is not set
> CONFIG_DEBUG_ATOMIC_SLEEP=y
> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> CONFIG_LOCK_TORTURE_TEST=y
> # CONFIG_WW_MUTEX_SELFTEST is not set
> # CONFIG_SCF_TORTURE_TEST is not set
> CONFIG_CSD_LOCK_WAIT_DEBUG=y
> # end of Lock Debugging (spinlocks, mutexes, etc...)
> 
> CONFIG_TRACE_IRQFLAGS=y
> CONFIG_TRACE_IRQFLAGS_NMI=y
> # CONFIG_NMI_CHECK_CPU is not set
> CONFIG_DEBUG_IRQFLAGS=y
> CONFIG_STACKTRACE=y
> # CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
> # CONFIG_DEBUG_KOBJECT is not set
> 
> #
> # Debug kernel data structures
> #
> CONFIG_DEBUG_LIST=y
> CONFIG_DEBUG_PLIST=y
> # CONFIG_DEBUG_SG is not set
> CONFIG_DEBUG_NOTIFIERS=y
> CONFIG_BUG_ON_DATA_CORRUPTION=y
> # CONFIG_DEBUG_MAPLE_TREE is not set
> # end of Debug kernel data structures
> 
> # CONFIG_DEBUG_CREDENTIALS is not set
> 
> #
> # RCU Debugging
> #
> CONFIG_PROVE_RCU=y
> CONFIG_TORTURE_TEST=y
> # CONFIG_RCU_SCALE_TEST is not set
> # CONFIG_RCU_TORTURE_TEST is not set
> # CONFIG_RCU_REF_SCALE_TEST is not set
> # CONFIG_RCU_TRACE is not set
> # CONFIG_RCU_EQS_DEBUG is not set
> # end of RCU Debugging
> 
> # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
> # CONFIG_LATENCYTOP is not set
> # CONFIG_DEBUG_CGROUP_REF is not set
> CONFIG_USER_STACKTRACE_SUPPORT=y
> CONFIG_NOP_TRACER=y
> CONFIG_HAVE_RETHOOK=y
> CONFIG_RETHOOK=y
> CONFIG_HAVE_FUNCTION_TRACER=y
> CONFIG_HAVE_DYNAMIC_FTRACE=y
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=y
> CONFIG_HAVE_DYNAMIC_FTRACE_NO_PATCHABLE=y
> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
> CONFIG_HAVE_FENTRY=y
> CONFIG_HAVE_OBJTOOL_MCOUNT=y
> CONFIG_HAVE_OBJTOOL_NOP_MCOUNT=y
> CONFIG_HAVE_C_RECORDMCOUNT=y
> CONFIG_HAVE_BUILDTIME_MCOUNT_SORT=y
> CONFIG_TRACER_MAX_TRACE=y
> CONFIG_TRACE_CLOCK=y
> CONFIG_RING_BUFFER=y
> CONFIG_EVENT_TRACING=y
> CONFIG_CONTEXT_SWITCH_TRACER=y
> CONFIG_PREEMPTIRQ_TRACEPOINTS=y
> CONFIG_TRACING=y
> CONFIG_GENERIC_TRACER=y
> CONFIG_TRACING_SUPPORT=y
> CONFIG_FTRACE=y
> # CONFIG_BOOTTIME_TRACING is not set
> CONFIG_FUNCTION_TRACER=y
> # CONFIG_DYNAMIC_FTRACE is not set
> # CONFIG_FUNCTION_PROFILER is not set
> CONFIG_STACK_TRACER=y
> # CONFIG_IRQSOFF_TRACER is not set
> # CONFIG_SCHED_TRACER is not set
> CONFIG_HWLAT_TRACER=y
> CONFIG_OSNOISE_TRACER=y
> # CONFIG_TIMERLAT_TRACER is not set
> CONFIG_MMIOTRACE=y
> CONFIG_FTRACE_SYSCALLS=y
> CONFIG_TRACER_SNAPSHOT=y
> # CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP is not set
> CONFIG_BRANCH_PROFILE_NONE=y
> # CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
> CONFIG_KPROBE_EVENTS=y
> # CONFIG_UPROBE_EVENTS is not set
> CONFIG_DYNAMIC_EVENTS=y
> CONFIG_PROBE_EVENTS=y
> CONFIG_TRACING_MAP=y
> CONFIG_SYNTH_EVENTS=y
> CONFIG_HIST_TRIGGERS=y
> CONFIG_TRACE_EVENT_INJECT=y
> # CONFIG_TRACEPOINT_BENCHMARK is not set
> # CONFIG_RING_BUFFER_BENCHMARK is not set
> CONFIG_TRACE_EVAL_MAP_FILE=y
> # CONFIG_FTRACE_RECORD_RECURSION is not set
> # CONFIG_FTRACE_STARTUP_TEST is not set
> # CONFIG_RING_BUFFER_STARTUP_TEST is not set
> CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS=y
> # CONFIG_MMIOTRACE_TEST is not set
> # CONFIG_PREEMPTIRQ_DELAY_TEST is not set
> # CONFIG_SYNTH_EVENT_GEN_TEST is not set
> # CONFIG_KPROBE_EVENT_GEN_TEST is not set
> # CONFIG_HIST_TRIGGERS_DEBUG is not set
> # CONFIG_RV is not set
> CONFIG_PROVIDE_OHCI1394_DMA_INIT=y
> # CONFIG_SAMPLES is not set
> CONFIG_HAVE_SAMPLE_FTRACE_DIRECT=y
> CONFIG_HAVE_SAMPLE_FTRACE_DIRECT_MULTI=y
> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
> CONFIG_STRICT_DEVMEM=y
> CONFIG_IO_STRICT_DEVMEM=y
> 
> #
> # x86 Debugging
> #
> CONFIG_EARLY_PRINTK_USB=y
> CONFIG_X86_VERBOSE_BOOTUP=y
> CONFIG_EARLY_PRINTK=y
> CONFIG_EARLY_PRINTK_DBGP=y
> CONFIG_EARLY_PRINTK_USB_XDBC=y
> CONFIG_DEBUG_TLBFLUSH=y
> CONFIG_HAVE_MMIOTRACE_SUPPORT=y
> # CONFIG_X86_DECODER_SELFTEST is not set
> # CONFIG_IO_DELAY_0X80 is not set
> # CONFIG_IO_DELAY_0XED is not set
> CONFIG_IO_DELAY_UDELAY=y
> # CONFIG_IO_DELAY_NONE is not set
> CONFIG_DEBUG_BOOT_PARAMS=y
> # CONFIG_CPA_DEBUG is not set
> # CONFIG_DEBUG_ENTRY is not set
> # CONFIG_DEBUG_NMI_SELFTEST is not set
> # CONFIG_X86_DEBUG_FPU is not set
> CONFIG_PUNIT_ATOM_DEBUG=y
> CONFIG_UNWINDER_ORC=y
> # CONFIG_UNWINDER_FRAME_POINTER is not set
> # end of x86 Debugging
> 
> #
> # Kernel Testing and Coverage
> #
> # CONFIG_KUNIT is not set
> # CONFIG_NOTIFIER_ERROR_INJECTION is not set
> CONFIG_FUNCTION_ERROR_INJECTION=y
> # CONFIG_FAULT_INJECTION is not set
> CONFIG_ARCH_HAS_KCOV=y
> CONFIG_CC_HAS_SANCOV_TRACE_PC=y
> # CONFIG_KCOV is not set
> # CONFIG_RUNTIME_TESTING_MENU is not set
> CONFIG_ARCH_USE_MEMTEST=y
> CONFIG_MEMTEST=y
> # end of Kernel Testing and Coverage
> 
> #
> # Rust hacking
> #
> # end of Rust hacking
> # end of Kernel hacking

> #!/bin/sh
> 
> export_top_env()
> {
> 	export suite='boot'
> 	export testcase='boot'
> 	export category='functional'
> 	export timeout='10m'
> 	export job_origin='boot-300s.yaml'
> 	export queue_cmdline_keys='branch
> commit'
> 	export queue='bisect'
> 	export testbox='vm-snb'
> 	export tbox_group='vm-snb'
> 	export branch='broonie-ci/filewywVBQ'
> 	export commit='8660484ed1cf3261e89e0bad94c6395597e87599'
> 	export kconfig='x86_64-randconfig-x063-20230515'
> 	export nr_vm=300
> 	export submit_id='64657d43aaaad39b4dff35b1'
> 	export job_file='/lkp/jobs/scheduled/vm-meta-225/boot-300-openwrt-i386-generic-20190428.cgz-8660484ed1cf3261e89e0bad94c6395597e87599-20230518-39757-8fegld-0.yaml'
> 	export id='035e0618c01043dbe6ab8fb2cfa183e720c70a6c'
> 	export queuer_version='/zday/lkp'
> 	export model='qemu-system-x86_64 -enable-kvm -cpu SandyBridge'
> 	export nr_cpu=2
> 	export memory='16G'
> 	export need_kconfig=\{\"KVM_GUEST\"\=\>\"y\"\}
> 	export ssh_base_port=23032
> 	export kernel_cmdline_hw='vmalloc=256M initramfs_async=0 page_owner=on'
> 	export rootfs='openwrt-i386-generic-20190428.cgz'
> 	export compiler='gcc-11'
> 	export enqueue_time='2023-05-18 09:20:03 +0800'
> 	export _id='64657d43aaaad39b4dff35b1'
> 	export _rt='/result/boot/300/vm-snb/openwrt-i386-generic-20190428.cgz/x86_64-randconfig-x063-20230515/gcc-11/8660484ed1cf3261e89e0bad94c6395597e87599'
> 	export user='lkp'
> 	export LKP_SERVER='internal-lkp-server'
> 	export result_root='/result/boot/300/vm-snb/openwrt-i386-generic-20190428.cgz/x86_64-randconfig-x063-20230515/gcc-11/8660484ed1cf3261e89e0bad94c6395597e87599/0'
> 	export scheduler_version='/lkp/lkp/.src-20230517-200353'
> 	export arch='i386'
> 	export max_uptime=600
> 	export initrd='/osimage/openwrt/openwrt-i386-generic-20190428.cgz'
> 	export bootloader_append='root=/dev/ram0
> RESULT_ROOT=/result/boot/300/vm-snb/openwrt-i386-generic-20190428.cgz/x86_64-randconfig-x063-20230515/gcc-11/8660484ed1cf3261e89e0bad94c6395597e87599/0
> BOOT_IMAGE=/pkg/linux/x86_64-randconfig-x063-20230515/gcc-11/8660484ed1cf3261e89e0bad94c6395597e87599/vmlinuz-6.3.0-rc1-00121-g8660484ed1cf
> branch=broonie-ci/filewywVBQ
> job=/lkp/jobs/scheduled/vm-meta-225/boot-300-openwrt-i386-generic-20190428.cgz-8660484ed1cf3261e89e0bad94c6395597e87599-20230518-39757-8fegld-0.yaml
> user=lkp
> ARCH=x86_64
> kconfig=x86_64-randconfig-x063-20230515
> commit=8660484ed1cf3261e89e0bad94c6395597e87599
> initcall_debug
> nmi_watchdog=0
> vmalloc=256M initramfs_async=0 page_owner=on
> max_uptime=600
> LKP_SERVER=internal-lkp-server
> selinux=0
> debug
> apic=debug
> sysrq_always_enabled
> rcupdate.rcu_cpu_stall_timeout=100
> net.ifnames=0
> printk.devkmsg=on
> panic=-1
> softlockup_panic=1
> nmi_watchdog=panic
> oops=panic
> load_ramdisk=2
> prompt_ramdisk=0
> drbd.minor_count=8
> systemd.log_level=err
> ignore_loglevel
> console=tty0
> earlyprintk=ttyS0,115200
> console=ttyS0,115200
> vga=normal
> rw'
> 	export modules_initrd='/pkg/linux/x86_64-randconfig-x063-20230515/gcc-11/8660484ed1cf3261e89e0bad94c6395597e87599/modules.cgz'
> 	export lkp_initrd='/osimage/user/lkp/lkp-i386.cgz'
> 	export site='inn'
> 	export LKP_CGI_PORT=80
> 	export LKP_CIFS_PORT=139
> 	export meta_host='vm-meta-225'
> 	export kernel='/pkg/linux/x86_64-randconfig-x063-20230515/gcc-11/8660484ed1cf3261e89e0bad94c6395597e87599/vmlinuz-6.3.0-rc1-00121-g8660484ed1cf'
> 	export dequeue_time='2023-05-18 09:50:02 +0800'
> 	export job_initrd='/lkp/jobs/scheduled/vm-meta-225/boot-300-openwrt-i386-generic-20190428.cgz-8660484ed1cf3261e89e0bad94c6395597e87599-20230518-39757-8fegld-0.cgz'
> 
> 	[ -n "$LKP_SRC" ] ||
> 	export LKP_SRC=/lkp/${user:-lkp}/src
> }
> 
> run_job()
> {
> 	echo $$ > $TMP/run-job.pid
> 
> 	. $LKP_SRC/lib/http.sh
> 	. $LKP_SRC/lib/job.sh
> 	. $LKP_SRC/lib/env.sh
> 
> 	export_top_env
> 
> 	run_monitor $LKP_SRC/monitors/one-shot/wrapper boot-slabinfo
> 	run_monitor $LKP_SRC/monitors/one-shot/wrapper boot-meminfo
> 	run_monitor $LKP_SRC/monitors/one-shot/wrapper memmap
> 	run_monitor $LKP_SRC/monitors/no-stdout/wrapper boot-time
> 	run_monitor $LKP_SRC/monitors/wrapper kmsg
> 	run_monitor $LKP_SRC/monitors/wrapper heartbeat
> 	run_monitor $LKP_SRC/monitors/wrapper meminfo
> 	run_monitor $LKP_SRC/monitors/wrapper oom-killer
> 	run_monitor $LKP_SRC/monitors/plain/watchdog
> 
> 	run_test $LKP_SRC/tests/wrapper sleep 300
> }
> 
> extract_stats()
> {
> 	export stats_part_begin=
> 	export stats_part_end=
> 
> 	$LKP_SRC/stats/wrapper boot-slabinfo
> 	$LKP_SRC/stats/wrapper boot-meminfo
> 	$LKP_SRC/stats/wrapper memmap
> 	$LKP_SRC/stats/wrapper boot-memory
> 	$LKP_SRC/stats/wrapper boot-time
> 	$LKP_SRC/stats/wrapper kernel-size
> 	$LKP_SRC/stats/wrapper kmsg
> 	$LKP_SRC/stats/wrapper sleep
> 	$LKP_SRC/stats/wrapper meminfo
> 
> 	$LKP_SRC/stats/wrapper time sleep.time
> 	$LKP_SRC/stats/wrapper dmesg
> 	$LKP_SRC/stats/wrapper kmsg
> 	$LKP_SRC/stats/wrapper last_state
> 	$LKP_SRC/stats/wrapper stderr
> 	$LKP_SRC/stats/wrapper time
> }
> 
> "$@"


