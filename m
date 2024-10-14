Return-Path: <linux-modules+bounces-2155-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4A799D859
	for <lists+linux-modules@lfdr.de>; Mon, 14 Oct 2024 22:37:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D20DC1C21498
	for <lists+linux-modules@lfdr.de>; Mon, 14 Oct 2024 20:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 278A91D1F46;
	Mon, 14 Oct 2024 20:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lBxVShkl"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5D41D1512
	for <linux-modules@vger.kernel.org>; Mon, 14 Oct 2024 20:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728938218; cv=none; b=QG0DPUqpvZRuF1ktJfKGiSbN36E7lwCPdgaVCE1OUab1fuj5aUfzjAtEtYsC9lR4o+bEWYAeePc8PwVjNHbFYObftNUmd/kteK5eUDMqCTcWQ7NPohymnCauZ3zKEPJHrs+Y4P+KDbm9WJGQtRP0eeRBD1ZI4bjyVhbU12HhTnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728938218; c=relaxed/simple;
	bh=AwPJ5okAiE8pkGp62AEvRwUXg9wg1tw0bv0/pvtXTLA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZIYMxPTT0DMyUwSnHU2tjBRH1ZTopKC7uYFR2HaVyoD5zrxyjiha8AYK1MvYuUP0y3P04gw8kS8HH0jQhlSickjw/FpSYYE4g7f8VgQjD6Yb9Cu/dkHr9NteetspAwONcymccWTlG2WVdcPdjU/5QIUtePcmaMuKtVbZhV7UJa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lBxVShkl; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e293150c2c6so4821691276.1
        for <linux-modules@vger.kernel.org>; Mon, 14 Oct 2024 13:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728938215; x=1729543015; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TKWP9Sk5eHDUMKo1jGcXlNN0cIhyXRWL15bLbS6pMlc=;
        b=lBxVShklt1LrKbVFKICX5imZO/3fW9E49xZWvTyjZXNB4CvoTq3jSbzLI/jGaHkk7o
         2U+MVwZcGPSeX5INpWNQ43xAzP5DR9V/MhzBYeZIdTKvUFqcxqjMN3OM9G+DKHHsgLrW
         6R6tPT96Gam0WFCAaoHg6bkbNXXu1F79cTOwEb2JiJOUa9t/ao3m2c6anyGG7Q/gMo5J
         H7HYtvMC6As2DBVoSznaBndpQY+ck2pNjnDPVfW31qqjm8ZyJAZpFn9EFnZfP2ks1EA3
         +awFg1+a4tacjR849DTS4cEz/BoTdQLWHr6YwEdENK/jzwlQJcnweioEaQdkWVx0KjEB
         8UkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728938215; x=1729543015;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TKWP9Sk5eHDUMKo1jGcXlNN0cIhyXRWL15bLbS6pMlc=;
        b=ERKzX5qAQ0DhPcd934DcwNr5pE7z9ocLCRy0jyPTvS4GsjkGkfudMhZvMLHjpXct7P
         qxoYOWwDuG56B9Rq31chrdeEbC6gOQ6/A9j9cALUvvRdsSYLx7cjpSYlaySRlEwS/jvA
         ZNGBYS/8idwv7U6lzDS626g8bPW/EKbwn2uJJK1g+vazY3v4yFguB6pDdqJ7hpVzEYjl
         J8ILHg2yHU7y+YA3S/E5YscseCW0TgjfIcwXoQhA/62iI3poGhGihR3O/pQjv3UA6tvO
         aLuEOK4lo99WzVbPMkav6c6OimXoyrt1sNykfDeojUMlw/ESfIX2n+MCZD2SuWB/F5Id
         63jw==
X-Forwarded-Encrypted: i=1; AJvYcCXzIHsAJweyHn4QXXgyWhkkYI2dfj5yIFb1V6W0vyK8KoCAIpvecohl+xookYB76P7OJwg8slhuXTpXTnv+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6lrQUhUQFe56uRuLNMQS6o9jJBGNIZsxuyxH4tVFHe1T5P/XG
	bRM5HBZPS3QCqccTDpPP+bKf5klQlHPW7xiZkt13xHQS7uI+W/9tiANAxank3TRyFUSgTIyfrtZ
	86A==
