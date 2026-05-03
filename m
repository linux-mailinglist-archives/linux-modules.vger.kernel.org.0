Return-Path: <linux-modules+bounces-6339-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BI1OAlyR9mnxWQIAu9opvQ
	(envelope-from <linux-modules+bounces-6339-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Sun, 03 May 2026 02:05:48 +0200
X-Original-To: lists+linux-modules@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0D94B3B69
	for <lists+linux-modules@lfdr.de>; Sun, 03 May 2026 02:05:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A34C330022D9
	for <lists+linux-modules@lfdr.de>; Sun,  3 May 2026 00:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C213940DFC9;
	Sun,  3 May 2026 00:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0hxYW0E"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7155B1367
	for <linux-modules@vger.kernel.org>; Sun,  3 May 2026 00:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777766744; cv=none; b=TFbCdjOPPvl7OQGmHsopkU/+XvUPGMaCOwL42Gwt4c2ml0BW41SYYTzEkEfi/BDc4g+bqe+rI3tgT0Zw9Jkf0bsPvPWFieEVYJICmfevOMrb+weC546BYf5j7GlnL4ZWAvD1l3/IqQPujVcN4Xa+nOJAascAAkOErgIo0neumBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777766744; c=relaxed/simple;
	bh=ZKEL+uQH1FOrD2/R13JXDbIEvC1fqmuy5poleA8Qdyg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DZVel3N74lAU5l0vZOiixD0sKtBQTs/ARN6eYVy0FrHXttvQOVzDqfOKBnaDgLT2UZMeuwLcKGfccBwqjFGBqwgHd7QuMQEDeenaE2f4litYn+SZ83J2C/bGszSVrJfNPhYZqgYgh1MLuOE64iHa5wuVGnaSmR8Mcr3jOUIxSgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R0hxYW0E; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7dea20cf21aso2966617a34.1
        for <linux-modules@vger.kernel.org>; Sat, 02 May 2026 17:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777766742; x=1778371542; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GIRMx45vOgiLzrxuavXJ3Yf7PmCjpoz6wDAVtl8FDVk=;
        b=R0hxYW0E7PvJh/0UwPdTDZlJhblCq7gJ/BXe8dYXCX1taeVxtYNmkIWcFrltOn/Zze
         pC4EJVLZ5n8T1cvIVM0ffe+Ihvm/ULPkSfdk12mJfMA+gGCoCocNZwaTilUIZWOfJhil
         e3ehV3f6/lAV3gqCpa3iGBh8OKOx4F55l1yV9K5VMYhPNqwOu+u6jtf1YujFwReoTGsN
         eFnrzejiEt5nry7PQbGEv75phtvc0j14iQFihVRAp0bumeWVXDId3gMTtLQMyKNqc9As
         ezUqIkf8fZpqyLnzdIBSEW0KFq9/N0aA/UuiGzchrs+waKjnboCYAp7+t1Oh5Q73HliX
         HPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777766742; x=1778371542;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIRMx45vOgiLzrxuavXJ3Yf7PmCjpoz6wDAVtl8FDVk=;
        b=LdnvgtO0qYOys/2b/rlS1pYb9Mo27XwH/RhM5aI38cDk0yD6t2aT+QUHVdMvC/AQDT
         h3VmcLRHPuzpI14vooy23nqaF1tM2htslNlipnvRdxxC61DZS2V8u5vrBORHzhV1l+Zo
         n1J5sugn184xbAesWjkIfTqul0P2JzsAXJ2WF40Xpygcj6A8j72i6k2C4pWbHzQrwX58
         hUsVaahdYedeQo3DuTi0ehC51UpHmZefHKf8G47ljH5zN842UhLZXE+wk2DDDz9iQuXT
         qOcp4trd4Iguj3gpQql1IUIl7IDH0yFSnxuVEBmv9PbBmTT+hqPSQ3StUPAhdGtr+qOY
         t0SA==
X-Forwarded-Encrypted: i=1; AFNElJ+XPVGWn/2NlXGlQb1qItgg+xUxS+Zy7XrxYz2FWjr6TuwXEgdVVLQhtMcR2Zm3xb56vjNtwY1ISC6DTeQJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+Fx8MTBfSHLC74X3cQFpYqySW4ngl5SqfbSiV+ze/3yV2fNWl
	c5Z1bxybrMhw0RX4CbKB5QiAMChhuKcuOiBVmRGgGlNYzI3rY6lW3sGz
X-Gm-Gg: AeBDiesXF2nGKqen7DDVX7gGLW4fwqU3qJX4DVGCRPKTUJkLYe2RT9Xb+qgqYR4+ybi
	HwU5IumgkXFUWlqe3gcsNZOsG3a+OzxCRGnfYOdhIk2TUCNG6Mo9Zc5Ew5aQU81KoUYDHWFUDlS
	gEXeG3mGOOJp7FPn+ajVxtTsIGQWdVFtQcSY/rAW4+lt7/acsVXnIbuFy7u9lWlioDvUSuCCfAV
	ocCtcn9qPpG86oFBetErXxa9BiLNfFprFo5rcAGqY+WKV+PrC7F88dKJtOQ/QQVYOYBIiTc2jIn
	W9K66hp11+6GycizNQ5AmxMGcP60t/KCiJlPTrmTe79O8WqAf1l8aUGdN4MZK5I2XhmEBTnFQ/D
	0H/K3pK9xO/mgyFzGDXYi5/niiIsK6qCcdXE5SweWjRBZGAXC3UtkhiuDECSrm5m+ovf/pPDlOu
	Q4SZYRWfl2NFmqf93h7W+PoXkPMOBsLgdt9Ain+gdoOi1L3P/iWnRbUcLKtj1Fal+GXHxX8meQ
X-Received: by 2002:a05:6830:6484:b0:7dc:cd0b:58bc with SMTP id 46e09a7af769-7dee1261e2emr2667101a34.7.1777766742471;
        Sat, 02 May 2026 17:05:42 -0700 (PDT)
Received: from [100.82.231.29] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7decae2b090sm5379676a34.24.2026.05.02.17.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 17:05:42 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 0/5] PATCH 0/6] dyndbg: fix i386 alignment and KEEP module
 sections
