Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F5DD4AFBC4
	for <lists+linux-modules@lfdr.de>; Wed,  9 Feb 2022 19:49:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240556AbiBIStc (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Wed, 9 Feb 2022 13:49:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240966AbiBIStE (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Wed, 9 Feb 2022 13:49:04 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 635B9C1DC714;
        Wed,  9 Feb 2022 10:45:02 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6C2D8B82384;
        Wed,  9 Feb 2022 18:45:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E955C340E7;
        Wed,  9 Feb 2022 18:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644432300;
        bh=DxiS2imM2kRlhNNZ2tvupf0VGWXlv4zHDpnN/oeZKQ4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Qi/oahICIobWyK7CSM7nd80/5yyOeM7vONk7XuZQP6mjqrL84fbigD1COkl5eUCum
         DyMLwSv5GzwIwd+8HQ8RhLy2+3q7NfYjZ9BPtOt77sNd/EmQqqV6TCOw9GsxgB76YD
         GGhtpcK+vCH3kCi4q91Tqy3500LU0z/h34IA/sRh56ycR6W0/PGu4Co2O8BVqAu0np
         qrX6MPcGPIDhH2ARxdLmmfA4JbtrcYrtW5og0MtEt0zotxajCf3VsEpFdL5tANrtmd
         DUZhLtOTm51kbiyXGC+YTdJODchG59ryByToCH8VG83loxv+Diuvt6+wUFZxTDolYH
         gdZErWv5KWOsA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Igor Pylypiv <ipylypiv@google.com>,
        Changyuan Lyu <changyuanl@google.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Tejun Heo <tj@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Sasha Levin <sashal@kernel.org>, mingo@redhat.com,
        peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, akpm@linux-foundation.org,
        linux@rasmusvillemoes.dk, linux-modules@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 10/10] Revert "module, async: async_synchronize_full() on module init iff async is used"
Date:   Wed,  9 Feb 2022 13:44:09 -0500
Message-Id: <20220209184410.48223-10-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209184410.48223-1-sashal@kernel.org>
References: <20220209184410.48223-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

From: Igor Pylypiv <ipylypiv@google.com>

[ Upstream commit 67d6212afda218d564890d1674bab28e8612170f ]

This reverts commit 774a1221e862b343388347bac9b318767336b20b.

We need to finish all async code before the module init sequence is
done.  In the reverted commit the PF_USED_ASYNC flag was added to mark a
thread that called async_schedule().  Then the PF_USED_ASYNC flag was
used to determine whether or not async_synchronize_full() needs to be
invoked.  This works when modprobe thread is calling async_schedule(),
but it does not work if module dispatches init code to a worker thread
which then calls async_schedule().

For example, PCI driver probing is invoked from a worker thread based on
a node where device is attached:

	if (cpu < nr_cpu_ids)
		error = work_on_cpu(cpu, local_pci_probe, &ddi);
	else
		error = local_pci_probe(&ddi);

We end up in a situation where a worker thread gets the PF_USED_ASYNC
flag set instead of the modprobe thread.  As a result,
async_synchronize_full() is not invoked and modprobe completes without
waiting for the async code to finish.

The issue was discovered while loading the pm80xx driver:
(scsi_mod.scan=async)

modprobe pm80xx                      worker
...
  do_init_module()
  ...
    pci_call_probe()
      work_on_cpu(local_pci_probe)
                                     local_pci_probe()
                                       pm8001_pci_probe()
                                         scsi_scan_host()
                                           async_schedule()
                                           worker->flags |= PF_USED_ASYNC;
                                     ...
      < return from worker >
  ...
  if (current->flags & PF_USED_ASYNC) <--- false
  	async_synchronize_full();

Commit 21c3c5d28007 ("block: don't request module during elevator init")
fixed the deadlock issue which the reverted commit 774a1221e862
("module, async: async_synchronize_full() on module init iff async is
used") tried to fix.

Since commit 0fdff3ec6d87 ("async, kmod: warn on synchronous
request_module() from async workers") synchronous module loading from
async is not allowed.

Given that the original deadlock issue is fixed and it is no longer
allowed to call synchronous request_module() from async we can remove
PF_USED_ASYNC flag to make module init consistently invoke
async_synchronize_full() unless async module probe is requested.

Signed-off-by: Igor Pylypiv <ipylypiv@google.com>
Reviewed-by: Changyuan Lyu <changyuanl@google.com>
Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
Acked-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/linux/sched.h |  1 -
 kernel/async.c        |  3 ---
 kernel/module.c       | 25 +++++--------------------
 3 files changed, 5 insertions(+), 24 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 761d0f85c4a50..f92d5ae6d04e7 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1389,7 +1389,6 @@ extern struct pid *cad_pid;
 #define PF_MEMALLOC		0x00000800	/* Allocating memory */
 #define PF_NPROC_EXCEEDED	0x00001000	/* set_user() noticed that RLIMIT_NPROC was exceeded */
 #define PF_USED_MATH		0x00002000	/* If unset the fpu must be initialized before use */
-#define PF_USED_ASYNC		0x00004000	/* Used async_schedule*(), used by module init */
 #define PF_NOFREEZE		0x00008000	/* This thread should not be frozen */
 #define PF_FROZEN		0x00010000	/* Frozen for system suspend */
 #define PF_KSWAPD		0x00020000	/* I am kswapd */
diff --git a/kernel/async.c b/kernel/async.c
index a893d6170944f..4bf1b00a28d86 100644
--- a/kernel/async.c
+++ b/kernel/async.c
@@ -191,9 +191,6 @@ static async_cookie_t __async_schedule(async_func_t func, void *data, struct asy
 	atomic_inc(&entry_count);
 	spin_unlock_irqrestore(&async_lock, flags);
 
-	/* mark that this task has queued an async job, used by module init */
-	current->flags |= PF_USED_ASYNC;
-
 	/* schedule for execution */
 	queue_work(system_unbound_wq, &entry->work);
 
diff --git a/kernel/module.c b/kernel/module.c
index 68637e661d75c..42a604401c4dd 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -3526,12 +3526,6 @@ static noinline int do_init_module(struct module *mod)
 	}
 	freeinit->module_init = mod->init_layout.base;
 
-	/*
-	 * We want to find out whether @mod uses async during init.  Clear
-	 * PF_USED_ASYNC.  async_schedule*() will set it.
-	 */
-	current->flags &= ~PF_USED_ASYNC;
-
 	do_mod_ctors(mod);
 	/* Start the module */
 	if (mod->init != NULL)
@@ -3557,22 +3551,13 @@ static noinline int do_init_module(struct module *mod)
 
 	/*
 	 * We need to finish all async code before the module init sequence
-	 * is done.  This has potential to deadlock.  For example, a newly
-	 * detected block device can trigger request_module() of the
-	 * default iosched from async probing task.  Once userland helper
-	 * reaches here, async_synchronize_full() will wait on the async
-	 * task waiting on request_module() and deadlock.
-	 *
-	 * This deadlock is avoided by perfomring async_synchronize_full()
-	 * iff module init queued any async jobs.  This isn't a full
-	 * solution as it will deadlock the same if module loading from
-	 * async jobs nests more than once; however, due to the various
-	 * constraints, this hack seems to be the best option for now.
-	 * Please refer to the following thread for details.
+	 * is done. This has potential to deadlock if synchronous module
+	 * loading is requested from async (which is not allowed!).
 	 *
-	 * http://thread.gmane.org/gmane.linux.kernel/1420814
+	 * See commit 0fdff3ec6d87 ("async, kmod: warn on synchronous
+	 * request_module() from async workers") for more details.
 	 */
-	if (!mod->async_probe_requested && (current->flags & PF_USED_ASYNC))
+	if (!mod->async_probe_requested)
 		async_synchronize_full();
 
 	ftrace_free_mem(mod, mod->init_layout.base, mod->init_layout.base +
-- 
2.34.1

