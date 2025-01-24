Return-Path: <linux-modules+bounces-3089-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C040FA1B6D9
	for <lists+linux-modules@lfdr.de>; Fri, 24 Jan 2025 14:35:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 204A0188C949
	for <lists+linux-modules@lfdr.de>; Fri, 24 Jan 2025 13:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A06C3596F;
	Fri, 24 Jan 2025 13:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NJcOOcc/"
X-Original-To: linux-modules@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BA84D8DA
	for <linux-modules@vger.kernel.org>; Fri, 24 Jan 2025 13:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737725703; cv=none; b=F5hRlSOXnMrn6DnF3you8TkUHUyELagh7Mnu9yWHlJLocOeNlBU4pWI/UZ3EXxtPWgIeOLJOMrw+MNRtLNwsO4NZ9/ajxTMmCICwEd3gpfbUjKbkFSro15cOUMArsNDzJiDgi/wqsGdCuougnJVNdJ1X4+x2Yb32egfiNAfz+D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737725703; c=relaxed/simple;
	bh=k5su0T4KRYPeGXuUJXlKRR83/GJcmT0NQhJbpLGS/aU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kjq+B5yO0Hikf2daG5MNuKyv0U/Fktccqvja69GizNHagqactxc8iUG9tktApUduGgFu6bgdBwr7JT0nB96doFqrfDWfxmx8+aS4k0OcLRAcEVajEuC0SakcyZg39AyL0ndXVQiDAMHs+SVsMw0DJOK9m0WyhRn2Tzcze84+qLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NJcOOcc/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4361f796586so22169385e9.3
        for <linux-modules@vger.kernel.org>; Fri, 24 Jan 2025 05:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737725698; x=1738330498; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UQWWJ4GUjFEA0dJ61qiJ0w7V+q7n1+jTTHCZ/wJ2aNI=;
        b=NJcOOcc/9jbhLdhWOeoL81tfP3dfHa/jubSxJ7OyQihrfZqEc0grgPEPBj/xNUIMyR
         RuBrma+FsOxydbZMlr0hC/kibiLVcyBXA+JcAKvdvVla9gT4KgUh2QOEjsJZV5W8Mlrm
         Lj+wLNJ9+mQbXBt9TSybVLGpLsKi/oTPL5oxkxoo2fDE0+oRK5i1u48s1t2j9QLJwAYQ
         B7sroVTsyhz4WXz7mLPKPWiDBBXlA197dnuJY3kf5iLndLy2C7fObxvJbTBPfxrP67sf
         8ZKLFwkCBCfBZwdNE9FFbiP06z5ANPjhmZWy3Ob2jdCTCqMQW8TfTdCIgGiv0NZ3sCg1
         akgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737725698; x=1738330498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQWWJ4GUjFEA0dJ61qiJ0w7V+q7n1+jTTHCZ/wJ2aNI=;
        b=sDvjSchayC9i66VG9B3XIj6Ea6E15LImczzbcJlW5n9GL1y1IBDShkjj/UvmsK40Iv
         xU5VqlmcvItW1KWdpxE1pQ49THJnmb2lQ1DMeV7ESt1J1ukCMZad93eTKQHE1BAlbzNC
         mM07uT1YRQNxvE3Ee0xfQ0qb8qsP+zhBofeXaXto/Xv7Kw1pjApkhHHzu/dGc/e9cdVr
         vhgpQBrisqiK11cDpZkGZnzUVDcyt/HA92/GnV93+dlSeE1zt7ZVRVZGAKc+Np9PUM3j
         WmRVn/z5wRepzCHz8ZTYEtoDF25f7RZJKBpEYrJhRCZDCM0eKMXHLJkLe15v7glDGa46
         BwoA==
