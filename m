Return-Path: <linux-modules+bounces-1829-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD6F95F867
	for <lists+linux-modules@lfdr.de>; Mon, 26 Aug 2024 19:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13FDF282D22
	for <lists+linux-modules@lfdr.de>; Mon, 26 Aug 2024 17:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 087391991A5;
	Mon, 26 Aug 2024 17:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OUmwdnOp"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7481990CD
	for <linux-modules@vger.kernel.org>; Mon, 26 Aug 2024 17:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724694124; cv=none; b=ks9xW7D7ZLF26SSH5UI3cuc6Nz3dC4hAK55z+RZedlY1V7gfqa8HXr2b2lj0PmpfJCX523Kp36PXhAvghfwQ6O3pfLo0lcdto6T8u+m+HnPmzvKghSLmTHDH+kZx37+iQmzsldHdqhQXxh+TWkjviKm7U8QZgV/C/KVqeI6RLtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724694124; c=relaxed/simple;
	bh=QuSLEspvauRYDRZz063fX415QSr6sTsEnReWnJYDXVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JeorQ01nBcDU2PakedCBh9UWc/0UbTwaksRDDBwqkG8t4JS0IgymBLkBmMMM46ulXl02gQ7jrRgLbA0Rq5DKZ723AX4K7PH3TmCgwmmF0XgxiCi4Bx2Rxz+MqK2+NabcZYVcdmbSCfZH1mr0d4dWlBP/XOLKBaPvokYIJPh+b0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OUmwdnOp; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5bec4e00978so4365866a12.0
        for <linux-modules@vger.kernel.org>; Mon, 26 Aug 2024 10:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724694121; x=1725298921; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JiCSnJD3HP198YRuwR9nlOg90E6QQ9s3+l37OIn7TdU=;
        b=OUmwdnOpvRIWhkEmEAVhae0ZqGSgwqeyx6i6qmgV7GHgS1xbADzTRVPvgceJApGf3x
         zV6VD24l4MMAP9Bt2MOlgWr+Qj12uc5qs6ntTy/X2ASnAKtL/Cym4LNw3U50VmTQeO/i
         juLndVSyNOR5ONMpHc96US7Sw/pG260fBK0mkLsbdKiIvpc4rNN2hgwPEbzw/RqoJPGp
         K2pIRs0LjRIvcqg5hioX3Ad20YVVGMR3HJNaiUDk4e7+wso2WsNRuuRzIB4X4ikE+or+
         brky1YIWkYi/sMSX8D4bMwUiuq4/zWIfLJnI59tEaHzXBwzTZs0wuaV197pyP2SmWabv
         8e8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724694121; x=1725298921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JiCSnJD3HP198YRuwR9nlOg90E6QQ9s3+l37OIn7TdU=;
        b=PWUFZJ3Z0H30lEIZfPjwb0wzo36iARTHViWJANbPDjQl0GBEjymNdHwzow0Ut9d/za
         3TUa+/P2Qef52GbzLZ+/Q1sg4doP7YJlM0qqOGJHUvpGa5he0okn7eNOasF7xqTgcZIw
         03bVB0thYFfiAczgLWeuqpMW/RjJH0k/WKHO2F1SRbT02eKj4r4cL49THDJA4RFt1BfF
         qKc9mVDhS+U/A7pPRr8s+ImX9e0SjtQLqYkjXqrUaZHi4vc3CeY1GEEtk+phc+q/zv9a
         lZBFfkXdFMLn0QpYj4wRopTcTkVCrob8etmA1/vTOjJBx5Dome+3ssq1ATxoarorRwbi
         lfFA==
X-Forwarded-Encrypted: i=1; AJvYcCXdeLcDqX9WvglqNjK0K5WhOfoNFXlg4PpG6U0jZG76EdUqOp46GCBUZOA1YNUL+omMrbwMpRApsr5i60hf@vger.kernel.org
X-Gm-Message-State: AOJu0YxC5RonMZrG9uR6Esc7GrZg4w4cW53pP244LY2NedLVVorAjct6
	0o9S7JUyHVW6ZPwlL7TCTxC7yX5A+uZAOzX4+fCZ7OftpYThl/iTvuDr7Yy8HDA=
