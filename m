Return-Path: <linux-modules+bounces-2393-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B579B6AD2
	for <lists+linux-modules@lfdr.de>; Wed, 30 Oct 2024 18:20:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E93AD1C21042
	for <lists+linux-modules@lfdr.de>; Wed, 30 Oct 2024 17:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4107121503E;
	Wed, 30 Oct 2024 17:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ggoZYOY+"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7291E231C
	for <linux-modules@vger.kernel.org>; Wed, 30 Oct 2024 17:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730308599; cv=none; b=p0nnDO82BWJcagHbHrgVG3iIeXgqfflGJDeZ6VfvG4oVQqMCdlc7eyjDF2Yc1TBwr7BLWfGBJwKMnVAC94gw0SOMf44pa1Ywzf2FyctJK40eYTsVWNoY7xMUjwU6fFHHXw9E0qe8TW/Yz4+ivZ7tYb43PVxdxurh7HaxmbMyMVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730308599; c=relaxed/simple;
	bh=Tm1wNYqvzeAF3HnTDVTnjC8Rcq/6gl29WbAbQZ1MVNg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=gdLNpJDo70xXGRTyL6Aq+lS5g62PXmcp3ba8vrFJWqOJnB998Mh90FafnpqjrJXrbznJoDDVwcqaYUN0NFWXUeaS5zkpjt0dXGC1l1UF6y8Xxp7DGoZNSlbTYUy9Yx1D2FLkIZY+tDqm/KTEHsPCkcKLsK13HJZ/Q8NLlkOAyZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ggoZYOY+; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6ea258fe4b6so51371047b3.1
        for <linux-modules@vger.kernel.org>; Wed, 30 Oct 2024 10:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730308596; x=1730913396; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g6NaQ3IuZZfSraqlt8TSkxzrbSmeVk6CTF7q3lZSxz4=;
        b=ggoZYOY+OBg8MYH9iZI4VkvQ9iww88haatF39UO3Di1sJp0y9oNHbNspMBdEcVNZ/N
         9e+KHQjRjP9h4j0sVl6jqBbxk/paVpdkvXFPeIqhOp1vn7GsW23+QqlFZVUPvGE/EOSp
         nBFq2tKYbni5iyhKjyEmfaU32JqUYjX5ZouSTEWh0nG5QEM5RAcdyY9kncNM+BIjolED
         VjjB58mBrdVr/mvNDzHNEQKLIICmhVZtRr+NjVmLHof6q0fs3w8hSLVN42jPkdTOLK1b
         LbBvo4zXemia7U3JfMIgKD81q7WnK6cjHPxsTGI5HndK3luzXxzbtd6F2cZtqBO2EM4K
         5gRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730308596; x=1730913396;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g6NaQ3IuZZfSraqlt8TSkxzrbSmeVk6CTF7q3lZSxz4=;
        b=LH4+zRSDe1tSjIjigoYBN08ymFQPq/0DsF1kxu782yXZSTUl+eLIiHUuaF9DQO31Qm
         JYSh5YfjcE2gv/EpZOOwl/LbTUN2jh+VaaRiSNe88s6orKmR7ShCVPs65FojiEM+aQiq
         ZLx3kzyVva84Jelo4VfJfLsZg24ES0YppqfTclE+to/OwNUDgpinB08JUYwKEBDf/J0f
         lMHFraqKL/7GUvSsfxQtzt5R45S5cMYMCWNb8ghD8AaC3JQ+xjwKpiKbJLLyAu6vPTU/
         5cBKAx2/x1pDyfPPqRY3gG5b0lRt8LCNgLhJpMloWiMquok0it4a0zIlsstupjzgXnIm
         jz+w==
X-Forwarded-Encrypted: i=1; AJvYcCUVq6gdS4z9tvSzeLFLPMYRAj9Nr3Y8THRoqZMMzmDmsYizbBZ35/YriPoYVd2LKk+4nDJs4ftVrt8/lOUP@vger.kernel.org
X-Gm-Message-State: AOJu0YwSTiM7LFHXcZrUSW1Mupivqv7iiwbk5wffmjEfumSqSKns3sgm
	KRQnjPPquCfomHwNdKOW3alG3jNociS9ZB0Wz7++oop2iH5e4s1zjABo9JwW5Y2OZp4TiT+l3Vf
	K9A5tQw==
X-Google-Smtp-Source: AGHT+IG5xPxqqpKxLgZ6zXN6V78UnUjBXaSxpkGut/FS6GJSqSvmQ69f6lOGEvOsEwQHgaeCqjpR5w/uRE0E
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:4b85:0:b0:e29:68a9:8612 with SMTP id
 3f1490d57ef6-e3087a54ccemr74678276.4.1730308595588; Wed, 30 Oct 2024 10:16:35
 -0700 (PDT)
