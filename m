Return-Path: <linux-modules+bounces-2351-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 086B29AF3CF
	for <lists+linux-modules@lfdr.de>; Thu, 24 Oct 2024 22:41:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 785A9B213A1
	for <lists+linux-modules@lfdr.de>; Thu, 24 Oct 2024 20:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C63A9216A2E;
	Thu, 24 Oct 2024 20:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="ZVmGkkIu"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9671FF7D9
	for <linux-modules@vger.kernel.org>; Thu, 24 Oct 2024 20:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729802477; cv=none; b=f6y4tCoMLNJLVGAQsX+K+Sos9inNbt2vmML3fZPqmbhe8IZVwZdfueDmdl1H7uibLX6yzi3wTMp+geyHe2cYWWv8fouHVTA7msOdCl3GpC+WozpS5a0cC8szmOSCj8Vf6OHRt2NRZjyfSa3EOXgvEcQ/ZsA+PVaDQhFyA6S1qv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729802477; c=relaxed/simple;
	bh=usP4himf/0XPxV672zqXz42sfP+YBx3VQkvKlfBgr90=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=GZh64FYDYwaIFkkc3pVbeZbJKN3uph5t30IC03fYsDZP4TuIvaK8CbVyVHsq7uyRCmMAUb9OnA6gWknkgEHAyvIjGrEnuy0W5mEWNYNd4yzPjqgMlmwA7gWROYDz0IXQrcKRCfwvjtf9pzMNpoGjD+fCtQfGph1Nh+4kD+2B89Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=ZVmGkkIu; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3e600add5dcso780644b6e.2
        for <linux-modules@vger.kernel.org>; Thu, 24 Oct 2024 13:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1729802473; x=1730407273; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9kLSttGdZUZi8U7kG/dCKTItprzqknR08OfxwgJTV9o=;
        b=ZVmGkkIuYrNEMhmGYW59IfnPpicZF15zwPq/68PmAZjdLkwpU0z+vl8pydzjzPBPCy
         aAN9qFuoBbdJkcTNLXO2ZDG8UAx66+gq2OCUqYb5ShhTcIFnLaINjDt5lxzjautbtB99
         /KbY7GJ4z2kOHwEryuqiY+j59hiskAiO0TC9BrEEJdFXKaUsamjfjcqp7y3nUW33p4Vl
         N/s9/SMrDFrkEx+mwpAcIIV89lB5bxYnnvuIW07A0A+qHCRnQRcDhV5cXYm2xhx+8e7T
         os8tHIoxsEwcRgrEpwUOJ1m4c6uLJaTyoe1Pb4B5Gf/e6SOokRew7AxQ7dGCloHHYBaS
         0n/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729802473; x=1730407273;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9kLSttGdZUZi8U7kG/dCKTItprzqknR08OfxwgJTV9o=;
        b=EqZGgenu54tunGClKPBNRFaAsLTtpFdwq9hWCQztREUErq5dyxyayRuaL2sgbDR2nU
         4ux4V3zR79clpIHe4/fJQzJoK9ZGA0kEcjvy+iu7ClnW1MDToqRn3MQ4ye/w06KPHbrJ
         GNqqUHc8LYYZwcvMoSFoFm2p9Ot0/m51tGfRnaR+DaA48a/v2QRfJTdukTCl/PoQwwsM
         w4vZXxJ8sg/jbd0dZ0u9xamDLcFfkQZUguYyMbersAbr819K+aN3s15tUSLuQ/VUVCbi
         nbZuCIlg5D+4UkVali5ex434mJGY2Qod0MbQ+Fh7Fe4zs1qsV7rOqdWUBYy+OlIYL94a
         wLaw==
X-Forwarded-Encrypted: i=1; AJvYcCWqqgZUhp9OBwgllMDkJxLIhipYesMNtoGR1XSgfHLeOTy9q8XDsieKHUUMCKE4MRjdY2UWpFCxZWKhPLiF@vger.kernel.org
X-Gm-Message-State: AOJu0YxApwKUruOZoqETYNK0R22pDDA5kie4ya4kw2QrakT6LVaOCIlA
	kyh+fAsRI3a/4lPxJwxWQS1/1xQ1QTlKyvKuhTx18HHm6LeP38tbhG19DxxOXw==
X-Google-Smtp-Source: AGHT+IGUQCa6jkT9o9s6rEsnfQeciWGYVG3izgq2dPlDpWWFfSWYOmQXD/pK9/OADgxQ9adSBtueSg==
X-Received: by 2002:a05:6808:448d:b0:3e6:2772:2a54 with SMTP id 5614622812f47-3e627722deamr7919569b6e.0.1729802473194;
        Thu, 24 Oct 2024 13:41:13 -0700 (PDT)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ce008fbbaasm53734996d6.36.2024.10.24.13.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:41:12 -0700 (PDT)
