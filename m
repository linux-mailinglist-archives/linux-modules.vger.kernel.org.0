Return-Path: <linux-modules+bounces-954-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D3288B435
	for <lists+linux-modules@lfdr.de>; Mon, 25 Mar 2024 23:35:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DBCDB28EB3
	for <lists+linux-modules@lfdr.de>; Mon, 25 Mar 2024 22:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95ADE70CC2;
	Mon, 25 Mar 2024 22:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nUHFUZpJ"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8816FE11;
	Mon, 25 Mar 2024 22:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711404396; cv=none; b=WEJMlJJsIiS6fgC1zILlLDExsmO5PytHe8KrUQ9jX3G9xJ98QN4lKnODbfAYHTMsUrNRdn8yoSL7OBr8483ps1n51il47Hg76lKePlPFzdusrp6+DxuqF0RRkOs0R0swW/6uQWaDmKJFAwcvI9Pj/1TdRS1UlcAq6k6EDJZvjBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711404396; c=relaxed/simple;
	bh=z/mz7FVFwe1LcDtvbacDByrhd+3w8HygIiOVlwJYbDU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=G6MO349uoSkeVGR+6PkhsU6+j5HynIx7E9RgTxFMTp70AzaauKIPWxijoUOKbOOpiHcEqV8KAW8UfBU2IV2IZSM7qfFzjpeIifCKYDG8N8VABMLyk/Ot2lsetELh/xDmevQSG7wvCfCfqDex7+FeelJ0PR3InUnbq9MzWRO8Sa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nUHFUZpJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF2EC433C7;
	Mon, 25 Mar 2024 22:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711404395;
	bh=z/mz7FVFwe1LcDtvbacDByrhd+3w8HygIiOVlwJYbDU=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=nUHFUZpJoimXH48MX0QAGf9i1kd81LXa6MCNkuKKiuL/HL0G/isOw3uNIJbFJgy/I
	 tM8XtTD2n9TxwpwqVDRMOR9seeFdqslt/L4RG3SXOQnPYC7wtLQw7adq46ggnSNyK4
	 NyhL1L1edHltaLQYS4ugCN+2ctlA1u0Xwmec4RSALlTYiDoqlTzcUQ0/xsZUS7ZeVP
	 es0UF2PqFCLKqS9CKiJ1N6KGd2aDr+eoChBqx0Fd1lQjnYPGmUKx+htikR0i6RlzOR
	 YpsngEmzjg/or+4fWjSJ3Km/MUCyQ3Un9N49l47F7/ovgKZ2wMWhGqlfEy54rtAblq
	 G2ze3GUVApWug==
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 26 Mar 2024 00:06:31 +0200
Message-Id: <D03683T2J8T8.18AMQ9ABQAQT5@kernel.org>
Cc: "Masami Hiramatsu" <mhiramat@kernel.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, <linux-modules@vger.kernel.org>, "Naveen
 N . Rao" <naveen.n.rao@linux.ibm.com>, "Anil S Keshavamurthy"
 <anil.s.keshavamurthy@intel.com>, "David S . Miller" <davem@davemloft.net>
Subject: Re: [PATCH v5 1/2] kprobes: textmem API
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, <linux-riscv@lists.infradead.org>
X-Mailer: aerc 0.17.0
References: <20240325215502.660-1-jarkko@kernel.org>
In-Reply-To: <20240325215502.660-1-jarkko@kernel.org>

s/textmem/execmem/ (also in long description)

will hold sending a new version as not a functional issue, will fix
after review.

BR, Jarkko

