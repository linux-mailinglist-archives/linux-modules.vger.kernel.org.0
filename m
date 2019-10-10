Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9BECD2D67
	for <lists+linux-modules@lfdr.de>; Thu, 10 Oct 2019 17:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726220AbfJJPQD (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Thu, 10 Oct 2019 11:16:03 -0400
Received: from mail-wr1-f73.google.com ([209.85.221.73]:36087 "EHLO
        mail-wr1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbfJJPQD (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Thu, 10 Oct 2019 11:16:03 -0400
Received: by mail-wr1-f73.google.com with SMTP id w8so2917491wrm.3
        for <linux-modules@vger.kernel.org>; Thu, 10 Oct 2019 08:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=JnBEaa7F8Z1V9KqywKFqf8fBJ0Vr9PkxAfCT13jnqaQ=;
        b=kA+xAflPHKMcLMO5k9wA/HehdrDX5OsKjvfma+dSuS5w5OCjt7m5C+NemNQE92jyGX
         M/CfDXDNzsHeOgCVJcnVy/1k0/jX2uELIQXIeMpNmEVujtMFX3eupGCcm6dhitH1hex3
         ecrGxAA5LqqPYGkfdm8/eRjdLcBgiZVmUY2CSjp6JXAT5HDCxpddQRXy9VEFOa0wbPdl
         IshkWWXJTh6D9tzHW463e0x7Nk70qZKfyFgQP6XMx9NPv9r9eY78pfEEqohIWBK2XNEm
         71a+eWSitDIhUBPCc6iHAIz7cGPDozth7RjZM9Xy+SMcVHpOdYScSdfrw16lsRIiDCHC
         e4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=JnBEaa7F8Z1V9KqywKFqf8fBJ0Vr9PkxAfCT13jnqaQ=;
        b=oMA27nAr6dqAdzZy5MunNeU/xpiCniBH7OysbGWSnUYMPoLazc98ycDdo3p2oEVJ/z
         P+hfGM5n0s7F4ra7AvlaHqqN31qIjNgfLNEKPIRnCmjCHrBN0cCg8Csyx6jh3TYev2WZ
         cwC2MVSnYVIDZiGqCc2+CM4izv70qePmQoXK8FzcDNeeYCoJGkl/x9h0V6QF4/jrPbeN
         B2NJshTSPHVAK3BG16W8JZhGGbOBGj42gKJFCcz+eDJ1fT1o8tOFqcLPBMQBnwOoSvfW
         lCf6lCh+b6vHeTcZGlofEZNqJnfcE5vi7MUWt8NGDJmGjSJYP8xB1pjFqYgdM3xKFTG2
         D1vQ==
X-Gm-Message-State: APjAAAXrjFFlEyEK6qVP9DUpqi0V2Vg01veRNLH9gaaIFiWlrKy0ivWX
        fA6UKh2+X8IFpP3bpszKqQzvzZTvtogU3w==
X-Google-Smtp-Source: APXvYqwOmCBOUOIBgrU0mWLmDOajyzh9Ms93budV/do9YlhAoyu8eBu9ca2BMeneC59qTz+1zYNOUzJb0OX4vA==
X-Received: by 2002:a05:6000:1cb:: with SMTP id t11mr8717075wrx.144.1570720560652;
 Thu, 10 Oct 2019 08:16:00 -0700 (PDT)
Date:   Thu, 10 Oct 2019 16:14:39 +0100
Message-Id: <20191010151443.7399-1-maennich@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
Subject: [PATCH 0/4] export/modpost: avoid renaming __ksymtab entries for
 symbol namespaces
From:   Matthias Maennich <maennich@google.com>
To:     linux-kernel@vger.kernel.org
Cc:     kernel-team@android.com, maennich@google.com,
        Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Martijn Coenen <maco@android.com>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Shaun Ruffell <sruffell@sruffell.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: owner-linux-modules@vger.kernel.org
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

The introduction of the symbol namespace patches changed the way symbols are
named in the ksymtab entries. That caused userland tools to fail (such as
kmod's depmod). As depmod is used as part of the kernel build it was worth
having another look whether this name change can be avoided.

The main purpose of this series is to restore the original ksymtab entry names.
For that to happen and to remove some rough edges around that, the relevant
parts in modpost got a small refactoring as to when and how namespaces are
evaluated and set in the symbol struct.

Eventually, the namespace values can be read from __kstrtabns_ entries and
their corresponding __ksymtab_strings values. That removes the need to carry
the namespace names within the (anyway unique) symbol name entries.

The last patch of this series is adopted from Masahiro [1]. By allowing 'no
namespace' to be represented as empty string, large chunks of
include/linux/export.h could be consolidated. Technically, this last patch is
not absolutely necessary to fix functionality. It addresses concerns about
maintainability and readability. While I strongly suggest sending all of the
patches for 5.4, the last one could possible deferred to the next merge window.

This patch applies to the modules-linus [2] branch.

[1] https://lore.kernel.org/lkml/20190927093603.9140-5-yamada.masahiro@socionext.com/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/jeyu/linux.git/log/?h=modules-linus

Cc: Jessica Yu <jeyu@kernel.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Martijn Coenen <maco@android.com>
Cc: Lucas De Marchi <lucas.de.marchi@gmail.com>
Cc: Shaun Ruffell <sruffell@sruffell.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Will Deacon <will@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Cc: linux-modules@vger.kernel.org


Matthias Maennich (4):
  modpost: delegate updating namespaces to separate function
  modpost: make updating the symbol namespace explict
  symbol namespaces: revert to previous __ksymtab name scheme
  export: avoid code duplication in include/linux/export.h

 include/linux/export.h | 97 +++++++++++++-----------------------------
 kernel/module.c        |  2 +-
 scripts/mod/modpost.c  | 58 ++++++++++++++++---------
 scripts/mod/modpost.h  |  1 +
 4 files changed, 69 insertions(+), 89 deletions(-)

-- 
2.23.0.581.g78d2f28ef7-goog

