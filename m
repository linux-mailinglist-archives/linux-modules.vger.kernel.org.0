Return-Path: <linux-modules+bounces-6259-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WK+CAojX4GlymgAAu9opvQ
	(envelope-from <linux-modules+bounces-6259-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Thu, 16 Apr 2026 14:35:20 +0200
X-Original-To: lists+linux-modules@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CD440E48D
	for <lists+linux-modules@lfdr.de>; Thu, 16 Apr 2026 14:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2CF05301105A
	for <lists+linux-modules@lfdr.de>; Thu, 16 Apr 2026 12:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9650D3B895E;
	Thu, 16 Apr 2026 12:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SMyIhcMB"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F953B892B
	for <linux-modules@vger.kernel.org>; Thu, 16 Apr 2026 12:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776342610; cv=none; b=qT52rFeIqqnMT3J29BvOnEAcXBn0VwI7MZhehfpaiKA4rfh8cq4ZLmnPcZlH/sQcjt71S6ov+r+8+f++Na4PIg5nL7pKILPzJAt2HVgH1Qn+Mhvy5Js5vBA3SLFZnQk9VDI1UVE/Rbcotg2jDCNAucgjetZUzF4nV5gS1f5/feo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776342610; c=relaxed/simple;
	bh=K/4afwQ5p31SSvbXjWdzi0L0oqupXfEEFTghGQ4JcSM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N/WT4z7UWPl5Q1qqoJ1FOVmxyg9rkph/NH8oiq3TItpJrVIf5wmqZ3OxN101Gt2HKYr7DyRymAO5n6dOeeV1QQ+PEj6NN21+Iwb5zcsZwrdO9cTDahRRflJ9BX+hIdWpXeWjtv/n05Bq5HRQHmda+Q7ly3TQst+dA63hHt/rV2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SMyIhcMB; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488ba6366a7so95599855e9.0
        for <linux-modules@vger.kernel.org>; Thu, 16 Apr 2026 05:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776342607; x=1776947407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wD5n29vJmomxS6DITZYPjUM6os1Itf/93DfNIu2KPog=;
        b=SMyIhcMBhud7E9S0oZfY4dPtDZqiIEqLPYjB6s4KMU/0r83YLgF5ZbDmBOKyocj9ZY
         qrYE7AXH6tRIrCBZ2stUl3Qi0p1ekSMzV/bw635qeh1plkYWcNycJtCcJhUXvLmdYZkQ
         ak84/JBnez1KRfcmlMpgZ++CuFvu085GXxYYRhr73LFU4mA8rLyuOYJFvhMOOSuhDheC
         cVlzWB5L4UqeH/Dt9xlmzSUVQmUeJPE5kIcqSfdNeq+fT/ncidGLUeITziIc3LIGoSlb
         mIEymQGy7PCqcWSexrvq+2z77t5rI8LX0YHsKA3o8o949yKU9SPV8ckeT8kyG1heRNFK
         DfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776342607; x=1776947407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wD5n29vJmomxS6DITZYPjUM6os1Itf/93DfNIu2KPog=;
        b=Z+sdgL5xD9K3QtsfaKLdeIHm06JK23k+K7t/uqczdn6zUe41rV4GsJPd4dDSbO1xMj
         N4zALg8ZdW8WDW1kmH9+nJw6dXRuFXUXvU1tnJ4uoslGxAFtvMHj5bu0XfSOkHFkyLk3
         bGspIctcUtKyPjkv6UqzelhnMyag51PkXduAcMSV/huYeSW69mazh6Sp8SX2bi+GxcJm
         myQGgPG5bcE8gC+pVEe2gZjsF6aFjTbBcA+/odjbplsUHoBHwd485zP5gbZk+1CcX+//
         5C11Jdn8X7iFhDZglU8ZDLp/IH44OuZFViyPfpii7TLMkzpHSEQOhlsk/5zrjMeoMbpm
         jN2w==
X-Forwarded-Encrypted: i=1; AFNElJ+WRG3FKBNkJz+Dt7o8Ascf7g/zVVUc4X3+sEQMpir4cwlkMCtFLkB4tKamZUkA430JojIzHNtxwG3Q/oXn@vger.kernel.org
X-Gm-Message-State: AOJu0YyU1OIQY+BB483CQ9Il0XUjcpOiARMhPFUM3w6GbDbacIVhob3+
	lJjdogpe/E5d9EbG7WYeepFKMLJTrhGmK4wGO04jvUd+DZNfImb+Xfvj
X-Gm-Gg: AeBDievBlwCE2mEMoCuZyrhOXxI1qUvqgRfgqlHR6egLSFokShjpdm5y+GroD6ENlj6
	KQu786lZdpOeKrctAhtCVeHZPXhN33Dk2HnBGsi6PkNfpL+GxO78hbofZHjjjENryOixg3gLAax
	5d5CzremvoY9HsjCTlLqEdDRi314+RQCtsiHE4/VOFOlLPUUmt9CtAOM0nTxqCVXPN5BVfAoHkW
	YjcnjsLuORQgzFx11PIBmTy+Jg0Tv4cZ5DWjd1FcBze4qL4JST3mzX8lwHkhfBsMhjZH+HlWayn
	1sYZbgaf6OtzDiquRM9yChatQXp+K1sgIgX9ekTJaXB9kjLLrzPpJcxb+YPn4IK+XX6wutIEYyH
	M7sJM6qzZmdhnzx1qHyf/QFwYeDp9kHKTBzJSVVShyzKM2vLKJE1R+l8S6Oehr67dhHOfQOgV8N
	5AQ5aZpFoJMbLkKDINeoyxrKkI54tgVmhjXXBX+ckGh8UQMa3qtpihcx62ffAj1Bd4
X-Received: by 2002:a05:600c:45ce:b0:485:3e19:9e01 with SMTP id 5b1f17b1804b1-488d6890c9dmr355637165e9.28.1776342606991;
        Thu, 16 Apr 2026 05:30:06 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f0e9c668sm69981255e9.4.2026.04.16.05.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:30:06 -0700 (PDT)
Date: Thu, 16 Apr 2026 13:30:04 +0100
From: David Laight <david.laight.linux@gmail.com>
To: chensong_2000@189.cn
Cc: rafael@kernel.org, lenb@kernel.org, mturquette@baylibre.com,
 sboyd@kernel.org, viresh.kumar@linaro.org, agk@redhat.com,
 snitzer@kernel.org, mpatocka@redhat.com, bmarzins@redhat.com,
 song@kernel.org, yukuai@fnnas.com, linan122@huawei.com,
 jason.wessel@windriver.com, danielt@kernel.org, dianders@chromium.org,
 horms@kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, paulmck@kernel.org,
 frederic@kernel.org, mcgrof@kernel.org, petr.pavlu@suse.com,
 da.gomez@kernel.org, samitolvanen@google.com, atomlin@atomlin.com,
 jpoimboe@kernel.org, jikos@kernel.org, mbenes@suse.cz, pmladek@suse.com,
 joe.lawrence@redhat.com, rostedt@goodmis.org, mhiramat@kernel.org,
 mark.rutland@arm.com, mathieu.desnoyers@efficios.com,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 live-patching@vger.kernel.org, dm-devel@lists.linux.dev,
 linux-raid@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 netdev@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] kernel/notifier: replace single-linked list
 with double-linked list for reverse traversal
Message-ID: <20260416133004.07bd2886@pumpkin>
In-Reply-To: <20260415070137.17860-1-chensong_2000@189.cn>
References: <20260415070137.17860-1-chensong_2000@189.cn>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6259-lists,linux-modules=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[189.cn];
	RCPT_COUNT_TWELVE(0.00)[48];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-modules@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-modules];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[189.cn:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 72CD440E48D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 15 Apr 2026 15:01:37 +0800
chensong_2000@189.cn wrote:

> From: Song Chen <chensong_2000@189.cn>
> 
> The current notifier chain implementation uses a single-linked list
> (struct notifier_block *next), which only supports forward traversal
> in priority order. This makes it difficult to handle cleanup/teardown
> scenarios that require notifiers to be called in reverse priority order.

If it is only cleanup/teardown then the list can be order-reversed
as part of that process at the same time as the list is deleted.

	David