Date: Sat, 02 May 2026 18:05:31 -0600
Message-Id: <20260502-asm-generic-1-v1-0-1103ee0152df@gmail.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBvQMSO6SrQQnWwWWShEEN49a
 fkX779QOAsXmLsXMt9S5EwtdN+B312KjBJaAykalVWErhwYOTXlUaMhPw3kjA1BQTNX5k2e/7e
 stX7TyLOVXwAAAA==
X-Change-ID: 20260502-asm-generic-1-32c842a35dd0
To: Arnd Bergmann <arnd@arndb.de>, Jason Baron <jbaron@akamai.com>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
 Aaron Tomlin <atomlin@atomlin.com>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-modules@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777766741; l=1850;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=ZKEL+uQH1FOrD2/R13JXDbIEvC1fqmuy5poleA8Qdyg=;
 b=0SzOGfTU03sQ5R9xI9yMhs/DNczLBjWrIIsjqxHplD8PVcZD8haEy5tc2wMV+ZofojocTNtsX
 J+X5ddihN8HCiVN4bRkvrV2Yz3U7NrGITeQ/KmD6maKeu9oHya8DD61
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=
X-Rspamd-Queue-Id: 8A0D94B3B69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bootlin.com];
	TAGGED_FROM(0.00)[bounces-6339-lists,linux-modules=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,linux-modules@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-modules];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]

This series starts with a fix to a section misalignement on i386, and
follows with cleanups and refactoring for reuse.

When CONFIG_DRM_USE_DYNAMIC_DEBUG=Y (currently marked BROKEN) and
CONFIG_DRM=y, the __dyndbg_classes section gets a single
struct/record.  On i386 this is 28-bytes, breaking the required
ALIGN(8) on the following __dyndbg section.

This breaks dynamic_debug_init() with a NULL pointer dereference; the
section traversal logic encounters padding bytes instead of a valid
descriptor.

the series:

1. adds ALIGN(8) to the BOUNDED_SECTION_* macros

2. refactors BOUNDED_SECTION_* macros for later reuse

3. adds dyndbg.lds.S to KEEP sections in modules
   follows codetag.lds.h model

4. drops unused HEADERED_SECTION_* macros

5. removes redundant (after patch 1) ALIGN(8)s in vmlinux.lds.h

6. adds BOUNDED_SECTION_* _ALIGN variants,
   usea them in ORC_UNWIND_TABLE

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
Jim Cromie (5):
      vmlinux.lds.h: refactor BOUNDED_SECTION_* macros into bounded_sections.lds.h
      vmlinux.lds.h: drop unused HEADERED_SECTION* macros
      vmlinux.lds.h: Fix ALIGN(8) omission causing NULL ptr on i386
      vmlinux.lds.h: remove redundant ALIGN(8) directives
      dyndbg.lds.S: fix lost dyndbg sections in modules

 MAINTAINERS                                |  1 +
 include/asm-generic/bounded_sections.lds.h | 32 +++++++++++++++++
 include/asm-generic/dyndbg.lds.h           | 19 ++++++++++
 include/asm-generic/vmlinux.lds.h          | 58 +++++-------------------------
 scripts/module.lds.S                       |  2 ++
 5 files changed, 62 insertions(+), 50 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260502-asm-generic-1-32c842a35dd0

Best regards,
-- 
Jim Cromie <jim.cromie@gmail.com>