X-Google-Smtp-Source: AGHT+IGBNIqOR+aetsuJD2kNoXsUQNEGFlkkyZON6PVRCQ5jP5534CpNDF7V47lVUomGWIrldnmJpVdzxLU=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:915:bdd7:e08a:7997])
 (user=surenb job=sendgmr) by 2002:a25:d094:0:b0:e28:f6f6:81a5 with SMTP id
 3f1490d57ef6-e2918e5da48mr9605276.0.1728938214624; Mon, 14 Oct 2024 13:36:54
 -0700 (PDT)
Date: Mon, 14 Oct 2024 13:36:43 -0700
In-Reply-To: <20241014203646.1952505-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241014203646.1952505-1-surenb@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241014203646.1952505-3-surenb@google.com>
Subject: [PATCH v3 2/5] alloc_tag: load module tags into separate contiguous memory
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, corbet@lwn.net, arnd@arndb.de, 
	mcgrof@kernel.org, rppt@kernel.org, paulmck@kernel.org, thuth@redhat.com, 
	tglx@linutronix.de, bp@alien8.de, xiongwei.song@windriver.com, 
	ardb@kernel.org, david@redhat.com, vbabka@suse.cz, mhocko@suse.com, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, dave@stgolabs.net, 
	willy@infradead.org, liam.howlett@oracle.com, pasha.tatashin@soleen.com, 
	souravpanda@google.com, keescook@chromium.org, dennis@kernel.org, 
	jhubbard@nvidia.com, yuzhao@google.com, vvvvvv@google.com, 
	rostedt@goodmis.org, iamjoonsoo.kim@lge.com, rientjes@google.com, 
	minchan@google.com, kaleshsingh@google.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kernel-team@android.com, surenb@google.com
Content-Type: text/plain; charset="UTF-8"

When a module gets unloaded there is a possibility that some of the
allocations it made are still used and therefore the allocation tags
corresponding to these allocations are still referenced. As such, the
memory for these tags can't be freed. This is currently handled as an
abnormal situation and module's data section is not being unloaded.
To handle this situation without keeping module's data in memory,
allow codetags with longer lifespan than the module to be loaded into
their own separate memory. The in-use memory areas and gaps after
module unloading in this separate memory are tracked using maple trees.
Allocation tags arrange their separate memory so that it is virtually
contiguous and that will allow simple allocation tag indexing later on
in this patchset. The size of this virtually contiguous memory is set
to store up to 100000 allocation tags.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/asm-generic/codetag.lds.h |  19 +++
 include/linux/alloc_tag.h         |  13 +-
 include/linux/codetag.h           |  37 ++++-
 kernel/module/main.c              |  74 +++++----
 lib/alloc_tag.c                   | 251 +++++++++++++++++++++++++++---
 lib/codetag.c                     | 100 +++++++++++-
 scripts/module.lds.S              |   5 +-
 7 files changed, 438 insertions(+), 61 deletions(-)

diff --git a/include/asm-generic/codetag.lds.h b/include/asm-generic/codetag.lds.h
index 64f536b80380..372c320c5043 100644
--- a/include/asm-generic/codetag.lds.h
+++ b/include/asm-generic/codetag.lds.h
@@ -11,4 +11,23 @@
 #define CODETAG_SECTIONS()		\
 	SECTION_WITH_BOUNDARIES(alloc_tags)
 
+/*
+ * Module codetags which aren't used after module unload, therefore have the
+ * same lifespan as the module and can be safely unloaded with the module.
+ */
+#define MOD_CODETAG_SECTIONS()
+
+#define MOD_SEPARATE_CODETAG_SECTION(_name)	\
+	.codetag.##_name : {			\
+		SECTION_WITH_BOUNDARIES(_name)	\
+	}
+
+/*
+ * For codetags which might be used after module unload, therefore might stay
+ * longer in memory. Each such codetag type has its own section so that we can
+ * unload them individually once unused.
+ */
+#define MOD_SEPARATE_CODETAG_SECTIONS()		\
+	MOD_SEPARATE_CODETAG_SECTION(alloc_tags)
+
 #endif /* __ASM_GENERIC_CODETAG_LDS_H */
diff --git a/include/linux/alloc_tag.h b/include/linux/alloc_tag.h
index 1f0a9ff23a2c..7431757999c5 100644
--- a/include/linux/alloc_tag.h
+++ b/include/linux/alloc_tag.h
@@ -30,6 +30,13 @@ struct alloc_tag {
 	struct alloc_tag_counters __percpu	*counters;
 } __aligned(8);
 
