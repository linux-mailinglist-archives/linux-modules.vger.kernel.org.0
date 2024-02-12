Return-Path: <linux-modules+bounces-427-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FDC851B36
	for <lists+linux-modules@lfdr.de>; Mon, 12 Feb 2024 18:23:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EF4D28C4C8
	for <lists+linux-modules@lfdr.de>; Mon, 12 Feb 2024 17:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 539AB3DB9A;
	Mon, 12 Feb 2024 17:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H0ndWNwy"
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5633D978
	for <linux-modules@vger.kernel.org>; Mon, 12 Feb 2024 17:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707758586; cv=none; b=Ry4c07Cq6U9Sun2unKBV1sjZY/KPIiHHld159n6sUUnTmyW1G/0sOmn3CHUOVz/rZsNsnE9fo/p/tJL70Y8NixbiZ3jnuaGOVncoSCawYhRC+aW02xp4+/AJxGAB6Gj9Irq2+fSap7C0BFhX+5hA/wVSgcjTpqQRDALfwH4+OGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707758586; c=relaxed/simple;
	bh=OSn12E7RuIDFHVDzki3PcAWWT9S6I3+PV7ShqzZOkAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nSydjBb6DGp2TSxlJva46TqlqSmxxbMy3RyV3XOgk9cHTrTyJv7oEbFevQK+coRlEMwKqhht8o8fqML6fwmUe477h9oFABlE08YRJ/ALdINZSKskQlJAZXJAQHqU0ddUcX/3fNnYsHPWnXCa3Pt17r7lrW5T8b/WkMU1mQYz1lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H0ndWNwy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE2EFC433F1;
	Mon, 12 Feb 2024 17:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707758585;
	bh=OSn12E7RuIDFHVDzki3PcAWWT9S6I3+PV7ShqzZOkAE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=H0ndWNwyLscroLZSwCJnwV6QWWBHS5kp3AMzzZMG9e4ypPfSQARnME6yVNaj2Tu21
	 4rxoL1XUZTKPs0SmNLt+VgOOw7ZA/J/scDklCpcI6+8BwVRy5h7UbR/QzfekZGn8uj
	 qSQF0RQM2Ncp0xLYPDLw91JWSETq4BERtvR+izqVAJqWednP/4+9rtRiYGxxWkV5Z0
	 /4QlPUIhmsvCO8XC/qAJpw3pdK/Ige4n0NQV7X+H2GPGywkj68MK5kLUkwN8UTd6Qe
	 qlO775nODKXFTCH5M5A9VB2u5fDw0kr+ExjaF7cZbcdpCcrBq0/uyNJQybrFE7fjLA
	 4JBESs0vOw2EA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E4AC48297;
	Mon, 12 Feb 2024 17:23:05 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Mon, 12 Feb 2024 17:23:03 +0000
Subject: [PATCH kmod 02/13] libkmod: keep gzFile gzf local to load_zlib()
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240212-decompression-fixes-v1-2-06f92ad07985@gmail.com>
References: <20240212-decompression-fixes-v1-0-06f92ad07985@gmail.com>
In-Reply-To: <20240212-decompression-fixes-v1-0-06f92ad07985@gmail.com>
To: linux-modules@vger.kernel.org
Cc: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707758583; l=2092;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=dynpgl/ahQS0pC4J5FA730cbtaNUmwCDCWyHTxZtfko=;
 b=OnaUsbxYZ1j1uQmSCFipwGIFtNN8dmD0R7GfYhZHCJ6r1O5/r7Ky9N25ElRq+TF9mpNveY4dr
 yjzTTMwWFB4CPJeIKLtf5C+Kac7WAC5GaD+20bc0kU5EXgOGd02rQ9q
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received:
 by B4 Relay for emil.l.velikov@gmail.com/20230301 with auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: <emil.l.velikov@gmail.com>

From: Emil Velikov <emil.l.velikov@gmail.com>

There is no need to keep the root gzFile context open for the whole
duration. Once we've copied the decompressed module to file->memory we
can close the handle.

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 libkmod/libkmod-file.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/libkmod/libkmod-file.c b/libkmod/libkmod-file.c
index b97062b..9a014ea 100644
--- a/libkmod/libkmod-file.c
+++ b/libkmod/libkmod-file.c
@@ -53,9 +53,6 @@ struct kmod_file {
 #endif
 #ifdef ENABLE_XZ
 	bool xz_used;
-#endif
-#ifdef ENABLE_ZLIB
-	gzFile gzf;
 #endif
 	int fd;
 	enum kmod_file_compression_type compression;
@@ -317,6 +314,7 @@ static int load_zlib(struct kmod_file *file)
 	int err = 0;
 	off_t did = 0, total = 0;
 	_cleanup_free_ unsigned char *p = NULL;
+	gzFile gzf;
 	int gzfd;
 
 	errno = 0;
@@ -324,8 +322,8 @@ static int load_zlib(struct kmod_file *file)
 	if (gzfd < 0)
 		return -errno;
 
-	file->gzf = gzdopen(gzfd, "rb"); /* takes ownership of the fd */
-	if (file->gzf == NULL) {
+	gzf = gzdopen(gzfd, "rb"); /* takes ownership of the fd */
+	if (gzf == NULL) {
 		close(gzfd);
 		return -errno;
 	}
@@ -343,12 +341,12 @@ static int load_zlib(struct kmod_file *file)
 			p = tmp;
 		}
 
-		r = gzread(file->gzf, p + did, total - did);
+		r = gzread(gzf, p + did, total - did);
 		if (r == 0)
 			break;
 		else if (r < 0) {
 			int gzerr;
-			const char *gz_errmsg = gzerror(file->gzf, &gzerr);
+			const char *gz_errmsg = gzerror(gzf, &gzerr);
 
 			ERR(file->ctx, "gzip: %s\n", gz_errmsg);
 
@@ -362,19 +360,17 @@ static int load_zlib(struct kmod_file *file)
 	file->memory = p;
 	file->size = did;
 	p = NULL;
+	gzclose(gzf);
 	return 0;
 
 error:
-	gzclose(file->gzf); /* closes the gzfd */
+	gzclose(gzf); /* closes the gzfd */
 	return err;
 }
 
 static void unload_zlib(struct kmod_file *file)
 {
-	if (file->gzf == NULL)
-		return;
 	free(file->memory);
-	gzclose(file->gzf);
 }
 
 static const char magic_zlib[] = {0x1f, 0x8b};

-- 
2.43.0


