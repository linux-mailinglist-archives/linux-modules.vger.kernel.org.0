Return-Path: <linux-modules+bounces-2948-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B58A044BB
	for <lists+linux-modules@lfdr.de>; Tue,  7 Jan 2025 16:36:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CDEC166B60
	for <lists+linux-modules@lfdr.de>; Tue,  7 Jan 2025 15:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 108B91F2C50;
	Tue,  7 Jan 2025 15:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="F38w/WAw"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B7C1F0E3C
	for <linux-modules@vger.kernel.org>; Tue,  7 Jan 2025 15:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736264150; cv=none; b=qA0Edf5kVLM2hc/4oV2oz3PvB5GJ8lR8gO6PT0w3JUx7aB6PxNR6Coo9PhvvZRwwwksM8hRWvbeWatPOtQteQUuv2ATM+czjWs9sA+5YX8Kzn4NKwxEH1JYlY/tbXQJBbsGJRetiWrnPmSWzQ7jeZg5XeHFDn2tsGgKHlrgrK5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736264150; c=relaxed/simple;
	bh=8m+4KRHGoTieA8CvCwunlUTmUJfNG8C6GYQjAJmMtP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dAQV+cs8iqYaAQTgcUOQ4u1oWsthntAzjpp5yveATSrcww+ShPUN0SN1KTub7pCSEgYkIIAPyi+axEcCQkwf5plXlIPcxaJAH7MaF4JObuQz/FLWO45lEupPQ0ZkXqsB9Uxi8FlONYs6nCktwLMmuGt7b4daRZgmLoFOSlvj44U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=F38w/WAw; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43675b1155bso150194655e9.2
        for <linux-modules@vger.kernel.org>; Tue, 07 Jan 2025 07:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736264144; x=1736868944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZbzK7gNJ8VfH7wLPW3weuF06YbkZOBy++EFlcgPDK4=;
        b=F38w/WAwJoX3pcVnGjV8J7XlWalcURR2MEWSG9HN34S+4I8Pq3+g4PNgHEynT7fQ9V
         ymN+1ivU0YRCbJU6HQRf7gj9XSaeqKyX7WV2r8RcAfk0Mtio0d6uicYeyZe7kJzFn3co
         bsbksRREl1AOGmIkVTMBGbhJT+5srnOqm1dIhmDO6YP7wdRODj0ERX6PJG1U0lgYYHEh
         zYAeYubDERYVtAroJxeqJYEmGcNOwu3ksHppr732kW11lSpb3BFi0kVoDhlEImHV8Fpf
         BdyXVVEx/4Iwuy8woMzUKr+mLiejpnUsnEAOUFiDfOmUy/W3wrIq2kzzHNVZdymAC5+u
         oZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736264144; x=1736868944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZbzK7gNJ8VfH7wLPW3weuF06YbkZOBy++EFlcgPDK4=;
        b=S/gc1c8vf/ctxM61qHMXyXq3m2p2qu5BARKQ2U6rBP4nc4E69k0lNU9cPC/mzroVD6
         HtoLD/uj9ybG2KG0cwJf98OCrrgJ1VBA9E8stfDIB7UKm2z2RUqAulIj1DXfoor4Uw7i
         r9WhpHkAQ9FQM3DqJN3yRXf05aQwSnvc0XOuqYf3hAg9lsyyZhLALPaq9EPcGwHRg6t4
         XmdLkkuZstR9zWbVb4HYLmWMNRUilHqMHfSocVNH4k2Nzet8izzwCyhGpMhFj9tSTpeP
         NET46CvUUucl9TuzBXyJa6GLCjqArFK5sVFhVkuSboxPELUlAsj80lsxJUvnZpmW4wzN
         mfTg==
