Return-Path: <linux-modules+bounces-4203-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E3DB2EDF3
	for <lists+linux-modules@lfdr.de>; Thu, 21 Aug 2025 08:12:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ABFCB7A51E1
	for <lists+linux-modules@lfdr.de>; Thu, 21 Aug 2025 06:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7C882C11E0;
	Thu, 21 Aug 2025 06:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qP+aS7CD"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA7E20330;
	Thu, 21 Aug 2025 06:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755756717; cv=none; b=P4LQZLiTRrVJgOBqtMabvyBZXrIVTofkdCQ/w24ZS0QeUY3cUrRu85wJNI5eOFsroS+7z3zRjmRKaqTDgSRJEDb4tOW4kteR2WH3up1R6Cu1PX5kTquTfbMlcAPqr2CLH4lnOuB/4TohN56ksQ38ew7isRjZDneO7aLhkKFQzLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755756717; c=relaxed/simple;
	bh=+PhorBsR6XMQ86wn4MXz/aLDVw7PeqDWpjqLZ/xx6is=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RIEah0tHvm98D7pippusqTkVYcbzaMHFUSW/Kc8JCR8RBzSJ8rn9zySpBIkCSpeYZyws+38dLHYxzXKKKQzS526id3N78OZJkAR+vawdiGZ6a9Rcraw56EyUlSpbMK/cehmfYewrVGNxi0wFgBfhyHZFBq0d9wq3jiRFS9wPMOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qP+aS7CD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D8EFC4CEED;
	Thu, 21 Aug 2025 06:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755756717;
	bh=+PhorBsR6XMQ86wn4MXz/aLDVw7PeqDWpjqLZ/xx6is=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qP+aS7CDTcx3AaSCB8aROP8Z3j5y7rpn2d+cQ4/5rom6GopCD2X8201ocHvfjnbPq
	 o/Cqmum51WzIu7FGUPN30V/Q1n6m5dy0uwtUrdhJW1EV/uJuj/LsDDJ2sDRmKQqJo2
	 CDMaQEuOQUOPifZxG8sSL97Jjg1Azpr1lNncNe8HEw0UAEVpeN7hHxCIuv8ABSHBtf
	 ah/5gVJtO3HEOHaOFnydT/vSubHbRhIUY++u+Vr8YnV3gnCseqsBygmFo/gYGa45bo
	 T7HdPJpFfC9C6URSWpKF+U5IQlLjeZifbgPzsNweYN9q2OxnY1BS8BTLpZ4uV/EAXI
	 AaBmI9I71YYBw==
Date: Thu, 21 Aug 2025 09:11:46 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Daniel Gomez <da.gomez@samsung.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Yann Ylavic <ylavic.dev@gmail.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-modules@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v3 8/8] x86/ftrace: enable EXECMEM_ROX_CACHE for ftrace
 allocations
Message-ID: <aKa4otIF6AbhD2X3@kernel.org>
References: <20250713071730.4117334-1-rppt@kernel.org>
 <20250713071730.4117334-9-rppt@kernel.org>
 <20250820184743.0302a8b5@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820184743.0302a8b5@gandalf.local.home>

