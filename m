Return-Path: <linux-modules+bounces-155-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C477D5324
	for <lists+linux-modules@lfdr.de>; Tue, 24 Oct 2023 15:50:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E77011C20C72
	for <lists+linux-modules@lfdr.de>; Tue, 24 Oct 2023 13:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC37E30CFC;
	Tue, 24 Oct 2023 13:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SzE1AUc4"
X-Original-To: linux-modules@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B9230F9B
	for <linux-modules@vger.kernel.org>; Tue, 24 Oct 2023 13:48:17 +0000 (UTC)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 554942118
	for <linux-modules@vger.kernel.org>; Tue, 24 Oct 2023 06:48:09 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-da04776a869so499112276.0
        for <linux-modules@vger.kernel.org>; Tue, 24 Oct 2023 06:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698155288; x=1698760088; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5iA9XL/oyX6Tyl0rnn5vdBOVip3jqaNokzkLete42fs=;
        b=SzE1AUc4BKZmpNvrK36+SD3sWBCP8XLcqDoSN7SaMr2sU/BG1aGfkwvE/f4JQXF1Ni
         hMF1o0lNDayxObo0C0wjdTZL8vll7r8pHHyLG7ycDypgWlfcaIqRWfAtBLLsA0BrpBju
         FzAAj+z5fJfNRaY9+A3lV6zqMBZMFytgHluIRpWvQ3sZxRKVk0/VlTAtIhv1vlgDxCFT
         1X0QR2xi2xN0sadEGLcjq9JrBII48akc5UqV38dawVcqLr033J2tJARubY1zouO5IWW8
         ObNjzyLUon3FC8l21rKOSCG4nSNGOECtt/Pzik0zSbCvIpn6JtaWo302ot6QhuiBaU7v
         3hsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698155288; x=1698760088;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5iA9XL/oyX6Tyl0rnn5vdBOVip3jqaNokzkLete42fs=;
        b=w/VooyxWFZhMZHZ+X61R717knSNRWca85MvKlpMgYLhF5OUCHKRVtipMnntJ4SuNDi
         yFLgxoCVCcyZOctXBg4nHGLSKviTOCjfE289lX2fwkxUj0ItaGbVDjoaj4dawz3jWNG7
         wTnDgfICTht8JimKMux+xoN9EHaF1suq3/wgzJKtOjvbAOMUsjb4KGVqZ0zW0VlnzchS
         yJPSg2QtzCcP+OBJQ+2yROFaDJb3lBfvw0BPxQe0HhDbeBC7wSh9ZZQBeDskaFaDa2S6
         e7h6bExUrduWTy1jxewinU4GPINlah3/OFVRASdujbVX1Rbp3tcLFBp/Gp0TpQaDLKeR
         +N9A==
X-Gm-Message-State: AOJu0YylxuzNbdxapMLuq2B1yfRdfkFW6K5vvpdF9PPIeuwNyQ42iN24
	4F2vN9sG1AnDfSRYpPZx5RT4i5zywRA=
X-Google-Smtp-Source: AGHT+IG2dGz7nkvTfdEUK5vnzGjBRQVPkaal0DQpTev0jCoT6FkWge7pFcsduGaJ7nCMKZx++nF8KYSK16A=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:45ba:3318:d7a5:336a])
 (user=surenb job=sendgmr) by 2002:a25:ade8:0:b0:d89:dd12:163d with SMTP id
 d40-20020a25ade8000000b00d89dd12163dmr222107ybe.1.1698155288323; Tue, 24 Oct
 2023 06:48:08 -0700 (PDT)
Date: Tue, 24 Oct 2023 06:46:36 -0700
In-Reply-To: <20231024134637.3120277-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231024134637.3120277-1-surenb@google.com>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
Message-ID: <20231024134637.3120277-40-surenb@google.com>
Subject: [PATCH v2 39/39] MAINTAINERS: Add entries for code tagging and memory
 allocation profiling
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

The new code & libraries added are being maintained - mark them as such.

Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2894f0777537..22e51de42131 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5118,6 +5118,13 @@ S:	Supported
 F:	Documentation/process/code-of-conduct-interpretation.rst
 F:	Documentation/process/code-of-conduct.rst
 
+CODE TAGGING
+M:	Suren Baghdasaryan <surenb@google.com>
+M:	Kent Overstreet <kent.overstreet@linux.dev>
+S:	Maintained
+F:	include/linux/codetag.h
+F:	lib/codetag.c
+
 COMEDI DRIVERS
 M:	Ian Abbott <abbotti@mev.co.uk>
 M:	H Hartley Sweeten <hsweeten@visionengravers.com>
@@ -13708,6 +13715,15 @@ F:	mm/memblock.c
 F:	mm/mm_init.c
 F:	tools/testing/memblock/
 
+MEMORY ALLOCATION PROFILING
+M:	Suren Baghdasaryan <surenb@google.com>
+M:	Kent Overstreet <kent.overstreet@linux.dev>
+S:	Maintained
+F:	include/linux/alloc_tag.h
+F:	include/linux/codetag_ctx.h
+F:	lib/alloc_tag.c
+F:	lib/pgalloc_tag.c
+
 MEMORY CONTROLLER DRIVERS
 M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 L:	linux-kernel@vger.kernel.org
-- 
2.42.0.758.gaed0368e0e-goog