X-Forwarded-Encrypted: i=1; AJvYcCWf3S5Rkzp4YLLODhL9ykAfP+ne2+A+NiTN7I4fq94CiyWr3rSve/9AKWoK4zKmH/lONzR8t1Oh4nSyBKaU@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdg+aS4bOB4qrf9k4kgbMpV165rQueb6w9I8lh6ikkJiJ/HCvt
	I170C6cT76JNcaV+ZX4KOtUP5YfkUEeoyNyrqsG9nLGldFD3nrpVRxNf4+qzGpM=
X-Gm-Gg: ASbGncsDMXbEenoW6nlOiNhRxLvsuoaP9Z9irIdjes6Oz1Aky7nsv9jT8fjpZlxykgR
	sMuWoDANJsZpaCDe39lpiw5jI0NCCMEj0BhAmJVtcYnaaFXR3m3xZsbZMIkHRAQB08zwnPAxxtc
	iy2bCio1H8/oweGJsRdKvuQR+ohY5qFM5O6+A5zybvi6e+6Vl6G4CKbSMMjE/ufbPSYHAOc4Pts
	yP7PaGSoZMHeifxDb6wKG0D2/VgZnSLZ6+odiEmRVfanyWz5n/Aen/rhAPr
X-Google-Smtp-Source: AGHT+IHT+uGKdYWP32nNdYuxCzKEUEtl7jwYI4PJVc6e7CGReWgq+hVxrrrOXvulnKWZaYLl+U73CA==
X-Received: by 2002:a05:600c:4f84:b0:434:f7ea:fb44 with SMTP id 5b1f17b1804b1-43668644255mr533777585e9.14.1736264144046;
        Tue, 07 Jan 2025 07:35:44 -0800 (PST)
Received: from dhcp161.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c833149sm50170082f8f.39.2025.01.07.07.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 07:35:43 -0800 (PST)
From: Petr Pavlu <petr.pavlu@suse.com>
To: petr.pavlu@suse.com,
	rppt@kernel.org,
	akpm@linux-foundation.org
Cc: mmaslanka@google.com,
	mcgrof@kernel.org,
	regressions@lists.linux.dev,
	linux-modules@vger.kernel.org,
	linux-mm@kvack.org,
	live-patching@vger.kernel.org,
	joe.lawrence@redhat.com,
	jpoimboe@kernel.org,
	pmladek@suse.com
Subject: [PATCH] module: Fix writing of livepatch relocations in ROX text
Date: Tue,  7 Jan 2025 16:34:57 +0100
Message-ID: <20250107153507.14733-1-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <0530eee7-f329-4786-bea3-c9c66d5f0bed@suse.com>
References: <0530eee7-f329-4786-bea3-c9c66d5f0bed@suse.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A livepatch module can contain a special relocation section
.klp.rela.<objname>.<secname> to apply its relocations at the appropriate
time and to additionally access local and unexported symbols. When
<objname> points to another module, such relocations are processed
separately from the regular module relocation process. For instance, only
when the target <objname> actually becomes loaded.

With CONFIG_STRICT_MODULE_RWX, when the livepatch core decides to apply
these relocations, their processing results in the following bug:

