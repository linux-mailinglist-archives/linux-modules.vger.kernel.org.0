Return-Path: <linux-modules+bounces-1048-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D82F78A00CF
	for <lists+linux-modules@lfdr.de>; Wed, 10 Apr 2024 21:48:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 923FE282A05
	for <lists+linux-modules@lfdr.de>; Wed, 10 Apr 2024 19:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D58A2181329;
	Wed, 10 Apr 2024 19:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OcnjeJyc"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5B228FD
	for <linux-modules@vger.kernel.org>; Wed, 10 Apr 2024 19:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712778489; cv=none; b=N1XCQr4OLHRHfSPxFM4YuSRqdbp0LiODeT4bL5rcba/yx3H0z9EGqxYzS36Hc2jMt4F7g/2/P6ketKAckIjADZqYTNAXZdIPBN4GgauTxdI3q4ctovFNXho1U5UeMGwLh5qehQsPty/mDUXMeJiexhWDmfSHwTdTBoRMDtalmdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712778489; c=relaxed/simple;
	bh=G9pCAXQpRlbuAd4uEiAYnbaRqsOWvK/wc08OLEXKruE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A6brE9B/pFqoZwQc/MLh1lndfYrcliW+KRBfDU4d0eXcQfJ9AW+0E6JWyZSLXlFG6LO4r6IyV9DDkIydO2Y/br667Js7ac1gPVLR7kF5uU6AJNTmO/BNEMYfK2LoLpf9a4Zn2G+aqKvZ5IuObBVXxyzyu3FqDJv/rn6Gy9yJsjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elsk.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OcnjeJyc; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elsk.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-5d8bcf739e5so6184711a12.1
        for <linux-modules@vger.kernel.org>; Wed, 10 Apr 2024 12:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712778488; x=1713383288; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fhoQ0YlSeaHnAyoqhgDUSmcljf7yTto7cwKe73n0AeU=;
        b=OcnjeJyczldS7ZjdsWwtba0dEWnSm3BO8XHNraVQjpegg2hi4PkIWS6cq/mku3eMY3
         pCitvWVqAickInMAIbzrgTSq0mDdyaPXpQlgZKZGLyHd5dicqzD/EBOmyEAv4GBDM3Pv
         eS+PRKj8fbR7pSntL5/NBW7OIWfg9fCezLPF/2aJigM0OI18S/U64Gpl/vB9dpg0uVlV
         G6pEWuA1N3U6KZwYCuogoJ+083us4/zmhwFCt74nH6A+bWNLGQV6UpMg7fLlreSJMyHx
         18UZOjWNeDqes0whFMmrqzmwhxD0slwYV0FeG2wBvTFMiEBGUeUvgDqouvAKXvhoEvmk
         wLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712778488; x=1713383288;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fhoQ0YlSeaHnAyoqhgDUSmcljf7yTto7cwKe73n0AeU=;
        b=FjXchBoN+v8WuVTNdQhuf3PXo9QlWUI3mfemVVU8mZYiOyKTDiZKOIVbjNT5lA/97w
         eaXwA8Sh4Ycn68oreEHtIIRheU4PGIhhkNfODc6mX2wfV+vZGPRt+R2LHfsBTFU7NRdn
         LLQyzGbHxLNtbw17QHKv/arkXGUZJCyN2izcpATkgvfequ4lqk3phrXWyoayHeMaH60P
         /TkGZ0AeGubKV/9T/MD3OSy+hD52SobgqUhXNI4LOES0MVp++20NxZiQMkuGy/LnKt59
         pD2QyUb/kt1OfmVke4jy7tlKvrberSNjHGjPMLxpI+Gxj+y6AhuUDwbwjh8VV/PzGDZO
         8cpw==
X-Gm-Message-State: AOJu0Ywr+mi6ce2UnO93YpW/Fa8j1yhQ2xeflJaDPD4XHKwaTLQ+mzks
	cgcTR5rHNu6XnBiRp+FnlorEUT3sWM7V/L5FLE7GOLR2j6x/0LC599N6FyXpzpaPK7Tieg==
X-Google-Smtp-Source: AGHT+IHdOVU9tXohK/q7b+fwNSg1Qx0m+4m5scq0juNSXQe+OsyFDOyHe32s4ZBvoB6NhkN/LQQYz2H5
X-Received: from elsk.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:dbd])
 (user=elsk job=sendgmr) by 2002:a17:902:d506:b0:1e4:3909:47ef with SMTP id
 b6-20020a170902d50600b001e4390947efmr76111plg.11.1712778487532; Wed, 10 Apr
 2024 12:48:07 -0700 (PDT)
Date: Wed, 10 Apr 2024 19:48:02 +0000
In-Reply-To: <20240410193734.29788-1-elsk@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240410193734.29788-1-elsk@google.com>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Message-ID: <20240410194802.62036-1-elsk@google.com>
Subject: [PATCH v2] module: allow UNUSED_KSYMS_WHITELIST to be relative
 against objtree.
From: Yifan Hong <elsk@google.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	"=?UTF-8?q?Matthias=20M=C3=A4nnich?=" <maennich@google.com>, Ulises Mendez Martinez <umendez@google.com>, Yifan Hong <elsk@google.com>
Content-Type: text/plain; charset="UTF-8"

If UNUSED_KSYMS_WHITELIST is a file generated
before Kbuild runs, and the source tree is in
a read-only filesystem, the developer must put
the file somewhere and specify an absolute
path to UNUSED_KSYMS_WHITELIST. This worked,
but if IKCONFIG=y, an absolute path is embedded
into .config and eventually into vmlinux, causing
the build to be less reproducible when building
on a different machine.

This patch makes the handling of
UNUSED_KSYMS_WHITELIST to be similar to
MODULE_SIG_KEY.

First, check if UNUSED_KSYMS_WHITELIST is an
absolute path, just as before this patch. If so,
use the path as is.

If it is a relative path, use wildcard to check
the existence of the file below objtree first.
If it does not exist, fall back to the original
behavior of adding $(srctree)/ before the value.

After this patch, the developer can put the generated
file in objtree, then use a relative path against
objtree in .config, eradicating any absolute paths
that may be evaluated differently on different machines.

Signed-off-by: Yifan Hong <elsk@google.com>
---
V1 -> V2: properly handle absolute paths by treating
  them as-is.

 kernel/module/Kconfig    | 2 +-
 scripts/Makefile.modpost | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index f3e0329337f6..cb8377a18927 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -392,7 +392,7 @@ config UNUSED_KSYMS_WHITELIST
 	  exported at all times, even in absence of in-tree users. The value to
 	  set here is the path to a text file containing the list of symbols,
 	  one per line. The path can be absolute, or relative to the kernel
-	  source tree.
+	  source or obj tree.
 
 config MODULES_TREE_LOOKUP
 	def_bool y
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 739402f45509..36952638bbc6 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -94,7 +94,7 @@ targets += .vmlinux.objs
 
 ifdef CONFIG_TRIM_UNUSED_KSYMS
 ksym-wl := $(CONFIG_UNUSED_KSYMS_WHITELIST)
-ksym-wl := $(if $(filter-out /%, $(ksym-wl)),$(srctree)/)$(ksym-wl)
+ksym-wl := $(if $(filter-out /%, $(ksym-wl)),$(if $(wildcard $(ksym-wl)),,$(srctree)/))$(ksym-wl)
 modpost-args += -t $(addprefix -u , $(ksym-wl))
 modpost-deps += $(ksym-wl)
 endif
-- 
2.44.0.478.gd926399ef9-goog


