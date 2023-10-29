Return-Path: <linux-modules+bounces-176-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 175C97DAA51
	for <lists+linux-modules@lfdr.de>; Sun, 29 Oct 2023 02:03:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9504B20E10
	for <lists+linux-modules@lfdr.de>; Sun, 29 Oct 2023 01:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01EA037F;
	Sun, 29 Oct 2023 01:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="fHnm17Jn"
X-Original-To: linux-modules@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B745E194
	for <linux-modules@vger.kernel.org>; Sun, 29 Oct 2023 01:03:40 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 031FEA7
	for <linux-modules@vger.kernel.org>; Sat, 28 Oct 2023 18:03:36 -0700 (PDT)
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 209F43F21F
	for <linux-modules@vger.kernel.org>; Sun, 29 Oct 2023 01:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1698541413;
	bh=UP4x5SnMOmcNkH2hemFjTR3CnnBm8mi1qrZ7+9zlX1U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=fHnm17Jn/VDvJET/wtU8WHH1lUiLmjotIexKX/vBQEvtdiefV6lixudn3KiLwpdnw
	 OdBojMbHTXTwAKwqn2KZLnABMyeYLVHqqJbC72dnB0NOvLJWDFdYwshhyJNNHpT3S3
	 Sby7ixpS7KgWBcPTYG/pc43FT4SUeQ8kd9jilW4EWgHoEKrMZdSqAsYMKlEJgwNO8V
	 2SkyT2q6j6EZinLyZjYbqn+eu7BY6qB0iRHFAxKZDETuA7HR4xRCM4XCydQC6CKacD
	 G+W1Xqq70wWOFgwxZkVORkF+PLiQD7ZTmoilcuy5zWSFD6sg0XZnfwYrBZdBSGcaHF
	 0BICJLxXswqZA==
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-5090b916b7fso1068582e87.1
        for <linux-modules@vger.kernel.org>; Sat, 28 Oct 2023 18:03:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698541412; x=1699146212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UP4x5SnMOmcNkH2hemFjTR3CnnBm8mi1qrZ7+9zlX1U=;
        b=efH6kpWOa57VKZp/YewgV+pZRrtV2Z54e4drdol4umgXAgPjZf6V9pI6PebedY1+U6
         KUwxidJgoZpgRPek1Z8/8DTrozIAAgi5rMDmkVMWq8H/sEarX4dZfbo/61bJdvudHeu+
         whTVjMa47bCae2Oh2dofWWW+j3/0DssW2vU4cVokoTj0kPhxf4caW0MiizQsGQESWWfy
         0KI+3/YUrD1tHcNeX1+E2TELr4n/KUXGD29t507eJS4jV7Upy8eXonzMwuKzb8AW06ue
         NXY1nSzS+FShk4i60KBBe5X5X8pcGEju6W8jzqKU+5ktJyF9v84FcFx9Gg37gn/qO4bI
         +/yQ==
X-Gm-Message-State: AOJu0YzSwKu+W2Fd5DVeS0+W1J6jbn47kY2xjmqJTZN+q+gUgPqhm5rA
	chYHTRUa2CQZjMzFjOFyIYJH4nMX1d/FcHbTcnC43ztg6ZyecPxHY36T6wsFIzNPpr8wxDZOMQ7
	RIPOZaRv9/Am6uFcXLZtDaJOXUbwMQRXDu7VqwSUMcZPN23hsMKsDjg==
X-Received: by 2002:ac2:446b:0:b0:509:f68:ed8 with SMTP id y11-20020ac2446b000000b005090f680ed8mr1786525lfl.61.1698541412071;
        Sat, 28 Oct 2023 18:03:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0zxlSxnhosnXYfwFJ0NpreCPIqikJMq7vZaVzhF+egSRGvLFK1Adbhn13rhZZEeIteVpsrg==
X-Received: by 2002:ac2:446b:0:b0:509:f68:ed8 with SMTP id y11-20020ac2446b000000b005090f680ed8mr1786509lfl.61.1698541411134;
        Sat, 28 Oct 2023 18:03:31 -0700 (PDT)
Received: from localhost ([159.148.40.97])
        by smtp.gmail.com with ESMTPSA id d1-20020a0565123d0100b00507fa091353sm829998lfv.132.2023.10.28.18.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 18:03:30 -0700 (PDT)
From: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
To: linux-modules@vger.kernel.org
Cc: lucas.de.marchi@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH kmod] libkmod: remove pkcs7 obj_to_hash_algo()
Date: Sun, 29 Oct 2023 03:03:19 +0200
Message-Id: <20231029010319.157390-1-dimitri.ledkov@canonical.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to using OBJ_obj2txt() to calculate and print the pkcs7
signature hash name. This eliminates the need to duplicate libcrypto
NID to name mapping, detect SM3 openssl compile-time support, and
enables using any hashes that openssl and kernel know about. For
example SHA3 are being added for v6.7 and with this patch are
automatically supported.

Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
---
 configure.ac                |  7 -----
 libkmod/libkmod-signature.c | 59 +++++++++++++------------------------
 2 files changed, 20 insertions(+), 46 deletions(-)

