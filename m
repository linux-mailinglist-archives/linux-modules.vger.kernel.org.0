Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF46F5283
	for <lists+linux-modules@lfdr.de>; Fri,  8 Nov 2019 18:26:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727468AbfKHRZj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-modules@lfdr.de>); Fri, 8 Nov 2019 12:25:39 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37268 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727296AbfKHRZj (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Fri, 8 Nov 2019 12:25:39 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-POHm9sZoOWCrx95EmceUZw-1; Fri, 08 Nov 2019 12:25:37 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68AFA1005500;
        Fri,  8 Nov 2019 17:25:36 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.43.2.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BD1191001DC2;
        Fri,  8 Nov 2019 17:25:35 +0000 (UTC)
From:   Alexey Gladkov <gladkov.alexey@gmail.com>
To:     linux-modules@vger.kernel.org
Cc:     Lucas De Marchi <lucas.de.marchi@gmail.com>
Subject: [PATCH v2 0/4] Add modules.builtin.modinfo support
Date:   Fri,  8 Nov 2019 18:25:19 +0100
Message-Id: <20191108172524.468494-1-gladkov.alexey@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: POHm9sZoOWCrx95EmceUZw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
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

v2:

* Don't use kmod_file() to parse modules.builtin.modinfo. Instead, parser reads
the file into the buffer by chunks, which reduces the amount of memory.

Alexey Gladkov (4):
  libkmod: Add parser for modules.builtin.modinfo
  libkmod: Add function to get list of built-in modules
  Lookup aliases in the modules.builtin.modinfo
  modinfo: Show information about built-in modules

 Makefile.am                |   1 +
 libkmod/libkmod-builtin.c  | 329 +++++++++++++++++++++++++++++++++++++
 libkmod/libkmod-internal.h |  10 ++
 libkmod/libkmod-module.c   |  73 +++++++-
 libkmod/libkmod.c          |  25 +++
 libkmod/libkmod.h          |   1 +
 tools/depmod.c             |  63 +++++++
 tools/modinfo.c            |  39 +++--
 8 files changed, 514 insertions(+), 27 deletions(-)
 create mode 100644 libkmod/libkmod-builtin.c

-- 
2.21.0

