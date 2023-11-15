Return-Path: <linux-modules+bounces-178-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F637DE6B5
	for <lists+linux-modules@lfdr.de>; Wed,  1 Nov 2023 21:13:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC092281327
	for <lists+linux-modules@lfdr.de>; Wed,  1 Nov 2023 20:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1AF31B274;
	Wed,  1 Nov 2023 20:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AXVpfN3j"
X-Original-To: linux-modules@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF94414AAE
	for <linux-modules@vger.kernel.org>; Wed,  1 Nov 2023 20:13:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2786D11D;
	Wed,  1 Nov 2023 13:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=9GbIiVVmtxjeLQGfLovljVUMJ+L+zaLMrxPAsch8AJA=; b=AXVpfN3jrYeH9Mrr/XwXJGquAG
	vy/vZBAdO/ww8EX58LdE2uPSYEyjEMRLF3k81mSvrvYAyY6ejODqYbCC/uYhvbGVmLUx74gnmiyJm
	TMKft+OtD6Fb9EVoPv9A8mhQPMN+NDkrTEEGbA4qiOWlEw3PhqGhFOmiDOqE78+4ssukmZmESgFSt
	zMPzjEugUTcIRK7XwiSwyBFBsblvmgO8LkoUBM4/NVHhlUc0d4LZTu4uaTqO28zL8liQwFMPDh3ce
	fLHMk32dOTXJOUB2dn254fE24QMaRpqOGJj0Y7ygQuObKqqPD57uesqkTWr9F7DxgWxSRY1KulIDe
	YnQrkHXA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qyHaJ-0084wC-16;
	Wed, 01 Nov 2023 20:13:03 +0000
Date: Wed, 1 Nov 2023 13:13:03 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-modules@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
	andrea.righi@canonical.com, keescook@chromium.org,
	zhumao001@208suo.com, yangtiezhu@loongson.cn, ojeda@kernel.org
Subject: [GIT PULL] Modules changes for v6.7-rc1
Message-ID: <ZUKxT1CL9/0Dn6NE@bombadil.infradead.org>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Luis Chamberlain <mcgrof@infradead.org>

The following changes since commit 7d461b291e65938f15f56fe58da2303b07578a76:

  Merge tag 'drm-next-2023-10-31-1' of git://anongit.freedesktop.org/drm/drm (2023-11-01 06:28:35 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/ tags/modules-6.7-rc1

for you to fetch changes up to ea0b0bcef4917a2640ecc100c768b8e785784834:

  module: Annotate struct module_notes_attrs with __counted_by (2023-11-01 13:07:32 -0700)

----------------------------------------------------------------
Modules changes for v6.7-rc1

The only thing worth highligthing is that gzip moves to use vmalloc() instead of
kmalloc just as we had a fix for this for zstd on v6.6-rc1. The rest is regular
house keeping, keeping things neat, tidy, and boring.

Oh and this has been on linux-next for over a month.

----------------------------------------------------------------
Andrea Righi (1):
      module/decompress: use vmalloc() for gzip decompression workspace

Kees Cook (2):
      module: Clarify documentation of module_param_call()
      module: Annotate struct module_notes_attrs with __counted_by

Luis Chamberlain (1):
      MAINTAINERS: add include/linux/module*.h to modules

Tiezhu Yang (2):
      module: Make is_mapping_symbol() return bool
      module: Make is_valid_name() return bool

Zhu Mao (1):
      module: Fix comment typo

 MAINTAINERS                   | 2 +-
 include/linux/module_symbol.h | 2 +-
 include/linux/moduleparam.h   | 6 +++++-
 kernel/module/decompress.c    | 4 ++--
 kernel/module/stats.c         | 2 +-
 kernel/module/sysfs.c         | 2 +-
 scripts/mod/modpost.c         | 4 ++--
 7 files changed, 13 insertions(+), 9 deletions(-)