diff --git a/configure.ac b/configure.ac
index 7bf8d78ca7..a6b8fa0308 100644
--- a/configure.ac
+++ b/configure.ac
@@ -133,13 +133,6 @@ AC_ARG_WITH([openssl],
 AS_IF([test "x$with_openssl" != "xno"], [
 	PKG_CHECK_MODULES([libcrypto], [libcrypto >= 1.1.0], [LIBS="$LIBS $libcrypto_LIBS"])
 	AC_DEFINE([ENABLE_OPENSSL], [1], [Enable openssl for modinfo.])
-	AC_COMPILE_IFELSE([AC_LANG_SOURCE([[#include <openssl/ssl.h>
-		int nid = NID_sm3;]])], [
-		AC_MSG_NOTICE([openssl supports sm3])
-	], [
-		AC_MSG_NOTICE([openssl sm3 support not detected])
-		CPPFLAGS="$CPPFLAGS -DOPENSSL_NO_SM3"
-	])
 	module_signatures="PKCS7 $module_signatures"
 ], [
 	AC_MSG_NOTICE([openssl support not requested])
diff --git a/libkmod/libkmod-signature.c b/libkmod/libkmod-signature.c
index b749a818f9..80f6447bce 100644
--- a/libkmod/libkmod-signature.c
+++ b/libkmod/libkmod-signature.c
@@ -127,6 +127,7 @@ struct pkcs7_private {
 	PKCS7 *pkcs7;
 	unsigned char *key_id;
 	BIGNUM *sno;
+	char *hash_algo;
 };
 
 static void pkcs7_free(void *s)
@@ -137,42 +138,11 @@ static void pkcs7_free(void *s)
 	PKCS7_free(pvt->pkcs7);
 	BN_free(pvt->sno);
 	free(pvt->key_id);
+	free(pvt->hash_algo);
 	free(pvt);
 	si->private = NULL;
 }
 
-static int obj_to_hash_algo(const ASN1_OBJECT *o)
-{
-	int nid;
-
-	nid = OBJ_obj2nid(o);
-	switch (nid) {
-	case NID_md4:
-		return PKEY_HASH_MD4;
-	case NID_md5:
-		return PKEY_HASH_MD5;
-	case NID_sha1:
-		return PKEY_HASH_SHA1;
-	case NID_ripemd160:
-		return PKEY_HASH_RIPE_MD_160;
-	case NID_sha256:
-		return PKEY_HASH_SHA256;
-	case NID_sha384:
-		return PKEY_HASH_SHA384;
-	case NID_sha512:
-		return PKEY_HASH_SHA512;
-	case NID_sha224:
-		return PKEY_HASH_SHA224;
-# ifndef OPENSSL_NO_SM3
-	case NID_sm3:
-		return PKEY_HASH_SM3;
-# endif
-	default:
-		return -1;
-	}
-	return -1;
-}
-
 static const char *x509_name_to_str(X509_NAME *name)
 {
 	int i;
@@ -219,7 +189,8 @@ static bool fill_pkcs7(const char *mem, off_t size,
 	unsigned char *key_id_str;
 	struct pkcs7_private *pvt;
 	const char *issuer_str;
-	int hash_algo;
+	char *hash_algo;
+	int hash_algo_len;
 
 	size -= sig_len;
 	pkcs7_raw = mem + size;
@@ -278,27 +249,37 @@ static bool fill_pkcs7(const char *mem, off_t size,
 
 	X509_ALGOR_get0(&o, NULL, NULL, dig_alg);
 
-	hash_algo = obj_to_hash_algo(o);
-	if (hash_algo < 0)
+	// Use OBJ_obj2txt to calculate string length
+	hash_algo_len = OBJ_obj2txt(NULL, 0, o, 0);
+	if (hash_algo_len < 0)
 		goto err3;
-	sig_info->hash_algo = pkey_hash_algo[hash_algo];
-	// hash algo has not been recognized
-	if (sig_info->hash_algo == NULL)
+	hash_algo = malloc(hash_algo_len + 1);
+	if (hash_algo == NULL)
 		goto err3;
+	hash_algo_len = OBJ_obj2txt(hash_algo, hash_algo_len + 1, o, 0);
+	if (hash_algo_len < 0)
+		goto err4;
+
+	// Assign libcrypto hash algo string or number
+	sig_info->hash_algo = hash_algo;
+
 	sig_info->id_type = pkey_id_type[modsig->id_type];
 
 	pvt = malloc(sizeof(*pvt));
 	if (pvt == NULL)
-		goto err3;
+		goto err4;
 
 	pvt->pkcs7 = pkcs7;
 	pvt->key_id = key_id_str;
 	pvt->sno = sno_bn;
+	pvt->hash_algo = hash_algo;
 	sig_info->private = pvt;
 
 	sig_info->free = pkcs7_free;
 
 	return true;
+err4:
+	free(hash_algo);
 err3:
 	free(key_id_str);
 err2:
-- 
2.34.1


