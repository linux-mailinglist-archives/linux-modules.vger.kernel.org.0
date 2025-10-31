Return-Path: <linux-modules+bounces-4670-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6EAC23945
	for <lists+linux-modules@lfdr.de>; Fri, 31 Oct 2025 08:41:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C441B3A99D9
	for <lists+linux-modules@lfdr.de>; Fri, 31 Oct 2025 07:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFCE6329E74;
	Fri, 31 Oct 2025 07:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O+lRAaPr"
X-Original-To: linux-modules@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C48329C6B
	for <linux-modules@vger.kernel.org>; Fri, 31 Oct 2025 07:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761896495; cv=none; b=bBO5S/mkjh74mAWjrseCDqdbSizP/V0UJrM7djDNI1yUTGrJN4YvezjNZz5CCO9e7LpD8QLAL5gafijWsWhUyWBfs3wy2Ic8ig89sC4vlDGhMXLPkrWr0dJ9Ntbi9WoU+xmdIn+Us7/cRDjjmhOv3LH9RaUb4yjlJw9lTH0Noiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761896495; c=relaxed/simple;
	bh=1DWKSJF8OEYqjcJrqFR6FrT+o8y4zSzWVVe3d/IbG9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZMWHWVStzSqyU/btlIqpMuWcJvP4+6ZxgotBdGPdk/uOElZaItWHX5Xd3HX6WJo/5SdRkzmt6HD2O3zqLhKvZyxlXdxazng4CT0N4nAdFNZ3g+Z8p7pg0GGJ3MBzmE2cWBScuSe6NUcXQldNPNhl7Qasdvoh3nVuzrdD5h+R2uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O+lRAaPr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761896492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x1U8+0OYOpaOguLvykcf3aLOzyj6wguuzkEUvWSZdG8=;
	b=O+lRAaPrh/jG5S6qSqYbxC8Lf5TtYALWnlaSQU5iK5nrJx+wTgT4DDVxSQpvMpQ2MlR7+R
	D4D9/sJaoFNKf7gvPgv5ordE8701aWtnN1pwPTXCiHlO4SFkwg7tRFAyW1SvmpRmPidYJs
	kFmJ+zNmQ4gosOzcLUIOoyfi/oqKyLI=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-We2HAFTePhauYd1mNAZuiA-1; Fri, 31 Oct 2025 03:41:30 -0400
X-MC-Unique: We2HAFTePhauYd1mNAZuiA-1
X-Mimecast-MFC-AGG-ID: We2HAFTePhauYd1mNAZuiA_1761896490
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-294fca58e78so13440325ad.1
        for <linux-modules@vger.kernel.org>; Fri, 31 Oct 2025 00:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761896489; x=1762501289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x1U8+0OYOpaOguLvykcf3aLOzyj6wguuzkEUvWSZdG8=;
        b=Q13XOJlQBKVVQxbDsj/E4s5nnQ6pbtj5bTb9ZCMDYWp7cSVBHuzoSOwiLlAQJE6i7/
         MB62u3wfBCcHLY7KhLlI4DsbqPKvQVIG969y/JJuDlp9bBHKbG9/N4F5MEvl+BAqWOur
         TXD+tUOURMz8/K/kyibYk5h3XwsJ2VUSionh/lEd2ABOJ9PIZX1l8JtRLVQsibSeboRA
         k93QACTX3VXr6M0gYq6KNOank/1X66y6099vBM/ZKtu8s3FOGZWHizbDq8nFr/4BnLKo
         pIeNPwX7YjFyDP7RPiAqhq9kJM0ge2GcFhv57hmiLcQW0u/lV16HahyqWj8F5T1CCeAm
         R6kA==
