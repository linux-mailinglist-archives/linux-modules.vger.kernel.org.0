Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 832821819D9
	for <lists+linux-modules@lfdr.de>; Wed, 11 Mar 2020 14:32:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729473AbgCKNcn (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Wed, 11 Mar 2020 09:32:43 -0400
Received: from forward104o.mail.yandex.net ([37.140.190.179]:58944 "EHLO
        forward104o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729103AbgCKNcn (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Wed, 11 Mar 2020 09:32:43 -0400
X-Greylist: delayed 316 seconds by postgrey-1.27 at vger.kernel.org; Wed, 11 Mar 2020 09:32:42 EDT
Received: from forward102q.mail.yandex.net (forward102q.mail.yandex.net [IPv6:2a02:6b8:c0e:1ba:0:640:516:4e7d])
        by forward104o.mail.yandex.net (Yandex) with ESMTP id AF842942746
        for <linux-modules@vger.kernel.org>; Wed, 11 Mar 2020 16:27:24 +0300 (MSK)
Received: from mxback11q.mail.yandex.net (mxback11q.mail.yandex.net [IPv6:2a02:6b8:c0e:1b4:0:640:1f0c:10f2])
        by forward102q.mail.yandex.net (Yandex) with ESMTP id AD54A7F20017
        for <linux-modules@vger.kernel.org>; Wed, 11 Mar 2020 16:27:24 +0300 (MSK)
Received: from vla3-4c649d03f525.qloud-c.yandex.net (vla3-4c649d03f525.qloud-c.yandex.net [2a02:6b8:c15:2584:0:640:4c64:9d03])
        by mxback11q.mail.yandex.net (mxback/Yandex) with ESMTP id vUfi5c9vma-ROuOSnKr;
        Wed, 11 Mar 2020 16:27:24 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1583933244;
        bh=OnC5gkfnNHmbaJGQL+16nLCkCD6lJxB+odMo09D/PMQ=;
        h=Subject:From:To:Date:Message-ID;
        b=UWrTv3rTHdldWXDlQpqEbZNyFS0v+VPhKNvhgxYRR09XoXYBJdwn1I7oSVGNH4NJf
         GjLgCIKHc3CEEhwzLIkbpipGtAHcXA7rK8XW0UV88TGLFCr/08gm5hfW3JMarCD7ak
         zDWVhRTCiYMun4hBHE1lITDT/1aXGqTMSmvS06/0=
Authentication-Results: mxback11q.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by vla3-4c649d03f525.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id j0v4yJA8Al-RObmarmR;
        Wed, 11 Mar 2020 16:27:24 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
To:     linux-modules@vger.kernel.org
From:   Konstantin Kharlamov <hi-angel@yandex.ru>
Subject: [RFE] Who's using a module?
Message-ID: <b623f4a2-8b9b-edd9-3546-281155d90d4a@yandex.ru>
Date:   Wed, 11 Mar 2020 16:27:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB-large
Content-Transfer-Encoding: 8bit
Sender: owner-linux-modules@vger.kernel.org
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

Once in a while there's a need to remove a module (for example because you rebuilt it, or to reload it with different parameters, or whatever…). And then doing `rmmod modulename` and `modprobe -r modulename` gives:

	rmmod: ERROR: Module modulename is in use

If you're lucky, firing up `lsmod | grep modulename` will get you offenders inside "used by" column. But often there's nothing except the count above zero. It is very easy to reproduce if you check `lsmod` output for your graphics driver. I checked it on `i915` and `amdgpu`: when graphics session is opened you can't remove it and `lsmod` doesn't show who's using it.

There's very popular and old question on SO¹ that at the moment has over 55k views, and the only answer that seem to work for people is insanely big and convoluted; it is using a custom kernel driver and kernel tracing capabilities. I guess this amount of research means: no, currently there's no easy way to get who's using a module.

It would be amazing if kernel has capability to figure out who's using a module.

1: https://stackoverflow.com/questions/448999/is-there-a-way-to-figure-out-what-is-using-a-linux-kernel-module

P.S.: please, add me to CC when replying, I'm not subscribed to the list.