Date: Thu, 24 Oct 2024 16:41:12 -0400
Message-ID: <b7f8e0d11b6cfc7547709c7efc472021@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20241024_1524/pstg-lib:20241024_1230/pstg-pwork:20241024_1524
From: Paul Moore <paul@paul-moore.com>
To: Richard Guy Briggs <rgb@redhat.com>, Linux-Audit Mailing List <linux-audit@lists.linux-audit.osci.io>, LKML <linux-kernel@vger.kernel.org>, linux-modules@vger.kernel.org, Linux Kernel Audit Mailing List <audit@vger.kernel.org>
Cc: Eric Paris <eparis@parisplace.org>, Steve Grubb <sgrubb@redhat.com>, Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH v1] audit,module: restore audit logging in load failure  case
References: <999cdd694f951acd2f4ad665fe7ab97d0834e162.1729717542.git.rgb@redhat.com>
In-Reply-To: <999cdd694f951acd2f4ad665fe7ab97d0834e162.1729717542.git.rgb@redhat.com>

On Oct 23, 2024 Richard Guy Briggs <rgb@redhat.com> wrote:
> 
> The move of the module sanity check to earlier skipped the audit logging
> call in the case of failure and to a place where the previously used
> context is unavailable.
> 
> Add an audit logging call for the module loading failure case and get
> the module name when possible.
> 
> Link: https://issues.redhat.com/browse/RHEL-52839
> Fixes: 02da2cbab452 ("module: move check_modinfo() early to early_mod_check()")
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  kernel/module/main.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index 49b9bca9de12..1f482532ef66 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -3057,8 +3057,10 @@ static int load_module(struct load_info *info, const char __user *uargs,
>  	 * failures once the proper module was allocated and
>  	 * before that.
>  	 */
> -	if (!module_allocated)
> +	if (!module_allocated) {
> +		audit_log_kern_module(info->name ? info->name : "(unavailable)");
>  		mod_stat_bump_becoming(info, flags);
> +	}

We probably should move the existing audit_log_kern_module() to just
after the elf_validity_cache_copy() call as both info->name and
info->mod->name should be as valid as they are going to get at that
point.  If we do that then we only have two cases we need to worry about,
a failed module_sig_check() or a failed elf_validity_cache_copy(), and
in both cases we can use "(unavailable)" without having to check
info->name first.

However, assuming we move the audit_log_kern_module() call up a bit as
described above, I'm not sure there is much value in calling
audit_log_kern_module() with an "(unavailable)" module name in those
early two cases.  We know it's an attempted module load based on the
SYSCALL record, seeing an associated "(unavailable)" KERN_MODULE record
doesn't provide us with any more information than if we had simply
skipped the KERN_MODULE record.

Untested, but this is what I'm talking about:

diff --git a/include/linux/audit.h b/include/linux/audit.h
index 0050ef288ab3..eaa10e3c7eca 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -417,7 +417,7 @@ extern int __audit_log_bprm_fcaps(struct linux_binprm *bprm,
 extern void __audit_log_capset(const struct cred *new, const struct cred *old);
 extern void __audit_mmap_fd(int fd, int flags);
 extern void __audit_openat2_how(struct open_how *how);
-extern void __audit_log_kern_module(char *name);
+extern void __audit_log_kern_module(const char *name);
 extern void __audit_fanotify(u32 response, struct fanotify_response_info_audit_rule *friar);
 extern void __audit_tk_injoffset(struct timespec64 offset);
 extern void __audit_ntp_log(const struct audit_ntp_data *ad);
@@ -519,7 +519,7 @@ static inline void audit_openat2_how(struct open_how *how)
                __audit_openat2_how(how);
 }
 
-static inline void audit_log_kern_module(char *name)
+static inline void audit_log_kern_module(const char *name)
 {
        if (!audit_dummy_context())
                __audit_log_kern_module(name);
@@ -677,7 +677,7 @@ static inline void audit_mmap_fd(int fd, int flags)
 static inline void audit_openat2_how(struct open_how *how)
 { }
 
-static inline void audit_log_kern_module(char *name)
+static inline void audit_log_kern_module(const char *name)
 {
 }
 
diff --git a/kernel/audit.h b/kernel/audit.h
index a60d2840559e..5156ecd35457 100644
--- a/kernel/audit.h
+++ b/kernel/audit.h
@@ -199,7 +199,7 @@ struct audit_context {
                        int                     argc;
                } execve;
                struct {
-                       char                    *name;
+                       const char              *name;
                } module;
                struct {
                        struct audit_ntp_data   ntp_data;
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 0627e74585ce..f79eb3a5a789 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -2870,7 +2870,7 @@ void __audit_openat2_how(struct open_how *how)
        context->type = AUDIT_OPENAT2;
 }
 
-void __audit_log_kern_module(char *name)
+void __audit_log_kern_module(const char *name)
 {
        struct audit_context *context = audit_context();
 
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 49b9bca9de12..3acb65073c53 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2884,6 +2884,8 @@ static int load_module(struct load_info *info, const char __user *uargs,
        if (err)
                goto free_copy;
 
+       audit_log_kern_module(info->name);
+
        err = early_mod_check(info, flags);
        if (err)
                goto free_copy;
@@ -2897,8 +2899,6 @@ static int load_module(struct load_info *info, const char __user *uargs,
 
        module_allocated = true;
 
-       audit_log_kern_module(mod->name);
-
        /* Reserve our place in the list. */
        err = add_unformed_module(mod);
        if (err)

--
paul-moore.com