X-Forwarded-Encrypted: i=1; AJvYcCX1rdUO+/4Cin98aDesaSneFQt4BaN+XxL9YdirKsTWH9RMci0qFPg+WmhL166uYaNTCVs7eqwqbjmHbLp4@vger.kernel.org
X-Gm-Message-State: AOJu0YwWN2f5tMv0EyEN25UpjSbmoJeeW2fYv3wmYL/Hnp9fobL5roe/
	6R6YEziTeyUjQ5XJSrxxjXYraAdRvtR9FRMLEKKTo26ANMLEPy8YWeW0JxoVMx+BkQ48i8iROyp
	J8NsJ/6tU50NGX15VVjeSycQw2qZE55onfEluIa/mq2KsTU3QVSuNq95BavRSxLQYg2U=
X-Gm-Gg: ASbGncu539JwIkpba9Cb+LMEL4czQKjTect2/IzQVGCeDoAkQuLTM30A9vuQE8kE5Xn
	twrXp7XzQ8d4j5Mtq2rHX24v1jzpdIqQFwzwW5CROhJSITLujB+iEumptlfjcg+jtpp+4jEpja2
	gRNS5ehhdKMxRTyvPpMOlHasSXM8unPxGnII+cJXwKWaVIfL8ChdYha8wxr09UYvt4lKPRX+wD2
	RkfBQiLEc9bVAbn5CCugtNVac94fH0ASlTgDwsSX5eEb6mtCsVZKdTsriA/ZKhDh3RSw1DjQGSK
	w4VUKRGgsENLohY9LsS3c5jzySEZlcnMzO60I40gfgXraE+n8H1ry76Z+tkZ8HizTw==
X-Received: by 2002:a17:903:2c7:b0:26c:e270:6dad with SMTP id d9443c01a7336-2951a4fcb51mr32136195ad.60.1761896489184;
        Fri, 31 Oct 2025 00:41:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUvnpn03zGYM9wkLBYIw6ClAfviiBezzYgMRg1RS9G1UI4cgyI/q3aZ1UE8CEnS8k4YLVEmQ==
X-Received: by 2002:a17:903:2c7:b0:26c:e270:6dad with SMTP id d9443c01a7336-2951a4fcb51mr32135925ad.60.1761896488704;
        Fri, 31 Oct 2025 00:41:28 -0700 (PDT)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295268b43d7sm13094335ad.35.2025.10.31.00.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 00:41:28 -0700 (PDT)
From: Coiby Xu <coxu@redhat.com>
To: linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Mimi Zohar <zohar@linux.ibm.com>
Cc: Karel Srot <ksrot@redhat.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-modules@vger.kernel.org (open list:MODULE SUPPORT)
Subject: [PATCH v2] lsm,ima: new LSM hook security_kernel_module_read_file to access decompressed kernel module
Date: Fri, 31 Oct 2025 15:40:15 +0800
Message-ID: <20251031074016.1975356-1-coxu@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250928030358.3873311-1-coxu@redhat.com>
References: <20250928030358.3873311-1-coxu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, when in-kernel module decompression (CONFIG_MODULE_DECOMPRESS)
is enabled, IMA has no way to verify the appended module signature as it
can't decompress the module.

Define a new LSM hook security_kernel_module_read_file which will be
called after kernel module decompression is done so IMA can access the
decompressed kernel module to verify the appended signature.

Since IMA can access both xattr and appended kernel module signature
with the new LSM hook, it no longer uses the security_kernel_post_read_file
LSM hook for kernel module loading.

Before enabling in-kernel module decompression, a kernel module in
initramfs can still be loaded with ima_policy=secure_boot. So adjust the
kernel module rule in secure_boot policy to allow either an IMA
signature OR an appended signature i.e. to use
"appraise func=MODULE_CHECK appraise_type=imasig|modsig".

