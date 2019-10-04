Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 460C0CB7BE
	for <lists+linux-modules@lfdr.de>; Fri,  4 Oct 2019 11:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387466AbfJDJ5z (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Fri, 4 Oct 2019 05:57:55 -0400
Received: from mail-qk1-f202.google.com ([209.85.222.202]:45450 "EHLO
        mail-qk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387440AbfJDJ5z (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Fri, 4 Oct 2019 05:57:55 -0400
Received: by mail-qk1-f202.google.com with SMTP id s14so5770394qkg.12
        for <linux-modules@vger.kernel.org>; Fri, 04 Oct 2019 02:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=1/VpF4gesFXU4507UWxnVqQ50T2yMtX0vj1yZbNb6oQ=;
        b=EjXCs01Nw9e85QbwhhT2J7CTEZu2WaD0wE4BqfUUDVzVWVU028VQ8BTERUBxKdYCud
         MA243tqwxNN5ZMv+MijBP/HwGQn1TDDQR82nDKo0OxslMQ/vn9mde3VL2uRXgW2Qdo8D
         vzdH7lDcznW/2FXUsmgMYlytbjNXeOSZrb6jAO6euFMwnM73Bwgq+upRy3G0qgF8yZCO
         B+VHFwgykCM4yR1WymcI/HBJtLVJDtakY1wEi4K34lpkRnT1jgogUopWcBZitko8fIij
         QuREfON3rxVDSqjhMQhBc8d/7Qdy4qH9pntPhSx2KfLkBbaJkODzpTLMq2iBs9NWO3qu
         NHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=1/VpF4gesFXU4507UWxnVqQ50T2yMtX0vj1yZbNb6oQ=;
        b=fseFh6PXaY7HetwtWLa1JYDZk/A5xz1BvfSy9ueeJ0j9TNxT1YI2NGCSYpBTgsHzyk
         6cvP+kyEaPILqlqbiS11yIpa6VxeV+WbtRPfop9eLmh69MnSvJgkt9XAxVNI9msZjisK
         LBuLnEUZj3wK7dRnB9LE37of75+Jyi1Tz35R+TT3AdcrrpJxSWO7m5o+kqKxSfxrrNCG
         NIX1Av9JymGzjR6NwSRIWqkrOQbe2oSvau+8Se+5Hfu2bO6AJxz2ddFGB3Xi5uodpXqy
         hDH+4/0PBby7Pq9O++WHy0m/5kBG8ZUCrBedmNEcshbhLehJnQqFiTHWFJ63ne4FpEaF
         PVgw==
X-Gm-Message-State: APjAAAV8fDtw7iFw+GWcZNNxMqz/wvRSZlGp61NNr+A2/2+VPUp8eiZe
        PMlzKTAk1or00cwh+wMvvuCwYGQI6v2UkA==
X-Google-Smtp-Source: APXvYqw/XciF/wt63YDVoL1Jtf61U+HYneFII6RukZGjq5FfUKVrdl8BiBFZBR4/xCnzvjveFzbrGC0YSkJ34g==
X-Received: by 2002:a37:8f02:: with SMTP id r2mr9282685qkd.197.1570183073090;
 Fri, 04 Oct 2019 02:57:53 -0700 (PDT)
Date:   Fri,  4 Oct 2019 10:57:48 +0100
In-Reply-To: <20190917231031.81341-1-maennich@google.com>
Message-Id: <20191004095748.223119-1-maennich@google.com>
Mime-Version: 1.0
References: <20190917231031.81341-1-maennich@google.com>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
Subject: [PATCH] depmod: create and use System.map.no_namespaces
From:   Matthias Maennich <maennich@google.com>
To:     linux-kernel@vger.kernel.org
Cc:     kernel-team@android.com, maennich@google.com,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Jessica Yu <jeyu@kernel.org>,
        Martijn Coenen <maco@android.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: owner-linux-modules@vger.kernel.org
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

depmod in its current version is not aware of symbol namespace in
ksymtab entries introduced with 8651ec01daed ("module: add support for
symbol namespaces."). They have the form

  __ksymtab_NAMESPACE.symbol_name

A fix for kmod's depmod has been proposed [1]. In order to support older
versions of depmod as well, create a System.map.no_namespaces during
scripts/depmod.sh that has the pre-namespaces format. That way users do
not immediately upgrade the userspace tool.

[1] https://lore.kernel.org/linux-modules/20191004094136.166621-1-maennich@google.com/

Reported-by: Stefan Wahren <stefan.wahren@i2se.com>
Fixes: 8651ec01daed ("module: add support for symbol namespaces.")
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Lucas De Marchi <lucas.de.marchi@gmail.com>
Cc: Jessica Yu <jeyu@kernel.org>
Cc: Martijn Coenen <maco@android.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-modules@vger.kernel.org
Signed-off-by: Matthias Maennich <maennich@google.com>
---

Please note this depends on the new ksymtab entry format proposed in
https://lore.kernel.org/lkml/20191003075826.7478-2-yamada.masahiro@socionext.com/

That is likely to be merged soon as well as it fixes problems in 5.4-rc*, hence
this patch depends on it.

Cheers,
Matthias

 .gitignore        | 1 +
 scripts/depmod.sh | 8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index 70580bdd352c..5ed58a7cb433 100644
--- a/.gitignore
+++ b/.gitignore
@@ -59,6 +59,7 @@ modules.order
 /vmlinux-gdb.py
 /vmlinuz
 /System.map
+/System.map.no_namespaces
 /Module.markers
 /modules.builtin.modinfo
 
diff --git a/scripts/depmod.sh b/scripts/depmod.sh
index e083bcae343f..602e1af072c7 100755
--- a/scripts/depmod.sh
+++ b/scripts/depmod.sh
@@ -39,7 +39,13 @@ if $depmod_hack_needed; then
 	KERNELRELEASE=99.98.$KERNELRELEASE
 fi
 
-set -- -ae -F System.map
+# Older versions of depmod do not support symbol namespaces in ksymtab entries,
+# hence create an alternative System.map with namespace patched out to use for
+# depmod. I.e. transform entries as follows:
+#    __ksymtab_NAMESPACE.symbol_name -> __ksymtab_symbol_name
+sed 's/__ksymtab_.*\./__ksymtab_/' System.map > System.map.no_namespaces
+
+set -- -ae -F System.map.no_namespaces
 if test -n "$INSTALL_MOD_PATH"; then
 	set -- "$@" -b "$INSTALL_MOD_PATH"
 fi
-- 
2.23.0.581.g78d2f28ef7-goog

