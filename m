Return-Path: <linux-modules+bounces-5819-lists+linux-modules=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-modules@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJDmJL6boWl8ugQAu9opvQ
	(envelope-from <linux-modules+bounces-5819-lists+linux-modules=lfdr.de@vger.kernel.org>)
	for <lists+linux-modules@lfdr.de>; Fri, 27 Feb 2026 14:27:26 +0100
X-Original-To: lists+linux-modules@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEBA1B7A33
	for <lists+linux-modules@lfdr.de>; Fri, 27 Feb 2026 14:27:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 52136302630C
	for <lists+linux-modules@lfdr.de>; Fri, 27 Feb 2026 13:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB7D8270EC3;
	Fri, 27 Feb 2026 13:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MNVfGrpL"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E89D259C9C
	for <linux-modules@vger.kernel.org>; Fri, 27 Feb 2026 13:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772198844; cv=pass; b=KoXxLNRP87nL6BwTmJE4QVPrv//wBWZal8gd11nZCZ1IOn9FJLWeZDG+/CZhg68zmm1WPcU2nif6MateKFk1mKWnVYTznZ7ufjsUtM4MB6dOMShot3CFZ24TcxnbQjA8yLi2QtwK5jh83wmKyBFYXwKZ1gmZ62JdBaCgE9uRHss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772198844; c=relaxed/simple;
	bh=pWjdq+lAYEe3vqxjUwBdSKqg8dA0GAM49F+0Wgf62DY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WZ2HTNJBaTf/lHzOEjs8b4U5uZC24ADghCYanw6LtfkjbOpKAee9lo/EwHgyk4iFDHDMLDZyzHvfbhFQrDOsl7Plrx+rT1bE2LZBi0dPrggcaAgVlITj5K03L9JoNC7SRuU315yA5Dbn5Of8rOjz6O3nayp+VurvZoJJrG5ftJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MNVfGrpL; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-506aa685d62so11887451cf.0
        for <linux-modules@vger.kernel.org>; Fri, 27 Feb 2026 05:27:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772198842; cv=none;
        d=google.com; s=arc-20240605;
        b=MdLV2NEt48XVUkvud89qbtd0zkbTvqTp5xySPcJIMPCxYwiQrG2AgZicoJf/TbrBig
         Hyai1Vacu04Da/qG+m/cV3TxTEOtUdmbYTbyuXWQtaWEgtpeEv+c/ENgFUZYDa06Av6j
         OBIV2qatFEU/f9DMlDiV5S2kMfB6twpq6PpLQ1hlhShgEWgGlOUKHFE4lT+7ieDH3DJ8
         dgO5880fqgauMBnp82fIieD3dM73cxDhs84m1SDo7oVXHyiW7Xzqz5wcczE3hsr+i4+I
         5WU1MraIYuPtN4jptbV3qOVRDBdJJcj5OCi5+OVbvZ1npqiNW2kqFkEs2HWoAgdDbWhj
         pMKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pWjdq+lAYEe3vqxjUwBdSKqg8dA0GAM49F+0Wgf62DY=;
        fh=fzpbjbPJZP4/CTjdrtkQuPFHD3f3qyBzMVn9MSl0Wg4=;
        b=aNFHfpR9S/X9JZHZq8lM0Aa73CWoQ058f1YRMEe1i+XV52ooKCHMl8sAnOXe/XqGq8
         hijPOtcwynWEz/czR6D1DMWtCh0bOHTuoKeN8QeVhHHeikWjnIRw8ZHohajuVoF78FO0
         m1qK5abaVeP3HfBeK0VbQD22Fv94FOWwWE0yJvEnA2xnZmS+eOH4rVw13QzE7bzYf7hi
         /Dz5nAozPl7mY6A92KYqC6kXIyM0qSfRiwd6iBtGHDJrmfYFe9H/JAQSIVC2SZayiVSA
         DqddQemxH3n5lC50YNN/GMt/XW+exs07rdlaN0X9eHSO7Q9Ph4M7oQDyGWRhtnDoKrDX
         IaYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772198842; x=1772803642; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pWjdq+lAYEe3vqxjUwBdSKqg8dA0GAM49F+0Wgf62DY=;
        b=MNVfGrpLIvovvpUPJaypTs5FvOC/XBaNEj27dORLfhAW8NEEy6C3+KHEkNdlUXAAF9
         FB/7EVDWtQKuDwRNnZafNIGwDnaLcKoG0e7FoUeJEtCYonZ7i3I7y6vCDkcZuw31VjMR
         cyoUYGGJJ1qOyFNOJoZr+bM/xLJBleh9H5iHjK0SOYbETQ8v3vWUm9EyQT/Y7j5cPHLU
         TzRRyah/dYoXxfzFNuLshmQNuUPGBg2N3yT51rvR6eF8quvKi+aNxCd4QU7NJofkc3ei
         IunnEpX+38XuN6Wwzb4n02LqIsGFXsxdPB018ctC/EdwU4VNk8qme4meGyUXlzsLiB+/
         WMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772198842; x=1772803642;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWjdq+lAYEe3vqxjUwBdSKqg8dA0GAM49F+0Wgf62DY=;
        b=j1F+b7bqyqiWCCcZS1v4nQzcF7aqADyaE28OEARy2qYI6l7J6QvqdX0mpdyjPCvbjm
         +NAAEbnSo/YEJAYPYsR47LpWEzZtCuE34YRTJlHX2RHvny4A+cJmFl64SkrFdjUTq4Ih
         4jsNvz1of2sZONpU6mnM0wUZoWLUe8n/mpf/BY/429/hEXPAhbvskGBgDCOSBW/IPlIj
         ryOL4hUBxANYo9AvYaWEB20djss+BYGqxmYfjwtNH7fi3CVKudb9r6BM2hAXyHyE5gy1
         iDMVrMQ/8QsfxWsD9OgjdQywUsxSNtSE6BZ4H5HH48JF5UMCFBCBZWKY5urRlscXFWFu
         uQmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvKC4/yQ679wh28kRLGnGkNA5M0CSterNXg1eib0+dboHMlCiVz4xQTuGbOVtiFOxMLLnHaVHImBkoKj2P@vger.kernel.org
