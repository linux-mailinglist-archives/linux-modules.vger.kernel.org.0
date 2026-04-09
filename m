Return-Path: <linux-modules+bounces-6231-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAKmImWi12kUQQgAu9opvQ
	(envelope-from <linux-modules+bounces-6231-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Thu, 09 Apr 2026 14:58:13 +0200
X-Original-To: lists+linux-modules@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8B63CAAAE
	for <lists+linux-modules@lfdr.de>; Thu, 09 Apr 2026 14:58:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DACE63027134
	for <lists+linux-modules@lfdr.de>; Thu,  9 Apr 2026 12:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C4C93CE4BC;
	Thu,  9 Apr 2026 12:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Or/VJgUS"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D0D3BFE5B
	for <linux-modules@vger.kernel.org>; Thu,  9 Apr 2026 12:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775739424; cv=none; b=INw0+EWh4NLv62JXAY6dJXokhzr+zJwopDlQADI1//iBC7bbkhyI1yidjCALp0eXfgKnimA+l8iL2qltTv9H3G4NBxCK2MvuLLmnmxw2Pz4eHaBKMPAk4CdeRP6ZxbNR3WgyS6mvUjS9gSktpW/JojjSD2706/SSKGISKmhdp7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775739424; c=relaxed/simple;
	bh=8N+L1gz4eOCtCLR2SD6m9/UInh24I1S3iZOo1q0YSvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=c1AThmhWeHGtP/zMEKBNZcYr5ZyMVw91PhHClvT08oYHTijjvNcxjdaXNupZ3J9BOI7ZZgIgs+YpI8Qe65KU4vo97HCDxkWZjTroWFoaigTnaBpezSzue9kqfrg2TpXB40DEkTlrOpJD0+8jypMKot9vMxS1dc8o3YU0k99PPgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Or/VJgUS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so10210275e9.2
        for <linux-modules@vger.kernel.org>; Thu, 09 Apr 2026 05:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775739420; x=1776344220; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zi5resqMRI4nHDxaylhlSh5hJPIr3A88NHSW9enHb70=;
        b=Or/VJgUSW/LPFab1O4g/scRr2sf5yp6vXEpcO2aivqL/wpMw/HHz68y9JzFeUsBXWB
         SQsgmZiV3jwtGYvjdtav+cRAvDAbxlOubmtQGC68hdEjh57obeii5XQf1HUBIGTEPuJf
         i/8mRY8yi3XiYvDaJdIgMJY2qYeYzA9yMkPegaurzb2ph8ALe7UcZIRfXgRCZ55rJ8MA
         pnBLeVt3HKbWv17C3+b8JMrT4aQAxrqiRZuoZOhG+zxGPcFfgx2UXdZJ0+PNgDWWUchZ
         vsPceb4UTFYeoPEDMB6TfLVdKWrsf2+UInLdD0jgMrYfDcod16tK6NEgZfSTDdAQOA2v
         hzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775739420; x=1776344220;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zi5resqMRI4nHDxaylhlSh5hJPIr3A88NHSW9enHb70=;
        b=TaT5PojYanqMkKy536KHd0E5N9Z5I0Grqz4DhpWFVoV5GmWdK0+mcmYQpzCMFvmBl+
         gXvl30sT8xcOq5lGh1I2B8PVGYE/sRqk+TkTvyOny68mdJiDikJR1xoCE3ZKP2OGP3eO
         GDQg/fWGGZhgqVb08pT6Q2fjwtQdZiDe+b8HEnYqhhO0YtqktOzj4NvGgBfOsgsRSibz
         bfoBBKMZBgNSIDz0+OpQW4yUS5eUd0DcS+BujmLEbvtbgaUr9wcSSKyqeOaCKSSzfkYB
         yqPFGGR5EjX2o3j892G7WqffcTi5LEkVE3Zp9X8v7RUCO2xOb27DLLgpUZ9Nennt3sFM
         aN/w==
X-Forwarded-Encrypted: i=1; AJvYcCVbCrbPxW9IoHE7XsI/jEKXvDMEjORitDlX7N1Rg6+2mdEpdvlXzAdFS3i/gHfhcwSjC1MI6SLKo2iGItq3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8AwqmUZOIuzEeeOFSPNscNvIQ+S8L08zgPszt4bvxAnlQDH63
	6IYhXXUUzbmutnQ5uCAqqSLwqLX9WDIUO5/xKi1SUDvPdzMgKJP8eftOJ+Y09ArLYhY=
X-Gm-Gg: AeBDiet/tI+wq24hvjDsvlOD4mBIieuLn7bDH+pZcSV2jxsTtEKu9dBlSyXBK1/18f8
	1oISZGJMo0vaiVYkAoSvPHiHA1K0ACr9+NE+dGUEwSrKLECjxWabGHk/o91wMxjG0UISi/0jelr
	FOHW2bugGoRvb9w2EQWm+w0OSiFVkZZlvG6iOdOmp7zGPzY3kEoRCDnYoVkZ+yWN3gpOeebT7FY
	IcZvk4eF3ZtAPLmv4G3aR1EH8g6LZerN1/Uo6kh8ZsjbKgK0IZQqi25YP79h0Ouo3l3P7b7O7Ur
	nxfK91O7PiWL21r+r5J5GWIPgjtlHlFZ6lrzWlzf8Dmj/4lBfQQDnPq4+XH9O9eDN1qN3zvxN8x
	aSM36xaP7atuNYOv0S3r2juuRq8fxlSyZlEHwbaxeM2SBxWoCjLdb/MBHGaaigcLvqOrHWDughG
	qL7yej05wq0zkVzjDjFy5+chkFjIrWDML1LFlWGVXhhGRU
X-Received: by 2002:a05:600c:3f08:b0:485:40db:d40c with SMTP id 5b1f17b1804b1-488996d2323mr417321415e9.3.1775739420375;
        Thu, 09 Apr 2026 05:57:00 -0700 (PDT)
Received: from [10.100.51.209] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a7223sm63022433f8f.5.2026.04.09.05.56.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 05:57:00 -0700 (PDT)
Message-ID: <8ea1cb60-7112-479d-8e05-62506dd0d54e@suse.com>
Date: Thu, 9 Apr 2026 14:56:59 +0200
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] module.lds.S: Fix modules on 32-bit parisc
 architecture
