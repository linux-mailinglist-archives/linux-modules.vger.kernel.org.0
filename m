Return-Path: <linux-modules+bounces-1925-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D69A96F73D
	for <lists+linux-modules@lfdr.de>; Fri,  6 Sep 2024 16:46:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4F6CB22612
	for <lists+linux-modules@lfdr.de>; Fri,  6 Sep 2024 14:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42FB21D279B;
	Fri,  6 Sep 2024 14:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="F0+LE6RY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IwcoTgwM"
X-Original-To: linux-modules@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B846A1D1F7B;
	Fri,  6 Sep 2024 14:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725633940; cv=fail; b=JPJo/3dKBd21UIWNkIV7hbMg3Nxa1qslbXo/znUKj3tN0C9teyhH2BHkyGB8z3c56xwh+YvDZFAA+mcDUeYaUknZ5G3FHg4UVcl4uXCUTxJ/jb+n2MtqT2MUd5Bzl0gryYR2cVbtY7dEc12pndw1Fu0eO9sdClSbIOm29Vb22QA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725633940; c=relaxed/simple;
	bh=JRR+V4qxxc1FpFA3A5o+QYdDno99qSuyXPmLZydPMLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VIu4Lzl3niTlaoqg5ZnJaj7m3SfSrVdzwVLW0GxAtfc+QtcXvcBb/pW8RwchlSoaR9ZjeT/7CIyIK9gZ4/cguRyKCf3S+ZY1SHBg2UeG6gUUA8tHLbf86m8o98YdcxTyMnBxRLyvxt0uQvAc9JL/BoJa3Ds/SR5dP07uGDwSK0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=F0+LE6RY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IwcoTgwM; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 486DaR5A005599;
	Fri, 6 Sep 2024 14:45:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=BviyqaGhgktQKLjlwlyU3KC2MpS/mOoGtcPHUO4FW2I=; b=
	F0+LE6RYaQ20xfAvgAEenPQzKrlVsod0I43z2Lc0ImFazVdnYC7AjmHzpBH2ZbRD
	BL3dJTtMxQhmFZLOfN/LQAawo0A/Au/28/JvjU6WuN9xWOhW8RKf5w8YEAZYMHKw
	7Oj9zY67XMhfLfSvhkqTX+0DViCLgCSRSUveQivhjndijxf45HuNanFhiTYB8XgS
	oo5RucS0dSiTJYtJ4tqusnl4W7Tg/i2tKA4+HUhHkWTY6cnLwRnx98zT0PBBTmId
	FHfQ1ZthbkPRxSuLjDB0+VoNdb6TnWaYWSG3QF898R/4ygKzWC4gRWF13RN4HfWw
	QJtj+edU5PSW5ll9AAF6FA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41fhwjhthg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Sep 2024 14:45:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 486EUDxh016421;
	Fri, 6 Sep 2024 14:45:23 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41fhyj1t9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Sep 2024 14:45:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LsdIhXdTpK9qcQsU9TTkYIdSlFmPlBItO6SxrKKg4htfXr0y0ydby3gXW4HUICgD2OYLGLgjzknk4wwIqXR2YkowY6UcaVza7gq3U2Me02fDPA2LMukC1ssb26voA7MJks9mHfufOSbTgcxnFMvnfDe2r0swcijjK/iS2gBwy1VkgPpC/SVo6QMiupPwkU5eIx/Idy9+HaSJF1cw9f9Z7n39TipX6GCjwVIR4d7JmmoTn5rUMki7vTDRKwj+qPuOl16VoVhWibCYCIf1u6VzoAFnG9xA43f5E8lQoqhADFsIMJo7Zw+RHwWd9Z3xdq26Ik2bRRaaS+iy2c1sy6Ipeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BviyqaGhgktQKLjlwlyU3KC2MpS/mOoGtcPHUO4FW2I=;
 b=WSRfKqdnL6imX0lL58lXYtmWZD0zF8I/jqbt1EKYyx5xaHe4QaStrNSbOaBUdQCawstwEgmzSzfuZCWCnOPDuqOmYukhMpwFQqx2JuE0kSI5Y6lwZUCUxMLZRmEaMMC3M/p+d8nCRTBKZFwb4FmLXmzMc0kocnyRPDTfj8oI00EIIibOJyJLK++ztTCDxsQ5dibH38Cj154o+UlEfjf0fc4iuJ5RkT4P1Zpb3B7i2+4S8q+eBptqxTti60GTuPvQEgvRBampPgAGb0exFNMYOkuCQixWzYOdMKo89d//syLO4fQ4BZ0VjROCAOCwkLXENpTs2hUB7uSdpFYlbt/8gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BviyqaGhgktQKLjlwlyU3KC2MpS/mOoGtcPHUO4FW2I=;
 b=IwcoTgwM3bLPyXAnHYAzeNcxS+2fTreiMtp5mE+ibeVfrIvCEy/pEPKFLzYO0TxuK5hcWdMljgKKyWFx3wbMl1OBEcYhYApf/hTBVr8hgaOoc4mxgBWL5IeHwDPPNkf25soJMmgpkoE+yKA5xwGy0zsN8vJRTGofWxkm8g3oZEQ=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DS0PR10MB6752.namprd10.prod.outlook.com (2603:10b6:8:13a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.12; Fri, 6 Sep
 2024 14:45:20 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7939.010; Fri, 6 Sep 2024
 14:45:19 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Nick Alcock <nick.alcock@oracle.com>,
        Alan Maguire <alan.maguire@oracle.com>,
        Steven Rostedt <rostedt@goodmis.org>, Sam James <sam@gentoo.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: [PATCH v10 2/4] kbuild: generate offset range data for builtin modules
Date: Fri,  6 Sep 2024 10:45:03 -0400
Message-ID: <20240906144506.1151789-3-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240906144506.1151789-1-kris.van.hees@oracle.com>
References: <20240906144506.1151789-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0101.namprd03.prod.outlook.com
 (2603:10b6:a03:333::16) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DS0PR10MB6752:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c69f8d7-ae52-4ec2-231c-08dcce8287b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kjN1qAEjOuU6dDcIbgNz816HrgUYqDCz93lALB+qKumeZNm9O1v+MSTKRyr7?=
 =?us-ascii?Q?RFahccrXNYL9ockisHM3jjMMifsxyRHgZiFVjLk66WXYaia+yl6IPiaFbYNK?=
 =?us-ascii?Q?OJuEuL/qmFVs/eeIV0CY26+RtvYbqhSqxpVcJ9fO/BovWVW7RhHrBjb3QVcD?=
 =?us-ascii?Q?aIhPam/NUVJ/eRDhR7gthzzd382Hv/4XRAeECN27Aa20rsNXLVcaJIcLyvXc?=
 =?us-ascii?Q?bBmw3Up5zPikSo9iAKsvTFh7cV3hQtDBbPOtNelB41w5yEf8SiNeeqjd49N6?=
 =?us-ascii?Q?2rcDBa5I1Qps8V9rsC4MGnOA1/yLRrFMOafwql77V4IgTjAztgzgdsFgwrdo?=
 =?us-ascii?Q?JJ9OVd5R5e6gSCkNukXRLxh4WWVF3WxB7qeHZGRipRQ7hmndPJmZkbwqj0zg?=
 =?us-ascii?Q?8NJePG4uv0ikH2YOeP1gYKIE0W66h/x3idVfA7fHJyvzRVhcS1HZ7FbnymfT?=
 =?us-ascii?Q?69Iaiw1O9FnX7b9Vkk08SIw3C9SABOsKa9g3kuWqXH35lH5zUuoqtBSZW+Sw?=
 =?us-ascii?Q?RfmEq34lcJv7o2wH5lhE+zh1Ir2G6TwD2yji4IsHWkDef9O0JGHJOMTWBfNj?=
 =?us-ascii?Q?tneBoupB8SaXvjO6ci/L+EREbxenmFx2BQ5UmrDE/oIoZSDHg79Rh//NVgBS?=
 =?us-ascii?Q?YNexCu9a3gF0K5lG9y3d8lbz2xEOTuZF/UwgNH1VsoF0TVBWOQbMyyfTptcD?=
 =?us-ascii?Q?2Q8FBIAQyc5WJInViBs40NxvHhVRKMaY2ULXjNP6LryD9pmnNCaLCqnjpggi?=
 =?us-ascii?Q?63/A6/Z95Lo9pIh9F+JoC+O3KAPkAyNEr9gzmw0K//T7xmnGmlx3OlcwjFhl?=
 =?us-ascii?Q?A1Vpdh4lBw9rvFjal/MpiDxvgwt6hNyAoReANnimX2IEFGcxWhoiriFNt7n1?=
 =?us-ascii?Q?2AopDp79uNxlpFix8m/Iob36afhT4EnV6XBSHqx92Cann0dbgbk9vlKQe8X/?=
 =?us-ascii?Q?UanCP8huGSWrGvq9mxmAf5AmuJbL1RJdliaXn2M2R5DbAPYAEJVhsltf46mQ?=
 =?us-ascii?Q?G/hv2qAktq4XC2IULK9Sc6Jb5oQa3m03wF0HtzYeKRqpHXp5+prNWQ/12lE6?=
 =?us-ascii?Q?PmSI92uC6GbOPrdwCUtyW5xYA4lH4r890cPmrXubKCkiW73zxUpUhWE9qU5R?=
 =?us-ascii?Q?cb/rJ6uOy1DTWsNGpjbhdtvYRRO2tDJGCm3g5TdqhFZ0oEhR47lewb1DWF5H?=
 =?us-ascii?Q?3Gm412fB7zRsy2mrwLHTe/GAya7kdhYOWCh8ZB6usIgRZ5FRpvVcjcX5gRN7?=
 =?us-ascii?Q?/ekjwg9NkTzuILeZDfbTBfFutXAeS3MJrl0ZGh/OOuHCG2PZu1Hwf5CshDo9?=
 =?us-ascii?Q?JCM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B4XVc/pLzIQZ8Kt+pqQAdy/63RfJepBFWq9YDb3HRlOkljpyRwku9lsJMIP8?=
 =?us-ascii?Q?fB5BGMJq0p44xX/8PLyUV2nQxpetr9ZZL+kNFbbq/F+LqntTkbMS4lbCAAyY?=
 =?us-ascii?Q?+Gp5Eo7E5L73z0enlhaPMx7pXYXi8xjPQA0ympbTs6PhHqKsNaKyvsXZ/Yy3?=
 =?us-ascii?Q?wSurUdADSIsjGr3xhTWa0NVzCroWsJSR7S/SDzRLbszwCg88UxLSW9+X/2Au?=
 =?us-ascii?Q?njDm4dDmCYdomn3FArUSL61akWSoBHIRwZpS677F2fnI8r+3MjnA4Zk2AYRH?=
 =?us-ascii?Q?Fwjt9ckiiuen3M3MnBQxO2oywJzB7h/H6Q3hHmrTfi/N2XmYMYIpiSbsv4IS?=
 =?us-ascii?Q?BfCXKuc6COuMh6NO2ktyYkx9SNCB76IlmHKvIbDReHwyaaLPGwgbJd7eTjdC?=
 =?us-ascii?Q?7nawbDrZeP2UetokzSLUt2WbCu0w34vhqJTGX44IusmVJeJk4XG6DbJ+DXLF?=
 =?us-ascii?Q?ssV1h+/hkk1pxfAg3q4MokGIZ3gQvCfyEyKltdCyVSvCo+73phdFUdyKp0MS?=
 =?us-ascii?Q?fnzf/N/7jSB1ABb7RnFIPKU8aknBUS/g6iUD75W0YGTT0hTcTAM++tUtXY73?=
 =?us-ascii?Q?HI8rvwwxHCm+Q2/5UEm62bbK1SuUFFROEIAR/o7rpNRa4X5S2QQwyVHftUb6?=
 =?us-ascii?Q?hHFv4FuJWn8FKG+OECKFKJS4wDhcX7pCCIsRCXIa2S7ri8YzjKfyVrS0wmAu?=
 =?us-ascii?Q?iawI9bn7w0OsrhZx66fkzQ3dIoBo9IF5I5x5rRfGpa2Du7qfuJPCZ46twGrF?=
 =?us-ascii?Q?ND8BtiArS76Iv00virbdt+BL1bJjdixRDojSAYAeELRsc/hMB6jCScnPyyp1?=
 =?us-ascii?Q?r/dOWD4v822jygnC84sjKu6fL3HdBjof0rYEdUuIoLYwAtBCNvDDAWoCKl6q?=
 =?us-ascii?Q?1jER2TYbXu1egUwtIr5KT7EczkAnHst4RTGU2gf+Ww8k7sFCLHtKmSgfhJ9d?=
 =?us-ascii?Q?hzx8oAiSTF5I6JfQ52mjGW1fc4808LeGCK4cWGy7OSf5HQcOZ39ddFDh8ZJg?=
 =?us-ascii?Q?HiQW9etrBw0f86L8XtZl/J/lPZ6zpDQ/iyBhi8DU3H3oRvJGARXhjZ3/yJVm?=
 =?us-ascii?Q?ZUHDHQMQ4OsS7s0GviOhtGTLfQjAZFaB3eRrglHo9J6ZdQcnkqFLPgyZA9io?=
 =?us-ascii?Q?PGk2ewwtS9OLmBwxK+gDrWOTqL7GFrwNcESGWHCAi/GAfgvMtgimf8pL8dPn?=
 =?us-ascii?Q?J1wbQtBrsK4TXyS/cGodHjfOxt+O0aCZQuq70gtURGEoTBBN70hMm1DVWcfe?=
 =?us-ascii?Q?HhJ5Guxtfuo4/h2Ayp98ENaTwygoFy3HYnijzF+s8vyQbKfIg4KQC37WUfyo?=
 =?us-ascii?Q?f7dqrN4x2trTfQO1W6hpJfgV7dsItRkrmpP7dQEzI/nJwIafs+QHmndecZI7?=
 =?us-ascii?Q?u8Bip2ParawC3FrngsytME0Npmd1Y5mbRkX7/3MCSJBp+bM42cTQuoAXTQfQ?=
 =?us-ascii?Q?zKDpFnaQCXg8zGsBrPkcOvS4JcyfRLWFpkBquHIQ56+Vb/T0jzqyR3KwIHm2?=
 =?us-ascii?Q?t7J4anCPcyjGtFwSJl7phzc+mEPvDV3HI/2pPwepZ3M7P2zeTUjQiMe/9/46?=
 =?us-ascii?Q?hCFs1RlmK+Qu3FNfVouMLubdzsghMyKkr3hFSpmUsWyAmkJGRsdzXWsXvI34?=
 =?us-ascii?Q?PEMarzajyhGmQPCxtYzCZx4=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bozdMbhG4Gxth9XlyIB/64oKXWLz2KYwSPGNKzjv9jF70DXU+YMLodnhd+bLG6fOK6jDO8S8oi/AcS7VRa8pP6tL8wjgiLNoBpN/vgxXoRhNKsEEBxU3cWM20Yfd8QZdPeSWe29mS8u08rzdv4Or6PA+W+EdQjOYIVlR7A8eeRWkPaEHDNVDXq823wQ5MX+9SnHT2bkqzXANgQMgMI5BcQEduO8xtldG8c5OKTZ0DtEofXf+LvDij2QHQbdyj9u/933f50LYSbWMIBJaMRn4TPvjWCRlT/RtJyzz7C64HOjbORvsZuXJOnFkQ41gp3WAMn2uONHOziSCV1x3MgTZy4DIq47rH6aihth9905aoZKrOrXLWr31DJx+LfkZaAS0KKIfJj9uo23SHtB4zasNFrg2MRZr7mGdN4cFJdMygtHrXz9oKlGFZfYdjKeQxmwUQcuMWW33N9zL+pL/tthINY7zflvJuR2/pYwLSfmp8aWRhJblUQhk50N/oAi4uH0TaRAQUqxuwlPgNFUL8lCk5lZfCRhBLRIMgrmS1YhxukMyjnHsYxnX2qP8wxQCL7/uf9SGtqolf7mxTLAY/Osz9BLGmQELgJ38SrIFEXMDI2c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c69f8d7-ae52-4ec2-231c-08dcce8287b3
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 14:45:19.9427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uuzyeDY1stoI2sowVQS6Km+sNGIDb+neR+xg7MFr0G7F8Ue5a9NNxg8ZsVqfS3mQxLxtLvhPWRTqGa5qSaK/wQCtb7fggaqAQXHQ7OFMQuc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6752
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_03,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409060108
X-Proofpoint-ORIG-GUID: n4lHjrkEJ-eTdoHD0qA2ysumih_fTwK5
X-Proofpoint-GUID: n4lHjrkEJ-eTdoHD0qA2ysumih_fTwK5

Create file module.builtin.ranges that can be used to find where
built-in modules are located by their addresses. This will be useful for
tracing tools to find what functions are for various built-in modules.

The offset range data for builtin modules is generated using:
 - modules.builtin: associates object files with module names
 - vmlinux.map: provides load order of sections and offset of first member
    per section
 - vmlinux.o.map: provides offset of object file content per section
 - .*.cmd: build cmd file with KBUILD_MODFILE

The generated data will look like:

.text 00000000-00000000 = _text
.text 0000baf0-0000cb10 amd_uncore
.text 0009bd10-0009c8e0 iosf_mbi
...
.text 00b9f080-00ba011a intel_skl_int3472_discrete
.text 00ba0120-00ba03c0 intel_skl_int3472_discrete intel_skl_int3472_tps68470
.text 00ba03c0-00ba08d6 intel_skl_int3472_tps68470
...
.data 00000000-00000000 = _sdata
.data 0000f020-0000f680 amd_uncore

For each ELF section, it lists the offset of the first symbol.  This can
be used to determine the base address of the section at runtime.

Next, it lists (in strict ascending order) offset ranges in that section
that cover the symbols of one or more builtin modules.  Multiple ranges
can apply to a single module, and ranges can be shared between modules.

The CONFIG_BUILTIN_MODULE_RANGES option controls whether offset range data
is generated for kernel modules that are built into the kernel image.

How it works:

 1. The modules.builtin file is parsed to obtain a list of built-in
    module names and their associated object names (the .ko file that
    the module would be in if it were a loadable module, hereafter
    referred to as <kmodfile>).  This object name can be used to
    identify objects in the kernel compile because any C or assembler
    code that ends up into a built-in module will have the option
    -DKBUILD_MODFILE=<kmodfile> present in its build command, and those
    can be found in the .<obj>.cmd file in the kernel build tree.

    If an object is part of multiple modules, they will all be listed
    in the KBUILD_MODFILE option argument.

    This allows us to conclusively determine whether an object in the
    kernel build belong to any modules, and which.

 2. The vmlinux.map is parsed next to determine the base address of each
    top level section so that all addresses into the section can be
    turned into offsets.  This makes it possible to handle sections
    getting loaded at different addresses at system boot.

    We also determine an 'anchor' symbol at the beginning of each
    section to make it possible to calculate the true base address of
    a section at runtime (i.e. symbol address - symbol offset).

    We collect start addresses of sections that are included in the top
    level section.  This is used when vmlinux is linked using vmlinux.o,
    because in that case, we need to look at the vmlinux.o linker map to
    know what object a symbol is found in.

    And finally, we process each symbol that is listed in vmlinux.map
    (or vmlinux.o.map) based on the following structure:

    vmlinux linked from vmlinux.a:

      vmlinux.map:
        <top level section>
          <included section>  -- might be same as top level section)
            <object>          -- built-in association known
              <symbol>        -- belongs to module(s) object belongs to
              ...

    vmlinux linked from vmlinux.o:

      vmlinux.map:
        <top level section>
          <included section>  -- might be same as top level section)
            vmlinux.o         -- need to use vmlinux.o.map
              <symbol>        -- ignored
              ...

      vmlinux.o.map:
        <section>
            <object>          -- built-in association known
              <symbol>        -- belongs to module(s) object belongs to
              ...

 3. As sections, objects, and symbols are processed, offset ranges are
    constructed in a straight-forward way:

      - If the symbol belongs to one or more built-in modules:
          - If we were working on the same module(s), extend the range
            to include this object
          - If we were working on another module(s), close that range,
            and start the new one
      - If the symbol does not belong to any built-in modules:
          - If we were working on a module(s) range, close that range

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Tested-by: Sam James <sam@gentoo.org>
---

