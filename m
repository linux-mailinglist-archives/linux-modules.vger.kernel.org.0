Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D8761BA39A
	for <lists+linux-modules@lfdr.de>; Mon, 27 Apr 2020 14:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbgD0MaY (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Mon, 27 Apr 2020 08:30:24 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28013 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726831AbgD0MaY (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Mon, 27 Apr 2020 08:30:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587990623;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=InAWjvLSkWXBvdwLwFZbUuaPrGSgIbIKeKiGCkwHwjY=;
        b=SMrwgtzY7LzEUwQEkK/4fP6MNkKG9OK7FUdIPeSs9RT31qhIHAaZeomu9Ro2kiU3jjf7za
        5Y7eZ6/6XX/RzVccWfajUSZGE3b7W/mtaNo071aQ3G+bQcYtTaF9i6zRRugkLj8psPDIQi
        rakWQcCTDi0pbUAqUhLU4WsJb/cXKYs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-5c54TiNYM1CH6Lnd9ZooUg-1; Mon, 27 Apr 2020 08:30:20 -0400
X-MC-Unique: 5c54TiNYM1CH6Lnd9ZooUg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B581107ACF2;
        Mon, 27 Apr 2020 12:30:19 +0000 (UTC)
Received: from astarta.redhat.com (ovpn-112-223.ams2.redhat.com [10.36.112.223])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 01AF327CDC;
        Mon, 27 Apr 2020 12:30:17 +0000 (UTC)
From:   Yauheni Kaliuta <yauheni.kaliuta@redhat.com>
To:     Lucas De Marchi <lucas.demarchi@intel.com>
Cc:     linux-modules <linux-modules@vger.kernel.org>
Subject: exit from log_printf()
Date:   Mon, 27 Apr 2020 15:30:11 +0300
Message-ID: <xuny7dy1glgs.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: owner-linux-modules@vger.kernel.org
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

Hi, Lucas!

I have a question about exit call from tools/log.c:log_printf()
(https://github.com/lucasdemarchi/kmod/blob/master/tools/log.c#L140)

What is the reasoning behind that?

At the first glance it looks a bit incorrect (pretty surprising
to have exit in print()).

Discovered while trying to remove several modules when one of
them cannod be removed:

$ modprobe -r libata pcspkr       
modprobe: FATAL: Module libata is in use.

$ lsmod | grep pcsp
pcspkr                 16384  0


-- 
WBR,
Yauheni Kaliuta

