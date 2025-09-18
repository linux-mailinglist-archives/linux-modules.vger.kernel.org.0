Return-Path: <linux-modules+bounces-4204-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0A1B302C2
	for <lists+linux-modules@lfdr.de>; Thu, 21 Aug 2025 21:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88ED5AC7AF8
	for <lists+linux-modules@lfdr.de>; Thu, 21 Aug 2025 19:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 987ED2D3229;
	Thu, 21 Aug 2025 19:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b="L3NgxzM/"
X-Original-To: linux-modules@vger.kernel.org
Received: from 17.mo583.mail-out.ovh.net (17.mo583.mail-out.ovh.net [46.105.56.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178A5157A48
	for <linux-modules@vger.kernel.org>; Thu, 21 Aug 2025 19:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.56.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755803967; cv=none; b=ANJ/85rIf1KFjl3U0Kom7D9GCMyoRKz39rPKp8qIYgzY6I9ksUPoptbqh2CSGGKy/pLW4My0PNMLA+RVkJtHhcZQ9KPnm0cHqnBg+D/F0Qj+CCixy48PONpixNA4gEQKHY4Q5774qtmhl1iUH9uGfE0Sfl7hwG4/UyeO+OdJngE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755803967; c=relaxed/simple;
	bh=vFaB//qP4LtlL1lfjYpihJ1T0Qr/+fxQRUzCvl15fl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hYrBRB7nWBFEblJJSNwqUEll7kdBx4mB05dF+axKN7LUETTUlqytWNdYKjxLFHzxGh6qYDt2uynuwywKgvHvDoIzgzAF5IWOhbNQvPzMXAOnzNlM8VZshUD03Ws3S+4Y945CY4fsoQaVYG+y+N8Zec+LAB5aj6RGNff9yQ2kzF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com; spf=pass smtp.mailfrom=3mdeb.com; dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b=L3NgxzM/; arc=none smtp.client-ip=46.105.56.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Received: from director2.ghost.mail-out.ovh.net (unknown [10.110.58.156])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4c72K03mPnz6Xcy
	for <linux-modules@vger.kernel.org>; Thu, 21 Aug 2025 12:13:08 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-6w2ns (unknown [10.110.188.144])
	by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 0D0DEC0D35;
	Thu, 21 Aug 2025 12:13:07 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.109])
	by ghost-submission-5b5ff79f4f-6w2ns with ESMTPSA
	id dv2YL1MNp2jDDQAAylO0+g
	(envelope-from <kamil.aronowski@3mdeb.com>); Thu, 21 Aug 2025 12:13:07 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-109S0034f1f685c-2a2a-405c-a51e-cdbd32bd2eb0,
                    AD60D6C822F42FFDCF9F966584505D882BC4BD25) smtp.auth=kamil.aronowski@3mdeb.com
X-OVh-ClientIp:164.127.240.10
Message-ID: <eb88e58f-1515-4f51-8102-79cd3c20fea5@3mdeb.com>
Date: Thu, 21 Aug 2025 14:13:03 +0200
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question: a module for wiping userspace RAM before
 shutdown/reboot/halt
To: Danill Klimuk <daniil.klimuk@3mdeb.com>, linux-modules@vger.kernel.org
References: <bfe72929-ba4c-4732-9f80-25cc7b95a0c8@3mdeb.com>
Content-Language: en-US
From: Kamil Aronowski <kamil.aronowski@3mdeb.com>
In-Reply-To: <bfe72929-ba4c-4732-9f80-25cc7b95a0c8@3mdeb.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rGzTOdgB43mEqEeMbptFXX4r"
X-Ovh-Tracer-Id: 960392623481975119
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduieduvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtsehgtderredtvdejnecuhfhrohhmpefmrghmihhlucetrhhonhhofihskhhiuceokhgrmhhilhdrrghrohhnohifshhkihesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhephefhhefgjeffheffudfgteffudfhfedvfeeiteffleeuhffhkeffhffhveettdejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpfehmuggvsgdrtghomhenucfkphepuddvjedrtddrtddruddpudeigedruddvjedrvdegtddruddtpdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehkrghmihhlrdgrrhhonhhofihskhhiseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqmhhoughulhgvshesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheekfegmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=vFaB//qP4LtlL1lfjYpihJ1T0Qr/+fxQRUzCvl15fl8=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1755778388; v=1;
 b=L3NgxzM/9fx9++Bp57UMYKm0jhrZ0egjalPcwL+TIfWZzD/gWOZiCQ1By/QNJ+88LJ2svzTh
 3g7D56MCcy22XDKUduG8muo+dQVjPCKZOzkUJtT3IaC5fDQL8QZ2i67cW2HTmVSxWHVHMSozBMY
 1coBTt+KgzNnSIvdARxJdo74Bfxo2c0J1jA1bj5QGLNzxXba2hDHSBSXj7SfBiFLH8xcZ+M3D2R
 2IaeNQcTSjydtUo8147BJjmsMF1C5e/7uCB0vQ1s3aZqqI7u87WdRJxOjUTBYfO1UZy1GVKR6vl
 25LucuJ/vtU24sa5gDQ0veNG6K1LSeEHpEs8pVmEHmpcg==

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rGzTOdgB43mEqEeMbptFXX4r
Content-Type: multipart/mixed; boundary="------------OFfvCzbBfYwbN1wqvF6N0YGw";
 protected-headers="v1"
From: Kamil Aronowski <kamil.aronowski@3mdeb.com>
To: Danill Klimuk <daniil.klimuk@3mdeb.com>, linux-modules@vger.kernel.org
Message-ID: <eb88e58f-1515-4f51-8102-79cd3c20fea5@3mdeb.com>
Subject: Re: Question: a module for wiping userspace RAM before
 shutdown/reboot/halt
References: <bfe72929-ba4c-4732-9f80-25cc7b95a0c8@3mdeb.com>
In-Reply-To: <bfe72929-ba4c-4732-9f80-25cc7b95a0c8@3mdeb.com>

--------------OFfvCzbBfYwbN1wqvF6N0YGw
Content-Type: multipart/mixed; boundary="------------JA3bkMBiGsnyc3t0V0X2fAsc"

--------------JA3bkMBiGsnyc3t0V0X2fAsc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

