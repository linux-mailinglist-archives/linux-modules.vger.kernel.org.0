Return-Path: <linux-modules+bounces-2885-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FEE9FFA4B
	for <lists+linux-modules@lfdr.de>; Thu,  2 Jan 2025 15:16:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D17C18835A5
	for <lists+linux-modules@lfdr.de>; Thu,  2 Jan 2025 14:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73731B0F1A;
	Thu,  2 Jan 2025 14:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UgwoV387"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8FB1885B4
	for <linux-modules@vger.kernel.org>; Thu,  2 Jan 2025 14:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735827403; cv=none; b=Jsz81unEUF0YWdQ8JstZLf8Ffm80mfb4gayRERsPFUFh3ejPcgJ5fzo+K96WWRfkdXBzju0ModuLoDThx5q9q/MVvi+Yu4PPWmsz52oTHDo1X7sG9ls+0xlRpd/EJnxbo5RQkK9seT0kvShW3sETCvvZI2qp7S4IFC+xAtiN/Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735827403; c=relaxed/simple;
	bh=CsCpQsXnlZGrwQ6tjkZO+RdYahDklYmcW3p6FeJDbb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cwyNgUeeSSkbnkzlWuXwNu/GxUwRBX64GH6x+X1VbqhMMUW+wdXwNPskDwmZs3O3Fd71X+7iQ3ngjpBz9n2GDPOpEWxv/Mxs2sMCvG5yNS9LnrM1+Xt4LJrtR0a6o16akY6n/XbooZvJCIQ2M3HoMgS/S00HTdpJwb6YoAJ0Pwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UgwoV387; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43618283dedso113701225e9.3
        for <linux-modules@vger.kernel.org>; Thu, 02 Jan 2025 06:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1735827400; x=1736432200; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rxeQmEUngUXl43U3DOMKAS+5QyXY4hU1UnyuidxxvAQ=;
        b=UgwoV387gy79JK3K50gA8oyGHtGJtfOMeGu+gNTRVEfNKuyEER9qcoLPN6FiNm9AOL
         tkUGB7i0LAztVBJwQPQFGCVMsTtry25uDHuON9xWEt27W1hwfM73jhabh7OB2GBHkFwy
         d1muJCfe1utuODd7UMzZ09ZHnois5B7sUxC7xmsX2ZDt1/Ovw8OYud8uAaphb3y08+24
         lKpRrYs7UOLFVF1nAMPWX8R44Au6hIum15xQh3/4wAQIuiRRX+89lOBUDGBAAMTQmKC4
         VCbIGdvYClxPctomZ+ee3H0jnh2rizcsoxNOvotbC9ndVKlBTItviNSug0ghgG3akR4T
         JtAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735827400; x=1736432200;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rxeQmEUngUXl43U3DOMKAS+5QyXY4hU1UnyuidxxvAQ=;
        b=l2UFTZKir7DwKlXOszJcKSPd9ljGj5w7iF2W6nMxkIddtnhhLek1b2Qxs6HuKY7MuB
         Yl3Np/h4oTJndx9QhIX1umy63PL+OOCAZbFMJNQtfAwt16RaZMbL2anEA9MxZrSJp3nz
         fycCk0DsefhMOaDpOw016nRN3/Dodx/sOX10xJcaftTL7IMjZl+woXo/JECExKuDv0xN
         hzOTpTBPjCiqSMjqzLOduqshumRvL1kCWz2nlgKcJuopicnDsHiHBxJO/3TbXU2qsN25
         WxAU9owBAsGIKIb2U2XTDkhFwsfaAsIXG1Ru60XEPhhh6ZwNIi/xBFVNSKr2N4+k0jux
         1k8w==
X-Gm-Message-State: AOJu0Yzd0WlMgQQyxEUT0zhdRN+j7NBmqfD3c5ZbqRLmo1cmgFgEvhxE
	S+1SEpPSGLyrT0+DLvqNU71qO6dkjqaWWc+A9d8DtWbMF67UxsIhaFubPR2nfnY=
X-Gm-Gg: ASbGncvzlyvvH7gt/dC+OBXyJrtXKz0vuJaJu1Fg20f4Shy4SrbyTJh6+Py/C0CFuJN
	qZ7wnCMVGPZJyVtFqw2Rufy3OCXJMr0+ANnZA215QIA/rdU9TKV1sRsWoDftvdxHbAEqXagqZw5
	c52KNb5IKyPHJSGEkPUi2ofWn8yjkSfkNqlEiVluYBaaJZms1qnTDZC+Mw67SreZsFHLzokhojz
	eWww/bqLCU8yiTLI1AL6Y3UBEohFLrJKNgGpRa1m0lr6YVHNQEeyn9Cbw==
X-Google-Smtp-Source: AGHT+IF0uYcL7D50WlyAx8Vt1APUkhyFRpHrc2CY+y2uVGEJR+MiQFexcrXXw0PArWTHsuRdwTdplw==
X-Received: by 2002:a05:6000:1f8c:b0:385:f89a:402e with SMTP id ffacd0b85a97d-38a221f65c9mr41908200f8f.14.1735827399717;
        Thu, 02 Jan 2025 06:16:39 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea3d5sm457961115e9.5.2025.01.02.06.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 06:16:39 -0800 (PST)
Date: Thu, 2 Jan 2025 15:16:36 +0100
From: Petr Mladek <pmladek@suse.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Gomez <da.gomez@samsung.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jiri Kosina <jikos@kernel.org>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Miroslav Benes <mbenes@suse.cz>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-trace-kernel@vger.kernel.org, live-patching@vger.kernel.org
Subject: Re: [PATCH v2 06/28] module: Use RCU in find_module_all().
Message-ID: <Z3afxC738frodOTr@pathway.suse.cz>
References: <20241220174731.514432-1-bigeasy@linutronix.de>
 <20241220174731.514432-7-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220174731.514432-7-bigeasy@linutronix.de>

On Fri 2024-12-20 18:41:20, Sebastian Andrzej Siewior wrote:
> The modules list and module::kallsyms can be accessed under RCU
> assumption.
> 
> Remove module_assert_mutex_or_preempt() from find_module_all() so it can
> be used under RCU protection without warnings. Update its callers to use
> RCU protection instead of preempt_disable().
> 
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Joe Lawrence <joe.lawrence@redhat.com>
> Cc: Josh Poimboeuf <jpoimboe@kernel.org>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Cc: Miroslav Benes <mbenes@suse.cz>
> Cc: Petr Mladek <pmladek@suse.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: linux-trace-kernel@vger.kernel.org
> Cc: live-patching@vger.kernel.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  include/linux/module.h      | 2 +-
>  kernel/livepatch/core.c     | 4 +---
>  kernel/module/kallsyms.c    | 1 +
>  kernel/module/main.c        | 6 ++----
>  kernel/trace/trace_kprobe.c | 9 +++------
>  5 files changed, 8 insertions(+), 14 deletions(-)

I looked primary on the changes in the livepatch code. But the entire
patch looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