On Wed, Aug 20, 2025 at 06:47:43PM -0400, Steven Rostedt wrote:
> On Sun, 13 Jul 2025 10:17:30 +0300
> Mike Rapoport <rppt@kernel.org> wrote:
> 
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > For the most part ftrace uses text poking and can handle ROX memory.
> > The only place that requires writable memory is create_trampoline() that
> > updates the allocated memory and in the end makes it ROX.
> > 
> > Use execmem_alloc_rw() in x86::ftrace::alloc_tramp() and enable ROX cache
> > for EXECMEM_FTRACE when configuration and CPU features allow that.
> > 
> > Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> 
> The "ftrace=function" kernel command line started crashing with v6.17-rc1,
> and I bisected it down to this commit:
> 
>  5d79c2be5081 ("x86/ftrace: enable EXECMEM_ROX_CACHE for ftrace allocations")
> 
> On boot I hit this:
> 
> [    0.159269] BUG: kernel NULL pointer dereference, address: 000000000000001c
> [    0.160254] #PF: supervisor read access in kernel mode
> [    0.160975] #PF: error_code(0x0000) - not-present page
> [    0.161697] PGD 0 P4D 0
> [    0.162055] Oops: Oops: 0000 [#1] SMP PTI
> [    0.162619] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.17.0-rc2-test-00006-g48d06e78b7cb-dirty #9 PREEMPT(undef)
> [    0.164141] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> [    0.165439] RIP: 0010:kmem_cache_alloc_noprof (mm/slub.c:4237) 
> [    0.177483] Call Trace:
> [    0.177828]  <TASK>
> [    0.178123] mas_alloc_nodes (lib/maple_tree.c:176 (discriminator 2) lib/maple_tree.c:1255 (discriminator 2)) 
> [    0.178692] mas_store_gfp (lib/maple_tree.c:5468) 
> [    0.179223] execmem_cache_add_locked (mm/execmem.c:207) 
> [    0.179870] execmem_alloc (mm/execmem.c:213 mm/execmem.c:313 mm/execmem.c:335 mm/execmem.c:475) 
> [    0.180397] ? ftrace_caller (arch/x86/kernel/ftrace_64.S:169) 
> [    0.180922] ? __pfx_ftrace_caller (arch/x86/kernel/ftrace_64.S:158) 
> [    0.181517] execmem_alloc_rw (mm/execmem.c:487) 
> [    0.182052] arch_ftrace_update_trampoline (arch/x86/kernel/ftrace.c:266 arch/x86/kernel/ftrace.c:344 arch/x86/kernel/ftrace.c:474) 
> [    0.182778] ? ftrace_caller_op_ptr (arch/x86/kernel/ftrace_64.S:182) 
> [    0.183388] ftrace_update_trampoline (kernel/trace/ftrace.c:7947) 
> [    0.184024] __register_ftrace_function (kernel/trace/ftrace.c:368) 
> [    0.184682] ftrace_startup (kernel/trace/ftrace.c:3048) 
> [    0.185205] ? __pfx_function_trace_call (kernel/trace/trace_functions.c:210) 
> [    0.185877] register_ftrace_function_nolock (kernel/trace/ftrace.c:8717) 
> [    0.186595] register_ftrace_function (kernel/trace/ftrace.c:8745) 
> [    0.187254] ? __pfx_function_trace_call (kernel/trace/trace_functions.c:210) 
> [    0.187924] function_trace_init (kernel/trace/trace_functions.c:170) 
> [    0.188499] tracing_set_tracer (kernel/trace/trace.c:5916 kernel/trace/trace.c:6349) 
> [    0.189088] register_tracer (kernel/trace/trace.c:2391) 
> [    0.189642] early_trace_init (kernel/trace/trace.c:11075 kernel/trace/trace.c:11149) 
> [    0.190204] start_kernel (init/main.c:970) 
> [    0.190732] x86_64_start_reservations (arch/x86/kernel/head64.c:307) 
> [    0.191381] x86_64_start_kernel (??:?) 
> [    0.191955] common_startup_64 (arch/x86/kernel/head_64.S:419) 
> [    0.192534]  </TASK>
> [    0.192839] Modules linked in:
> [    0.193267] CR2: 000000000000001c
> [    0.193730] ---[ end trace 0000000000000000 ]---

maple tree is initialized after ftrace, so the patch below should fix it:

diff --git a/init/main.c b/init/main.c
index 0ee0ee7b7c2c..5753e9539ae6 100644
--- a/init/main.c
+++ b/init/main.c
@@ -956,6 +956,7 @@ void start_kernel(void)
 	sort_main_extable();
 	trap_init();
 	mm_core_init();
+	maple_tree_init();
 	poking_init();
 	ftrace_init();
 
@@ -973,7 +974,6 @@ void start_kernel(void)
 		 "Interrupts were enabled *very* early, fixing it\n"))
 		local_irq_disable();
 	radix_tree_init();
-	maple_tree_init();
 
 	/*
 	 * Set up housekeeping before setting up workqueues to allow the unbound
 
> -- Steve

-- 
Sincerely yours,
Mike.

