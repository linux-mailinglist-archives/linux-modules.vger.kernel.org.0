Return-Path: <linux-modules+bounces-5760-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GE24KEg2l2k/vwIAu9opvQ
	(envelope-from <linux-modules+bounces-5760-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Thu, 19 Feb 2026 17:11:52 +0100
X-Original-To: lists+linux-modules@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4531F1608CA
	for <lists+linux-modules@lfdr.de>; Thu, 19 Feb 2026 17:11:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 732623004F22
	for <lists+linux-modules@lfdr.de>; Thu, 19 Feb 2026 16:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 322DE34B1AC;
	Thu, 19 Feb 2026 16:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TBCmb1jK"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BACB34A765;
	Thu, 19 Feb 2026 16:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771517510; cv=none; b=Kv5XWD3RlFOOKeBSVzAAehi1NGEenUZmccqLPwJkJ5qsjMWKFXFohhPsDx1FrCGj6WrnhaQT+cVuMu4un05s7CHEA97aEL9TNykpIXkxk0GHKzc9fYElSW4LHglw667QwugAaSNjJiS4K9vooR+OIUx1/H2T57eV6YYJz2J3PoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771517510; c=relaxed/simple;
	bh=4gcQjGoJPNJg892BM7OVRv9m0uHb38i7oO1kv8EH3L0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pKgXpm5UdmLV1Jujg7mRfYmP/GVMj5IsdYACmjWC+nxj0xD/1V0OQpYoNHEICIU/N1gePg4Mm4ms32Uq/i0uONtVcyTTQOI6AXvryjhzXnr/NMSTUnLNNw0U8OTkeOqt76oHAIslUJCho4Ihdz8RetvZqLnJX8t870Sn8P9yP7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TBCmb1jK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ABF3C4CEF7;
	Thu, 19 Feb 2026 16:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771517509;
	bh=4gcQjGoJPNJg892BM7OVRv9m0uHb38i7oO1kv8EH3L0=;
	h=From:Date:Subject:To:Cc:From;
	b=TBCmb1jKvdbUWQ58yd7ChXhtEZeFnR/b2gV6RXOyGgLiIby/W3u08bdlSd4SAMIDL
	 lraQXnGtQE3uTF3PNpDtXxJsMnjqx6MqO28LKBerRBjnxBbtHySAEmyFBqc02ylVeh
	 yzQOfYMM8cfyv6wdJqLc/ljpTjRhRCwUf+4xISOgnQ5ZhVS703KMyQPl9gy+F4qYI1
	 iIiCBEYWZRFOTjgpanvWRKgrSUOw70sT+WD5XnF7UnRG/EU+SrO7vKGMAn5uoKiGJO
	 p3MfKykU05F5rRqBOyMqsryvSwsva599g+++Sea/OPKKsYT3imkcdZ2kAaXAfPJFz9
	 K4DnexMnk0ATg==
From: Daniel Gomez <da.gomez@kernel.org>
Date: Thu, 19 Feb 2026 17:10:53 +0100
Subject: [PATCH] builtin: mark __builtin_strlen() as integer constant
 expression
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-fix-builtin-strlen-v1-1-3ec3efc0cda7@samsung.com>
X-B4-Tracking: v=1; b=H4sIAAw2l2kC/x2MQQqAIBAAvyJ7bkENIvtKdMjaakEstCIQ/551H
 JiZBJECU4ROJAh0c+TdF1CVgGkb/UrIc2HQUjdSK4MLP2gvdid7jGdw5FG2ZOvxE4yFEh6BivV
 P+yHnFx4s1upkAAAA
X-Change-ID: 20260219-fix-builtin-strlen-08eb3a02609b
To: Chris Li <sparse@chrisli.org>, linux-sparse@vger.kernel.org
Cc: Aaron Tomlin <atomlin@atomlin.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Daniel Gomez <da.gomez@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Eric Biggers <ebiggers@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-modules@vger.kernel.org, "Luck, Tony" <tony.luck@intel.com>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1223; i=da.gomez@samsung.com;
 h=from:subject:message-id; bh=j87Y2dJcwdq0p1O1Ul/L7V3YRi0Y7sCZYFOwhDIphl0=;
 b=owEBbQKS/ZANAwAIAUCeo8QfGVH7AcsmYgBplzY5OXYb4M90J+DN4bnOmXzMhhwWeysZ/eCq3
 CT0lv69xlmJAjMEAAEIAB0WIQTvdRrhHw9z4bnGPFNAnqPEHxlR+wUCaZc2OQAKCRBAnqPEHxlR
 +zpyEACL10TDRCrSJCxnLgj/9fr4Jj2UpRC4FcLCPBMzRWcRk99GWQzO08HhPF3e3EqTp5rsDLF
 cH5KGLT8Smmj9lvkikrsfBhvqF7trYsYVUGSRvSBNz+Sui5PNTkPVGsu/vp0UiQW6imW9JaVXbk
 wepgPfBxtO/rbx9+rQxvWQvLc7gM/PtxmlWzw8MxYDM+KVfI1u2DkI/5E5Ejd0QqHfTSpLwjdTA
 8h2Ku/wWR1ijiIMoqxwofSyu/I3nG3Vs+DsEmXqeTjMfprudCdJo2XoOm7OwrKkhrPlYcqW7dvG
 3HO8eeIZsMKOPUhvbIvqZ0tiineTl9bJ61GXCtDheNSTUAwZmY9RrrVCBbveGB6OkLZ4SST6Qqz
 hfad9NfR4JipEt1YUkUskXUtVcQwZ83YEVX/vbMR59oFcvgv0ddp/bC7ApeA8ovIHTXegGFHQei
 QCEWoBQ6Q5EvVJL0dQc0F3SJOLwzvsZn9XNNj4n5RN35NJYgWCKDUPr1yETQj2vuQnu5/hB9T5O
 JolMAyMB+Tji/7xh0p3c04Jit0o/AlBQkT8g4yqRXX82BkdY1sadX4mKfiWxW/6TRvPuhSbIqfO
 iw15ZaU+Ov6emVjQTAdQmnBoq8HZyZvm6Eky9DNjYgBjJtsySF3kPMNREm959E45kWCKLSPo8OP
 orDT0FwtYG8yiuA==
X-Developer-Key: i=da.gomez@samsung.com; a=openpgp;
 fpr=B2A7A9CFDD03B540FF58B27185F56EA4E9E8138F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5760-lists,linux-modules=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[atomlin.com,intel.com,linaro.org,kernel.org,gmail.com,vger.kernel.org,suse.com,google.com,samsung.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[da.gomez@kernel.org,linux-modules@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-modules];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:mid,samsung.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4531F1608CA
X-Rspamd-Action: no action

From: Daniel Gomez <da.gomez@samsung.com>

Commit ae83f3b72621 ("module: Add compile-time check for embedded
NUL characters") in the Linux kernel added static assert checks for
__builtin_strlen() inside MODULE_INFO() macros. But sparse does not mark
the result as CEF_SET_ICE during evaluation, making these assertions
fail with:

    error: static assertion failed: "MODULE_INFO(...) contains embedded
    NUL byte"

Fix by marking __builtin_strlen() as an integer constant expression at
eval time. This matches other builtins like __builtin_constant_p() or
__builtin_safe_p().

Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
---
Discussion:
https://lore.kernel.org/all/aTc9s210am0YqMV4@agluck-desk3/
---
 builtin.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/builtin.c b/builtin.c
index 9149c43d..7573abf8 100644
--- a/builtin.c
+++ b/builtin.c
@@ -616,6 +616,7 @@ static int expand_strlen(struct expression *expr, int cost)
 }
 
 static struct symbol_op strlen_op = {
+	.evaluate = evaluate_to_int_const_expr,
 	.expand = expand_strlen,
 };
 

---
base-commit: fbdde3127b83e6d09e0ba808d7925dd84407f3c6
change-id: 20260219-fix-builtin-strlen-08eb3a02609b

Best regards,
--  
Daniel Gomez <da.gomez@samsung.com>