Date: Wed, 30 Oct 2024 17:16:34 +0000
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPFpImcC/4WNQQqDMBBFryKzbopJrCVd9R7FhR1HDagTEgkWy
 d2b5gJdfd6H//4JgbylAI/qBE/RBstbBnWpAOd+m0jYITOoWjWyVkZ4WjmSoMOx3zOVcIu46/a
 GLfb6TQR57TyN9ijmV5d5tmFn/ylHUf7a/84ohRQGhxZxNLox+jkxTwtdkVfoUkpfzMP6kL8AA AA=
X-Change-Id: 20241029-remove-export-report-pl-7365c6ca3bee
X-Mailer: b4 0.15-dev
Message-ID: <20241030-remove-export-report-pl-v2-1-f289ab92bd2e@google.com>
Subject: [PATCH v2] scripts: Remove export_report.pl
From: Matthew Maurer <mmaurer@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Luis Chamberlain <mcgrof@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

This script has been broken for 5 years with no user complaints.

It first had its .mod.c parser broken in commit a3d0cb04f7df ("modpost:
use __section in the output to *.mod.c"). Later, it had its object file
enumeration broken in commit f65a486821cf ("kbuild: change module.order
to list *.o instead of *.ko"). Both of these changes sat for years with
no reports.

Rather than reviving this script as we make further changes to `.mod.c`,
this patch gets rid of it because it is clearly unused.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
Changes in v2:
- Remove references to export_report from Makefile
- Link to v1: https://lore.kernel.org/r/20241029-remove-export-report-pl-v1-1-9cd6ccf93493@google.com
---
 Makefile                 |   6 +-
 scripts/export_report.pl | 186 -----------------------------------------------
 2 files changed, 1 insertion(+), 191 deletions(-)

diff --git a/Makefile b/Makefile
index f554430954deebd56ede882f81a541ebc42f1937..5333b3f8a1a916d70614d6d125dc383b2a47bb34 100644
--- a/Makefile
+++ b/Makefile
@@ -1620,7 +1620,6 @@ help:
 	@echo  '                    with a stack size larger than MINSTACKSIZE (default: 100)'
 	@echo  '  versioncheck    - Sanity check on version.h usage'
 	@echo  '  includecheck    - Check for duplicate included header files'
-	@echo  '  export_report   - List the usages of all exported symbols'
 	@echo  '  headerdep       - Detect inclusion cycles in headers'
 	@echo  '  coccicheck      - Check with Coccinelle'
 	@echo  '  clang-analyzer  - Check with clang static analyzer'
@@ -2033,7 +2032,7 @@ endif
 # Scripts to check various things for consistency
 # ---------------------------------------------------------------------------
 
-PHONY += includecheck versioncheck coccicheck export_report
+PHONY += includecheck versioncheck coccicheck
 
 includecheck:
 	find $(srctree)/* $(RCS_FIND_IGNORE) \
@@ -2048,9 +2047,6 @@ versioncheck:
 coccicheck:
 	$(Q)$(BASH) $(srctree)/scripts/$@
 
-export_report:
-	$(PERL) $(srctree)/scripts/export_report.pl
-
 PHONY += checkstack kernelrelease kernelversion image_name
 
 # UML needs a little special treatment here.  It wants to use the host
diff --git a/scripts/export_report.pl b/scripts/export_report.pl
deleted file mode 100755
index feb3d5542a62d90b7af4f041d98a3c4b5ac386c0..0000000000000000000000000000000000000000
--- a/scripts/export_report.pl
+++ /dev/null
@@ -1,186 +0,0 @@
-#!/usr/bin/env perl
-# SPDX-License-Identifier: GPL-2.0-only
-#
-# (C) Copyright IBM Corporation 2006.
-#	Author : Ram Pai (linuxram@us.ibm.com)
-#
-# Usage: export_report.pl -k Module.symvers [-o report_file ] -f *.mod.c
-#
-
-use warnings;
-use Getopt::Std;
-use strict;
-
-sub numerically {
-	my $no1 = (split /\s+/, $a)[1];
-	my $no2 = (split /\s+/, $b)[1];
-	return $no1 <=> $no2;
-}
-
-sub alphabetically {
-	my ($module1, $value1) = @{$a};
-	my ($module2, $value2) = @{$b};
-	return $value1 <=> $value2 || $module2 cmp $module1;
-}
-
-sub print_depends_on {
-	my ($href) = @_;
-	print "\n";
-	for my $mod (sort keys %$href) {
-		my $list = $href->{$mod};
-		print "\t$mod:\n";
-		foreach my $sym (sort numerically @{$list}) {
-			my ($symbol, $no) = split /\s+/, $sym;
-			printf("\t\t%-25s\n", $symbol);
-		}
-		print "\n";
-	}
-	print "\n";
-	print "~"x80 , "\n";
-}
-
-sub usage {
-        print "Usage: @_ -h -k Module.symvers  [ -o outputfile ] \n",
-	      "\t-f: treat all the non-option argument as .mod.c files. ",
-	      "Recommend using this as the last option\n",
-	      "\t-h: print detailed help\n",
-	      "\t-k: the path to Module.symvers file. By default uses ",
-	      "the file from the current directory\n",
-	      "\t-o outputfile: output the report to outputfile\n";
-	exit 0;
-}
-
-sub collectcfiles {
-    my @file;
-    open my $fh, '< modules.order' or die "cannot open modules.order: $!\n";
-    while (<$fh>) {
-	s/\.ko$/.mod.c/;
-	push (@file, $_)
-    }
-    close($fh);
-    chomp @file;
-    return @file;
-}
-
-my (%SYMBOL, %MODULE, %opt, @allcfiles);
-
-if (not getopts('hk:o:f',\%opt) or defined $opt{'h'}) {
-        usage($0);
-}
-
-if (defined $opt{'f'}) {
-	@allcfiles = @ARGV;
-} else {
-	@allcfiles = collectcfiles();
-}
-
-if (not defined $opt{'k'}) {
-	$opt{'k'} = "Module.symvers";
-}
-
-open (my $module_symvers, '<', $opt{'k'})
-    or die "Sorry, cannot open $opt{'k'}: $!\n";
-
-if (defined $opt{'o'}) {
-    open (my $out, '>', $opt{'o'})
-	or die "Sorry, cannot open $opt{'o'} $!\n";
-
-    select $out;
-}
-
-#
-# collect all the symbols and their attributes from the
-# Module.symvers file
-#
-while ( <$module_symvers> ) {
-	chomp;
-	my (undef, $symbol, $module, $gpl, $namespace) = split('\t');
-	$SYMBOL { $symbol } =  [ $module , "0" , $symbol, $gpl];
-}
-close($module_symvers);
-
-#
-# collect the usage count of each symbol.
-#
-my $modversion_warnings = 0;
-
-foreach my $thismod (@allcfiles) {
-	my $module;
-
-	unless (open ($module, '<', $thismod)) {
-		warn "Sorry, cannot open $thismod: $!\n";
-		next;
-	}
-
-	my $state=0;
-	while ( <$module> ) {
-		chomp;
-		if ($state == 0) {
-			$state = 1 if ($_ =~ /static const struct modversion_info/);
-			next;
-		}
-		if ($state == 1) {
-			$state = 2 if ($_ =~ /__attribute__\(\(section\("__versions"\)\)\)/);
-			next;
-		}
-		if ($state == 2) {
-			if ( $_ !~ /0x[0-9a-f]+,/ ) {
-				next;
-			}
-			my $sym = (split /([,"])/,)[4];
-			my ($module, $value, $symbol, $gpl) = @{$SYMBOL{$sym}};
-			$SYMBOL{ $sym } =  [ $module, $value+1, $symbol, $gpl];
-			push(@{$MODULE{$thismod}} , $sym);
-		}
-	}
-	if ($state != 2) {
-		warn "WARNING:$thismod is not built with CONFIG_MODVERSIONS enabled\n";
-		$modversion_warnings++;
-	}
-	close($module);
-}
-
-print "\tThis file reports the exported symbols usage patterns by in-tree\n",
-	"\t\t\t\tmodules\n";
-printf("%s\n\n\n","x"x80);
-printf("\t\t\t\tINDEX\n\n\n");
-printf("SECTION 1: Usage counts of all exported symbols\n");
-printf("SECTION 2: List of modules and the exported symbols they use\n");
-printf("%s\n\n\n","x"x80);
-printf("SECTION 1:\tThe exported symbols and their usage count\n\n");
-printf("%-25s\t%-25s\t%-5s\t%-25s\n", "Symbol", "Module", "Usage count",
-	"export type");
-
-#
-# print the list of unused exported symbols
-#
-foreach my $list (sort alphabetically values(%SYMBOL)) {
-	my ($module, $value, $symbol, $gpl) = @{$list};
-	printf("%-25s\t%-25s\t%-10s\t", $symbol, $module, $value);
-	if (defined $gpl) {
-		printf("%-25s\n",$gpl);
-	} else {
-		printf("\n");
-	}
-}
-printf("%s\n\n\n","x"x80);
-
-printf("SECTION 2:\n\tThis section reports export-symbol-usage of in-kernel
-modules. Each module lists the modules, and the symbols from that module that
-it uses.  Each listed symbol reports the number of modules using it\n");
-
-print "\nNOTE: Got $modversion_warnings CONFIG_MODVERSIONS warnings\n\n"
-    if $modversion_warnings;
-
-print "~"x80 , "\n";
-for my $thismod (sort keys %MODULE) {
-	my $list = $MODULE{$thismod};
-	my %depends;
-	$thismod =~ s/\.mod\.c/.ko/;
-	print "\t\t\t$thismod\n";
-	foreach my $symbol (@{$list}) {
-		my ($module, $value, undef, $gpl) = @{$SYMBOL{$symbol}};
-		push (@{$depends{"$module"}}, "$symbol $value");
-	}
-	print_depends_on(\%depends);
-}

---
base-commit: 6fb2fa9805c501d9ade047fc511961f3273cdcb5
change-id: 20241029-remove-export-report-pl-7365c6ca3bee

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>