Notes:
    Changes since v9:
     - Reverted support for build directory as optional 4th argument.
     - Added modules.builtin.ranges and vmlinux.o.map to CLEAN_FILES.
     - Fixed support for sparc64.
    
    Changes since v8:
     - Added support for built-in Rust modules.
     - Added optional 4th argument to specify kernel build directory.
    
    Changes since v7:
     - Removed extra close(fn).
     - Make CONFIG_BUILTIN_MODULE_RANGES depend on !lTO.
    
    Changes since v6:
     - Applied Masahiro Yamada's suggestions (Kconfig, makefile, script).
    
    Changes since v5:
     - Removed unnecessary compatibility info from option description.
    
    Changes since v4:
     - Improved commit description to explain the why and how.
     - Documented dependency on GNU AWK for CONFIG_BUILTIN_MODULE_RANGES.
     - Improved comments in generate_builtin_ranges.awk
     - Improved logic in generate_builtin_ranges.awk to handle incorrect
       object size information in linker maps
    
    Changes since v3:
     - Consolidated patches 2 through 5 into a single patch
     - Move CONFIG_BUILTIN_MODULE_RANGES to Kconfig.debug
     - Make CONFIG_BUILTIN_MODULE_RANGES select CONFIG_VMLINUX_MAP
     - Disable CONFIG_BUILTIN_MODULE_RANGES if CONFIG_LTO_CLANG_(FULL|THIN)=y
     - Support LLVM (lld) compiles in generate_builtin_ranges.awk
     - Support CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y
    
    Changes since v2:
     - Add explicit dependency on FTRACE for CONFIG_BUILTIN_MODULE_RANGES
     - 1st arg to generate_builtin_ranges.awk is now modules.builtin.modinfo
     - Switched from using modules.builtin.objs to parsing .*.cmd files
     - Parse data from .*.cmd in generate_builtin_ranges.awk
     - Use $(real-prereqs) rather than $(filter-out ...)
    ---

 Documentation/process/changes.rst   |   7 +
 Makefile                            |   1 +
 lib/Kconfig.debug                   |  15 +
 scripts/Makefile.vmlinux            |  18 +
 scripts/Makefile.vmlinux_o          |   3 +
 scripts/generate_builtin_ranges.awk | 508 ++++++++++++++++++++++++++++
 6 files changed, 552 insertions(+)
 create mode 100755 scripts/generate_builtin_ranges.awk

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 3fc63f27c226..00f1ed7c59c3 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -64,6 +64,7 @@ GNU tar                1.28             tar --version
 gtags (optional)       6.6.5            gtags --version
 mkimage (optional)     2017.01          mkimage --version
 Python (optional)      3.5.x            python3 --version
