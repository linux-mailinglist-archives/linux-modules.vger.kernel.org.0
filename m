Return-Path: <linux-modules+bounces-121-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC387D5245
	for <lists+linux-modules@lfdr.de>; Tue, 24 Oct 2023 15:47:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 832FD1C20C3D
	for <lists+linux-modules@lfdr.de>; Tue, 24 Oct 2023 13:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AA9C2B5EC;
	Tue, 24 Oct 2023 13:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jqnwgpl+"
X-Original-To: linux-modules@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184D82B5F5
	for <linux-modules@vger.kernel.org>; Tue, 24 Oct 2023 13:46:53 +0000 (UTC)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62B7E10DC
	for <linux-modules@vger.kernel.org>; Tue, 24 Oct 2023 06:46:51 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d9cb10a5d44so2576928276.0
        for <linux-modules@vger.kernel.org>; Tue, 24 Oct 2023 06:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698155210; x=1698760010; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=griUcA7GUXZ/C94ijw+khTWkXdhOo9/SkZ3zjzjerBg=;
        b=Jqnwgpl+iQgBXPyzwBt0Y9Y8w3zvUht2600ZNQUwsUvGgtC5+FTtNIYPEd0CTsQKi1
         k5rzT4QjzP+sGrlMTVBJdcf2MlS7wm0dRhvz7KMmLgKKLED3QqZTQhJaRxOnRIzdhuJ0
         Pz6IqSMaKj66GjRXDUUzPuO0/S3KH7tCKtLAFYVTnSrD7Dj/O0JGspre3I9wUFlICaH/
         D9Llcg1gxL/kpuP5Cf9pEv0t00foYmiEvsdUi456IyngEl+AI6pOmIo5BU4yGsCJVryI
         WhpiVIWQkegWWs2eCR9huOjYJC5Cjrz1nGoo7LW1qCRFneuvE7GwF4ffuk5p0W+n/xTw
         3ZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698155210; x=1698760010;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=griUcA7GUXZ/C94ijw+khTWkXdhOo9/SkZ3zjzjerBg=;
        b=s6yZarKEofIZZGeehkgYNA07MqSMJZ1WPnDJsydXAs3lze3+UU93bY3HIoM8+1Tfrt
         iqi32gu/b7UrjUNr5ohoZWH1hhjml17dd5HH/sSB1AfF069NbQ6imeL65XWp4x5MAr1m
         6r3+ZavC5ICxMUa9SyFtkuB/M134eKqUX1d2BQdn+chf4DDJ6Jw41+VcjhhBIMZoFFrO
         H5N6WrpNsnM845t2WvBeVOg4riU9zjKJUDmTj9p9zZZ6vcSwIEFsdc0k4JmVG3XzE0AP
         zozmvUTmzRe3St6amjn12r4I9cv+KHRqCOiNHMFuc13J6Vk2qXI51g2yGixMrkNk6Lwq
         I5Tg==
X-Gm-Message-State: AOJu0YzdoSo08YLCXMBGG4gcJczsq9/cXa0g3vsKcs4+JBpIjwcj7R2d
	63Y42VQvLU8/Lm3bbvKP0SFCM5Yr5IU=
X-Google-Smtp-Source: AGHT+IEpwWcHxe3pWwBFpCZZha+IjIrDrruma7abx61pSV1ETO4xUZC89g08mISvSSxLbel6DAK32ekX/R8=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:45ba:3318:d7a5:336a])
 (user=surenb job=sendgmr) by 2002:a25:7485:0:b0:d9a:cbf9:1c8d with SMTP id
 p127-20020a257485000000b00d9acbf91c8dmr216225ybc.12.1698155210387; Tue, 24
 Oct 2023 06:46:50 -0700 (PDT)
Date: Tue, 24 Oct 2023 06:46:01 -0700
In-Reply-To: <20231024134637.3120277-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231024134637.3120277-1-surenb@google.com>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
Message-ID: <20231024134637.3120277-5-surenb@google.com>
Subject: [PATCH v2 04/39] nodemask: Split out include/linux/nodemask_types.h
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	corbet@lwn.net, void@manifault.com, peterz@infradead.org, 
	juri.lelli@redhat.com, ldufour@linux.ibm.com, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org, muchun.song@linux.dev, 
	rppt@kernel.org, paulmck@kernel.org, pasha.tatashin@soleen.com, 
	yosryahmed@google.com, yuzhao@google.com, dhowells@redhat.com, 
	hughd@google.com, andreyknvl@gmail.com, keescook@chromium.org, 
	ndesaulniers@google.com, vvvvvv@google.com, gregkh@linuxfoundation.org, 
	ebiggers@google.com, ytcoode@gmail.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	bristot@redhat.com, vschneid@redhat.com, cl@linux.com, penberg@kernel.org, 
	iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com, 
	elver@google.com, dvyukov@google.com, shakeelb@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, rientjes@google.com, 
	minchan@google.com, kaleshsingh@google.com, surenb@google.com, 
	kernel-team@android.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Kent Overstreet <kent.overstreet@linux.dev>

sched.h, which defines task_struct, needs nodemask_t - but sched.h is a
frequently used header and ideally shouldn't be pulling in any more code
that it needs to.

This splits out nodemask_types.h which has the definition sched.h needs,
which will avoid a circular header dependency in the alloc tagging patch
series, and as a bonus should speed up kernel build times.

Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
---
 include/linux/nodemask.h       | 2 +-
 include/linux/nodemask_types.h | 9 +++++++++
 include/linux/sched.h          | 2 +-
 3 files changed, 11 insertions(+), 2 deletions(-)
 create mode 100644 include/linux/nodemask_types.h

diff --git a/include/linux/nodemask.h b/include/linux/nodemask.h
index 8d07116caaf1..b61438313a73 100644
--- a/include/linux/nodemask.h
+++ b/include/linux/nodemask.h
@@ -93,10 +93,10 @@
 #include <linux/threads.h>
 #include <linux/bitmap.h>
 #include <linux/minmax.h>
+#include <linux/nodemask_types.h>
 #include <linux/numa.h>
 #include <linux/random.h>
 
-typedef struct { DECLARE_BITMAP(bits, MAX_NUMNODES); } nodemask_t;
 extern nodemask_t _unused_nodemask_arg_;
 
 /**
diff --git a/include/linux/nodemask_types.h b/include/linux/nodemask_types.h
new file mode 100644
index 000000000000..84c2f47c4237
--- /dev/null
+++ b/include/linux/nodemask_types.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __LINUX_NODEMASK_TYPES_H
+#define __LINUX_NODEMASK_TYPES_H
+
+#include <linux/numa.h>
+
+typedef struct { DECLARE_BITMAP(bits, MAX_NUMNODES); } nodemask_t;
+
+#endif /* __LINUX_NODEMASK_TYPES_H */
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 77f01ac385f7..12a2554a3164 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -20,7 +20,7 @@
 #include <linux/hrtimer.h>
 #include <linux/irqflags.h>
 #include <linux/seccomp.h>
-#include <linux/nodemask.h>
+#include <linux/nodemask_types.h>
 #include <linux/rcupdate.h>
 #include <linux/refcount.h>
 #include <linux/resource.h>
-- 
2.42.0.758.gaed0368e0e-goog


