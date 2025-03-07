Return-Path: <linux-modules+bounces-3332-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C6CA55B84
	for <lists+linux-modules@lfdr.de>; Fri,  7 Mar 2025 01:12:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98EBD7AAB09
	for <lists+linux-modules@lfdr.de>; Fri,  7 Mar 2025 00:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 274844A21;
	Fri,  7 Mar 2025 00:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HFAbmAJm"
X-Original-To: linux-modules@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD54256D
	for <linux-modules@vger.kernel.org>; Fri,  7 Mar 2025 00:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741306326; cv=none; b=CH0+n8SyAsskAkFa82IMslUAoQGXCv61GKlc6gzcTmMofL2JyyasN9o/ZOd8FXIZFiFTgNNIZINv7h7bpRJtJQx8GixrGkH6ySVdkfNCmVZQx2ybBwnS7jq8SwcE8vNg1lsnjJgvLHqt+9xdzPIsPcY2g4h6bGf4C0YL46HmZXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741306326; c=relaxed/simple;
	bh=1+5JQysKQUFzPlXV5iXns5SxLZiKaaThVUlR7SVyy8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQlIOLSzeS4Ftv/aBNeNMRhAQPbdtkb1xhV5ojkvOWPZ2eKHuKTEQ6CuDapxLcFIN34OJ07uKGnsXzcQEzDqPgpYzxl6+ubBhghapo2Z9ei7xQ8j7IH4BEbNSSuJv57r7WpvVZTXHN1e/uET82x31zBQN2+7X/YTO7+zxZy4PnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HFAbmAJm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741306323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zm+epScIo9JBpjBpv+KrV89+zYfTeifIsVCDuXx0C2Y=;
	b=HFAbmAJmfLux63AzyEd4sMBIGvxgtagDiaqI0KV1hqCVKAPAkteOqcSJ11/WhMy5IMtbBH
	re+mZv0O9vGgtJ3CHKBhN546W5HjvHRWQgocBjkqbsH1chabn+ciziySMaOsSDGzhGsN8o
	UNiWqZwL+AHR/qkr+hRQeznD8OxwEyI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-568-nLeurWNmN0OHy_jmyGzmTQ-1; Thu,
 06 Mar 2025 19:12:00 -0500
X-MC-Unique: nLeurWNmN0OHy_jmyGzmTQ-1
X-Mimecast-MFC-AGG-ID: nLeurWNmN0OHy_jmyGzmTQ_1741306318
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9C9AE1800262;
	Fri,  7 Mar 2025 00:11:57 +0000 (UTC)
Received: from madcap2.tricolour.ca (unknown [10.22.58.19])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 287BB1944F2E;
	Fri,  7 Mar 2025 00:11:54 +0000 (UTC)
Date: Thu, 6 Mar 2025 19:11:52 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Cc: Linux-Audit Mailing List <linux-audit@lists.linux-audit.osci.io>,
	LKML <linux-kernel@vger.kernel.org>, linux-modules@vger.kernel.org,
	Linux Kernel Audit Mailing List <audit@vger.kernel.org>,
	Eric Paris <eparis@parisplace.org>, Steve Grubb <sgrubb@redhat.com>
Subject: Re: [PATCH v1] audit,module: restore audit logging in load failure
 case
Message-ID: <Z8o5yOnsw2f9cs/Q@madcap2.tricolour.ca>
References: <999cdd694f951acd2f4ad665fe7ab97d0834e162.1729717542.git.rgb@redhat.com>
 <b7f8e0d11b6cfc7547709c7efc472021@paul-moore.com>
 <Z8oWlAwgKWW+M8yL@madcap2.tricolour.ca>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8oWlAwgKWW+M8yL@madcap2.tricolour.ca>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 2025-03-06 16:41, Richard Guy Briggs wrote:
