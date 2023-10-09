Return-Path: <linux-modules+bounces-62-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D61FE7BD2A8
	for <lists+linux-modules@lfdr.de>; Mon,  9 Oct 2023 06:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB0351C208C1
	for <lists+linux-modules@lfdr.de>; Mon,  9 Oct 2023 04:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B5A2F26;
	Mon,  9 Oct 2023 04:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NXdOkDoc"
X-Original-To: linux-modules@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22A49CA4D
	for <linux-modules@vger.kernel.org>; Mon,  9 Oct 2023 04:57:17 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59F25A4;
	Sun,  8 Oct 2023 21:57:15 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3993uw2p001656;
	Mon, 9 Oct 2023 04:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=NndnzouTr0vQ1A/qdctq0nyZX1h8ugvFOWkvpw6Xzpo=;
 b=NXdOkDocEw+tcqJgDypqgk//H0WFdfJQIDH51uDCEsXuy+LRWcL351HJ1eBzcxBv4L1b
 MUhbT6muEcFk68jCv4scOyk1xaH1mAZC3tl49szvJN4s/cjmXenZhmWni8ZMgb7q5mo+
 CCgk5QpCN3UJpFIpzh0uI3qEuDERX1swnUx0H5MvyxY5sGY0RTssCikqqOW6gPTJehwZ
 aBRFktwNzOXAnXsU196GK1KW35ME6mkfQcRWJ+HkYeDoLXpzN/qujHHq2y7WGz2vaQZq
 ZzSH9690MbXWHXIW7IZdBqk4LAK9Zt9bT9A0BKDYWgtmWJbQRjb+R0TitNeHIpkK8Zkp 5g== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tkh6g1j1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 04:57:09 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3994v8TM006629
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Oct 2023 04:57:08 GMT
Received: from hu-jiangenj-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Sun, 8 Oct 2023 21:57:07 -0700
From: Joey Jiao <quic_jiangenj@quicinc.com>
To: <linux-modules@vger.kernel.org>
CC: <quic_jiangenj@quicinc.com>, Luis Chamberlain <mcgrof@kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] module: Add CONFIG_MODULE_LOAD_IN_SEQUENCE option
Date: Mon, 9 Oct 2023 10:26:35 +0530
Message-ID: <20231009045636.4143-1-quic_jiangenj@quicinc.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pCHCsWM4CyailXj30Yfb5XxW_VfzdXiR
X-Proofpoint-ORIG-GUID: pCHCsWM4CyailXj30Yfb5XxW_VfzdXiR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_03,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1011 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 phishscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310090043
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

When modprobe cmds are executed one by one, the final loaded modules
are not in fixed sequence as expected.

Add the option to make sure modules are in fixed sequence across reboot.

Signed-off-by: Joey Jiao <quic_jiangenj@quicinc.com>
---
 kernel/module/Kconfig | 11 +++++++++++
 kernel/module/main.c  |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index 33a2e991f608..b45a45f31d6d 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -389,4 +389,15 @@ config MODULES_TREE_LOOKUP
 	def_bool y
 	depends on PERF_EVENTS || TRACING || CFI_CLANG
 
+config MODULE_LOAD_IN_SEQUENCE
+	bool "Load module in sequence"
+	default n
+	help
+	  By default, modules are loaded in random sequence depending on when modprobe
+	  is executed.
+
+	  This option allows modules to be loaded in sequence if modprobe cmds are
+	  executed one by one in sequence. This option is helpful during syzkaller fuzzing
+	  to make sure module is loaded into fixed address across device reboot.
+
 endif # MODULES
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 98fedfdb8db5..587fd84083ae 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2593,11 +2593,17 @@ static noinline int do_init_module(struct module *mod)
 	 * be cleaned up needs to sync with the queued work - ie
 	 * rcu_barrier()
 	 */
+#ifdef CONFIG_MODULE_LOAD_IN_SEQUENCE
+	llist_add(&freeinit->node, &init_free_list);
+#else
 	if (llist_add(&freeinit->node, &init_free_list))
 		schedule_work(&init_free_wq);
+#endif
 
 	mutex_unlock(&module_mutex);
+#ifdef CONFIG_MODULE_LOAD_IN_SEQUENCE
 	wake_up_all(&module_wq);
+#endif
 
 	mod_stat_add_long(text_size, &total_text_size);
 	mod_stat_add_long(total_size, &total_mod_size);
-- 
2.42.0


