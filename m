Return-Path: <linux-modules+bounces-72-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA337C4285
	for <lists+linux-modules@lfdr.de>; Tue, 10 Oct 2023 23:28:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 127522819B4
	for <lists+linux-modules@lfdr.de>; Tue, 10 Oct 2023 21:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 458A529D0A;
	Tue, 10 Oct 2023 21:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="OeNDxuEb"
X-Original-To: linux-modules@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED59186C
	for <linux-modules@vger.kernel.org>; Tue, 10 Oct 2023 21:28:12 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED994DC
	for <linux-modules@vger.kernel.org>; Tue, 10 Oct 2023 14:28:06 -0700 (PDT)
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CB3D03F63D
	for <linux-modules@vger.kernel.org>; Tue, 10 Oct 2023 21:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1696973284;
	bh=kGYTzfoZ1kv7weJtQlok3IlvagfJw5eAGxwX3/sR+4o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=OeNDxuEbraKLdn8fn3ZrQoCYuPU5iyGy0YtNUbOWhJqcwBcrH6zo1u1Gq0AbmNzYs
	 VTcMExs6ry5gnr0oRz+234O18qLbryZJJxGqkKjKzOAdu5/ohMGPQSK2LHUuHmo+rW
	 l/csA7C8rMso8+yUqEhu6r+8xEQFaMN8ALC2QAPnrKd6Yit8SMBOUr3EjAX29mR4Di
	 82wMI2LEeVH2mgI0v6UVwScqXGVZm6B1DViwslKgrsZx5AowZEgIwfUYro5Y2vS50P
	 CG9rsGgmdPZO343EYJbXjzxG6306bUtpd/E6f4idImuWqIkxrkVIKlSSy91XwKQDCk
	 v+Hnz7sec8SyQ==
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-27756e0e4d8so5989367a91.3
        for <linux-modules@vger.kernel.org>; Tue, 10 Oct 2023 14:28:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696973283; x=1697578083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kGYTzfoZ1kv7weJtQlok3IlvagfJw5eAGxwX3/sR+4o=;
        b=WsoByLQDhxEfLUpvKFkJKZNZpACljmI9VetNi3/HN2m37+jVhQfHgxMt1+mvYteaM7
         SBQjzLMdlhj42EULTtgWryJgGckRo68WktEIna2dN69CFUQkzrsZ34zOsO8Uj2DtOEB5
         UYLz1y0gMbwzEmVBP9EwTn4gIihtpEDv9bex4jigJgpGTZB415bYBA4EdHAqe1T+VqDR
         d2epqx1vHJKdUsGpDCEAd21MOeTcAL1Vei/scgTaqT9P85ZPTJcrQQg5UPXNBuCt32fG
         4qnm2VRLqMAO13bRg/3aWalY5Vo1NUMrrqNnJPTo9nyYSyfogb8uiEkyzeOjVdCeOrMQ
         ENdQ==
X-Gm-Message-State: AOJu0YxisihtftKPuviUyaLmAfuoj9OaRSW8rtOriu7Getgd6aZqpMPL
	mhfeWEDWj5zAZv4ZNDovRLS2N1Z9mbFKr/b46kzzGtErJFx2pCU2Mm2s/j50NNQboHMxiQXLVNC
	AV40GpCngxMFt71FIKgH1Ggdwx+snjGEYTU1wN+VB7kc=
X-Received: by 2002:a17:90a:d994:b0:27c:f305:cf82 with SMTP id d20-20020a17090ad99400b0027cf305cf82mr2076219pjv.24.1696973283205;
        Tue, 10 Oct 2023 14:28:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHTGkfR5o6XjzlsdIQU0gFnvfe+TOn1Qjq6XWUx1g5sYVOL098jMoAxrBFmurn6Bm/1uScZw==
X-Received: by 2002:a17:90a:d994:b0:27c:f305:cf82 with SMTP id d20-20020a17090ad99400b0027cf305cf82mr2076207pjv.24.1696973282882;
        Tue, 10 Oct 2023 14:28:02 -0700 (PDT)
Received: from localhost ([2001:67c:1560:8007::aac:c15c])
        by smtp.gmail.com with ESMTPSA id 24-20020a17090a001800b002791d5a3e29sm369949pja.6.2023.10.10.14.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 14:28:02 -0700 (PDT)
From: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
To: David Howells <dhowells@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>
Cc: linux-modules@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	herbert@gondor.apana.org.au,
	mcgrof@kernel.org,
	keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: Limit MODULE_SIG_KEY_TYPE_ECDSA to SHA384 or SHA512
Date: Tue, 10 Oct 2023 22:27:55 +0100
Message-Id: <20231010212755.64744-1-dimitri.ledkov@canonical.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

NIST FIPS 186-5 states that it is recommended that the security
strength associated with the bit length of n and the security strength
of the hash function be the same, or higher upon agreement. Given NIST
P384 curve is used, force using either SHA384 or SHA512.

Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
---
 certs/Kconfig | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/certs/Kconfig b/certs/Kconfig
index 1f109b0708..84582de66b 100644
--- a/certs/Kconfig
+++ b/certs/Kconfig
@@ -30,9 +30,11 @@ config MODULE_SIG_KEY_TYPE_RSA
 config MODULE_SIG_KEY_TYPE_ECDSA
 	bool "ECDSA"
 	select CRYPTO_ECDSA
+	depends on MODULE_SIG_SHA384 || MODULE_SIG_SHA512
 	help
-	 Use an elliptic curve key (NIST P384) for module signing. Consider
-	 using a strong hash like sha256 or sha384 for hashing modules.
+	 Use an elliptic curve key (NIST P384) for module signing. Use
+	 a strong hash of same or higher bit length, i.e. sha384 or
+	 sha512 for hashing modules.
 
 	 Note: Remove all ECDSA signing keys, e.g. certs/signing_key.pem,
 	 when falling back to building Linux 5.14 and older kernels.
-- 
2.34.1


