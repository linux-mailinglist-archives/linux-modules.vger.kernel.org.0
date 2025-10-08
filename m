Return-Path: <linux-modules+bounces-4583-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EE9BC5CB2
	for <lists+linux-modules@lfdr.de>; Wed, 08 Oct 2025 17:44:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3592189C028
	for <lists+linux-modules@lfdr.de>; Wed,  8 Oct 2025 15:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 515392FD1D4;
	Wed,  8 Oct 2025 15:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gnF5NSC5"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313F6303A24
	for <linux-modules@vger.kernel.org>; Wed,  8 Oct 2025 15:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759937734; cv=none; b=FZg/ekxSLd47XU1bkgewX3olBF9xQD4qWnhjISe5XY5efcW1W9UUq6nnSaEXpXS9ALNULUvvoZu6g6eDdcXlh+RiJ+LS2fBxNALGzlsXbZ7qeAqDsep2bk18Blu4HqRN0Jr8QJdvL30qAF19rd6JznT6Stt+n949RrSU6dKvjqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759937734; c=relaxed/simple;
	bh=MeMMelM99YxAP2TiJ88uHut4Vgu4VVwfVNl7tmbTWec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GLZGKfA4mf6UvcVqHA7OOOpVxNQq3rRLpwcfYMIMEIms0yl9NHsOy5nMtYE4q7R6f/k9oX/9x49oBUuA1cEnMwmph/6nKFODjnbbyTGgxFMRXteZ0KOhilt1AyfCSgEq+nE7X1S7hvm1FaKQ+1qVn6Iq4X4PCDcqJVRxgrQ1+mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gnF5NSC5; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-46e6a6a5e42so7835e9.0
        for <linux-modules@vger.kernel.org>; Wed, 08 Oct 2025 08:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759937730; x=1760542530; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ubNXaozyh7/Vs/XkTA5KuPjbCc9zS+vNuDnCIrZD13M=;
        b=gnF5NSC50KY8J07hJipP4oSUoycsnB5USbLkXj+IRUeEwb3bhLFIKuLsoO+gxroQqH
         hNZucazjbQHPSMYn+rF05W2Qm3NgXiO7yCF9cwfH9tWKSGGHfK4wkKRldds27153FYrR
         8UKbPPGXjJxFj3MrHOd8mQaIZPKcL6NWlyyyQ1ZZiS22z8O/vCA1h6d/le88excK+PFp
         Vo00gWI0eYa81mis8wk396h9ZHapvR1zw3LLf1tVJ3LsVduqBpxPIBGIToL6c1ssdr1o
         ImqpvGWiGv1rwoShyyRI1RY5uMErpIXY+BSvv2MHpNpxoy+OWIoFZzY+yMlrBFVfwYoj
         F3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759937730; x=1760542530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ubNXaozyh7/Vs/XkTA5KuPjbCc9zS+vNuDnCIrZD13M=;
        b=F4X4BiOeK6MPJirmK96SE8QFCA1mZMyJQ9YxiNLUh8Cx+bpEAtD0x8eQfhJYylpAVQ
         qyLyi4Ms5mO1QrpYd7XQG0JYQebRsdKhI27Ky3yd3IStvnpr+TyXEs2C9i9O0xzmKmlZ
         w9ZXGTBCE/G3fiL4CJqQjdfXiZsMTf4IO595Wd1Qo5Hk8QlJ8tsGZYZjnq33t2NFEm1b
         Z9ULfyLvC7AmbcFT/Rdy2NtBXAA2M323N3BiSrQ4fOqYksIYh6dZrtRfXsg53wMgUVC7
         nkbGhyKfK9dly1XD0M0cVaOXKvQXoVfF0FzWTvREb4Vp8Wq8bB41kNo07cNU4Gtaevdl
         PI7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWP1C3BR3gEGqvv3bWKPL3jIe+YTohAgUVh382iccN/cr+v3oUVmAlspKV9uUiqeeqq7ltOQPnc5wSH4Vqp@vger.kernel.org
X-Gm-Message-State: AOJu0YwNM2rIXqM4RperO2pbRnr4gOcUcxygwRk+xeJooeY8z79oj6qY
	mCs4TiqhICNiHIzajIXF7tVPpr6RZpX1XwOljO0uGZ4JOibzsYKWPFjmq6mcpT2NTIM=
