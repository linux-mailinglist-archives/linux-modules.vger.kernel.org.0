Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D887A517896
	for <lists+linux-modules@lfdr.de>; Mon,  2 May 2022 22:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387362AbiEBUyp (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Mon, 2 May 2022 16:54:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387493AbiEBUyo (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Mon, 2 May 2022 16:54:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E462C642E
        for <linux-modules@vger.kernel.org>; Mon,  2 May 2022 13:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651524674;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fyk1qjVRfuvYLqg1SExRln/WT9DH+HXSu9T9RqEZXqo=;
        b=BdR6EmYKuNLmnxFq51wlobIBBYGMPYhTk6ayQsPDGA0CbshZ412Gp6jq0deWuFrYAnUERB
        Y73v+gJlzYJtNebSs3Jz5LnEJm2KosYliNk1YqbjAwL+7AjgemXVSleXq6W5tWTmR6t/5k
        KqHDM6hA5H7utEtLj61j0SZmbM6aO0g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-VAf3sqOPNg-xzO_PRHCxfg-1; Mon, 02 May 2022 16:51:12 -0400
X-MC-Unique: VAf3sqOPNg-xzO_PRHCxfg-1
Received: by mail-wm1-f70.google.com with SMTP id bh7-20020a05600c3d0700b003940829b48dso232466wmb.1
        for <linux-modules@vger.kernel.org>; Mon, 02 May 2022 13:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fyk1qjVRfuvYLqg1SExRln/WT9DH+HXSu9T9RqEZXqo=;
        b=1kz2DXTykTOL7QtUpks4X6ySkk8Op3H+4M1Yb0mc674iyqjPKAy5V5MfxSQTOL9noe
         hHqoYpXR38RpR5LsF81PJg2UcYPNo6RoRnmHy7hFht7uod+46rhUXuTKnC8IRm7W+jkr
         fyQx+7hwCyUqR2cQQcl6GTcwhMsfz4ZqdRDe3WMWRg+ER9KBDS6kEN4gNVu+FhEPq8BE
         +1CIBy97G6B468qylZ/MZnKFprQE3aQ+h4BvRH2t7q1UcVX35EuyPSCbspCwt8Uoli6U
         YFBOI/y+jE8VzTuLZ3ZXeBz1WCuf9ReLHyCrJpESk4MVp09qy1ViQqnIELCr1BxmSyHQ
         aE5w==
X-Gm-Message-State: AOAM532dbEdT2k54inQpmS7mkomG90U7pOJjrf1U2iO0qMpD9oVRzDDu
        FdRPtoL8poc5us6pBA603HcQNLXTpATdIlzPYvXxbeNM8N9SGrmMZc65p7/+0GOYG0DAjUJp+Vl
        vEkStNNdFc9ITDBQe33lPQxiN
X-Received: by 2002:a7b:c190:0:b0:38e:7e47:744a with SMTP id y16-20020a7bc190000000b0038e7e47744amr679516wmi.38.1651524671477;
        Mon, 02 May 2022 13:51:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKsvS2IxsQjCeX7CT8ullWyqn23kIb1dUIoGUy6s0v5x+VIfJ9cUyBrwRp2d/3CxqpeULGAA==
X-Received: by 2002:a7b:c190:0:b0:38e:7e47:744a with SMTP id y16-20020a7bc190000000b0038e7e47744amr679499wmi.38.1651524671272;
        Mon, 02 May 2022 13:51:11 -0700 (PDT)
Received: from localhost (cpc111743-lutn13-2-0-cust979.9-3.cable.virginm.net. [82.17.115.212])
        by smtp.gmail.com with ESMTPSA id q14-20020adfaa4e000000b0020c5253d91fsm8177336wrd.107.2022.05.02.13.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 13:51:09 -0700 (PDT)
From:   Aaron Tomlin <atomlin@redhat.com>
To:     mcgrof@kernel.org
Cc:     cl@linux.com, pmladek@suse.com, mbenes@suse.cz,
        christophe.leroy@csgroup.eu, akpm@linux-foundation.org,
        linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
        atomlin@atomlin.com, ghalat@redhat.com, oleksandr@natalenko.name,
        neelx@redhat.com
Subject: [PATCH v5 1/3] module: Make module_flags_taint() accept a module's taints bitmap and usable outside core code
Date:   Mon,  2 May 2022 21:51:03 +0100
Message-Id: <20220502205105.919523-2-atomlin@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220502205105.919523-1-atomlin@redhat.com>
References: <20220502205105.919523-1-atomlin@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

No functional change.

The purpose of this patch is to modify module_flags_taint() to accept
a module's taints bitmap as a parameter and modifies all users
accordingly. Furthermore, it is now possible to access a given
module's taint flags data outside of non-essential code yet does
remain for internal use only.

This is in preparation for module unload taint tracking support.

Signed-off-by: Aaron Tomlin <atomlin@redhat.com>
---
 kernel/module/internal.h | 1 +
 kernel/module/main.c     | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index 3e23bef5884d..abbd1c5ef264 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -100,6 +100,7 @@ int cmp_name(const void *name, const void *sym);
 long module_get_offset(struct module *mod, unsigned int *size, Elf_Shdr *sechdr,
 		       unsigned int section);
 char *module_flags(struct module *mod, char *buf);
+size_t module_flags_taint(unsigned long taints, char *buf);
 
 static inline unsigned long kernel_symbol_value(const struct kernel_symbol *sym)
 {
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 05a42d8fcd7a..7dbdd098b995 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -890,13 +890,13 @@ static inline int module_unload_init(struct module *mod)
 }
 #endif /* CONFIG_MODULE_UNLOAD */
 
-static size_t module_flags_taint(struct module *mod, char *buf)
+size_t module_flags_taint(unsigned long taints, char *buf)
 {
 	size_t l = 0;
 	int i;
 
 	for (i = 0; i < TAINT_FLAGS_COUNT; i++) {
-		if (taint_flags[i].module && test_bit(i, &mod->taints))
+		if (taint_flags[i].module && test_bit(i, &taints))
 			buf[l++] = taint_flags[i].c_true;
 	}
 
@@ -974,7 +974,7 @@ static ssize_t show_taint(struct module_attribute *mattr,
 {
 	size_t l;
 
-	l = module_flags_taint(mk->mod, buffer);
+	l = module_flags_taint(mk->mod->taints, buffer);
 	buffer[l++] = '\n';
 	return l;
 }
@@ -2993,7 +2993,7 @@ char *module_flags(struct module *mod, char *buf)
 	    mod->state == MODULE_STATE_GOING ||
 	    mod->state == MODULE_STATE_COMING) {
 		buf[bx++] = '(';
-		bx += module_flags_taint(mod, buf + bx);
+		bx += module_flags_taint(mod->taints, buf + bx);
 		/* Show a - for module-is-being-unloaded */
 		if (mod->state == MODULE_STATE_GOING)
 			buf[bx++] = '-';
-- 
2.34.1

