Return-Path: <linux-modules+bounces-1404-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FFE903FB3
	for <lists+linux-modules@lfdr.de>; Tue, 11 Jun 2024 17:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C10A1F25938
	for <lists+linux-modules@lfdr.de>; Tue, 11 Jun 2024 15:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 604A75EE8D;
	Tue, 11 Jun 2024 15:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nq8XTaCG"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E1B51016
	for <linux-modules@vger.kernel.org>; Tue, 11 Jun 2024 15:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718118305; cv=none; b=hBBl0xtHabFU9zpeZ8iNkvjL5kKO09N9griHt0+MA1iDUlUSXipMWMAeEm+beLcbJ59IQcXbjzot4F/tPAD6vFsmOClGHMvWmMrfnrExNpcAbJX+v0GtF2x1gISguGvHGCwZt+zYy5ms4U7cpLGKbEzaS1HmmmgzmIOxdZs/TVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718118305; c=relaxed/simple;
	bh=eWw8kAuke93vjRbEMbS+qDopyz7UAiLzdhyq++aN5WM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hBI3hWyTsAtULgDEQnRQq/S1OlV9lkcLDttN9kcMyOhiVDviJAUv4RUF0gbCQdlcDGOL4cw7S3gw3Ye/SdyXlknplVcy0Orl3HqQe8JUq/4bNjLYk9Qf1+psSpvKrJq5k9Ixqe73KdYAeZn/GfXCN6VUKdBSkoScXhCjg1/7AQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nq8XTaCG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 148AEC4DDE7;
	Tue, 11 Jun 2024 15:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718118305;
	bh=eWw8kAuke93vjRbEMbS+qDopyz7UAiLzdhyq++aN5WM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Nq8XTaCGge5MhkI3IaRv+9OI0xjG0n6fMpFBc6YoT2+yzy5f6nrQ9SZ6C1/vaco4x
	 yjVmrCuDaszVrZoA/3db4uZ5XXqbfKyvKTH/Yg+IfKnzsDqBpdSEj7BL6m180j7iTD
	 izts4I4C1Jd/g/L6baYu5uw+HWwySWbNgIaMVpm96Wk1S0CkoofBvRDnJnmLSdgrG4
	 8FEARCkrGCs1vZPE1IMsepls3cMryskhWk2AcSt7qm+UpZbopoGR5YGZ++rx/49HBM
	 zJ6RC9B7U8Bc34LhZfIZOsSEHwoBaUxNVmXck9qhlqz74Z0qtJSXXzSTZ9MIN9xzuo
	 Boj6J+7rXDTmQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A9E6C27C77;
	Tue, 11 Jun 2024 15:05:05 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Tue, 11 Jun 2024 16:05:19 +0100
Subject: [PATCH kmod 19/20] man: remove the "Maintained by" references
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240611-man-v1-19-bd6864d49639@gmail.com>
References: <20240611-man-v1-0-bd6864d49639@gmail.com>
In-Reply-To: <20240611-man-v1-0-bd6864d49639@gmail.com>
To: linux-modules@vger.kernel.org
Cc: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718118301; l=3839;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=zxDwsxezKzKd4XXoucEoUtFGD/+f6o/6S2mBfQf4Gus=;
 b=coUhYTpWBiHSVb9fEW7YVHXWlbGpSPnEKJiVCNpqGSHNO++Xvi6kX97CzozwRZqv4tEZXtxYA
 vtC33AlAnIOD4RGkxaps6jfxNImPaHuJTuIVGFk/Ji4m2wRHK4o/y1x
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received: by B4 Relay for emil.l.velikov@gmail.com/20230301 with
 auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: emil.l.velikov@gmail.com

From: Emil Velikov <emil.l.velikov@gmail.com>

At a glance through my system, around 2% of the man pages include such
statement.

Looking through git log, Jon has been active in a while and presumably
have moved on.

Most importantly the Copyright section isn't the best place to reference
the maintainer/contact person.

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
Instead we can add a note in the authors section, pointing people to the
ML/kernel.org/Github repo for when seeking contact.

Also should probably s/Developer/Maintainer/ for Lucas, who's been
keeping the project afloat the last few decades ;-)

