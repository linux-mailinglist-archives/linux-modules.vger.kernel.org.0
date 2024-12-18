Return-Path: <linux-modules+bounces-2769-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD289F64E1
	for <lists+linux-modules@lfdr.de>; Wed, 18 Dec 2024 12:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FC70162DF9
	for <lists+linux-modules@lfdr.de>; Wed, 18 Dec 2024 11:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1185A1A00EC;
	Wed, 18 Dec 2024 11:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZBm0I16h"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2BD1A2381
	for <linux-modules@vger.kernel.org>; Wed, 18 Dec 2024 11:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734521333; cv=none; b=Fgk3wyOjsBGpsrR70nl7e635tTVIv3D7QXSZ7gxIsyqsQnC7AgMgIRILnD44+Pqz67Y9ZoxD4Ax31yZBuVyEbpWP+yRkjydePGkezC+AkV/gKXc0HiVVpCd08GflHEmJqA7y4dNqSoZyxFo+KD8SJX+cJBG/EXO5UoOle3x8La8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734521333; c=relaxed/simple;
	bh=8clAsl6khtw3GTc+k7TeLGPNEFXFCjEj59lOBtdojyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gg3RY60pQp3l8dsEUgEV8LPdfMThA+Qv/+6ik18ouvOhfS7ZOLL8cJomXe0I2bkmHD97jBhlA+xb1zCm3N82GsbXqz8ts1/cXJXkgZcQZMfsxXEY7rImpGkWV4n/lj16lO5xZkF+cqY4ljTqB4c2NWs9ghPu7LXyjcdajZg3Wvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZBm0I16h; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385e2880606so5728072f8f.3
        for <linux-modules@vger.kernel.org>; Wed, 18 Dec 2024 03:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734521327; x=1735126127; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PAWO0jEXnQbC66bva5wtyjDuq9nuxZoa8WXH4cwGmh4=;
        b=ZBm0I16hiIYHxxWjclRasiu2LwqKfu4cS8OTu/eIZnvBVyDHzviPznRy3+FmcGFGRD
         oXefcO2VZwfwdrIC4h+/9SxExMEp7V1JZouwxwhKISQXhL2uWUoeTkWInepyOUCWH0uc
         0LK7u67RPqGU2l5vfMvBgPVzWksSzDp92Alxe8ZiPZYHj++zHz09ywXY5NzU+kmOUmwx
         A0F6J278QtTxs7F4wUVIdDryuzz5OlBqa9kOR9mGIXAyynj9BXjPs3cNucIc3ISiS2dR
         F6s32eo+OPO+7hBWjvB0Z7ga6xKN+brUOfOWtFBuJVMAL5eg6ZLKI+x5bTeDnNCcpVjw
         Q7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734521327; x=1735126127;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PAWO0jEXnQbC66bva5wtyjDuq9nuxZoa8WXH4cwGmh4=;
        b=UxA+IVdWWda4VyctSUVhDr2YjY56zWnVdtXlDbtZmSlPYOIkFaHFQzhiVEdE3/3wHC
         eQi6kLCfq666qZsHQ9pa7xKdEeP1eYFp8q6s6Au6GX9ZQ07ntZw9PjfwK85npxetlRZ4
         hKKj/LuQFI8aEPNurzTJ13ZVegB4tKuv5N01BLXXxhcDjnvb1wgt//+rweZKATxWlolx
         p3yn6+TG3PsVuQLPnvRLwJymV+6YeyKmXH27fVeCf37v2wTKHzoRMsbx8IffAmVUvZlt
         yf0lpoTT3oVg/nLRnXBo60UXgeJ5K23RwJQ5KOay5s6LGhF8OE8dw9BtEGlYNww9j2jF
         /hcA==
X-Forwarded-Encrypted: i=1; AJvYcCWD8rEGrANLqcpWeBvNQ4+O9Tc8PcFL96s1VzbfAB8tIiITpLHY0T1Ze65UuLvKnUfGeg4+eQgs1X2XmN+4@vger.kernel.org
X-Gm-Message-State: AOJu0YznWZjVIfWRQvMB2i60vFP9T4ovpUd/n32C+Pq/KlhwcXbMBc7D
	ZtOWehYY9+T9qOQeFzGIA71KRIkDjdYRVNVh+Vq97ftPj6N4ILjOWVVoC2D7oWQ=
X-Gm-Gg: ASbGnct5JAsTQKek+G35ZbUB9FPkqMK72EV3MchiiMXII1FR/duvaeYwTxHJhHKem32
	xlzW0O8V7jpA9/WWZ6F5fXuKKwQUmiYc8KXTRFu/qK7wPi5+LVj+LKi5OF8rVrVPU8wiHfnmKRI
	V+e3ysh3btE5Iq5srBeC/cYtb2w8pyHEMBHBzuHXx+VS4d4TYjrp3cQyGycsJjlSLIOe0G8saNr
	8+NlFTt8VcrAqy0ihP/1oqgaD0JsfGxRxOelPQB2/wrVwkN9A8wojCxkuco
