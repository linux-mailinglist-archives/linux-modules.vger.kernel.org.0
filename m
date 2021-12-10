Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7DC470554
	for <lists+linux-modules@lfdr.de>; Fri, 10 Dec 2021 17:09:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238959AbhLJQNK (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Fri, 10 Dec 2021 11:13:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29885 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233193AbhLJQNK (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Fri, 10 Dec 2021 11:13:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639152574;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5dy6L2W5uCrFpdn9m5/x/KjiiOoQlVH+A7/e/EdtZS4=;
        b=B0hCbIs4wBIELwcFdw73/NUAjYLpgsH7m1CZIVymZqolDGvVC2E15oGi3v+Xe+bSjpIOq8
        hcCMwLo5I0SNayePxQWd6Y/UrgWIUfGroqyIyplrcdkAEg3WWofej18B0N5Qzy1GVC+ZiR
        AsYXwzpgE6HWjC/R80oekBeSa7fHVrc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-UN4B_gSTMUWscoiOFsoODw-1; Fri, 10 Dec 2021 11:09:33 -0500
X-MC-Unique: UN4B_gSTMUWscoiOFsoODw-1
Received: by mail-wr1-f70.google.com with SMTP id u4-20020a5d4684000000b0017c8c1de97dso2461206wrq.16
        for <linux-modules@vger.kernel.org>; Fri, 10 Dec 2021 08:09:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5dy6L2W5uCrFpdn9m5/x/KjiiOoQlVH+A7/e/EdtZS4=;
        b=rCvasdr2Aj/mtiuOjyaBSCSPXbbcWjlgrYsfUYJ1BZCPLpjxDnTjgz5yvXY4C+9iJb
         jimZ7SmIzYWhzg+nZVc10/BNHRZSkLE3V5UNLfgbC1hLtzF5W3Sdd6VNsxpyL9qhG2Zx
         v2ErUq4wXCgdRGA1dnDWGVjdeCC5NdgEW8vhHE1JinaALeJBoHWsxduqb/b/5Mbx04CC
         x8FADbN02bN25yuwqCuerbhlXDfLbqt1ptcx3LtMw1Ba90D4dR3y556Q6bnHfBnBbVd1
         DnH7iELEqn1dXVbabpt8zSUaaot+X5WJdhzKF2Nq8Jm69UEqhbhHU3LgYPZGN5Urv/+q
         Mriw==
X-Gm-Message-State: AOAM533qLDnG0mzuAloKcE2EV+eS7vp/WZEu52sOC8IIiKZhYWO4RpeV
        4HQP/ZSaxWhuYm29enikeDfwxQqUh3hEESDxf1XfGdekhjUoMeu4l612iy3q13n7jkPI918Fy5s
        TgLGJvCpOtaOvB0xM6AKuN2/d
X-Received: by 2002:adf:f542:: with SMTP id j2mr14699072wrp.616.1639152572444;
        Fri, 10 Dec 2021 08:09:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytDlkzGiMTuQZ0hcr6c8r/sMsaeYdtukaDdfk5e0Dk6BgLMiCq6Vjvdxlbn+1hz9VQGP9inw==
X-Received: by 2002:adf:f542:: with SMTP id j2mr14699050wrp.616.1639152572274;
        Fri, 10 Dec 2021 08:09:32 -0800 (PST)
Received: from localhost (cpc111743-lutn13-2-0-cust979.9-3.cable.virginm.net. [82.17.115.212])
        by smtp.gmail.com with ESMTPSA id h17sm2820462wrp.34.2021.12.10.08.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 08:09:31 -0800 (PST)
Date:   Fri, 10 Dec 2021 16:09:31 +0000
From:   Aaron Tomlin <atomlin@redhat.com>
To:     Petr Mladek <pmladek@suse.com>
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        Christoph Lameter <cl@linux.com>,
        Miroslav Benes <mbenes@suse.cz>,
        Andrew Morton <akpm@linux-foundation.org>, jeyu@kernel.org,
        linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
        atomlin@atomlin.com, ghalat@redhat.com
Subject: Re: [RFC PATCH] module: Introduce module unload taint tracking
Message-ID: <20211210160931.ftvxpulno73a2l7c@ava.usersys.com>
X-PGP-Key: http://pgp.mit.edu/pks/lookup?search=atomlin%40redhat.com
X-PGP-Fingerprint: 7906 84EB FA8A 9638 8D1E  6E9B E2DE 9658 19CC 77D6
References: <20211124173327.3878177-1-atomlin@redhat.com>
 <YbEZ4HgSYQEPuRmS@bombadil.infradead.org>
 <20211209153131.a54fdfbci4qnyy6h@ava.usersys.com>
 <YbKUUJUtjBk/n913@bombadil.infradead.org>
 <YbMlVFwBiRujKdEX@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YbMlVFwBiRujKdEX@alley>
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

On Fri 2021-12-10 11:00 +0100, Petr Mladek wrote:
> > If someone enables this feature I can't think of a reason why they
> > would want to limit this to some arbitrary number. So my preference
> > is to remove that limitation completely. I see no point to it.
> 
> I agree with Luis here. We could always add the limit later when
> people report some real life problems with too long list. It is
> always good to know that someone did some heavy lifting in
> the system.

Fair enough.

> It might be even interesting to remember timestamp of the removal
> to match it with another events reported in the system log.

I'm not so sure about this. We could gather such details already via Ftrace
(e.g. see load_module()). Personally, I'd prefer to maintain a simple list.

> > If you just bump the count then its not duplication, it just adds
> > more information that the same module name with the same taint flag
> > has been unloaded now more than once.
> 
> Please, do not remove records that a module was removed. IMHO, it
> might be useful to track all removed module, including the non-tainted
> ones. Module removal is always tricky and not much tested. The tain
> flags might be just shown as extra information in the output.

This is an interesting suggestion. Albeit, as per the subject, I prefer to
just keep track of any module that tainted the kernel. That being said,
Petr, if you'd prefer to track each module unload/or deletion event, then I
would suggest for instance to remove a module once it has been reintroduced
or maintain an unload count as suggested by Luis.

Please let me know your thoughts.


Kind regards,

-- 
Aaron Tomlin

