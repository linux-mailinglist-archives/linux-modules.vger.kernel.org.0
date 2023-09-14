Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BD3479F5B9
	for <lists+linux-modules@lfdr.de>; Thu, 14 Sep 2023 01:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233161AbjIMXyW (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Wed, 13 Sep 2023 19:54:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbjIMXyV (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Wed, 13 Sep 2023 19:54:21 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08353E4B
        for <linux-modules@vger.kernel.org>; Wed, 13 Sep 2023 16:54:18 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1bf6ea270b2so2768495ad.0
        for <linux-modules@vger.kernel.org>; Wed, 13 Sep 2023 16:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694649257; x=1695254057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TmQ1vlrBfUMvjYgfJYVMsqlQZ4GMxfIJbcG1jqAE/6c=;
        b=KYGwYidmtfdn/dlj8oYuvfxjws2xHrEMd1iOLoC73SvwTPuBPVk/NAVOoZucY9ON2W
         pVP7B0D8lORNTfDupoplEYpU+aNS0d75NfcbJHeVO7n7ViWQgLVu2W2Dvp0ioDx2MUw4
         zUS+XOy3nJ0xTf+v3jtCiX2uAuA2VX1mgIIsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694649257; x=1695254057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TmQ1vlrBfUMvjYgfJYVMsqlQZ4GMxfIJbcG1jqAE/6c=;
        b=nfnXJvHovxoqYKelvYCP7IJc7gk4dbcCZBJuwpr3V4Q1NYt8VuCXetV1yZ6n1I4I8q
         eZ1lnM9OLkCxQ0Rlf/BI7YWHxT6k9KKM9uiXIQgbTAPOO7cpuCV6MhE8PRnaj4bh9YdH
         EEtks1B3BF7m7CWHvIRyxh7wDXJ6s/X6qOZ69r3pKd5zSOX+zfWke4ePXyAyL3rMKA0B
         6CHhPHuhxAyssk9kalHAaf5AP4aJFJX/BmktHrMbmSQo3TJ13yfiUkmLdK9xlwp/9rIp
         Z1HTlG7324vX3Wvdte08jHvB1HoL6p7h5fxAMBS5F6663QoEVD7CDlFiJQkr5mxPTj5J
         946w==
X-Gm-Message-State: AOJu0YwVRxOCuxBygVXCcnAD97A5CFSNwT1e3Qiz2hctVgVPAX2SKMcV
        92RR7hMgt7pIh0GOQEYXhaLN1A==
X-Google-Smtp-Source: AGHT+IHHGiBglQQYGl+V0dzdJ7yOnXC6bJL5bkPKwBmwTtLt+2HI3ODYI/P87KBasDHTHHpBjUAVCA==
X-Received: by 2002:a17:903:32cf:b0:1bc:6c00:a2cf with SMTP id i15-20020a17090332cf00b001bc6c00a2cfmr5268838plr.53.1694649257342;
        Wed, 13 Sep 2023 16:54:17 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 19-20020a170902c11300b001b9d7c8f44dsm175831pli.182.2023.09.13.16.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 16:54:16 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>, Johan Hovold <johan@kernel.org>,
        Jessica Yu <jeyu@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
        Nick Desaulniers <ndesaulniers@gooogle.com>,
        Miguel Ojeda <ojeda@kernel.org>, Joe Perches <joe@perches.com>,
        linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: [PATCH v2] module: Clarify documentation of module_param_call()
Date:   Wed, 13 Sep 2023 16:54:14 -0700
Message-Id: <20230913235407.gonna.817-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2680; i=keescook@chromium.org;
 h=from:subject:message-id; bh=pNcngmHYrvDvUxoczJLnyZVd+nVJiePsfxEYP+mQ0xQ=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlAkuma27fQb+IVRynpM5+rd9HXGa5bQURQdPIS
 Wt4kC4XqSeJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQJLpgAKCRCJcvTf3G3A
 JqnbD/42vpNafZEmP4ggRIZjSYnTNljv/5iB7eQ3O5HsbD5EckktJlskTx4nh5U8W6Aq19QK2ud
 cpUdzg+pXwtgB6Cc8dE/tSxo48uWZInMrTT2ImA75OAgvHUoTukoDigzVuGNfNSrj8wwOCRNOgp
 5Z9CVTPYynY4j4HAk0gix5Vb7hKvTofXGIvDZxeKISf6PHd9GQaF+u90y3eC5GXv7jbXG2nUWMd
 4NXLlFB0iZ5C+DHn4YK8I3agbJcRGR8AQlUunhBMMCJxeU3HUju5BiP3kEbx4DBIYjBrSA/QU1O
 8/tjv6OGGs3fYvAQ3xMFWvy2TbCupCo1lfgi3O6BiRNEv50X+1mcQkXNI54EXvhubFgNuxReHZH
 2fm2UDFT/B5IPWfve0GeE0NEa0xOIb917g8ValpzTBbn1wwa4Cb37YnEqKyRG22SBqa0NqTjB0S
 iHnXFAqAXLpyx//pUD7Ks9PGgleLZaU8eJRa/nFsbK56NHu5jc7aUphIaQMXjJqqPskKe0Nh2cp
 a9nfclOGfgol2VuYRRce2AEQ7ntXiAMeFWHx2QThOLBUaiUJmwsZgGsG00gYWZtg80rEv3BEcAB
 Wn7nkaHEBmeBdG64VcXqh1BpeLkTj3RmG8xmxghATmcI4X+1ERuTGdwGWV+cPvnJFVQAOrI4S6w
 a+qnLUI SM27XxvQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

Commit 9bbb9e5a3310 ("param: use ops in struct kernel_param, rather than
get and set fns directly") added the comment that module_param_call()
was deprecated, during a large scale refactoring to bring sanity to type
casting back then. In 2017 following more cleanups, it became useful
again as it wraps a common pattern of creating an ops struct for a
given get/set pair:

  b2f270e87473 ("module: Prepare to convert all module_param_call() prototypes")
  ece1996a21ee ("module: Do not paper over type mismatches in module_param_call()")

        static const struct kernel_param_ops __param_ops_##name = \
                { .flags = 0, .set = _set, .get = _get }; \
        __module_param_call(MODULE_PARAM_PREFIX, \
                            name, &__param_ops_##name, arg, perm, -1, 0)

        __module_param_call(MODULE_PARAM_PREFIX, name, ops, arg, perm, -1, 0)

Many users of module_param_cb() appear to be almost universally
open-coding the same thing that module_param_call() does now. Don't
discourage[1] people from using module_param_call(): clarify the comment
to show that module_param_cb() is useful if you repeatedly use the same
pair of get/set functions.

[1] https://lore.kernel.org/lkml/202308301546.5C789E5EC@keescook/

Cc: Luis Chamberlain <mcgrof@kernel.org>
Cc: Johan Hovold <johan@kernel.org>
Cc: Jessica Yu <jeyu@kernel.org>
Cc: Sagi Grimberg <sagi@grimberg.me>
Cc: Nick Desaulniers <ndesaulniers@gooogle.com>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Joe Perches <joe@perches.com>
Cc: linux-modules@vger.kernel.org
Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
Luis, I note that include/linux/moduleparam.h isn't in the MAINTAINERS
file pattern. Perhaps you want to use include/linux/module*.h?
---
 include/linux/moduleparam.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
index 962cd41a2cb5..d4452f93d060 100644
--- a/include/linux/moduleparam.h
+++ b/include/linux/moduleparam.h
@@ -293,7 +293,11 @@ struct kparam_array
 	= { __param_str_##name, THIS_MODULE, ops,			\
 	    VERIFY_OCTAL_PERMISSIONS(perm), level, flags, { arg } }
 
-/* Obsolete - use module_param_cb() */
+/*
+ * Useful for describing a set/get pair used only once (i.e. for this
+ * parameter). For repeated set/get pairs (i.e. the same struct
+ * kernel_param_ops), use module_param_cb() instead.
+ */
 #define module_param_call(name, _set, _get, arg, perm)			\
 	static const struct kernel_param_ops __param_ops_##name =	\
 		{ .flags = 0, .set = _set, .get = _get };		\
-- 
2.34.1