X-Google-Smtp-Source: AGHT+IFr4go4JINnJLtcWs0BB1xC/SXPqe+y4XSFmlELq1W0LCxG/Dp4ZIa768YslVaqXV+TjwDVpA==
X-Received: by 2002:a05:6402:34c7:b0:5c0:ba90:6a9e with SMTP id 4fb4d7f45d1cf-5c0ba906ba4mr80529a12.38.1724694120916;
        Mon, 26 Aug 2024 10:42:00 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c0bb213739sm9690a12.54.2024.08.26.10.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 10:42:00 -0700 (PDT)
Message-ID: <71505c05-b651-4740-b14a-a53084a16a61@suse.com>
Date: Mon, 26 Aug 2024 19:41:59 +0200
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/19] tools: Add gendwarfksyms
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>,
 Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>,
 Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
 Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-22-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20240815173903.4172139-22-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/15/24 19:39, Sami Tolvanen wrote:
> Add a basic DWARF parser, which uses libdw to traverse the debugging
> information in an object file and looks for functions and variables.
> In follow-up patches, this will be expanded to produce symbol versions
> for CONFIG_MODVERSIONS from DWARF.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  kernel/module/Kconfig                 |   8 ++
>  scripts/Makefile                      |   1 +
>  scripts/gendwarfksyms/.gitignore      |   2 +
>  scripts/gendwarfksyms/Makefile        |   7 ++
>  scripts/gendwarfksyms/dwarf.c         |  87 +++++++++++++++
>  scripts/gendwarfksyms/gendwarfksyms.c | 146 ++++++++++++++++++++++++++
>  scripts/gendwarfksyms/gendwarfksyms.h |  78 ++++++++++++++
>  7 files changed, 329 insertions(+)
>  create mode 100644 scripts/gendwarfksyms/.gitignore
>  create mode 100644 scripts/gendwarfksyms/Makefile
>  create mode 100644 scripts/gendwarfksyms/dwarf.c
>  create mode 100644 scripts/gendwarfksyms/gendwarfksyms.c
>  create mode 100644 scripts/gendwarfksyms/gendwarfksyms.h
> 
> [...]
> +static int parse_options(int argc, const char **argv)
> +{
> +	for (int i = 1; i < argc; i++) {
> +		bool flag = false;
> +
> +		for (int j = 0; j < ARRAY_SIZE(options); j++) {
> +			if (strcmp(argv[i], options[j].arg))
> +				continue;
> +
> +			*options[j].flag = true;
> +
> +			if (options[j].param) {
> +				if (++i >= argc) {
> +					error("%s needs an argument",
> +					      options[j].arg);
> +					return -1;
> +				}
> +
> +				*options[j].param = argv[i];
> +			}
> +
> +			flag = true;
> +			break;
> +		}
> +
> +		if (!flag)
> +			object_files[object_count++] = argv[i];

I would rather add a check that this doesn't produce an out-of-bounds
access.

> [...]
> +int main(int argc, const char **argv)
> +{
> +	unsigned int n;
> +
> +	if (parse_options(argc, argv) < 0)
> +		return usage();
> +
> +	for (n = 0; n < object_count; n++) {
> +		Dwfl *dwfl;
> +		int fd;
> +
> +		fd = open(object_files[n], O_RDONLY);
> +		if (fd == -1) {
> +			error("open failed for '%s': %s", object_files[n],
> +			      strerror(errno));
> +			return -1;
> +		}
> +
> +		dwfl = dwfl_begin(&callbacks);
> +		if (!dwfl) {
> +			error("dwfl_begin failed for '%s': %s", object_files[n],
> +			      dwarf_errmsg(-1));
> +			return -1;
> +		}
> +
> +		if (!dwfl_report_offline(dwfl, object_files[n], object_files[n],
> +					 fd)) {
> +			error("dwfl_report_offline failed for '%s': %s",
> +			      object_files[n], dwarf_errmsg(-1));
> +			return -1;
> +		}
> +
> +		dwfl_report_end(dwfl, NULL, NULL);
> +
> +		if (dwfl_getmodules(dwfl, &process_modules, NULL, 0)) {
> +			error("dwfl_getmodules failed for '%s'",
> +			      object_files[n]);
> +			return -1;
> +		}

I see that libdwfl has also directly function dwfl_nextcu(). Would it
make sense to use it to simplify the code?

> +
> +		dwfl_end(dwfl);
> +		close(fd);

Isn't fd consumed by dwfl_report_offline() on success? I'm seeing EBADF
from this close() call.

> +	}
> +
> +	return 0;
> +}

-- 
Thanks,
Petr

