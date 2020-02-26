Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2219616F8E8
	for <lists+linux-modules@lfdr.de>; Wed, 26 Feb 2020 09:04:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727335AbgBZIEs (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Wed, 26 Feb 2020 03:04:48 -0500
Received: from vmicros1.altlinux.org ([194.107.17.57]:49324 "EHLO
        vmicros1.altlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727223AbgBZIEs (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Wed, 26 Feb 2020 03:04:48 -0500
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
        by vmicros1.altlinux.org (Postfix) with ESMTP id CEAA772CCEF
        for <linux-modules@vger.kernel.org>; Wed, 26 Feb 2020 11:04:45 +0300 (MSK)
Received: from x230.localdomain (109-252-52-89.nat.spd-mgts.ru [109.252.52.89])
        by imap.altlinux.org (Postfix) with ESMTPSA id 9762C4A4AFB;
        Wed, 26 Feb 2020 11:04:45 +0300 (MSK)
Date:   Wed, 26 Feb 2020 11:04:49 +0300
From:   "Anton V. Boyarshinov" <boyarsh@altlinux.org>
To:     linux-modules@vger.kernel.org
Cc:     legion@altlinux.org
Subject: [PATCH] Add kernel-version dependent configuration directory
Message-ID: <20200226080449.6c997cfd@x230.localdomain>
Organization: ALT Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-alt-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux-modules@vger.kernel.org
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

In some cases it looks reasonable to have kernel-version dependent
modules configuration: blacklists, options and so on. This commit
introduces additional configuration directories:
* /lib/modprobe.d/`uname -r`
* /etc/modprobe.d/`uname -r`

Signed-off-by: Anton V. Boyarshinov <boyarsh@altlinux.org>
---
 libkmod/libkmod-config.c |  5 +----
 libkmod/libkmod.c        | 44 ++++++++++++++++++++++++++++++++++++----
 man/modprobe.d.xml       |  2 ++
 3 files changed, 43 insertions(+), 8 deletions(-)

diff --git a/libkmod/libkmod-config.c b/libkmod/libkmod-config.c
index aaac0a1..5cc348a 100644
--- a/libkmod/libkmod-config.c
+++ b/libkmod/libkmod-config.c
@@ -711,11 +711,8 @@ static bool conf_files_filter_out(struct kmod_ctx *ctx, DIR *d,
 
 	fstatat(dirfd(d), fn, &st, 0);
 
-	if (S_ISDIR(st.st_mode)) {
-		ERR(ctx, "Directories inside directories are not supported: "
-							"%s/%s\n", path, fn);
+	if (S_ISDIR(st.st_mode))
 		return true;
-	}
 
 	return false;
 }
diff --git a/libkmod/libkmod.c b/libkmod/libkmod.c
index 69fe431..1ebdeb4 100644
--- a/libkmod/libkmod.c
+++ b/libkmod/libkmod.c
@@ -225,6 +225,21 @@ static char *get_kernel_release(const char *dirname)
 	return p;
 }
 
+static char *get_ver_config_path(const char * dir)
+{
+	struct utsname u;
+	char *ver_conf;
+	static const char appendix[] = "modprobe.d";
+
+	if (uname(&u) < 0)
+		return NULL;
+
+	if (asprintf(&ver_conf, "%s/%s/%s", dir, appendix, u.release) < 0)
+		return NULL;
+
+	return ver_conf;
+}
+
 /**
  * kmod_new:
  * @dirname: what to consider as linux module's directory, if NULL
@@ -251,7 +266,7 @@ KMOD_EXPORT struct kmod_ctx *kmod_new(const char *dirname,
 {
 	const char *env;
 	struct kmod_ctx *ctx;
-	int err;
+	int err, configs_count;
 
 	ctx = calloc(1, sizeof(struct kmod_ctx));
 	if (!ctx)
@@ -269,9 +284,30 @@ KMOD_EXPORT struct kmod_ctx *kmod_new(const char *dirname,
 	if (env != NULL)
 		kmod_set_log_priority(ctx, log_priority(env));
 
-	if (config_paths == NULL)
-		config_paths = default_config_paths;
-	err = kmod_config_new(ctx, &ctx->config, config_paths);
+	if (config_paths == NULL) {
+		char **tmp_config_paths = malloc(sizeof(default_config_paths) +
+				sizeof(char *) * 2);
+		if(tmp_config_paths == NULL) {
+			ERR(ctx, "could not create versioned config.\n");
+			goto fail;
+		}
+
+		memcpy(tmp_config_paths, default_config_paths, sizeof(default_config_paths));
+
+		configs_count = sizeof(default_config_paths) / sizeof(char *);
+		tmp_config_paths[configs_count-1] = get_ver_config_path("/lib");
+		tmp_config_paths[configs_count] = get_ver_config_path("/etc");
+		tmp_config_paths[configs_count+1] = NULL;
+
+		err = kmod_config_new(ctx, &ctx->config, (const char * const*) tmp_config_paths);
+
+		free(tmp_config_paths[configs_count-1]);
+		free(tmp_config_paths[configs_count]);
+		free(tmp_config_paths);
+	}
+	else
+		err = kmod_config_new(ctx, &ctx->config, config_paths);
+
 	if (err < 0) {
 		ERR(ctx, "could not create config\n");
 		goto fail;
diff --git a/man/modprobe.d.xml b/man/modprobe.d.xml
index 211af84..d1e254a 100644
--- a/man/modprobe.d.xml
+++ b/man/modprobe.d.xml
@@ -41,7 +41,9 @@
 
   <refsynopsisdiv>
     <para><filename>/lib/modprobe.d/*.conf</filename></para>
+    <para><filename>/lib/modprobe.d/`uname -r`/*.conf</filename></para>
     <para><filename>/etc/modprobe.d/*.conf</filename></para>
+    <para><filename>/etc/modprobe.d/`uname -r`/*.conf</filename></para>
     <para><filename>/run/modprobe.d/*.conf</filename></para>
   </refsynopsisdiv>
 
-- 
2.21.0


