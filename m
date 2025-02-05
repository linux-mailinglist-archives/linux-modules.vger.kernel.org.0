Return-Path: <linux-modules+bounces-3171-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ADAA292A4
	for <lists+linux-modules@lfdr.de>; Wed,  5 Feb 2025 16:04:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0D29188EBAB
	for <lists+linux-modules@lfdr.de>; Wed,  5 Feb 2025 14:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D9C1DC19D;
	Wed,  5 Feb 2025 14:52:45 +0000 (UTC)
X-Original-To: linux-modules@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29B81DBB03;
	Wed,  5 Feb 2025 14:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738767165; cv=none; b=ijpQJJCcdw09+dxRJh9C03DYWc4Uu3LM4YwGiIBL79uVGH+Ky6IbF7eA/wAgCW5Ex9DxIiZqQAyAHXxt/AJ3r1sCgP9TSpVySBWSwoFSJQ8WbgHyk2AKR2KI36dMC+pllWQck1C5F9hoa54n3iG+cuUk3835hWfamxKhwIps56E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738767165; c=relaxed/simple;
	bh=2XH08+q6YyU3mNnw9Mx7i058IUy6BkrPOhnkR8Uk0ac=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ailWwJ+BSzb1z2dla9YCGkoDjOrGYUPcxnMjqRwrfqzMn3xQzl3szoXPdKerLK5tNc5h9nX0yewYHaRs3Pu2Akvey45DfFeekjYCVaHUX2Oaw79k8yPXOPa1s1Av2lGRCNBzFGVg4XB+u5XUydD+0s0ukJOce4E2I+q8KxS0GYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADD11C4CED1;
	Wed,  5 Feb 2025 14:52:43 +0000 (UTC)
Date: Wed, 5 Feb 2025 09:53:22 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Luis Chamberlain
 <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen
 <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org
Subject: Re: [PATCH v2 0/2] tracing: Introduce relative stacktrace
Message-ID: <20250205095322.308234eb@gandalf.local.home>
In-Reply-To: <20250205212543.42bd11a8093a074e9df27670@kernel.org>
References: <173839458022.2009498.14495253908367838065.stgit@devnote2>
	<20250203103234.79c4a388@gandalf.local.home>
	<20250205212543.42bd11a8093a074e9df27670@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 5 Feb 2025 21:25:43 +0900
Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:

> Anyway, let me try storing the module table.

I have the module table code almost done. At least the recording of the
modules into persistent memory. Exposing and using it is not started yet. I
can send what I have and you can take it over if you want.

-- Steve

