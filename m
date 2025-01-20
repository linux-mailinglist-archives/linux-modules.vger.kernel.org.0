Return-Path: <linux-modules+bounces-3048-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB3BA16A8C
	for <lists+linux-modules@lfdr.de>; Mon, 20 Jan 2025 11:14:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BFE4C7A59C4
	for <lists+linux-modules@lfdr.de>; Mon, 20 Jan 2025 10:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DFC31B414F;
	Mon, 20 Jan 2025 10:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="tEccHcZ2"
X-Original-To: linux-modules@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F103398B;
	Mon, 20 Jan 2025 10:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737367841; cv=none; b=uy5P1yzn4X4u56ve4UWB8iJvW8FDrv8BF16ACM0aRo3j6CrVPKWjqmbCMPEmvbT6EwztELgcOgSa4xel/tqFzuBjXSDE+UKolli3ha5IG3j6ryoPXm755BfAN9v7NAJAVHHx+Fnh7SpcrTMrDyENrvUo33xOfaWyn3LlMahqD0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737367841; c=relaxed/simple;
	bh=Cjhg3UrrFp8D01VY4OoJzV8vlgfXvqulfmkjFvBAqJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YtQoV2y2C+HkUsX8/C0OzYrlNIUrL++oOXn9TK9xmfRteclsr2UDv3UJsDfhomt7d/Aq2HnuOVVs9MGd0O4mWAyXuJ9U1puRJz1CkYp3CVoDVORxtgvvJAWia4djfV7HpfYW4GYEQBeoSlgx0YPtA65ePMxr7b5dL2PqxQ0GA2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=tEccHcZ2; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K5NlpR002996;
	Mon, 20 Jan 2025 10:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=9UQq6V
	AGnHg3um68FsouhZBJ/1T15FdfUDIuKZW//7U=; b=tEccHcZ26PcZeBgjRxiYh+
	7AZiDyVVj8cn9x23FWWwdKUAgozwR9Jgdb6Gz/2v9pS2bisAcxFJboK3j6AM37l0
	bWKBK0PlFeB8RjEsrdDekq13Lwiyp6aVFwyc178p+OEV2HjIlUroQlWzq0QQnlms
	ycp7eYjSoMzfpmQOJL8HNU2VljDEk0QLIb7Zp6DjgyB+Adi7LC5C0SALs7M1/2wx
	zjsMcElUYnexjYfIcX6rC5Sr6vyVBU+CAyzi9OYDAcMiGcYHymYFht6gtfFCY3UU
	3uv5KoqQcN0JPLdSFo0l7ZU7asMfay2XfCPCVoUeVceUlDniGKqmVMKQiKs1Jc8g
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 449ga7987c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 10:10:06 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50KA3pCR021938;
	Mon, 20 Jan 2025 10:10:05 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 449ga79875-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 10:10:05 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50K8pZcY032223;
	Mon, 20 Jan 2025 10:10:04 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 448rujdj01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 10:10:04 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50KAA2dh34472338
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Jan 2025 10:10:02 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 875F92004B;
	Mon, 20 Jan 2025 10:10:02 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E1E22004D;
	Mon, 20 Jan 2025 10:09:59 +0000 (GMT)
Received: from [9.109.215.252] (unknown [9.109.215.252])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 20 Jan 2025 10:09:59 +0000 (GMT)
Message-ID: <671a14f1-55a1-4d80-ae5c-83f20bf3037c@linux.ibm.com>
Date: Mon, 20 Jan 2025 15:39:58 +0530
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 20/28] powerpc/ftrace: Use RCU in all users of
 __module_text_address().
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Daniel Gomez <da.gomez@samsung.com>, Luis Chamberlain
 <mcgrof@kernel.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Petr Pavlu <petr.pavlu@suse.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Thomas Gleixner
 <tglx@linutronix.de>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Naveen N Rao <naveen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250108090457.512198-1-bigeasy@linutronix.de>
 <20250108090457.512198-21-bigeasy@linutronix.de>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250108090457.512198-21-bigeasy@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: W23kHP3fl5d9f8v3moATuooEveeLO-eN
X-Proofpoint-GUID: qkIVtfA37V68gBFWsUiduV7x__Ekg-Wm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_02,2025-01-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 impostorscore=0 suspectscore=0 clxscore=1011 spamscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501200083



On 1/8/25 14:34, Sebastian Andrzej Siewior wrote:
> __module_text_address() can be invoked within a RCU section, there is no
> requirement to have preemption disabled.
> 
> Replace the preempt_disable() section around __module_text_address()
> with RCU.
> 
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Naveen N Rao <naveen@kernel.org>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: linux-trace-kernel@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>   arch/powerpc/kernel/trace/ftrace.c       | 6 ++----
>   arch/powerpc/kernel/trace/ftrace_64_pg.c | 6 ++----
>   2 files changed, 4 insertions(+), 8 deletions(-)
> 

Ran ftrace (function graph) on preempt=full kernel with rcutorture while doing modprobe/rmmod.
rcutorture succeeded and didn't see any splats.
If there is any other method to test it out, please let me know.

So for powerpc bits:
Tested-by: Shrikanth Hegde <sshegde@linux.ibm.com>

> diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
> index 5ccd791761e8f..558d7f4e4bea6 100644
> --- a/arch/powerpc/kernel/trace/ftrace.c
> +++ b/arch/powerpc/kernel/trace/ftrace.c
> @@ -115,10 +115,8 @@ static unsigned long ftrace_lookup_module_stub(unsigned long ip, unsigned long a
>   {
>   	struct module *mod = NULL;
>   
> -	preempt_disable();
> -	mod = __module_text_address(ip);
> -	preempt_enable();
> -
> +	scoped_guard(rcu)
> +		mod = __module_text_address(ip);
>   	if (!mod)
>   		pr_err("No module loaded at addr=%lx\n", ip);
>   
> diff --git a/arch/powerpc/kernel/trace/ftrace_64_pg.c b/arch/powerpc/kernel/trace/ftrace_64_pg.c
> index 98787376eb87c..531d40f10c8a1 100644
> --- a/arch/powerpc/kernel/trace/ftrace_64_pg.c
> +++ b/arch/powerpc/kernel/trace/ftrace_64_pg.c
> @@ -120,10 +120,8 @@ static struct module *ftrace_lookup_module(struct dyn_ftrace *rec)
>   {
>   	struct module *mod;
>   
> -	preempt_disable();
> -	mod = __module_text_address(rec->ip);
> -	preempt_enable();
> -
> +	scoped_guard(rcu)
> +		mod = __module_text_address(rec->ip);
>   	if (!mod)
>   		pr_err("No module loaded at addr=%lx\n", rec->ip);
>   


