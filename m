Return-Path: <linux-modules+bounces-1590-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A667E939CB0
	for <lists+linux-modules@lfdr.de>; Tue, 23 Jul 2024 10:33:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 566381F22701
	for <lists+linux-modules@lfdr.de>; Tue, 23 Jul 2024 08:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B12014C5B5;
	Tue, 23 Jul 2024 08:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qCSTaiPG"
X-Original-To: linux-modules@vger.kernel.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7499414B94C
	for <linux-modules@vger.kernel.org>; Tue, 23 Jul 2024 08:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721723574; cv=none; b=LHvqm+0p8fgw6nrZUaTcI4fwLlQUvE1/mK360nAgBL1pIZBVdS0InU9HCKQclSIu2842PcUA87tYozbS2ZryEzUhvNDOCSUiusesB5fur87CWhm8Z65BcrQNFa2T5PwmzwyeEP8r0oko/2hvLm4WOdAvfTcgv8CaLc7OG3P5XXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721723574; c=relaxed/simple;
	bh=T2ln2v55uns+llIQM4U17fqCNMBXKDJLn87nozV/4b0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=exIMciwOQTdnipr5KnPk0766053+QNt+4zTOxL6UtpqLYNpQe7Nh/3Z5VZGLTHIzj0qPlupGl6QJ5yTOjGhAwN0uvsefr3VaabnwYFcq5kdJ1+7HTqQEZzUuhehLRAlqJqUYZbE/PLywyPyauyCNWQ4UQrTZvk7RfGjMasEsQww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qCSTaiPG; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: arnd@arndb.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1721723569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XEWUV4v7u+8zDSLwsokAOxmgvkvK5NCQfI7UWQX3ezY=;
	b=qCSTaiPGYAibGkdZEU+4+DySxYSc6vM6QXszKhbvEh5FkXBkc2A2b86cHsugVAALnS3utO
	wptLiOYtmzG2BDocz7A073mRfyWenfw9V2KK6c3rtcliew6QgINJ1CsRcnUpGOkJv6a+iM
	4fYxMowegjFFk2jQzoZcr8wdA2geKP8=
X-Envelope-To: mcgrof@kernel.org
X-Envelope-To: clm@fb.com
X-Envelope-To: josef@toxicpanda.com
X-Envelope-To: dsterba@suse.com
X-Envelope-To: tytso@mit.edu
X-Envelope-To: adilger.kernel@dilger.ca
X-Envelope-To: jaegeuk@kernel.org
X-Envelope-To: chao@kernel.org
X-Envelope-To: hch@infradead.org
X-Envelope-To: linux-arch@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-modules@vger.kernel.org
X-Envelope-To: linux-btrfs@vger.kernel.org
X-Envelope-To: linux-ext4@vger.kernel.org
X-Envelope-To: linux-f2fs-devel@lists.sourceforge.net
X-Envelope-To: youling.tang@linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Youling Tang <youling.tang@linux.dev>
To: Arnd Bergmann <arnd@arndb.de>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Chris Mason <clm@fb.com>,
	Josef Bacik <josef@toxicpanda.com>,
	David Sterba <dsterba@suse.com>,
	tytso@mit.edu,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Christoph Hellwig <hch@infradead.org>
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	youling.tang@linux.dev
Subject: [PATCH 0/4] Add module_subinit{_noexit} and module_subeixt helper macros
Date: Tue, 23 Jul 2024 16:32:35 +0800
Message-Id: <20240723083239.41533-1-youling.tang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This series provides the module_subinit{_noexit} and module_subeixt helper 
macros and applies to btrfs, ext4 and f2fs.

See link [1] for the previous discussion process.

[1]: https://lore.kernel.org/all/20240711074859.366088-1-youling.tang@linux.dev/

Youling Tang (4):
  module: Add module_subinit{_noexit} and module_subeixt helper macros
  btrfs: Use module_subinit{_noexit} and module_subeixt helper macros
  ext4: Use module_{subinit, subexit} helper macros
  f2fs: Use module_{subinit, subeixt} helper macros

 fs/btrfs/super.c                  | 123 +++++---------------------
 fs/ext4/super.c                   | 115 +++++++-----------------
 fs/f2fs/debug.c                   |   3 +-
 fs/f2fs/f2fs.h                    |   4 +-
 fs/f2fs/super.c                   | 139 +++++++-----------------------
 include/asm-generic/vmlinux.lds.h |   5 ++
 include/linux/init.h              |  62 ++++++++++++-
 include/linux/module.h            |  22 +++++
 8 files changed, 180 insertions(+), 293 deletions(-)

-- 
2.34.1


