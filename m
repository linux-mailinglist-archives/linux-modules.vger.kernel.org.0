Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B3906AC34D
	for <lists+linux-modules@lfdr.de>; Mon,  6 Mar 2023 15:32:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbjCFOcO (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Mon, 6 Mar 2023 09:32:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230194AbjCFOcC (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Mon, 6 Mar 2023 09:32:02 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC09230B34
        for <linux-modules@vger.kernel.org>; Mon,  6 Mar 2023 06:31:33 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id da10so39418735edb.3
        for <linux-modules@vger.kernel.org>; Mon, 06 Mar 2023 06:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678113019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e7renzVF3Du2PZ3KQ3/Pr4i3lBiVisATDCE3vcFtxWY=;
        b=qhtT+WlOU8If0FHi1LbEzOfuBEB1K4/mB3NMftJ/EI89ZYQaF0LUWwXgduMW+ApHEJ
         intQvrKiW4wYwrhsXDrQP24ZlGCCqNxbJ3e/xg21136tbVAh2nlQXWWgCiiIIPUcbRxA
         +AF01zAZ+Gv61SWhScpPYYGyRHj+ufi5zFGsv31WrzoiZEoHNB5A1nLDk3bnIunKL/h1
         pQBrO9EdqZD6Eu24TVMzonCowGOIvntm7nuu9KJ4pnhqJy42nbgMYlAAD/v0Zsrozi8z
         y3xiJGLMnzfc7orAzoKcu5rgzaZjusbBu+lW6SXhQyAgL1bwM3BgiUFxNCqZFBjo3YMG
         ocJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678113019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e7renzVF3Du2PZ3KQ3/Pr4i3lBiVisATDCE3vcFtxWY=;
        b=oda0JezLOdsiFQnPhKPd7Eb4L75NLwUNbA7EXSHBXK/nXbNDZE4bSlvD6GzaE3LKNQ
         ks3yVSdHerwGORD0MxpICVU6PMnDw7v2BuNq9mMVVmv8iJzlGV67Tr5YtzF55HSPC5sd
         EzxPRINvutjPhJyn8KXm6CwWdPLkAmKLp2eUJ+sdR/Fm8IqkVpJiSBgwCnr/ZlVD7Snk
         WOy79UIPEOU7hmcKlMYs3vmk13oiWmHNCBJR1yVYtMJzOAZeONKLVdbfrXyWE8CIoojs
         vKG3ZcXTMckUgc0I9/CV//ekgKcwUER9ujw5NbnanjxUC8NUu7E1CROiHEAHL6j5FnrL
         3pYA==
X-Gm-Message-State: AO0yUKWtU2i0ZUtQrgmlG2twpLzHymd6+iQT94z/uStT5JWWuvVw6zLX
        hTrrTK6I4h5MjcUGbT/jiwtApA==
X-Google-Smtp-Source: AK7set+IzGi0bFpAuzz685sYQ4n5ukaNPjStMmpLNnpegW7yNnsIlGR6WuRZIYdEFeCBArrEYXYu5w==
X-Received: by 2002:a17:906:3b4b:b0:85d:dd20:60a4 with SMTP id h11-20020a1709063b4b00b0085ddd2060a4mr10211759ejf.40.1678113019366;
        Mon, 06 Mar 2023 06:30:19 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:c1e7:5006:98ac:f57? ([2a02:810d:15c0:828:c1e7:5006:98ac:f57])
        by smtp.gmail.com with ESMTPSA id d8-20020a170906040800b008bda61ff999sm4658905eja.130.2023.03.06.06.30.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 06:30:19 -0800 (PST)
Message-ID: <c6f39365-e840-d782-8ec0-e34ec3681b98@linaro.org>
Date:   Mon, 6 Mar 2023 15:30:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 15/27] memory: tegra: remove MODULE_LICENSE in non-modules
To:     Nick Alcock <nick.alcock@oracle.com>, mcgrof@kernel.org
Cc:     linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
References: <20230224150811.80316-1-nick.alcock@oracle.com>
 <20230224150811.80316-16-nick.alcock@oracle.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230224150811.80316-16-nick.alcock@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

On 24/02/2023 16:07, Nick Alcock wrote:
> Since commit 8b41fc4454e ("kbuild: create modules.builtin without
> Makefile.modbuiltin or tristate.conf"), MODULE_LICENSE declarations
> are used to identify modules. As a consequence, uses of the macro
> in non-modules will cause modprobe to misidentify their containing
> object file as a module when it is not (false positives), and modprobe
> might succeed rather than failing with a suitable error message.
> 
> So remove it in the files in this commit, none of which can be built as
> modules.
> 

Applied as well. Squashed with next one. Same subject messes with b4, so
prefix should be corrected if these were to stay as separate patches.

Best regards,
Krzysztof

