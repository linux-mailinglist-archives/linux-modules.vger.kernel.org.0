Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1EA4D3ACF
	for <lists+linux-modules@lfdr.de>; Fri, 11 Oct 2019 10:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727414AbfJKIUH (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Fri, 11 Oct 2019 04:20:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51434 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727411AbfJKIUH (ORCPT <rfc822;linux-modules@vger.kernel.org>);
        Fri, 11 Oct 2019 04:20:07 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 04CF03D966;
        Fri, 11 Oct 2019 08:20:07 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.43.2.40])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 553B860625;
        Fri, 11 Oct 2019 08:20:06 +0000 (UTC)
From:   Alexey Gladkov <gladkov.alexey@gmail.com>
To:     linux-modules@vger.kernel.org
Cc:     Lucas De Marchi <lucas.de.marchi@gmail.com>
Subject: [PATCH v1 0/4] Add modules.builtin.modinfo support
Date:   Fri, 11 Oct 2019 10:19:52 +0200
Message-Id: <20191011081956.4127892-1-gladkov.alexey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Fri, 11 Oct 2019 08:20:07 +0000 (UTC)
Sender: owner-linux-modules@vger.kernel.org
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

The kernel since version v5.2-rc1 exports information about built-in
modules in the modules.builtin.modinfo. Now, kmod can show complete information
about the built-in modules as well as about external modules. Also kmod can
understand aliases of built-in modules.

Before:

$ modinfo block-major-9-1
modinfo: ERROR: Module block-major-9-1 not found.

After:

$ modinfo block-major-9-1
name:           md_mod
filename:       (builtin)
alias:          block-major-9-*
alias:          md
description:    MD RAID framework
license:        GPL
parm:           start_dirty_degraded:int
parm:           create_on_open:bool

Alexey Gladkov (4):
  libkmod: Add parser for modules.builtin.modinfo
  libkmod: Add function to get list of built-in modules
  Lookup aliases in the modules.builtin.modinfo
  modinfo: Show information about built-in modules

 Makefile.am                |   1 +
 libkmod/libkmod-builtin.c  | 231 +++++++++++++++++++++++++++++++++++++
 libkmod/libkmod-internal.h |  10 ++
 libkmod/libkmod-module.c   |  76 ++++++++++--
 libkmod/libkmod.c          |  25 ++++
 libkmod/libkmod.h          |   1 +
 tools/depmod.c             |  63 ++++++++++
 tools/modinfo.c            |  39 ++++---
 8 files changed, 419 insertions(+), 27 deletions(-)
 create mode 100644 libkmod/libkmod-builtin.c

-- 
2.21.0