UmVjZW50bHksIHdlIGV2YWx1YXRlZCB0aGUgZWZmZWN0aXZlbmVzcyBvZiB0aGUgYGluaXRf
b25fZnJlZWANCm1lY2hhbmlzbSwgcGFydGljdWxhcmx5IGluIHRoZSBjb250ZXh0IG9mIHBy
ZXNlcnZpbmcgcHJpdmFjeSBieQ0KY2xlYXJpbmcgUkFNIGZvciBpbmRpdmlkdWFscyB3aXRo
IGhpZ2ggb3BlcmF0aW9uYWwgc2VjdXJpdHkNCnJlcXVpcmVtZW50cy4NCg0KQXMgbWVudGlv
bmVkDQooaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL2U3MWJkNjJjLTViYTctNDM2My05
YWYxLWQ5YzlkZTM5NGE1NEAzbWRlYi5jb20vKSwNCndlJ2QgbGlrZSB0byBlbnN1cmUgdGhh
dCBvdXIgY2xpZW50cyBkbyBub3QgaGF2ZSB0aGVpciBjb25maWRlbnRpYWwNCmRhdGEgbGVh
a2VkIGFmdGVyIHRoZWlyIHNlc3Npb24gaGFzIGVuZGVkIHdpdGggYSBzaHV0ZG93bi9yZWJv
b3QvaGFsdC4NCg0KSW4gc2hvcnQsIGBpbml0X29uX2ZyZWVgIGFwcGVhcnMgdG8gd2lwZSB0
aGUgTFVLUyBzZWNyZXQga2V5DQpzdWNjZXNzZnVsbHksIGJ1dCBzb21lIG5vbi1rZXJuZWwg
c3BhY2Ugc25pcHBldHMgcmVtYWluIGluIG1lbW9yeS4NClNvbWUgdGVzdHMgaGF2ZSBiZWVu
IHBlcmZvcm1lZCBieSBkdW1waW5nIG1lbW9yeSBhZnRlciBib290aW5nIERlYmlhbg0KMTMg
KHdpdGggYGluaXRfb25fZnJlZWAgZW5hYmxlZCkgYW5kIHRoZW4gcmVib290aW5nIHRvIG91
ciBjdXN0b20gRUZJDQptZW1vcnkgZHVtcGluZyBhcHBsaWNhdGlvbi4gIEZvciBpbnN0YW5j
ZSwgdGhlIG1lbnRpb25zIG9mDQpgYXBwYXJtb3JfcGFyc2VyYCwgWEtCLCB1ZGV2LCBvciBz
eXN0ZW1kIHVuaXRzIGhhdmUgYmVlbiBmb3VuZCBpbiB0aGUNCm1lbW9yeSBkdW1wOg0KDQpg
YGANCmF1ZGl0OiB0eXBlPTE0MDAgYXVkaXQoMTc1NTE1NjQ2Ny41NTY6Mik6IGFwcGFybW9y
PSJTVEFUVVMiIA0Kb3BlcmF0aW9uPSJwcm9maWxlX2xvYWQiIHByb2ZpbGU9InVuY29uZmlu
ZWQiIG5hbWU9IkRpc2NvcmQiIHBpZD05NjcgDQpjb21tPSJhcHBhcm1vcl9wYXJzZXIiciIN
ClsuLi5dDQoNCnBhcnRpYWwgYWxwaGFudW1lcmljX2tleXMNCnhrYl9zeW1ib2xzICJ0aWJf
YXNjaWludW0iIHsNCiAgICAgaW5jbHVkZSAiY24odGliKSINCiAgICAgbmFtZVtHcm91cDFd
PSAiVGliZXRhbiAod2l0aCBBU0NJSSBudW1lcmFscykiOw0KICAgICBrZXkgPEFFMDE+IHsg
WyAxLCAweDEwMDBmMjEsIDB4MTAwMGYwNCwgMHgxMDAwZjc2IF0gfTsgIyAxDQpbLi4uXQ0K
DQpJOjEwMTE0MDAwDQpFOklEX01NX0NBTkRJREFURT0xDQpTOmRpc2svYnktaWQvZG0tdXVp
ZC1DUllQVC1MVUtTMi0wMGI0Yjc5YzIwOWE0ZGNmYWRmMzdlMzEwNzc4ZjU4My1zZGEzX2Ny
eXB0DQpbLi4uXQ0KDQpbVW5pdF0NCkRlc2NyaXB0aW9uPVN3aXRjaCBSb290DQpBc3NlcnRQ
YXRoRXhpc3RzPS9ldGMvaW5pdHJkLXJlbGVhc2UNCkRlZmF1bHREZXBlbmRlbmNpZXM9bm8N
CldhbnRzPWluaXRyZC1zd2l0Y2gtcm9vdC5zZXJ2aWNlDQpCZWZvcmU9aW5pdHJkLXN3aXRj
aC1yb290LnNlcnZpY2UNCkFsbG93SXNvbGF0ZT15ZXMNCldhbnRzPWluaXRyZC11ZGV2YWRt
LWNsZWFudXAtZGIuc2VydmljZSBpbml0cmQtcm9vdC1mcy50YXJnZXQgDQppbml0cmQtZnMu
dGFyZ2V0IHN5c3RlbWQtam91cm5hbGQuc2VydmljZSBpbml0cmQtY2xlYW51cC5zZXJ2aWNl
DQpBZnRlcj1pbml0cmQtdWRldmFkbS1jbGVhbnVwLWRiLnNlcnZpY2UgaW5pdHJkLXJvb3Qt
ZnMudGFyZ2V0IA0KaW5pdHJkLWZzLnRhcmdldCBlbWVyZ2VuY3kuc2VydmljZSBlbWVyZ2Vu
Y3kudGFyZ2V0IGluaXRyZC1jbGVhbnVwLnNlcnZpY2UNClsuLi5dDQpgYGANCg0KSXMgdGhp
cyB0aGUgZXhwZWN0ZWQgYmVoYXZpb3IsIGEgYnVnLCBvciBhIG1pc2NvbmZpZ3VyYXRpb24g
b24gb3VyDQplbmQ/DQoNCklmIGl0IGlzIGluZGVlZCBhIGJ1Zywgd2UnZCBiZSBoYXBweSB0
byBjb29wZXJhdGUgb24gaW1wcm92aW5nIHRoZQ0KYGluaXRfb25fZnJlZWAgbWVjaGFuaXNt
LiBJZiBpdCBpcyBleHBlY3RlZCBiZWhhdmlvciB0aGFuIHdlIHdpbGwNCmNvbnNpZGVyIHdp
cGluZyB1c2Vyc3BhY2UgbWVtb3J5IHNvbWUgb3RoZXIgd2F5LCBlLmcuIGJ5IGltcGxlbWVu
dGluZw0KYSBzZXBhcmF0ZSBMaW51eCBLZXJuZWwgbW9kdWxlIGFzIGRlc2NyaWJlZCBpbiB0
aGUgcHJldmlvdXMgZW1haWwNCihodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvZTcxYmQ2
MmMtNWJhNy00MzYzLTlhZjEtZDljOWRlMzk0YTU0QDNtZGViLmNvbS8pLg0KDQotLSANCkth
bWlsIEFyb25vd3NraQ0KSnVuaW9yIEVtYmVkZGVkIEZpcm13YXJlIEVuZ2luZWVyDQpHUEc6
IDM1MTAxNDhBNUNENjc5MDgNCmh0dHBzOi8vM21kZWIuY29tIHwgQDNtZGViX2NvbQ0K
--------------JA3bkMBiGsnyc3t0V0X2fAsc
Content-Type: application/pgp-keys; name="OpenPGP_0x3510148A5CD67908.asc"
Content-Disposition: attachment; filename="OpenPGP_0x3510148A5CD67908.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
b3ikfoPzj01UD8qg65aMJyOX/NBfuw=3D=3D
=3D+WKZ
-----END PGP PUBLIC KEY BLOCK-----

--------------JA3bkMBiGsnyc3t0V0X2fAsc--

--------------OFfvCzbBfYwbN1wqvF6N0YGw--

--------------rGzTOdgB43mEqEeMbptFXX4r
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE17Er8MHTMiECVfFxOAwyg6B5WrYFAminDVIACgkQOAwyg6B5
WrZVyBAAtA1LPFbR5vUZdTGVHA3+w2U2Mkc6+J/OTibbsl6GCHIFUYW87HaQxCwR
l77stvvBUx+TTkhdndYaKBDOOb3Yp3YdARBcdu5X+sOLBBr+0aA5dV9lObj80f7Y
aYCdPXH6OabryWKGXjA7N8nQk/FHJWYhoJMFx5duts4E1vuZu0/WjolXOyjMYqDX
9FGOzt9cIv3vqonoiSLszL0VMNhM5TJol2d4wqK+0m8VcnmuSfvxQYWCZUCzUKp3
tigkX7AVcrgyWP4zVqTK2YJo4jNw+j8NQYTwCamIk0yWkgCR6jSezvo6K8xZbvHL
GzjNFbjH5OIQAFRlwEpLW4UG26pgdLeIqdO2apI+n5ttvN56XSY9ktnxTx6Uu3RY
xgszah9jLLuAKpbRX9IhbnGHBuNIXEWkQBZ+7CX7HLzCEJFqceZ/oa9XqrDOJpbk
tBqvsVUF4z7dAtpLMJGpltCz1bNwTjcvUhY5b/fbTSxwJxGCtJNBI4VeUSDKLXGi
0CG8CQscWCYdCRUyv7FA1VlVs4R6e8D8q2NRGjbA7arwFI3OKGQECKWkGIgrc5bK
3mrtDklzqeq9rkchh6rHC5GEl00m2AKrR86TvfgCPD/NXIiv5bxjFYP68J0rmzNW
58KWujpOBDxEjk0hgclfI1JgNScNYhkCer1eL5Et37gI2ryOL0g=
=7ELV
-----END PGP SIGNATURE-----

--------------rGzTOdgB43mEqEeMbptFXX4r--