Lucas, what do you think?
---
 man/insmod.8.scd      | 1 -
 man/kmod.8.scd        | 3 +--
 man/lsmod.8.scd       | 1 -
 man/modinfo.8.scd     | 1 -
 man/modprobe.8.scd    | 1 -
 man/modprobe.d.5.scd  | 1 -
 man/modules.dep.5.scd | 1 -
 man/rmmod.8.scd       | 1 -
 8 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/man/insmod.8.scd b/man/insmod.8.scd
index b6f8654..27d4409 100644
--- a/man/insmod.8.scd
+++ b/man/insmod.8.scd
@@ -21,7 +21,6 @@ information about errors.
 # COPYRIGHT
 
 This manual page originally Copyright 2002, Rusty Russell, IBM Corporation.
-Maintained by Jon Masters and others.
 
 # SEE ALSO
 
diff --git a/man/kmod.8.scd b/man/kmod.8.scd
index 2007a2d..6bd9432 100644
--- a/man/kmod.8.scd
+++ b/man/kmod.8.scd
@@ -35,8 +35,7 @@ Linux Kernel modules. Most users will only run it using its other names.
 
 # COPYRIGHT
 
-This manual page originally Copyright 2014, Marco d'Itri. Maintained by Lucas De
-Marchi and others.
+This manual page originally Copyright 2014, Marco d'Itri.
 
 # SEE ALSO
 
diff --git a/man/lsmod.8.scd b/man/lsmod.8.scd
index eb2f2e8..ded619e 100644
--- a/man/lsmod.8.scd
+++ b/man/lsmod.8.scd
@@ -15,7 +15,6 @@ lsmod - Show the status of modules in the Linux Kernel
 # COPYRIGHT
 
 This manual page originally Copyright 2002, Rusty Russell, IBM Corporation.
-Maintained by Jon Masters and others.
 
 # SEE ALSO
 
diff --git a/man/modinfo.8.scd b/man/modinfo.8.scd
index 9545257..d088c7e 100644
--- a/man/modinfo.8.scd
+++ b/man/modinfo.8.scd
@@ -63,7 +63,6 @@ architecture.
 # COPYRIGHT
 
 This manual page originally Copyright 2003, Rusty Russell, IBM Corporation.
-Maintained by Jon Masters and others.
 
 # SEE ALSO
 
diff --git a/man/modprobe.8.scd b/man/modprobe.8.scd
index 8354765..657d172 100644
--- a/man/modprobe.8.scd
+++ b/man/modprobe.8.scd
@@ -197,7 +197,6 @@ The MODPROBE_OPTIONS environment variable can also be used to pass arguments to
 # COPYRIGHT
 
 This manual page originally Copyright 2002, Rusty Russell, IBM Corporation.
-Maintained by Jon Masters and others.
 
 # SEE ALSO
 
diff --git a/man/modprobe.d.5.scd b/man/modprobe.d.5.scd
index 9d03c49..41d2e78 100644
--- a/man/modprobe.d.5.scd
+++ b/man/modprobe.d.5.scd
@@ -170,7 +170,6 @@ directly within the modules.
 # COPYRIGHT
 
 This manual page originally Copyright 2004, Rusty Russell, IBM Corporation.
-Maintained by Jon Masters and others.
 
 # SEE ALSO
 
diff --git a/man/modules.dep.5.scd b/man/modules.dep.5.scd
index c4e7653..7723a16 100644
--- a/man/modules.dep.5.scd
+++ b/man/modules.dep.5.scd
@@ -29,7 +29,6 @@ fashion rather than touching these files.
 # COPYRIGHT
 
 This manual page originally Copyright 2002, Rusty Russell, IBM Corporation.
-Maintained by Jon Masters and others.
 
 # SEE ALSO
 
diff --git a/man/rmmod.8.scd b/man/rmmod.8.scd
index e1f656f..c4dcc3e 100644
--- a/man/rmmod.8.scd
+++ b/man/rmmod.8.scd
@@ -35,7 +35,6 @@ is provided) from the kernel. Most users will want to use *modprobe*(8) with the
 # COPYRIGHT
 
 This manual page originally Copyright 2002, Rusty Russell, IBM Corporation.
-Maintained by Jon Masters and others.
 
 # SEE ALSO
 

-- 
2.45.0