[   25.827238] BUG: unable to handle page fault for address: 00000000000012ba
[   25.827819] #PF: supervisor read access in kernel mode
[   25.828153] #PF: error_code(0x0000) - not-present page
[   25.828588] PGD 0 P4D 0
[   25.829063] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
[   25.829742] CPU: 2 UID: 0 PID: 452 Comm: insmod Tainted: G O  K    6.13.0-rc4-00078-g059dd502b263 #7820
[   25.830417] Tainted: [O]=OOT_MODULE, [K]=LIVEPATCH
[   25.830768] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.0-20220807_005459-localhost 04/01/2014
[   25.831651] RIP: 0010:memcmp+0x24/0x60
[   25.832190] Code: [...]
[   25.833378] RSP: 0018:ffffa40b403a3ae8 EFLAGS: 00000246
[   25.833637] RAX: 0000000000000000 RBX: ffff93bc81d8e700 RCX: ffffffffc0202000
[   25.834072] RDX: 0000000000000000 RSI: 0000000000000004 RDI: 00000000000012ba
[   25.834548] RBP: ffffa40b403a3b68 R08: ffffa40b403a3b30 R09: 0000004a00000002
[   25.835088] R10: ffffffffffffd222 R11: f000000000000000 R12: 0000000000000000
[   25.835666] R13: ffffffffc02032ba R14: ffffffffc007d1e0 R15: 0000000000000004
[   25.836139] FS:  00007fecef8c3080(0000) GS:ffff93bc8f900000(0000) knlGS:0000000000000000
[   25.836519] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   25.836977] CR2: 00000000000012ba CR3: 0000000002f24000 CR4: 00000000000006f0
[   25.837442] Call Trace:
[   25.838297]  <TASK>
[   25.841083]  __write_relocate_add.constprop.0+0xc7/0x2b0
[   25.841701]  apply_relocate_add+0x75/0xa0
[   25.841973]  klp_write_section_relocs+0x10e/0x140
[   25.842304]  klp_write_object_relocs+0x70/0xa0
[   25.842682]  klp_init_object_loaded+0x21/0xf0
[   25.842972]  klp_enable_patch+0x43d/0x900
[   25.843572]  do_one_initcall+0x4c/0x220
[   25.844186]  do_init_module+0x6a/0x260
[   25.844423]  init_module_from_file+0x9c/0xe0
[   25.844702]  idempotent_init_module+0x172/0x270
[   25.845008]  __x64_sys_finit_module+0x69/0xc0
[   25.845253]  do_syscall_64+0x9e/0x1a0
[   25.845498]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   25.846056] RIP: 0033:0x7fecef9eb25d
[   25.846444] Code: [...]
[   25.847563] RSP: 002b:00007ffd0c5d6de8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[   25.848082] RAX: ffffffffffffffda RBX: 000055b03f05e470 RCX: 00007fecef9eb25d
[   25.848456] RDX: 0000000000000000 RSI: 000055b001e74e52 RDI: 0000000000000003
[   25.848969] RBP: 00007ffd0c5d6ea0 R08: 0000000000000040 R09: 0000000000004100
[   25.849411] R10: 00007fecefac7b20 R11: 0000000000000246 R12: 000055b001e74e52
[   25.849905] R13: 0000000000000000 R14: 000055b03f05e440 R15: 0000000000000000
[   25.850336]  </TASK>
[   25.850553] Modules linked in: deku(OK+) uinput
[   25.851408] CR2: 00000000000012ba
[   25.852085] ---[ end trace 0000000000000000 ]---

The problem is that the .klp.rela.<objname>.<secname> relocations are
processed after the module was already formed and mod->rw_copy was reset.
However, the code in __write_relocate_add() calls module_writable_address()
which translates the target address 'loc' still to
'loc + (mem->rw_copy - mem->base)', with mem->rw_copy now being 0.

Fix the problem by returning directly 'loc' in module_writable_address()
when the module is already formed. Function __write_relocate_add() knows to
use text_poke() in such a case.

Fixes: 0c133b1e78cd ("module: prepare to handle ROX allocations for text")
Reported-by: Marek Maslanka <mmaslanka@google.com>
Closes: https://lore.kernel.org/linux-modules/CAGcaFA2hdThQV6mjD_1_U+GNHThv84+MQvMWLgEuX+LVbAyDxg@mail.gmail.com/
Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 include/linux/module.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 94acbacdcdf1..b3a643435357 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -773,7 +773,8 @@ void *__module_writable_address(struct module *mod, void *loc);
 
 static inline void *module_writable_address(struct module *mod, void *loc)
 {
-	if (!IS_ENABLED(CONFIG_ARCH_HAS_EXECMEM_ROX) || !mod)
+	if (!IS_ENABLED(CONFIG_ARCH_HAS_EXECMEM_ROX) || !mod ||
+	    mod->state != MODULE_STATE_UNFORMED)
 		return loc;
 	return __module_writable_address(mod, loc);
 }

base-commit: 9d89551994a430b50c4fffcb1e617a057fa76e20
-- 
2.43.0


