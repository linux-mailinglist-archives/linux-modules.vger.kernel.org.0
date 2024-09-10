Return-Path: <linux-modules+bounces-1958-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AE99744A7
	for <lists+linux-modules@lfdr.de>; Tue, 10 Sep 2024 23:16:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F22A288C47
	for <lists+linux-modules@lfdr.de>; Tue, 10 Sep 2024 21:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2309A1A7AE3;
	Tue, 10 Sep 2024 21:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GVRNqdtJ"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B2217BB3D
	for <linux-modules@vger.kernel.org>; Tue, 10 Sep 2024 21:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726002992; cv=none; b=Ry04Bt69gm3aecAqfPrSrSkGcKQLp7en3/XsKXumUj2IIiqfPSO8hpJIM2Y0/+fJXDe/IE7ZjCVZUn/vYnrVd5g+0sA4DR1SPHEmeNcIyj+EiHzVuHAyocv0Lu9x6MX46Tj23GISHDJdbehtjXnvwnEgn+b9Mq5ISxAaS2SCkOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726002992; c=relaxed/simple;
	bh=wFJuViaiJdOUX1o0VuO7DPs78bj+nqTGTP1Bs491x5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iAdGfpthMGWLrjglWOm2Jqf9avOmCsX1jfuDrpRRrBxpMrFxnbqENnn/+zu6YIVAL3pFU3yNgtUcworVj+EGui1icus+jzW5yhF4HNEjI0T6hfxX86wZEbZkt1chJvyLz5JWu6eAsmd1YCs8Yi1MJcS+wXSxGS5wA/oYBD/xWn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GVRNqdtJ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-206fee0a3d7so286225ad.0
        for <linux-modules@vger.kernel.org>; Tue, 10 Sep 2024 14:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726002990; x=1726607790; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQ+GpSXTU6srlPmzzRuOFiYRCInXkHTjNZjLXMTW+8A=;
        b=GVRNqdtJYK3IhmhglThzmKAdHMxmU+4YbhLEwBKi7X1WLwMRcXOHXU372nGUayqH30
         VbBZ7rmnlwcaRNhcTHZeoCpSN67Pc6zNIkH2oARK2HwgIlJo641HJZjv4cw2F8CmLgkA
         nS5Ly9fmlfBKwuzmXuQWLnrGAJE7TlJRowHGcGfgxIFBr5juBtPUWyfoG9toYOoYvc8c
         +8rgqrBrQE+yIOWJSgwePRO/DbHB1//efnQPOcnHoTFy7hcNtIb4R8YHLvfXbnhdSX9e
         CUCYwHVyAODTcK/PUK65N76EUfMvHXEgVG8yNadTaJNi3fClsSxJ3o4mVhblT0DbOgSO
         M3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726002990; x=1726607790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQ+GpSXTU6srlPmzzRuOFiYRCInXkHTjNZjLXMTW+8A=;
        b=bjFY7M7vvCuTi0Rtd6tMf0yerffAy/Emn8cmwzQc+kfQK2LCKuJvA8rZaxjKMIXZTJ
         dXJOZnFK7fvTcYoPnVla2fRtEBnluHOFtTeRLiQULEiWLZeuD3RuTS9xEz8fUHc4mSXk
         Jny1bgaBE/8QJWdoNduTPF5R9vxR/bi2aFCQhrTvCpKNJ2qhJJaC6OTHvQBafymRqr5+
         hKbDqt7crHpTw39LsUGpgNlatwG3HFEmAfn3kaLtjDcrGPlcvyxGgkuQDd1tuviRL5mj
         rFRYRIz1GAVxMQH0qxWB4XKLzFLOthEzMz0wBoXVzSaEUqlPLvZbRnzFkhPLKoS48LHd
         HPCA==
X-Forwarded-Encrypted: i=1; AJvYcCVDsMu7Gair6YAn/pTOlIJ3HbjkAW76ACJqqWuc3RS4Uaz/Ffx7VMPZEvQYOmlLD8ucFbY+4hVA9LREtk0n@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2WKkYxqz0NIrvpwHNE3TEfgKOiRMcWHZ5oW5tRCynMaqbPtJS
	Ndu3RtNW5pvWzSxnC5Opn6s5ybMW276v6ScYJlJLb7vZCqThCyKOmaUKe3iQ8I+VrdkvHxxXKav
	QU8BbBlRyOpQcT1nxKGXGetQeGRys3k8d7Cwe
