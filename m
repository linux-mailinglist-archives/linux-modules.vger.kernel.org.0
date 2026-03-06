Return-Path: <linux-modules+bounces-5893-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0M5pJEmNqml0TQEAu9opvQ
	(envelope-from <linux-modules+bounces-5893-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Fri, 06 Mar 2026 09:16:09 +0100
X-Original-To: lists+linux-modules@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2393D21CEFC
	for <lists+linux-modules@lfdr.de>; Fri, 06 Mar 2026 09:16:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5C1AF301BDD8
	for <lists+linux-modules@lfdr.de>; Fri,  6 Mar 2026 08:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 353452E7180;
	Fri,  6 Mar 2026 08:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PRD7tV3c"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7F9EEBA
	for <linux-modules@vger.kernel.org>; Fri,  6 Mar 2026 08:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772784967; cv=none; b=QkQ0LPSy7f9JjW2houC1N1aHL4VUk/dLTanALBBDYexIMIH1TR9dG/AJ2QLjZL/MgL6ZDYe2JLv9MIyz7pSkMAHaOp6PaEJ5nkoC9Ng1zx1ATP/99ZQW3+yKTbaeOj98VsTprQwgiFTAA0jkm6aQwTJvkHLy7Nhp3OOUpM2JOak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772784967; c=relaxed/simple;
	bh=zBhlocaaU1ftXLafB3C+PGfdR2lQVqw31IpslNbRNlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rqSevmucnxykjjq9A2KPToMRCNjAa23iBD2IdBsZSkO2XwcVnRmIHbpvOBol5z5355Pxk/Sz/N+zDUgB7BrquiynRxgrjblZU5n9phCfmFGgQgHDhBme0F/AnbfxEWmfq0L2urK/rHQefcWdhPIu/KQL0kBuQmxASuA/0A3kqhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PRD7tV3c; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439c5b40f60so2427699f8f.0
        for <linux-modules@vger.kernel.org>; Fri, 06 Mar 2026 00:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772784964; x=1773389764; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zt+B51beLAsa2CtRXOeLzQASAwXeBbbyk6+dmth4+xI=;
        b=PRD7tV3czwChHLi9lS7YjHbWdjypnY+C4qcJuBA/msKQoHgOYGojcisThrNUJ1GX49
         iS4/lB3gsx0dY5US7213uas9dUk096xLZfFdQEJWTI6D/dcRCJwtWMQtlt+25BehimE0
         4/Ks3h2lseyapKFJ/gGkSfKQ2ykUgi53AIc2ED0XcDazeWqKx6mRrXgXhvMzCMxRHNZv
         KUzBdmj/AyD+OkUDcbG5uvS3bJEjAUO3qeChL5+yaTrJ9vnn0y5K7OfJqNIqSRpCemDU
         rBuaNn7wMazCfE42VxVmnopuj2J0nh0x5jzXMHe7xHsYC29wPSnuBqYoPpdpr00Qijgu
         dBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772784964; x=1773389764;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zt+B51beLAsa2CtRXOeLzQASAwXeBbbyk6+dmth4+xI=;
        b=ejNl3RSivguGMXIS0b9KM0IdqEo4fP+3dLLpiedN+qrAXQZAAysrvuoAionvVqjOkr
         nITdoUZlzXhoA2Tw+1kpeQP2gPXuCpLRAIgsvREd7KjtAeyjkh/Thrwpoojn6Tq+yx/L
         eeZ/Yo3+Pgrje9yN2EXBiwWadlLxz9PoEq9GxODxK4Ts8nuhivyxyaNgSDyku2IyafW8
         /ZOFoRCfPUktpIcMgfqsr63KDJ84Mpd8KS7ODAaVowOQ+5E49mZYPV6qqiUQmPyoeSfs
         GuGg7HaB/LSWqoYUg9VxfhqSW9EVp4rJQW4QajbJbek5nGh+fMAlvytCXlyxP9XIWJMD
         uVAw==
X-Forwarded-Encrypted: i=1; AJvYcCXyYVnlW/2Qyu36MY3svSmqlgG6p0Lkg3ls/uGvmRaJQOJutneEsmW+RD6kOq10T9DMWvStS/f5rsWIxfSG@vger.kernel.org
X-Gm-Message-State: AOJu0YznpZ0CmNSpXsJLvSOv+tgrQF+BIOSzRZQVvb/HYVF8f0/HjAL9
	a0Z+jJofkjakXfnQBe1hxjbw2rTxfnevhMlsE0KwO1CBRj3KQ1lpVr/8CC/sDBZ3YbA=
X-Gm-Gg: ATEYQzyFzAI7qQwlRn9g6/ZG8/VrPoNkvQEN6P3ovJUP5UKyP61NmSf0BH/mwZqreYC
	kB85YINnT1c1DGgTNyYSE4Y+EvIZfgxA+gVod+YzimNHYvgeNkpGyVBj/LDVpS4qDgXYeQuIih3
	fiNW3BWhc0zMTz/cUVsqOgzvE3islAuRHNOLcqGVxwadU/5GFXql1RqNTleBjnvk+2OyesiAZJI
	w8z7bJpKYQ9lfaPNE3A3UboypHU8v+7npjEBEwJG7rSx9k5I7wUWw8qYUD/94qsLt+c4/vLv3Ec
	Mc0IDKOnpAe7EltRAD/gDG0VsO+lpAKB+vNoe3Pj+Mmvns33ZRDZegrkBRBoQ6naoY2KFN5eoTV
	cCJeh/nMcQ/VguzY26QedFWwG/tIM3LkjtQ+K4h6JVAavqW6AsnMHupyGxKIh4DfNsfd/wkcj2T
	gigZsK1R/v0QeZfsUXwpI+T+Ze9NVcCiRsawzDg3gnecwq
X-Received: by 2002:a05:600c:8218:b0:480:69ae:f0e9 with SMTP id 5b1f17b1804b1-48526958b30mr19816615e9.16.1772784964020;
        Fri, 06 Mar 2026 00:16:04 -0800 (PST)
Received: from [10.100.51.209] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485276bc6bbsm16768355e9.15.2026.03.06.00.16.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 00:16:02 -0800 (PST)
Message-ID: <2b3a0699-2170-43f8-917f-4acea18195ca@suse.com>
Date: Fri, 6 Mar 2026 09:15:59 +0100
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] module.lds,codetag: force 0 sh_addr for sections
To: Joe Lawrence <joe.lawrence@redhat.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 Petr Mladek <pmladek@suse.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260305015237.299727-1-joe.lawrence@redhat.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260305015237.299727-1-joe.lawrence@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 2393D21CEFC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5893-lists,linux-modules=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-modules];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,linux-modules@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,sourceware.org:url,suse.com:dkim,suse.com:email,suse.com:mid]
X-Rspamd-Action: no action

On 3/5/26 2:52 AM, Joe Lawrence wrote:
> Commit 1ba9f8979426 ("vmlinux.lds: Unify TEXT_MAIN, DATA_MAIN, and
> related macros") added .text and made .data, .bss, and .rodata sections
> unconditional in the module linker script, but without an explicit
> address like the other sections in the same file.
> 
> When linking modules with ld.bfd -r, sections defined without an address
> inherit the location counter, resulting in non-zero sh_addr values in
> the .ko.  Relocatable objects are expected to have sh_addr=0 for these
> sections and these non-zero addresses confuse elfutils and have been
> reported to cause segmentation faults in SystemTap [1].
> 
> Add the 0 address specifier to all sections in module.lds, including the
> .codetag.* sections via MOD_SEPARATE_CODETAG_SECTIONS macro.
> 
> Link: https://sourceware.org/bugzilla/show_bug.cgi?id=33958
> Fixes: 1ba9f8979426 ("vmlinux.lds: Unify TEXT_MAIN, DATA_MAIN, and related macros")
> Signed-off-by: Joe Lawrence <joe.lawrence@redhat.com>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr

