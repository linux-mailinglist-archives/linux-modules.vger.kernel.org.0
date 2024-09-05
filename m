Return-Path: <linux-modules+bounces-1915-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4347B96E0FB
	for <lists+linux-modules@lfdr.de>; Thu,  5 Sep 2024 19:19:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF5661F21E6A
	for <lists+linux-modules@lfdr.de>; Thu,  5 Sep 2024 17:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC87D1A2643;
	Thu,  5 Sep 2024 17:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2AYdpwrn"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F151A01B7
	for <linux-modules@vger.kernel.org>; Thu,  5 Sep 2024 17:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725556791; cv=none; b=Aq6CMRpUEUhLJZP0Yli2c9KCrFa8i9Unt9gIdwuviKeuhqOuw9e/dC2dO0TYf02fp/lHImd6e51eFYennNq3VzQMzHzd0iwmg6ReJpbbXvPKYPvfNxHwEdX+HXWA0iPtcuniJ/oZXUbUtKmuBomZgUqwkaMGM6O7/C1U0vXpDjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725556791; c=relaxed/simple;
	bh=SOqrYYpujWF0rx1/RcFwVywMkWfqYauzZsed9RHcpQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZofHCuVaBvJG7CeiKSqNMMdP4TndctqtbGHLEp3nJcQR5lrpiaa33somSNkLf//NCrH8gQ9mz/xAFl/NjFv1celY02V127MATK9XO0aEIq/Sh6XQ2mMkKkujxLQX0EWv93Ttxlf0gyfZK1Mcw3+W2Eh0dtv38tPeUmnQ/kDPZRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2AYdpwrn; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4567fe32141so17811cf.0
        for <linux-modules@vger.kernel.org>; Thu, 05 Sep 2024 10:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725556789; x=1726161589; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8TUkMt4fFXBEZL3VlaXrE+AmUqotHsPhCt7Jc7mmqM=;
        b=2AYdpwrnQavYxkexatYSxZavlV4OQ747+SlNm+hyM8ovoiZ/1Wsl58tdoT/kfABcRF
         Dna90UWPVISGlDGmF4q65DnHNzulg+CvIsDWiKTlVyL/yrkvlEE3VgeKxa36f1Svxje9
         UJBHdlERGbTgEBlpVOKxfOlkhZtqbP4QwgaE5BCt4If0m/lahXUfEp+yZynXBio0U+Eh
         kFRdGXtzV6W56r95sFayFQFGkOPMfoG6DtAbVmdgi9CyXP2aTOFZGnZvNxmhRNEw8eqr
         sdSzTRfTJJPZasgiNkiGVtfPBRVG25N8dCVng6dxwQtS3NVaWy+tTZa8Y4WP+fbgo0mA
         on4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725556789; x=1726161589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s8TUkMt4fFXBEZL3VlaXrE+AmUqotHsPhCt7Jc7mmqM=;
        b=g8Co8N4IqrK034/D1s3OlEzGkjW85dBElG4KLwX4d0K30M7teEeYCu/MhKk/xyKr5r
         KLK4FfRHrUPedopYQJ66WHO6PP9MnKdLhVR9lqE9rocjHm1s/I6KHmIo4oz2LwPRfMbX
         2ZbjuWSLxRVAqDkEJ0Qjya9p5PUEEmGNecSwF8Tp2Lq27i3fiBMUtKYY/ZTpwSIVDXfG
         oUuWfDEcPz6Jksb15z7Eedkt0HXVbWID7OVNrywIWL94ovJfCxAezEby+PKAeJUp75QF
         VbvwKRVnbMmed0J0YoY9pIU10wgK+MxGCwdAgJCVCWi517ojv+r6TwHQUdrIf7Be3IxL
         Y0zw==
X-Forwarded-Encrypted: i=1; AJvYcCVdL4aya2SGard3EEMsaUtO96GkBDjBVFMN/z/BU9FQAwqBVDTD3tU5fQ0N1znoU9/ndCqtqIUCJOiM4Mqs@vger.kernel.org
X-Gm-Message-State: AOJu0YwjPqfQra5QAH1Q1EokRF8aR3wAP1owOrNvm+6AvAyvqVXewZZJ
	cRz2j8UWYUkuwVr9ksA1YuKcS9E1riwxdMgIkf4mwdYYt6LikmP9Syfclai0pknwVwnDPz97TJV
	bKOH4XLaplOtd98fcPqD6HggcP12kn00IHSeW