X-Google-Smtp-Source: AGHT+IEX/psll2dog+nO241fC0V6++ypLFoAuwx9543jGrSb2GAYEQZkZHBT20PjPwI2C62EMdksu+R58p4s5QutSWg=
X-Received: by 2002:a17:903:2444:b0:201:e2db:7be3 with SMTP id
 d9443c01a7336-207570ea766mr216155ad.21.1726002989611; Tue, 10 Sep 2024
 14:16:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-34-samitolvanen@google.com> <ac7f8644-453a-4156-b357-ba266a7a0ca6@suse.com>
In-Reply-To: <ac7f8644-453a-4156-b357-ba266a7a0ca6@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 10 Sep 2024 14:15:50 -0700
Message-ID: <CABCJKufmgJOouD3KytBf8dv5KnNensJvw_7gNP8hygn98GtWDA@mail.gmail.com>
Subject: Re: [PATCH v2 13/19] gendwarfksyms: Add symtypes output
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Tue, Sep 10, 2024 at 7:58=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> On 8/15/24 19:39, Sami Tolvanen wrote:
> > @@ -122,6 +135,16 @@ int main(int argc, const char **argv)
> >
> >       check(symbol_read_exports(stdin));
> >
> > +     if (symtypes_file) {
> > +             symfile =3D fopen(symtypes_file, "w+");
>
> The file is sufficient to open only for writing.

True, I'll drop the +.

> > +     if (symfile)
> > +             fclose(symfile);
> > +
> >       return 0;
> >  }
>
> The fclose() call should be wrapped in check() to catch a situation when
> flushing the stream potentially failed.

Ack.

> > +/* See dwarf.c:is_declaration */
> > +#define SYMBOL_DECLONLY_PREFIX "__gendwarfksyms_declonly_"
> > +#define SYMBOL_DECLONLY_PREFIX_LEN (sizeof(SYMBOL_DECLONLY_PREFIX) - 1=
)
>
> Nit: These defines should go into the patch 15/19 "gendwarfksyms: Add
> support for declaration-only data structures".

Yeah, I noticed these too. Will fix in the next version.

> > +struct type_expansion {
> > +     char *name;
> > +     struct type_list *expanded;
> > +     struct type_list *last;
> > +     size_t len;
> > +     struct hlist_node hash;
> > +};
>
> I found the manipulation of type_expansion.expanded and
> type_expansion.last somewhat strange.
>
> The list starts already with one element in type_expansion_init(). This
> is apparently to make the last pointer valid. This element is however
> empty and gets only assigned on the first call to type_list_append().
> Other elements are then added normally, always assigned.
>
> Perhaps consider using a regular list implementation, similarly to what
> was discussed under the patch 06/19 "gendwarfksyms: Add a cache for
> processed DIEs".

Agreed, I'll switch this to a regular list in v3.

> > +     /* Wrap names with spaces in single quotes */
> > +     if (strstr(cache->fqn, " ")) {
> > +             format =3D "%c#'%s'";
> > +             len +=3D 2;
> > +     } else {
> > +             format =3D "%c#%s";
> > +     }
> > +
> > +     name =3D malloc(len);
> > +     if (!name) {
> > +             error("malloc failed");
> > +             return NULL;
> > +     }
> > +
> > +     if (snprintf(name, len, format, prefix, cache->fqn) >=3D len) {
> > +             error("snprintf failed for '%s' (length %zu)", cache->fqn=
,
> > +                   len);
> > +             free(name);
> > +             return NULL;
> > +     }
>
> This could be quite simplified:
>
> const char *quote =3D strstr(cache->fqn, " ") !=3D NULL ? "'" : "";
> if (asprintf(&name, "%c#%s%s%s", prefix, quote, cache->fqn, quote) < 0)
>         [...]

Good point, I'll change this too. Thanks for taking a look!

Sami

