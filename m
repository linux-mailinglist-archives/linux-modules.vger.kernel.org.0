Return-Path: <linux-modules+bounces-6000-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDEuKIQnsGnOggIAu9opvQ
	(envelope-from <linux-modules+bounces-6000-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Tue, 10 Mar 2026 15:15:32 +0100
X-Original-To: lists+linux-modules@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BDD2519AB
	for <lists+linux-modules@lfdr.de>; Tue, 10 Mar 2026 15:15:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E422A34180F6
	for <lists+linux-modules@lfdr.de>; Tue, 10 Mar 2026 13:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36EF23B6C01;
	Tue, 10 Mar 2026 13:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+sBZMeG"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E323AF647
	for <linux-modules@vger.kernel.org>; Tue, 10 Mar 2026 13:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773147867; cv=none; b=jTYHsVQLQfsPtnNm5tygxCCsiAn76f3td5jf4o4VEYX4YkrWAPt2eksUOeevq73CiooiQJPUh2lEPW/pLnjZUGZxj5ZVwNJJmHgahmjrYkvd9umwRMABNUGKNT2Zhi4KKC+jHIQ/GPlXzb4/ly4BhOkq45x6f2I7GyQCS6zpKtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773147867; c=relaxed/simple;
	bh=y4lsaI0Z53oOhst01yq85deaRRzpPQZxx52q7qPxghc=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=oDgKSz/c9p5vk6KN414qXewYoM/WeyWKvxeHOt/ODPApKjl7uQSirTdl+lbHaeiORMdxb6GtjdEH3ScxQ1kxJ9BpvWi1R4ehyCFcvlBYviF9T6T02CFcSb/Gt3kk/6tvBS5EpZ5YQXIaQ+RVQu+OuCI+h/9QsyEHcHR5TihBj/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+sBZMeG; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c73bb6662d8so511244a12.1
        for <linux-modules@vger.kernel.org>; Tue, 10 Mar 2026 06:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773147865; x=1773752665; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lf07QwHYKXnNseSZHISFXkm0dXoJRQ7SsuVDO+ZY+ek=;
        b=D+sBZMeGU/21Fbw5exP/Qz3cOF8mLnd6TDab53z9KD/zTW0754bDdl+IUBgEFYaKbi
         79I9pJUPmrA2R+TBBTrjAcbDidC0CWjUTVSWjsC7VUlrQYAm37Lnbcs1pOr8Dfr5AqBG
         nloLSsDS8aT4um9xSXy3328MXJYlyVtuJgwEavEt/ehGdE83thDyfT1NF2dIxvXrbqkb
         wDYN2/6VpKXeZTmCQCOymnCfVssWNXItJ3hGY9prvLmEIACgd/cD8gKgBIUbzHOBabj1
         N1kIdW89tQmL4kgGkY5NvoAbYpHwWdtvxiHR2eKnzOt6UP7EDi+a44Ya4peRtFPNTXW/
         6jaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773147865; x=1773752665;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lf07QwHYKXnNseSZHISFXkm0dXoJRQ7SsuVDO+ZY+ek=;
        b=knkeVR7Gdrj6Uis+NZaYrzCRz0908tg6s0ezQhq37aq9PDoiHGumuMuopS8NfRZwHt
         JYDIaNESJHZYCn6JXFmqPQCymNlrOf7MmUH0DPVOxp99LbvWOb3zFrrx4Gr/yo2bR7a6
         4daVQEa09v10V31HFhqmLdmFVqgJzIOLFmDhdGNF7Nbugpx9u324No66jNkw+WehU1yI
         uKkHO89+rli8V/nG0IN6uJWZHWwYSptNoD9v63RxKaisbg5ucpMK8KwNAX4MqIeAqr0K
         S8NdZNc3PLSfAdP1uFOTXK5LSdChcxB8/UmbuZsa4EHThYPAgMGVpBfgNwG2h4JHSd4f
         a9aQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/W4sldYLhi87tuHU/ZRYIxe9TKpu3LBG0mAdsYTSTFn/gjeIlMkqb6hwVOZ568TD5S7Es8ldAKKsp2QCx@vger.kernel.org
X-Gm-Message-State: AOJu0YymbKf6TMWKNz0W+3OO/l019UWu5Wz3wxpZGiSIark/5gOPvvDM
	v9Qe6fVoIeBFc7TRJ4Z/Obbfj752zzSN7ugfMBGOcO2t8F9GIwz9B7FZ
X-Gm-Gg: ATEYQzyE0GIxS6OrNNeBW1I2cfB+8JMCi+vYovRyQrM1rDcoK+FDtXJ2RCfWYBdzyif
	AsNlj6xtnDAmmR94quiQEfOxTgXFnyS43ZGsYXLMtIi+OrZEqklGtdfniAtW1noAv8o/jj8s0CS
	pRmJp5bt9BNd+fO1GOTyGhEdMbWp/raurKHmCbloCAzNQSSM6eQYWbtfmn+NDSwUlJBFVzBDKGt
	FoFxsmTuozZyn9gev455xu427bVrqvFuFl/4djkgu7HiPr2fNLpWPN2zNeTH/jdPpmfMWIzALvV
	BMcywvTfbZNpdUvWo2za3mLWgNIxsuhDyBRzH4Crm0Ixbr0caYiM0wPUMZZVsEgfFHlK1+BLY21
	gtmqt5DitvzMcyIxNwC5nB3PTqvY4oBix8Cyg+BTwZ/tso6L4KwNuuWTugOIGJB5fOV5Y9tMR2q
	V1uGz3kXvsTnsiztilHedg9jTtuLZN09BUu/0=
X-Received: by 2002:a17:903:228f:b0:2ae:aa16:acf7 with SMTP id d9443c01a7336-2aeaa16b19amr6692015ad.40.1773147865224;
        Tue, 10 Mar 2026 06:04:25 -0700 (PDT)
Received: from [192.19.0.1] ([116.232.34.251])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e83ad5sm156776805ad.26.2026.03.10.06.04.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 06:04:24 -0700 (PDT)
Message-ID: <4215f061-488b-4c2b-98b3-45db4aabed5e@gmail.com>
Date: Tue, 10 Mar 2026 21:04:14 +0800
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: hch@infradead.org
Cc: atomlin@atomlin.com, da.gomez@kernel.org, laoar.shao@gmail.com,
 linux-modules@vger.kernel.org, mcgrof@kernel.org, petr.pavlu@suse.com,
 samitolvanen@google.com
References: <aa-6wILF90Y4ndnd@infradead.org>
Subject: Re: [PATCH v3] module: print version for external modules in
 print_modules()
Content-Language: en-US
From: Yafang Shao <laoar.shao@gmail.com>
In-Reply-To: <aa-6wILF90Y4ndnd@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 26BDD2519AB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_CC(0.00)[atomlin.com,kernel.org,gmail.com,vger.kernel.org,suse.com,google.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6000-lists,linux-modules=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laoarshao@gmail.com,linux-modules@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-modules];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action



 > Then don't run extetrnal modules, which are not a first part citizen.
 > Get your changeas upstream instead of just leeching the upstream
 > developers work.

That doesn't make any sense.
Could you please explain the rationale behind introducing 
EXPORT_SYMBOL_GPL() and TAINT_OOT_MODULE ?



