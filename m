Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 194C84C00C6
	for <lists+linux-modules@lfdr.de>; Tue, 22 Feb 2022 18:59:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbiBVR7g (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Tue, 22 Feb 2022 12:59:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234315AbiBVR7f (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Tue, 22 Feb 2022 12:59:35 -0500
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90045.outbound.protection.outlook.com [40.107.9.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02A2417187F;
        Tue, 22 Feb 2022 09:59:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jffp2EWW8gdKc2PrRLaWKNeNwzhC7tV2tfVtLEYXaUZZc87BSoiWtuR0Uc3bf2sVldpyzgqBzdIF2mHLKbVrB/JCcunpdMjK9o8k081Ll1WOWrqs3iuGi68Qf8XwdwKaV1iiLzn7H1gGGkPSwPEh9BatSr3k6fVR6VLKSBU6OghejiPhh2XaB2TnnPyUnKU6ktQHKvj2x7cZCJLVlbs/uwlunGLAT1YdMfNOnWt77gUqKAZTQIaLOSKM3bqrf2vV72jUzOFxZ61PFrsspE8ybcoVDIy5f+g1ADENynkAYxxE9yNnIZukfwKOL5dAzeEcfz+hVbfy8IF4KZjgkUixrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wiMc/cQtleLTCGsuehl+Zmd+5GGFH515AhKWVmGqV0w=;
 b=h5+K7pInk6VLuGdP4mv9uf1sWrLPw9tcJ+6MshTq3DqJ9nFe5BO53M369DV9MsY1IQ/npfbwTdKqAm/lzS11s+f7EipY86cEWOlN+n4h/PbTDGoqiNBmImU3C0sN1R4dqgWyWzznuuMxjRskE73i3C84GFjUYeUBz7LsgzoS+nfnopio3fQBhCvxvD9+VeICB7cUTtlwDCL7wkcyx1jRnC0e0I9Ai0iyKKN/wo1xCU6BAkMjIY6mQ+9wuq53MEwrn5v4BaFkKCmtrjDYHNPr3+FAvUVAGhNY81zQQy2Uv9mfeWC7wmME5Nksqn+IBX0+BzeDYkUDP5Zl/+0FpkqZlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3442.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:26::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Tue, 22 Feb
 2022 17:59:07 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8142:2e6f:219b:646d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8142:2e6f:219b:646d%5]) with mapi id 15.20.5017.021; Tue, 22 Feb 2022
 17:59:07 +0000
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
To:     Aaron Tomlin <atomlin@redhat.com>,
        "mcgrof@kernel.org" <mcgrof@kernel.org>
CC:     "cl@linux.com" <cl@linux.com>,
        "pmladek@suse.com" <pmladek@suse.com>,
        "mbenes@suse.cz" <mbenes@suse.cz>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "jeyu@kernel.org" <jeyu@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
        "void@manifault.com" <void@manifault.com>,
        "atomlin@atomlin.com" <atomlin@atomlin.com>,
        "allen.lkml@gmail.com" <allen.lkml@gmail.com>,
        "joe@perches.com" <joe@perches.com>,
        "msuchanek@suse.de" <msuchanek@suse.de>,
        "oleksandr@natalenko.name" <oleksandr@natalenko.name>
Subject: Re: [PATCH v8 06/13] module: Move strict rwx support to a separate
 file
Thread-Topic: [PATCH v8 06/13] module: Move strict rwx support to a separate
 file
Thread-Index: AQHYJ/ZXAyGPzwkG6EasNAQTz4g3Nqyf29cA
Date:   Tue, 22 Feb 2022 17:59:06 +0000
Message-ID: <4a740d5d-6130-62e1-85e2-e429e5f4525e@csgroup.eu>
References: <20220222141303.1392190-1-atomlin@redhat.com>
 <20220222141303.1392190-7-atomlin@redhat.com>
In-Reply-To: <20220222141303.1392190-7-atomlin@redhat.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ecbe5e7b-2b8d-4273-767a-08d9f62d052f
x-ms-traffictypediagnostic: MR1P264MB3442:EE_
x-microsoft-antispam-prvs: <MR1P264MB3442CF9467368A37C3AB1CC1ED3B9@MR1P264MB3442.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Rv2jvvlqKwSs3g3PSyGCn0WkYKQ+f3gA/jiKzRhdRDmyOUYm01YlclYN+aHzy6hxYrH3a+oKG000hKE6cKQLjaTrXs7N6nu7o8GVAY8GezRGLPaL0HdhzV2wvKZVLUpXYmLFUlRrsJuyovGBrxRnP+zFIIZebZoLd1u5DkRPUP9ODA5Zk5aW/elH+4iOZmtkQdLv2eh3yL38A0eZU58q0Gu/q8Cd4ZZyQIWEdoslJ7mNLGj3OZHfqo0ZZWv+l2+usI0lXNlN/hnlVb0GEWDR0nCEYgTkR+JQwv9iPzWgFY1D4PVdE61+ZAQr61RkNoAb/iaD6GQMaJ1a99AEI9cx5ho0evuVb7O7kQUjRvBA2lvIwMwYklCyGlBfi65tF4Og17R76yf1OTzFOTk548ybn872erYVXWqi94MsK2jX81Q5eve85GL32VPF4vQxDGnzpu3pQzvDiXgx+NScsKsAgqmiPvcEdYlaEaB1QPDIgA5sSD3AszhuZjqmWc6+xIlonw1m0Ex6ZOkCfJvbp2htS/AGZL3MULI71bOHy97jv6W/My5aFEme/81blqd+0Pwe2Gxhb3o0DGlb3ZwcQIXRmsA2roP9vuh1rrLZ1SH9yt1rQSzQ1zCeUfQQgQBvUrI3KPd1H1PcM1JK4Fosy5394laR7nvPyltmOOqoWfBjMEb17+x4lj/fpbvLQEU5hrLIureQhkUbpQsotgm5wzMxSoQmm+b+hDHt9STrdqOqYKy/xDNxoKm1SXVpglEnG53zkXoAdi8o3tPG2X2lZ7LZBg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(30864003)(7416002)(508600001)(6486002)(91956017)(66946007)(76116006)(86362001)(66556008)(4326008)(64756008)(31696002)(8676002)(66446008)(316002)(8936002)(71200400001)(44832011)(66476007)(186003)(26005)(38100700002)(36756003)(122000001)(38070700005)(2906002)(2616005)(31686004)(110136005)(6512007)(54906003)(6506007)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WGRRUlNFWFhGdnNZNTBZMmJMR3VHZStGZU1USmNjbTgwZnRnbnZIZUR1U3dK?=
 =?utf-8?B?SUZKcE1LaitmSmwvY0lnUTM5Y2hZejRSSG9rVmZzTzE0Y1lGR1hWSG41ZUxT?=
 =?utf-8?B?ZXYwcVJmNWdLYSszem0xWTZ6Z1hMNHhlazR0aEhlVXhGdEd4RlVSTmpITFdJ?=
 =?utf-8?B?QjZPWWE4RzJod1l1c3FzRXJIa0RkVzdzUVAzb21TbkNoTW5HNHVqSm5jUTRp?=
 =?utf-8?B?aU5KYVZPZDk4SHg1OTM2ZVdLSjBwN3JGd2hOZFFNMEw2T0Q1QzVCdWpZZEIz?=
 =?utf-8?B?RE1abGU0OWhQRWFWU0pkMDJuT2dvREVXMmpHaWU5ZGlqOWVmOFV1eWxKRFQ1?=
 =?utf-8?B?Q1dadEFmMmpxNjNvcXV1Vm95SVExQ05YeDhPQWRndXl3RldmUGVRY0E1L0dm?=
 =?utf-8?B?dHhFaUo2S2NRMFppc2VtZ1Z4ajg4ekF2MEFQY1JTMDRLWXVaMDVVYXFYbldP?=
 =?utf-8?B?dmduTkhRQUt0WmJLZ21TK2tXenVzYU9nQVVRa3VCd0kwaTR3TzJNRVRNRndL?=
 =?utf-8?B?YitKT0doTzdSVnllalJrclpTekkrMzl5L3FtQXM1K2lFdHVqbjUzYWtwSHMz?=
 =?utf-8?B?Q3dCdVJRckVPR3V3MnhwRFF2dGlWSVlHTVRmTlc4T2dLMjhnL1hzbnNOK2ZU?=
 =?utf-8?B?KzRselRxQ1dXZ2ptbEszQVlnbHRXMk5meERaWUxsMCtiRlViZmhpSjFMMGNJ?=
 =?utf-8?B?UE1qbm1xNkZObkxpVm9PUytQQzYxZzJ6Q2xwYXRpNzFkSXdxcWoyQ2hVaVNj?=
 =?utf-8?B?K21nVkRHbEZ2YSt4ekxjeXp6L3JqMkw0NVRqTVJnZE1CWkZRTnNDcVV1dzlz?=
 =?utf-8?B?TXIxdVUwSDVBajR0TFQzUExlbDlvNjRzVnNMUEsyZTB4c2VWSkZZN3FVa2I4?=
 =?utf-8?B?b3hBT0wwb0tvUUlBU1BFc1VDVUhRRXR2K092M0daRTZ6eGtYY0YwaHl0YTZW?=
 =?utf-8?B?cHAwcnJqVHd6ZEhyYmFnNDFCM1c1ZGVoUWxoMXFWOXVieGNpUTN0L1g5ZjNm?=
 =?utf-8?B?aHZNNnUrTDJ2VXltMjR4WWRRZlRWd0N0aEJUS0dBb044OG1PMDdNN0lPcUtq?=
 =?utf-8?B?Ym1LSjJ5d3h4NU1JNVBta0UyWnU3T01ZWUo4eGJGdmxKalhRYlYxd043YlF5?=
 =?utf-8?B?VldWaUl6dlZSZUhnQXNEcnF6NTFvaEwvbHhLMmFNT0ZFcFhwdjRzN2ZEMWgv?=
 =?utf-8?B?RXR2cmVrZmhhNlpwdlNDZHppU3dTSVNsQ1hrUG9LaVZoMW04Y2ViaEVDU3Fy?=
 =?utf-8?B?ekpOczVjTFN2dmV0VmExRFNsR3JqaFB5TVM3LzlyVEpOZHBaUUVIYlFmOVNJ?=
 =?utf-8?B?VGxpcForWkdrb1lPUW1DNzhldHBkQXFSU09RVDQ0UEEwUm5Objl5Yy81N1N2?=
 =?utf-8?B?eHFMQm4xVUt0ZDV3bEQxZ0tKZ3pQTzluT3dTZGVjeHJLd2JKSTY4RG8wNEhn?=
 =?utf-8?B?MnNtTkg0OTlnRXdOZWM4RHk4RzBVVTB2NmVKOFJTaTN5UzdTSFJRUTZLMVpI?=
 =?utf-8?B?UE1GeW0yemcwbXlHTGJkQ052TTF2eGUzVGNHSGpabjZ4QVJUUWVZNnZsRDZT?=
 =?utf-8?B?TDVxcy8wSlY1VExVN09RN0VKMVA3KzhBTkxXNnJRNmR5MFF0TGFQSlNMY0cv?=
 =?utf-8?B?dXhLRTE2M01YdFl4VmxnYW5hQU9yQ2dENGNvU2c0b09OSDZhZTRhZ1RUTCt1?=
 =?utf-8?B?Sm5NSVZVeUFSTTI3eEVUK1A3M3p5Q0lObVRSU0hPQVY0dWNPdUxJZC8ydGpa?=
 =?utf-8?B?WVlvVjY3WnRqYXNidHJkeGkrOHdPUE1xbzJxRmE5dXdzdE92Ym02Z3ZSK3Rs?=
 =?utf-8?B?aTdIaENVTDhCRmJZQTlMbzBVZnBjTWp4akZUTUpaNUQxU0p3SjB1SG5idVpv?=
 =?utf-8?B?TFBOV3pJSXB5eUFIOWd2ZURGK3JCRjM0QVdodXNjakNVTFROVTZmUVhvQWtW?=
 =?utf-8?B?V0R1WUFlWXZibm9nbXBPUnlJMjBLeUp2ZG5CRDFybFRmQmQ3L1lORS8xU2Zp?=
 =?utf-8?B?UTh1RkQ0LzZKUGpkT0czV0xwMFFjdzBwT01mZmU2QlRpd0pOODY0RkQwbXN3?=
 =?utf-8?B?V043S0NyM0lNU2toUmYvVFRMU2VYMnQxeE5UT2wyeUZRSzFBRDNlYkplMVNX?=
 =?utf-8?B?R3JjVUhiYmNpMjgxRHp6c1FyZGdublJabWNmYWgyRm9BcmI1M3ZjTWNXclJQ?=
 =?utf-8?B?dGxQVXdlRW1NNm01K0pMZWFOSTZXdnUzYjVleHRMYWVxNk9JbGRrTkxueFg3?=
 =?utf-8?Q?OxGAzhXBQ5nLdWgq5gQiJwX59Vbx1p8Q/iIpCkomRE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0CADA5962DC8A9489C7C936262E168E7@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ecbe5e7b-2b8d-4273-767a-08d9f62d052f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2022 17:59:06.9968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tdUXHv/E6Zi23Ve/+ozsMi1m4e4FVKsQpma7QH0uSsZXqJVtzc2UNPqzENKj/jLBUc9xpanGaoy7S2dIsbe9vnxVn9fEJiKa1alEkQbKvDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3442
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

DQoNCkxlIDIyLzAyLzIwMjIgw6AgMTU6MTIsIEFhcm9uIFRvbWxpbiBhIMOpY3JpdMKgOg0KPiBO
byBmdW5jdGlvbmFsIGNoYW5nZS4NCj4gDQo+IFRoaXMgcGF0Y2ggbWlncmF0ZXMgY29kZSB0aGF0
IG1ha2VzIG1vZHVsZSB0ZXh0DQo+IGFuZCByb2RhdGEgbWVtb3J5IHJlYWQtb25seSBhbmQgbm9u
LXRleHQgbWVtb3J5DQo+IG5vbi1leGVjdXRhYmxlIGZyb20gY29yZSBtb2R1bGUgY29kZSBpbnRv
DQo+IGtlcm5lbC9tb2R1bGUvc3RyaWN0X3J3eC5jLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWFy
b24gVG9tbGluIDxhdG9tbGluQHJlZGhhdC5jb20+DQoNClJldmlld2VkLWJ5OiBDaHJpc3RvcGhl
IExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQoNCj4gLS0tDQo+ICAga2VybmVs
L21vZHVsZS9NYWtlZmlsZSAgICAgfCAgMSArDQo+ICAga2VybmVsL21vZHVsZS9pbnRlcm5hbC5o
ICAgfCAzMiArKysrKysrKysrKysNCj4gICBrZXJuZWwvbW9kdWxlL21haW4uYyAgICAgICB8IDk5
ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAga2VybmVsL21vZHVs
ZS9zdHJpY3Rfcnd4LmMgfCA4NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAg
IDQgZmlsZXMgY2hhbmdlZCwgMTIwIGluc2VydGlvbnMoKyksIDk3IGRlbGV0aW9ucygtKQ0KPiAg
IGNyZWF0ZSBtb2RlIDEwMDY0NCBrZXJuZWwvbW9kdWxlL3N0cmljdF9yd3guYw0KPiANCj4gZGlm
ZiAtLWdpdCBhL2tlcm5lbC9tb2R1bGUvTWFrZWZpbGUgYi9rZXJuZWwvbW9kdWxlL01ha2VmaWxl
DQo+IGluZGV4IDg4Nzc0ZTM4NjI3Ni4uZDMxM2M4NDcyY2IzIDEwMDY0NA0KPiAtLS0gYS9rZXJu
ZWwvbW9kdWxlL01ha2VmaWxlDQo+ICsrKyBiL2tlcm5lbC9tb2R1bGUvTWFrZWZpbGUNCj4gQEAg
LTEyLDMgKzEyLDQgQEAgb2JqLSQoQ09ORklHX01PRFVMRV9ERUNPTVBSRVNTKSArPSBkZWNvbXBy
ZXNzLm8NCj4gICBvYmotJChDT05GSUdfTU9EVUxFX1NJRykgKz0gc2lnbmluZy5vDQo+ICAgb2Jq
LSQoQ09ORklHX0xJVkVQQVRDSCkgKz0gbGl2ZXBhdGNoLm8NCj4gICBvYmotJChDT05GSUdfTU9E
VUxFU19UUkVFX0xPT0tVUCkgKz0gdHJlZV9sb29rdXAubw0KPiArb2JqLSQoQ09ORklHX1NUUklD
VF9NT0RVTEVfUldYKSArPSBzdHJpY3Rfcnd4Lm8NCj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9tb2R1
bGUvaW50ZXJuYWwuaCBiL2tlcm5lbC9tb2R1bGUvaW50ZXJuYWwuaA0KPiBpbmRleCBmMTY4MmUz
Njc3YmUuLmE2ODk1YmI1NTk4YSAxMDA2NDQNCj4gLS0tIGEva2VybmVsL21vZHVsZS9pbnRlcm5h
bC5oDQo+ICsrKyBiL2tlcm5lbC9tb2R1bGUvaW50ZXJuYWwuaA0KPiBAQCAtMjAsNiArMjAsMTcg
QEANCj4gICAvKiBNYXhpbXVtIG51bWJlciBvZiBjaGFyYWN0ZXJzIHdyaXR0ZW4gYnkgbW9kdWxl
X2ZsYWdzKCkgKi8NCj4gICAjZGVmaW5lIE1PRFVMRV9GTEFHU19CVUZfU0laRSAoVEFJTlRfRkxB
R1NfQ09VTlQgKyA0KQ0KPiAgIA0KPiArLyoNCj4gKyAqIE1vZHVsZXMnIHNlY3Rpb25zIHdpbGwg
YmUgYWxpZ25lZCBvbiBwYWdlIGJvdW5kYXJpZXMNCj4gKyAqIHRvIGVuc3VyZSBjb21wbGV0ZSBz
ZXBhcmF0aW9uIG9mIGNvZGUgYW5kIGRhdGEsIGJ1dA0KPiArICogb25seSB3aGVuIENPTkZJR19B
UkNIX0hBU19TVFJJQ1RfTU9EVUxFX1JXWD15DQo+ICsgKi8NCj4gKyNpZmRlZiBDT05GSUdfQVJD
SF9IQVNfU1RSSUNUX01PRFVMRV9SV1gNCj4gKyMgZGVmaW5lIGRlYnVnX2FsaWduKFgpIFBBR0Vf
QUxJR04oWCkNCj4gKyNlbHNlDQo+ICsjIGRlZmluZSBkZWJ1Z19hbGlnbihYKSAoWCkNCj4gKyNl
bmRpZg0KPiArDQo+ICAgZXh0ZXJuIHN0cnVjdCBtdXRleCBtb2R1bGVfbXV0ZXg7DQo+ICAgZXh0
ZXJuIHN0cnVjdCBsaXN0X2hlYWQgbW9kdWxlczsNCj4gICANCj4gQEAgLTEyNiwzICsxMzcsMjQg
QEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgbW9kdWxlICptb2RfZmluZCh1bnNpZ25lZCBsb25nIGFk
ZHIpDQo+ICAgCXJldHVybiBOVUxMOw0KPiAgIH0NCj4gICAjZW5kaWYgLyogQ09ORklHX01PRFVM
RVNfVFJFRV9MT09LVVAgKi8NCj4gKw0KPiArI2lmZGVmIENPTkZJR19BUkNIX0hBU19TVFJJQ1Rf
TU9EVUxFX1JXWA0KPiArdm9pZCBmcm9iX3RleHQoY29uc3Qgc3RydWN0IG1vZHVsZV9sYXlvdXQg
KmxheW91dCwgaW50ICgqc2V0X21lbW9yeSkodW5zaWduZWQgbG9uZyBzdGFydCwNCj4gKwkJCQkJ
CQkJICAgICBpbnQgbnVtX3BhZ2VzKSk7DQo+ICsjZW5kaWYgLyogQ09ORklHX0FSQ0hfSEFTX1NU
UklDVF9NT0RVTEVfUldYICovDQo+ICsNCj4gKyNpZmRlZiBDT05GSUdfU1RSSUNUX01PRFVMRV9S
V1gNCj4gK3ZvaWQgbW9kdWxlX2VuYWJsZV9ybyhjb25zdCBzdHJ1Y3QgbW9kdWxlICptb2QsIGJv
b2wgYWZ0ZXJfaW5pdCk7DQo+ICt2b2lkIG1vZHVsZV9lbmFibGVfbngoY29uc3Qgc3RydWN0IG1v
ZHVsZSAqbW9kKTsNCj4gK2ludCBtb2R1bGVfZW5mb3JjZV9yd3hfc2VjdGlvbnMoRWxmX0VoZHIg
KmhkciwgRWxmX1NoZHIgKnNlY2hkcnMsDQo+ICsJCQkJY2hhciAqc2Vjc3RyaW5ncywgc3RydWN0
IG1vZHVsZSAqbW9kKTsNCj4gKw0KPiArI2Vsc2UgLyogIUNPTkZJR19TVFJJQ1RfTU9EVUxFX1JX
WCAqLw0KPiArc3RhdGljIGlubGluZSB2b2lkIG1vZHVsZV9lbmFibGVfbngoY29uc3Qgc3RydWN0
IG1vZHVsZSAqbW9kKSB7IH0NCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBtb2R1bGVfZW5hYmxlX3Jv
KGNvbnN0IHN0cnVjdCBtb2R1bGUgKm1vZCwgYm9vbCBhZnRlcl9pbml0KSB7fQ0KPiArc3RhdGlj
IGlubGluZSBpbnQgbW9kdWxlX2VuZm9yY2Vfcnd4X3NlY3Rpb25zKEVsZl9FaGRyICpoZHIsIEVs
Zl9TaGRyICpzZWNoZHJzLA0KPiArCQkJCSAgICAgICBjaGFyICpzZWNzdHJpbmdzLCBzdHJ1Y3Qg
bW9kdWxlICptb2QpDQo+ICt7DQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsjZW5kaWYgLyogQ09O
RklHX1NUUklDVF9NT0RVTEVfUldYICovDQo+IGRpZmYgLS1naXQgYS9rZXJuZWwvbW9kdWxlL21h
aW4uYyBiL2tlcm5lbC9tb2R1bGUvbWFpbi5jDQo+IGluZGV4IDc2YjUzODgwYWQ5MS4uNWNkNjNm
MTRiMWVmIDEwMDY0NA0KPiAtLS0gYS9rZXJuZWwvbW9kdWxlL21haW4uYw0KPiArKysgYi9rZXJu
ZWwvbW9kdWxlL21haW4uYw0KPiBAQCAtNjMsMTcgKzYzLDYgQEANCj4gICAjZGVmaW5lIENSRUFU
RV9UUkFDRV9QT0lOVFMNCj4gICAjaW5jbHVkZSA8dHJhY2UvZXZlbnRzL21vZHVsZS5oPg0KPiAg
IA0KPiAtLyoNCj4gLSAqIE1vZHVsZXMnIHNlY3Rpb25zIHdpbGwgYmUgYWxpZ25lZCBvbiBwYWdl
IGJvdW5kYXJpZXMNCj4gLSAqIHRvIGVuc3VyZSBjb21wbGV0ZSBzZXBhcmF0aW9uIG9mIGNvZGUg
YW5kIGRhdGEsIGJ1dA0KPiAtICogb25seSB3aGVuIENPTkZJR19BUkNIX0hBU19TVFJJQ1RfTU9E
VUxFX1JXWD15DQo+IC0gKi8NCj4gLSNpZmRlZiBDT05GSUdfQVJDSF9IQVNfU1RSSUNUX01PRFVM
RV9SV1gNCj4gLSMgZGVmaW5lIGRlYnVnX2FsaWduKFgpIEFMSUdOKFgsIFBBR0VfU0laRSkNCj4g
LSNlbHNlDQo+IC0jIGRlZmluZSBkZWJ1Z19hbGlnbihYKSAoWCkNCj4gLSNlbmRpZg0KPiAtDQo+
ICAgLyoNCj4gICAgKiBNdXRleCBwcm90ZWN0czoNCj4gICAgKiAxKSBMaXN0IG9mIG1vZHVsZXMg
KGFsc28gc2FmZWx5IHJlYWRhYmxlIHdpdGggcHJlZW1wdF9kaXNhYmxlKSwNCj4gQEAgLTE4MTks
OCArMTgwOCw4IEBAIHN0YXRpYyB2b2lkIG1vZF9zeXNmc190ZWFyZG93bihzdHJ1Y3QgbW9kdWxl
ICptb2QpDQo+ICAgICogd2hldGhlciB3ZSBhcmUgc3RyaWN0Lg0KPiAgICAqLw0KPiAgICNpZmRl
ZiBDT05GSUdfQVJDSF9IQVNfU1RSSUNUX01PRFVMRV9SV1gNCj4gLXN0YXRpYyB2b2lkIGZyb2Jf
dGV4dChjb25zdCBzdHJ1Y3QgbW9kdWxlX2xheW91dCAqbGF5b3V0LA0KPiAtCQkgICAgICBpbnQg
KCpzZXRfbWVtb3J5KSh1bnNpZ25lZCBsb25nIHN0YXJ0LCBpbnQgbnVtX3BhZ2VzKSkNCj4gK3Zv
aWQgZnJvYl90ZXh0KGNvbnN0IHN0cnVjdCBtb2R1bGVfbGF5b3V0ICpsYXlvdXQsDQo+ICsJICAg
ICAgIGludCAoKnNldF9tZW1vcnkpKHVuc2lnbmVkIGxvbmcgc3RhcnQsIGludCBudW1fcGFnZXMp
KQ0KPiAgIHsNCj4gICAJQlVHX09OKCh1bnNpZ25lZCBsb25nKWxheW91dC0+YmFzZSAmIChQQUdF
X1NJWkUtMSkpOw0KPiAgIAlCVUdfT04oKHVuc2lnbmVkIGxvbmcpbGF5b3V0LT50ZXh0X3NpemUg
JiAoUEFHRV9TSVpFLTEpKTsNCj4gQEAgLTE4MzcsOTAgKzE4MjYsNiBAQCBzdGF0aWMgdm9pZCBt
b2R1bGVfZW5hYmxlX3goY29uc3Qgc3RydWN0IG1vZHVsZSAqbW9kKQ0KPiAgIHN0YXRpYyB2b2lk
IG1vZHVsZV9lbmFibGVfeChjb25zdCBzdHJ1Y3QgbW9kdWxlICptb2QpIHsgfQ0KPiAgICNlbmRp
ZiAvKiBDT05GSUdfQVJDSF9IQVNfU1RSSUNUX01PRFVMRV9SV1ggKi8NCj4gICANCj4gLSNpZmRl
ZiBDT05GSUdfU1RSSUNUX01PRFVMRV9SV1gNCj4gLXN0YXRpYyB2b2lkIGZyb2Jfcm9kYXRhKGNv
bnN0IHN0cnVjdCBtb2R1bGVfbGF5b3V0ICpsYXlvdXQsDQo+IC0JCQlpbnQgKCpzZXRfbWVtb3J5
KSh1bnNpZ25lZCBsb25nIHN0YXJ0LCBpbnQgbnVtX3BhZ2VzKSkNCj4gLXsNCj4gLQlCVUdfT04o
KHVuc2lnbmVkIGxvbmcpbGF5b3V0LT5iYXNlICYgKFBBR0VfU0laRS0xKSk7DQo+IC0JQlVHX09O
KCh1bnNpZ25lZCBsb25nKWxheW91dC0+dGV4dF9zaXplICYgKFBBR0VfU0laRS0xKSk7DQo+IC0J
QlVHX09OKCh1bnNpZ25lZCBsb25nKWxheW91dC0+cm9fc2l6ZSAmIChQQUdFX1NJWkUtMSkpOw0K
PiAtCXNldF9tZW1vcnkoKHVuc2lnbmVkIGxvbmcpbGF5b3V0LT5iYXNlICsgbGF5b3V0LT50ZXh0
X3NpemUsDQo+IC0JCSAgIChsYXlvdXQtPnJvX3NpemUgLSBsYXlvdXQtPnRleHRfc2l6ZSkgPj4g
UEFHRV9TSElGVCk7DQo+IC19DQo+IC0NCj4gLXN0YXRpYyB2b2lkIGZyb2Jfcm9fYWZ0ZXJfaW5p
dChjb25zdCBzdHJ1Y3QgbW9kdWxlX2xheW91dCAqbGF5b3V0LA0KPiAtCQkJCWludCAoKnNldF9t
ZW1vcnkpKHVuc2lnbmVkIGxvbmcgc3RhcnQsIGludCBudW1fcGFnZXMpKQ0KPiAtew0KPiAtCUJV
R19PTigodW5zaWduZWQgbG9uZylsYXlvdXQtPmJhc2UgJiAoUEFHRV9TSVpFLTEpKTsNCj4gLQlC
VUdfT04oKHVuc2lnbmVkIGxvbmcpbGF5b3V0LT5yb19zaXplICYgKFBBR0VfU0laRS0xKSk7DQo+
IC0JQlVHX09OKCh1bnNpZ25lZCBsb25nKWxheW91dC0+cm9fYWZ0ZXJfaW5pdF9zaXplICYgKFBB
R0VfU0laRS0xKSk7DQo+IC0Jc2V0X21lbW9yeSgodW5zaWduZWQgbG9uZylsYXlvdXQtPmJhc2Ug
KyBsYXlvdXQtPnJvX3NpemUsDQo+IC0JCSAgIChsYXlvdXQtPnJvX2FmdGVyX2luaXRfc2l6ZSAt
IGxheW91dC0+cm9fc2l6ZSkgPj4gUEFHRV9TSElGVCk7DQo+IC19DQo+IC0NCj4gLXN0YXRpYyB2
b2lkIGZyb2Jfd3JpdGFibGVfZGF0YShjb25zdCBzdHJ1Y3QgbW9kdWxlX2xheW91dCAqbGF5b3V0
LA0KPiAtCQkJICAgICAgIGludCAoKnNldF9tZW1vcnkpKHVuc2lnbmVkIGxvbmcgc3RhcnQsIGlu
dCBudW1fcGFnZXMpKQ0KPiAtew0KPiAtCUJVR19PTigodW5zaWduZWQgbG9uZylsYXlvdXQtPmJh
c2UgJiAoUEFHRV9TSVpFLTEpKTsNCj4gLQlCVUdfT04oKHVuc2lnbmVkIGxvbmcpbGF5b3V0LT5y
b19hZnRlcl9pbml0X3NpemUgJiAoUEFHRV9TSVpFLTEpKTsNCj4gLQlCVUdfT04oKHVuc2lnbmVk
IGxvbmcpbGF5b3V0LT5zaXplICYgKFBBR0VfU0laRS0xKSk7DQo+IC0Jc2V0X21lbW9yeSgodW5z
aWduZWQgbG9uZylsYXlvdXQtPmJhc2UgKyBsYXlvdXQtPnJvX2FmdGVyX2luaXRfc2l6ZSwNCj4g
LQkJICAgKGxheW91dC0+c2l6ZSAtIGxheW91dC0+cm9fYWZ0ZXJfaW5pdF9zaXplKSA+PiBQQUdF
X1NISUZUKTsNCj4gLX0NCj4gLQ0KPiAtc3RhdGljIHZvaWQgbW9kdWxlX2VuYWJsZV9ybyhjb25z
dCBzdHJ1Y3QgbW9kdWxlICptb2QsIGJvb2wgYWZ0ZXJfaW5pdCkNCj4gLXsNCj4gLQlpZiAoIXJv
ZGF0YV9lbmFibGVkKQ0KPiAtCQlyZXR1cm47DQo+IC0NCj4gLQlzZXRfdm1fZmx1c2hfcmVzZXRf
cGVybXMobW9kLT5jb3JlX2xheW91dC5iYXNlKTsNCj4gLQlzZXRfdm1fZmx1c2hfcmVzZXRfcGVy
bXMobW9kLT5pbml0X2xheW91dC5iYXNlKTsNCj4gLQlmcm9iX3RleHQoJm1vZC0+Y29yZV9sYXlv
dXQsIHNldF9tZW1vcnlfcm8pOw0KPiAtDQo+IC0JZnJvYl9yb2RhdGEoJm1vZC0+Y29yZV9sYXlv
dXQsIHNldF9tZW1vcnlfcm8pOw0KPiAtCWZyb2JfdGV4dCgmbW9kLT5pbml0X2xheW91dCwgc2V0
X21lbW9yeV9ybyk7DQo+IC0JZnJvYl9yb2RhdGEoJm1vZC0+aW5pdF9sYXlvdXQsIHNldF9tZW1v
cnlfcm8pOw0KPiAtDQo+IC0JaWYgKGFmdGVyX2luaXQpDQo+IC0JCWZyb2Jfcm9fYWZ0ZXJfaW5p
dCgmbW9kLT5jb3JlX2xheW91dCwgc2V0X21lbW9yeV9ybyk7DQo+IC19DQo+IC0NCj4gLXN0YXRp
YyB2b2lkIG1vZHVsZV9lbmFibGVfbngoY29uc3Qgc3RydWN0IG1vZHVsZSAqbW9kKQ0KPiAtew0K
PiAtCWZyb2Jfcm9kYXRhKCZtb2QtPmNvcmVfbGF5b3V0LCBzZXRfbWVtb3J5X254KTsNCj4gLQlm
cm9iX3JvX2FmdGVyX2luaXQoJm1vZC0+Y29yZV9sYXlvdXQsIHNldF9tZW1vcnlfbngpOw0KPiAt
CWZyb2Jfd3JpdGFibGVfZGF0YSgmbW9kLT5jb3JlX2xheW91dCwgc2V0X21lbW9yeV9ueCk7DQo+
IC0JZnJvYl9yb2RhdGEoJm1vZC0+aW5pdF9sYXlvdXQsIHNldF9tZW1vcnlfbngpOw0KPiAtCWZy
b2Jfd3JpdGFibGVfZGF0YSgmbW9kLT5pbml0X2xheW91dCwgc2V0X21lbW9yeV9ueCk7DQo+IC19
DQo+IC0NCj4gLXN0YXRpYyBpbnQgbW9kdWxlX2VuZm9yY2Vfcnd4X3NlY3Rpb25zKEVsZl9FaGRy
ICpoZHIsIEVsZl9TaGRyICpzZWNoZHJzLA0KPiAtCQkJCSAgICAgICBjaGFyICpzZWNzdHJpbmdz
LCBzdHJ1Y3QgbW9kdWxlICptb2QpDQo+IC17DQo+IC0JY29uc3QgdW5zaWduZWQgbG9uZyBzaGZf
d3ggPSBTSEZfV1JJVEV8U0hGX0VYRUNJTlNUUjsNCj4gLQlpbnQgaTsNCj4gLQ0KPiAtCWZvciAo
aSA9IDA7IGkgPCBoZHItPmVfc2hudW07IGkrKykgew0KPiAtCQlpZiAoKHNlY2hkcnNbaV0uc2hf
ZmxhZ3MgJiBzaGZfd3gpID09IHNoZl93eCkgew0KPiAtCQkJcHJfZXJyKCIlczogc2VjdGlvbiAl
cyAoaW5kZXggJWQpIGhhcyBpbnZhbGlkIFdSSVRFfEVYRUMgZmxhZ3NcbiIsDQo+IC0JCQkJbW9k
LT5uYW1lLCBzZWNzdHJpbmdzICsgc2VjaGRyc1tpXS5zaF9uYW1lLCBpKTsNCj4gLQkJCXJldHVy
biAtRU5PRVhFQzsNCj4gLQkJfQ0KPiAtCX0NCj4gLQ0KPiAtCXJldHVybiAwOw0KPiAtfQ0KPiAt
DQo+IC0jZWxzZSAvKiAhQ09ORklHX1NUUklDVF9NT0RVTEVfUldYICovDQo+IC1zdGF0aWMgdm9p
ZCBtb2R1bGVfZW5hYmxlX254KGNvbnN0IHN0cnVjdCBtb2R1bGUgKm1vZCkgeyB9DQo+IC1zdGF0
aWMgdm9pZCBtb2R1bGVfZW5hYmxlX3JvKGNvbnN0IHN0cnVjdCBtb2R1bGUgKm1vZCwgYm9vbCBh
ZnRlcl9pbml0KSB7fQ0KPiAtc3RhdGljIGludCBtb2R1bGVfZW5mb3JjZV9yd3hfc2VjdGlvbnMo
RWxmX0VoZHIgKmhkciwgRWxmX1NoZHIgKnNlY2hkcnMsDQo+IC0JCQkJICAgICAgIGNoYXIgKnNl
Y3N0cmluZ3MsIHN0cnVjdCBtb2R1bGUgKm1vZCkNCj4gLXsNCj4gLQlyZXR1cm4gMDsNCj4gLX0N
Cj4gLSNlbmRpZiAvKiAgQ09ORklHX1NUUklDVF9NT0RVTEVfUldYICovDQo+IC0NCj4gICB2b2lk
IF9fd2VhayBtb2R1bGVfbWVtZnJlZSh2b2lkICptb2R1bGVfcmVnaW9uKQ0KPiAgIHsNCj4gICAJ
LyoNCj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9tb2R1bGUvc3RyaWN0X3J3eC5jIGIva2VybmVsL21v
ZHVsZS9zdHJpY3Rfcnd4LmMNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAw
MDAwMDAwLi43OTQ5ZGZkNDQ5YzINCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9rZXJuZWwvbW9k
dWxlL3N0cmljdF9yd3guYw0KPiBAQCAtMCwwICsxLDg1IEBADQo+ICsvLyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcg0KPiArLyoNCj4gKyAqIE1vZHVsZSBzdHJpY3Qg
cnd4DQo+ICsgKg0KPiArICogQ29weXJpZ2h0IChDKSAyMDE1IFJ1c3R5IFJ1c3NlbGwNCj4gKyAq
Lw0KPiArDQo+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ICsjaW5jbHVkZSA8bGludXgv
bW0uaD4NCj4gKyNpbmNsdWRlIDxsaW51eC92bWFsbG9jLmg+DQo+ICsjaW5jbHVkZSA8bGludXgv
c2V0X21lbW9yeS5oPg0KPiArI2luY2x1ZGUgImludGVybmFsLmgiDQo+ICsNCj4gK3N0YXRpYyB2
b2lkIGZyb2Jfcm9kYXRhKGNvbnN0IHN0cnVjdCBtb2R1bGVfbGF5b3V0ICpsYXlvdXQsDQo+ICsJ
CSBpbnQgKCpzZXRfbWVtb3J5KSh1bnNpZ25lZCBsb25nIHN0YXJ0LCBpbnQgbnVtX3BhZ2VzKSkN
Cj4gK3sNCj4gKwlCVUdfT04oIVBBR0VfQUxJR05FRChsYXlvdXQtPmJhc2UpKTsNCj4gKwlCVUdf
T04oIVBBR0VfQUxJR05FRChsYXlvdXQtPnRleHRfc2l6ZSkpOw0KPiArCUJVR19PTighUEFHRV9B
TElHTkVEKGxheW91dC0+cm9fc2l6ZSkpOw0KPiArCXNldF9tZW1vcnkoKHVuc2lnbmVkIGxvbmcp
bGF5b3V0LT5iYXNlICsgbGF5b3V0LT50ZXh0X3NpemUsDQo+ICsJCSAgIChsYXlvdXQtPnJvX3Np
emUgLSBsYXlvdXQtPnRleHRfc2l6ZSkgPj4gUEFHRV9TSElGVCk7DQo+ICt9DQo+ICsNCj4gK3N0
YXRpYyB2b2lkIGZyb2Jfcm9fYWZ0ZXJfaW5pdChjb25zdCBzdHJ1Y3QgbW9kdWxlX2xheW91dCAq
bGF5b3V0LA0KPiArCQkJaW50ICgqc2V0X21lbW9yeSkodW5zaWduZWQgbG9uZyBzdGFydCwgaW50
IG51bV9wYWdlcykpDQo+ICt7DQo+ICsJQlVHX09OKCFQQUdFX0FMSUdORUQobGF5b3V0LT5iYXNl
KSk7DQo+ICsJQlVHX09OKCFQQUdFX0FMSUdORUQobGF5b3V0LT5yb19zaXplKSk7DQo+ICsJQlVH
X09OKCFQQUdFX0FMSUdORUQobGF5b3V0LT5yb19hZnRlcl9pbml0X3NpemUpKTsNCj4gKwlzZXRf
bWVtb3J5KCh1bnNpZ25lZCBsb25nKWxheW91dC0+YmFzZSArIGxheW91dC0+cm9fc2l6ZSwNCj4g
KwkJICAgKGxheW91dC0+cm9fYWZ0ZXJfaW5pdF9zaXplIC0gbGF5b3V0LT5yb19zaXplKSA+PiBQ
QUdFX1NISUZUKTsNCj4gK30NCj4gKw0KPiArc3RhdGljIHZvaWQgZnJvYl93cml0YWJsZV9kYXRh
KGNvbnN0IHN0cnVjdCBtb2R1bGVfbGF5b3V0ICpsYXlvdXQsDQo+ICsJCQlpbnQgKCpzZXRfbWVt
b3J5KSh1bnNpZ25lZCBsb25nIHN0YXJ0LCBpbnQgbnVtX3BhZ2VzKSkNCj4gK3sNCj4gKwlCVUdf
T04oIVBBR0VfQUxJR05FRChsYXlvdXQtPmJhc2UpKTsNCj4gKwlCVUdfT04oIVBBR0VfQUxJR05F
RChsYXlvdXQtPnJvX2FmdGVyX2luaXRfc2l6ZSkpOw0KPiArCUJVR19PTighUEFHRV9BTElHTkVE
KGxheW91dC0+c2l6ZSkpOw0KPiArCXNldF9tZW1vcnkoKHVuc2lnbmVkIGxvbmcpbGF5b3V0LT5i
YXNlICsgbGF5b3V0LT5yb19hZnRlcl9pbml0X3NpemUsDQo+ICsJCSAgIChsYXlvdXQtPnNpemUg
LSBsYXlvdXQtPnJvX2FmdGVyX2luaXRfc2l6ZSkgPj4gUEFHRV9TSElGVCk7DQo+ICt9DQo+ICsN
Cj4gK3ZvaWQgbW9kdWxlX2VuYWJsZV9ybyhjb25zdCBzdHJ1Y3QgbW9kdWxlICptb2QsIGJvb2wg
YWZ0ZXJfaW5pdCkNCj4gK3sNCj4gKwlpZiAoIXJvZGF0YV9lbmFibGVkKQ0KPiArCQlyZXR1cm47
DQo+ICsNCj4gKwlzZXRfdm1fZmx1c2hfcmVzZXRfcGVybXMobW9kLT5jb3JlX2xheW91dC5iYXNl
KTsNCj4gKwlzZXRfdm1fZmx1c2hfcmVzZXRfcGVybXMobW9kLT5pbml0X2xheW91dC5iYXNlKTsN
Cj4gKwlmcm9iX3RleHQoJm1vZC0+Y29yZV9sYXlvdXQsIHNldF9tZW1vcnlfcm8pOw0KPiArDQo+
ICsJZnJvYl9yb2RhdGEoJm1vZC0+Y29yZV9sYXlvdXQsIHNldF9tZW1vcnlfcm8pOw0KPiArCWZy
b2JfdGV4dCgmbW9kLT5pbml0X2xheW91dCwgc2V0X21lbW9yeV9ybyk7DQo+ICsJZnJvYl9yb2Rh
dGEoJm1vZC0+aW5pdF9sYXlvdXQsIHNldF9tZW1vcnlfcm8pOw0KPiArDQo+ICsJaWYgKGFmdGVy
X2luaXQpDQo+ICsJCWZyb2Jfcm9fYWZ0ZXJfaW5pdCgmbW9kLT5jb3JlX2xheW91dCwgc2V0X21l
bW9yeV9ybyk7DQo+ICt9DQo+ICsNCj4gK3ZvaWQgbW9kdWxlX2VuYWJsZV9ueChjb25zdCBzdHJ1
Y3QgbW9kdWxlICptb2QpDQo+ICt7DQo+ICsJZnJvYl9yb2RhdGEoJm1vZC0+Y29yZV9sYXlvdXQs
IHNldF9tZW1vcnlfbngpOw0KPiArCWZyb2Jfcm9fYWZ0ZXJfaW5pdCgmbW9kLT5jb3JlX2xheW91
dCwgc2V0X21lbW9yeV9ueCk7DQo+ICsJZnJvYl93cml0YWJsZV9kYXRhKCZtb2QtPmNvcmVfbGF5
b3V0LCBzZXRfbWVtb3J5X254KTsNCj4gKwlmcm9iX3JvZGF0YSgmbW9kLT5pbml0X2xheW91dCwg
c2V0X21lbW9yeV9ueCk7DQo+ICsJZnJvYl93cml0YWJsZV9kYXRhKCZtb2QtPmluaXRfbGF5b3V0
LCBzZXRfbWVtb3J5X254KTsNCj4gK30NCj4gKw0KPiAraW50IG1vZHVsZV9lbmZvcmNlX3J3eF9z
ZWN0aW9ucyhFbGZfRWhkciAqaGRyLCBFbGZfU2hkciAqc2VjaGRycywNCj4gKwkJCQljaGFyICpz
ZWNzdHJpbmdzLCBzdHJ1Y3QgbW9kdWxlICptb2QpDQo+ICt7DQo+ICsJY29uc3QgdW5zaWduZWQg
bG9uZyBzaGZfd3ggPSBTSEZfV1JJVEUgfCBTSEZfRVhFQ0lOU1RSOw0KPiArCWludCBpOw0KPiAr
DQo+ICsJZm9yIChpID0gMDsgaSA8IGhkci0+ZV9zaG51bTsgaSsrKSB7DQo+ICsJCWlmICgoc2Vj
aGRyc1tpXS5zaF9mbGFncyAmIHNoZl93eCkgPT0gc2hmX3d4KSB7DQo+ICsJCQlwcl9lcnIoIiVz
OiBzZWN0aW9uICVzIChpbmRleCAlZCkgaGFzIGludmFsaWQgV1JJVEV8RVhFQyBmbGFnc1xuIiwN
Cj4gKwkJCSAgICAgICBtb2QtPm5hbWUsIHNlY3N0cmluZ3MgKyBzZWNoZHJzW2ldLnNoX25hbWUs
IGkpOw0KPiArCQkJcmV0dXJuIC1FTk9FWEVDOw0KPiArCQl9DQo+ICsJfQ0KPiArDQo+ICsJcmV0
dXJuIDA7DQo+ICt9