X-Google-Smtp-Source: AGHT+IETIgxd5HzjpKOCX0pYc+T39/K61/DMXW8lisgIOK3FIf/vt5BqtGRErHYZut1e/sGdlaZFVuc/zR1ufHF/hsY=
X-Received: by 2002:a05:622a:44d:b0:447:dd54:2cd4 with SMTP id
 d75a77b69052e-45801f211acmr4795831cf.22.1725556788641; Thu, 05 Sep 2024
 10:19:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-27-samitolvanen@google.com> <1e6cd0ad-48bb-4dd7-8cd7-4e94d0cd7cf5@suse.com>
In-Reply-To: <1e6cd0ad-48bb-4dd7-8cd7-4e94d0cd7cf5@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 5 Sep 2024 10:19:10 -0700
Message-ID: <CABCJKucgYt09P=cjD8J6Epi67XXvJ7hBdQksLBt9-UtFSu8Pug@mail.gmail.com>
Subject: Re: [PATCH v2 06/19] gendwarfksyms: Add a cache for processed DIEs
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

On Mon, Sep 2, 2024 at 3:05=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> wro=
te:
>
> On 8/15/24 19:39, Sami Tolvanen wrote:
> > +void die_map_free(void)
> > +{
> > +     struct hlist_node *tmp;
> > +     unsigned int stats[LAST + 1];
> > +     struct die *cd;
> > +     int i;
> > +
> > +     memset(stats, 0, sizeof(stats));
> > +
> > +     hash_for_each_safe(die_map, i, tmp, cd, hash) {
> > +             stats[cd->state]++;
> > +             reset_die(cd);
> > +             free(cd);
> > +     }
> > +     hash_init(die_map);
> > +
> > +     if ((map_hits + map_misses > 0))
>
> Nit: Extra parentheses can be dropped.

Oops, I'll fix that.

> > +             /*
> > +              * If any of the DIEs in the scope is missing a name, con=
sider
> > +              * the DIE to be unnamed.
> > +              */
> > +             list[count] =3D get_name(&scopes[i]);
> > +
> > +             if (!list[count]) {
> > +                     free(scopes);
> > +                     return 0;
> > +             }
>
> This slightly changes how scopes with no name are processed which is
> unrelated to the added caching. The previous logic used "<unnamed>" for
> individual unnamed scopes. The new code in such a case returns an empty
> FQN which is turned in process_fqn() into "<unnamed>".
>
> This is likely ok in practice for this particular tool. In general,
> I think "<unnamed>" should be returned when the initial DIE is missing
> a name and something like "<anonymous>::foo" when an outer scope has no
> name.

I did consider that, but didn't find instances of anonymous scopes in
the output, so I simplified this a bit. I'll dig around a bit more and
change this if I find a use case. Note that going through the scopes
is mostly just needed for Rust code.

> More importantly, using "<unnamed>" when a type has no name looks to me
> overly verbose, in particular, when it comes to the symtypes output. For
> instance, the current output for a 'const char *' parameter is:
> formal_parameter pointer_type <unnamed> { const_type <unnamed> { base_typ=
e char byte_size(1) encoding(8) } } byte_size(8)
>
> .. while the following should be sufficient and easier to grasp:
> formal_parameter pointer_type { const_type { base_type char byte_size(1) =
encoding(8) } } byte_size(8)

Agreed, that's way more readable. I'll drop the "<unnamed>" from the output=
.

> > +     for (i =3D 0; i < count; i++)
> > +             strcat(*fqn, list[i]);
>
> Small optimization: This loop could be written as follows to avoid
> repeatedly searching the end of fqn:
>
> char *p =3D *fqn;
> for (i =3D 0; i < count; i++)
>         p =3D stpcpy(p, list[i]);

True, I'll change this. Thanks!

> > +static int process_fqn(struct state *state, struct die *cache, Dwarf_D=
ie *die)
> > +{
> > +     const char *fqn;
> > +
> > +     if (!cache->fqn)
> > +             check(get_fqn(state, die, &cache->fqn));
> > +
> > +     fqn =3D cache->fqn;
> > +     fqn =3D fqn ?: "<unnamed>";
>
> As a small optimization and for consistency, I would recommended to also
> cache the "<unnamed>" name to avoid repeatedly calling get_fqn() for
> such DIEs.

Ack.

> > +enum die_state { INCOMPLETE, COMPLETE, LAST =3D COMPLETE };
> > +enum die_fragment_type { EMPTY, STRING, DIE };
>
> Nit: I would suggest to prefix the enum values, for example,
> STATE_INCOMPLETE, ... and FRAGMENT_EMPTY, ...

Sure, I'll add prefixes.

Sami