> On 2024-10-24 16:41, Paul Moore wrote:
> > On Oct 23, 2024 Richard Guy Briggs <rgb@redhat.com> wrote:
> > > The move of the module sanity check to earlier skipped the audit logging
> > > call in the case of failure and to a place where the previously used
> > > context is unavailable.
> > > 
> > > Add an audit logging call for the module loading failure case and get
> > > the module name when possible.
> > > 
> > > Link: https://issues.redhat.com/browse/RHEL-52839
> > > Fixes: 02da2cbab452 ("module: move check_modinfo() early to early_mod_check()")
> > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > ---
> > >  kernel/module/main.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/kernel/module/main.c b/kernel/module/main.c
> > > index 49b9bca9de12..1f482532ef66 100644
> > > --- a/kernel/module/main.c
> > > +++ b/kernel/module/main.c
> > > @@ -3057,8 +3057,10 @@ static int load_module(struct load_info *info, const char __user *uargs,
> > >  	 * failures once the proper module was allocated and
> > >  	 * before that.
> > >  	 */
> > > -	if (!module_allocated)
> > > +	if (!module_allocated) {
> > > +		audit_log_kern_module(info->name ? info->name : "(unavailable)");
> > >  		mod_stat_bump_becoming(info, flags);
> > > +	}
> > 
> > We probably should move the existing audit_log_kern_module() to just
> > after the elf_validity_cache_copy() call as both info->name and
> > info->mod->name should be as valid as they are going to get at that
> > point.  If we do that then we only have two cases we need to worry about,
> > a failed module_sig_check() or a failed elf_validity_cache_copy(), and
> > in both cases we can use "(unavailable)" without having to check
> > info->name first.
> 
> Fair enough.
> 
> > However, assuming we move the audit_log_kern_module() call up a bit as
> > described above, I'm not sure there is much value in calling
> > audit_log_kern_module() with an "(unavailable)" module name in those
> > early two cases.  We know it's an attempted module load based on the
> > SYSCALL record, seeing an associated "(unavailable)" KERN_MODULE record
> > doesn't provide us with any more information than if we had simply
> > skipped the KERN_MODULE record.
> 
> Understood.  I wonder if the absence of the record in the error case
> will leave us guessing if we lost a record from the event?  We will have
> the error code from the SYSCALL record but not much more than that, and
> some of those error codes could just as well be generated after that
> point too.  This would be a similar situation to the vanishing fields in
> an existing record, but is likely easier to mitigate than a
> non-last-field vanishing or shifting around in an existing record.

In fact, the reason the original issue was filed was due to the
unexpected missing record, so it seems that it would be best to include
it regardless so that event can be found more consistently by
KERN_MODULE record type rather than searching for SYSCALL sub-field.

> Steve?  Atilla?  Any comments?
> 
> > Untested, but this is what I'm talking about:
> > 
> > diff --git a/include/linux/audit.h b/include/linux/audit.h
> > index 0050ef288ab3..eaa10e3c7eca 100644
> > --- a/include/linux/audit.h
> > +++ b/include/linux/audit.h
> > @@ -417,7 +417,7 @@ extern int __audit_log_bprm_fcaps(struct linux_binprm *bprm,
> >  extern void __audit_log_capset(const struct cred *new, const struct cred *old);
> >  extern void __audit_mmap_fd(int fd, int flags);
> >  extern void __audit_openat2_how(struct open_how *how);
> > -extern void __audit_log_kern_module(char *name);
> > +extern void __audit_log_kern_module(const char *name);
> >  extern void __audit_fanotify(u32 response, struct fanotify_response_info_audit_rule *friar);
> >  extern void __audit_tk_injoffset(struct timespec64 offset);
> >  extern void __audit_ntp_log(const struct audit_ntp_data *ad);
> > @@ -519,7 +519,7 @@ static inline void audit_openat2_how(struct open_how *how)
> >                 __audit_openat2_how(how);
> >  }
> >  
> > -static inline void audit_log_kern_module(char *name)
> > +static inline void audit_log_kern_module(const char *name)
> >  {
> >         if (!audit_dummy_context())
> >                 __audit_log_kern_module(name);
> > @@ -677,7 +677,7 @@ static inline void audit_mmap_fd(int fd, int flags)
> >  static inline void audit_openat2_how(struct open_how *how)
> >  { }
> >  
> > -static inline void audit_log_kern_module(char *name)
> > +static inline void audit_log_kern_module(const char *name)
> >  {
> >  }
> >  
> > diff --git a/kernel/audit.h b/kernel/audit.h
> > index a60d2840559e..5156ecd35457 100644
> > --- a/kernel/audit.h
> > +++ b/kernel/audit.h
> > @@ -199,7 +199,7 @@ struct audit_context {
> >                         int                     argc;
> >                 } execve;
> >                 struct {
> > -                       char                    *name;
> > +                       const char              *name;
> >                 } module;
> >                 struct {
> >                         struct audit_ntp_data   ntp_data;
> > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > index 0627e74585ce..f79eb3a5a789 100644
> > --- a/kernel/auditsc.c
> > +++ b/kernel/auditsc.c
> > @@ -2870,7 +2870,7 @@ void __audit_openat2_how(struct open_how *how)
> >         context->type = AUDIT_OPENAT2;
> >  }
> >  
> > -void __audit_log_kern_module(char *name)
> > +void __audit_log_kern_module(const char *name)
> >  {
> >         struct audit_context *context = audit_context();
> >  
> > diff --git a/kernel/module/main.c b/kernel/module/main.c
> > index 49b9bca9de12..3acb65073c53 100644
> > --- a/kernel/module/main.c
> > +++ b/kernel/module/main.c
> > @@ -2884,6 +2884,8 @@ static int load_module(struct load_info *info, const char __user *uargs,
> >         if (err)
> >                 goto free_copy;
> >  
> > +       audit_log_kern_module(info->name);
> > +
> >         err = early_mod_check(info, flags);
> >         if (err)
> >                 goto free_copy;
> > @@ -2897,8 +2899,6 @@ static int load_module(struct load_info *info, const char __user *uargs,
> >  
> >         module_allocated = true;
> >  
> > -       audit_log_kern_module(mod->name);
> > -
> >         /* Reserve our place in the list. */
> >         err = add_unformed_module(mod);
> >         if (err)
> > 
> > --
> > paul-moore.com
> 
> - RGB

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
Upstream IRC: SunRaycer
Voice: +1.613.860 2354 SMS: +1.613.518.6570


