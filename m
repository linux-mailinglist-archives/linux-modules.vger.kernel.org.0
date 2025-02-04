Return-Path: <linux-modules+bounces-3149-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D27A26B50
	for <lists+linux-modules@lfdr.de>; Tue,  4 Feb 2025 06:23:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 085B1167CBA
	for <lists+linux-modules@lfdr.de>; Tue,  4 Feb 2025 05:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF451AA786;
	Tue,  4 Feb 2025 05:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="rEuu0EIK"
X-Original-To: linux-modules@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A882D25A624;
	Tue,  4 Feb 2025 05:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738646592; cv=none; b=Hk8KXcyQyS67VSvYxf1IhzeWqTP/p0TRElJa1GW4MtG6O+SzI48AMwe9XO9wdG0ygoCy2MY29ZD4qS7mobdttXTb1+0ZuPoDHTkDZiFm7Z35LiHv87KXobdhCwsBNN+uoScRXUSWgG7L8N40nufCbb7rxPyjvrCc28Tu43NR+UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738646592; c=relaxed/simple;
	bh=X/yzi+coHV5/cYGjlPHg/pxvlu5jrjizMTaLYXFk6B4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I/JXNAUx1hUMw77ePwJvSpn2mSS96rEzJC0HITKxVhX8rCwsPwQH7bZDe/Qbm+U6Q9hnTKDO8RtP1v77rdflnbi5+EyDowXzj79GpnH5caw27JJlPO1Lt6h+0sFVsAPOEhcOu8L/FWIYX23OStYeVVhsdBa5vsvvBnL1jN46Exg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=rEuu0EIK; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from thinkpad-p16sg1.corp.microsoft.com (unknown [20.236.11.42])
	by linux.microsoft.com (Postfix) with ESMTPSA id 0604C20BCAF2;
	Mon,  3 Feb 2025 21:23:09 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0604C20BCAF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1738646590;
	bh=eyFQv13S+2rnfEacnpOtHZaX3OWrYu4+GpTGgoO/GtI=;
	h=From:To:Cc:Subject:Date:From;
	b=rEuu0EIKr41pqalTWx1KhKi02pSP0XVVXbQ4zGtI/aumWZ7p+0nEDn1nGdVO2tmI2
	 jVIo1nVaHdQZV2zFKh9OceO+GrbUQwo9qEfomyd1IUubI/flLnlkmPT/4uhegRvrmd
	 YqmTbV5o8ep94ebYzdPmPa75lD3oEbCViPBb1yII=
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org
Cc: code@tyhicks.com,
	linux@rasmusvillemoes.dk,
	mcgrof@kernel.org,
	frkaya@linux.microsoft.com,
	vijayb@linux.microsoft.com,
	petr.pavlu@suse.com,
	linux@weissschuh.net,
	samitolvanen@google.com,
	da.gomez@samsung.com,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Subject: [v1 0/3]  Properly handle module_kboject creation
Date: Mon,  3 Feb 2025 21:22:19 -0800
Message-Id: <20250204052222.1611510-1-shyamsaini@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Everyone,

This patch series fixes handling of module_kboject creation.
A driver expect module_kset list populated with its corresponding
module_kboject to create its /sys/module/<built-in-module>/drivers
directory.

Since,
[1] commit 96a1a2412acb ("kernel/params.c: defer most of param_sysfs_init() to late_initcall time")
Call to populate module_kset list is deffered to save init time so that
external watchdog doesn't fireup on some boards and Linux can take
responsibility of feeding watchdog before it spuriously resets the
system. However, [1] this fix caused another issue i.e, consumers
of module_kset can't get related module_kboject during driver
initialisation and hence can't create their
/sys/module/<built-in-module>/drivers directory.

Consequently, [1] breaks user-space applications for eg: DPDK, which
expects /sys/module/vfio_pci/drivers/pci:vfio-pci/new_id to be present.

The second issue was reported and the [2] revert of [1] was
proposed. However, [2] the Revert doesn't address original issue
reported in [1].

This patch series addresses both issues reported in [1] and [2].

Changes since initial RFC(Based on Rasmus's suggestions):
Patch 1: Renames locate_module_kobject() to lookup_or_create_module_kobject(),
         to accurately describe its operations.
Patch 2: Moves lookup_or_create_module_kobject() and to_module* macros to
         module.h, so that driver code can use these.
Patch 3: Handles module_kboject creation and population of module_kset list
         to fix [1] and [2] issues.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=96a1a2412acb
[2] https://lore.kernel.org/lkml/20250130225803.321004-1-shyamsaini@linux.microsoft.com/

Thanks,
Shyam

Shyam Saini (3):
  kernel: param: rename locate_module_kobject
  include: move lookup_or_create_module_kobject()/to_module* to module.h
  drivers: base: handle module_kboject creation

 drivers/base/module.c  | 13 +++++--------
 include/linux/module.h | 39 +++++++++++++++++++++++++++++++++++++
 kernel/params.c        | 44 ++----------------------------------------
 3 files changed, 46 insertions(+), 50 deletions(-)

-- 
2.34.1


