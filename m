Return-Path: <linux-modules+bounces-1068-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6584C8A1BCB
	for <lists+linux-modules@lfdr.de>; Thu, 11 Apr 2024 19:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18437282285
	for <lists+linux-modules@lfdr.de>; Thu, 11 Apr 2024 17:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97FB8137C42;
	Thu, 11 Apr 2024 16:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e6ERizPZ"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A40B13777C;
	Thu, 11 Apr 2024 16:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712851441; cv=none; b=Cmq68cUM9CH1lk2iO/TvK2Y1imtfYOvphwVtD8Vu0X538bd1WHb8nL3ILKe/oLC2+yEwiCDC5Nc9XSMGiBddeXNCsUsv7dGBky3Jf8V3x6u/z9pMA58dr1qdYMluFbkS5GoAnDvY27dAvGEGJesAhHYhpNtG75cVeW8bNF2NzNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712851441; c=relaxed/simple;
	bh=dj8Jeem56mTOW4r4fQ6hbW3YTYti2N5hSv58QgNFPjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rd482ehdwhJwlyRjXoPjUg+jwHCGDpalyS+1W7pTl8dOoL3ACpLcIAPNlWyofBAa1oosFiySlIniYhLFZdqXefoVdsyrorn7vEP2EGSgg1EJAhiB7iikzaxab6LsdtVlIRDGXemvcNEjogrQVmnC94q/QlLsUatMNXE3IhGugYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e6ERizPZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1811DC113CE;
	Thu, 11 Apr 2024 16:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712851440;
	bh=dj8Jeem56mTOW4r4fQ6hbW3YTYti2N5hSv58QgNFPjs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e6ERizPZR76qVXhsBWZGKyAA22R77VnIeczbENKkVs2ThkiNc2s4tsjRC6xm+CXxB
	 jlcF0zveXe/fpGxsCUUGili9t/nI1QFTLlvaSxrnj2aY9IE1K3itlIW53TQGDAxcPH
	 d55OpEkteiNE5H2ZOPbXgXaOw+Yt4EGv+8350H5u47HbBEYjptG2ECa9bqhQvptxMY
	 i9fDA8JAkVwaWYd7dr082MDQYplP2RwcqdCLAnW8A01K9Xwv4bbd4TCMssphDLeqMj
	 jIdvZcHYTNH1/Q7ir9e2JX9svcI/GYtAMORhoGI6ljN8+aBIhzk2YNVgIQ7nWjFkaH
	 CW7NBFCjaYvIQ==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Donald Dutile <ddutile@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Rapoport <rppt@kernel.org>,
	Nadav Amit <nadav.amit@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-modules@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	netdev@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v4 13/15] powerpc: use CONFIG_EXECMEM instead of CONFIG_MODULES where appropiate
Date: Thu, 11 Apr 2024 19:00:49 +0300
Message-ID: <20240411160051.2093261-14-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240411160051.2093261-1-rppt@kernel.org>
References: <20240411160051.2093261-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

There are places where CONFIG_MODULES guards the code that depends on
memory allocation being done with module_alloc().

Replace CONFIG_MODULES with CONFIG_EXECMEM in such places.

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/powerpc/Kconfig                 | 2 +-
 arch/powerpc/include/asm/kasan.h     | 2 +-
 arch/powerpc/kernel/head_8xx.S       | 4 ++--
 arch/powerpc/kernel/head_book3s_32.S | 6 +++---
 arch/powerpc/lib/code-patching.c     | 2 +-
 arch/powerpc/mm/book3s32/mmu.c       | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 1c4be3373686..2e586733a464 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -285,7 +285,7 @@ config PPC
 	select IOMMU_HELPER			if PPC64
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
-	select KASAN_VMALLOC			if KASAN && MODULES
+	select KASAN_VMALLOC			if KASAN && EXECMEM
 	select LOCK_MM_AND_FIND_VMA
 	select MMU_GATHER_PAGE_SIZE
 	select MMU_GATHER_RCU_TABLE_FREE
diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/asm/kasan.h
index 365d2720097c..b5bbb94c51f6 100644
--- a/arch/powerpc/include/asm/kasan.h
+++ b/arch/powerpc/include/asm/kasan.h
@@ -19,7 +19,7 @@
 
 #define KASAN_SHADOW_SCALE_SHIFT	3
 
-#if defined(CONFIG_MODULES) && defined(CONFIG_PPC32)
+#if defined(CONFIG_EXECMEM) && defined(CONFIG_PPC32)
 #define KASAN_KERN_START	ALIGN_DOWN(PAGE_OFFSET - SZ_256M, SZ_256M)
 #else
 #define KASAN_KERN_START	PAGE_OFFSET
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 647b0b445e89..edc479a7c2bc 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -199,12 +199,12 @@ instruction_counter:
 	mfspr	r10, SPRN_SRR0	/* Get effective address of fault */
 	INVALIDATE_ADJACENT_PAGES_CPU15(r10, r11)
 	mtspr	SPRN_MD_EPN, r10
-#ifdef CONFIG_MODULES
+#ifdef CONFIG_EXECMEM
 	mfcr	r11
 	compare_to_kernel_boundary r10, r10
 #endif
 	mfspr	r10, SPRN_M_TWB	/* Get level 1 table */
-#ifdef CONFIG_MODULES
+#ifdef CONFIG_EXECMEM
 	blt+	3f
 	rlwinm	r10, r10, 0, 20, 31
 	oris	r10, r10, (swapper_pg_dir - PAGE_OFFSET)@ha
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index c1d89764dd22..57196883a00e 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -419,14 +419,14 @@ InstructionTLBMiss:
  */
 	/* Get PTE (linux-style) and check access */
 	mfspr	r3,SPRN_IMISS
-#ifdef CONFIG_MODULES
+#ifdef CONFIG_EXECMEM
 	lis	r1, TASK_SIZE@h		/* check if kernel address */
 	cmplw	0,r1,r3
 #endif
 	mfspr	r2, SPRN_SDR1
 	li	r1,_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_EXEC
 	rlwinm	r2, r2, 28, 0xfffff000
-#ifdef CONFIG_MODULES
+#ifdef CONFIG_EXECMEM
 	li	r0, 3
 	bgt-	112f
 	lis	r2, (swapper_pg_dir - PAGE_OFFSET)@ha	/* if kernel address, use */
@@ -442,7 +442,7 @@ InstructionTLBMiss:
 	andc.	r1,r1,r2		/* check access & ~permission */
 	bne-	InstructionAddressInvalid /* return if access not permitted */
 	/* Convert linux-style PTE to low word of PPC-style PTE */
-#ifdef CONFIG_MODULES
+#ifdef CONFIG_EXECMEM
 	rlwimi	r2, r0, 0, 31, 31	/* userspace ? -> PP lsb */
 #endif
 	ori	r1, r1, 0xe06		/* clear out reserved bits */
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index c6ab46156cda..7af791446ddf 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -225,7 +225,7 @@ void __init poking_init(void)
 
 static unsigned long get_patch_pfn(void *addr)
 {
-	if (IS_ENABLED(CONFIG_MODULES) && is_vmalloc_or_module_addr(addr))
+	if (IS_ENABLED(CONFIG_EXECMEM) && is_vmalloc_or_module_addr(addr))
 		return vmalloc_to_pfn(addr);
 	else
 		return __pa_symbol(addr) >> PAGE_SHIFT;
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index 100f999871bc..625fe7d08e06 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -184,7 +184,7 @@ unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 
 static bool is_module_segment(unsigned long addr)
 {
-	if (!IS_ENABLED(CONFIG_MODULES))
+	if (!IS_ENABLED(CONFIG_EXECMEM))
 		return false;
 	if (addr < ALIGN_DOWN(MODULES_VADDR, SZ_256M))
 		return false;
-- 
2.43.0


