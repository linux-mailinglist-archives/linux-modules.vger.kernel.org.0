Return-Path: <linux-modules+bounces-35-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1357B2A39
	for <lists+linux-modules@lfdr.de>; Fri, 29 Sep 2023 04:03:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id EB85A282275
	for <lists+linux-modules@lfdr.de>; Fri, 29 Sep 2023 02:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8F5117CB;
	Fri, 29 Sep 2023 02:03:26 +0000 (UTC)
X-Original-To: linux-modules@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB67110FA
	for <linux-modules@vger.kernel.org>; Fri, 29 Sep 2023 02:03:24 +0000 (UTC)
X-Greylist: delayed 373 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 28 Sep 2023 19:03:22 PDT
Received: from newman.cs.utexas.edu (newman.cs.utexas.edu [128.83.139.110])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 747D0199;
	Thu, 28 Sep 2023 19:03:22 -0700 (PDT)
X-AuthUser: acsharma@cs.utexas.edu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cs.utexas.edu;
	s=default; t=1695952622;
	bh=IlYtRrMTgyzME3Rj0/G6GUDbMa3aqpuCnIHLljZIIjk=;
	h=From:To:Cc:Subject:Date:From;
	b=BoUXTlSSCZJQ6Jg87V9Uz68fnPa3wtlb+nf4e+jbgiJqphIFgmEc2hJcpP+vHkK9h
	 uttRokH7T6nEcjRcbnb2nG5sYN88HAdvg35948PDHFqXi4WUMYsN2s4znJ78DS5jt9
	 FOkENR9VZwBcTl59xDUZqCzO2Mx13EvQh/nbxu5w=
Received: from abhishekcs-nixos.lan (035-146-022-001.res.spectrum.com [35.146.22.1])
	(authenticated bits=0)
	by newman.cs.utexas.edu (8.14.4/8.14.4/Debian-4.1ubuntu1.1) with ESMTP id 38T1ulWp022390
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 28 Sep 2023 20:57:02 -0500
From: Abhishek Sharma <acsharma@cs.utexas.edu>
To: linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org
Cc: mcgrof@kernel.org, Abhishek Sharma <acsharma@cs.utexas.edu>
Subject: [PATCH] module: fix oops on loading module with malformed ELF section header
Date: Thu, 28 Sep 2023 20:38:39 -0500
Message-Id: <20230929013836.131549-1-acsharma@cs.utexas.edu>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.3.9 (newman.cs.utexas.edu [128.83.139.110]); Thu, 28 Sep 2023 20:57:02 -0500 (CDT)
X-Virus-Scanned: clamav-milter 0.103.8 at newman
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi,

I encountered the following OOPS when loading a kernel module with insmod. It occurs
when loading a kernel module with an invalid ELF section header - the Section name is
invalid and out of bounds into the section name table.

