Return-Path: <linux-modules+bounces-4537-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D03BB31E5
	for <lists+linux-modules@lfdr.de>; Thu, 02 Oct 2025 10:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCAD3463A8D
	for <lists+linux-modules@lfdr.de>; Thu,  2 Oct 2025 08:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F5F3148A6;
	Thu,  2 Oct 2025 08:14:10 +0000 (UTC)
X-Original-To: linux-modules@vger.kernel.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C691131079B;
	Thu,  2 Oct 2025 08:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759392849; cv=none; b=tNTR/p9NYdS5BQif2G13dDmzNhzEpAx6tSdoZVQ/x+yyc8jpbwDF7c+AU5EWjOqzFq9VrUfxmV6xdqIwQIBUS9l2i6lLh7532gIWIeNcTU7RPJxUOED64bqZkTvlgORRtwUBU/kQ1VdXpoNFfX18FW3cUgmcq/hm8skPav8apiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759392849; c=relaxed/simple;
	bh=maf1QCGEx8ZicvuvjSO5P8pPxIBgYfqjp+uEFuf+J5I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=UTXj9PIG0/OKL8Rif48Jxu7p5K5ZPWJklxVktmKXgRrco1R3ub/8LjI3mZvq11CjyXFOGUhfUrVIkhY1RrMNuCl+zGrAis5QcDKDfo193F+Dd/0xrXSIrW3jaiLXPNcKypiLteTBJZbdULItVyADA5tZT+QaVYYP9yo+aTQVxaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-c45ff70000001609-5a-68de34147d81
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Cc: kernel_team@skhynix.com,
	torvalds@linux-foundation.org,
	damien.lemoal@opensource.wdc.com,
	linux-ide@vger.kernel.org,
	adilger.kernel@dilger.ca,
	linux-ext4@vger.kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	will@kernel.org,
	tglx@linutronix.de,
	rostedt@goodmis.org,
	joel@joelfernandes.org,
	sashal@kernel.org,
	daniel.vetter@ffwll.ch,
	duyuyang@gmail.com,
	johannes.berg@intel.com,
	tj@kernel.org,
	tytso@mit.edu,
	willy@infradead.org,
	david@fromorbit.com,
	amir73il@gmail.com,
	gregkh@linuxfoundation.org,
	kernel-team@lge.com,
	linux-mm@kvack.org,
	akpm@linux-foundation.org,
	mhocko@kernel.org,
	minchan@kernel.org,
	hannes@cmpxchg.org,
	vdavydov.dev@gmail.com,
	sj@kernel.org,
	jglisse@redhat.com,
	dennis@kernel.org,
	cl@linux.com,
	penberg@kernel.org,
	rientjes@google.com,
	vbabka@suse.cz,
	ngupta@vflare.org,
	linux-block@vger.kernel.org,
	josef@toxicpanda.com,
	linux-fsdevel@vger.kernel.org,
	jack@suse.cz,
	jlayton@kernel.org,
	dan.j.williams@intel.com,
	hch@infradead.org,
	djwong@kernel.org,
	dri-devel@lists.freedesktop.org,
	rodrigosiqueiramelo@gmail.com,
	melissa.srw@gmail.com,
	hamohammed.sa@gmail.com,
	harry.yoo@oracle.com,
	chris.p.wilson@intel.com,
	gwan-gyeong.mun@intel.com,
	max.byungchul.park@gmail.com,
	boqun.feng@gmail.com,
	longman@redhat.com,
	yunseong.kim@ericsson.com,
	ysk@kzalloc.com,
	yeoreum.yun@arm.com,
	netdev@vger.kernel.org,
	matthew.brost@intel.com,
	her0gyugyu@gmail.com,
	corbet@lwn.net,
	catalin.marinas@arm.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	luto@kernel.org,
	sumit.semwal@linaro.org,
	gustavo@padovan.org,
	christian.koenig@amd.com,
	andi.shyti@kernel.org,
	arnd@arndb.de,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	rppt@kernel.org,
	surenb@google.com,
	mcgrof@kernel.org,
	petr.pavlu@suse.com,
	da.gomez@kernel.org,
	samitolvanen@google.com,
	paulmck@kernel.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	josh@joshtriplett.org,
	urezki@gmail.com,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	chuck.lever@oracle.com,
	neil@brown.name,
	okorniev@redhat.com,
	Dai.Ngo@oracle.com,
	tom@talpey.com,
	trondmy@kernel.org,
	anna@kernel.org,
	kees@kernel.org,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	mark.rutland@arm.com,
	ada.coupriediaz@arm.com,
	kristina.martsenko@arm.com,
	wangkefeng.wang@huawei.com,
	broonie@kernel.org,
	kevin.brodsky@arm.com,
	dwmw@amazon.co.uk,
	shakeel.butt@linux.dev,
	ast@kernel.org,
	ziy@nvidia.com,
	yuzhao@google.com,
	baolin.wang@linux.alibaba.com,
	usamaarif642@gmail.com,
	joel.granados@kernel.org,
	richard.weiyang@gmail.com,
	geert+renesas@glider.be,
	tim.c.chen@linux.intel.com,
	linux@treblig.org,
	alexander.shishkin@linux.intel.com,
	lillian@star-ark.net,
	chenhuacai@kernel.org,
	francesco@valla.it,
	guoweikang.kernel@gmail.com,
	link@vivo.com,
	jpoimboe@kernel.org,
	masahiroy@kernel.org,
	brauner@kernel.org,
	thomas.weissschuh@linutronix.de,
	oleg@redhat.com,
	mjguzik@gmail.com,
	andrii@kernel.org,
	wangfushuai@baidu.com,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-i2c@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-modules@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: [PATCH v17 40/47] dept: introduce event_site() to disable event tracking if it's recoverable