X-Gm-Message-State: AOJu0YwI8QVVZF4skeviQrqRKjbc3mGDVOHDKEk+xjyX4VHKibUmpVxV
	qXtRHgLeVB21gVuDeMK6vL7DWSfrdwDmP+KqfQXSSOcQa+CBTOKIopi9EyNqmeY6ddkJqPS89Mx
	WbmEiLtVPPD9+B5HEbxQEN5w06ZTOKLE=
X-Gm-Gg: ATEYQzzoG85ufZCxgCQYYoDvHu1pXn5k4qSm+Q0BWb069yd1CX16nle6VlBzeyUQs0f
	Yw5heVeULxA67uSZhHRMwoNY4Zh/WPWstwDYkY0zhAx0pl8whr9jTuwdcBCEkYPit1t8ny2aKmW
	FvfF1ikIbDtudTE7T/IOc3sRST1sZUSPLWPohRPjc+oK+28uochdV6jWg+E9tPNhMaK+QM3m8uU
	PZcThXUPG5xUhxVsKmvpGxym7PHGjsIM5lSh1/aOL3s/gxShQzt4ECHKWJlqURpTc4ovud6CRyt
	tR7hGw==
X-Received: by 2002:ac8:7fc1:0:b0:506:a624:1939 with SMTP id
 d75a77b69052e-507529973d5mr32608111cf.51.1772198842194; Fri, 27 Feb 2026
 05:27:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226234736.428341-1-thepacketgeek@gmail.com>
In-Reply-To: <20260226234736.428341-1-thepacketgeek@gmail.com>
From: Matthew Wood <thepacketgeek@gmail.com>
Date: Fri, 27 Feb 2026 05:27:11 -0800
X-Gm-Features: AaiRm53B3VOimmyWUVWpQZLooju4LSLNXyFFMiVuZvlgdlqoHfpbBRKIZCUlq1c
Message-ID: <CADvopvYtN=WMj_2SKcQ5z5OedU-2wRf9+h8FPbrqamQSyNNKAA@mail.gmail.com>
Subject: Re: [PATCH 0/8] rust: module parameter extensions
To: Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>
Cc: Aaron Tomlin <atomlin@atomlin.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>, David Gow <davidgow@google.com>, 
	=?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Breno Leitao <leitao@debian.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5819-lists,linux-modules=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[atomlin.com,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,vger.kernel.org,debian.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thepacketgeek@gmail.com,linux-modules@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-modules];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2AEBA1B7A33
X-Rspamd-Action: no action

> This series extends the Rust module! macro with three capabilities that
> are available to C modules but currently missing from the Rust
> abstractions: string parameters, early boot command-line parameters, and
> configurable initcall levels.
>
> The existing Rust module parameter infrastructure supports integer types
> (i8..u64, isize, usize) but has no way to accept string values.
> Additionally, built-in Rust modules cannot register parameters for early
> boot command-line parsing (__setup / early_param), and all Rust modules
> are hard-coded to initcall level 6 (device_initcall) with no way to
> control initialization ordering.
>
I forgot to mention that these changes are a dependency for a
netconsole rust implementation
I'm working on and I need these three features to match the current behavior.

Regards,
Matthew

