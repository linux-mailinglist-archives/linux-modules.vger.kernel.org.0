Return-Path: <linux-modules+bounces-1329-lists+linux-modules=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CA48C232B
	for <lists+linux-modules@lfdr.de>; Fri, 10 May 2024 13:23:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 551B41C210FD
	for <lists+linux-modules@lfdr.de>; Fri, 10 May 2024 11:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43ABE16F274;
	Fri, 10 May 2024 11:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cisco.com header.i=@cisco.com header.b="HjuzW15R"
X-Original-To: linux-modules@vger.kernel.org
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6730B17088A
	for <linux-modules@vger.kernel.org>; Fri, 10 May 2024 11:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.37.86.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715340179; cv=none; b=ohVehoHvYsAZwOJmZbyEXYdlStlzumN38KsUbd5l0Psz9sPZA9uWWW6dorbrnqUD0XdJI+ELj9bH0PFLmbbToeBG4AFOBA6RxDY+CgdMJXi6IDNOvUCWyGgrDtam+/gnzeg2Ko3fM3/3ZALJzpdNhOaeM97CyB5wMWaqKHaE7vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715340179; c=relaxed/simple;
	bh=mfOQCN5GJ4CKpWqxcoUyuraHPSm4QgrwV5P7W9TdVfk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=W4BTFYI0kvdv+GGC62Y5VEYqHGTAzNfylKr4LF7o3nJJDE2lh04XpZLgMJ7weEcf95EcIxakwRcq0gbHPGyz3/poRmzXBKCrxdrs6mUCw7yPejOd52/QXpxMsizHlVuscyM2TlJ3mtKtQq1ABGaiJUOBr4JGc+12T5CG12h47ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com; spf=pass smtp.mailfrom=cisco.com; dkim=pass (1024-bit key) header.d=cisco.com header.i=@cisco.com header.b=HjuzW15R; arc=none smtp.client-ip=173.37.86.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cisco.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=14322; q=dns/txt;
  s=iport; t=1715340159; x=1716549759;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vjhxBDH3gSNQZuhO2E3vYqWQtz7MoDhLUtdyjGZ+jOU=;
  b=HjuzW15R1+ukVzW1NjyY1+qEoPpRL3heH2668ewvvPf+XrVWTW1J4t5r
   71efKHH3VR2BYYnlv8AjZ9c372P5UDKVZHTr7a1SmV/Ngp7reXZcuJzJq
   0KO1x0iuT7J6VNpKAX+Z+P0Dro3GJVFhA/Jnn6ggFN12DDS+3zcaEyHiE
   U=;
X-CSE-ConnectionGUID: p/zY9UUUTh+IUgrn9mItDw==
X-CSE-MsgGUID: TOvHFo01QcGAUtAG/9IoAA==
X-IPAS-Result: =?us-ascii?q?A0AUAAAgAj5mmJNdJa1aHQEBAQEJARIBBQUBgXsIAQsBh?=
 =?us-ascii?q?BdCSIxyiUyBFopekhkUgREDVg8BAQEPRAQBAYUGiDoCJjQJDgECBAEBAQEDA?=
 =?us-ascii?q?gMBAQEBAQEBAQYBAQUBAQECAQcFFAEBAQEBAQEBHhkFDhAnhTsHP4ZcKwsBR?=
 =?us-ascii?q?oFQgwCCZQIBsTaBeTOBAd4xgWsYgTABjQaFZCcbgUlEgRWBO4E3doQphl4Eh?=
 =?us-ascii?q?Q6BAIdYSoUZgxEVgk4aSyuBcwEECIUzgj6FVEqBIwNZIQIRAVUTDQoLPgkWA?=
 =?us-ascii?q?hYDGxQEMA8JCyYDKgY2AhIMBgYGWSAWCQQjAwgEA0QDIHERAwQaBAsHdYMxB?=
 =?us-ascii?q?BNEA4E4iX2CCYE0KYF3gQ6DEEuEdoF3DmGJIA8HBUlAAwsYDUgRLDUUGwYiH?=
 =?us-ascii?q?24HpUcHASwEDBs2FByBFUEjB5MjHQqDIIw7gh2BMolulUuEHaEsGjOEBZdGA?=
 =?us-ascii?q?o5niByQRoJUoVCEY4FlOkiBE00jFTuCZ1IZD4slgwcBDQnQCiM1OwIHCwEBA?=
 =?us-ascii?q?wmKaAEB?=
