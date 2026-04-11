Return-Path: <linux-modules+bounces-6237-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNSHHZpG2mkrzggAu9opvQ
	(envelope-from <linux-modules+bounces-6237-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Sat, 11 Apr 2026 15:03:22 +0200
X-Original-To: lists+linux-modules@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7BD3E00AA
	for <lists+linux-modules@lfdr.de>; Sat, 11 Apr 2026 15:03:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61A9A303D093
	for <lists+linux-modules@lfdr.de>; Sat, 11 Apr 2026 13:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C1521767D;
	Sat, 11 Apr 2026 13:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ruc.edu.cn header.i=@ruc.edu.cn header.b="giilBEIW"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C231A680F;
	Sat, 11 Apr 2026 13:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775912595; cv=none; b=oFxkfJ9grE64YnAb+GbMgOsAKNcqXDppzqWmWlw9cSyoflc+RMzcso2tS6M9ds2XrpSAPTg3EYVFM03uC46bpPtv0yCjuZTxVSLB9JczbYL6k/s6/Hr27NiAsiPE/+qpLQn0KqOtboXrTvw9JzxDLRi4HnRRLlPJhS/QRbGyocw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775912595; c=relaxed/simple;
	bh=QI27p/YUp8imu1oSk7XgAq0gTpipNiHvMbtk7xD1pP4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DiHWuMn23GCOvXaN7nPwmZbhgScVvNsefpGV5M+r4ICk5wto2Cu7CX+q6a4adrQmx5FqfvyWwMeDNV+20RajvvJdoaERfZHEMvU+iQ4IGzTXFgKbVIrEzD2qghAsTKWSgBFWawJ4QkAn6Bu9CtVD/d51IA2EmLLG6rGS+DuL98c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ruc.edu.cn; spf=pass smtp.mailfrom=ruc.edu.cn; dkim=pass (1024-bit key) header.d=ruc.edu.cn header.i=@ruc.edu.cn header.b=giilBEIW; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ruc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ruc.edu.cn
Received: from lwz.tail698a0e.ts.net (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes [36.112.3.244])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3a5a3b14c;
	Sat, 11 Apr 2026 21:02:55 +0800 (GMT+08:00)
From: Wenzhao Liao <wenzhaoliao@ruc.edu.cn>
To: mcgrof@kernel.org,
	petr.pavlu@suse.com,
	da.gomez@kernel.org,
	samitolvanen@google.com,
	ojeda@kernel.org,
	linux-modules@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: atomlin@atomlin.com,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] rust: module_param: support bool parameters
Date: Sat, 11 Apr 2026 09:02:53 -0400
Message-Id: <20260411130254.3510128-1-wenzhaoliao@ruc.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d7ca3615b03a2kunm330ff492110e69
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGU4ZVhpDShgfQ0MfHkNPS1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlITVVKSklVSFVJT09ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSktLVUpCS0
	tZBg++
DKIM-Signature: a=rsa-sha256;
	b=giilBEIWOh3uQ3X67GEO8HA67X1OLxATssUZl9qUW1dln1YKWZrzZRf3fOs+Z19KGXOmKr2OKXIVBlx7igxYOMt2d/4PpjTYfg+6DYkfc6BeZ5JJDon1NBDHKFGqwAHOEQd1f57HpDq6oTsKdwCn06l/M9xyLYKGkoZWbsHoDgk=; s=default; c=relaxed/relaxed; d=ruc.edu.cn; v=1;
	bh=uJxjX7KD1fNaNefa+O8qfJbyMuJzDLIkHPab7x5q5cQ=;
	h=date:mime-version:subject:message-id:from;
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ruc.edu.cn,quarantine];
	R_DKIM_ALLOW(-0.20)[ruc.edu.cn:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[atomlin.com,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-6237-lists,linux-modules=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenzhaoliao@ruc.edu.cn,linux-modules@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ruc.edu.cn:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-modules];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[17];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ruc.edu.cn:dkim,ruc.edu.cn:mid]
X-Rspamd-Queue-Id: 8F7BD3E00AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sorry for the earlier noise and for our unfamiliarity with parts of the
kernel submission process, which created extra burden for maintainers.

This patch adds boolean module parameter support to the Rust `module!`
parameter path.

It implements `ModuleParam` for `bool` and wires `PARAM_OPS_BOOL` into
the Rust module parameter machinery, so Rust-side parsing reuses the
existing kernel `kstrtobool()` semantics through `kstrtobool_bytes()`
instead of introducing a separate parser. A boolean parameter is also
added to `samples/rust/rust_minimal.rs` as a small reference user and
build-time validation point.

AI assistance: Codex:GPT-5 was used to help draft the `ModuleParam for
bool` implementation, the macro type mapping, and the sample parameter
wiring. I reviewed the resulting code and changelog, tested the change,
and take responsibility for the submission.

Build-tested with:
  make -C /home/lwz/rfl-dev/worktrees/rnull-upstream-contribution \
    O=/tmp/module-param-bool-build LLVM=-15 defconfig
  make -C /home/lwz/rfl-dev/worktrees/rnull-upstream-contribution \
    O=/tmp/module-param-bool-build LLVM=-15 rustavailable
  scripts/config --file /tmp/module-param-bool-build/.config \
    -e RUST -e SAMPLES -e SAMPLES_RUST -m SAMPLE_RUST_MINIMAL
  make -C /home/lwz/rfl-dev/worktrees/rnull-upstream-contribution \
    O=/tmp/module-param-bool-build LLVM=-15 olddefconfig
  make -C /home/lwz/rfl-dev/worktrees/rnull-upstream-contribution \
    O=/tmp/module-param-bool-build LLVM=-15 vmlinux
  make -C /home/lwz/rfl-dev/worktrees/rnull-upstream-contribution \
    O=/tmp/module-param-bool-build LLVM=-15 samples/rust/rust_minimal.ko

Wenzhao Liao (1):
  rust: module_param: support bool parameters

 rust/kernel/module_param.rs  | 9 ++++++++-
 rust/macros/lib.rs           | 1 +
 rust/macros/module.rs        | 1 +
 samples/rust/rust_minimal.rs | 8 ++++++++
 4 files changed, 18 insertions(+), 1 deletion(-)

-- 
2.34.1

