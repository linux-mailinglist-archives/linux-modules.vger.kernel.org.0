Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0313845C7D4
	for <lists+linux-modules@lfdr.de>; Wed, 24 Nov 2021 15:43:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350357AbhKXOqJ (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Wed, 24 Nov 2021 09:46:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347990AbhKXOqE (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Wed, 24 Nov 2021 09:46:04 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EBB6C06175A
        for <linux-modules@vger.kernel.org>; Wed, 24 Nov 2021 06:17:41 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id b1so7556062lfs.13
        for <linux-modules@vger.kernel.org>; Wed, 24 Nov 2021 06:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=EtGF4mpY0b2OjlWH8u+f+Rwsq9cIe285UPnj5aIh5kI7/W0UlqTfU6NtM+6U3oUPbL
         zSWjrDsv2oJY8tRuIMgaPk1glK2cTAznvk3ZRf8z+Wkdnb9K9GiZxXpCe+rwMXTZbFUw
         Ee3du/iabjgyATi5Bt7/OE4pChcAPEM+PU82ZLCC6XwfK/pkRMoZ+qPBg4acuLwY0iR4
         ppcKRVtz6HhAGvlo1z83iH9je6sUnt5r2ZlkMbCc6i14OZTMlSxOdbMn/Ab1zvwjzoYV
         CLP3ydCqkABkqq3qmm+3NLKE7Vl+S3z3LcMW7Mon889S0tjXjgJQOsfefAghAbzp148s
         HnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=tZu/sp2NjxuNVXP+VrHKi+uELjnRyxTe5ZcS9YJ5HtSTsOqe7imWZPxd7Q8uNmQ23K
         rVr4T5ntzNRg53xyYaX1JZLQXXswGM/25ye5zsgYD8nYomX208LENjNPR8yysEi/qzwO
         /src9EVnEpJzLG83ZiQzgEGRaaBgHgFU3Zuwi8yGI0vMBugIZr46yaoIs2wlnbM1VThh
         DKn52A+U2q/TUpDe5HzAE9GSljTRqQ5nSf2AZiwI/fa1M/GIWcw0+QCYvHXxFm42nWCA
         V8spfGhsNtmlxmcG+xS7pzjPNfjMagMA6EIS4ZNMcgDPIwlW0QdAtPQ/a58xTI44Tbtx
         SKmA==
X-Gm-Message-State: AOAM5309FMoBvrX7WDLJ4N1xZZc1yQ/zsk6SZ/YU5QUbOq1JJKUWsmbf
        +7CI5cwr3s9Y9zVDZjaw/EU8EsTDoAN7VFhU9G/PSfWew6d0v55r
X-Google-Smtp-Source: ABdhPJx6XKOYfrsd41IJZoihe0haQV7sdeTLYclap3VzINGUHZ3NJwzOAYAwIwNHDDSgjUJtqLLszQEZ03cgj80P9Xc=
X-Received: by 2002:ac2:50cd:: with SMTP id h13mr14365942lfm.381.1637761749418;
 Wed, 24 Nov 2021 05:49:09 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6512:3fc:0:0:0:0 with HTTP; Wed, 24 Nov 2021 05:49:09
 -0800 (PST)
From:   Usman Umar <usmanumar339@gmail.com>
Date:   Wed, 24 Nov 2021 05:49:09 -0800
Message-ID: <CAJHaCci2PdibhWyzAKUqyrLSDpG2Q_XmiGPM-gknvYrY-V1qWg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>