X-Forwarded-Encrypted: i=1; AJvYcCVR553Yo7IsqTAmLuScXOhjTG/MalaE3KKYdmQI1buVu5b3NzlYmbOKoV+i8TvDWWE4Y6aZXtdmB2cxvTLG@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb0ht/J/wt/wooFHfPgWfcsYFOdhOtXKhN550fxOfYwhnC28hQ
	2AHcarxfn2Nb/OM4E312xrq0H7CcDB7yiQqbgou1AmVsBTGQWsE3DOSm1RK1TEU=
X-Gm-Gg: ASbGncv8r0JyPaiueqRyoFHUh97A1s7XPE95a0ds9OIrD1SFmf7wecHqlbGXE9GSLe9
	pcB+fesN2kMPiENyVNrG2j4K357ZutzdFtyoTHoSu2bdaQM6pNts9s4K9TY16279sC5U3wc281u
	XhWVxxAZQ9JqqFEjatWgZyAJHTvbEE30Zod7QxCn6l570+MemoTZ+24ypGSxzF3xjJYDQ3kEh5d
	EId68tQezPhl97M8BBBAOtGE2cTv2BWflQnamWSPQTbi18V0lGSoonDIl8q+qUolk6mHD8e0fOL
	IWWIGz4=
X-Google-Smtp-Source: AGHT+IF3s4fU5+t8/f+hOsEy5Nf5bcm49sgfqQgftaIHUM1gK9rPTY+VC8hE4cREhJOWCxCt9EWOug==
X-Received: by 2002:a5d:64a3:0:b0:385:f909:eb2c with SMTP id ffacd0b85a97d-38bf57a77a2mr37468273f8f.38.1737725698250;
        Fri, 24 Jan 2025 05:34:58 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1bb0besm2727227f8f.79.2025.01.24.05.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 05:34:57 -0800 (PST)
Date: Fri, 24 Jan 2025 14:34:55 +0100
From: Petr Mladek <pmladek@suse.com>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Mike Rapoport <rppt@kernel.org>, x86@kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Borislav Petkov <bp@alien8.de>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Daniel Gomez <da.gomez@samsung.com>,
	Daniel Thompson <danielt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Gow <davidgow@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jason Wessel <jason.wessel@windriver.com>,
	Jiri Kosina <jikos@kernel.org>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>, "H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>, Rae Moar <rmoar@google.com>,
	Richard Weinberger <richard@nod.at>,
	Sami Tolvanen <samitolvanen@google.com>,
	Shuah Khan <shuah@kernel.org>, Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	kgdb-bugreport@lists.sourceforge.net, kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org, linux-modules@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-um@lists.infradead.org,
	live-patching@vger.kernel.org
Subject: Re: [PATCH v2 06/10] module: introduce MODULE_STATE_GONE
Message-ID: <Z5OW_3dbdcZrNCgW@pathway.suse.cz>
References: <20250121095739.986006-1-rppt@kernel.org>
 <20250121095739.986006-7-rppt@kernel.org>
 <4a9ca024-fc25-4fe0-94d5-65899b2cec6b@suse.com>
 <Z5N0UVLTJrrK8evM@kernel.org>
 <8c6972c4-c1bb-402a-a72d-f92b87ee5a89@suse.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c6972c4-c1bb-402a-a72d-f92b87ee5a89@suse.com>

On Fri 2025-01-24 13:59:55, Petr Pavlu wrote:
> On 1/24/25 12:06, Mike Rapoport wrote:
> > On Thu, Jan 23, 2025 at 03:16:28PM +0100, Petr Pavlu wrote:
> >> On 1/21/25 10:57, Mike Rapoport wrote:
> >>> In order to use execmem's API for temporal remapping of the memory
> >>> allocated from ROX cache as writable, there is a need to distinguish
> >>> between the state when the module is being formed and the state when it is
> >>> deconstructed and freed so that when module_memory_free() is called from
> >>> error paths during module loading it could restore ROX mappings.
> >>>
> >>> Replace open coded checks for MODULE_STATE_UNFORMED with a helper
> >>> function module_is_formed() and add a new MODULE_STATE_GONE that will be
> >>> set when the module is deconstructed and freed.
> >>
> >> I don't fully follow why this case requires a new module state. My
> >> understanding it that the function load_module() has the necessary
> >> context that after calling layout_and_allocate(), the updated ROX
> >> mappings need to be restored. I would then expect the function to be
> >> appropriately able to unwind this operation in case of an error. It
> >> could be done by having a helper that walks the mappings and calls
> >> execmem_restore_rox(), or if you want to keep it in module_memory_free()
> >> as done in the patch #7 then a flag could be passed down to
> >> module_deallocate() -> free_mod_mem() -> module_memory_free()?
> > 
> > Initially I wanted to track ROX <-> RW transitions in struct module_memory
> > so that module_memory_free() could do the right thing depending on memory
> > state. But that meant either ugly games with const'ness in strict_rwx.c,
> > an additional helper or a new global module state. The latter seemed the
> > most elegant to me.
> > If a new global module state is really that intrusive, I can drop it in
> > favor a helper that will be called from error handling paths. E.g.
> > something like the patch below (on top of this series and with this patch
> > reverted)
> > 
> > diff --git a/kernel/module/main.c b/kernel/module/main.c
> > index 7164cd353a78..4a02503836d7 100644
> > --- a/kernel/module/main.c
> > +++ b/kernel/module/main.c
> > @@ -1268,13 +1268,20 @@ static int module_memory_alloc(struct module *mod, enum mod_mem_type type)
> >  	return 0;
> >  }
> >  
> > +static void module_memory_restore_rox(struct module *mod)
> > +{
> > +	for_class_mod_mem_type(type, text) {
> > +		struct module_memory *mem = &mod->mem[type];
> > +
> > +		if (mem->is_rox)
> > +			execmem_restore_rox(mem->base, mem->size);
> > +	}
> > +}
> > +
> >  static void module_memory_free(struct module *mod, enum mod_mem_type type)
> >  {
> >  	struct module_memory *mem = &mod->mem[type];
> >  
> > -	if (mod->state == MODULE_STATE_UNFORMED && mem->is_rox)
> > -		execmem_restore_rox(mem->base, mem->size);
> > -
> >  	execmem_free(mem->base);
> >  }
> >  
> > @@ -2617,6 +2624,7 @@ static int move_module(struct module *mod, struct load_info *info)
> >  
> >  	return 0;
> >  out_err:
> > +	module_memory_restore_rox(mod);
> >  	for (t--; t >= 0; t--)
> >  		module_memory_free(mod, t);
> >  	if (codetag_section_found)
> > @@ -3372,6 +3380,7 @@ static int load_module(struct load_info *info, const char __user *uargs,
> >  				       mod->mem[type].size);
> >  	}
> >  
> > +	module_memory_restore_rox(mod);
> >  	module_deallocate(mod, info);
> >   free_copy:
> >  	/*
> >  
> 
> This looks better to me.
> 
> My view is that the module_state tracks major stages of a module during
> its lifecycle. It provides information to the module loader itself,
> other subsystems that need to closely interact with modules, and to the
> userspace via the initstate sysfs attribute.
> 
> Adding a new state means potentially more complexity for all these
> parts. In this case, the state was needed because of a logic that is
> local only to the module loader, or even just to the function
> load_module(). I think it is better to avoid adding a new state only for
> that.

I fully agree here.

The added complexity is already visible in the original patch.
It updates about 15 locations where mod->state is checked.
Every location should be reviewed whether the change is correct.
The changes are spread in various subsystems, like kallsyms, kdb,
tracepoint, livepatch. Many people need to understand
the meaning of the new state and decide if the change is OK.
So, it affects many people and touches 15 locations where
things my go wrong.

The alternative solution, proposed above, looks much easier to me.

Best Regards,
Petr

