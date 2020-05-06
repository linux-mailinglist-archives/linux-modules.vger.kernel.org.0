Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 790D61C6666
	for <lists+linux-modules@lfdr.de>; Wed,  6 May 2020 05:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgEFDjk (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Tue, 5 May 2020 23:39:40 -0400
Received: from sonic302-19.consmr.mail.ir2.yahoo.com ([87.248.110.82]:42442
        "EHLO sonic302-19.consmr.mail.ir2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726495AbgEFDjk (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Tue, 5 May 2020 23:39:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1588736378; bh=DoDCAbWlwIrUQxj1tQyuN7G/GPdydGwqLzZzgqn+gmw=; h=Date:From:Reply-To:Subject:References:From:Subject; b=iWqaoBi+V7CD+llPoh7IhQ3eCxAm9icA1urGx/F2LqqlCPAa9yf0Ghn8qtfsCx+P4+mNEhTMWNzdifJ/61CGo2Mj2qd3iwWKJc0b/3FrCxPoUWXcP6Y/7qOg+tE7pIZLcKl3A8Kno3lSMKLf3SF3YGnRv/TOGW0hRYKrI5jVSSZzIaZptBCkviHxam4CduyHpDZ8eYDuczS6yhIo27SXFtdCcryutLXw6n+9RMxvOQgwqa2CB1MHJPhMLJEDUjaW2BWDEqprgVaGieebAP7PNiJocKIHsg/GStmpJSxlEHQlHDAqNuUdfVIoKHqJvj+YvUtAdcfW9NtRQJmCzP4Gzw==
X-YMail-OSG: JX1BpQkVM1nqCKxnJ9qMPkgSllYJXqU0l.tqZgw4QO2I5nAwhoF8fDGDAww9oio
 ptTz0hVSlPXWE480VozKwSrcIAfILTgdAVEwH038gveq42HzWF5aNDtYiPggYpCOC.Mu6B8W9jL6
 0M2usJAdyyiXT6hz1LbOmTC6lrqaa1K0PVnsjdtP4NAT2TSeEkDx8G7xGo1ctZFninTzQvtVCKG3
 UcVEMOY6AkxsO7vGM77fJow_tft61YFUhAp6xiMIyHXz98ZGWFDH1MNkhEQ7xYNV7LN2TQTQXjGr
 gS39qRQEUdm59Dwm3oxZ6mq4lCGaUUvcP2NJifDK6rWS3flweUcYkrDKFcJ7SVzIbedQR1TcXxHO
 X_QDRLbfboSCRLtNLZjpgr.oBZjurjxhaLFI_dns9E3NElsNsNWm_RYkstrIETmyTzWdS47NGG_a
 uUv5WpHWUsTEnIwqsR1G5Y6WzMmpa9KGdz8o5cll1_STMCnj6CVhi4sTr7nOA1qsFznr2Vc8vL2v
 8JNmiiA9kkQiV2D83BoxZdnMJMdAMWitG4M1TbvkB5l.YEOr1FOGu8rx_YUcQSUaM_7wJSLVCJru
 J1or_38rSDdHuX8K.WxIFqpHRXLiWBQbjmKZVYMPnNC.qIZEjdp3HipOPejcGkFQo6AlMMM915dz
 QINUcOmrCpFWRcgzfji79b_E4x8WDF97c_p89Py4wy50fygfvmbGPPmkMZEQ.f9B0c4tyx3fNLgI
 Vq6kcFDIbVW7fcwcK_ftb0pX6ma9sz1aquYPm2nbfZV_WEngsZi3jAAmEUiB.RP2TQAPzjtvkP0w
 uOuGDJSWcZTS6ahjdSh2vzgSBZq7z8DQilQyow_I4Pp_vw4qAwQdUGgAATvtb6GueIcEpdn4NxDc
 Y1RP0dbQqG3gTMQnoXKSkCj1od4KsxCpPkBjiJuKiwM.c.zeXtdCI7MNlnj30icHgvmD_szI1TqH
 ocxPoW2u9IVOrVZNhv94PgwQOxMkdtwx5o1Od108FT0qRQGx..49xfmvWyif1lLk_LlRybRZiiPz
 BshuDMvOeiZE2AVXgCciP5BQsjqdxiCMSAGq0jHT.YYgeanZGNIaRyL7KvSU.3Ginckx3QPYiE3c
 _yw_NlYtx8k7Bc0SLyxnW9h1q2zr0IlRTF6CuHnC2nujvcRQued1lFa2eOFtnYqbSu7x4gMZOXKX
 H3bWsz9LwAincENa86OgQ1JM2EZpEF5IJgjq12y3..Yg_pqkbjD6JksnhTQKgwsE1_84naXZwnIC
 cWVH2_xp_XWBXSwiun5.zKliwUJEwF2KMjnVL3PiOVkP8zYT91vJgJgMbTUMDS6eMGB2ZiVKOLpI
 -
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.ir2.yahoo.com with HTTP; Wed, 6 May 2020 03:39:38 +0000
Date:   Wed, 6 May 2020 03:39:36 +0000 (UTC)
From:   "Mr. Leno Ovoh" <lindseytaylor28@aol.com>
Reply-To: lenoovoh@gmail.com
Message-ID: <1675702184.3775986.1588736376948@mail.yahoo.com>
Subject: Dear Friend, I need your account to transfer this money please
 reply me urgently
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <1675702184.3775986.1588736376948.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15756 YMailNodin Mozilla/5.0 (Windows NT 6.1; rv:75.0) Gecko/20100101 Firefox/75.0
To:     unlisted-recipients:; (no To-header on input)
Sender: owner-linux-modules@vger.kernel.org
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>



Dear Friend,

My name is Mr. Leno Ovoh. I am working with one of the prime banks in Burki=
na Faso. Here in this bank existed a dormant account for many years, which =
belong to one of our late foreign customer. The amount in this account stan=
ds at $13,300,000.00 (Thirteen Million Three Hundred Thousand US Dollars).

I want a foreign account where the bank will transfer this fund. I know you=
 would be surprised to read this message, especially from someone relativel=
y unknown to you. But, do not worry yourself so much. This is a genuine, ri=
sk free and legal business transaction. All details shall be sent to you on=
ce I hear from you.

I was very fortunate to come across the deceased customer's security file d=
uring documentation of old and abandoned customer=E2=80=99s files for an of=
ficial redocumentation and audit of the year 2020.

If you are really sure of your sincerity, trustworthiness, accountability a=
nd confidentiality over this transaction, reply back to me through my alter=
native email address: (lenoovoh@gmail.com).

Best regards,

Mr. Leno Ovoh
