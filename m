Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC1CF4AF79F
	for <lists+linux-modules@lfdr.de>; Wed,  9 Feb 2022 18:05:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbiBIREG (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Wed, 9 Feb 2022 12:04:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237769AbiBIREE (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Wed, 9 Feb 2022 12:04:04 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 29C38C05CB8C
        for <linux-modules@vger.kernel.org>; Wed,  9 Feb 2022 09:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644426246;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2wqqQ3XU8ybnmLFAqkW+QEqHeRq8UkaegAP8YzaT8lk=;
        b=QfxFAmdPBU4V4rqXNry9NpdwK1sUJatR74NqIcjYK1/OKOGayiCy+47z5Npw0KgGqFllxq
        P0F/e7NQ91RubgRaL77nNU1EIfrTiqyIdjbTXUvGuQH+RB4cuQ/LGR3DLrPXWAXTX0/pf0
        5hW/kLmxmq0KydJbvklfFjwJ5iTWn5o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-tCj5gc8-MVmjbp7b16ZD5Q-1; Wed, 09 Feb 2022 12:04:05 -0500
X-MC-Unique: tCj5gc8-MVmjbp7b16ZD5Q-1
Received: by mail-wm1-f71.google.com with SMTP id m20-20020a05600c3b1400b003539593ea39so288015wms.0
        for <linux-modules@vger.kernel.org>; Wed, 09 Feb 2022 09:04:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2wqqQ3XU8ybnmLFAqkW+QEqHeRq8UkaegAP8YzaT8lk=;
        b=d5Swp1Y93+W5TH0G9aekY46CzyrRiD9IUcWZWnBPD6UcFnb+pibvPLRymmdChuerUJ
         1o2mgUPOKfcNc8de/mnIazxz7OC9BEmPncom1KoNdIb3deKLZ57CecmT81B3WVbe0/WG
         CFiYFVpOv+AfmV2K7vlIWM/VYCy/8ebMVU4s2LXWGBz45LdGycmrq9LI5+zaVQFFFMbO
         PM3v+iI2nVgNQO+by5k9v0ECUactfCODARIX3/BrG9B2VaW9FGUcd/DxYGPevV9vGQeG
         2XDsoAkPysTSQ3ENQT7XypsNesUhlOThuGVgXZun5kI4jyVYEwfgFWrcT81ZYiH7cK6X
         gWaw==
X-Gm-Message-State: AOAM530xHjyN13n68M5P6fDJ3BA3il92yTQ+EFpbOdoGgQLbbUg0cCnW
        xwAQonGCja4aa9KHKyo8ZJYh5stZ+kNI08Py8b/KGOesaQNEs6rKuXOUedpYPPmOa6O8nSVSuxs
        /qNdJbFJ4R/J94e3le/LdTOMp
X-Received: by 2002:a5d:468a:: with SMTP id u10mr2821343wrq.273.1644426243690;
        Wed, 09 Feb 2022 09:04:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHZdCo6LzGa+h4sXNToR9MeRiHckAUoMHiDAFz0ibc3Z24KYbloViXQQGRFX6N8q+ma61V1Q==
X-Received: by 2002:a5d:468a:: with SMTP id u10mr2821311wrq.273.1644426243507;
        Wed, 09 Feb 2022 09:04:03 -0800 (PST)
Received: from localhost (cpc111743-lutn13-2-0-cust979.9-3.cable.virginm.net. [82.17.115.212])
        by smtp.gmail.com with ESMTPSA id h10sm10023285wrt.57.2022.02.09.09.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 09:04:03 -0800 (PST)
From:   Aaron Tomlin <atomlin@redhat.com>
To:     mcgrof@kernel.org
Cc:     cl@linux.com, pmladek@suse.com, mbenes@suse.cz,
        akpm@linux-foundation.org, jeyu@kernel.org,
        linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
        live-patching@vger.kernel.org, atomlin@atomlin.com,
        ghalat@redhat.com, allen.lkml@gmail.com, void@manifault.com,
        joe@perches.com, christophe.leroy@csgroup.eu, msuchanek@suse.de,
        oleksandr@natalenko.name
Subject: [PATCH v5 03/13] module: Make internal.h more compliant
Date:   Wed,  9 Feb 2022 17:03:48 +0000
Message-Id: <20220209170358.3266629-4-atomlin@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209170358.3266629-1-atomlin@redhat.com>
References: <20220209170358.3266629-1-atomlin@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

This patch will address the following warning and style violations
generated by ./scripts/checkpatch.pl:

  WARNING: Use #include <linux/module.h> instead of <asm/module.h>
  #10: FILE: kernel/module/internal.h:10:
  +#include <asm/module.h>

  CHECK: spaces preferred around that '-' (ctx:VxV)
  #18: FILE: kernel/module/internal.h:18:
  +#define INIT_OFFSET_MASK (1UL << (BITS_PER_LONG-1))
						   ^
  CHECK: extern prototypes should be avoided in .h files
  #84: FILE: kernel/module/internal.h:84:
  +extern int mod_verify_sig(const void *mod, struct load_info *info);

Note: Fortunately, the multiple-include optimisation found in
include/linux/module.h will prevent duplication/or inclusion more than
once.

Fixes: f314dfea16a ("modsign: log module name in the event of an error")
Signed-off-by: Aaron Tomlin <atomlin@redhat.com>
---
 kernel/module/internal.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index 1a4b33ce9f5f..1cf5d6dabc97 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -6,7 +6,8 @@
  */
 
 #include <linux/elf.h>
-#include <asm/module.h>
+#include <linux/compiler.h>
+#include <linux/module.h>
 #include <linux/mutex.h>
 
 #ifndef ARCH_SHF_SMALL
@@ -14,7 +15,7 @@
 #endif
 
 /* If this is set, the section belongs in the init part of the module */
-#define INIT_OFFSET_MASK (1UL << (BITS_PER_LONG-1))
+#define INIT_OFFSET_MASK (1UL << (BITS_PER_LONG - 1))
 /* Maximum number of characters written by module_flags() */
 #define MODULE_FLAGS_BUF_SIZE (TAINT_FLAGS_COUNT + 4)
 #define MODULE_SECT_READ_SIZE (3 /* "0x", "\n" */ + (BITS_PER_LONG / 4))
@@ -55,7 +56,7 @@ struct load_info {
 	} index;
 };
 
-extern int mod_verify_sig(const void *mod, struct load_info *info);
+int mod_verify_sig(const void *mod, struct load_info *info);
 
 #ifdef CONFIG_MODULE_DECOMPRESS
 int module_decompress(struct load_info *info, const void *buf, size_t size);
-- 
2.34.1