+GNU AWK (optional)     5.1.0            gawk --version
 ====================== ===============  ========================================
 
 .. [#f1] Sphinx is needed only to build the Kernel documentation
@@ -192,6 +193,12 @@ platforms. The tool is available via the ``u-boot-tools`` package or can be
 built from the U-Boot source code. See the instructions at
 https://docs.u-boot.org/en/latest/build/tools.html#building-tools-for-linux
 
+GNU AWK
+-------
+
+GNU AWK is needed if you want kernel builds to generate address range data for
+builtin modules (CONFIG_BUILTIN_MODULE_RANGES).
+
 System utilities
 ****************
 
diff --git a/Makefile b/Makefile
index d57cfc6896b8..ec98a1e5b257 100644
--- a/Makefile
+++ b/Makefile
@@ -1482,6 +1482,7 @@ endif # CONFIG_MODULES
 # Directories & files removed with 'make clean'
 CLEAN_FILES += vmlinux.symvers modules-only.symvers \
 	       modules.builtin modules.builtin.modinfo modules.nsdeps \
+	       modules.builtin.ranges vmlinux.o.map \
 	       compile_commands.json rust/test \
 	       rust-project.json .vmlinux.objs .vmlinux.export.c
 
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index a30c03a66172..5e2f30921cb2 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -571,6 +571,21 @@ config VMLINUX_MAP
 	  pieces of code get eliminated with
 	  CONFIG_LD_DEAD_CODE_DATA_ELIMINATION.
 
+config BUILTIN_MODULE_RANGES
+	bool "Generate address range information for builtin modules"
+	depends on !LTO
+	depends on VMLINUX_MAP
+	help
+	 When modules are built into the kernel, there will be no module name
+	 associated with its symbols in /proc/kallsyms.  Tracers may want to
+	 identify symbols by module name and symbol name regardless of whether
+	 the module is configured as loadable or not.
+
+	 This option generates modules.builtin.ranges in the build tree with
+	 offset ranges (per ELF section) for the module(s) they belong to.
+	 It also records an anchor symbol to determine the load address of the
+	 section.
+
 config DEBUG_FORCE_WEAK_PER_CPU
 	bool "Force weak per-cpu definitions"
 	depends on DEBUG_KERNEL
diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index 5ceecbed31eb..dfb408aa19c6 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -33,6 +33,24 @@ targets += vmlinux
 vmlinux: scripts/link-vmlinux.sh vmlinux.o $(KBUILD_LDS) FORCE
 	+$(call if_changed_dep,link_vmlinux)
 
+# module.builtin.ranges
+# ---------------------------------------------------------------------------
+ifdef CONFIG_BUILTIN_MODULE_RANGES
+__default: modules.builtin.ranges
+
+quiet_cmd_modules_builtin_ranges = GEN     $@
+      cmd_modules_builtin_ranges = $(real-prereqs) > $@
+
+targets += modules.builtin.ranges
+modules.builtin.ranges: $(srctree)/scripts/generate_builtin_ranges.awk \
+			modules.builtin vmlinux.map vmlinux.o.map FORCE
+	$(call if_changed,modules_builtin_ranges)
+
+vmlinux.map: vmlinux
+	@:
+
+endif
+
 # Add FORCE to the prerequisites of a target to force it to be always rebuilt.
 # ---------------------------------------------------------------------------
 
diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
index d64070b6b4bc..0b6e2ebf60dc 100644
--- a/scripts/Makefile.vmlinux_o
+++ b/scripts/Makefile.vmlinux_o
@@ -45,9 +45,12 @@ objtool-args = $(vmlinux-objtool-args-y) --link
 # Link of vmlinux.o used for section mismatch analysis
 # ---------------------------------------------------------------------------
 
+vmlinux-o-ld-args-$(CONFIG_BUILTIN_MODULE_RANGES)	+= -Map=$@.map
+
 quiet_cmd_ld_vmlinux.o = LD      $@
       cmd_ld_vmlinux.o = \
 	$(LD) ${KBUILD_LDFLAGS} -r -o $@ \
+	$(vmlinux-o-ld-args-y) \
 	$(addprefix -T , $(initcalls-lds)) \
 	--whole-archive vmlinux.a --no-whole-archive \
 	--start-group $(KBUILD_VMLINUX_LIBS) --end-group \
diff --git a/scripts/generate_builtin_ranges.awk b/scripts/generate_builtin_ranges.awk
new file mode 100755
index 000000000000..b9ec761b3bef
--- /dev/null
+++ b/scripts/generate_builtin_ranges.awk
@@ -0,0 +1,508 @@
+#!/usr/bin/gawk -f
+# SPDX-License-Identifier: GPL-2.0
+# generate_builtin_ranges.awk: Generate address range data for builtin modules
+# Written by Kris Van Hees <kris.van.hees@oracle.com>
+#
+# Usage: generate_builtin_ranges.awk modules.builtin vmlinux.map \
+#		vmlinux.o.map > modules.builtin.ranges
+#
+
+# Return the module name(s) (if any) associated with the given object.
+#
+# If we have seen this object before, return information from the cache.
+# Otherwise, retrieve it from the corresponding .cmd file.
+#
+function get_module_info(fn, mod, obj, s) {
+	if (fn in omod)
+		return omod[fn];
+
+	if (match(fn, /\/[^/]+$/) == 0)
+		return "";
+
+	obj = fn;
+	mod = "";
+	fn = substr(fn, 1, RSTART) "." substr(fn, RSTART + 1) ".cmd";
+	if (getline s <fn == 1) {
+		if (match(s, /DKBUILD_MODFILE=['"]+[^'"]+/) > 0) {
+			mod = substr(s, RSTART + 16, RLENGTH - 16);
+			gsub(/['"]/, "", mod);
+		} else if (match(s, /RUST_MODFILE=[^ ]+/) > 0)
+			mod = substr(s, RSTART + 13, RLENGTH - 13);
+	}
+	close(fn);
+
+	# A single module (common case) also reflects objects that are not part
+	# of a module.  Some of those objects have names that are also a module
+	# name (e.g. core).  We check the associated module file name, and if
+	# they do not match, the object is not part of a module.
+	if (mod !~ / /) {
+		if (!(mod in mods))
+			mod = "";
+	}
+
+	gsub(/([^/ ]*\/)+/, "", mod);
+	gsub(/-/, "_", mod);
+
+	# At this point, mod is a single (valid) module name, or a list of
+	# module names (that do not need validation).
+	omod[obj] = mod;
+
+	return mod;
+}
+
+# Update the ranges entry for the given module 'mod' in section 'osect'.
+#
+# We use a modified absolute start address (soff + base) as index because we
+# may need to insert an anchor record later that must be at the start of the
+# section data, and the first module may very well start at the same address.
+# So, we use (addr << 1) + 1 to allow a possible anchor record to be placed at
+# (addr << 1).  This is safe because the index is only used to sort the entries
+# before writing them out.
+#
+function update_entry(osect, mod, soff, eoff, sect, idx) {
+	sect = sect_in[osect];
+	idx = sprintf("%016x", (soff + sect_base[osect]) * 2 + 1);
+	entries[idx] = sprintf("%s %08x-%08x %s", sect, soff, eoff, mod);
+	count[sect]++;
+}
+
+# (1) Build a lookup map of built-in module names.
+#
+# The first file argument is used as input (modules.builtin).
+#
+# Lines will be like:
+#	kernel/crypto/lzo-rle.ko
+# and we record the object name "crypto/lzo-rle".
+#
+ARGIND == 1 {
+	sub(/kernel\//, "");			# strip off "kernel/" prefix
+	sub(/\.ko$/, "");			# strip off .ko suffix
+
+	mods[$1] = 1;
+	next;
+}
+
+# (2) Collect address information for each section.
+#
+# The second file argument is used as input (vmlinux.map).
+#
+# We collect the base address of the section in order to convert all addresses
+# in the section into offset values.
+#
+# We collect the address of the anchor (or first symbol in the section if there
+# is no explicit anchor) to allow users of the range data to calculate address
+# ranges based on the actual load address of the section in the running kernel.
+#
+# We collect the start address of any sub-section (section included in the top
+# level section being processed).  This is needed when the final linking was
+# done using vmlinux.a because then the list of objects contained in each
+# section is to be obtained from vmlinux.o.map.  The offset of the sub-section
+# is recorded here, to be used as an addend when processing vmlinux.o.map
+# later.
+#
+
+# Both GNU ld and LLVM lld linker map format are supported by converting LLVM
+# lld linker map records into equivalent GNU ld linker map records.
+#
+# The first record of the vmlinux.map file provides enough information to know
+# which format we are dealing with.
+#
+ARGIND == 2 && FNR == 1 && NF == 7 && $1 == "VMA" && $7 == "Symbol" {
+	map_is_lld = 1;
+	if (dbg)
+		printf "NOTE: %s uses LLVM lld linker map format\n", FILENAME >"/dev/stderr";
+	next;
+}
+
+# (LLD) Convert a section record fronm lld format to ld format.
+#
+# lld: ffffffff82c00000          2c00000   2493c0  8192 .data
+#  ->
+# ld:  .data           0xffffffff82c00000   0x2493c0 load address 0x0000000002c00000
+#
+ARGIND == 2 && map_is_lld && NF == 5 && /[0-9] [^ ]+$/ {
+	$0 = $5 " 0x"$1 " 0x"$3 " load address 0x"$2;
+}
+
+# (LLD) Convert an anchor record from lld format to ld format.
+#
+# lld: ffffffff81000000          1000000        0     1         _text = .
+#  ->
+# ld:                  0xffffffff81000000                _text = .
+#
+ARGIND == 2 && map_is_lld && !anchor && NF == 7 && raw_addr == "0x"$1 && $6 == "=" && $7 == "." {
+	$0 = "  0x"$1 " " $5 " = .";
+}
+
+# (LLD) Convert an object record from lld format to ld format.
+#
+# lld:            11480            11480     1f07    16         vmlinux.a(arch/x86/events/amd/uncore.o):(.text)
+#  ->
+# ld:   .text          0x0000000000011480     0x1f07 arch/x86/events/amd/uncore.o
+#
+ARGIND == 2 && map_is_lld && NF == 5 && $5 ~ /:\(/ {
+	gsub(/\)/, "");
+	sub(/ vmlinux\.a\(/, " ");
+	sub(/:\(/, " ");
+	$0 = " "$6 " 0x"$1 " 0x"$3 " " $5;
+}
+
+# (LLD) Convert a symbol record from lld format to ld format.
+#
+# We only care about these while processing a section for which no anchor has
+# been determined yet.
+#
+# lld: ffffffff82a859a4          2a859a4        0     1                 btf_ksym_iter_id
+#  ->
+# ld:                  0xffffffff82a859a4                btf_ksym_iter_id
+#
+ARGIND == 2 && map_is_lld && sect && !anchor && NF == 5 && $5 ~ /^[_A-Za-z][_A-Za-z0-9]*$/ {
+	$0 = "  0x"$1 " " $5;
+}
+
+# (LLD) We do not need any other ldd linker map records.
+#
+ARGIND == 2 && map_is_lld && /^[0-9a-f]{16} / {
+	next;
+}
+
+# (LD) Section records with just the section name at the start of the line
+#      need to have the next line pulled in to determine whether it is a
+#      loadable section.  If it is, the next line will contains a hex value
+#      as first and second items.
+#
+ARGIND == 2 && !map_is_lld && NF == 1 && /^[^ ]/ {
+	s = $0;
+	getline;
+	if ($1 !~ /^0x/ || $2 !~ /^0x/)
+		next;
+
+	$0 = s " " $0;
+}
+
+# (LD) Object records with just the section name denote records with a long
+#      section name for which the remainder of the record can be found on the
+#      next line.
+#
+# (This is also needed for vmlinux.o.map, when used.)
+#
+ARGIND >= 2 && !map_is_lld && NF == 1 && /^ [^ \*]/ {
+	s = $0;
+	getline;
+	$0 = s " " $0;
+}
+
+# Beginning a new section - done with the previous one (if any).
+#
+ARGIND == 2 && /^[^ ]/ {
+	sect = 0;
+}
+
+# Process a loadable section (we only care about .-sections).
+#
+# Record the section name and its base address.
+# We also record the raw (non-stripped) address of the section because it can
+# be used to identify an anchor record.
+#
+# Note:
+# Since some AWK implementations cannot handle large integers, we strip off the
+# first 4 hex digits from the address.  This is safe because the kernel space
+# is not large enough for addresses to extend into those digits.  The portion
+# to strip off is stored in addr_prefix as a regexp, so further clauses can
+# perform a simple substitution to do the address stripping.
+#
+ARGIND == 2 && /^\./ {
+	# Explicitly ignore a few sections that are not relevant here.
+	if ($1 ~ /^\.orc_/ || $1 ~ /_sites$/ || $1 ~ /\.percpu/)
+		next;
+
+	# Sections with a 0-address can be ignored as well.
+	if ($2 ~ /^0x0+$/)
+		next;
+
+	raw_addr = $2;
+	addr_prefix = "^" substr($2, 1, 6);
+	base = $2;
+	sub(addr_prefix, "0x", base);
+	base = strtonum(base);
+	sect = $1;
+	anchor = 0;
+	sect_base[sect] = base;
+	sect_size[sect] = strtonum($3);
+
+	if (dbg)
+		printf "[%s] BASE   %016x\n", sect, base >"/dev/stderr";
+
+	next;
+}
+
+# If we are not in a section we care about, we ignore the record.
+#
+ARGIND == 2 && !sect {
+	next;
+}
+
+# Record the first anchor symbol for the current section.
+#
+# An anchor record for the section bears the same raw address as the section
+# record.
+#
+ARGIND == 2 && !anchor && NF == 4 && raw_addr == $1 && $3 == "=" && $4 == "." {
+	anchor = sprintf("%s %08x-%08x = %s", sect, 0, 0, $2);
+	sect_anchor[sect] = anchor;
+
+	if (dbg)
+		printf "[%s] ANCHOR %016x = %s (.)\n", sect, 0, $2 >"/dev/stderr";
+
+	next;
+}
+
+# If no anchor record was found for the current section, use the first symbol
+# in the section as anchor.
+#
+ARGIND == 2 && !anchor && NF == 2 && $1 ~ /^0x/ && $2 !~ /^0x/ {
+	addr = $1;
+	sub(addr_prefix, "0x", addr);
+	addr = strtonum(addr) - base;
+	anchor = sprintf("%s %08x-%08x = %s", sect, addr, addr, $2);
+	sect_anchor[sect] = anchor;
+
+	if (dbg)
+		printf "[%s] ANCHOR %016x = %s\n", sect, addr, $2 >"/dev/stderr";
+
+	next;
+}
+
+# The first occurrence of a section name in an object record establishes the
+# addend (often 0) for that section.  This information is needed to handle
+# sections that get combined in the final linking of vmlinux (e.g. .head.text
+# getting included at the start of .text).
+#
+# If the section does not have a base yet, use the base of the encapsulating
+# section.
+#
+ARGIND == 2 && sect && NF == 4 && /^ [^ \*]/ && !($1 in sect_addend) {
+	if (!($1 in sect_base)) {
+		sect_base[$1] = base;
+
+		if (dbg)
+			printf "[%s] BASE   %016x\n", $1, base >"/dev/stderr";
+	}
+
+	addr = $2;
+	sub(addr_prefix, "0x", addr);
+	addr = strtonum(addr);
+	sect_addend[$1] = addr - sect_base[$1];
+	sect_in[$1] = sect;
+
+	if (dbg)
+		printf "[%s] ADDEND %016x - %016x = %016x\n",  $1, addr, base, sect_addend[$1] >"/dev/stderr";
+
+	# If the object is vmlinux.o then we will need vmlinux.o.map to get the
+	# actual offsets of objects.
+	if ($4 == "vmlinux.o")
+		need_o_map = 1;
+}
+
+# (3) Collect offset ranges (relative to the section base address) for built-in
+# modules.
+#
+# If the final link was done using the actual objects, vmlinux.map contains all
+# the information we need (see section (3a)).
+# If linking was done using vmlinux.a as intermediary, we will need to process
+# vmlinux.o.map (see section (3b)).
+
+# (3a) Determine offset range info using vmlinux.map.
+#
+# Since we are already processing vmlinux.map, the top level section that is
+# being processed is already known.  If we do not have a base address for it,
+# we do not need to process records for it.
+#
+# Given the object name, we determine the module(s) (if any) that the current
+# object is associated with.
+#
+# If we were already processing objects for a (list of) module(s):
+#  - If the current object belongs to the same module(s), update the range data
+#    to include the current object.
+#  - Otherwise, ensure that the end offset of the range is valid.
+#
+# If the current object does not belong to a built-in module, ignore it.
+#
+# If it does, we add a new built-in module offset range record.
+#
+ARGIND == 2 && !need_o_map && /^ [^ ]/ && NF == 4 && $3 != "0x0" {
+	if (!(sect in sect_base))
+		next;
+
+	# Turn the address into an offset from the section base.
+	soff = $2;
+	sub(addr_prefix, "0x", soff);
+	soff = strtonum(soff) - sect_base[sect];
+	eoff = soff + strtonum($3);
+
+	# Determine which (if any) built-in modules the object belongs to.
+	mod = get_module_info($4);
+
+	# If we are processing a built-in module:
+	#   - If the current object is within the same module, we update its
+	#     entry by extending the range and move on
+	#   - Otherwise:
+	#       + If we are still processing within the same main section, we
+	#         validate the end offset against the start offset of the
+	#         current object (e.g. .rodata.str1.[18] objects are often
+	#         listed with an incorrect size in the linker map)
+	#       + Otherwise, we validate the end offset against the section
+	#         size
+	if (mod_name) {
+		if (mod == mod_name) {
+			mod_eoff = eoff;
+			update_entry(mod_sect, mod_name, mod_soff, eoff);
+
+			next;
+		} else if (sect == sect_in[mod_sect]) {
+			if (mod_eoff > soff)
+				update_entry(mod_sect, mod_name, mod_soff, soff);
+		} else {
+			v = sect_size[sect_in[mod_sect]];
+			if (mod_eoff > v)
+				update_entry(mod_sect, mod_name, mod_soff, v);
+		}
+	}
+
+	mod_name = mod;
+
+	# If we encountered an object that is not part of a built-in module, we
+	# do not need to record any data.
+	if (!mod)
+		next;
+
+	# At this point, we encountered the start of a new built-in module.
+	mod_name = mod;
+	mod_soff = soff;
+	mod_eoff = eoff;
+	mod_sect = $1;
+	update_entry($1, mod, soff, mod_eoff);
+
+	next;
+}
+
+# If we do not need to parse the vmlinux.o.map file, we are done.
+#
+ARGIND == 3 && !need_o_map {
+	if (dbg)
+		printf "Note: %s is not needed.\n", FILENAME >"/dev/stderr";
+	exit;
+}
+
+# (3) Collect offset ranges (relative to the section base address) for built-in
+# modules.
+#
+
+# (LLD) Convert an object record from lld format to ld format.
+#
+ARGIND == 3 && map_is_lld && NF == 5 && $5 ~ /:\(/ {
+	gsub(/\)/, "");
+	sub(/:\(/, " ");
+
+	sect = $6;
+	if (!(sect in sect_addend))
+		next;
+
+	sub(/ vmlinux\.a\(/, " ");
+	$0 = " "sect " 0x"$1 " 0x"$3 " " $5;
+}
+
+# (3b) Determine offset range info using vmlinux.o.map.
+#
+# If we do not know an addend for the object's section, we are interested in
+# anything within that section.
+#
+# Determine the top-level section that the object's section was included in
+# during the final link.  This is the section name offset range data will be
+# associated with for this object.
+#
+# The remainder of the processing of the current object record follows the
+# procedure outlined in (3a).
+#
+ARGIND == 3 && /^ [^ ]/ && NF == 4 && $3 != "0x0" {
+	osect = $1;
+	if (!(osect in sect_addend))
+		next;
+
+	# We need to work with the main section.
+	sect = sect_in[osect];
+
+	# Turn the address into an offset from the section base.
+	soff = $2;
+	sub(addr_prefix, "0x", soff);
+	soff = strtonum(soff) + sect_addend[osect];
+	eoff = soff + strtonum($3);
+
+	# Determine which (if any) built-in modules the object belongs to.
+	mod = get_module_info($4);
+
+	# If we are processing a built-in module:
+	#   - If the current object is within the same module, we update its
+	#     entry by extending the range and move on
+	#   - Otherwise:
+	#       + If we are still processing within the same main section, we
+	#         validate the end offset against the start offset of the
+	#         current object (e.g. .rodata.str1.[18] objects are often
+	#         listed with an incorrect size in the linker map)
+	#       + Otherwise, we validate the end offset against the section
+	#         size
+	if (mod_name) {
+		if (mod == mod_name) {
+			mod_eoff = eoff;
+			update_entry(mod_sect, mod_name, mod_soff, eoff);
+
+			next;
+		} else if (sect == sect_in[mod_sect]) {
+			if (mod_eoff > soff)
+				update_entry(mod_sect, mod_name, mod_soff, soff);
+		} else {
+			v = sect_size[sect_in[mod_sect]];
+			if (mod_eoff > v)
+				update_entry(mod_sect, mod_name, mod_soff, v);
+		}
+	}
+
+	mod_name = mod;
+
+	# If we encountered an object that is not part of a built-in module, we
+	# do not need to record any data.
+	if (!mod)
+		next;
+
+	# At this point, we encountered the start of a new built-in module.
+	mod_name = mod;
+	mod_soff = soff;
+	mod_eoff = eoff;
+	mod_sect = osect;
+	update_entry(osect, mod, soff, mod_eoff);
+
+	next;
+}
+
+# (4) Generate the output.
+#
+# Anchor records are added for each section that contains offset range data
+# records.  They are added at an adjusted section base address (base << 1) to
+# ensure they come first in the second records (see update_entry() above for
+# more information).
+#
+# All entries are sorted by (adjusted) address to ensure that the output can be
+# parsed in strict ascending address order.
+#
+END {
+	for (sect in count) {
+		if (sect in sect_anchor) {
+			idx = sprintf("%016x", sect_base[sect] * 2);
+			entries[idx] = sect_anchor[sect];
+		}
+	}
+
+	n = asorti(entries, indices);
+	for (i = 1; i <= n; i++)
+		print entries[indices[i]];
+}
-- 
2.45.2


