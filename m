Return-Path: <linux-modules+bounces-4315-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB81B441BC
	for <lists+linux-modules@lfdr.de>; Thu,  4 Sep 2025 18:00:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A269B7B44D6
	for <lists+linux-modules@lfdr.de>; Thu,  4 Sep 2025 15:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9CE2D6630;
	Thu,  4 Sep 2025 15:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TI+ddVZJ"
X-Original-To: linux-modules@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250642D3EE0;
	Thu,  4 Sep 2025 15:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757001543; cv=none; b=HrsgJnSiE9WjQNlLq8xMmSKfXqNFVcBXNwDtAxVwwM2KKKtCEyHXspV0wGgHmMqwr/voitH9IZjkMFn8I5ckNb1SZrJypJtxQpZI+bZIiM4qloFQk0qSwJw/yFH8aMJ2EWo62E1I91zm9HogxNRZ1kbROSnIctOnacSH9lwNeRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757001543; c=relaxed/simple;
	bh=hX5EJP8hjUBeBC58U8J/u30SBzAtu7USn3gJY2qeZ8U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V3O2LyPeDiOMRRiQg9Va3hTD8k46IrZ3mbLKGJEDQhoYull8je2IvxukHAPFfxEDSyz9MEHaFNQkmxThfzzgZLWDdaEGj/ePr/eYJoqI51hpYcXTVXnt+jPV3IDnzV273My3nWtBrpcMKBwukKP2abyoeDaJFTVEFBFO5s4Zd4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TI+ddVZJ; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584Ftp5E027802;
	Thu, 4 Sep 2025 15:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=mk7y2
	9xLf6yb8qvTcJWa7FbNsq/dwnR22ejMMsTGJD8=; b=TI+ddVZJfXaOaa5RcM60V
	7jK0RlNONe7q+octX1E/Qlbo7JN+shFdyR03GjrO+kwDmJCc0U4UKAsgaJ4K4XSK
	b7VKVmjZJEfVlFy1pNZtM39LOF/FTRTrl2VCBKGbkAsxr+CUF/DzV54fhOSBTAgc
	+xRPhP+O7sMvO8mB38Y8wvK0l1hZflkDMv9vO93E/iFVmKRI3kFBV0D4OoMXdEdj
	vGc8uD76Yh4zbLY/VpX7q8CpP2OWz6I/CzWcL9ToCJ2GC9OKhXI9b+R0/T/bPmuI
	2oi5KdlfGB1GTE1acySBAo+YE+BHnsyi18dtNqxrKJ/zcdYC8nzw9BiRV2KulOsc
	A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48ycgn0773-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 04 Sep 2025 15:58:50 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 584FM8HW040108;
	Thu, 4 Sep 2025 15:58:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48uqrhtq2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 04 Sep 2025 15:58:48 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 584Fsx6e000707;
	Thu, 4 Sep 2025 15:58:48 GMT
Received: from localhost.localdomain (dhcp-10-154-122-161.vpn.oracle.com [10.154.122.161])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 48uqrhtkds-57;
	Thu, 04 Sep 2025 15:58:47 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org,
        Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
        Daniel Gomez <da.gomez@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Eric Biggers <ebiggers@kernel.org>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Wang, Jay" <wanjay@amazon.com>, Nicolai Stange <nstange@suse.com>,
        Vladis Dronov <vdronov@redhat.com>,
        Stephan Mueller <smueller@chronox.de>,
        Sami Tolvanen <samitolvanen@google.com>, linux-modules@vger.kernel.org,
        Vegard Nossum <vegard.nossum@oracle.com>
Subject: [PATCH RFC 056/104] crypto: fips140: convert crypto/ghash-generic.c to using crypto API wrappers
Date: Thu,  4 Sep 2025 17:51:28 +0200
Message-Id: <20250904155216.460962-57-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904155216.460962-1-vegard.nossum@oracle.com>
References: <20250904155216.460962-1-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509040157
X-Authority-Analysis: v=2.4 cv=evbfzppX c=1 sm=1 tr=0 ts=68b9b73a b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=yJojWOMRYYMA:10 a=yPCof4ZbAAAA:8 a=AiVqfqrSVwflbdtcSxwA:9 cc=ntf
 awl=host:12068
X-Proofpoint-GUID: d_NB2kmQziruzzzUYwXsWN6ybCAX_Nnk
X-Proofpoint-ORIG-GUID: d_NB2kmQziruzzzUYwXsWN6ybCAX_Nnk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDE0MiBTYWx0ZWRfX3vqiiE6u+e+P
 LqyhopuhNalsW9JtNEujF2pmmZVLipblw6qSy6nTb6Arkt8/Q6mVV7XW3IXvKwP4nK42ZFWs3jg
 HJEqC49hJEGJhU92QUrYcJWV9UUUKTqDfXGQu3kRLj53jeSqu/P8Ue7Mkn5yI6dmai2VaFn9VMN
 ESTrWMO7MWYvmD/m8ycOJ8aTXG9a9IaRVlYT2TjmQ7KEQQa1zJv2wMJgakXK+2RQwV1QsO9V6IE
 ZoIBynd39YrzT8DOpHcOfDFb/fnS5Ki839XEkd7Wn/0BTA54ireFXDgBNSBscwgXgrngUWwhBWj
 4Wbttn7hSpVBaH86nLBNqV2eLf6mX28F+ZTtFNUGAuoe7TD1fuQoIjXGpp6T9lHpX7QD9BX9OAG
 +x8dMicDCiIHGsJgeEh9AIfpqRt20w==

Use CRYPTO_API() etc. from include/crypto/api.h in preparation for
compilation as part of support for FIPS 140 standalone modules.

Generated using:

  ./fipsify.py --config CONFIG_CRYPTO_GHASH --source crypto/ghash-generic.c

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 crypto/ghash-generic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/crypto/ghash-generic.c b/crypto/ghash-generic.c
index e5803c249c12..37e98aa546c7 100644
--- a/crypto/ghash-generic.c
+++ b/crypto/ghash-generic.c
@@ -153,8 +153,8 @@ static void __exit ghash_mod_exit(void)
 	crypto_unregister_shash(&ghash_alg);
 }
 
-module_init(ghash_mod_init);
-module_exit(ghash_mod_exit);
+crypto_module_init(ghash_mod_init);
+crypto_module_exit(ghash_mod_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("GHASH hash function");
-- 
2.39.3