Reported-by: Karel Srot <ksrot@redhat.com>
Suggested-by: Mimi Zohar <zohar@linux.ibm.com>
Signed-off-by: Coiby Xu <coxu@redhat.com>
---
v1: https://lore.kernel.org/linux-integrity/20250928030358.3873311-1-coxu@redhat.com/

 include/linux/lsm_hook_defs.h       |  2 ++
 include/linux/security.h            |  7 +++++++
 kernel/module/main.c                | 10 +++++++++-
 security/integrity/ima/ima_main.c   | 26 ++++++++++++++++++++++++++
 security/integrity/ima/ima_policy.c |  2 +-
 security/security.c                 | 17 +++++++++++++++++
 6 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
index 8c42b4bde09c..ced42eb8b618 100644
--- a/include/linux/lsm_hook_defs.h
+++ b/include/linux/lsm_hook_defs.h
@@ -232,6 +232,8 @@ LSM_HOOK(int, 0, kernel_read_file, struct file *file,
 	 enum kernel_read_file_id id, bool contents)
 LSM_HOOK(int, 0, kernel_post_read_file, struct file *file, char *buf,
 	 loff_t size, enum kernel_read_file_id id)
+LSM_HOOK(int, 0, kernel_module_read_file, struct file *file, char *buf,
+	 loff_t size)
 LSM_HOOK(int, 0, task_fix_setuid, struct cred *new, const struct cred *old,
 	 int flags)
 LSM_HOOK(int, 0, task_fix_setgid, struct cred *new, const struct cred * old,
diff --git a/include/linux/security.h b/include/linux/security.h
index 92ac3f27b973..e47951292c73 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -508,6 +508,7 @@ int security_kernel_read_file(struct file *file, enum kernel_read_file_id id,
 			      bool contents);
 int security_kernel_post_read_file(struct file *file, char *buf, loff_t size,
 				   enum kernel_read_file_id id);
+int security_kernel_module_read_file(struct file *file, char *buf, loff_t size);
 int security_task_fix_setuid(struct cred *new, const struct cred *old,
 			     int flags);
 int security_task_fix_setgid(struct cred *new, const struct cred *old,
@@ -1295,6 +1296,12 @@ static inline int security_kernel_post_read_file(struct file *file,
 	return 0;
 }
 
+static inline int security_kernel_module_read_file(struct file *file,
+						   char *buf, loff_t size)
+{
+	return 0;
+}
+
 static inline int security_task_fix_setuid(struct cred *new,
 					   const struct cred *old,
 					   int flags)
diff --git a/kernel/module/main.c b/kernel/module/main.c
index c66b26184936..40bc86fa7384 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -3678,6 +3678,7 @@ static int init_module_from_file(struct file *f, const char __user * uargs, int
 	struct load_info info = { };
 	void *buf = NULL;
 	int len;
+	int err;
 
 	len = kernel_read_file(f, 0, &buf, INT_MAX, NULL, READING_MODULE);
 	if (len < 0) {
@@ -3686,7 +3687,7 @@ static int init_module_from_file(struct file *f, const char __user * uargs, int
 	}
 
 	if (flags & MODULE_INIT_COMPRESSED_FILE) {
-		int err = module_decompress(&info, buf, len);
+		err = module_decompress(&info, buf, len);
 		vfree(buf); /* compressed data is no longer needed */
 		if (err) {
 			mod_stat_inc(&failed_decompress);
@@ -3698,6 +3699,13 @@ static int init_module_from_file(struct file *f, const char __user * uargs, int
 		info.len = len;
 	}
 
+	err = security_kernel_module_read_file(f, (char *)info.hdr, info.len);
+	if (err) {
+		mod_stat_inc(&failed_kreads);
+		free_copy(&info, flags);
+		return err;
+	}
+
 	return load_module(&info, uargs, flags);
 }
 
diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
index cdd225f65a62..53d2e90176ea 100644
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@ -635,6 +635,27 @@ static int ima_file_check(struct file *file, int mask)
 					   MAY_APPEND), FILE_CHECK);
 }
 
+/**
+ * ima_read_kernel_module - collect/appraise/audit measurement
+ * @file: file pointer to the module.
+ * @buf: buffer containing module data (possibly decompressed).
+ * @size: size of the buffer.
+ *
+ * This IMA hook for kernel_module_read_file LSM hook is called after a kernel
+ * module has been read into memory and (if applicable) decompressed. It
+ * measures and/or appraises the module based on the IMA policy.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+static int ima_read_kernel_module(struct file *file, char *buf, loff_t size)
+{
+	struct lsm_prop prop;
+
+	security_current_getlsmprop_subj(&prop);
+	return process_measurement(file, current_cred(), &prop, buf, size,
+				   MAY_READ, MODULE_CHECK);
+}
+
 static int __ima_inode_hash(struct inode *inode, struct file *file, char *buf,
 			    size_t buf_size)
 {
@@ -881,6 +902,10 @@ static int ima_post_read_file(struct file *file, char *buf, loff_t size,
 	enum ima_hooks func;
 	struct lsm_prop prop;
 
+	/* kernel module will be addressed in ima_read_kernel_module */
+	if (read_id == READING_MODULE)
+		return 0;
+
 	/* permit signed certs */
 	if (!file && read_id == READING_X509_CERTIFICATE)
 		return 0;
@@ -1250,6 +1275,7 @@ static struct security_hook_list ima_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(kernel_load_data, ima_load_data),
 	LSM_HOOK_INIT(kernel_post_load_data, ima_post_load_data),
 	LSM_HOOK_INIT(kernel_read_file, ima_read_file),
+	LSM_HOOK_INIT(kernel_module_read_file, ima_read_kernel_module),
 	LSM_HOOK_INIT(kernel_post_read_file, ima_post_read_file),
 	LSM_HOOK_INIT(path_post_mknod, ima_post_path_mknod),
 #ifdef CONFIG_IMA_MEASURE_ASYMMETRIC_KEYS
diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
index 128fab897930..2c9bdc618ac9 100644
--- a/security/integrity/ima/ima_policy.c
+++ b/security/integrity/ima/ima_policy.c
@@ -241,7 +241,7 @@ static struct ima_rule_entry build_appraise_rules[] __ro_after_init = {
 
 static struct ima_rule_entry secure_boot_rules[] __ro_after_init = {
 	{.action = APPRAISE, .func = MODULE_CHECK,
-	 .flags = IMA_FUNC | IMA_DIGSIG_REQUIRED},
+	 .flags = IMA_FUNC | IMA_DIGSIG_REQUIRED | IMA_MODSIG_ALLOWED | IMA_CHECK_BLACKLIST},
 	{.action = APPRAISE, .func = FIRMWARE_CHECK,
 	 .flags = IMA_FUNC | IMA_DIGSIG_REQUIRED},
 	{.action = APPRAISE, .func = KEXEC_KERNEL_CHECK,
diff --git a/security/security.c b/security/security.c
index 4d3c03a4524c..311ba63a8889 100644
--- a/security/security.c
+++ b/security/security.c
@@ -3442,6 +3442,23 @@ int security_kernel_post_read_file(struct file *file, char *buf, loff_t size,
 }
 EXPORT_SYMBOL_GPL(security_kernel_post_read_file);
 
+/**
+ * security_kernel_module_read_file() - Read a kernel module loaded by finit_module
+ * @file: file
+ * @buf: contents of decompressed kernel module
+ * @size: size of decompressed kernel module
+ *
+ * Read a kernel module loaded by the finit_module syscall. Unlike
+ * security_kernel_post_read_file, it has access to the decompressed kernel module.
+ *
+ * Return: Returns 0 if permission is granted.
+ */
+int security_kernel_module_read_file(struct file *file, char *buf, loff_t size)
+{
+	return call_int_hook(kernel_module_read_file, file, buf, size);
+}
+EXPORT_SYMBOL_GPL(security_kernel_module_read_file);
+
 /**
  * security_kernel_load_data() - Load data provided by userspace
  * @id: data identifier

base-commit: e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
-- 
2.51.0


