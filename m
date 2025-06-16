Return-Path: <linux-modules+bounces-3796-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECDDADB2A3
	for <lists+linux-modules@lfdr.de>; Mon, 16 Jun 2025 15:56:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A11A6169547
	for <lists+linux-modules@lfdr.de>; Mon, 16 Jun 2025 13:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3EB92877F1;
	Mon, 16 Jun 2025 13:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="C7l26tzL"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB9C285C96
	for <linux-modules@vger.kernel.org>; Mon, 16 Jun 2025 13:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750082149; cv=none; b=oPi5ep7tRT7JpdT14apabhvK2tGoBChhglrN04+32473VWy0i4aQo8iMRvWiN30Ilu0HNMt/ICDdIX20YB3mlun6fp1CXsiXTA/uC2GtwN/1ESKkSDvxkxdMGhHiXAAE9irMg6mAYB4DXXTQlLjfDvKe1SDwtxdUmnyFxBtvnlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750082149; c=relaxed/simple;
	bh=3e3eB4muD3EpvcsC9L6Q0h5kVqMreAfRRRIj6lFfMjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yo3vFo1nPfpegSt1WBKp657i+aDV+IuazMAR81yNUt84Faaw5c4I0Gl6COJCrOK7T+76NgzjCydvVCVZtz3N1mjWoLVQ6SmOqOwMc3yCkUHeT31L4nS1UeoTGWRIiHwGc0jsOuVaMdx5CAiHWHdcbHZRWfhRHz+R2rUroYvUA58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=C7l26tzL; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-45300c82c1cso14546925e9.3
        for <linux-modules@vger.kernel.org>; Mon, 16 Jun 2025 06:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750082146; x=1750686946; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0CEry3X85ozS8Z1Uce4c2f0+5kW2c09B3vCuZTGfDKo=;
        b=C7l26tzLFY5+QVD/YWv8OeByVcL/rij7VKbuSG6HHVkkbJ1bgwW5Nk04x5Jnve+EVW
         BTcOJmg4xdlR2l4xpETxks0jzLyCqQ9jY/ev4NPYmd7KKzrKMli/BOE3Al59hc5dKb/f
         0lvV3GkWo1mwKswDscEXSZLhcz4tLp4ZrkPKnQSYJb0vbpoPmbqaeIdF320MJIxpbKPK
         3cxNkaoHKULtAfkhnuOPLuo0bk+KZNdq+rsg52rLEtwqljPzCVyEVVxcsgF46h4f537m
         xCutLZ8fDE+wPP4MK8StfmGU7hT31haYfeos3jTXXs3Q16Y9ai15FFkQa+sUAi0I1ab/
         gj7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750082146; x=1750686946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0CEry3X85ozS8Z1Uce4c2f0+5kW2c09B3vCuZTGfDKo=;
        b=sVy+EQrKKPAYt2bAfVfxItWUqWfLdj/VrVZUhTbOTs7rD9G3sHv5edmc1rKoa462u1
         mDWluDy4pN+W3xuofoYcVBXIwrEGK8Qyc8yuRcoh7t3SobGZ+1UilDd8SPkpxIK/ldFY
         ee3Ckbnaj4y1BTt5mK31PoVSemKmtbAkUGBFMKZZEgtdBMi8rR476Qq3EdLnhuKJTJzj
         2SN/lZN4my2CfMXt6/5vU7VDMN6ewI680v5Obbtbg1y8HPnQJpMJ5OtJ8kWG/LArreR9
         DbL328RRsyZqeqKyFh479Hkq5mukwy5/EWWuNH3G37qObyO+kKInbI2g+uyl6Qun+Q6D
         cIKg==
X-Forwarded-Encrypted: i=1; AJvYcCWyPHX2hJgssLDn7Gib7XzLlxxOmWakGX0FdmLLkBXnt9/Hx9OtzmZmSpG3y+i4icVSyx2eKKmcDu0Z/aj6@vger.kernel.org
X-Gm-Message-State: AOJu0YwmLtqpxehOWOWMqf6pWZlzpTCTGrcIxteGPdHfSzVJnb1roTwu
	239nJShYlaUFqu2J/SUGyLEIDsgTnNWDMleEJ8ZKvXgahduGWXIFRbZp4tGF0sTcd0Q=
X-Gm-Gg: ASbGncswNUFCJhWAE4xJgR7CN7vI7+MxGkQvFUf/VIz0FyMF77JhigL6cKshkYu96T6
	HIOmslRGp0h55US8V0w11spb0s91+AdHquINLPQ3t2U5yRCYRqZR6E1roV+hyy//nRWEAMNuDCA
	GrdBElU+GohSAwK0vJy69q/ldSMAKAuZpkQIQRvbTxU/igB5is7f7tJbOfgDxqvnmLkzX6otWiA
	HFVrB96HB4Fr0QNXBd4n3+fa+BJMMuzw2ikGCnNr5740Nq8CVMF8/iSeCS/uAZtOZWvF6jn9zRd
	64Z9bXvzpggAbsKKwajVies8OXKak3xhPPwh2ZEnmDESs0feVNGBLTUFuWUvKY7mXQ==
X-Google-Smtp-Source: AGHT+IE7aNvrL801nce5K/gCd4B0EbDVYCJl9pyUvZAsnQZSq9qyx+zKtCFrtCQyL2xM4CQ5A+4QYA==
X-Received: by 2002:a05:600c:3587:b0:43d:4e9:27ff with SMTP id 5b1f17b1804b1-4533cacf27fmr81249365e9.7.1750082146044;
        Mon, 16 Jun 2025 06:55:46 -0700 (PDT)
Received: from [10.100.51.209] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b19b32sm11311798f8f.67.2025.06.16.06.55.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 06:55:45 -0700 (PDT)
Message-ID: <e12739f9-bb54-4e9d-b70c-f4b5f99a7920@suse.com>
Date: Mon, 16 Jun 2025 15:55:45 +0200
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] audit,module: restore audit logging in load failure
 case
To: Richard Guy Briggs <rgb@redhat.com>
Cc: Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@parisplace.org>,
 Steve Grubb <sgrubb@redhat.com>,
 Linux-Audit Mailing List <linux-audit@lists.linux-audit.osci.io>,
 LKML <linux-kernel@vger.kernel.org>, linux-modules@vger.kernel.org,
 Linux Kernel Audit Mailing List <audit@vger.kernel.org>
References: <9b7b21e5f37f5718fe9176a36ebf670bbdfdd54a.1748462545.git.rgb@redhat.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <9b7b21e5f37f5718fe9176a36ebf670bbdfdd54a.1748462545.git.rgb@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/13/25 9:58 PM, Richard Guy Briggs wrote:
> The move of the module sanity check to earlier skipped the audit logging
> call in the case of failure and to a place where the previously used
> context is unavailable.
> 
> Add an audit logging call for the module loading failure case and get
> the module name when possible.
> 
> Link: https://issues.redhat.com/browse/RHEL-52839
> Fixes: 02da2cbab452 ("module: move check_modinfo() early to early_mod_check()")
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>

Looks ok to me from the modules perspective.

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr

