Return-Path: <linux-modules+bounces-385-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98389842B2D
	for <lists+linux-modules@lfdr.de>; Tue, 30 Jan 2024 18:48:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5426A2886DE
	for <lists+linux-modules@lfdr.de>; Tue, 30 Jan 2024 17:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDCD814E2D5;
	Tue, 30 Jan 2024 17:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="sqq6EHgB"
X-Original-To: linux-modules@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2D11292D2
	for <linux-modules@vger.kernel.org>; Tue, 30 Jan 2024 17:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706636898; cv=none; b=rkeW03k4mJ6vXW2JoynkVIo57P/soRg6xDOyRE721Ciz5hxVVrKzlTpJzJsIeym5MG3RFBj/xGZPxL4T3nXJTWzgGzezzF3Y+vkyyDqU9Uqr+yEfQ1gRADicZLTekthdn1jQOFtPTU9Z9uTDDNlbGqcjEseBKwiHi85oSv3rQPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706636898; c=relaxed/simple;
	bh=z0m6c/7NAcTfRpVPVOjfTSthJusKCaTbiThtUGdY0No=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=tNei6A2ne2l//h8u0LenoxQrUuy2CSyE83uVQT9Y3UosJwfMvWx5W2a9O8ag2YGwp7aGKtB2VXF8oPCB2BWB83/boLegWR2gpgmKBaJ3eou2AVr/XBHe6+gGQt/Uc4VADdI7viaLvP5aHj38GQI9ysdiwyrPaz6PuNY38Y5y2q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=sqq6EHgB; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20240130174812euoutp0147f0e3fd0269df98c899cab371e898e7~vMTY6Sd8F2983529835euoutp01Z
	for <linux-modules@vger.kernel.org>; Tue, 30 Jan 2024 17:48:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20240130174812euoutp0147f0e3fd0269df98c899cab371e898e7~vMTY6Sd8F2983529835euoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1706636892;
	bh=Zv6qgxmBCdI8twBoSyKblckNENQs/z13cpSfwHU4OqU=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=sqq6EHgBZDdzykWvjVLqkJ2LObWSLNkudAO9FCq2/xQaWLZjB1iUyXwTeapMYswmE
	 iVa3jXnVaMEApF5ELZm3celI+jd/7GnsCmlsru5K5YS10Vk+PNbF75ktQNanH2dHXZ
	 Koi13EsFX9H1F89/3NoUtb9HgopZ8kc0lhEX2iJ4=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20240130174812eucas1p21074c0e45c85ac640b3137a2e022bebe~vMTYrHtpa2866028660eucas1p2W;
	Tue, 30 Jan 2024 17:48:12 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 7E.FE.09814.C5639B56; Tue, 30
	Jan 2024 17:48:12 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20240130174812eucas1p166f62549457fd188fed6ed72b6b4b9cd~vMTYR-Aah1410814108eucas1p1D;
	Tue, 30 Jan 2024 17:48:12 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240130174812eusmtrp228385c9d3b1a1783a6443317f31ae3d2~vMTYRQVNU1184111841eusmtrp27;
	Tue, 30 Jan 2024 17:48:12 +0000 (GMT)
X-AuditID: cbfec7f4-711ff70000002656-2a-65b9365c55bc
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 6E.E8.10702.B5639B56; Tue, 30
	Jan 2024 17:48:11 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240130174811eusmtip1d1b9e79cee4e8e3ec08d888789ce6a08~vMTXkdefR3085630856eusmtip1q;
	Tue, 30 Jan 2024 17:48:11 +0000 (GMT)
Message-ID: <30ddedc9-0829-4a99-9cb1-39190937981c@samsung.com>
Date: Tue, 30 Jan 2024 18:48:11 +0100
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] init: Declare rodata_enabled and mark_rodata_ro()
 at all time
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Chen-Yu Tsai
	<wenst@chromium.org>, Luis Chamberlain <mcgrof@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
	<npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <9e298fa7-a953-462a-96a4-56a1b4316a17@csgroup.eu>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBKsWRmVeSWpSXmKPExsWy7djPc7oxZjtTDS7tkLb4O+kYu8WdSc/Z
	LS7vmsNm0TD7O6vF7+//WC1uTHjKaLGl4RCbxc8XN1gsZrRdZnXg9Pj9axKjx+yGiyweX2+e
	Y/JY9LKBxWPnrLvsHptWdbJ5nJ+xkNHj8ya5AI4oLpuU1JzMstQifbsEroyFr2awF0yQqXgx
	7yNzA2OfeBcjJ4eEgInEnm1zGLsYuTiEBFYwSrzYeJUFwvnCKHGp+QUbhPOZUeLE1F/MMC07
	nv1ghUgsZ5T4vOIOE4TzkVFieftkFpAqXgE7ib1N64DaOThYBFQlznxPhAgLSpyc+QSsRFRA
	XuL+rRnsILawQITEmknXwBYwC4hL3HoynwnEFhGolbj1aDbYfGaBbUwSv04/BEuwCRhKdL3t
	YgOxOYF2dZx9ywjRLC/RvHU2M0iDhMB/DokLp54zQpztIvHgYgM7hC0s8er4FihbRuL/zvlM
	EA3tjBILft+HciYwSjQ8vwXVbS1x59wvsHeYBTQl1u/Shwg7Sqx+3MMCEpYQ4JO48VYQ4gg+
	iUnbpjNDhHklOtqEIKrVJGYdXwe39uCFS8wTGJVmIYXLLCT/z0LyziyEvQsYWVYxiqeWFuem
	pxYb5aWW6xUn5haX5qXrJefnbmIEJq7T/45/2cG4/NVHvUOMTByMhxglOJiVRHhXyu1MFeJN
	SaysSi3Kjy8qzUktPsQozcGiJM6rmiKfKiSQnliSmp2aWpBaBJNl4uCUamCaGOuYVq53KzLj
	LaP9Zf5N4e3xJ/f1J/9qPejl7uFVs+OMn1lc5sFE3x+bUuQY49y0jqmEL54/5dm03gVle2f5
	Hdv9cOs1aeaXT5Z4MYQtrvCv+HWQtTG63Sr7oJ/QG3dt/ar6wr9WdxYUiJp5OXMud1b8IfDI
	e7Zlg1fwzaPvp180i7wmOq1d9czeD94WgqYujPmPLhc/aJGNkJCuNr6bdWj5pVf7VVctzddZ
	H/ZfvI4/fVfkvbXPcmd8sX+bd759/SzR/9umPuhqlJlisEhJJ/Wf85IzciF3dnGec9uQvTo0
	3u7Jb2atAMebiQvKbs/u/mH8O1Rmxsxg26S7185mz9SbM/sS888jajFFs04qsRRnJBpqMRcV
	JwIAWjDcZcsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRmVeSWpSXmKPExsVy+t/xu7rRZjtTDb5dtrT4O+kYu8WdSc/Z
	LS7vmsNm0TD7O6vF7+//WC1uTHjKaLGl4RCbxc8XN1gsZrRdZnXg9Pj9axKjx+yGiyweX2+e
	Y/JY9LKBxWPnrLvsHptWdbJ5nJ+xkNHj8ya5AI4oPZui/NKSVIWM/OISW6VoQwsjPUNLCz0j
	E0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYyFr2awF0yQqXgx7yNzA2OfeBcjJ4eEgInEjmc/
	WEFsIYGljBLNf8wh4jISJ6c1sELYwhJ/rnWxdTFyAdW8Z5T49nQNG0iCV8BOYm/TOiCbg4NF
	QFXizPdEiLCgxMmZT1hAbFEBeYn7t2awg5QIC0RIrNktBRJmFhCXuPVkPhOILSJQK3Gpay0j
	RHwbk8SzW7kQq14ySvz/9IEZJMEmYCjR9bYLbC0n0NqOs2+hGswkurZ2QdnyEs1bZzNPYBSa
	heSMWUj2zULSMgtJywJGllWMIqmlxbnpucVGesWJucWleel6yfm5mxiBMbrt2M8tOxhXvvqo
	d4iRiYPxEKMEB7OSCO9KuZ2pQrwpiZVVqUX58UWlOanFhxhNgUExkVlKNDkfmCTySuINzQxM
	DU3MLA1MLc2MlcR5PQs6EoUE0hNLUrNTUwtSi2D6mDg4pRqY1Ly/mmtfPVsnue3j/kaptQ7i
	oUp56zuOR6VfPcKes7jZPlVL2Up0Ysb5NM3V/F3/+l/rn1hndjtNWs33mmFE/NencwxTek/z
	T+79Gbj60PsTGbbsrFVeP2894Q473Vbl8EFPwefgHcXs9UofXtuw1kd7LTDN63JfM++c1EPZ
	eb+ZzV1uVnEGMvgJrtG70N9yZlKlpvwE7g6vIItf5Rw8to+YtSZwHXG3uOTcq/vBhL3gzU+G
	xnoTHRO/h3WnjXYwBcx71s8zL8NDP/l3iIQbu+Kie/e0GeoUl0/KeXFkYaHMpYhFh6Yuv8ae
	nZHtsf3hxg0p5hqlF5J4+L5OnjNp6eviC78mrtfynVqXdUOJpTgj0VCLuag4EQAeAJt4WgMA
	AA==
X-CMS-MailID: 20240130174812eucas1p166f62549457fd188fed6ed72b6b4b9cd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20240130174812eucas1p166f62549457fd188fed6ed72b6b4b9cd
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240130174812eucas1p166f62549457fd188fed6ed72b6b4b9cd
References: <7b5df1782e94a755b4a18733af44d17d8dd8b37b.1703149011.git.christophe.leroy@csgroup.eu>
	<ZbgGDlgrLhB8tcGI@bombadil.infradead.org>
	<20240130091626.GA3684878@google.com>
	<9e298fa7-a953-462a-96a4-56a1b4316a17@csgroup.eu>
	<CGME20240130174812eucas1p166f62549457fd188fed6ed72b6b4b9cd@eucas1p1.samsung.com>

Dear All,

On 30.01.2024 12:03, Christophe Leroy wrote:
> Le 30/01/2024 à 10:16, Chen-Yu Tsai a écrit :
>> [Vous ne recevez pas souvent de courriers de wenst@chromium.org. D?couvrez pourquoi ceci est important ? https://aka.ms/LearnAboutSenderIdentification ]
>>
>> On Mon, Jan 29, 2024 at 12:09:50PM -0800, Luis Chamberlain wrote:
>>> On Thu, Dec 21, 2023 at 10:02:46AM +0100, Christophe Leroy wrote:
>>>> Declaring rodata_enabled and mark_rodata_ro() at all time
>>>> helps removing related #ifdefery in C files.
>>>>
>>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> Very nice cleanup, thanks!, applied and pushed
>>>
>>>     Luis
>> On next-20240130, which has your modules-next branch, and thus this
>> series and the other "module: Use set_memory_rox()" series applied,
>> my kernel crashes in some very weird way. Reverting your branch
>> makes the crash go away.
>>
>> I thought I'd report it right away. Maybe you folks would know what's
>> happening here? This is on arm64.
> That's strange, it seems to bug in module_bug_finalize() which is
> _before_ calls to module_enable_ro() and such.
>
> Can you try to revert the 6 patches one by one to see which one
> introduces the problem ?
>
> In reality, only patch 677bfb9db8a3 really change things. Other ones are
> more on less only cleanup.

I've also run into this issue with today's (20240130) linux-next on my 
test farm. The issue is not fully reproducible, so it was a bit hard to 
bisect it automatically. I've spent some time on manual testing and it 
looks that reverting the following 2 commits on top of linux-next fixes 
the problem:

65929884f868 ("modules: Remove #ifdef CONFIG_STRICT_MODULE_RWX around 
rodata_enabled")
677bfb9db8a3 ("module: Don't ignore errors from set_memory_XX()")

This in fact means that commit 677bfb9db8a3 is responsible for this 
regression, as 65929884f868 has to be reverted only because the latter 
depends on it. Let me know what I can do to help debugging this issue.

Here is the stack trace I've got on Khadas VIM3 ARM64 board:

Unable to handle kernel paging request at virtual address ffff80007bfeeb30
Mem abort info:
   ESR = 0x0000000096000047
   EC = 0x25: DABT (current EL), IL = 32 bits
   SET = 0, FnV = 0
   EA = 0, S1PTW = 0
   FSC = 0x07: level 3 translation fault
Data abort info:
   ISV = 0, ISS = 0x00000047, ISS2 = 0x00000000
   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
swapper pgtable: 4k pages, 48-bit VAs, pgdp=000000000a35a000
[ffff80007bfeeb30] pgd=10000000f4806003, p4d=10000000f4806003, 
pud=1000000007ed1003, pmd=1000000007ed2003, pte=0000000000000000
Internal error: Oops: 0000000096000047 [#1] PREEMPT SMP
Modules linked in:
CPU: 4 PID: 182 Comm: (udev-worker) Not tainted 6.8.0-rc2-next-20240130 
#14391
Hardware name: Khadas VIM3 (DT)
pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : module_bug_finalize+0xb0/0xdc
lr : module_bug_finalize+0x70/0xdc
...
Call trace:
  module_bug_finalize+0xb0/0xdc
  load_module+0x182c/0x1c88
  init_module_from_file+0x84/0xc0
  idempotent_init_module+0x180/0x250
  __arm64_sys_finit_module+0x64/0xa0
  invoke_syscall+0x48/0x114
  el0_svc_common.constprop.0+0xc0/0xe0
  do_el0_svc+0x1c/0x28
  el0_svc+0x4c/0xe4
  el0t_64_sync_handler+0xc0/0xc4
  el0t_64_sync+0x190/0x194
Code: 9116e003 f942dc01 a93e8c41 c89ffc73 (f9000433)
---[ end trace 0000000000000000 ]---



Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


