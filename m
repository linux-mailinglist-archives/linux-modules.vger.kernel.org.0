Return-Path: <linux-modules+bounces-6197-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mADBGUN3ymnk9AUAu9opvQ
	(envelope-from <linux-modules+bounces-6197-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Mon, 30 Mar 2026 15:14:43 +0200
X-Original-To: lists+linux-modules@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB8C35BBFF
	for <lists+linux-modules@lfdr.de>; Mon, 30 Mar 2026 15:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 67515300DCCD
	for <lists+linux-modules@lfdr.de>; Mon, 30 Mar 2026 13:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B44C3D34A1;
	Mon, 30 Mar 2026 13:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dVWan8IV"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB663D3491;
	Mon, 30 Mar 2026 13:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774876481; cv=none; b=G+jG6nh+mHiAoPpYL38sj/syVGtIqerF5PxnxpvuJAa1+Jv6p/AAw4hBQIQm1wtsjKgrJuRzt6up3NU7JmE2SuxybaDm87E/jmVaJX33AgtHrD6UGnQgBJW/XwkEetLeO9yeMuNQduuOSiojL/oxmOD1oA28d1eInXPxxsqacBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774876481; c=relaxed/simple;
	bh=09VheKtseQxbUtBLbnLgcVtPJcvvKuPAZjj1wtlSBJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M8ej7iaCzQjbPS0I6rZmkVwGqcl0pZw3exk8/EE2a6U4vOkWaXUiZ43ijKekNf6bkYcJN/vDB2bVA0Jbb30igFyp5p4A/fz8GH0MLOgNMOPI5NRpmTjIzDykP0bv/RSRigr6w/JF1e+dgc3xgMrqJTKQBw20hBayqAe8ls/gFg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dVWan8IV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7527BC4CEF7;
	Mon, 30 Mar 2026 13:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774876480;
	bh=09VheKtseQxbUtBLbnLgcVtPJcvvKuPAZjj1wtlSBJY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dVWan8IVCz5RO5OVCF6HlDsglgRcR5wSFaClC04W/PKVOP83gat6kcV/ehT0hFmDi
	 jtYiBX4936PNnyogLWHJeob1tyfuFsLpA9gNsGeKYUtZ6vsFsfMJUqu9KmRS4i9Ubb
	 8bJ4LyES9RsLs3hYg9xzOj6nSsggDq5idLqXpSMOkCUqbYFa2L4rv8Y8Q0KI68EhiQ
	 LjOwj2o2tIFg2PXzd+2Bt8e35T45WcxhiPqXRlxN74FX+kIywC8Jshq+FwixaHkuxJ
	 +paS1BPr/Q9mhx/MXyGD8pAXercJelZCCWKkvPeWtEhbZIgrBTZ8cRIt8i6syeqMqV
	 NFfPfxbUBkmGA==
From: Lucas De Marchi <demarchi@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>
Cc: Lucas De Marchi <demarchi@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Phil Sutter <phil@nwl.cc>,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christophe Leroy <chleroy@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 1/2] module: Override -EEXISTS module return
Date: Mon, 30 Mar 2026 08:13:51 -0500
Message-ID: <-v2-1-a3542e15111c@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <-v2-0-a3542e15111c@kernel.org>
References: <-v2-0-a3542e15111c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1527; i=demarchi@kernel.org; h=from:subject:message-id; bh=09VheKtseQxbUtBLbnLgcVtPJcvvKuPAZjj1wtlSBJY=; b=owEBbQKS/ZANAwAKAZuipaYwy+pTAcsmYgBpynbg21ZmfI2q4ZIz1gWM/RqHDf/7y8cJswgWb NIcf95ZvyqJAjMEAAEKAB0WIQTqszyWkAE8czkWrIOboqWmMMvqUwUCacp24AAKCRCboqWmMMvq U8A5EACkdOMvwH4d5RZEGtJ7gGr2ZQgxttq7DSl/JuSkvyqdxOJqs1L4a4quOD5PsUxIwyV1WRS 1diRRUR0suU4JoFRrX93OjW7/IxP31sFZSuo5dNqDvBhZLzS/q35XDpzHayDo5lr6IDEVNY+r+g aOg7O10MlyoLXanWmyZU7CneuruuLxKbzqEcUPjS8G26HPy8fnDQDSWa4YKKW+TFjsE5n68C45I v01HSoH7kX7PqAPxkkr22CwD4IKc/RzOxweN93u9bgYY9oSI9geybDQWD0c/9ubiPkTQk6dOvmh zAfn64XRTZX59R1XcdaBw0lkL0c3xvfBQqXe1PqpfagBkO1VXwnxEdTOMK9dsGogfZQ7vxIkcSV rby1VZVmFQzN7cUcRWRYQYZETA5JIA3STcL8TI4LiITA4RUnMub0Yn4W1EC5Fo5XrmpvOyTMoF2 aTnXIqrKJwhzCfLqfMKH/CL/e18z0VWmxI9Zdbv/zctQ6ZoZNQM9OUYFNQXYF1Ws5EYgyiaVKMw bA28fgEC7lkMwVFAPvqJOj/TdgEVqIozUw8zihCHgqpdqqoXkrTm/2fcNkCrbbDJYezVvd+w4FT MZatFpXnjIy0zf/VziCa0tx9r+/3oiF5Fp4TZ+OS+1AWoJeFYECzXdlv5Gtq63ZBVf3B7gQuMtA lvAIrNeCZ
 CKPhfw==
X-Developer-Key: i=demarchi@kernel.org; a=openpgp; fpr=EAB33C9690013C733916AC839BA2A5A630CBEA53
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6197-lists,linux-modules=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[demarchi@kernel.org,linux-modules@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-modules];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0BB8C35BBFF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The -EEXIST errno is reserved by the module loading functionality. When
userspace calls [f]init_module(), it expects a -EEXIST to mean that the
module is already loaded in the kernel. If module_init() returns it,
that is not true anymore.

Override the error when returning to userspace: it doesn't make sense to
change potentially long error propagation call chains just because it's
will end up as the return of module_init().

Closes: https://lore.kernel.org/all/aKLzsAX14ybEjHfJ@orbyte.nwl.cc/
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Aaron Tomlin <atomlin@atomlin.com>
Cc: Petr Pavlu <petr.pavlu@suse.com>
Cc: Daniel Gomez <da.gomez@samsung.com>
Cc: Phil Sutter <phil@nwl.cc>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Lucas De Marchi <demarchi@kernel.org>
---
 kernel/module/main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index c3ce106c70af..3b60b7cda329 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -3045,6 +3045,14 @@ static noinline int do_init_module(struct module *mod)
 	if (mod->init != NULL)
 		ret = do_one_initcall(mod->init);
 	if (ret < 0) {
+		/*
+		 * -EEXIST is reserved by [f]init_module() to signal to usersapace that
+		 * a module with this name is already loaded. Use something else if the
+		 * module itself returning that.
+		 */
+		if (ret == -EEXIST)
+			ret = -EBUSY;
+
 		goto fail_free_freeinit;
 	}
 	if (ret > 0) {

-- 
2.53.0


