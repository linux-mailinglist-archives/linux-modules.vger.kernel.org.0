Return-Path: <linux-modules+bounces-1315-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6388C0A87
	for <lists+linux-modules@lfdr.de>; Thu,  9 May 2024 06:41:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59A001C20F51
	for <lists+linux-modules@lfdr.de>; Thu,  9 May 2024 04:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6301F148301;
	Thu,  9 May 2024 04:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JoeiOW3y"
X-Original-To: linux-modules@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD6110E5
	for <linux-modules@vger.kernel.org>; Thu,  9 May 2024 04:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715229673; cv=fail; b=fzPtFwgeg7vK+KrqTEzrV9gU7NcMbVUqNXBQ6m1dvHo6bAnouHqG3m21HzHW414WCdg3d8IXbnEaVmOB+uHy6e4JJH9aSzaQqjlQkWGYMmiuvzxc5Xnh3AmcFLjxupCH2XbJRWgcuPz5S9SA8i1cms+8TOGA2vE01iceW1EGKl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715229673; c=relaxed/simple;
	bh=fFfkxxHCKuHh3Jl6RBKU+WLG5wCjHCf1ysN9yX7/mH8=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DGlv0t03wpeTCb2itUGv7DHvKNiFo14+ZeUbQuJTPcTxjW1159Q9AVNkURoANAmM7uy3hBjiSA8SOrADlB7uhu9+7kPw53+BPsclBjDU1w/e1RH/3lCkxjaT9QjhzVG/XYi5ipjJZQqP6KAOORPAF4uYnsjsCjRHaFY7ROYUaqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JoeiOW3y; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715229670; x=1746765670;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=fFfkxxHCKuHh3Jl6RBKU+WLG5wCjHCf1ysN9yX7/mH8=;
  b=JoeiOW3yVJMzrI9md0MbDtyroyUiMTLQTbulrx2lacqb9qe2pSjKeFS+
   OQ2SacBsjU3Cw4JYW7Jn9EDez0exh8wqukvM83myYSganYoZURb23HtyP
   t38y33MsofSKH9XxX8+4jQATshtH8gMf9L6V3XSLAj8kVlg+8FYodAuH9
   0iFjhZjsHMloywXeFkX1ggAVEWAAleAQ3iXePwEQygIIXnnMuaY0wBIkX
   oD5knAFzev2qJ9ftza1bISMO5OfSqvJiZ1/DJHLy5QCC/XGXJ6uxrCJ8o
   bF9ZqQT5pOv1n98mhaSN+y6hwtkCVbJDEeshjKzmYG52mQcKMnQq/zmqF
   Q==;
X-CSE-ConnectionGUID: fSbYYZdSTZeQJbqtZtOwYg==
X-CSE-MsgGUID: oL5Rk8VJTPOJNlTtSb9jXA==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="28605120"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; 
   d="scan'208";a="28605120"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 21:41:10 -0700