Date: Thu,  2 Oct 2025 17:12:40 +0900
Message-Id: <20251002081247.51255-41-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251002081247.51255-1-byungchul@sk.com>
References: <20251002081247.51255-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0iTcRTG+7+3XWjwsgxfLVRGWmmlicqhMvoQ8RbRBb91oVa+tJWbNtM0
	qGZ5KSOzwixN2RyusS3NBVnUcpmaOappZTZdTivdygq0i7dmm9KXw4/nPOd5vhw+Li4iQ/ly
	5TFOpZSmSSghIfw2X7syKOGDLM7gAOjOsxHQ/+scghnXMAb6Tz4M/l47AlMvXuFQXuZAoB1w
	4eC5U4SgqvIKgrO6egr69UME2EtrMLjWEAyV5R4Mym4/xGBCb+SBXh0Jg4YKHkwPrIYZTTq0
	mYZ54LpU5i96VkhCo9rNA8v7VgRWZwy03R/EQF35hwR7WzsBte86MeiyaTDIe6IjYOhtIQaF
	Yz4S+kq+EPDm/UMELfWNGFjM3RR0uMZ4cLVLQ8HkLX9cx2QHBqNVfnPeWD+CqfGbFPw0GSn4
	XvqT3BDHmqvNiC0o9Q/rbw3BXn6xkn1Q4eKxGksWm9/yjWTvGqJZ3SMvxmpHf5Gs82syazGe
	p1jtlAdn+7ofUWz1851sU5WZt4PZJVyXyqXJszlV7Pr9Qllrh4bI+BiW87QpWY1qmWIk4DN0
	AlPlqMOKEX+Wv04mB2SKXsr09EzgAQ6iI5i7F4fIAOO0fTHT3bkiYF9Ac8zw7dMBmaAjGZ37
	Dy/AIjqJmTnTgObSwxnTHdtsjMCvvx6wEwEW04lMwY98f6vQ7zEJGO14CzF3EMI8MfQQpUik
	QfOMSCxXZiuk8rSEVbJcpTxn1cF0hQX530N/cnr3fTTqSGlGNB9J5osckS6ZmJRmZ+YqmhHD
	xyVBov2GPplYlCrNPcGp0vepstK4zGa0iE9IgkXxv4+niulD0mPcEY7L4FT/txhfEKpG5uLB
	8S0FirfidXvcR/e1LxcX9U1PKGu39x6Ob31qjV8RDLFZ28LqFHutzkS5QB1lPDVZYhgZ2HSw
	uKhgDd5kWxijvhEW4fN8shO9yUucipTH4z6ft+bAyJWkENPLey1bw3MbF0t0xDLv2uuxn6c2
	untbG6M2X3jsVli9Tu1IjITIlElXR+OqTOk/rw9gMRoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUxTdxTG/d/7772Xxuq14rgRM0kX2MJENFE58YVs2QdujJvTL25LjDRy
	Y5tCMa1DWDKFvkSGm4MmLYHyUiE0DQWsFM3QgAQCySgMuwq+UZHZFZCXJgISKFDbJfty8jvP
	8+Tk+XAYUuoW7WaU6iuCRi3PlVFiLP7mmD4t/tArxYG6hQQYK+nBsLxUiqHmTgsFpe1VInjc
	5kQwsVyKYCVsJcHYGcGwYRqgYWn1JQ2RrgEEFq+JhJaOEgIWXZsUzPa9Q2CeDFBQOVOCIWT/
	FUF10ErDTH8WzE88FEHEP0XA0/dzCOyBTQICPTcQbFhUUN/gpiA8PEJCpfkxgtuTfhKmXVGz
	Y+AVgi6HjoJ/y++R4AtsgyfLIQr+NN+kYN5bQ8CCiwKbrksEtVYTAn3jHQoste0YOl8/oME7
	u07AuMVEgLP9a5iwBzF4yhuIaL9o6m4CWCv1RHRME2BufUjAqr2ZhqHGcQz24mSwDvtE8I+j
	mob1yYMQseXDgHOKBv/vZgxt8yOiL8yIXzHewnyz+z7BG//eoPiWuhbEh9dMiF9q0pO8sTy6
	9s2FSN7gvso3eeYofm15lOK73tswP9jA8RXDaXxntZ/mDd0v6G+P/iA+niPkKgsETXpmtljR
	P2jDl998XNj36EQxauLKEMNw7CFudu1EGYpjKPZT7tmzVTLG8WwS5/4tKIoxyXr2cGPefbH4
	Tlbgplqvx2TMJnONr1foGEvYI1xEdxfFmGP3ck5Xz39n4qK6b9KDYyxlD3PGkIEoR2Ib2tKM
	4pXqgjy5Mvfwfq1KUaRWFu6/mJ/XjqKvZP95veIPtOTL6kUsg2RbJd5kv0Iqkhdoi/J6EceQ
	snhJtmNcIZXkyIt+EjT5FzQ/5graXpTIYFmC5OQ5IVvKXpJfEVSCcFnQ/O8STNzuYnQmaHIl
	ln1lw4spnYmXVMeqrB69z7Bz1InSdYHztpyZNPXp9GFLpa6wP/Xi8+/eyk9Vf57RzagyPurY
	1fxL6WY4tcOxHQ2V/SXOHEtZufXZl63mPTsMfFKv4hNjf2Zove7q0LUKV1ZBd73j+9GEpH3o
	rP6cgkg/EBbejAzm3zwvw1qF/GAqqdHKPwDtVNImRgMAAA==
