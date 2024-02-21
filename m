Return-Path: <linux-modules+bounces-689-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B10CC85E81F
	for <lists+linux-modules@lfdr.de>; Wed, 21 Feb 2024 20:51:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66A962835D7
	for <lists+linux-modules@lfdr.de>; Wed, 21 Feb 2024 19:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56708153BDA;
	Wed, 21 Feb 2024 19:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b0LNcUEU"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D32E1534E7
	for <linux-modules@vger.kernel.org>; Wed, 21 Feb 2024 19:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708544512; cv=none; b=ndOLSFtrix1OnAUt+BrUVnEadrP+XT1v9VFsoqCMwICBvYTkfrqM7dQqW9KvrmPj+zzUpNyT2tRo3gxtMN+R9eKfhRH+b6JnadzcvPjlUlc0/iN8kKMOU1UukbukPuW++V2XRK2B/QKQKH+fmzlJTu7piyM46jQj7/E4ZAwowMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708544512; c=relaxed/simple;
	bh=qkZhp+ePz3dtXVk7UutjwpWx2QtP2MvgIxyFZrcOXXs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CRc6INrnwo8P8nCk97QJA4nu7/Yfg12hiBwdwVbEzqmS0eFsCYrh4SqfCOljKbsXJW2xUR4faa1httSTP6xQez+d6j5u9Rv6dwlDewMNprlQ3CNU2kJr+JKjXLK4lg0XKahyxAMteOcqnX4mOb17x7WZzWYr8FkWy/SXAw1eQvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b0LNcUEU; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6087ffdac8cso18221627b3.2
        for <linux-modules@vger.kernel.org>; Wed, 21 Feb 2024 11:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708544510; x=1709149310; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X6Mc1467Tr+n3B+nCTUL6nWniTp2NFe2UCsWnkAH0JA=;
        b=b0LNcUEUh2ruduEaLgcg3nQ9U5rhyUIb+7Qrs0mgzU4z+my3zwxazrgoseHW7b8yFO
         VNFgNMA3Oqu/AogWa+GjJrkcHUBWQBX/uyRM68yZ41UtQyrqaDmq1dJuN3J9PZtsy8Hk
         xVaJodmxmmTJLiJKd6x3wqHB5Jy+FOKCza02PStCK1uGD4dLE2dgIRbPlG7tI0zPI4qe
         Os5+nTV8bHblWubOdyD3EofzxQmX3EftO+oh/tZpBNMwc4P0E43oCyHd39v6njiUxdkB
         4hRqTjjxNmTQzeLnmpmkuY7rY5PCdHAZA3xqP06e3KASsOwvHHTO5KdhnhyYrApo7fLX
         2mlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708544510; x=1709149310;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=X6Mc1467Tr+n3B+nCTUL6nWniTp2NFe2UCsWnkAH0JA=;
        b=bS3wXs7N9DbjTtf7A1vt6NUR6Cyenj8RwQ5kz+zJD3Ha5HTpu/TlJjeoRbxFxoB4iP
         Y4dSiooWaesSHkxYnsV/ezzhzYdnUjHKtiXmv1eF1++hiSWR5+g/HMKzjvEtxxhsT42M
         MZz7wNejhrijr5JQPspOSVz2R2/CHYCqVuL9xnjJpiN8AihL1Bg/hf3nJ1MQ+H2qSQyr
         /mNXR+IyRUZYTmZm8H3pmbc3SDxm8h7hpIljuJi8JDnVE2tG4kWtAeALd+pteRr/gsgy
         J3kEet9UPpCM7STYdLnwuhLGvvRUP3IhKsoUJ2Pu1W5FKPzyNMjzGlJwRSeE6R5AZVKk
         6eYw==
X-Forwarded-Encrypted: i=1; AJvYcCWh6639S3CNLp9vlulJ902B7zDZaoDMiE64dWtvqnJFLw8pOkCL2wk+6qMocWvOj60TGNbYfUzVsj92gKR+q53698jA8Oy+WksPjiD6JQ==
X-Gm-Message-State: AOJu0Yy236V56m3Nu02oSDI6S4y9S1m5HRBqOE9tgTm/POOyRSP87P5z
	WyIhaMeMFm4EAdBptrjae1iQnHWj/048J77JTCX+UQBgjbGG0tjGJVlPguKke10JhFPOf6McWXs
	xrQ==
X-Google-Smtp-Source: AGHT+IFo4X8oIPfRZXy8Mvx3jkM76a/Fo26RcQOQzbZJGg3aZKwzpwtV53XrK+fKFAFr0Qz0jo83p6b+B/Y=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:953b:9a4e:1e10:3f07])
 (user=surenb job=sendgmr) by 2002:a05:690c:368a:b0:608:55be:5e3d with SMTP id
 fu10-20020a05690c368a00b0060855be5e3dmr1661247ywb.0.1708544509616; Wed, 21
 Feb 2024 11:41:49 -0800 (PST)
Date: Wed, 21 Feb 2024 11:40:37 -0800
In-Reply-To: <20240221194052.927623-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240221194052.927623-1-surenb@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221194052.927623-25-surenb@google.com>
Subject: [PATCH v4 24/36] rust: Add a rust helper for krealloc()
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	penguin-kernel@i-love.sakura.ne.jp, corbet@lwn.net, void@manifault.com, 
	peterz@infradead.org, juri.lelli@redhat.com, catalin.marinas@arm.com, 
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
	cgroups@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Kent Overstreet <kent.overstreet@linux.dev>

Memory allocation profiling is turning krealloc() into a nontrivial
macro - so for now, we need a helper for it.

Until we have proper support on the rust side for memory allocation
profiling this does mean that all Rust allocations will be accounted to
the helper.

Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Gary Guo <gary@garyguo.net>
Cc: "Bj=C3=B6rn Roy Baron" <bjorn3_gh@protonmail.com>
Cc: Benno Lossin <benno.lossin@proton.me>
Cc: Andreas Hindborg <a.hindborg@samsung.com>
Cc: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 rust/helpers.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/helpers.c b/rust/helpers.c
index 70e59efd92bc..ad62eaf604b3 100644
--- a/rust/helpers.c
+++ b/rust/helpers.c
@@ -28,6 +28,7 @@
 #include <linux/mutex.h>
 #include <linux/refcount.h>
 #include <linux/sched/signal.h>
+#include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/wait.h>
 #include <linux/workqueue.h>
@@ -157,6 +158,13 @@ void rust_helper_init_work_with_key(struct work_struct=
 *work, work_func_t func,
 }
 EXPORT_SYMBOL_GPL(rust_helper_init_work_with_key);
=20
+void * __must_check rust_helper_krealloc(const void *objp, size_t new_size=
,
+					 gfp_t flags) __realloc_size(2)
+{
+	return krealloc(objp, new_size, flags);
+}
+EXPORT_SYMBOL_GPL(rust_helper_krealloc);
+
 /*
  * `bindgen` binds the C `size_t` type as the Rust `usize` type, so we can
  * use it in contexts where Rust expects a `usize` like slice (array) indi=
ces.
--=20
2.44.0.rc0.258.g7320e95886-goog