X-Google-Smtp-Source: AGHT+IGs3nYp3oWV/W/UMYVJHJJjkZgGRSQP885QP7DeYu6Pa/O2L4gsxVSi6YydWkDPRx8wenSUkg==
X-Received: by 2002:a05:6000:4a18:b0:385:f996:1b8e with SMTP id ffacd0b85a97d-388e4d83be4mr2314515f8f.16.1734521326899;
        Wed, 18 Dec 2024 03:28:46 -0800 (PST)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c806086dsm13686922f8f.91.2024.12.18.03.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 03:28:46 -0800 (PST)
Message-ID: <e65c9cc2-fbb5-464e-99bd-1c9f47ce0f2e@suse.com>
Date: Wed, 18 Dec 2024 12:28:45 +0100
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] module: sysfs: Simplify section attribute allocation
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20241216-sysfs-const-bin_attr-module-v1-0-f81e49e54ce4@weissschuh.net>
 <20241216-sysfs-const-bin_attr-module-v1-2-f81e49e54ce4@weissschuh.net>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20241216-sysfs-const-bin_attr-module-v1-2-f81e49e54ce4@weissschuh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/16/24 20:16, Thomas Weißschuh wrote:
> The existing allocation logic manually stuffs two allocations into one.
> This is hard to understand and of limited value, given that all the
> section names are allocated on their own anyways.
> Une one allocation per datastructure.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
>  kernel/module/sysfs.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/kernel/module/sysfs.c b/kernel/module/sysfs.c
> index b7841f76a933114e6dbd0fc2d32a60b66b7966b6..935629ac21fa16504ddb5f3762af5539572c3bf1 100644
> --- a/kernel/module/sysfs.c
> +++ b/kernel/module/sysfs.c
> @@ -65,34 +65,37 @@ static void free_sect_attrs(struct module_sect_attrs *sect_attrs)
>  
>  	for (bin_attr = sect_attrs->grp.bin_attrs; *bin_attr; bin_attr++)
>  		kfree((*bin_attr)->attr.name);
> +	kfree(sect_attrs->grp.bin_attrs);
>  	kfree(sect_attrs);
>  }
>  
>  static int add_sect_attrs(struct module *mod, const struct load_info *info)
>  {
> -	unsigned int nloaded = 0, i, size[2];
>  	struct module_sect_attrs *sect_attrs;
>  	struct module_sect_attr *sattr;
>  	struct bin_attribute **gattr;
> +	unsigned int nloaded = 0, i;
>  	int ret;
>  
>  	/* Count loaded sections and allocate structures */
>  	for (i = 0; i < info->hdr->e_shnum; i++)
>  		if (!sect_empty(&info->sechdrs[i]))
>  			nloaded++;
> -	size[0] = ALIGN(struct_size(sect_attrs, attrs, nloaded),
> -			sizeof(sect_attrs->grp.bin_attrs[0]));
> -	size[1] = (nloaded + 1) * sizeof(sect_attrs->grp.bin_attrs[0]);
> -	sect_attrs = kzalloc(size[0] + size[1], GFP_KERNEL);
> +	sect_attrs = kzalloc(struct_size(sect_attrs, attrs, nloaded), GFP_KERNEL);
>  	if (!sect_attrs)
>  		return -ENOMEM;
>  
> +	gattr = kcalloc(nloaded + 1, sizeof(*gattr), GFP_KERNEL);
> +	if (!gattr) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +

Member sect_attrs->grp.bin_attrs is NULL at this point. If the above
kcalloc() call fails, the control goes to the out label which invokes
free_sect_attrs() and its code
"for (bin_attr = sect_attrs->grp.bin_attrs; *bin_attr; ..."
results in a NULL dereference.

>  	/* Setup section attributes. */
>  	sect_attrs->grp.name = "sections";
> -	sect_attrs->grp.bin_attrs = (void *)sect_attrs + size[0];
> +	sect_attrs->grp.bin_attrs = gattr;
>  
>  	sattr = &sect_attrs->attrs[0];
> -	gattr = &sect_attrs->grp.bin_attrs[0];
>  	for (i = 0; i < info->hdr->e_shnum; i++) {
>  		Elf_Shdr *sec = &info->sechdrs[i];
>  
> @@ -111,7 +114,6 @@ static int add_sect_attrs(struct module *mod, const struct load_info *info)
>  		sattr->battr.attr.mode = 0400;
>  		*(gattr++) = &(sattr++)->battr;
>  	}
> -	*gattr = NULL;
>  
>  	ret = sysfs_create_group(&mod->mkobj.kobj, &sect_attrs->grp);
>  	if (ret)
> 

-- 
Thanks,
Petr