X-CFilter-Loop: Reflected
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>

With multi event sites for a single wait, dept allows to skip tracking
an event that is recoverable by other recover paths.

Introduce an API, event_site(), to skip tracking the event in the case.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/dept.h     | 30 ++++++++++++++++++++++++++++++
 include/linux/sched.h    |  6 ++++++
 kernel/dependency/dept.c | 20 ++++++++++++++++++++
 3 files changed, 56 insertions(+)

diff --git a/include/linux/dept.h b/include/linux/dept.h
index 25fdd324614a..0ac13129f308 100644
--- a/include/linux/dept.h
+++ b/include/linux/dept.h
@@ -487,6 +487,31 @@ extern void dept_task_exit(struct task_struct *t);
 extern void dept_free_range(void *start, unsigned int sz);
 extern void dept_mark_event_site_used(void *start, void *end);
 
+extern void disable_event_track(void);
+extern void enable_event_track(void);
+
+#define event_site(es, evt_func, ...)					\
+do {									\
+	unsigned long _flags;						\
+	bool _disable;							\
+									\
+	local_irq_save(_flags);						\
+	dept_event_site_used(es);					\
+	/*								\
+	 * If !list_empty(&(es)->dept_head), the event site can be	\
+	 * recovered by others.  Do not track event dependency if so.	\
+	 */								\
+	_disable = !list_empty(&(es)->dep_head);			\
+	if (_disable)							\
+		disable_event_track();					\
+									\
+	evt_func(__VA_ARGS__);						\
+									\
+	if (_disable)							\
+		enable_event_track();					\
+	local_irq_restore(_flags);					\
+} while (0)
+
 extern void dept_map_init(struct dept_map *m, struct dept_key *k, int sub_u, const char *n);
 extern void dept_map_reinit(struct dept_map *m, struct dept_key *k, int sub_u, const char *n);
 extern void dept_ext_wgen_init(struct dept_ext_wgen *ewg);