X-CSE-ConnectionGUID: 4eO6GedORkKiDIWa9xOdKA==
X-CSE-MsgGUID: mj4aISp/SK6AxpCOJSOmeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; 
   d="scan'208";a="29676287"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 May 2024 21:41:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 21:41:09 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 21:41:09 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 21:41:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dxolw6wctWN8zu7Q20eZMBUbWt5cMzzqm9aEsNs5qVdlNfXb4pMTO/HK0aaD6ebFi0PqKb1fJ4nCogUZZOTNJOXhU57NC47BIn80mIFLCAvO5DhwIDolf8iSscBpipY0SHAM/B6NNupXbzF+WLOkQd5s1Bt+E5AK5PiWjK1I0WV7uiKKkRs1rpYJaGH+hG+GgAzFPNPKoJRcUDG/4UDZmKfXE+1YgLwf9dhoTdlCOis80N/9uHK0qgsq5sJBJ1tERCkO8Rvo6AOF9XxHLWO8kK4w2nLvLM4gg3rLpmeg8JezpkM1MkQnotXFuXTxny1yqipBSjrvbs1v5invqh14Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDm59IaMSB/TEYPPf0+2jqCedAEEAz3p8pmwzkP5Kug=;
 b=j1YQl0NkV/uy6puhAQTOqrmojxMij9gO0SxsfPMfypYjRLDJTGr5VdZFltix+a9Jlc3bmzMsaj4ykiPVu6sJoLMV0QpnHnA9VUUkQ0M1g6h8/1xmfsSf9RbePU6mfG/JT87cA+LIlilqPjwJGkj2CJ70NeDIxSGC1+cAxO4kZPZQhVTXnZV7CSgmE32diRQofgweXrUdd7s2f4uE8lJj96HjYYkq4/35DR+8f5oSzqV1iqkFQjklb3MtOYEsIIbbvX1ngKNfk4E3UFTi68eGRmkbt8J3JXOwnolPRnsZQd5hUcePSPQ/bJqrrAo+BOaiWNBE2n5LXjHu8a9CT33buw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6872.namprd11.prod.outlook.com (2603:10b6:806:2b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Thu, 9 May
 2024 04:41:07 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7544.046; Thu, 9 May 2024
 04:41:07 +0000
Date: Wed, 8 May 2024 23:41:06 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
CC: <emil.velikov@collabora.com>, <gustavo.sousa@intel.com>,
	<linux-modules@vger.kernel.org>, <mcgrof@kernel.org>, <md@linux.it>
Subject: Re: [PATCH v2 patch] libkmod: add weak dependecies
Message-ID: <7dttsdaxjsxr5dk5ki5mgasqrihobioyyn44l54k5jmf6ijspv@lodmzcimdin7>
References: <7vowjj4oo64a2vquvqaszmzcdvbrlkntcze2btnogvkwwtuddv@uz72wpi2t55s>
 <20240327141116.97587-1-jtornosm@redhat.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240327141116.97587-1-jtornosm@redhat.com>
X-ClientProxiedBy: MW4PR04CA0062.namprd04.prod.outlook.com
 (2603:10b6:303:6b::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6872:EE_
X-MS-Office365-Filtering-Correlation-Id: 900bb52d-5626-43e1-b115-08dc6fe23dca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bpFrwQGLAqqhY3j5ftYPlIF5+yiwgNUZOfOKjPsTjFOEUSfxM2eUJvdHP0pK?=
 =?us-ascii?Q?5ajKI+vAxNP2VT6fMkZR5m+DJLNl/LPjNpQ85/AXVz1upxvnaimMdwyEtIEf?=
 =?us-ascii?Q?icizrmi9JD6eM0yx/PY7kybZKr8MW9lCNO2Fo10pKbUt4AkSpWW5hne0UHq+?=
 =?us-ascii?Q?VprW4fpCwXnql5TjArUZWWBpY1bNHrVC/MP0YlWrQcv0NxlFOqH8luhlAV5H?=
 =?us-ascii?Q?VbLfPY/j2IUhqdm7ZqUzthYZYObXdbdl3qfwbXLwcKhXTVlyajgb8QJzPKi1?=
 =?us-ascii?Q?KOMNKpQdDgTD7rRcqnyO/iJL+SfQxy1JqWURZakXl13k9iBrwsPhJjY+jIPP?=
 =?us-ascii?Q?7+uue+OaGHrrUhfoRH+DWWN93V9icWHofBAQsmn7yVPVXhZ8G5TMS2uo6QCe?=
 =?us-ascii?Q?GhFKThPS2//r2NBgSgG5o/9JPCQDAlkLvQuU/9pk6TLOC9vAPuGesM1f+BF7?=
 =?us-ascii?Q?VIPcxvVl+gddv/6GzTWqVvI3TthEF4qbVIOJayjhwoPIRkTGrZErZ63Oj09f?=
 =?us-ascii?Q?zTt8YX48cWTIsnnWKmSrIwviD4BGsiP9mYoDX8+bJUxksIKZrfbf+1kJf+bZ?=
 =?us-ascii?Q?rd94ZWtun4uD+exWVM/rWSLG+mRAvb3UawSiaqNPJRrjEl4GY2wbwCtuS9dZ?=
 =?us-ascii?Q?Bi8sR/hjBpZUhEMLv30ExTHxu2ZiUz+8Vp0paMiloDk0rO4edeW14ZBq/xCT?=
 =?us-ascii?Q?H6BMaM7Q/1KNaz5SUxp39mF7/m9uZH+CYF3LKOl0rHnnH6MkvYpY+dpyrsVb?=
 =?us-ascii?Q?Z/ihMplDMkiKRWZlJl8Uk8UyQx1z3J3nUx1THwhtwOGC/RTfEQKJ4/8dia2t?=
 =?us-ascii?Q?3RzJEoqNUv6hxkjoK8wxOTswDS0tN5Phe0Xt5EY4BW98PPfUis+dUOLGPnQZ?=
 =?us-ascii?Q?cW1c/wuWrsbX00ag0QdasrEI0AuOtibUI2OK/jEU2IPgR+C+bBSLs1XuJQ9l?=
 =?us-ascii?Q?xuOA0fD5kTumrlEW66GsNY2FjLqOD43K+3S7kSA5+UFSoapgNxOgOobLgim0?=
 =?us-ascii?Q?PyZvvNCnWTKgZ/VnxqXB42Aslz+cOv5K1pBMi5p/M+dhDubhfZdsrnI9OiR9?=
 =?us-ascii?Q?E9fuqnWoj2SUZvHeQ/eA46lOS4fHDvsk57JMvXEVHPMQd03jun9nEObYvDlK?=
 =?us-ascii?Q?S1nhR8sXS0PDGd0+YYLGNSiHxDQJ31ef6MANK5YfBEhKm0WK9z83Lq25pbN/?=
 =?us-ascii?Q?vSr6muob//bXyifArxbcq3fbSpBUt7yuUqeCNoeIPyyMrI6yGpHRpX1GePbN?=
 =?us-ascii?Q?9wLsfBwZ5f66br32hgxsRGRnGNDP5EodIeapFXCp7A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4ok5Psi6UMuA51q+FPlubeYjIECz0G/m+jM/LY5plLPdbcwHGNMD0fRRh7F/?=
 =?us-ascii?Q?CH8c2DI3DFVOyAtyQkQFujTidjB+At8X+oTp047DkA1S+lfWexiLEsg9j6iv?=
 =?us-ascii?Q?V1Qqay1btilWI6C6x5yGM/VKIzU+EOuj/1KId+fAywzCaulOHguRIpTDen+u?=
 =?us-ascii?Q?ebpALj7FdEPrD57T0X9m20k8jdkaNMX+T+upeA03MvYRT/zFZx0FTwl6GGe3?=
 =?us-ascii?Q?KSyLsqN8RWjNi2E9M8hAv91q9Z8j32vJkrsQe0tICnes8mI2FiTv88T7CEdl?=
 =?us-ascii?Q?4xq8bzbcOTxNN0wbmAqLC1hjHY4KhKyNbiI0XwdGJqimt+ts8YFXpi0pXMON?=
 =?us-ascii?Q?DPvAH7D97uYc7HVZYd7piGZikKfojd+ILrwMYZOenJ1V7ia1xSNmTejlwGXK?=
 =?us-ascii?Q?7rCfvauhOVI2oG1ixdO+sbLmg3KqRlcw3y80CKn53bmkt2mtMpXSvnKZpgHa?=
 =?us-ascii?Q?/GF/cgQB0RxIGYfrBLKyMJBa1vmiMKmRlYm8TcUHy0mko5ujaCCGcTI1Mutk?=
 =?us-ascii?Q?kPU09ZlMEBP4NeLA/rX+5r5VL58hSDJ2dqJyd2gvujCR+gpBSaqKuObhf+Cp?=
 =?us-ascii?Q?PdfKSTWShsuqWnmIJL9ux8pr8DkYzVLzws5GK305TJl5+UNNLtoVySjq/dr3?=
 =?us-ascii?Q?viRcKk6NJgy+m9F2oEM9pC48uivVJiUO5fJO6rIwkLpeVDuv2dCVrOQkrsRe?=
 =?us-ascii?Q?6tdWZm2fqmsK58eWexPWgIjySf3uw+jaaWxPc8X4CuSUfZDFxKmMJ3DoBWUR?=
 =?us-ascii?Q?VS93ED1U09uNUvuSNEuNjE5c9WDfDcvM6K1rjkf8PKr76tZuoKiJaRVKBC53?=
 =?us-ascii?Q?6RDeE8aa+oX3R92Xdfra8AD6SrMY92IU6KbFB/CFWB1qyxvkxivs7MYcWAWD?=
 =?us-ascii?Q?RBuGzanDYmfH79G6xJBpJ6EAZNoFnNsEw16d/hLjj9K862nFTdA21djs1UQ0?=
 =?us-ascii?Q?vwM969AkuSjDBIIAFZOUgBKg3Of1TUlziRdZLF5AMmO8JfSwD/nn2ipDzpFm?=
 =?us-ascii?Q?p2sI+MyIUgi/Rk4aQiNW9UjWyVnFBG62R/rbQlDATe+rGkYGGO9MwhAzDHjh?=
 =?us-ascii?Q?bzZoZhqnz2UbbjfOtDJ6gSf6j15F0dw6NoeSewSZsvzPmkQzotRb8l617EtP?=
 =?us-ascii?Q?TyqvPjYZ3R3tRvVi50E2Huw8xeLm36HNnYNoriXr6mpXBd5Bu9y96XMZWbE3?=
 =?us-ascii?Q?CqQ+bOyxkf+IbtLP5mjQKOCRCgLf7nhcXsENPBFgl+nWnTBzrvWKjI4IMd7Y?=
 =?us-ascii?Q?fw7qMfSW2/ihvr+oBneX5fB1qsPyeU/BSGRp8i4/G/WCpHJjMjbNAs2G94VM?=
 =?us-ascii?Q?xPKf3uimUvNEnNx/xxmV46RExmO7UYDPwC+HDSe3q7rzNolp4njz8X5ELB77?=
 =?us-ascii?Q?KE1YlDGqgmxW/6ZYPBWd0wxBu3LTQmRMyH+btEjho1oveeirIhlGbQ1xv52g?=
 =?us-ascii?Q?xogN5alEPm1DI/WoIVhe1OuRE1riCXLdGjgBGUGl3x7PDGyIGX/6BJTQq4aR?=
 =?us-ascii?Q?pW+5/WdFDDtatt++aZXgcWPfz3/BNQEuL3tJG0vc+ZXxo5rrUeF9R2MjXQhE?=
 =?us-ascii?Q?mz4YvC1Qg5JZpGZRmDpRYrq5Y7gEUOX6ufLZ7Scdvziy8SZirBe++2hYlWHj?=
 =?us-ascii?Q?5g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 900bb52d-5626-43e1-b115-08dc6fe23dca
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 04:41:07.1839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nl06vOsWWKUOMhQQhY5iT5cwv+TwEXH+2OVQsaVz3j0x3msggQSzajnszeDxFbZVpppmo3/rubfq+Wcv++L2ic1ZZZFirWLs5u8mtCsDtGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6872
X-OriginatorOrg: intel.com

On Wed, Mar 27, 2024 at 03:11:16PM GMT, Jose Ignacio Tornos Martinez wrote:
>It has been seen that for some network mac drivers (i.e. lan78xx) the
>related module for the phy is loaded dynamically depending on the current
>hardware. In this case, the associated phy is read using mdio bus and then
>the associated phy module is loaded during runtime (kernel function
>phy_request_driver_module). However, no software dependency is defined, so
>the user tools will no be able to get this dependency. For example, if
>dracut is used and the hardware is present, lan78xx will be included but no
>phy module will be added, and in the next restart the device will not work
>from boot because no related phy will be found during initramfs stage.
>
>In order to solve this, we could define a normal 'pre' software dependency
>in lan78xx module with all the possible phy modules (there may be some),
>but proceeding in that way, all the possible phy modules would be loaded
>while only one is necessary.
>
>The idea is to create a new type of dependency, that we are going to call
>'weak' to be used only by the user tools that need to detect this situation.
>In that way, for example, dracut could check the 'weak' dependency of the
>modules involved in order to install these dependencies in initramfs too.
>That is, for the commented lan78xx module, defining the 'weak' dependency
>with the possible phy modules list, only the necessary phy would be loaded
>on demand keeping the same behavior, but all the possible phy modules would
>be available from initramfs.
>
>A new function 'kmod_module_get_weakdeps' in libkmod will be added for
>this to avoid breaking the API and maintain backward compatibility. This
>general procedure could be useful for other similar cases (not only for
>dynamic phy loading).
>
>Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
>---
>V1 -> V2:
>- Better to create a new type of dependency 'weak' as Lucas De Marchi
>suggests.
>- Complete modprobe.d(5) with the comments from Lucas De Marchi.
>
> libkmod/docs/libkmod-sections.txt |   2 +
> libkmod/libkmod-config.c          | 212 ++++++++++++++++++++++++++++++
> libkmod/libkmod-internal.h        |   3 +
> libkmod/libkmod-module.c          |  58 +++++++-
> libkmod/libkmod.h                 |   3 +
> libkmod/libkmod.sym               |   2 +
> man/modprobe.d.5.xml              |  24 ++++
> tools/depmod.c                    |  25 ++++
> tools/modprobe.c                  |   1 +
> 9 files changed, 326 insertions(+), 4 deletions(-)
>
>diff --git a/libkmod/docs/libkmod-sections.txt b/libkmod/docs/libkmod-sections.txt
>index 33d9eec..978b064 100644
>--- a/libkmod/docs/libkmod-sections.txt
>+++ b/libkmod/docs/libkmod-sections.txt
>@@ -37,6 +37,7 @@ kmod_config_get_remove_commands
> kmod_config_get_aliases
> kmod_config_get_options
> kmod_config_get_softdeps
>+kmod_config_get_weakdeps
> kmod_config_iter_get_key
> kmod_config_iter_get_value
> kmod_config_iter_next
>@@ -62,6 +63,7 @@ kmod_module_remove_module
> kmod_module_get_module
> kmod_module_get_dependencies
> kmod_module_get_softdeps
>+kmod_module_get_weakdeps
> kmod_module_apply_filter
> kmod_module_get_filtered_blacklist
> kmod_module_get_install_commands
>diff --git a/libkmod/libkmod-config.c b/libkmod/libkmod-config.c
>index e83621b..a571b6b 100644
>--- a/libkmod/libkmod-config.c
>+++ b/libkmod/libkmod-config.c
>@@ -58,6 +58,12 @@ struct kmod_softdep {
> 	unsigned int n_post;
> };
>
>+struct kmod_weakdep {
>+	char *name;
>+	const char **weak;
>+	unsigned int n_weak;
>+};
>+
> const char *kmod_blacklist_get_modname(const struct kmod_list *l)
> {
> 	return l->data;
>@@ -110,6 +116,16 @@ const char * const *kmod_softdep_get_post(const struct kmod_list *l, unsigned in
> 	return dep->post;
> }
>
>+const char *kmod_weakdep_get_name(const struct kmod_list *l) {
>+	const struct kmod_weakdep *dep = l->data;
>+	return dep->name;
>+}
>+
>+const char * const *kmod_weakdep_get_weak(const struct kmod_list *l, unsigned int *count) {
>+	const struct kmod_weakdep *dep = l->data;
>+	*count = dep->n_weak;
>+	return dep->weak;
>+}
> static int kmod_config_add_command(struct kmod_config *config,
> 						const char *modname,
> 						const char *command,
>@@ -392,6 +408,112 @@ static int kmod_config_add_softdep(struct kmod_config *config,
> 	return 0;
> }
>
>+static int kmod_config_add_weakdep(struct kmod_config *config,
>+							const char *modname,
>+							const char *line)
>+{
>+	struct kmod_list *list;
>+	struct kmod_weakdep *dep;
>+	const char *s, *p;
>+	char *itr;
>+	unsigned int n_weak = 0;
>+	size_t modnamelen = strlen(modname) + 1;
>+	size_t buflen = 0;
>+	bool was_space = false;
>+
>+	DBG(config->ctx, "modname=%s\n", modname);
>+
>+	/* analyze and count */
>+	for (p = s = line; ; s++) {
>+		size_t plen;
>+
>+		if (*s != '\0') {
>+			if (!isspace(*s)) {
>+				was_space = false;
>+				continue;
>+			}
>+
>+			if (was_space) {
>+				p = s + 1;
>+				continue;
>+			}
>+			was_space = true;
>+
>+			if (p >= s)
>+				continue;
>+		}
>+		plen = s - p;
>+
>+		if (*s != '\0' || (*s == '\0' && !was_space)) {
>+			buflen += plen + 1;
>+			n_weak++;
>+		}
>+		p = s + 1;
>+		if (*s == '\0')
>+			break;
>+	}
>+
>+	DBG(config->ctx, "%u weak\n", n_weak);
>+
>+	dep = malloc(sizeof(struct kmod_weakdep) + modnamelen +
>+		     n_weak * sizeof(const char *) +
>+		     buflen);
>+	if (dep == NULL) {
>+		ERR(config->ctx, "out-of-memory modname=%s\n", modname);
>+		return -ENOMEM;
>+	}
>+	dep->n_weak = n_weak;
>+	dep->weak = (const char **)((char *)dep + sizeof(struct kmod_weakdep));
>+	dep->name = (char *)(dep->weak + n_weak);
>+
>+	memcpy(dep->name, modname, modnamelen);
>+
>+	/* copy strings */
>+	itr = dep->name + modnamelen;
>+	n_weak = 0;
>+	was_space = false;
>+	for (p = s = line; ; s++) {
>+		size_t plen;
>+
>+		if (*s != '\0') {
>+			if (!isspace(*s)) {
>+				was_space = false;
>+				continue;
>+			}
>+
>+			if (was_space) {
>+				p = s + 1;
>+				continue;
>+			}
>+			was_space = true;
>+
>+			if (p >= s)
>+				continue;
>+		}
>+		plen = s - p;
>+
>+		if (*s != '\0' || (*s == '\0' && !was_space)) {
>+			dep->weak[n_weak] = itr;
>+			memcpy(itr, p, plen);
>+			itr[plen] = '\0';
>+			itr += plen + 1;
>+			n_weak++;
>+		}
>+		p = s + 1;
>+		if (*s == '\0')
>+			break;
>+	}
>+
>+	list = kmod_list_append(config->weakdeps, dep);
>+	if (list == NULL) {
>+		free(dep);
>+		return -ENOMEM;
>+	}
>+	config->weakdeps = list;

this is a long function that we may eventually break in smaller pieces
and share with the softdep parser.

>+
>+	return 0;
>+}
>+
> static char *softdep_to_char(struct kmod_softdep *dep) {
> 	const size_t sz_preprefix = sizeof("pre: ") - 1;
> 	const size_t sz_postprefix = sizeof("post: ") - 1;
>@@ -461,6 +583,44 @@ static char *softdep_to_char(struct kmod_softdep *dep) {
> 	return s;
> }
>
>+static char *weakdep_to_char(struct kmod_weakdep *dep) {
>+	size_t sz;
>+	const char *start, *end;
>+	char *s, *itr;
>+
>+	/*
>+	 * Rely on the fact that dep->weak[] and are strv's that point to a
>+	 * contiguous buffer
>+	 */
>+	if (dep->n_weak > 0) {
>+		start = dep->weak[0];
>+		end = dep->weak[dep->n_weak - 1]
>+					+ strlen(dep->weak[dep->n_weak - 1]);
>+		sz = end - start;
>+	} else
>+		sz = 0;
>+
>+	itr = s = malloc(sz);
>+	if (s == NULL)
>+		return NULL;
>+
>+	if (sz) {
>+		char *p;
>+
>+		/* include last '\0' */
>+		memcpy(itr, dep->weak[0], sz + 1);
>+		for (p = itr; p < itr + sz; p++) {
>+			if (*p == '\0')
>+				*p = ' ';
>+		}
>+		itr = p;
>+	}
>+
>+	*itr = '\0';

ditto for this one

>+
>+	return s;
>+}
>+
> static void kmod_config_free_softdep(struct kmod_config *config,
> 							struct kmod_list *l)
> {
>@@ -468,6 +628,13 @@ static void kmod_config_free_softdep(struct kmod_config *config,
> 	config->softdeps = kmod_list_remove(l);
> }
>
>+static void kmod_config_free_weakdep(struct kmod_config *config,
>+							struct kmod_list *l)
>+{
>+	free(l->data);
>+	config->weakdeps = kmod_list_remove(l);
>+}
>+
> static void kcmdline_parse_result(struct kmod_config *config, char *modname,
> 						char *param, char *value)
> {
>@@ -703,6 +870,14 @@ static int kmod_config_parse(struct kmod_config *config, int fd,
> 				goto syntax_error;
>
> 			kmod_config_add_softdep(config, modname, softdeps);
>+		} else if (streq(cmd, "weakdep")) {
>+			char *modname = strtok_r(NULL, "\t ", &saveptr);
>+			char *weakdeps = strtok_r(NULL, "\0", &saveptr);
>+
>+			if (underscores(modname) < 0 || weakdeps == NULL)
>+				goto syntax_error;
>+
>+			kmod_config_add_weakdep(config, modname, weakdeps);
> 		} else if (streq(cmd, "include")
> 				|| streq(cmd, "config")) {
> 			ERR(ctx, "%s: command %s is deprecated and not parsed anymore\n",
>@@ -746,6 +921,9 @@ void kmod_config_free(struct kmod_config *config)
> 	while (config->softdeps)
> 		kmod_config_free_softdep(config, config->softdeps);
>
>+	while (config->weakdeps)
>+		kmod_config_free_weakdep(config, config->weakdeps);
>+
> 	for (; config->paths != NULL;
> 				config->paths = kmod_list_remove(config->paths))
> 		free(config->paths->data);
>@@ -889,6 +1067,7 @@ int kmod_config_new(struct kmod_ctx *ctx, struct kmod_config **p_config,
> 	size_t i;
>
> 	conf_files_insert_sorted(ctx, &list, kmod_get_dirname(ctx), "modules.softdep");
>+	conf_files_insert_sorted(ctx, &list, kmod_get_dirname(ctx), "modules.weakdep");
>
> 	for (i = 0; config_paths[i] != NULL; i++) {
> 		const char *path = config_paths[i];
>@@ -973,6 +1152,7 @@ enum config_type {
> 	CONFIG_TYPE_ALIAS,
> 	CONFIG_TYPE_OPTION,
> 	CONFIG_TYPE_SOFTDEP,
>+	CONFIG_TYPE_WEAKDEP,
> };
>
> struct kmod_config_iter {
>@@ -991,6 +1171,12 @@ static const char *softdep_get_plain_softdep(const struct kmod_list *l)
> 	return s;
> }
>
>+static const char *weakdep_get_plain_weakdep(const struct kmod_list *l)
>+{
>+	char *s = weakdep_to_char(l->data);
>+	return s;
>+}
>+
> static struct kmod_config_iter *kmod_config_iter_new(const struct kmod_ctx* ctx,
> 							enum config_type type)
> {
>@@ -1033,6 +1219,12 @@ static struct kmod_config_iter *kmod_config_iter_new(const struct kmod_ctx* ctx,
> 		iter->get_value = softdep_get_plain_softdep;
> 		iter->intermediate = true;
> 		break;
>+	case CONFIG_TYPE_WEAKDEP:
>+		iter->list = config->weakdeps;
>+		iter->get_key = kmod_weakdep_get_name;
>+		iter->get_value = weakdep_get_plain_weakdep;
>+		iter->intermediate = true;
>+		break;
> 	}
>
> 	return iter;
>@@ -1163,6 +1355,26 @@ KMOD_EXPORT struct kmod_config_iter *kmod_config_get_softdeps(const struct kmod_
> 	return kmod_config_iter_new(ctx, CONFIG_TYPE_SOFTDEP);
> }
>
>+/**
>+ * kmod_config_get_weakdeps:
>+ * @ctx: kmod library context
>+ *
>+ * Retrieve an iterator to deal with the weakdeps maintained inside the
>+ * library. See kmod_config_iter_get_key(), kmod_config_iter_get_value() and
>+ * kmod_config_iter_next(). At least one call to kmod_config_iter_next() must
>+ * be made to initialize the iterator and check if it's valid.
>+ *
>+ * Returns: a new iterator over the weakdeps or NULL on failure. Free it with
>+ * kmod_config_iter_free_iter().
>+ */
>+KMOD_EXPORT struct kmod_config_iter *kmod_config_get_weakdeps(const struct kmod_ctx *ctx)
>+{
>+	if (ctx == NULL)
>+		return NULL;;
>+
>+	return kmod_config_iter_new(ctx, CONFIG_TYPE_WEAKDEP);
>+}
>+
> /**
>  * kmod_config_iter_get_key:
>  * @iter: iterator over a certain configuration
>diff --git a/libkmod/libkmod-internal.h b/libkmod/libkmod-internal.h
>index 26a7e28..52ddbe6 100644
>--- a/libkmod/libkmod-internal.h
>+++ b/libkmod/libkmod-internal.h
>@@ -128,6 +128,7 @@ struct kmod_config {
> 	struct kmod_list *remove_commands;
> 	struct kmod_list *install_commands;
> 	struct kmod_list *softdeps;
>+	struct kmod_list *weakdeps;
>
> 	struct kmod_list *paths;
> };
>@@ -146,6 +147,8 @@ const char *kmod_softdep_get_name(const struct kmod_list *l) __attribute__((nonn
> const char * const *kmod_softdep_get_pre(const struct kmod_list *l, unsigned int *count) __attribute__((nonnull(1, 2)));
> const char * const *kmod_softdep_get_post(const struct kmod_list *l, unsigned int *count);
>
>+const char *kmod_weakdep_get_name(const struct kmod_list *l) __attribute__((nonnull(1)));
>+const char * const *kmod_weakdep_get_weak(const struct kmod_list *l, unsigned int *count) __attribute__((nonnull(1, 2)));
>
> /* libkmod-module.c */
> int kmod_module_new_from_alias(struct kmod_ctx *ctx, const char *alias, const char *name, struct kmod_module **mod);
>diff --git a/libkmod/libkmod-module.c b/libkmod/libkmod-module.c
>index 585da41..4f23ffb 100644
>--- a/libkmod/libkmod-module.c
>+++ b/libkmod/libkmod-module.c
>@@ -1589,7 +1589,7 @@ void kmod_module_set_install_commands(struct kmod_module *mod, const char *cmd)
> 	mod->install_commands = cmd;
> }
>
>-static struct kmod_list *lookup_softdep(struct kmod_ctx *ctx, const char * const * array, unsigned int count)
>+static struct kmod_list *lookup_dep(struct kmod_ctx *ctx, const char * const * array, unsigned int count)
> {
> 	struct kmod_list *ret = NULL;
> 	unsigned i;
>@@ -1601,7 +1601,7 @@ static struct kmod_list *lookup_softdep(struct kmod_ctx *ctx, const char * const
>
> 		err = kmod_module_new_from_lookup(ctx, depname, &lst);
> 		if (err < 0) {
>-			ERR(ctx, "failed to lookup soft dependency '%s', continuing anyway.\n", depname);
>+			ERR(ctx, "failed to lookup dependency '%s', continuing anyway.\n", depname);
> 			continue;
> 		} else if (lst != NULL)
> 			ret = kmod_list_append_list(ret, lst);
>@@ -1650,9 +1650,59 @@ KMOD_EXPORT int kmod_module_get_softdeps(const struct kmod_module *mod,
> 			continue;
>
> 		array = kmod_softdep_get_pre(l, &count);
>-		*pre = lookup_softdep(mod->ctx, array, count);
>+		*pre = lookup_dep(mod->ctx, array, count);
> 		array = kmod_softdep_get_post(l, &count);
>-		*post = lookup_softdep(mod->ctx, array, count);
>+		*post = lookup_dep(mod->ctx, array, count);
>+
>+		/*
>+		 * find only the first command, as modprobe from
>+		 * module-init-tools does
>+		 */
>+		break;
>+	}
>+
>+	return 0;
>+}
>+
>+/*
>+ * kmod_module_get_weakdeps:
>+ * @mod: kmod module
>+ * @weak: where to save the list of weak dependencies.
>+ *
>+ * Get weak dependencies for this kmod module. Weak dependencies come
>+ * from configuration file and are not cached in @mod because it may include
>+ * dependency cycles that would make we leak kmod_module. Any call
>+ * to this function will search for this module in configuration, allocate a
>+ * list and return the result.
>+ *
>+ * @weak is newly created list of kmod_module and
>+ * should be unreferenced with kmod_module_unref_list().
>+ *
>+ * Returns: 0 on success or < 0 otherwise.
>+ */
>+KMOD_EXPORT int kmod_module_get_weakdeps(const struct kmod_module *mod,
>+						struct kmod_list **weak)
>+{
>+	const struct kmod_list *l;
>+	const struct kmod_config *config;
>+
>+	if (mod == NULL || weak == NULL)
>+		return -ENOENT;
>+
>+	assert(*weak == NULL);
>+
>+	config = kmod_get_config(mod->ctx);
>+
>+	kmod_list_foreach(l, config->weakdeps) {
>+		const char *modname = kmod_weakdep_get_name(l);
>+		const char * const *array;
>+		unsigned count;
>+
>+		if (fnmatch(modname, mod->name, 0) != 0)
>+			continue;
>+
>+		array = kmod_weakdep_get_weak(l, &count);
>+		*weak = lookup_dep(mod->ctx, array, count);
>
> 		/*
> 		 * find only the first command, as modprobe from
>diff --git a/libkmod/libkmod.h b/libkmod/libkmod.h
>index 7251aa7..fce66d1 100644
>--- a/libkmod/libkmod.h
>+++ b/libkmod/libkmod.h
>@@ -112,6 +112,7 @@ struct kmod_config_iter *kmod_config_get_remove_commands(const struct kmod_ctx *
> struct kmod_config_iter *kmod_config_get_aliases(const struct kmod_ctx *ctx);
> struct kmod_config_iter *kmod_config_get_options(const struct kmod_ctx *ctx);
> struct kmod_config_iter *kmod_config_get_softdeps(const struct kmod_ctx *ctx);
>+struct kmod_config_iter *kmod_config_get_weakdeps(const struct kmod_ctx *ctx);
> const char *kmod_config_iter_get_key(const struct kmod_config_iter *iter);
> const char *kmod_config_iter_get_value(const struct kmod_config_iter *iter);
> bool kmod_config_iter_next(struct kmod_config_iter *iter);
>@@ -196,6 +197,8 @@ const char *kmod_module_get_remove_commands(const struct kmod_module *mod);
> struct kmod_list *kmod_module_get_dependencies(const struct kmod_module *mod);
> int kmod_module_get_softdeps(const struct kmod_module *mod,
> 				struct kmod_list **pre, struct kmod_list **post);
>+int kmod_module_get_weakdeps(const struct kmod_module *mod,
>+				struct kmod_list **weak);
> int kmod_module_get_filtered_blacklist(const struct kmod_ctx *ctx,
> 					const struct kmod_list *input,
> 					struct kmod_list **output) __attribute__ ((deprecated));
>diff --git a/libkmod/libkmod.sym b/libkmod/libkmod.sym
>index 0c04fda..0d6d338 100644
>--- a/libkmod/libkmod.sym
>+++ b/libkmod/libkmod.sym
>@@ -21,6 +21,7 @@ global:
> 	kmod_config_get_aliases;
> 	kmod_config_get_options;
> 	kmod_config_get_softdeps;
>+	kmod_config_get_weakdeps;
> 	kmod_config_iter_get_key;
> 	kmod_config_iter_get_value;
> 	kmod_config_iter_next;
>@@ -42,6 +43,7 @@ global:
>
> 	kmod_module_get_dependencies;
> 	kmod_module_get_softdeps;
>+	kmod_module_get_weakdeps;
> 	kmod_module_get_filtered_blacklist;
>
> 	kmod_module_get_name;
>diff --git a/man/modprobe.d.5.xml b/man/modprobe.d.5.xml
>index 2bf6537..cc90da6 100644
>--- a/man/modprobe.d.5.xml
>+++ b/man/modprobe.d.5.xml
>@@ -212,6 +212,30 @@
>           </para>
>         </listitem>
>       </varlistentry>
>+      <varlistentry>
>+        <term>weakdep <replaceable>modulename</replaceable> <replaceable>modules...</replaceable>
>+        </term>
>+        <listitem>
>+          <para>
>+            The <command>weakdep</command> command allows you to specify weak module
>+            dependencies. Those are similar to pre softdep, with the
>+            difference that userspace doesn't attempt to load that
>+            dependency before the specified module. Instead the kernel
>+            may request one or multiple of them during module probe,
>+            depending on the hardware it's binding to. The purpose of
>+            weak module is to allow a driver to specify that a certain
>+            dependency may be needed, so it should be present in the
>+            filesystem (e.g. in initramfs) when that module is probed.
>+          </para>
>+	  <para>
>+            Example: Assume "weakdep c a b". A program creating an
>+            initramfs knows it should add a, b, and c to the filesystem
>+            since a and b may be required/desired at runtime. When c is
>+            loaded and is being probed, it may issue calls to
>+            request_module() causing a or b to also be loaded.
>+          </para>
>+        </listitem>
>+      </varlistentry>
>     </variablelist>
>   </refsect1>
>   <refsect1><title>COMPATIBILITY</title>
>diff --git a/tools/depmod.c b/tools/depmod.c
>index 43fc354..06618fa 100644
>--- a/tools/depmod.c
>+++ b/tools/depmod.c

I'd keep this in a separate patch, but ok.

>@@ -2296,6 +2296,30 @@ static int output_softdeps(struct depmod *depmod, FILE *out)
> 	return 0;
> }
>
>+static int output_weakdeps(struct depmod *depmod, FILE *out)
>+{
>+	size_t i;
>+
>+	fputs("# Weak dependencies extracted from modules themselves.\n", out);
>+
>+	for (i = 0; i < depmod->modules.count; i++) {
>+		const struct mod *mod = depmod->modules.array[i];
>+		struct kmod_list *l;
>+
>+		kmod_list_foreach(l, mod->info_list) {
>+			const char *key = kmod_module_info_get_key(l);
>+			const char *value = kmod_module_info_get_value(l);
>+
>+			if (!streq(key, "weakdep"))
>+				continue;
>+
>+			fprintf(out, "weakdep %s %s\n", mod->modname, value);
>+		}
>+	}
>+
>+	return 0;
>+}
>+
> static int output_symbols(struct depmod *depmod, FILE *out)
> {
> 	struct hash_iter iter;
>@@ -2574,6 +2598,7 @@ static int depmod_output(struct depmod *depmod, FILE *out)
> 		{ "modules.alias", output_aliases },
> 		{ "modules.alias.bin", output_aliases_bin },
> 		{ "modules.softdep", output_softdeps },
>+		{ "modules.weakdep", output_weakdeps },
> 		{ "modules.symbols", output_symbols },
> 		{ "modules.symbols.bin", output_symbols_bin },
> 		{ "modules.builtin.bin", output_builtin_bin },
>diff --git a/tools/modprobe.c b/tools/modprobe.c
>index 5306bef..4328da6 100644
>--- a/tools/modprobe.c
>+++ b/tools/modprobe.c
>@@ -182,6 +182,7 @@ static int show_config(struct kmod_ctx *ctx)
> 		{ "alias", kmod_config_get_aliases },
> 		{ "options", kmod_config_get_options },
> 		{ "softdep", kmod_config_get_softdeps },
>+		{ "weakdep", kmod_config_get_weakdeps },

things look good here, thanks for doing this

I think next step would be to add some tests to our testsuite to make
sure we are parsing things correctly. Could you take a look in in
`git grep softdep` testsuite/ to take inspiration on how to write one
for weakdep? it seems we only have 1 test for a failure scenrario, but
we could add more too.

Tests I'm looking for:

1) make sure we don't load a module due to being a weakdep
2) make sure depmod outputs the weakdep correctly
3) make sure the weakdep is parsed correctly from the conf file

Anyway,

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

and pushed.

thanks
Lucas De Marchi

> 	};
> 	size_t i;
>
>-- 
>2.44.0
>