X-Gm-Gg: ASbGnct0HFO8zl2/lEvZCCIlQt1MPbRmUuKchKOPF1ErlBmd5Uat04Hl0WVW7jbZh0b
	7RYypzMCkA7uLNJ/bhFp7xufJ6rRwxVoIPZIE141Z3EtcYrGMGB31gyAWL8aRu8sbNaAmp8T4Tl
	2LBbRbF7mtAWZxKbDVw9FfdZe7BurdG7OpCoq4gM+AqXzJMIuFjfI8fN+hqHYW+vPLM7T6JbFui
	WARGK5M0yGJMNJ60zb/VgRflK2qMWeJRCMYbTz7EwFc+DFOKYuU1mgltzRODipp2ax4BqRcN7MD
	p04TNQXegyfT5tlHWbHFA2eUsClNjet7jRg4V+mRjYVFgvHwb9A8YbLcyt9SK152AwPi7fKMj58
	U5U8yK9dr4NY7d887w8KUq95cw8IknSLL71VuHBiUg4NeXpHKur/Lhims+A+Bu+d8Xytk5f2sCQ
	8=
X-Google-Smtp-Source: AGHT+IGq0oHp24srWcJJTjTppYJ2gdwL9MgZY8IY0dg2EY9BvDrG3QQbJW280mmxjX7I0sdyPXCadA==
X-Received: by 2002:a05:600c:529a:b0:46e:3e25:1626 with SMTP id 5b1f17b1804b1-46fa9aefe15mr27734775e9.19.1759937730499;
        Wed, 08 Oct 2025 08:35:30 -0700 (PDT)
Received: from [10.0.1.22] (109-81-1-107.rct.o2.cz. [109.81.1.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3cc939sm16809025e9.1.2025.10.08.08.35.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 08:35:29 -0700 (PDT)
Message-ID: <75099eaa-4b51-4580-ac82-2c9f892f34b2@suse.com>
Date: Wed, 8 Oct 2025 17:35:28 +0200
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] module loader: enforce symbol import protection
To: Siddharth Nayyar <sidnayyar@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, Nicolas Schier <nicolas.schier@linux.dev>,
 Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250829105418.3053274-1-sidnayyar@google.com>
 <20250829105418.3053274-11-sidnayyar@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250829105418.3053274-11-sidnayyar@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/29/25 12:54 PM, Siddharth Nayyar wrote:
> The module loader will reject unsigned modules from loading if such a
> module attempts to import a symbol which has the import protection bit
> set in the kflagstab entry for the symbol.
> 
> Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
> ---
> [...]
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index 4437c2a451ea..ece074a6ba7b 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -380,6 +380,7 @@ static bool find_exported_symbol_in_section(const struct symsearch *syms,
>  	fsa->crc = symversion(syms->crcs, sym - syms->start);
>  	fsa->sym = sym;
>  	fsa->license = (sym_flags & KSYM_FLAG_GPL_ONLY) ? GPL_ONLY : NOT_GPL_ONLY;
> +	fsa->is_protected = sym_flags & KSYM_FLAG_PROTECTED;
>  
>  	return true;
>  }
> @@ -1273,6 +1274,11 @@ static const struct kernel_symbol *resolve_symbol(struct module *mod,
>  		goto getname;
>  	}
>  
> +	if (fsa.is_protected && !mod->sig_ok) {
> +		fsa.sym = ERR_PTR(-EACCES);
> +		goto getname;
> +	}
> +
>  getname:
>  	/* We must make copy under the lock if we failed to get ref. */
>  	strscpy(ownername, module_name(fsa.owner), MODULE_NAME_LEN);

The is_protected check should be moved before the ref_module() call.
Adding a reference to another module should be always the last step,
after all symbol checks have been performed.

> @@ -1550,8 +1556,12 @@ static int simplify_symbols(struct module *mod, const struct load_info *info)
>  				break;
>  
>  			ret = PTR_ERR(ksym) ?: -ENOENT;
> -			pr_warn("%s: Unknown symbol %s (err %d)\n",
> -				mod->name, name, ret);
> +			if (ret == -EACCES)
> +				pr_warn("%s: Protected symbol %s (err %d)\n",
> +					mod->name, name, ret);
> +			else
> +				pr_warn("%s: Unknown symbol %s (err %d)\n",
> +					mod->name, name, ret);
>  			break;
>  
>  		default:

I suggest moving the error message about the symbol being protected down
into resolve_symbol(), at the point where this issue is detected. This
approach is generally used for other checks, such as the CRC or
namespace check. Additionally, I think it would make sense to change the
current "Unknown symbol" warning here to "Unresolved symbol" to be more
accurate.

-- 
Thanks,
Petr