@@ -550,6 +575,11 @@ struct dept_event_site { };
 #define dept_task_exit(t)				do { } while (0)
 #define dept_free_range(s, sz)				do { } while (0)
 #define dept_mark_event_site_used(s, e)			do { } while (0)
+#define event_site(es, evt_func, ...)					\
+do {									\
+	(void)(es);							\
+	evt_func(__VA_ARGS__);						\
+} while (0)
 
 #define dept_map_init(m, k, su, n)			do { (void)(n); (void)(k); } while (0)
 #define dept_map_reinit(m, k, su, n)			do { (void)(n); (void)(k); } while (0)
diff --git a/include/linux/sched.h b/include/linux/sched.h
index a01c10f28dfd..24a9dc9d6f5f 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -876,6 +876,11 @@ struct dept_task {
 	 */
 	int				missing_ecxt;
 
+	/*
+	 * not to track events
+	 */
+	int				disable_event_track_cnt;
+
 	/*
 	 * for tracking IRQ-enable state
 	 */
@@ -913,6 +918,7 @@ struct dept_task {
 	.stage_wait_stack = NULL,				\
 	.stage_lock = (arch_spinlock_t)__ARCH_SPIN_LOCK_UNLOCKED,\
 	.missing_ecxt = 0,					\
+	.disable_event_track_cnt = 0,				\
 	.hardirqs_enabled = false,				\
 	.softirqs_enabled = false,				\
 	.task_exit = false,					\
diff --git a/kernel/dependency/dept.c b/kernel/dependency/dept.c
index 07d883579269..3c3ec2701bd6 100644
--- a/kernel/dependency/dept.c
+++ b/kernel/dependency/dept.c
@@ -2573,6 +2573,23 @@ static void __dept_wait(struct dept_map *m, unsigned long w_f,
 	}
 }
 
+void disable_event_track(void)
+{
+	dept_task()->disable_event_track_cnt++;
+}
+EXPORT_SYMBOL_GPL(disable_event_track);
+
+void enable_event_track(void)
+{
+	dept_task()->disable_event_track_cnt--;
+}
+EXPORT_SYMBOL_GPL(enable_event_track);
+
+static bool event_track_disabled(void)
+{
+	return !!dept_task()->disable_event_track_cnt;
+}
+
 /*
  * Called between dept_enter() and dept_exit().
  */
@@ -2585,6 +2602,9 @@ static void __dept_event(struct dept_map *m, struct dept_map *real_m,
 	struct dept_key *k;
 	int e;
 
+	if (event_track_disabled())
+		return;
+
 	e = find_first_bit(&e_f, DEPT_MAX_SUBCLASSES_EVT);
 
 	if (DEPT_WARN_ON(e >= DEPT_MAX_SUBCLASSES_EVT))
-- 
2.17.1


