Return-Path: <linux-modules+bounces-160-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 917EE7D692F
	for <lists+linux-modules@lfdr.de>; Wed, 25 Oct 2023 12:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C23301C20B3F
	for <lists+linux-modules@lfdr.de>; Wed, 25 Oct 2023 10:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EFF4266A9;
	Wed, 25 Oct 2023 10:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ShlEeboA"
X-Original-To: linux-modules@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C2E15491;
	Wed, 25 Oct 2023 10:42:26 +0000 (UTC)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AD6F10FD;
	Wed, 25 Oct 2023 03:42:18 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-507a62d4788so8673363e87.0;
        Wed, 25 Oct 2023 03:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698230536; x=1698835336; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USY4fw267Go83RxyHyFwK1+6pc6Q77CrkKJFbgSONJU=;
        b=ShlEeboAgNI0keEKRxCp1TNhPFyAOyjzExRBcVJ4Z3oV86IulG0uOM0dL4VVVXzabv
         A8bFrjCSoJ90aAMkJ0MW2GsAHvMMmYoFZaCM6+9Xnx3gRSGRnwZ+ajEaa9b2R3rkxE7i
         PRDe1CslYMWmm81JE1cauzr3omMjBBCLXznW78hFyBz93gQ85N0cy6iUMYqgsg4X84qS
         LbLgaFwuRApfltyVOjoauHhfgq7f8athyNYeWOVKsHTrWsDFk1UTfub7s5fKBjuI6XeB
         qkL6knTUYxqbiJkugTeJGWSUe2YAe8A9B2VuC2wDi0zQDacWZZe+/srh/PgI48Q1KqOQ
         SYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698230536; x=1698835336;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=USY4fw267Go83RxyHyFwK1+6pc6Q77CrkKJFbgSONJU=;
        b=r+foBiem2wNeURN/xnH8D5gGVbw36TmTzWbyyjN34e08LsnbiWYsdEHlWxGZR+Ck8w
         oTw8Gz0TMaFkBzpzRVMbW5eFpCt6b4aBqldzT8mDBrcyBWuFQJ5cErPD076xk4NPj/4E
         gUGNwwvBJFJoXiJ/xOkMUB1qJzANrqvS4LzOuRtwpNgk69zySKTuUeRS6PiE964SPCVd
         G1m8Wqc6vqJz9meb6ortXTkdbT7xIVvMbFSBSpyFqHQOe9qCUDL/tcCxXm1L5JW2BXek
         dLmtNvAbr5WvJWpRDySrdF8AbKcy5pHHplSJ6Ecjeg9jtWKNRAUUXSY0KpgfvxCzte/z
         UJvg==
X-Gm-Message-State: AOJu0YyCQpp8kydZquV+WIK1ebNkY/ayhRFew93lF1taZEQUOb3/nDch
	rQkUW/AZE/qvgcclheuNlwU=
X-Google-Smtp-Source: AGHT+IH+mKnvmoscLzowQ7hAev3IlVRR9DHwfFnnTp13am39rRDQgcxMoWLTpMzT+6bZeJXrYawGfA==
X-Received: by 2002:a19:5212:0:b0:505:6e21:32e1 with SMTP id m18-20020a195212000000b005056e2132e1mr10207820lfb.10.1698230536071;
        Wed, 25 Oct 2023 03:42:16 -0700 (PDT)
Received: from felia.fritz.box ([2a02:810d:7e40:14b0:2cbd:f9ec:f035:ebea])
        by smtp.gmail.com with ESMTPSA id t12-20020a05640203cc00b0053e67bcb3e7sm9179868edw.82.2023.10.25.03.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 03:42:15 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	David Howells <dhowells@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Luis Chamberlain <mcgrof@kernel.org>,
	linux-modules@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] docs: module-signing: adjust guide after sha1 and sha224 support is gone
Date: Wed, 25 Oct 2023 12:42:12 +0200
Message-Id: <20231025104212.12738-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>

Commit 16ab7cb5825f ("crypto: pkcs7 - remove sha1 support") and commit
fc3225fd6f1e ("module: Do not offer sha224 for built-in module signing")
removes sha1 and sha224 support for kernel module signing.

Adjust the module-signing admin guide documentation to those changes.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 Documentation/admin-guide/module-signing.rst | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/module-signing.rst b/Documentation/admin-guide/module-signing.rst
index 2898b2703297..e3ea1def4c0c 100644
--- a/Documentation/admin-guide/module-signing.rst
+++ b/Documentation/admin-guide/module-signing.rst
@@ -30,8 +30,8 @@ This facility uses X.509 ITU-T standard certificates to encode the public keys
 involved.  The signatures are not themselves encoded in any industrial standard
 type.  The facility currently only supports the RSA public key encryption
 standard (though it is pluggable and permits others to be used).  The possible
-hash algorithms that can be used are SHA-1, SHA-224, SHA-256, SHA-384, and
-SHA-512 (the algorithm is selected by data in the signature).
+hash algorithms that can be used are SHA-256, SHA-384, and SHA-512 (the
+algorithm is selected by data in the signature).
 
 
 ==========================
@@ -81,8 +81,6 @@ This has a number of options available:
      sign the modules with:
 
         =============================== ==========================================
-	``CONFIG_MODULE_SIG_SHA1``	:menuselection:`Sign modules with SHA-1`
-	``CONFIG_MODULE_SIG_SHA224``	:menuselection:`Sign modules with SHA-224`
 	``CONFIG_MODULE_SIG_SHA256``	:menuselection:`Sign modules with SHA-256`
 	``CONFIG_MODULE_SIG_SHA384``	:menuselection:`Sign modules with SHA-384`
 	``CONFIG_MODULE_SIG_SHA512``	:menuselection:`Sign modules with SHA-512`
-- 
2.17.1


