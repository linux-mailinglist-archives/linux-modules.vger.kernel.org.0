Return-Path: <linux-modules+bounces-5418-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iI/MIEuwb2nMKgAAu9opvQ
	(envelope-from <linux-modules+bounces-5418-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Tue, 20 Jan 2026 17:41:47 +0100
X-Original-To: lists+linux-modules@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C5147CD7
	for <lists+linux-modules@lfdr.de>; Tue, 20 Jan 2026 17:41:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6566D9A062F
	for <lists+linux-modules@lfdr.de>; Tue, 20 Jan 2026 15:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AADD044A723;
	Tue, 20 Jan 2026 14:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PsDffexU"
X-Original-To: linux-modules@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A54244A73B
	for <linux-modules@vger.kernel.org>; Tue, 20 Jan 2026 14:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768920690; cv=none; b=ajR5ABh3HzvAcY67qrSOjJFosg1KeeK9h/pkc3NIB6UYtgJTwcMSjhaI7P3JE/ILraA8NTQ7dRv3RcHBfrrrjjYh67Ot+8APC1xSf0ekPu5YRhJKJONu5gdcv+Lx65+syvKZEFpca2Yzk8KOalNoS8gjNuYRKlU71lzcbyVThGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768920690; c=relaxed/simple;
	bh=TteiNIX0IuFSc5XzPByh/QUEuGNbipc6oZyEEMomZZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vBk5H3nNHVGPDHvODNvczFDr2hWytnn3qHmpgPiEggavtBYQ9UBIA2mpx9JSHncZO4Ghcri2kL3UNy7p3xRwgbmpyOWrFqWPD+7IVMwPcfWt40fOEZ/J5uteGrI/4DBFntNKW+hU9uOl+fTG6bGZtlI9RR/ecuNq+dbVgjpph1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PsDffexU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768920686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=odDnoE/GKlxrMrTFdFpnSHxXRmINbU9xkYsrAvJ6paM=;
	b=PsDffexU0PTLOgwNszo5duQLzZa02aWlvQhA7BkjpRg1cp7dVlksZw1IIZQM+pDO1qjBKb
	FwGGq4MaZPD9RXXfktGcFqLMsGqvreQIZI6dbaFr6w0fKJmGALSmz1VG1Xw0t/9qf4Nn9G
	iEEPXQCzN+FQXw5vEWnxmtsPFq9gyzQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-455-PardLi0UMFi_5Enz_zDRPg-1; Tue,
 20 Jan 2026 09:51:19 -0500
X-MC-Unique: PardLi0UMFi_5Enz_zDRPg-1
X-Mimecast-MFC-AGG-ID: PardLi0UMFi_5Enz_zDRPg_1768920677
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2778218002DA;
	Tue, 20 Jan 2026 14:51:17 +0000 (UTC)
Received: from warthog.procyon.org.uk.com (unknown [10.42.28.2])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3477A19560AB;
	Tue, 20 Jan 2026 14:51:12 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>
Cc: David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Stephan Mueller <smueller@chronox.de>,
	linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v13 01/12] crypto: Add ML-DSA crypto_sig support
Date: Tue, 20 Jan 2026 14:50:47 +0000
Message-ID: <20260120145103.1176337-2-dhowells@redhat.com>
In-Reply-To: <20260120145103.1176337-1-dhowells@redhat.com>
References: <20260120145103.1176337-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DMARC_POLICY_ALLOW(0.00)[redhat.com,quarantine];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5418-lists,linux-modules=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dhowells@redhat.com,linux-modules@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-modules];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[apana.org.au:email,chronox.de:email,wunner.de:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,cloudflare.com:email]
X-Rspamd-Queue-Id: 96C5147CD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add verify-only public key crypto support for ML-DSA so that the
X.509/PKCS#7 signature verification code, as used by module signing,
amongst other things, can make use of it through the common crypto_sig API.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Eric Biggers <ebiggers@kernel.org>
cc: Lukas Wunner <lukas@wunner.de>
cc: Ignat Korchagin <ignat@cloudflare.com>
cc: Stephan Mueller <smueller@chronox.de>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: keyrings@vger.kernel.org
cc: linux-crypto@vger.kernel.org
---
 crypto/Kconfig  |  10 +++
 crypto/Makefile |   2 +
 crypto/mldsa.c  | 201 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 213 insertions(+)
 create mode 100644 crypto/mldsa.c

diff --git a/crypto/Kconfig b/crypto/Kconfig
index 12a87f7cf150..8dd5c6660c5a 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -344,6 +344,16 @@ config CRYPTO_ECRDSA
 	  One of the Russian cryptographic standard algorithms (called GOST
 	  algorithms). Only signature verification is implemented.
 