To: Helge Deller <deller@kernel.org>
References: <adVukQYvRuuC5F-K@p100>
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 Josh Poimboeuf <jpoimboe@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, linux-modules@vger.kernel.org
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <adVukQYvRuuC5F-K@p100>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6231-lists,linux-modules=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-modules];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,linux-modules@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gmx.de:email,suse.com:dkim,suse.com:email,suse.com:mid]
X-Rspamd-Queue-Id: DB8B63CAAAE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 10:52 PM, Helge Deller wrote:
> On the 32-bit parisc architecture, we always used the
> -ffunction-sections compiler option to tell the compiler to put the
> functions into seperate text sections. This is necessary, otherwise
> "big" kernel modules like ext4 or ipv6 fail to load because some
> branches won't be able to reach their stubs.
> 
> Commit 1ba9f8979426 ("vmlinux.lds: Unify TEXT_MAIN, DATA_MAIN, and related
> macros") broke this for parisc because all text sections will get
> unconditionally merged now.
> 
> Introduce the ARCH_WANTS_MODULES_TEXT_SECTIONS config option which
> avoids the text section merge for modules, and fix this issue by
> enabling this option by default for 32-bit parisc.
> 
> v2: Introduce and use ARCH_WANTS_MODULES_TEXT_SECTIONS option
> 
> Fixes: 1ba9f8979426 ("vmlinux.lds: Unify TEXT_MAIN, DATA_MAIN, and related macros")
> Cc: Josh Poimboeuf <jpoimboe@kernel.org>
> Cc: stable@vger.kernel.org # v6.19+
> Suggested-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 102ddbd4298e..78abb8be1e63 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -1128,6 +1128,13 @@ config ARCH_WANTS_MODULES_DATA_IN_VMALLOC
>  	  For architectures like powerpc/32 which have constraints on module
>  	  allocation and need to allocate module data outside of module area.
>  
> +config ARCH_WANTS_MODULES_TEXT_SECTIONS
> +	bool
> +	help
> +	  For architectures like 32-bit parisc which require that functions in
> +	  modules have to keep code in own text sections (-ffuntion-sections)
> +	  and to avoid merging all text into one big text section,
> +

Typos: '-ffuntion-sections' -> '-ffunction-sections' and ',' -> '.'

Otherwise, this looks ok to me. Feel free to add:

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr

