Return-Path: <linux-modules+bounces-2365-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD569B24BD
	for <lists+linux-modules@lfdr.de>; Mon, 28 Oct 2024 06:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD4551F21500
	for <lists+linux-modules@lfdr.de>; Mon, 28 Oct 2024 05:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E585718CBF9;
	Mon, 28 Oct 2024 05:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nIBDDrC/"
X-Original-To: linux-modules@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFB31885BE;
	Mon, 28 Oct 2024 05:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730094978; cv=none; b=Y9gnB1oALnUim55rwjQmfVsOWIcOJjq7ek6tCr+izW4e6mAJoA74JqsFS9re5A0OGZUpXxCWUA4C1nntKbwxw3sB2KFZfIfw+3mO79PdXBaU9d/wvdkspotLMcvFnjWghrjqtjtlVksBu6+mVHEJQZtNznNIqwqvKu6nO2feJ7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730094978; c=relaxed/simple;
	bh=QBDLZpz+h+e5UehtO06ip2OGJXJ+vu2UmeJfqKj+pAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s1jCIZkynT0e9yevuQngSaG/GSjBBrFDsb/xmRDIlnBiBY+infOip1+qw1buHwvLD9nSB5nYR1yEwRIjJDf5mULNvkYazh8pX1M934ARLGDSDczZd0q5+PMVV8d93G+VBv7GcpAuLruP/8QAaeD8tCF6/J3ldYu79+J4cUKeuU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nIBDDrC/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730094976; x=1761630976;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QBDLZpz+h+e5UehtO06ip2OGJXJ+vu2UmeJfqKj+pAw=;
  b=nIBDDrC/kHHgQrs0ocGPbGpJkJ6kfjP0V0cNK2Fm6+xBXEbYUn/3CTGH
   zUC/GW96ED0n1mvfpqSqglHYwUPqNDspQvd9NuficKfisjsoe6ocrZoj5
   PUxKo+mJEZHhWT/W81EN82JjNDJ8mLzQzw2J2aXSICyQJC8Z4kbMwXW/k
   6U0XgvE7USOiZhI6bBLYVY/TmE98Vaw+/d3oz2N9U0o7V3Gq9pPScMvNl
   Gbq/ZklXadmBHbUEX+dE3671AbxsoVf3Bkwwed8yHTe18d1mZp5SLM9qk
   A6tNZjYMX5IyEvDOpMwX3jIEJKbKx/csOuBOOp08Q9wNP08k8d6rpVmEW
   Q==;
X-CSE-ConnectionGUID: woCMfektTU22UQHP6wzalQ==
X-CSE-MsgGUID: RDj1fF1tQHSzly8DUsaOSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29817231"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29817231"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 22:56:15 -0700
X-CSE-ConnectionGUID: KRcTFeykS82ZftaEE399aA==
X-CSE-MsgGUID: uDvhalE3TxOqmYrkBlan2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="86094628"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Oct 2024 22:56:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5Ija-000bJg-0V;
	Mon, 28 Oct 2024 05:56:10 +0000
Date: Mon, 28 Oct 2024 13:55:42 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Guy Briggs <rgb@redhat.com>,
	Linux-Audit Mailing List <linux-audit@lists.linux-audit.osci.io>,
	LKML <linux-kernel@vger.kernel.org>, linux-modules@vger.kernel.org,
	Linux Kernel Audit Mailing List <audit@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Paul Moore <paul@paul-moore.com>,
	Eric Paris <eparis@parisplace.org>, Steve Grubb <sgrubb@redhat.com>,
	Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH v1] audit,module: restore audit logging in load failure
 case
Message-ID: <202410281314.56S1Nfqd-lkp@intel.com>
References: <999cdd694f951acd2f4ad665fe7ab97d0834e162.1729717542.git.rgb@redhat.com>
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <999cdd694f951acd2f4ad665fe7ab97d0834e162.1729717542.git.rgb@redhat.com>

Hi Richard,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mcgrof/modules-next]
[also build test WARNING on linus/master v6.12-rc5 next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Guy-Briggs/audit-module-restore-audit-logging-in-load-failure-case/20241024-051515
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git modules-next
patch link:    https://lore.kernel.org/r/999cdd694f951acd2f4ad665fe7ab97d0834e162.1729717542.git.rgb%40redhat.com
patch subject: [PATCH v1] audit,module: restore audit logging in load failure case
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20241028/202410281314.56S1Nfqd-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410281314.56S1Nfqd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410281314.56S1Nfqd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/module/main.c: In function 'load_module':
>> kernel/module/main.c:3336:63: warning: passing argument 1 of 'audit_log_kern_module' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    3336 |                 audit_log_kern_module(info->name ? info->name : "(unavailable)");
         |                                       ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   In file included from kernel/module/main.c:57:
   include/linux/audit.h:522:48: note: expected 'char *' but argument is of type 'const char *'
     522 | static inline void audit_log_kern_module(char *name)
         |                                          ~~~~~~^~~~


vim +3336 kernel/module/main.c

  3124	
  3125	/*
  3126	 * Allocate and load the module: note that size of section 0 is always
  3127	 * zero, and we rely on this for optional sections.
  3128	 */
  3129	static int load_module(struct load_info *info, const char __user *uargs,
  3130			       int flags)
  3131	{
  3132		struct module *mod;
  3133		bool module_allocated = false;
  3134		long err = 0;
  3135		char *after_dashes;
  3136	
  3137		/*
  3138		 * Do the signature check (if any) first. All that
  3139		 * the signature check needs is info->len, it does
  3140		 * not need any of the section info. That can be
  3141		 * set up later. This will minimize the chances
  3142		 * of a corrupt module causing problems before
  3143		 * we even get to the signature check.
  3144		 *
  3145		 * The check will also adjust info->len by stripping
  3146		 * off the sig length at the end of the module, making
  3147		 * checks against info->len more correct.
  3148		 */
  3149		err = module_sig_check(info, flags);
  3150		if (err)
  3151			goto free_copy;
  3152	
  3153		/*
  3154		 * Do basic sanity checks against the ELF header and
  3155		 * sections. Cache useful sections and set the
  3156		 * info->mod to the userspace passed struct module.
  3157		 */
  3158		err = elf_validity_cache_copy(info, flags);
  3159		if (err)
  3160			goto free_copy;
  3161	
  3162		err = early_mod_check(info, flags);
  3163		if (err)
  3164			goto free_copy;
  3165	
  3166		/* Figure out module layout, and allocate all the memory. */
  3167		mod = layout_and_allocate(info, flags);
  3168		if (IS_ERR(mod)) {
  3169			err = PTR_ERR(mod);
  3170			goto free_copy;
  3171		}
  3172	
  3173		module_allocated = true;
  3174	
  3175		audit_log_kern_module(mod->name);
  3176	
  3177		/* Reserve our place in the list. */
  3178		err = add_unformed_module(mod);
  3179		if (err)
  3180			goto free_module;
  3181	
  3182		/*
  3183		 * We are tainting your kernel if your module gets into
  3184		 * the modules linked list somehow.
  3185		 */
  3186		module_augment_kernel_taints(mod, info);
  3187	
  3188		/* To avoid stressing percpu allocator, do this once we're unique. */
  3189		err = percpu_modalloc(mod, info);
  3190		if (err)
  3191			goto unlink_mod;
  3192	
  3193		/* Now module is in final location, initialize linked lists, etc. */
  3194		err = module_unload_init(mod);
  3195		if (err)
  3196			goto unlink_mod;
  3197	
  3198		init_param_lock(mod);
  3199	
  3200		/*
  3201		 * Now we've got everything in the final locations, we can
  3202		 * find optional sections.
  3203		 */
  3204		err = find_module_sections(mod, info);
  3205		if (err)
  3206			goto free_unload;
  3207	
  3208		err = check_export_symbol_versions(mod);
  3209		if (err)
  3210			goto free_unload;
  3211	
  3212		/* Set up MODINFO_ATTR fields */
  3213		setup_modinfo(mod, info);
  3214	
  3215		/* Fix up syms, so that st_value is a pointer to location. */
  3216		err = simplify_symbols(mod, info);
  3217		if (err < 0)
  3218			goto free_modinfo;
  3219	
  3220		err = apply_relocations(mod, info);
  3221		if (err < 0)
  3222			goto free_modinfo;
  3223	
  3224		err = post_relocation(mod, info);
  3225		if (err < 0)
  3226			goto free_modinfo;
  3227	
  3228		flush_module_icache(mod);
  3229	
  3230		/* Now copy in args */
  3231		mod->args = strndup_user(uargs, ~0UL >> 1);
  3232		if (IS_ERR(mod->args)) {
  3233			err = PTR_ERR(mod->args);
  3234			goto free_arch_cleanup;
  3235		}
  3236	
  3237		init_build_id(mod, info);
  3238	
  3239		/* Ftrace init must be called in the MODULE_STATE_UNFORMED state */
  3240		ftrace_module_init(mod);
  3241	
  3242		/* Finally it's fully formed, ready to start executing. */
  3243		err = complete_formation(mod, info);
  3244		if (err)
  3245			goto ddebug_cleanup;
  3246	
  3247		err = prepare_coming_module(mod);
  3248		if (err)
  3249			goto bug_cleanup;
  3250	
  3251		mod->async_probe_requested = async_probe;
  3252	
  3253		/* Module is ready to execute: parsing args may do that. */
  3254		after_dashes = parse_args(mod->name, mod->args, mod->kp, mod->num_kp,
  3255					  -32768, 32767, mod,
  3256					  unknown_module_param_cb);
  3257		if (IS_ERR(after_dashes)) {
  3258			err = PTR_ERR(after_dashes);
  3259			goto coming_cleanup;
  3260		} else if (after_dashes) {
  3261			pr_warn("%s: parameters '%s' after `--' ignored\n",
  3262			       mod->name, after_dashes);
  3263		}
  3264	
  3265		/* Link in to sysfs. */
  3266		err = mod_sysfs_setup(mod, info, mod->kp, mod->num_kp);
  3267		if (err < 0)
  3268			goto coming_cleanup;
  3269	
  3270		if (is_livepatch_module(mod)) {
  3271			err = copy_module_elf(mod, info);
  3272			if (err < 0)
  3273				goto sysfs_cleanup;
  3274		}
  3275	
  3276		/* Get rid of temporary copy. */
  3277		free_copy(info, flags);
  3278	
  3279		codetag_load_module(mod);
  3280	
  3281		/* Done! */
  3282		trace_module_load(mod);
  3283	
  3284		return do_init_module(mod);
  3285	
  3286	 sysfs_cleanup:
  3287		mod_sysfs_teardown(mod);
  3288	 coming_cleanup:
  3289		mod->state = MODULE_STATE_GOING;
  3290		destroy_params(mod->kp, mod->num_kp);
  3291		blocking_notifier_call_chain(&module_notify_list,
  3292					     MODULE_STATE_GOING, mod);
  3293		klp_module_going(mod);
  3294	 bug_cleanup:
  3295		mod->state = MODULE_STATE_GOING;
  3296		/* module_bug_cleanup needs module_mutex protection */
  3297		mutex_lock(&module_mutex);
  3298		module_bug_cleanup(mod);
  3299		mutex_unlock(&module_mutex);
  3300	
  3301	 ddebug_cleanup:
  3302		ftrace_release_mod(mod);
  3303		synchronize_rcu();
  3304		kfree(mod->args);
  3305	 free_arch_cleanup:
  3306		module_arch_cleanup(mod);
  3307	 free_modinfo:
  3308		free_modinfo(mod);
  3309	 free_unload:
  3310		module_unload_free(mod);
  3311	 unlink_mod:
  3312		mutex_lock(&module_mutex);
  3313		/* Unlink carefully: kallsyms could be walking list. */
  3314		list_del_rcu(&mod->list);
  3315		mod_tree_remove(mod);
  3316		wake_up_all(&module_wq);
  3317		/* Wait for RCU-sched synchronizing before releasing mod->list. */
  3318		synchronize_rcu();
  3319		mutex_unlock(&module_mutex);
  3320	 free_module:
  3321		mod_stat_bump_invalid(info, flags);
  3322		/* Free lock-classes; relies on the preceding sync_rcu() */
  3323		for_class_mod_mem_type(type, core_data) {
  3324			lockdep_free_key_range(mod->mem[type].base,
  3325					       mod->mem[type].size);
  3326		}
  3327	
  3328		module_deallocate(mod, info);
  3329	 free_copy:
  3330		/*
  3331		 * The info->len is always set. We distinguish between
  3332		 * failures once the proper module was allocated and
  3333		 * before that.
  3334		 */
  3335		if (!module_allocated) {
> 3336			audit_log_kern_module(info->name ? info->name : "(unavailable)");
  3337			mod_stat_bump_becoming(info, flags);
  3338		}
  3339		free_copy(info, flags);
  3340		return err;
  3341	}
  3342	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

