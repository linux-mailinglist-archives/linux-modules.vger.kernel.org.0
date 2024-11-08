Return-Path: <linux-modules+bounces-2446-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEB79C21B0
	for <lists+linux-modules@lfdr.de>; Fri,  8 Nov 2024 17:12:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE2691F21B00
	for <lists+linux-modules@lfdr.de>; Fri,  8 Nov 2024 16:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A10B6167DB7;
	Fri,  8 Nov 2024 16:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ohv+2qZO"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B3013B29F;
	Fri,  8 Nov 2024 16:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731082348; cv=none; b=hj6/09DFbbEI2zkHf9q0eg6VMn7YhKpNV8nC/5NURdhY4bp8TEHl/EfAUNKF44jfQo6IblOi0dVDmInrBnSErSenQMNLUNM30PjVV09F90JZTE34FNgs5PeXqZTPbphVifLNrv7lBe3G8SnuS79R6xPCqQYEavCJjDOiKUaY8gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731082348; c=relaxed/simple;
	bh=adVffkUOC5N+2b1eGWF++UUJ8/yyvaIQLPhK1rvjyuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d5uuJPB3sZCPBLLqmU6g/TzFc9fblD7PIrNOnbH521WrlaI7+acFa4ehbxogMUnu7CIJTfj/WELqIcXCIiDo5mmPO0vmfHmeFcvhCe2N4JPvDG5EgKha73m7KUX+xoB8uC3hB8/Dc5hvZFm0gOwx+i9Afkp7tPpsA0+QDEecnqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ohv+2qZO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D357C4CED7;
	Fri,  8 Nov 2024 16:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731082348;
	bh=adVffkUOC5N+2b1eGWF++UUJ8/yyvaIQLPhK1rvjyuE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ohv+2qZOwWEexIAz5Hl/RRBav3gEoKhgKtV15OutBKpZ7v2ytF/X6R9hXFX+s8svs
	 dmUOapFC7/My7miMhWdlGN6waNT0u3sLy2R8ZpMgginmSvreW7N50GWPSBYHCfQc5f
	 0lBqpjn7by7lhI65AnyKjLrq7M7X1pX1RcKgJDBpCCI/lQA9hY/ydgjqfrFiwgO6Bk
	 L+nZbAuDbVInbTsrCAUKm6ULpjCzWDe4j+j661ppKjytkUdKDSJOEqnbG+FT3HfWzF
	 83A9uFK+X9D8abp8NvFGKORVTcnBXsRbLJ6OwM+d74Uy/QlEImDQf2Bn5xHWlbYgon
	 BjuYDrKLaKRBA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05335D5C0FD;
	Fri,  8 Nov 2024 16:12:28 +0000 (UTC)
From: Daniel Gomez via B4 Relay <devnull+da.gomez.samsung.com@kernel.org>
Date: Fri, 08 Nov 2024 17:12:16 +0100
Subject: [PATCH RFC v3 4/4] module: refactor ro_after_init failure path
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-modules-ro_after_init-v3-4-6dd041b588a5@samsung.com>
References: <20241108-modules-ro_after_init-v3-0-6dd041b588a5@samsung.com>
In-Reply-To: <20241108-modules-ro_after_init-v3-0-6dd041b588a5@samsung.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Sami Tolvanen <samitolvanen@google.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Thomas Gleixner <tglx@linutronix.de>, Jinjie Ruan <ruanjinjie@huawei.com>, 
 Jens Axboe <axboe@kernel.dk>
Cc: "Daniel Gomez (Samsung)" <d+samsung@kruces.com>, 
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Daniel Gomez <da.gomez@samsung.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731082346; l=5513;
 i=da.gomez@samsung.com; s=20240621; h=from:subject:message-id;
 bh=Db9jcYz5hKdZ02hfGSOe9kn0EwUQXw4KgNDzf0EpOLc=;
 b=UsGWnNs2g45kP6nzz3FumHxWrFnuZNaJCJ2vmZtKAwxmeuLHc0aM7x7X7TfCR1iMpEUZwBAYQ
 g3cmR6/8hEGA50tMDd15IEOfRf4U94fFrNLUlHnALnKAlQCD2gjGq4f
X-Developer-Key: i=da.gomez@samsung.com; a=ed25519;
 pk=BqYk31UHkmv0WZShES6pIZcdmPPGay5LbzifAdZ2Ia4=
X-Endpoint-Received: by B4 Relay for da.gomez@samsung.com/20240621 with
 auth_id=175
X-Original-From: Daniel Gomez <da.gomez@samsung.com>
Reply-To: da.gomez@samsung.com

From: Daniel Gomez <da.gomez@samsung.com>

When ro_after_init fails, we need to unload the module.

Rename the goto tag to fail_ro_after_init to make it more clear and try
to check for dependencies, stop the module and call the exit function.
This allows to unload the module if ro_after_init fails.

This fixes the following error in block loop device driver when forcing
ro_after_init error path:

Nov 06 11:36:25 debian kernel: loop: module loaded
Nov 06 11:36:25 debian kernel: BUG: unable to handle page fault for
address: ffffffffa0006320
Nov 06 11:36:25 debian kernel: #PF: supervisor read access in kernel mode
Nov 06 11:36:25 debian kernel: #PF: error_code(0x0000) - not-present page
Nov 06 11:36:25 debian kernel: PGD 1e3f067 P4D 1e3f067 PUD 1e40063 PMD
10e7d4067 PTE 0
Nov 06 11:36:25 debian kernel: Oops: Oops: 0000 [#1]
Nov 06 11:36:25 debian kernel: CPU: 0 UID: 0 PID: 428 Comm:
(udev-worker) Not tainted 6.12.0-rc6-g4ade030a2d1b #155
Nov 06 11:36:25 debian kernel: Hardware name: QEMU Standard PC (Q35 +
ICH9, 2009), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
Nov 06 11:36:25 debian kernel: RIP: 0010:bdev_open+0x83/0x290
Nov 06 11:36:25 debian kernel: Code: bb 48 01 00 00 48 89 3c 24 e8 79 24
38 00 48 8b 43 40 41 bd fa ff ff ff 48 83 b8 40 03 00 00 00 0f 84 b3 01
00 00 48 8b 43 48 <48> 8b 78 78 e8 d4 c9 c8 ff 84 c0 0f 84 9e 01 00 00
80 3d 45 ad ad
Nov 06 11:36:25 debian kernel: RSP: 0018:ffff8881054dbc58 EFLAGS:
00010286
Nov 06 11:36:25 debian kernel: RAX: ffffffffa00062a8 RBX:
ffff8881054a6800 RCX: ffff8881075becc0
Nov 06 11:36:25 debian kernel: RDX: 0000000000000000 RSI:
0000000000000009 RDI: ffff8881054a6948
Nov 06 11:36:25 debian kernel: RBP: 0000000000000009 R08:
ffff88810e7aa9c0 R09: 0000000000000000
Nov 06 11:36:25 debian kernel: R10: ffff88810e5ab0c0 R11:
ffff88810e796190 R12: ffff88810094e980
Nov 06 11:36:25 debian kernel: R13: 00000000fffffffa R14:
0000000000000000 R15: 0000000000000000
Nov 06 11:36:25 debian kernel: FS:  00007fd2ff110900(0000)
GS:ffffffff81e47000(0000) knlGS:0000000000000000
Nov 06 11:36:25 debian kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Nov 06 11:36:25 debian kernel: CR2: ffffffffa0006320 CR3:
000000010e7ed004 CR4: 00000000003706b0
Nov 06 11:36:25 debian kernel: Call Trace:
Nov 06 11:36:25 debian kernel:  <TASK>
Nov 06 11:36:25 debian kernel:  ? __die_body+0x16/0x60
Nov 06 11:36:25 debian kernel:  ? page_fault_oops+0x22a/0x310
Nov 06 11:36:25 debian kernel:  ? exc_page_fault+0x99/0xa0
Nov 06 11:36:25 debian kernel:  ? asm_exc_page_fault+0x22/0x30
Nov 06 11:36:25 debian kernel:  ? bdev_open+0x83/0x290
Nov 06 11:36:25 debian kernel:  ? bdev_open+0x67/0x290
Nov 06 11:36:25 debian kernel:  ? iput+0x37/0x150
Nov 06 11:36:25 debian kernel:  ? blkdev_open+0xab/0xd0
Nov 06 11:36:25 debian kernel:  ? blkdev_mmap+0x60/0x60
Nov 06 11:36:25 debian kernel:  ? do_dentry_open+0x25d/0x3b0
Nov 06 11:36:25 debian kernel:  ? vfs_open+0x1e/0xc0
Nov 06 11:36:25 debian kernel:  ? path_openat+0x9cf/0xbb0
Nov 06 11:36:25 debian kernel:  ? do_filp_open+0x7f/0xd0
Nov 06 11:36:25 debian kernel:  ? do_sys_openat2+0x67/0xb0
Nov 06 11:36:25 debian kernel:  ? do_sys_open+0x4b/0x50
Nov 06 11:36:25 debian kernel:  ? do_syscall_64+0x3d/0xb0
Nov 06 11:36:25 debian kernel:  ? entry_SYSCALL_64_after_hwframe+0x4b/0x53
Nov 06 11:36:25 debian kernel:  </TASK>
Nov 06 11:36:25 debian kernel: Modules linked in:
Nov 06 11:36:25 debian kernel: CR2: ffffffffa0006320
Nov 06 11:36:25 debian kernel: ---[ end trace 0000000000000000 ]---

./scripts/faddr2line --list vmlinux bdev_open+0x83/0x290
bdev_open+0x83/0x290:

bdev_open at block/bdev.c:908
 903
 904            mutex_lock(&disk->open_mutex);
 905            ret = -ENXIO;
 906            if (!disk_live(disk))
 907                    goto abort_claiming;
>908<           if (!try_module_get(disk->fops->owner))
 909                    goto abort_claiming;
 910            ret = -EBUSY;
 911            if (!bdev_may_open(bdev, mode))
 912                    goto put_module;
 913            if (bdev_is_partition(bdev))

Reported-by: Thomas Gleixner <tglx@linutronix.de>
Closes: https://lore.kernel.org/all/20230915082126.4187913-1-ruanjinjie@huawei.com/
Fixes: d1909c022173 ("module: Don't ignore errors from set_memory_XX()").
Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
---
 kernel/module/main.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 2b45a6efa0a9..c23521ae8bda 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2880,7 +2880,7 @@ module_param(async_probe, bool, 0644);
  */
 static noinline int do_init_module(struct module *mod)
 {
-	int ret = 0;
+	int ret = 0, forced = 0;
 	struct mod_initfree *freeinit;
 #if defined(CONFIG_MODULE_STATS)
 	unsigned int text_size = 0, total_size = 0;
@@ -2948,7 +2948,7 @@ static noinline int do_init_module(struct module *mod)
 #endif
 	ret = module_enable_rodata_ro(mod, true);
 	if (ret)
-		goto fail_mutex_unlock;
+		goto fail_ro_after_init;
 	/* Drop initial reference. */
 	module_put(mod);
 	mod_tree_remove_init(mod);
@@ -2989,8 +2989,12 @@ static noinline int do_init_module(struct module *mod)
 
 	return 0;
 
-fail_mutex_unlock:
+fail_ro_after_init:
+	list_empty(&mod->source_list);
+	try_stop_module(mod, 0, &forced);
 	mutex_unlock(&module_mutex);
+	if (mod->exit != NULL)
+		mod->exit();
 fail_free_freeinit:
 	kfree(freeinit);
 fail:

-- 
2.39.2