+struct alloc_tag_module_section {
+	unsigned long start_addr;
+	unsigned long end_addr;
+	/* used size */
+	unsigned long size;
+};
+
 #ifdef CONFIG_MEM_ALLOC_PROFILING_DEBUG
 
 #define CODETAG_EMPTY	((void *)1)
@@ -54,6 +61,8 @@ static inline void set_codetag_empty(union codetag_ref *ref) {}
 
 #ifdef CONFIG_MEM_ALLOC_PROFILING
 
+#define ALLOC_TAG_SECTION_NAME	"alloc_tags"
+
 struct codetag_bytes {
 	struct codetag *ct;
 	s64 bytes;
@@ -76,7 +85,7 @@ DECLARE_PER_CPU(struct alloc_tag_counters, _shared_alloc_tag);
 
 #define DEFINE_ALLOC_TAG(_alloc_tag)						\
 	static struct alloc_tag _alloc_tag __used __aligned(8)			\
-	__section("alloc_tags") = {						\
+	__section(ALLOC_TAG_SECTION_NAME) = {					\
 		.ct = CODE_TAG_INIT,						\
 		.counters = &_shared_alloc_tag };
 
@@ -85,7 +94,7 @@ DECLARE_PER_CPU(struct alloc_tag_counters, _shared_alloc_tag);
 #define DEFINE_ALLOC_TAG(_alloc_tag)						\
 	static DEFINE_PER_CPU(struct alloc_tag_counters, _alloc_tag_cntr);	\
 	static struct alloc_tag _alloc_tag __used __aligned(8)			\
-	__section("alloc_tags") = {						\
+	__section(ALLOC_TAG_SECTION_NAME) = {					\
 		.ct = CODE_TAG_INIT,						\
 		.counters = &_alloc_tag_cntr };
 
diff --git a/include/linux/codetag.h b/include/linux/codetag.h
index c2a579ccd455..fb4e7adfa746 100644
--- a/include/linux/codetag.h
+++ b/include/linux/codetag.h
@@ -35,8 +35,15 @@ struct codetag_type_desc {
 	size_t tag_size;
 	void (*module_load)(struct codetag_type *cttype,
 			    struct codetag_module *cmod);
-	bool (*module_unload)(struct codetag_type *cttype,
+	void (*module_unload)(struct codetag_type *cttype,
 			      struct codetag_module *cmod);
+#ifdef CONFIG_MODULES
+	void (*module_replaced)(struct module *mod, struct module *new_mod);
+	bool (*needs_section_mem)(struct module *mod, unsigned long size);
+	void *(*alloc_section_mem)(struct module *mod, unsigned long size,
+				   unsigned int prepend, unsigned long align);
+	void (*free_section_mem)(struct module *mod, bool unused);
+#endif
 };
 
 struct codetag_iterator {
@@ -71,11 +78,31 @@ struct codetag_type *
 codetag_register_type(const struct codetag_type_desc *desc);
 
 #if defined(CONFIG_CODE_TAGGING) && defined(CONFIG_MODULES)
+
+bool codetag_needs_module_section(struct module *mod, const char *name,
+				  unsigned long size);
+void *codetag_alloc_module_section(struct module *mod, const char *name,
+				   unsigned long size, unsigned int prepend,
+				   unsigned long align);
+void codetag_free_module_sections(struct module *mod);
+void codetag_module_replaced(struct module *mod, struct module *new_mod);
 void codetag_load_module(struct module *mod);
-bool codetag_unload_module(struct module *mod);
-#else
+void codetag_unload_module(struct module *mod);
+
+#else /* defined(CONFIG_CODE_TAGGING) && defined(CONFIG_MODULES) */
+
+static inline bool
+codetag_needs_module_section(struct module *mod, const char *name,
+			     unsigned long size) { return false; }
+static inline void *
+codetag_alloc_module_section(struct module *mod, const char *name,
+			     unsigned long size, unsigned int prepend,
+			     unsigned long align) { return NULL; }
+static inline void codetag_free_module_sections(struct module *mod) {}
+static inline void codetag_module_replaced(struct module *mod, struct module *new_mod) {}
 static inline void codetag_load_module(struct module *mod) {}
-static inline bool codetag_unload_module(struct module *mod) { return true; }
-#endif
+static inline void codetag_unload_module(struct module *mod) {}
+
+#endif /* defined(CONFIG_CODE_TAGGING) && defined(CONFIG_MODULES) */
 
 #endif /* _LINUX_CODETAG_H */
diff --git a/kernel/module/main.c b/kernel/module/main.c
index ef54733bd7d2..5569dd052511 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1254,22 +1254,17 @@ static int module_memory_alloc(struct module *mod, enum mod_mem_type type)
 	return 0;
 }
 
-static void module_memory_free(struct module *mod, enum mod_mem_type type,
-			       bool unload_codetags)
+static void module_memory_free(struct module *mod, enum mod_mem_type type)
 {
 	struct module_memory *mem = &mod->mem[type];
-	void *ptr = mem->base;
 
 	if (mem->is_rox)
 		vfree(mem->rw_copy);
 
-	if (!unload_codetags && mod_mem_type_is_core_data(type))
-		return;
-
-	execmem_free(ptr);
+	execmem_free(mem->base);
 }
 
-static void free_mod_mem(struct module *mod, bool unload_codetags)
+static void free_mod_mem(struct module *mod)
 {
 	for_each_mod_mem_type(type) {
 		struct module_memory *mod_mem = &mod->mem[type];
@@ -1280,25 +1275,20 @@ static void free_mod_mem(struct module *mod, bool unload_codetags)
 		/* Free lock-classes; relies on the preceding sync_rcu(). */
 		lockdep_free_key_range(mod_mem->base, mod_mem->size);
 		if (mod_mem->size)
-			module_memory_free(mod, type, unload_codetags);
+			module_memory_free(mod, type);
 	}
 
 	/* MOD_DATA hosts mod, so free it at last */
 	lockdep_free_key_range(mod->mem[MOD_DATA].base, mod->mem[MOD_DATA].size);
-	module_memory_free(mod, MOD_DATA, unload_codetags);
+	module_memory_free(mod, MOD_DATA);
 }
 
 /* Free a module, remove from lists, etc. */
 static void free_module(struct module *mod)
 {
-	bool unload_codetags;
-
 	trace_module_free(mod);
 
-	unload_codetags = codetag_unload_module(mod);
-	if (!unload_codetags)
-		pr_warn("%s: memory allocation(s) from the module still alive, cannot unload cleanly\n",
-			mod->name);
+	codetag_unload_module(mod);
 
 	mod_sysfs_teardown(mod);
 
@@ -1341,7 +1331,7 @@ static void free_module(struct module *mod)
 	kfree(mod->args);
 	percpu_modfree(mod);
 
-	free_mod_mem(mod, unload_codetags);
+	free_mod_mem(mod);
 }
 
 void *__symbol_get(const char *symbol)
@@ -1606,6 +1596,14 @@ static void __layout_sections(struct module *mod, struct load_info *info, bool i
 			if (WARN_ON_ONCE(type == MOD_INVALID))
 				continue;
 
+			/*
+			 * Do not allocate codetag memory as we load it into
+			 * preallocated contiguous memory. s->sh_entsize will
+			 * not be used for this section, so leave it as is.
+			 */
+			if (codetag_needs_module_section(mod, sname, s->sh_size))
+				continue;
+
 			s->sh_entsize = module_get_offset_and_type(mod, type, s, i);
 			pr_debug("\t%s\n", sname);
 		}
@@ -2280,6 +2278,7 @@ static int move_module(struct module *mod, struct load_info *info)
 	int i;
 	enum mod_mem_type t = 0;
 	int ret = -ENOMEM;
+	bool codetag_section_found = false;
 
 	for_each_mod_mem_type(type) {
 		if (!mod->mem[type].size) {
@@ -2291,7 +2290,7 @@ static int move_module(struct module *mod, struct load_info *info)
 		ret = module_memory_alloc(mod, type);
 		if (ret) {
 			t = type;
-			goto out_enomem;
+			goto out_err;
 		}
 	}
 
@@ -2300,15 +2299,33 @@ static int move_module(struct module *mod, struct load_info *info)
 	for (i = 0; i < info->hdr->e_shnum; i++) {
 		void *dest;
 		Elf_Shdr *shdr = &info->sechdrs[i];
-		enum mod_mem_type type = shdr->sh_entsize >> SH_ENTSIZE_TYPE_SHIFT;
-		unsigned long offset = shdr->sh_entsize & SH_ENTSIZE_OFFSET_MASK;
+		const char *sname;
 		unsigned long addr;
 
 		if (!(shdr->sh_flags & SHF_ALLOC))
 			continue;
 
-		addr = (unsigned long)mod->mem[type].base + offset;
-		dest = mod->mem[type].rw_copy + offset;
+		sname = info->secstrings + shdr->sh_name;
+		/*
+		 * Load codetag sections separately as they might still be used
+		 * after module unload.
+		 */
+		if (codetag_needs_module_section(mod, sname, shdr->sh_size)) {
+			dest = codetag_alloc_module_section(mod, sname, shdr->sh_size,
+					arch_mod_section_prepend(mod, i), shdr->sh_addralign);
+			if (IS_ERR(dest)) {
+				ret = PTR_ERR(dest);
+				goto out_err;
+			}
+			addr = (unsigned long)dest;
+			codetag_section_found = true;
+		} else {
+			enum mod_mem_type type = shdr->sh_entsize >> SH_ENTSIZE_TYPE_SHIFT;
+			unsigned long offset = shdr->sh_entsize & SH_ENTSIZE_OFFSET_MASK;
+
+			addr = (unsigned long)mod->mem[type].base + offset;
+			dest = mod->mem[type].rw_copy + offset;
+		}
 
 		if (shdr->sh_type != SHT_NOBITS) {
 			/*
@@ -2320,7 +2337,7 @@ static int move_module(struct module *mod, struct load_info *info)
 			if (i == info->index.mod &&
 			   (WARN_ON_ONCE(shdr->sh_size != sizeof(struct module)))) {
 				ret = -ENOEXEC;
-				goto out_enomem;
+				goto out_err;
 			}
 			memcpy(dest, (void *)shdr->sh_addr, shdr->sh_size);
 		}
@@ -2336,9 +2353,12 @@ static int move_module(struct module *mod, struct load_info *info)
 	}
 
 	return 0;
-out_enomem:
+out_err:
 	for (t--; t >= 0; t--)
-		module_memory_free(mod, t, true);
+		module_memory_free(mod, t);
+	if (codetag_section_found)
+		codetag_free_module_sections(mod);
+
 	return ret;
 }
 
@@ -2459,6 +2479,8 @@ static struct module *layout_and_allocate(struct load_info *info, int flags)
 	/* Module has been copied to its final place now: return it. */
 	mod = (void *)info->sechdrs[info->index.mod].sh_addr;
 	kmemleak_load_module(mod, info);
+	codetag_module_replaced(info->mod, mod);
+
 	return mod;
 }
 
@@ -2468,7 +2490,7 @@ static void module_deallocate(struct module *mod, struct load_info *info)
 	percpu_modfree(mod);
 	module_arch_freeing_init(mod);
 
-	free_mod_mem(mod, true);
+	free_mod_mem(mod);
 }
 
 int __weak module_finalize(const Elf_Ehdr *hdr,
diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
index 81e5f9a70f22..b10e7f17eeda 100644
--- a/lib/alloc_tag.c
+++ b/lib/alloc_tag.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include <linux/alloc_tag.h>
+#include <linux/execmem.h>
 #include <linux/fs.h>
 #include <linux/gfp.h>
 #include <linux/module.h>
@@ -149,31 +150,231 @@ static void __init procfs_init(void)
 	proc_create_seq("allocinfo", 0400, NULL, &allocinfo_seq_op);
 }
 
-static bool alloc_tag_module_unload(struct codetag_type *cttype,
-				    struct codetag_module *cmod)
+#ifdef CONFIG_MODULES
+
+static struct maple_tree mod_area_mt = MTREE_INIT(mod_area_mt, MT_FLAGS_ALLOC_RANGE);
+/* A dummy object used to indicate an unloaded module */
+static struct module unloaded_mod;
+/* A dummy object used to indicate a module prepended area */
+static struct module prepend_mod;
+
+static struct alloc_tag_module_section module_tags;
+
+static bool needs_section_mem(struct module *mod, unsigned long size)
+{
+	return size >= sizeof(struct alloc_tag);
+}
+
+/* Called under RCU read lock */
+static void clean_unused_module_areas_locked(void)
+{
+	MA_STATE(mas, &mod_area_mt, 0, module_tags.size);
+	struct module *val;
+
+	mas_for_each(&mas, val, module_tags.size) {
+		if (val == &unloaded_mod) {
+			struct alloc_tag *tag;
+			struct alloc_tag *last;
+			bool unused = true;
+
+			tag = (struct alloc_tag *)(module_tags.start_addr + mas.index);
+			last = (struct alloc_tag *)(module_tags.start_addr + mas.last);
+			while (tag <= last) {
+				struct alloc_tag_counters counter;
+
+				counter = alloc_tag_read(tag);
+				if (counter.bytes) {
+					unused = false;
+					break;
+				}
+				tag++;
+			}
+			if (unused)
+				mas_erase(&mas);
+		}
+	}
+}
+
+static void *reserve_module_tags(struct module *mod, unsigned long size,
+				 unsigned int prepend, unsigned long align)
+{
+	unsigned long section_size = module_tags.end_addr - module_tags.start_addr;
+	MA_STATE(mas, &mod_area_mt, 0, section_size - 1);
+	bool cleanup_done = false;
+	unsigned long offset;
+	void *ret;
+
+	/* If no tags return NULL */
+	if (size < sizeof(struct alloc_tag))
+		return NULL;
+
+	/*
+	 * align is always power of 2, so we can use IS_ALIGNED and ALIGN.
+	 * align 0 or 1 means no alignment, to simplify set to 1.
+	 */
+	if (!align)
+		align = 1;
+
+	mas_lock(&mas);
+repeat:
+	/* Try finding exact size and hope the start is aligned */
+	if (mas_empty_area(&mas, 0, section_size - 1, prepend + size))
+		goto cleanup;
+
+	if (IS_ALIGNED(mas.index + prepend, align))
+		goto found;
+
+	/* Try finding larger area to align later */
+	mas_reset(&mas);
+	if (!mas_empty_area(&mas, 0, section_size - 1,
+			    size + prepend + align - 1))
+		goto found;
+
+cleanup:
+	/* No free area, try cleanup stale data and repeat the search once */
+	if (!cleanup_done) {
+		clean_unused_module_areas_locked();
+		cleanup_done = true;
+		mas_reset(&mas);
+		goto repeat;
+	} else {
+		ret = ERR_PTR(-ENOMEM);
+		goto out;
+	}
+
+found:
+	offset = mas.index;
+	offset += prepend;
+	offset = ALIGN(offset, align);
+
+	if (offset != mas.index) {
+		unsigned long pad_start = mas.index;
+
+		mas.last = offset - 1;
+		mas_store(&mas, &prepend_mod);
+		if (mas_is_err(&mas)) {
+			ret = ERR_PTR(xa_err(mas.node));
+			goto out;
+		}
+		mas.index = offset;
+		mas.last = offset + size - 1;
+		mas_store(&mas, mod);
+		if (mas_is_err(&mas)) {
+			ret = ERR_PTR(xa_err(mas.node));
+			mas.index = pad_start;
+			mas_erase(&mas);
+			goto out;
+		}
+
+	} else {
+		mas.last = offset + size - 1;
+		mas_store(&mas, mod);
+		if (mas_is_err(&mas)) {
+			ret = ERR_PTR(xa_err(mas.node));
+			goto out;
+		}
+	}
+
+	if (module_tags.size < offset + size)
+		module_tags.size = offset + size;
+
+	ret = (struct alloc_tag *)(module_tags.start_addr + offset);
+out:
+	mas_unlock(&mas);
+
+	return ret;
+}
+
+static void release_module_tags(struct module *mod, bool unused)
 {
-	struct codetag_iterator iter = codetag_get_ct_iter(cttype);
-	struct alloc_tag_counters counter;
-	bool module_unused = true;
+	MA_STATE(mas, &mod_area_mt, module_tags.size, module_tags.size);
+	struct alloc_tag *last;
 	struct alloc_tag *tag;
-	struct codetag *ct;
+	struct module *val;
 
-	for (ct = codetag_next_ct(&iter); ct; ct = codetag_next_ct(&iter)) {
-		if (iter.cmod != cmod)
-			continue;
+	if (unused)
+		return;
+
+	mas_lock(&mas);
+	mas_for_each_rev(&mas, val, 0)
+		if (val == mod)
+			break;
+
+	if (!val) /* module not found */
+		goto out;
+
+	tag = (struct alloc_tag *)(module_tags.start_addr + mas.index);
+	last = (struct alloc_tag *)(module_tags.start_addr + mas.last);
+
+	unused = true;
+	while (tag <= last) {
+		struct alloc_tag_counters counter;
 
-		tag = ct_to_alloc_tag(ct);
 		counter = alloc_tag_read(tag);
+		if (counter.bytes) {
+			struct codetag *ct = &tag->ct;
+
+			pr_info("%s:%u module %s func:%s has %llu allocated at module unload\n",
+				ct->filename, ct->lineno, ct->modname,
+				ct->function, counter.bytes);
+			unused = false;
+			break;
+		}
+		tag++;
+	}
 
-		if (WARN(counter.bytes,
-			 "%s:%u module %s func:%s has %llu allocated at module unload",
-			 ct->filename, ct->lineno, ct->modname, ct->function, counter.bytes))
-			module_unused = false;
+	mas_store(&mas, unused ? NULL : &unloaded_mod);
+	val = mas_prev_range(&mas, 0);
+	if (val == &prepend_mod)
+		mas_store(&mas, NULL);
+out:
+	mas_unlock(&mas);
+}
+
+static void replace_module(struct module *mod, struct module *new_mod)
+{
+	MA_STATE(mas, &mod_area_mt, 0, module_tags.size);
+	struct module *val;
+
+	mas_lock(&mas);
+	mas_for_each(&mas, val, module_tags.size) {
+		if (val != mod)
+			continue;
+
+		mas_store_gfp(&mas, new_mod, GFP_KERNEL);
+		break;
 	}
+	mas_unlock(&mas);
+}
 
-	return module_unused;
+#define MODULE_ALLOC_TAG_VMAP_SIZE (100000 * sizeof(struct alloc_tag))
+
+static int __init alloc_mod_tags_mem(void)
+{
+	/* Allocate space to copy allocation tags */
+	module_tags.start_addr = (unsigned long)execmem_alloc(EXECMEM_MODULE_DATA,
+							      MODULE_ALLOC_TAG_VMAP_SIZE);
+	if (!module_tags.start_addr)
+		return -ENOMEM;
+
+	module_tags.end_addr = module_tags.start_addr + MODULE_ALLOC_TAG_VMAP_SIZE;
+
+	return 0;
+}
+
+static void __init free_mod_tags_mem(void)
+{
+	execmem_free((void *)module_tags.start_addr);
+	module_tags.start_addr = 0;
 }
 
+#else /* CONFIG_MODULES */
+
+static inline int alloc_mod_tags_mem(void) { return 0; }
+static inline void free_mod_tags_mem(void) {}
+
+#endif /* CONFIG_MODULES */
+
 #ifdef CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT
 static bool mem_profiling_support __meminitdata = true;
 #else
@@ -255,14 +456,26 @@ static inline void sysctl_init(void) {}
 static int __init alloc_tag_init(void)
 {
 	const struct codetag_type_desc desc = {
-		.section	= "alloc_tags",
-		.tag_size	= sizeof(struct alloc_tag),
-		.module_unload	= alloc_tag_module_unload,
+		.section		= ALLOC_TAG_SECTION_NAME,
+		.tag_size		= sizeof(struct alloc_tag),
+#ifdef CONFIG_MODULES
+		.needs_section_mem	= needs_section_mem,
+		.alloc_section_mem	= reserve_module_tags,
+		.free_section_mem	= release_module_tags,
+		.module_replaced	= replace_module,
+#endif
 	};
+	int res;
+
+	res = alloc_mod_tags_mem();
+	if (res)
+		return res;
 
 	alloc_tag_cttype = codetag_register_type(&desc);
-	if (IS_ERR(alloc_tag_cttype))
+	if (IS_ERR(alloc_tag_cttype)) {
+		free_mod_tags_mem();
 		return PTR_ERR(alloc_tag_cttype);
+	}
 
 	sysctl_init();
 	procfs_init();
diff --git a/lib/codetag.c b/lib/codetag.c
index d1fbbb7c2ec3..3f3a4f4ca72d 100644
--- a/lib/codetag.c
+++ b/lib/codetag.c
@@ -207,6 +207,94 @@ static int codetag_module_init(struct codetag_type *cttype, struct module *mod)
 }
 
 #ifdef CONFIG_MODULES
+#define CODETAG_SECTION_PREFIX	".codetag."
+
+/* Some codetag types need a separate module section */
+bool codetag_needs_module_section(struct module *mod, const char *name,
+				  unsigned long size)
+{
+	const char *type_name;
+	struct codetag_type *cttype;
+	bool ret = false;
+
+	if (strncmp(name, CODETAG_SECTION_PREFIX, strlen(CODETAG_SECTION_PREFIX)))
+		return false;
+
+	type_name = name + strlen(CODETAG_SECTION_PREFIX);
+	mutex_lock(&codetag_lock);
+	list_for_each_entry(cttype, &codetag_types, link) {
+		if (strcmp(type_name, cttype->desc.section) == 0) {
+			if (!cttype->desc.needs_section_mem)
+				break;
+
+			down_write(&cttype->mod_lock);
+			ret = cttype->desc.needs_section_mem(mod, size);
+			up_write(&cttype->mod_lock);
+			break;
+		}
+	}
+	mutex_unlock(&codetag_lock);
+
+	return ret;
+}
+
+void *codetag_alloc_module_section(struct module *mod, const char *name,
+				   unsigned long size, unsigned int prepend,
+				   unsigned long align)
+{
+	const char *type_name = name + strlen(CODETAG_SECTION_PREFIX);
+	struct codetag_type *cttype;
+	void *ret = NULL;
+
+	mutex_lock(&codetag_lock);
+	list_for_each_entry(cttype, &codetag_types, link) {
+		if (strcmp(type_name, cttype->desc.section) == 0) {
+			if (WARN_ON(!cttype->desc.alloc_section_mem))
+				break;
+
+			down_write(&cttype->mod_lock);
+			ret = cttype->desc.alloc_section_mem(mod, size, prepend, align);
+			up_write(&cttype->mod_lock);
+			break;
+		}
+	}
+	mutex_unlock(&codetag_lock);
+
+	return ret;
+}
+
+void codetag_free_module_sections(struct module *mod)
+{
+	struct codetag_type *cttype;
+
+	mutex_lock(&codetag_lock);
+	list_for_each_entry(cttype, &codetag_types, link) {
+		if (!cttype->desc.free_section_mem)
+			continue;
+
+		down_write(&cttype->mod_lock);
+		cttype->desc.free_section_mem(mod, true);
+		up_write(&cttype->mod_lock);
+	}
+	mutex_unlock(&codetag_lock);
+}
+
+void codetag_module_replaced(struct module *mod, struct module *new_mod)
+{
+	struct codetag_type *cttype;
+
+	mutex_lock(&codetag_lock);
+	list_for_each_entry(cttype, &codetag_types, link) {
+		if (!cttype->desc.module_replaced)
+			continue;
+
+		down_write(&cttype->mod_lock);
+		cttype->desc.module_replaced(mod, new_mod);
+		up_write(&cttype->mod_lock);
+	}
+	mutex_unlock(&codetag_lock);
+}
+
 void codetag_load_module(struct module *mod)
 {
 	struct codetag_type *cttype;
@@ -220,13 +308,12 @@ void codetag_load_module(struct module *mod)
 	mutex_unlock(&codetag_lock);
 }
 
-bool codetag_unload_module(struct module *mod)
+void codetag_unload_module(struct module *mod)
 {
 	struct codetag_type *cttype;
-	bool unload_ok = true;
 
 	if (!mod)
-		return true;
+		return;
 
 	/* await any module's kfree_rcu() operations to complete */
 	kvfree_rcu_barrier();
@@ -246,18 +333,17 @@ bool codetag_unload_module(struct module *mod)
 		}
 		if (found) {
 			if (cttype->desc.module_unload)
-				if (!cttype->desc.module_unload(cttype, cmod))
-					unload_ok = false;
+				cttype->desc.module_unload(cttype, cmod);
 
 			cttype->count -= range_size(cttype, &cmod->range);
 			idr_remove(&cttype->mod_idr, mod_id);
 			kfree(cmod);
 		}
 		up_write(&cttype->mod_lock);
+		if (found && cttype->desc.free_section_mem)
+			cttype->desc.free_section_mem(mod, false);
 	}
 	mutex_unlock(&codetag_lock);
-
-	return unload_ok;
 }
 #endif /* CONFIG_MODULES */
 
diff --git a/scripts/module.lds.S b/scripts/module.lds.S
index 3f43edef813c..711c6e029936 100644
--- a/scripts/module.lds.S
+++ b/scripts/module.lds.S
@@ -50,7 +50,7 @@ SECTIONS {
 	.data : {
 		*(.data .data.[0-9a-zA-Z_]*)
 		*(.data..L*)
-		CODETAG_SECTIONS()
+		MOD_CODETAG_SECTIONS()
 	}
 
 	.rodata : {
@@ -59,9 +59,10 @@ SECTIONS {
 	}
 #else
 	.data : {
-		CODETAG_SECTIONS()
+		MOD_CODETAG_SECTIONS()
 	}
 #endif
+	MOD_SEPARATE_CODETAG_SECTIONS()
 }
 
 /* bring in arch-specific sections */
-- 
2.47.0.rc1.288.g06298d1525-goog