========================================================================================
# insmod hello-1-boom.ko
[41829.405681] BUG: unable to handle page fault for address: ffffc90000c3efa3
[41829.407111] #PF: supervisor read access in kernel mode
[41829.408209] #PF: error_code(0x0000) - not-present page
[41829.409328] PGD 100000067 P4D 100000067 PUD 10012a067 PMD 0
[41829.410593] Oops: 0000 [#1] PREEMPT SMP NOPTI
[41829.411592] CPU: 5 PID: 146 Comm: insmod Not tainted 6.6.0-rc2-g8a511e7efc5a #14
[41829.412944] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.2-0-gea1b7a073390-prebuilt.qemu.org 04/01/2014
[41829.413686] RIP: 0010:strcmp+0x10/0x40
[41829.413944] Code: cc cc cc cc cc cc cc cc cc cc 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 31 c0 66 2e 0f 1f 84 00 00 00 00 003
[41829.415135] RSP: 0018:ffffc9000039fd50 EFLAGS: 00010246
[41829.415470] RAX: 0000000000000000 RBX: 0000000000000023 RCX: 0000000000000023
[41829.415978] RDX: ffffc9000006de40 RSI: ffffffff82ca5bbc RDI: ffffc90000c3efa3
[41829.416443] RBP: 0000000000bd1163 R08: ffffc9000006d000 R09: 0000000000000fa8
[41829.416808] R10: 0000000000031b20 R11: ffffffff8148bbe0 R12: 0000000000000001
[41829.417212] R13: 0000000000000001 R14: ffffc90000c3efa3 R15: ffffc9000006e010
[41829.417556] FS:  00007ff0c2f31740(0000) GS:ffff88813bd40000(0000) knlGS:0000000000000000
[41829.417944] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[41829.418219] CR2: ffffc90000c3efa3 CR3: 00000001019d6001 CR4: 0000000000770ee0
[41829.418560] PKRU: 55555554
[41829.418693] Call Trace:
[41829.418827]  <TASK>
[41829.418935]  ? __die_body+0x75/0xf0
[41829.419142]  ? page_fault_oops+0x340/0x450
[41829.419338]  ? do_kern_addr_fault+0xa1/0x140
[41829.419546]  ? exc_page_fault+0x87/0x180
[41829.419741]  ? asm_exc_page_fault+0x26/0x30
[41829.419943]  ? __pfx_ext4_file_read_iter+0x10/0x10
[41829.420172]  ? strcmp+0x10/0x40
[41829.420328]  load_module+0x235/0x1a20
[41829.420506]  __se_sys_finit_module+0x35e/0x4c0
[41829.420723]  do_syscall_64+0x45/0xa0
[41829.420902]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
[41829.421145] RIP: 0033:0x7ff0c2ffaf09
[41829.421320] Code: 8d 3d 03 d4 0b 00 e8 11 23 fa ff 89 e8 5a 5b 5d c3 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 058
[41829.422193] RSP: 002b:00007ffda4a062b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[41829.422550] RAX: ffffffffffffffda RBX: 000056194469f2a0 RCX: 00007ff0c2ffaf09
[41829.422890] RDX: 0000000000000000 RSI: 000056194469f2a0 RDI: 0000000000000003
[41829.423227] RBP: 0000000000000003 R08: 0000000000000000 R09: 0000000000200000
[41829.423565] R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffda4a07f55
[41829.423906] R13: 00007ff0c30faac0 R14: 00007ffda4a064d0 R15: 00007ff0c30fb000
[41829.424246]  </TASK>
[41829.424355] Modules linked in:
[41829.424507] CR2: ffffc90000c3efa3
[41829.424669] ---[ end trace 0000000000000000 ]---
[41829.424893] RIP: 0010:strcmp+0x10/0x40
[41829.425076] Code: cc cc cc cc cc cc cc cc cc cc 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 31 c0 66 2e 0f 1f 84 00 00 00 00 003
[41829.425948] RSP: 0018:ffffc9000039fd50 EFLAGS: 00010246
[41829.426196] RAX: 0000000000000000 RBX: 0000000000000023 RCX: 0000000000000023
[41829.426534] RDX: ffffc9000006de40 RSI: ffffffff82ca5bbc RDI: ffffc90000c3efa3
[41829.426874] RBP: 0000000000bd1163 R08: ffffc9000006d000 R09: 0000000000000fa8
[41829.427212] R10: 0000000000031b20 R11: ffffffff8148bbe0 R12: 0000000000000001
[41829.427551] R13: 0000000000000001 R14: ffffc90000c3efa3 R15: ffffc9000006e010
[41829.427891] FS:  00007ff0c2f31740(0000) GS:ffff88813bd40000(0000) knlGS:0000000000000000
[41829.428271] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[41829.428545] CR2: ffffc90000c3efa3 CR3: 00000001019d6001 CR4: 0000000000770ee0
[41829.428887] PKRU: 55555554
[41829.429021] note: insmod[146] exited with irqs disabled
Killed
======================================================================================================

This happens because elf_validity_cache_copy does not validate the section name index before looking for
the ".gnu.linkonce.this_module" and ".modinfo" sections while iterating through the section headers. This
seems to have been introduced in the refactoring done in https://lkml.kernel.org/linux-modules/20230319213542.1790479-2-mcgrof@kernel.org/
and in the kernel since v6.4.

My patch below moves the search for the ".gnu.linkonce.this_module" and ".modinfo" sections after the check
validating the section header name. Since both these sections are SHF_ALLOC, it should be okay to nest the check
within that if - which is what was happening prior to the refactor too.

I have tested that with the patch, loading a malformed kernel module no longer results in the oops.

Signed-off-by: Abhishek Sharma <acsharma@cs.utexas.edu>
---
 kernel/module/main.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 98fedfdb8db5..39f66bb12683 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1787,15 +1787,6 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 					i, shdr->sh_type);
 				return err;
 			}
-			if (strcmp(info->secstrings + shdr->sh_name,
-				   ".gnu.linkonce.this_module") == 0) {
-				num_mod_secs++;
-				mod_idx = i;
-			} else if (strcmp(info->secstrings + shdr->sh_name,
-				   ".modinfo") == 0) {
-				num_info_secs++;
-				info_idx = i;
-			}
 
 			if (shdr->sh_flags & SHF_ALLOC) {
 				if (shdr->sh_name >= strhdr->sh_size) {
@@ -1803,6 +1794,15 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 					       i, shdr->sh_type);
 					return -ENOEXEC;
 				}
+				if (strcmp(info->secstrings + shdr->sh_name,
+					   ".gnu.linkonce.this_module") == 0) {
+					num_mod_secs++;
+					mod_idx = i;
+				} else if (strcmp(info->secstrings + shdr->sh_name,
+					   ".modinfo") == 0) {
+					num_info_secs++;
+					info_idx = i;
+				}
 			}
 			break;
 		}
-- 
2.40.1


