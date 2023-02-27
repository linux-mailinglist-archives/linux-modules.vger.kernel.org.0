Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED146A4EB6
	for <lists+linux-modules@lfdr.de>; Mon, 27 Feb 2023 23:37:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbjB0Whk (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Mon, 27 Feb 2023 17:37:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230407AbjB0WhD (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Mon, 27 Feb 2023 17:37:03 -0500
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BA26CA0D
        for <linux-modules@vger.kernel.org>; Mon, 27 Feb 2023 14:33:04 -0800 (PST)
Received: by mail-il1-x12e.google.com with SMTP id y14so3148560ilv.4
        for <linux-modules@vger.kernel.org>; Mon, 27 Feb 2023 14:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1677537172;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T3Cu6m8epvNA3UH0d8Dsxgstk0bjTjSw6TnY3URCJJo=;
        b=AL/xWpTQxYIWU2CQdF9m3fgKqRfcbDNwa9X3KuJd+7vuCknxuhMILoHf8Qyoz6hxSP
         93dAcrC0+I68Uh7ASzQCB4hqpQegSYXghxbM0ulujSZPY9tnaqq3qHJuTo5xVT9PKEzc
         DCpulpc4GycrvelfquQkgO7NaudZ+MniqwvQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677537172;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T3Cu6m8epvNA3UH0d8Dsxgstk0bjTjSw6TnY3URCJJo=;
        b=Wl7J6dY0v2xuO8Gna9YCsMI4yMhHkaNNukcPb5yaY1P1Uj9ZT/eMnj6eaQnpgdlFwe
         p2vCSmJ8jZQGmZXwFO54w0S2DvPpcaD+NBV2qYTO++uIrOkEAnMyqsjMqrohdIdxGxV1
         W/KXx8Zi25PBT4YI2oXgnkDWtVTi8kOwtUZcgq0UEAipNM3IYG2aoarMLEOvtmqC9tZZ
         KFheEm7lOlId+XVHs2Dvo+lnO1GOzQtU4FcI0fJoFtL1PjAJ22Vwl6v4KD9mlbcG6XLl
         J5dLiDVF0OauM1HjrvM8cTICZKEzZ1mvWR2cxpsVtnuXaNKmUc/KG3RO+fSTZOTICWvV
         OA6Q==
X-Gm-Message-State: AO0yUKU+qXR2F+grfl7p4r2fBy6T26UF62/2vrvuINgfxCqNZqI5E4VE
        Bn80/0MQMuuomWuoYzQOs0QyYw==
X-Google-Smtp-Source: AK7set8U1d+59mHvSc7yWPEluziqNi1JNCxZke/Kq4W9ZnHwWbidQmuEkdyZ3SQBsry4cHKjKFfPvw==
X-Received: by 2002:a05:6e02:1a8d:b0:317:1ca3:f518 with SMTP id k13-20020a056e021a8d00b003171ca3f518mr965058ilv.0.1677537171811;
        Mon, 27 Feb 2023 14:32:51 -0800 (PST)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id v15-20020a92c80f000000b003158ac24ccfsm2259873iln.38.2023.02.27.14.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 14:32:51 -0800 (PST)
Message-ID: <b094dc23-a96d-93c4-a350-8fb92476f431@linuxfoundation.org>
Date:   Mon, 27 Feb 2023 15:32:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] selftests/kmod: increase the kmod timeout from 45 to
 165
Content-Language: en-US
To:     Luis Chamberlain <mcgrof@kernel.org>, shuah@kernel.org,
        linux-kselftest@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, tiwai@suse.de, tianfei.zhang@intel.com,
        russell.h.weight@intel.com, keescook@chromium.org,
        tweek@google.com, a.manzanares@samsung.com, dave@stgolabs.net,
        linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20230206234344.2433950-1-mcgrof@kernel.org>
 <20230206234344.2433950-2-mcgrof@kernel.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20230206234344.2433950-2-mcgrof@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

On 2/6/23 16:43, Luis Chamberlain wrote:
> The default sefltests timeout is 45 seconds. If you run the kmod
> selftests on your own with say:
> 
> ./tools/testings/selftests/kmod.sh
> 
> Then the default timeout won't be in effect.
> 
> I've never ran kmod selftests using the generic make wrapper
> (./tools/testing/selftests/run_kselftest.sh -s) util now
> that I have support for it on kdevops [0]. And with that the
> test is limitted to the default timeout which we quickly run
> into. Bump this up to what I see is required on 8GiB / 8 vcpu
> libvirt q35 guest as can be easily created now with kdevops.
> 
> To run selftests with kdevops:
> 
> make menuconfig # enable dedicated selftests and kmod test
> make
> make bringup
> make linux
> make selftests-kmod
> 
> This ends up taking about 280 seconds now, give or take add
> 50 seconds more more and we end up with 350. Document the
> rationale.
> 
> [0] https://github.com/linux-kdevops/kdevops
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> ---
>   tools/testing/selftests/kmod/settings | 4 ++++
>   1 file changed, 4 insertions(+)
>   create mode 100644 tools/testing/selftests/kmod/settings
> 
> diff --git a/tools/testing/selftests/kmod/settings b/tools/testing/selftests/kmod/settings
> new file mode 100644
> index 000000000000..6fca0f1a4594
> --- /dev/null
> +++ b/tools/testing/selftests/kmod/settings
> @@ -0,0 +1,4 @@
> +# measured from a manual run:
> +# time ./tools/testing/selftests/kmod/kmod.sh
> +# Then add ~50 seconds more gracetime.
> +timeout=350

Adding timeouts like this for individual tests increases the overall kselftest
run-time. I am not in favor of adding timeouts.

We have to find a better way to do this.

thanks,
-- Shuah
