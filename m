Return-Path: <linux-modules+bounces-1636-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBC393D7E5
	for <lists+linux-modules@lfdr.de>; Fri, 26 Jul 2024 19:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE1641C231A5
	for <lists+linux-modules@lfdr.de>; Fri, 26 Jul 2024 17:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1FFD17CA06;
	Fri, 26 Jul 2024 17:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="Q70gHPYB"
X-Original-To: linux-modules@vger.kernel.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEE917C7DF
	for <linux-modules@vger.kernel.org>; Fri, 26 Jul 2024 17:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722016759; cv=none; b=fKie5SGddFQNZy4Y+Dpv1vY3qpR7++jqo0m3SE8HEkz8NW+5lL0BaJBtF0r8BkQNQhDLtpTW2RtB9lqnzKQ9Eal1oaZtgKrzC6pvmVhd1BXvT8R4eWJtRdl3UrqAxrmFaZfW11wxMsqoSO2PpO6WXPoxWce86kxuUnRzFODRsXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722016759; c=relaxed/simple;
	bh=Tf4qjK2ZUpS42a7Sr9ov3S176ZQPCL9B9Y0JjLhQkoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MBlrQo5TTyBjxZ7gOQ/zmGWyq8qNS9hT19ny0Ja0o5xudLG/001hNtvqJ4LlvyG2pDABXcuqz3FYD5SDwI3Wyo/S0oLUGa0FcgnnlOoGvsZaqfP3yD9wGpgs8HfCBB4kqYDChsBXJHvhNdtn1gX9y4ldSkrcFUEUonzoPeGvvNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=Q70gHPYB; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from cwcc.thunk.org (pool-173-48-113-198.bstnma.fios.verizon.net [173.48.113.198])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 46QHw1LW007490
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 13:58:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1722016688; bh=6Fhxb1rvuFCxd4qmqtkOdrIw4+4M+R26H+9OpLL4wi4=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=Q70gHPYBpCfYxY5Qatx+1LA6hRcuUmkzc+QIW0riQPdRIugCZOzuxFMXy+ZtTn0cv
	 +LnXfjs4CB43/RFXfi6DPIGzZLfj67+qW7v+cMmwcfGWC0ExWgRnKm3rfO2k6/711I
	 PYVU6P56QKUdMG/Tmmlirjz9gB9C6m3US/l3FNbLLfLltgQsKGiE+y9gqXQv9tI4ux
	 XNT/JQL5eFxb21yXBpMIR9/+HRensgW+wD5pzO+fygl2JuKYDg3SKo35copm1CRtw0
	 xhjpMtQJS1XOl+IH+xg6xPJPjWQYPSft68O4xRNiQR9ZPvc7HID84liiTTrDD8UVAm
	 cHtvEViGLl/Kw==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 04CC115C0251; Fri, 26 Jul 2024 13:58:01 -0400 (EDT)
Date: Fri, 26 Jul 2024 13:58:00 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: David Sterba <dsterba@suse.cz>
Cc: Christoph Hellwig <hch@infradead.org>,
        Youling Tang <youling.tang@linux.dev>, kreijack@inwind.it,
        Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>,
        Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
        David Sterba <dsterba@suse.com>,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>, linux-kernel@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-btrfs@vger.kernel.org,
        linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
        Youling Tang <tangyouling@kylinos.cn>
Subject: Re: [PATCH 1/4] module: Add module_subinit{_noexit} and
 module_subeixt helper macros
Message-ID: <20240726175800.GC131596@mit.edu>
References: <ZqEhMCjdFwC3wF4u@infradead.org>
 <895360e3-97bb-4188-a91d-eaca3302bd43@linux.dev>
 <ZqJjsg3s7H5cTWlT@infradead.org>
 <61beb54b-399b-442d-bfdb-bad23cefa586@app.fastmail.com>
 <ZqJwa2-SsIf0aA_l@infradead.org>
 <68584887-3dec-4ce5-8892-86af50651c41@libero.it>
 <ZqKreStOD-eRkKZU@infradead.org>
 <91bfea9b-ad7e-4f35-a2c1-8cd41499b0c0@linux.dev>
 <ZqOs84hdYkSV_YWd@infradead.org>
 <20240726152237.GH17473@twin.jikos.cz>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726152237.GH17473@twin.jikos.cz>

On Fri, Jul 26, 2024 at 05:22:37PM +0200, David Sterba wrote:
> All of this sounds overengineered for something that is a simple array
> and two helpers. The code is not finalized so I'll wait for the next
> version but specific file order in makefile and linker tricks seems
> fragile and I'm not sure I want this for btrfs.

Yeah, that's my reaction as well.  This only saves 50 lines of code in
ext4, and that includes unrelated changes such as getting rid of "int
i" and putting the declaration into the for loop --- "for (int i =
...").  Sure, that saves two lines of code, but yay?

If the ordering how the functions gets called is based on the magic
ordering in the Makefile, I'm not sure this actually makes the code
clearer, more robust, and easier to maintain for the long term.

	      	      	  	    	     	 - Ted