+config CRYPTO_MLDSA
+	tristate "ML-DSA (Module-Lattice-Based Digital Signature Algorithm)"
+	select CRYPTO_SIG
+	select CRYPTO_LIB_MLDSA
+	select CRYPTO_LIB_SHA3
+	help
+	  ML-DSA (Module-Lattice-Based Digital Signature Algorithm) (FIPS-204).
+
+	  Only signature verification is implemented.
+
 endmenu
 
 menu "Block ciphers"
diff --git a/crypto/Makefile b/crypto/Makefile
index 23d3db7be425..267d5403045b 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -60,6 +60,8 @@ ecdsa_generic-y += ecdsa-p1363.o
 ecdsa_generic-y += ecdsasignature.asn1.o
 obj-$(CONFIG_CRYPTO_ECDSA) += ecdsa_generic.o
 
+obj-$(CONFIG_CRYPTO_MLDSA) += mldsa.o
+
 crypto_acompress-y := acompress.o
 crypto_acompress-y += scompress.o
 obj-$(CONFIG_CRYPTO_ACOMP2) += crypto_acompress.o
diff --git a/crypto/mldsa.c b/crypto/mldsa.c
new file mode 100644
index 000000000000..2146c774b5ca
--- /dev/null
+++ b/crypto/mldsa.c
@@ -0,0 +1,201 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * crypto_sig wrapper around ML-DSA library.
+ */
+#include <linux/init.h>
+#include <linux/module.h>
+#include <crypto/internal/sig.h>
+#include <crypto/mldsa.h>
+
+struct crypto_mldsa_ctx {
+	u8 pk[MAX(MAX(MLDSA44_PUBLIC_KEY_SIZE,
+		      MLDSA65_PUBLIC_KEY_SIZE),
+		  MLDSA87_PUBLIC_KEY_SIZE)];
+	unsigned int pk_len;
+	enum mldsa_alg strength;
+	u8 key_set;
+};
+
+static int crypto_mldsa_sign(struct crypto_sig *tfm,
+			     const void *msg, unsigned int msg_len,
+			     void *sig, unsigned int sig_len)
+{
+	return -EOPNOTSUPP;
+}
+
+static int crypto_mldsa_verify(struct crypto_sig *tfm,
+			       const void *sig, unsigned int sig_len,
+			       const void *msg, unsigned int msg_len)
+{
+	const struct crypto_mldsa_ctx *ctx = crypto_sig_ctx(tfm);
+
+	if (unlikely(!ctx->key_set))
+		return -EINVAL;
+
+	return mldsa_verify(ctx->strength, sig, sig_len, msg, msg_len,
+			    ctx->pk, ctx->pk_len);
+}
+
+static unsigned int crypto_mldsa_key_size(struct crypto_sig *tfm)
+{
+	struct crypto_mldsa_ctx *ctx = crypto_sig_ctx(tfm);
+
+	switch (ctx->strength) {
+	case MLDSA44:
+		return MLDSA44_PUBLIC_KEY_SIZE;
+	case MLDSA65:
+		return MLDSA65_PUBLIC_KEY_SIZE;
+	case MLDSA87:
+		return MLDSA87_PUBLIC_KEY_SIZE;
+	default:
+		WARN_ON_ONCE(1);
+		return 0;
+	}
+}
+
+static int crypto_mldsa_set_pub_key(struct crypto_sig *tfm,
+				    const void *key, unsigned int keylen)
+{
+	struct crypto_mldsa_ctx *ctx = crypto_sig_ctx(tfm);
+	unsigned int expected_len = crypto_mldsa_key_size(tfm);
+
+	if (keylen != expected_len)
+		return -EINVAL;
+
+	ctx->pk_len = keylen;
+	memcpy(ctx->pk, key, keylen);
+	ctx->key_set = true;
+	return 0;
+}
+
+static int crypto_mldsa_set_priv_key(struct crypto_sig *tfm,
+				     const void *key, unsigned int keylen)
+{
+	return -EOPNOTSUPP;
+}
+
+static unsigned int crypto_mldsa_max_size(struct crypto_sig *tfm)
+{
+	struct crypto_mldsa_ctx *ctx = crypto_sig_ctx(tfm);
+
+	switch (ctx->strength) {
+	case MLDSA44:
+		return MLDSA44_SIGNATURE_SIZE;
+	case MLDSA65:
+		return MLDSA65_SIGNATURE_SIZE;
+	case MLDSA87:
+		return MLDSA87_SIGNATURE_SIZE;
+	default:
+		WARN_ON_ONCE(1);
+		return 0;
+	}
+}
+
+static int crypto_mldsa44_alg_init(struct crypto_sig *tfm)
+{
+	struct crypto_mldsa_ctx *ctx = crypto_sig_ctx(tfm);
+
+	ctx->strength = MLDSA44;
+	ctx->key_set = false;
+	return 0;
+}
+
+static int crypto_mldsa65_alg_init(struct crypto_sig *tfm)
+{
+	struct crypto_mldsa_ctx *ctx = crypto_sig_ctx(tfm);
+
+	ctx->strength = MLDSA65;
+	ctx->key_set = false;
+	return 0;
+}
+
+static int crypto_mldsa87_alg_init(struct crypto_sig *tfm)
+{
+	struct crypto_mldsa_ctx *ctx = crypto_sig_ctx(tfm);
+
+	ctx->strength = MLDSA87;
+	ctx->key_set = false;
+	return 0;
+}
+
+static void crypto_mldsa_alg_exit(struct crypto_sig *tfm)
+{
+}
+
+static struct sig_alg crypto_mldsa_algs[] = {
+	{
+		.sign			= crypto_mldsa_sign,
+		.verify			= crypto_mldsa_verify,
+		.set_pub_key		= crypto_mldsa_set_pub_key,
+		.set_priv_key		= crypto_mldsa_set_priv_key,
+		.key_size		= crypto_mldsa_key_size,
+		.max_size		= crypto_mldsa_max_size,
+		.init			= crypto_mldsa44_alg_init,
+		.exit			= crypto_mldsa_alg_exit,
+		.base.cra_name		= "mldsa44",
+		.base.cra_driver_name	= "mldsa44-lib",
+		.base.cra_ctxsize	= sizeof(struct crypto_mldsa_ctx),
+		.base.cra_module	= THIS_MODULE,
+		.base.cra_priority	= 5000,
+	}, {
+		.sign			= crypto_mldsa_sign,
+		.verify			= crypto_mldsa_verify,
+		.set_pub_key		= crypto_mldsa_set_pub_key,
+		.set_priv_key		= crypto_mldsa_set_priv_key,
+		.key_size		= crypto_mldsa_key_size,
+		.max_size		= crypto_mldsa_max_size,
+		.init			= crypto_mldsa65_alg_init,
+		.exit			= crypto_mldsa_alg_exit,
+		.base.cra_name		= "mldsa65",
+		.base.cra_driver_name	= "mldsa65-lib",
+		.base.cra_ctxsize	= sizeof(struct crypto_mldsa_ctx),
+		.base.cra_module	= THIS_MODULE,
+		.base.cra_priority	= 5000,
+	}, {
+		.sign			= crypto_mldsa_sign,
+		.verify			= crypto_mldsa_verify,
+		.set_pub_key		= crypto_mldsa_set_pub_key,
+		.set_priv_key		= crypto_mldsa_set_priv_key,
+		.key_size		= crypto_mldsa_key_size,
+		.max_size		= crypto_mldsa_max_size,
+		.init			= crypto_mldsa87_alg_init,
+		.exit			= crypto_mldsa_alg_exit,
+		.base.cra_name		= "mldsa87",
+		.base.cra_driver_name	= "mldsa87-lib",
+		.base.cra_ctxsize	= sizeof(struct crypto_mldsa_ctx),
+		.base.cra_module	= THIS_MODULE,
+		.base.cra_priority	= 5000,
+	},
+};
+
+static int __init mldsa_init(void)
+{
+	int ret, i;
+
+	for (i = 0; i < ARRAY_SIZE(crypto_mldsa_algs); i++) {
+		ret = crypto_register_sig(&crypto_mldsa_algs[i]);
+		if (ret < 0)
+			goto error;
+	}
+	return 0;
+
+error:
+	pr_err("Failed to register (%d)\n", ret);
+	for (i--; i >= 0; i--)
+		crypto_unregister_sig(&crypto_mldsa_algs[i]);
+	return ret;
+}
+module_init(mldsa_init);
+
+static void mldsa_exit(void)
+{
+	for (int i = 0; i < ARRAY_SIZE(crypto_mldsa_algs); i++)
+		crypto_unregister_sig(&crypto_mldsa_algs[i]);
+}
+module_exit(mldsa_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Crypto API support for ML-DSA signature verification");
+MODULE_ALIAS_CRYPTO("mldsa44");
+MODULE_ALIAS_CRYPTO("mldsa65");
+MODULE_ALIAS_CRYPTO("mldsa87");