IronPort-Data: A9a23:a4eFCKlROgpMsJwBSt5/Xr/o5gypJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXWGjUbPmJM2b0f95wbo619hlXsJPTm98yGVFuqyAyRVtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaB4E/rav649SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+5231GONgWYubjpJsvrb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSq
 zHrlezREsvxpn/BO/v9+lrJWhRiro36YWBivkFrt52K2XCukMCdPpETb5LwYW8P49mAcksYJ
 N9l7fRcQi9xVkHAdXh0vxRwS0lD0aN6FLDvOT+tgJ2u8nD6czjN/vp0ChAzHJE05bMiaY1O3
 aRwxDEldBuPgae9x6i2D7A1wM8iN8LseogYvxmMzxmAUq1gGs+FEv6MvIMHtNszrpgm8fL2e
 cEZZCBpawnoaBxUMVBRA5U79AutriOmKWID8Q3J+cLb5UDv6xJR/r+1aePeVfW3Wex62Re5o
 UvvqjGR7hYyb4HHlmHfrRpAnNTnmT7wUZlUGLD+8/dwi12S7mMWARwSE1C8pJGRjAilUNJeJ
 lY88zQr66Q/nGSvT9/gT1i9p3KZuhMHc8RfHvd86wyXzKfQpQGDCQA5oiVpctcqsoo9QiYnk
 wbQ2djoHjdo9raSTBpx64t4sxuqfjokfFI/WBMEDio47MPl8YQSkj7QG4ML/LGOsvX5HjT5w
 javpSc4hqkOgcNj60ld1Q6d695LjsaQJjPZ9jnqsnSZAhSVjbNJiqSy4lTdqP1HNovcFwDHt
 3kfkM/Y5+cLZX1sqMBvaLtTdF1Kz6/ZWNE5vbKJN8J/n9hK0yX/Fb28GBkkeC9U3j8sIFcFm
 nP7twJL/4N0N3C3d6JxaI/ZI511lPW6SoW5CK+INoYmjn1NmOmvoXAGiam4gjCFraTQuf5X1
 WqzKJ/zXShAVcyLMhLvGrpFuVPU+szO7TiOHc+glUvPPUu2b3+OQrBNK0qVcu089+uFpg6Tm
 +uzxOPUoyizpNbWO3GNmaZKdAhiBSFiWfje9ZcNHsbdeVUOJY3UI6KLqV/XU9Y7z/09eyah1
 izVZ3K0P3Kj2ieZc1rUNSELhXGGdc8XkE/X9BcEZT6As0XPq672hEvDX/PbpYUaydE=
IronPort-HdrOrdr: A9a23:U5ZMa6GSHDiDNGM3pLqE58eALOsnbusQ8zAXPo5KJSC9Ffbo9f
 xG88506faZslwssRIb6LO90de7IE80nKQdieIs1NyZMzUO1lHEEGhK1/qG/9SZIU3DHio379
 YGT0C4Y+eAaWRHsQ==
X-Talos-CUID: 9a23:UHcdDmNsWDFsnu5DQG51xR8pJ/0Zcj788XjKJR69KHpFV+jA
X-Talos-MUID: 9a23:4K07OQlfVDHfl2PNAu9RdnpeE9lIzaP2UXkGvrw7p+Crcn1RPB602WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.08,150,1712620800"; 
   d="scan'208";a="212731744"
Received: from rcdn-core-11.cisco.com ([173.37.93.147])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 11:21:30 +0000
Received: from sjc-ads-1541.cisco.com (sjc-ads-1541.cisco.com [171.70.59.233])
	by rcdn-core-11.cisco.com (8.15.2/8.15.2) with ESMTP id 44ABLTuB031338;
	Fri, 10 May 2024 11:21:29 GMT
From: Valerii Chernous <vchernou@cisco.com>
To: linux-modules@vger.kernel.org
Cc: xe-linux-external@cisco.com, Nicolas Schier <n.schier@avm.de>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>
Subject: [MODALTS v0.1 2/4] kmod: add generation of modules.alternatives to depmod
Date: Fri, 10 May 2024 04:21:26 -0700
Message-Id: <20240510112128.2417494-2-vchernou@cisco.com>
X-Mailer: git-send-email 2.35.6
Precedence: bulk
X-Mailing-List: linux-modules@vger.kernel.org
List-Id: <linux-modules.vger.kernel.org>
List-Subscribe: <mailto:linux-modules+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-modules+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 171.70.59.233, sjc-ads-1541.cisco.com
X-Outbound-Node: rcdn-core-11.cisco.com

algorithm of creating deps alternatives

1. for each module(m) creating hash map(mp) of module providers for required symbols(s)

2. for each required(primary) symbol(s) into module(m) create temp array of providers(p)
from list of symbol(s) alternatives with first elem into array as symbol(s)

3. get array of providers(pc) for owner(o) of symbol(s) from
hash map(mp) of module providers

4. if array of providers(pc) already presented
4.1 check is pc equal or subset of p, if yes leave pc into map(mp) and ignore p,
4.2 no - remove from temp array p all symbols providers that is not presenetd into pc
(create new set of providers p less or equal to pc(providers should cover all
required symbols, not only current symbol) and update hash map(mp) for owner(o)
to new(cutted) p

4.3 if array of providers(pc) is not presented for owner(o), create it

At the end of algorithm, for each primary dependency hash map(mp) contain modules
alternatives that provided all required symbols

Note:
Alternatives than not provide some required symbol(s) didn't trap to final list and
variant where this symbol provided by some other module ignored(not implemented)
Note:
modules.dep index different for standard/basic and modules alternatives algorithms
modules.dep for modules alternatives algorithm contain only direct dependencies
and full dependency list will be calculated into runtime correspond to
preferred alternative.
modules.dep for standard/basic algorithm contain full dependency list for
module and can't be changed during runtime without rebuild database via depmod

Cc: xe-linux-external@cisco.com
Cc: Valerii Chernous <vchernou@cisco.com>
Signed-off-by: Valerii Chernous <vchernou@cisco.com>
---
 tools/depmod.c | 293 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 290 insertions(+), 3 deletions(-)

diff --git a/tools/depmod.c b/tools/depmod.c
index 24f79c4..7bea8e9 100644
--- a/tools/depmod.c
+++ b/tools/depmod.c
@@ -919,6 +919,7 @@ struct mod {
 	struct kmod_list *info_list;
 	struct kmod_list *dep_sym_list;
 	struct array deps; /* struct symbol */
+	struct hash *deps_alts; /* array struct symbol */
 	size_t baselen; /* points to start of basename/filename */
 	size_t modnamesz;
 	int sort_idx; /* sort index using modules.order */
@@ -950,6 +951,7 @@ struct depmod {
 static void mod_free(struct mod *mod)
 {
 	DBG("free %p kmod=%p, path=%s\n", mod, mod->kmod, mod->path);
+	hash_free(mod->deps_alts);
 	array_free_array(&mod->deps);
 	kmod_module_unref(mod->kmod);
 	kmod_module_info_free_list(mod->info_list);
@@ -980,6 +982,76 @@ static int mod_add_dependency(struct mod *mod, struct symbol *sym)
 	return 0;
 }
 
+static struct symbol *depmod_symbol_find(const struct depmod *depmod,
+							const char *name);
+
+struct array *symbol_get_owners(struct depmod *depmod, struct symbol *sym, int *err)
+{
+	struct array *sym_arr;
+	struct symbol *sym_l, *li;
+	sym_arr = malloc(sizeof(struct array));
+	if (sym_arr == NULL) {
+	    *err = -ENOMEM;
+	    return NULL;
+	}
+	array_init(sym_arr, 4);
+	// first owner into alternatives should be primary owner so add it at 0 position //
+	*err = array_append(sym_arr, sym);
+	if ( *err < 0)
+		goto fail;
+	sym_l = (struct symbol*)depmod_symbol_find(depmod, sym->name);
+	for (li = sym_l; li != NULL; li = li->next)
+		if (li != sym) {
+			*err = array_append(sym_arr, li);
+			if ( *err < 0)
+				goto fail;
+		}
+	*err = 0;
+	return sym_arr;
+fail:
+	array_free_array(sym_arr);
+	free(sym_arr);
+	return NULL;
+}
+
+static int mod_update_dep_alternatives_groups(const struct depmod *depmod, struct mod *mod, struct symbol *sym)
+{
+	struct array *alt_arr;
+	int err;
+
+	DBG("Preparing alternatives for module %s dependency %s %s\n", mod->path, sym->name,
+	    sym->owner != NULL ? sym->owner->path : "(unknown)");
+
+	if (sym->owner == NULL)
+		return 0;
+	err = 0;
+	alt_arr = (struct array*)hash_find(mod->deps_alts, sym->owner->path);
+	if (!alt_arr) {
+		// Create the initial alternative modules array if not presented
+		alt_arr = symbol_get_owners(depmod, sym, &err);
+		if (!alt_arr)
+			goto alt_ex;
+		err = hash_add(mod->deps_alts, sym->owner->path, alt_arr);
+	} else {
+		// Remove alternatives that don't provide the necessary symbol
+		struct symbol *sym_l, *li;
+		size_t si = 0;
+		sym_l = (struct symbol*)depmod_symbol_find(depmod, sym->name);
+		while (si < alt_arr->count) {
+			for (li = sym_l; li != NULL; li = li->next)
+				if (li->owner == ((struct symbol*)alt_arr->array[si])->owner)
+					break;
+			// primary owner can't be removed from alternatives
+			if (!li && si != 0)
+				array_remove_at(alt_arr, si);
+			else
+				si += 1;
+		}
+	}
+alt_ex:
+	return err;
+}
+
 static void symbol_free_sub(struct symbol *sym)
 {
 	DBG("free %p sym=%s, owner=%p %s\n", sym, sym->name, sym->owner,
@@ -1014,6 +1086,13 @@ static struct kmod_module_info *depmod_get_mod_info(struct mod *mod, const char
 	return rval;
 }
 
+static void symbol_alternatives_free(struct array *arr)
+{
+	array_free_array(arr);
+	free(arr);
+}
+
+
 static int depmod_init(struct depmod *depmod, struct cfg *cfg,
 							struct kmod_ctx *ctx)
 {
@@ -1089,6 +1168,11 @@ static int depmod_module_add(struct depmod *depmod, struct kmod_module *kmod)
 	memcpy(mod->modname, modname, modnamesz);
 	mod->modnamesz = modnamesz;
 
+	mod->deps_alts = hash_new(64, (void (*)(void *))symbol_alternatives_free);
+	if (mod->deps_alts == NULL) {
+		free(mod);
+		return -ENOMEM;
+	}
 	array_init(&mod->deps, 4);
 
 	mod->path = strdup(kmod_module_get_path(kmod));
@@ -1127,6 +1211,7 @@ static int depmod_module_add(struct depmod *depmod, struct kmod_module *kmod)
 
 fail:
 	free(mod->uncrelpath);
+	hash_free(mod->deps_alts);
 	free(mod);
 	return err;
 }
@@ -1742,6 +1827,8 @@ static int depmod_load_module_dependencies(struct depmod *depmod, struct mod *mo
 		}
 
 		mod_add_dependency(mod, sym);
+		if (depmod->cfg->use_deps_alternatives == 1)
+			mod_update_dep_alternatives_groups(depmod, mod, sym);
 	}
 
 	return 0;
@@ -2164,11 +2251,24 @@ static int mod_fill_all_unique_dependencies(const struct mod *mod, const struct
 	return err;
 }
 
-static const struct mod **mod_get_all_sorted_dependencies(const struct mod *mod, size_t *n_deps)
+static const struct mod **mod_get_all_sorted_dependencies(const struct mod *mod, size_t *n_deps, int is_direct_deps_only)
 {
 	const struct mod **deps;
 	size_t last = 0;
 
+	if (is_direct_deps_only == 1) {
+	// in case of dirrect deps it's already unique so make an deps array copy//
+		*n_deps = mod->deps.count;
+		if (*n_deps == 0)
+			return NULL;
+		last = mod->deps.count;
+		deps = malloc(sizeof(struct mod *) * last);
+		if (deps == NULL)
+			return NULL;
+		for (size_t i = 0; i < last; i++)
+			deps[i] = mod->deps.array[i];
+		goto sort_dep;
+	}
 	*n_deps = mod_count_all_dependencies(mod);
 	if (*n_deps == 0)
 		return NULL;
@@ -2182,6 +2282,7 @@ static const struct mod **mod_get_all_sorted_dependencies(const struct mod *mod,
 		return NULL;
 	}
 
+sort_dep:
 	qsort(deps, last, sizeof(struct mod *), dep_cmp);
 	*n_deps = last;
 	return deps;
@@ -2208,7 +2309,7 @@ static int output_deps(struct depmod *depmod, FILE *out)
 		if (mod->deps.count == 0)
 			goto end;
 
-		deps = mod_get_all_sorted_dependencies(mod, &n_deps);
+		deps = mod_get_all_sorted_dependencies(mod, &n_deps, depmod->cfg->use_deps_alternatives);
 		if (deps == NULL) {
 			ERR("could not get all sorted dependencies of %s\n", p);
 			goto end;
@@ -2245,7 +2346,7 @@ static int output_deps_bin(struct depmod *depmod, FILE *out)
 		size_t j, n_deps, linepos, linelen, slen;
 		int duplicate;
 
-		deps = mod_get_all_sorted_dependencies(mod, &n_deps);
+		deps = mod_get_all_sorted_dependencies(mod, &n_deps, depmod->cfg->use_deps_alternatives);
 		if (deps == NULL && n_deps > 0) {
 			ERR("could not get all sorted dependencies of %s\n", p);
 			continue;
@@ -2368,6 +2469,171 @@ static int output_aliases_bin(struct depmod *depmod, FILE *out)
 	return 0;
 }
 
+static int sym_mod_cmp(const void *pa, const void *pb)
+{
+	int rsl;
+	const struct symbol *a = *(const struct symbol**)pa;
+	const struct symbol *b = *(const struct symbol**)pb;
+	rsl = strcmp(a->owner->modname, b->owner->modname);
+	if (rsl == 0)
+		rsl = strcmp(a->owner->path, b->owner->path);
+	return rsl;
+}
+
+static int sym_name_cmp(const void *pa, const void *pb)
+{
+	const struct symbol *sa, *sb;
+	const struct array *a = *(const struct array**)pa;
+	const struct array *b = *(const struct array**)pb;
+	sa = (const struct symbol*)a->array[0];
+	sb = (const struct symbol*)b->array[0];
+	return strcmp(sa->name, sb->name);
+}
+
+static void sort_sym_alternatives(struct array *sym_arr)
+{
+	if (sym_arr->count <= 2)
+		return;
+	// first element into array should remain it position //
+	qsort( &sym_arr->array[1], sym_arr->count - 1, sizeof(void*), sym_mod_cmp);
+}
+
+static int sort_mod_alternatives(const struct mod *mod, struct array *sorted)
+{
+	struct hash_iter it;
+	const void *v;
+	int rval;
+
+	array_init(sorted, 4);
+	hash_iter_init(mod->deps_alts, &it);
+	while (hash_iter_next(&it, NULL, &v)) {
+		struct array *sym_arr = (struct array *)v;
+		struct symbol *sym = (struct symbol *)sym_arr->array[0];
+		sort_sym_alternatives(sym_arr);
+		rval = array_append(sorted, sym_arr);
+		if (rval < 0) {
+			array_free_array(sorted);
+			return rval;
+		}
+	}
+	array_sort(sorted, sym_name_cmp);
+	return 0;
+}
+
+static int output_alternatives(struct depmod *depmod, FILE *out)
+{
+	size_t i, i2, i3;
+	fputs("# Modules dependencies alternatives extracted from modules themselves.\n", out);
+	for (i = 0; i < depmod->modules.count; i++) {
+		const struct mod *mod = depmod->modules.array[i];
+		struct array sorted_alts;
+		int rval;
+		rval = sort_mod_alternatives(mod, &sorted_alts);
+		if ( rval < 0) {
+		    ERR("Sorting deps alternatives for %s failed\n", mod->modname);
+		    return rval;
+		}
+		for (i2 = 0; i2 < sorted_alts.count; i2++) {
+			struct array *sym_arr = (struct array *)sorted_alts.array[i2];
+			struct symbol *alternative = (struct symbol *)sym_arr->array[0];
+			// avoid printing deps with single alternative to reduce index size//
+			if (sym_arr->count <= 1)
+				continue;
+			fprintf(out, "%s#_#%s:", mod->modname, alternative->owner->modname);
+			for (i3 = 0; i3 < sym_arr->count; i3++) {
+				alternative = (struct symbol *)sym_arr->array[i3];
+				fprintf(out, " %s", mod_get_compressed_path(alternative->owner));
+			}
+			fprintf(out, "\n");
+		}
+		array_free_array(&sorted_alts);
+	}
+	return 0;
+}
+
+static int output_alternatives_bin(struct depmod *depmod, FILE *out)
+{
+	struct index_node *idx;
+	size_t i, i2, i3;
+	int err = 0;
+
+	if (out == stdout)
+		return 0;
+
+	idx = index_create();
+	if (idx == NULL)
+		return -ENOMEM;
+
+	for (i = 0; i < depmod->modules.count; i++) {
+		const struct mod *mod = depmod->modules.array[i];
+		struct array sorted_alts;
+		int rval;
+		rval = sort_mod_alternatives(mod, &sorted_alts);
+		if ( rval < 0) {
+		    ERR("Sorting deps alternatives for %s failed\n", mod->modname);
+		    return rval;
+		}
+
+		for (i2 = 0; i2 < sorted_alts.count; i2++) {
+			int duplicate;
+			char alt_key[PATH_MAX*2];
+			char *alt_value, *tmp_value;
+			size_t alt_vsize = PATH_MAX*2;
+			size_t alt_vlen = 0;
+			struct array *sym_arr = (struct array *)sorted_alts.array[i2];
+			struct symbol *alternative = (struct symbol *)sym_arr->array[0];
+			// avoid storing deps with single alternative to reduce index size //
+			if (sym_arr->count <= 1)
+				continue;
+			// construct index key //
+			snprintf(alt_key, sizeof(alt_key) - 1, "%s#_#%s", mod->modname, alternative->owner->modname);
+			alt_value = malloc(alt_vsize);
+			if (alt_value == NULL) {
+				err = -ENOMEM;
+				goto fail;
+			}
+			alt_vlen = snprintf(alt_value, alt_vsize, "%s:", alt_key);
+			// construct index value //
+			for ( i3 = 0; i3 < sym_arr->count; i3++) {
+				size_t l;
+				const char *mpath;
+				alternative = (struct symbol *)sym_arr->array[i3];
+				mpath = mod_get_compressed_path(alternative->owner);
+				l = strlen(mpath) + strlen(" ");
+				if (alt_vlen + l >= alt_vsize) {
+					alt_vsize += PATH_MAX > l ? PATH_MAX : l + 1;
+					tmp_value = realloc(alt_value, alt_vsize);
+					if (tmp_value == NULL) {
+						free(alt_value);
+						err = -ENOMEM;
+						goto fail;
+					}
+					alt_value = tmp_value;
+				}
+				strncat(alt_value, " ", alt_vsize);
+				strncat(alt_value, mpath, alt_vsize);
+				alt_vlen += l;
+			}
+			DBG("Adding to index mod: %s, key: %s, value: %s\n", mod->modname, alt_key, alt_value);
+			duplicate = index_insert(idx, alt_key, alt_value, mod->idx);
+			if (duplicate && depmod->cfg->warn_dups)
+				WRN("duplicate module alternative:\n%s %s\n",
+				    alt_key, mod->modname);
+			free(alt_value);
+		}
+		array_free_array(&sorted_alts);
+	}
+
+	index_write(idx, out);
+	index_destroy(idx);
+
+	return 0;
+fail:
+	index_destroy(idx);
+	return err;
+
+}
+
 static int output_softdeps(struct depmod *depmod, FILE *out)
 {
 	size_t i;
@@ -2684,6 +2950,8 @@ static int depmod_output(struct depmod *depmod, FILE *out)
 		{ "modules.dep.bin", output_deps_bin },
 		{ "modules.alias", output_aliases },
 		{ "modules.alias.bin", output_aliases_bin },
+		{ "modules.alternatives", output_alternatives },
+		{ "modules.alternatives.bin", output_alternatives_bin },
 		{ "modules.softdep", output_softdeps },
 		{ "modules.symbols", output_symbols },
 		{ "modules.symbols.bin", output_symbols_bin },
@@ -2719,6 +2987,25 @@ static int depmod_output(struct depmod *depmod, FILE *out)
 		char tmp[NAME_MAX] = "";
 		int r, ferr;
 
+		// modules.alternatives and modules.alternatives.bin should be processed only into dependency alternatives mode(with -D flag) //
+		if (depmod->cfg->use_deps_alternatives == 0 && (itr->cb == output_alternatives || itr->cb == output_alternatives_bin)) {
+			if (fp == NULL) {
+			// if not output to stdout //
+				int fd;
+				fd = openat(dfd, itr->name, O_RDONLY|O_CLOEXEC);
+				if (fd >=0) {
+					// if alternatives index file exists //
+					close(fd);
+					if (unlinkat(dfd, itr->name, 0) != 0) {
+						err = -errno;
+						ERR("unlinkat(%s, %s)\n", dname, itr->name);
+						break;
+					}
+				}
+			}
+			continue;
+		}
+
 		if (fp == NULL) {
 			int flags = O_CREAT | O_EXCL | O_WRONLY;
 			int mode = 0644;
-- 
2.35.6


