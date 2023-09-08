Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76EE97984B5
	for <lists+linux-modules@lfdr.de>; Fri,  8 Sep 2023 11:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239727AbjIHJU7 (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Fri, 8 Sep 2023 05:20:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232182AbjIHJU6 (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Fri, 8 Sep 2023 05:20:58 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CA121997;
        Fri,  8 Sep 2023 02:20:51 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F391C433CA;
        Fri,  8 Sep 2023 09:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1694164851;
        bh=/LvggepIQ1S3GmMvGuoiame3j1zQuDvtndjum2aPQGw=;
        h=From:To:Cc:Subject:Date:From;
        b=MsS5fV6CC4+Qy93L73SeSn7lpYGAX8+jl+FXnYeKsZlwx0QmlT26oSb2ItJDep4aU
         dOwxZY+AB0sDF54jNsjXIIqCQ+tCM3fwue5IG84OGItCzlcsuWswW72szcNCLHxWTm
         CYY6j+trLDfonT6ydeqZhMo2P+eqImCpOUWg1O9A=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable <stable@kernel.org>,
        Stefan Lippers-Hollmann <s.l-h@gmx.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Christoph Hellwig <hch@lst.de>, linux-media@vger.kernel.org,
        linux-modules@vger.kernel.org
Subject: [PATCH] media: dvb: symbol fixup for dvb_attach()
Date:   Fri,  8 Sep 2023 10:20:36 +0100
Message-ID: <20230908092035.3815268-2-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=62915; i=gregkh@linuxfoundation.org; h=from:subject; bh=/LvggepIQ1S3GmMvGuoiame3j1zQuDvtndjum2aPQGw=; b=owGbwMvMwCRo6H6F97bub03G02pJDCm/nie38KuuEGeofuQTFKF2fbJdwB073qUPTj0Ot4r97 fr56/HyjlgWBkEmBlkxRZYv23iO7q84pOhlaHsaZg4rE8gQBi5OAZhIYC7Dgi1n2BOYr1wTOzjp 3HWuCY/9eucc2swwTy37CPfPDxL3K2tuLczbl/Dt4RSmLgA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

In commit 9011e49d54dc ("modules: only allow symbol_get of
EXPORT_SYMBOL_GPL modules") the use of symbol_get is properly restricted
to GPL-only marked symbols.  This interacts oddly with the DVB logic
which only uses dvb_attach() to load the dvb driver which then uses
symbol_get().

Fix this up by properly marking all of the dvb_attach attach symbols as
EXPORT_SYMBOL_GPL().

Fixes: 9011e49d54dc ("modules: only allow symbol_get of EXPORT_SYMBOL_GPL modules")
Cc: stable <stable@kernel.org>
Reported-by: Stefan Lippers-Hollmann <s.l-h@gmx.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: linux-media@vger.kernel.org
Cc: linux-modules@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
Luis, do you want to take this through your tree?  Or Mauro's?  Or I can
take it through mine, it should get to Linus soon as this is causing
regressions in his tree.

thanks,

greg k-h

 drivers/media/dvb-frontends/ascot2e.c             | 2 +-
 drivers/media/dvb-frontends/atbm8830.c            | 2 +-
 drivers/media/dvb-frontends/au8522_dig.c          | 2 +-
 drivers/media/dvb-frontends/bcm3510.c             | 2 +-
 drivers/media/dvb-frontends/cx22700.c             | 2 +-
 drivers/media/dvb-frontends/cx22702.c             | 2 +-
 drivers/media/dvb-frontends/cx24110.c             | 2 +-
 drivers/media/dvb-frontends/cx24113.c             | 2 +-
 drivers/media/dvb-frontends/cx24116.c             | 2 +-
 drivers/media/dvb-frontends/cx24120.c             | 2 +-
 drivers/media/dvb-frontends/cx24123.c             | 2 +-
 drivers/media/dvb-frontends/cxd2820r_core.c       | 2 +-
 drivers/media/dvb-frontends/cxd2841er.c           | 4 ++--
 drivers/media/dvb-frontends/cxd2880/cxd2880_top.c | 2 +-
 drivers/media/dvb-frontends/dib0070.c             | 2 +-
 drivers/media/dvb-frontends/dib0090.c             | 4 ++--
 drivers/media/dvb-frontends/dib3000mb.c           | 2 +-
 drivers/media/dvb-frontends/dib3000mc.c           | 2 +-
 drivers/media/dvb-frontends/dib7000m.c            | 2 +-
 drivers/media/dvb-frontends/dib7000p.c            | 2 +-
 drivers/media/dvb-frontends/dib8000.c             | 2 +-
 drivers/media/dvb-frontends/dib9000.c             | 2 +-
 drivers/media/dvb-frontends/drx39xyj/drxj.c       | 2 +-
 drivers/media/dvb-frontends/drxd_hard.c           | 2 +-
 drivers/media/dvb-frontends/drxk_hard.c           | 2 +-
 drivers/media/dvb-frontends/ds3000.c              | 2 +-
 drivers/media/dvb-frontends/dvb-pll.c             | 2 +-
 drivers/media/dvb-frontends/ec100.c               | 2 +-
 drivers/media/dvb-frontends/helene.c              | 4 ++--
 drivers/media/dvb-frontends/horus3a.c             | 2 +-
 drivers/media/dvb-frontends/isl6405.c             | 2 +-
 drivers/media/dvb-frontends/isl6421.c             | 2 +-
 drivers/media/dvb-frontends/isl6423.c             | 2 +-
 drivers/media/dvb-frontends/itd1000.c             | 2 +-
 drivers/media/dvb-frontends/ix2505v.c             | 2 +-
 drivers/media/dvb-frontends/l64781.c              | 2 +-
 drivers/media/dvb-frontends/lg2160.c              | 2 +-
 drivers/media/dvb-frontends/lgdt3305.c            | 2 +-
 drivers/media/dvb-frontends/lgdt3306a.c           | 2 +-
 drivers/media/dvb-frontends/lgdt330x.c            | 2 +-
 drivers/media/dvb-frontends/lgs8gxx.c             | 2 +-
 drivers/media/dvb-frontends/lnbh25.c              | 2 +-
 drivers/media/dvb-frontends/lnbp21.c              | 4 ++--
 drivers/media/dvb-frontends/lnbp22.c              | 2 +-
 drivers/media/dvb-frontends/m88ds3103.c           | 2 +-
 drivers/media/dvb-frontends/m88rs2000.c           | 2 +-
 drivers/media/dvb-frontends/mb86a16.c             | 2 +-
 drivers/media/dvb-frontends/mb86a20s.c            | 2 +-
 drivers/media/dvb-frontends/mt312.c               | 2 +-
 drivers/media/dvb-frontends/mt352.c               | 2 +-
 drivers/media/dvb-frontends/nxt200x.c             | 2 +-
 drivers/media/dvb-frontends/nxt6000.c             | 2 +-
 drivers/media/dvb-frontends/or51132.c             | 2 +-
 drivers/media/dvb-frontends/or51211.c             | 2 +-
 drivers/media/dvb-frontends/s5h1409.c             | 2 +-
 drivers/media/dvb-frontends/s5h1411.c             | 2 +-
 drivers/media/dvb-frontends/s5h1420.c             | 2 +-
 drivers/media/dvb-frontends/s5h1432.c             | 2 +-
 drivers/media/dvb-frontends/s921.c                | 2 +-
 drivers/media/dvb-frontends/si21xx.c              | 2 +-
 drivers/media/dvb-frontends/sp887x.c              | 2 +-
 drivers/media/dvb-frontends/stb0899_drv.c         | 2 +-
 drivers/media/dvb-frontends/stb6000.c             | 2 +-
 drivers/media/dvb-frontends/stb6100.c             | 2 +-
 drivers/media/dvb-frontends/stv0288.c             | 2 +-
 drivers/media/dvb-frontends/stv0297.c             | 2 +-
 drivers/media/dvb-frontends/stv0299.c             | 2 +-
 drivers/media/dvb-frontends/stv0367.c             | 6 +++---
 drivers/media/dvb-frontends/stv0900_core.c        | 2 +-
 drivers/media/dvb-frontends/stv090x.c             | 2 +-
 drivers/media/dvb-frontends/stv6110.c             | 2 +-
 drivers/media/dvb-frontends/stv6110x.c            | 2 +-
 drivers/media/dvb-frontends/tda10021.c            | 2 +-
 drivers/media/dvb-frontends/tda10023.c            | 2 +-
 drivers/media/dvb-frontends/tda10048.c            | 2 +-
 drivers/media/dvb-frontends/tda1004x.c            | 4 ++--
 drivers/media/dvb-frontends/tda10086.c            | 2 +-
 drivers/media/dvb-frontends/tda665x.c             | 2 +-
 drivers/media/dvb-frontends/tda8083.c             | 2 +-
 drivers/media/dvb-frontends/tda8261.c             | 2 +-
 drivers/media/dvb-frontends/tda826x.c             | 2 +-
 drivers/media/dvb-frontends/ts2020.c              | 2 +-
 drivers/media/dvb-frontends/tua6100.c             | 2 +-
 drivers/media/dvb-frontends/ves1820.c             | 2 +-
 drivers/media/dvb-frontends/ves1x93.c             | 2 +-
 drivers/media/dvb-frontends/zl10036.c             | 2 +-
 drivers/media/dvb-frontends/zl10039.c             | 2 +-
 drivers/media/dvb-frontends/zl10353.c             | 2 +-
 drivers/media/pci/bt8xx/dst.c                     | 2 +-
 drivers/media/pci/bt8xx/dst_ca.c                  | 2 +-
 drivers/media/pci/ddbridge/ddbridge-dummy-fe.c    | 2 +-
 drivers/media/tuners/fc0011.c                     | 2 +-
 drivers/media/tuners/fc0012.c                     | 2 +-
 drivers/media/tuners/fc0013.c                     | 2 +-
 drivers/media/tuners/max2165.c                    | 2 +-
 drivers/media/tuners/mc44s803.c                   | 2 +-
 drivers/media/tuners/mt2060.c                     | 2 +-
 drivers/media/tuners/mt2131.c                     | 2 +-
 drivers/media/tuners/mt2266.c                     | 2 +-
 drivers/media/tuners/mxl5005s.c                   | 2 +-
 drivers/media/tuners/qt1010.c                     | 2 +-
 drivers/media/tuners/tda18218.c                   | 2 +-
 drivers/media/tuners/xc2028.c                     | 2 +-
 drivers/media/tuners/xc4000.c                     | 2 +-
 drivers/media/tuners/xc5000.c                     | 2 +-
 drivers/staging/media/av7110/sp8870.c             | 2 +-
 106 files changed, 113 insertions(+), 113 deletions(-)

diff --git a/drivers/media/dvb-frontends/ascot2e.c b/drivers/media/dvb-frontends/ascot2e.c
index 9b00b56230b6..cf8e5f1bd101 100644
--- a/drivers/media/dvb-frontends/ascot2e.c
+++ b/drivers/media/dvb-frontends/ascot2e.c
@@ -533,7 +533,7 @@ struct dvb_frontend *ascot2e_attach(struct dvb_frontend *fe,
 		priv->i2c_address, priv->i2c);
 	return fe;
 }
-EXPORT_SYMBOL(ascot2e_attach);
+EXPORT_SYMBOL_GPL(ascot2e_attach);
 
 MODULE_DESCRIPTION("Sony ASCOT2E terr/cab tuner driver");
 MODULE_AUTHOR("info@netup.ru");
diff --git a/drivers/media/dvb-frontends/atbm8830.c b/drivers/media/dvb-frontends/atbm8830.c
index bdd16b9c5824..778c865085bf 100644
--- a/drivers/media/dvb-frontends/atbm8830.c
+++ b/drivers/media/dvb-frontends/atbm8830.c
@@ -489,7 +489,7 @@ struct dvb_frontend *atbm8830_attach(const struct atbm8830_config *config,
 	return NULL;
 
 }
-EXPORT_SYMBOL(atbm8830_attach);
+EXPORT_SYMBOL_GPL(atbm8830_attach);
 
 MODULE_DESCRIPTION("AltoBeam ATBM8830/8831 GB20600 demodulator driver");
 MODULE_AUTHOR("David T. L. Wong <davidtlwong@gmail.com>");
diff --git a/drivers/media/dvb-frontends/au8522_dig.c b/drivers/media/dvb-frontends/au8522_dig.c
index 78cafdf27961..230436bf6cbd 100644
--- a/drivers/media/dvb-frontends/au8522_dig.c
+++ b/drivers/media/dvb-frontends/au8522_dig.c
@@ -879,7 +879,7 @@ struct dvb_frontend *au8522_attach(const struct au8522_config *config,
 	au8522_release_state(state);
 	return NULL;
 }
-EXPORT_SYMBOL(au8522_attach);
+EXPORT_SYMBOL_GPL(au8522_attach);
 
 static const struct dvb_frontend_ops au8522_ops = {
 	.delsys = { SYS_ATSC, SYS_DVBC_ANNEX_B },
diff --git a/drivers/media/dvb-frontends/bcm3510.c b/drivers/media/dvb-frontends/bcm3510.c
index 68b92b4419cf..b3f5c49accaf 100644
--- a/drivers/media/dvb-frontends/bcm3510.c
+++ b/drivers/media/dvb-frontends/bcm3510.c
@@ -835,7 +835,7 @@ struct dvb_frontend* bcm3510_attach(const struct bcm3510_config *config,
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(bcm3510_attach);
+EXPORT_SYMBOL_GPL(bcm3510_attach);
 
 static const struct dvb_frontend_ops bcm3510_ops = {
 	.delsys = { SYS_ATSC, SYS_DVBC_ANNEX_B },
diff --git a/drivers/media/dvb-frontends/cx22700.c b/drivers/media/dvb-frontends/cx22700.c
index b39ff516271b..1d04c0a652b2 100644
--- a/drivers/media/dvb-frontends/cx22700.c
+++ b/drivers/media/dvb-frontends/cx22700.c
@@ -432,4 +432,4 @@ MODULE_DESCRIPTION("Conexant CX22700 DVB-T Demodulator driver");
 MODULE_AUTHOR("Holger Waechtler");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(cx22700_attach);
+EXPORT_SYMBOL_GPL(cx22700_attach);
diff --git a/drivers/media/dvb-frontends/cx22702.c b/drivers/media/dvb-frontends/cx22702.c
index cc6acbf6393d..61ad34b7004b 100644
--- a/drivers/media/dvb-frontends/cx22702.c
+++ b/drivers/media/dvb-frontends/cx22702.c
@@ -604,7 +604,7 @@ struct dvb_frontend *cx22702_attach(const struct cx22702_config *config,
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(cx22702_attach);
+EXPORT_SYMBOL_GPL(cx22702_attach);
 
 static const struct dvb_frontend_ops cx22702_ops = {
 	.delsys = { SYS_DVBT },
diff --git a/drivers/media/dvb-frontends/cx24110.c b/drivers/media/dvb-frontends/cx24110.c
index 6f99d6a27be2..9aeea089756f 100644
--- a/drivers/media/dvb-frontends/cx24110.c
+++ b/drivers/media/dvb-frontends/cx24110.c
@@ -653,4 +653,4 @@ MODULE_DESCRIPTION("Conexant CX24110 DVB-S Demodulator driver");
 MODULE_AUTHOR("Peter Hettkamp");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(cx24110_attach);
+EXPORT_SYMBOL_GPL(cx24110_attach);
diff --git a/drivers/media/dvb-frontends/cx24113.c b/drivers/media/dvb-frontends/cx24113.c
index dd55d314bf9a..203cb6b3f941 100644
--- a/drivers/media/dvb-frontends/cx24113.c
+++ b/drivers/media/dvb-frontends/cx24113.c
@@ -590,7 +590,7 @@ struct dvb_frontend *cx24113_attach(struct dvb_frontend *fe,
 
 	return NULL;
 }
-EXPORT_SYMBOL(cx24113_attach);
+EXPORT_SYMBOL_GPL(cx24113_attach);
 
 module_param(debug, int, 0644);
 MODULE_PARM_DESC(debug, "Activates frontend debugging (default:0)");
diff --git a/drivers/media/dvb-frontends/cx24116.c b/drivers/media/dvb-frontends/cx24116.c
index ea8264ccbb4e..8b978a9f74a4 100644
--- a/drivers/media/dvb-frontends/cx24116.c
+++ b/drivers/media/dvb-frontends/cx24116.c
@@ -1133,7 +1133,7 @@ struct dvb_frontend *cx24116_attach(const struct cx24116_config *config,
 	state->frontend.demodulator_priv = state;
 	return &state->frontend;
 }
-EXPORT_SYMBOL(cx24116_attach);
+EXPORT_SYMBOL_GPL(cx24116_attach);
 
 /*
  * Initialise or wake up device
diff --git a/drivers/media/dvb-frontends/cx24120.c b/drivers/media/dvb-frontends/cx24120.c
index 0f778660c72b..44515fdbe91d 100644
--- a/drivers/media/dvb-frontends/cx24120.c
+++ b/drivers/media/dvb-frontends/cx24120.c
@@ -305,7 +305,7 @@ struct dvb_frontend *cx24120_attach(const struct cx24120_config *config,
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(cx24120_attach);
+EXPORT_SYMBOL_GPL(cx24120_attach);
 
 static int cx24120_test_rom(struct cx24120_state *state)
 {
diff --git a/drivers/media/dvb-frontends/cx24123.c b/drivers/media/dvb-frontends/cx24123.c
index 3d84ee17e54c..539889e638cc 100644
--- a/drivers/media/dvb-frontends/cx24123.c
+++ b/drivers/media/dvb-frontends/cx24123.c
@@ -1096,7 +1096,7 @@ struct dvb_frontend *cx24123_attach(const struct cx24123_config *config,
 
 	return NULL;
 }
-EXPORT_SYMBOL(cx24123_attach);
+EXPORT_SYMBOL_GPL(cx24123_attach);
 
 static const struct dvb_frontend_ops cx24123_ops = {
 	.delsys = { SYS_DVBS },
diff --git a/drivers/media/dvb-frontends/cxd2820r_core.c b/drivers/media/dvb-frontends/cxd2820r_core.c
index d7ee294c6833..7feb08dccfa1 100644
--- a/drivers/media/dvb-frontends/cxd2820r_core.c
+++ b/drivers/media/dvb-frontends/cxd2820r_core.c
@@ -536,7 +536,7 @@ struct dvb_frontend *cxd2820r_attach(const struct cxd2820r_config *config,
 
 	return pdata.get_dvb_frontend(client);
 }
-EXPORT_SYMBOL(cxd2820r_attach);
+EXPORT_SYMBOL_GPL(cxd2820r_attach);
 
 static struct dvb_frontend *cxd2820r_get_dvb_frontend(struct i2c_client *client)
 {
diff --git a/drivers/media/dvb-frontends/cxd2841er.c b/drivers/media/dvb-frontends/cxd2841er.c
index ef403a9fb753..d925ca24183b 100644
--- a/drivers/media/dvb-frontends/cxd2841er.c
+++ b/drivers/media/dvb-frontends/cxd2841er.c
@@ -3930,14 +3930,14 @@ struct dvb_frontend *cxd2841er_attach_s(struct cxd2841er_config *cfg,
 {
 	return cxd2841er_attach(cfg, i2c, SYS_DVBS);
 }
-EXPORT_SYMBOL(cxd2841er_attach_s);
+EXPORT_SYMBOL_GPL(cxd2841er_attach_s);
 
 struct dvb_frontend *cxd2841er_attach_t_c(struct cxd2841er_config *cfg,
 					struct i2c_adapter *i2c)
 {
 	return cxd2841er_attach(cfg, i2c, 0);
 }
-EXPORT_SYMBOL(cxd2841er_attach_t_c);
+EXPORT_SYMBOL_GPL(cxd2841er_attach_t_c);
 
 static const struct dvb_frontend_ops cxd2841er_dvbs_s2_ops = {
 	.delsys = { SYS_DVBS, SYS_DVBS2 },
diff --git a/drivers/media/dvb-frontends/cxd2880/cxd2880_top.c b/drivers/media/dvb-frontends/cxd2880/cxd2880_top.c
index f67b6d24b8d4..a06d8368ca79 100644
--- a/drivers/media/dvb-frontends/cxd2880/cxd2880_top.c
+++ b/drivers/media/dvb-frontends/cxd2880/cxd2880_top.c
@@ -1950,7 +1950,7 @@ struct dvb_frontend *cxd2880_attach(struct dvb_frontend *fe,
 
 	return fe;
 }
-EXPORT_SYMBOL(cxd2880_attach);
+EXPORT_SYMBOL_GPL(cxd2880_attach);
 
 MODULE_DESCRIPTION("Sony CXD2880 DVB-T2/T tuner + demod driver");
 MODULE_AUTHOR("Sony Semiconductor Solutions Corporation");
diff --git a/drivers/media/dvb-frontends/dib0070.c b/drivers/media/dvb-frontends/dib0070.c
index cafb41dba861..9a8e7cdd2a24 100644
--- a/drivers/media/dvb-frontends/dib0070.c
+++ b/drivers/media/dvb-frontends/dib0070.c
@@ -762,7 +762,7 @@ struct dvb_frontend *dib0070_attach(struct dvb_frontend *fe, struct i2c_adapter
 	fe->tuner_priv = NULL;
 	return NULL;
 }
-EXPORT_SYMBOL(dib0070_attach);
+EXPORT_SYMBOL_GPL(dib0070_attach);
 
 MODULE_AUTHOR("Patrick Boettcher <patrick.boettcher@posteo.de>");
 MODULE_DESCRIPTION("Driver for the DiBcom 0070 base-band RF Tuner");
diff --git a/drivers/media/dvb-frontends/dib0090.c b/drivers/media/dvb-frontends/dib0090.c
index 903da33642df..c958bcff026e 100644
--- a/drivers/media/dvb-frontends/dib0090.c
+++ b/drivers/media/dvb-frontends/dib0090.c
@@ -2634,7 +2634,7 @@ struct dvb_frontend *dib0090_register(struct dvb_frontend *fe, struct i2c_adapte
 	return NULL;
 }
 
-EXPORT_SYMBOL(dib0090_register);
+EXPORT_SYMBOL_GPL(dib0090_register);
 
 struct dvb_frontend *dib0090_fw_register(struct dvb_frontend *fe, struct i2c_adapter *i2c, const struct dib0090_config *config)
 {
@@ -2660,7 +2660,7 @@ struct dvb_frontend *dib0090_fw_register(struct dvb_frontend *fe, struct i2c_ada
 	fe->tuner_priv = NULL;
 	return NULL;
 }
-EXPORT_SYMBOL(dib0090_fw_register);
+EXPORT_SYMBOL_GPL(dib0090_fw_register);
 
 MODULE_AUTHOR("Patrick Boettcher <patrick.boettcher@posteo.de>");
 MODULE_AUTHOR("Olivier Grenie <olivier.grenie@parrot.com>");
diff --git a/drivers/media/dvb-frontends/dib3000mb.c b/drivers/media/dvb-frontends/dib3000mb.c
index a6c2fc4586eb..c598b2a63325 100644
--- a/drivers/media/dvb-frontends/dib3000mb.c
+++ b/drivers/media/dvb-frontends/dib3000mb.c
@@ -815,4 +815,4 @@ MODULE_AUTHOR(DRIVER_AUTHOR);
 MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(dib3000mb_attach);
+EXPORT_SYMBOL_GPL(dib3000mb_attach);
diff --git a/drivers/media/dvb-frontends/dib3000mc.c b/drivers/media/dvb-frontends/dib3000mc.c
index 2e11a246aae0..c2fca8289aba 100644
--- a/drivers/media/dvb-frontends/dib3000mc.c
+++ b/drivers/media/dvb-frontends/dib3000mc.c
@@ -935,7 +935,7 @@ struct dvb_frontend * dib3000mc_attach(struct i2c_adapter *i2c_adap, u8 i2c_addr
 	kfree(st);
 	return NULL;
 }
-EXPORT_SYMBOL(dib3000mc_attach);
+EXPORT_SYMBOL_GPL(dib3000mc_attach);
 
 static const struct dvb_frontend_ops dib3000mc_ops = {
 	.delsys = { SYS_DVBT },
diff --git a/drivers/media/dvb-frontends/dib7000m.c b/drivers/media/dvb-frontends/dib7000m.c
index 97ce97789c9e..fdb22f32e3a1 100644
--- a/drivers/media/dvb-frontends/dib7000m.c
+++ b/drivers/media/dvb-frontends/dib7000m.c
@@ -1434,7 +1434,7 @@ struct dvb_frontend * dib7000m_attach(struct i2c_adapter *i2c_adap, u8 i2c_addr,
 	kfree(st);
 	return NULL;
 }
-EXPORT_SYMBOL(dib7000m_attach);
+EXPORT_SYMBOL_GPL(dib7000m_attach);
 
 static const struct dvb_frontend_ops dib7000m_ops = {
 	.delsys = { SYS_DVBT },
diff --git a/drivers/media/dvb-frontends/dib7000p.c b/drivers/media/dvb-frontends/dib7000p.c
index 9273758bf140..444fe1c4bf2d 100644
--- a/drivers/media/dvb-frontends/dib7000p.c
+++ b/drivers/media/dvb-frontends/dib7000p.c
@@ -2822,7 +2822,7 @@ void *dib7000p_attach(struct dib7000p_ops *ops)
 
 	return ops;
 }
-EXPORT_SYMBOL(dib7000p_attach);
+EXPORT_SYMBOL_GPL(dib7000p_attach);
 
 static const struct dvb_frontend_ops dib7000p_ops = {
 	.delsys = { SYS_DVBT },
diff --git a/drivers/media/dvb-frontends/dib8000.c b/drivers/media/dvb-frontends/dib8000.c
index 2abda7d1cb6e..2f5165918163 100644
--- a/drivers/media/dvb-frontends/dib8000.c
+++ b/drivers/media/dvb-frontends/dib8000.c
@@ -4527,7 +4527,7 @@ void *dib8000_attach(struct dib8000_ops *ops)
 
 	return ops;
 }
-EXPORT_SYMBOL(dib8000_attach);
+EXPORT_SYMBOL_GPL(dib8000_attach);
 
 MODULE_AUTHOR("Olivier Grenie <Olivier.Grenie@parrot.com, Patrick Boettcher <patrick.boettcher@posteo.de>");
 MODULE_DESCRIPTION("Driver for the DiBcom 8000 ISDB-T demodulator");
diff --git a/drivers/media/dvb-frontends/dib9000.c b/drivers/media/dvb-frontends/dib9000.c
index 1c57587a917a..83cf6eadd49c 100644
--- a/drivers/media/dvb-frontends/dib9000.c
+++ b/drivers/media/dvb-frontends/dib9000.c
@@ -2546,7 +2546,7 @@ struct dvb_frontend *dib9000_attach(struct i2c_adapter *i2c_adap, u8 i2c_addr, c
 	kfree(st);
 	return NULL;
 }
-EXPORT_SYMBOL(dib9000_attach);
+EXPORT_SYMBOL_GPL(dib9000_attach);
 
 static const struct dvb_frontend_ops dib9000_ops = {
 	.delsys = { SYS_DVBT },
diff --git a/drivers/media/dvb-frontends/drx39xyj/drxj.c b/drivers/media/dvb-frontends/drx39xyj/drxj.c
index 68f4e8b5a0ab..a738573c8cd7 100644
--- a/drivers/media/dvb-frontends/drx39xyj/drxj.c
+++ b/drivers/media/dvb-frontends/drx39xyj/drxj.c
@@ -12372,7 +12372,7 @@ struct dvb_frontend *drx39xxj_attach(struct i2c_adapter *i2c)
 
 	return NULL;
 }
-EXPORT_SYMBOL(drx39xxj_attach);
+EXPORT_SYMBOL_GPL(drx39xxj_attach);
 
 static const struct dvb_frontend_ops drx39xxj_ops = {
 	.delsys = { SYS_ATSC, SYS_DVBC_ANNEX_B },
diff --git a/drivers/media/dvb-frontends/drxd_hard.c b/drivers/media/dvb-frontends/drxd_hard.c
index 9860cae65f1c..6a531937f4bb 100644
--- a/drivers/media/dvb-frontends/drxd_hard.c
+++ b/drivers/media/dvb-frontends/drxd_hard.c
@@ -2939,7 +2939,7 @@ struct dvb_frontend *drxd_attach(const struct drxd_config *config,
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(drxd_attach);
+EXPORT_SYMBOL_GPL(drxd_attach);
 
 MODULE_DESCRIPTION("DRXD driver");
 MODULE_AUTHOR("Micronas");
diff --git a/drivers/media/dvb-frontends/drxk_hard.c b/drivers/media/dvb-frontends/drxk_hard.c
index 2770baebbbbc..87f3d4f0eb8c 100644
--- a/drivers/media/dvb-frontends/drxk_hard.c
+++ b/drivers/media/dvb-frontends/drxk_hard.c
@@ -6814,7 +6814,7 @@ struct dvb_frontend *drxk_attach(const struct drxk_config *config,
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(drxk_attach);
+EXPORT_SYMBOL_GPL(drxk_attach);
 
 MODULE_DESCRIPTION("DRX-K driver");
 MODULE_AUTHOR("Ralph Metzler");
diff --git a/drivers/media/dvb-frontends/ds3000.c b/drivers/media/dvb-frontends/ds3000.c
index 20fcf31af165..515aa7c7baf2 100644
--- a/drivers/media/dvb-frontends/ds3000.c
+++ b/drivers/media/dvb-frontends/ds3000.c
@@ -859,7 +859,7 @@ struct dvb_frontend *ds3000_attach(const struct ds3000_config *config,
 	ds3000_set_voltage(&state->frontend, SEC_VOLTAGE_OFF);
 	return &state->frontend;
 }
-EXPORT_SYMBOL(ds3000_attach);
+EXPORT_SYMBOL_GPL(ds3000_attach);
 
 static int ds3000_set_carrier_offset(struct dvb_frontend *fe,
 					s32 carrier_offset_khz)
diff --git a/drivers/media/dvb-frontends/dvb-pll.c b/drivers/media/dvb-frontends/dvb-pll.c
index 90cb41eacf98..ef697ab6bc2e 100644
--- a/drivers/media/dvb-frontends/dvb-pll.c
+++ b/drivers/media/dvb-frontends/dvb-pll.c
@@ -866,7 +866,7 @@ struct dvb_frontend *dvb_pll_attach(struct dvb_frontend *fe, int pll_addr,
 
 	return NULL;
 }
-EXPORT_SYMBOL(dvb_pll_attach);
+EXPORT_SYMBOL_GPL(dvb_pll_attach);
 
 
 static int
diff --git a/drivers/media/dvb-frontends/ec100.c b/drivers/media/dvb-frontends/ec100.c
index 03bd80666cf8..2ad0a3c2f756 100644
--- a/drivers/media/dvb-frontends/ec100.c
+++ b/drivers/media/dvb-frontends/ec100.c
@@ -299,7 +299,7 @@ struct dvb_frontend *ec100_attach(const struct ec100_config *config,
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(ec100_attach);
+EXPORT_SYMBOL_GPL(ec100_attach);
 
 static const struct dvb_frontend_ops ec100_ops = {
 	.delsys = { SYS_DVBT },
diff --git a/drivers/media/dvb-frontends/helene.c b/drivers/media/dvb-frontends/helene.c
index 68c1a3e0e2ba..f127adee3ebb 100644
--- a/drivers/media/dvb-frontends/helene.c
+++ b/drivers/media/dvb-frontends/helene.c
@@ -1025,7 +1025,7 @@ struct dvb_frontend *helene_attach_s(struct dvb_frontend *fe,
 			priv->i2c_address, priv->i2c);
 	return fe;
 }
-EXPORT_SYMBOL(helene_attach_s);
+EXPORT_SYMBOL_GPL(helene_attach_s);
 
 struct dvb_frontend *helene_attach(struct dvb_frontend *fe,
 		const struct helene_config *config,
@@ -1061,7 +1061,7 @@ struct dvb_frontend *helene_attach(struct dvb_frontend *fe,
 			priv->i2c_address, priv->i2c);
 	return fe;
 }
-EXPORT_SYMBOL(helene_attach);
+EXPORT_SYMBOL_GPL(helene_attach);
 
 static int helene_probe(struct i2c_client *client)
 {
diff --git a/drivers/media/dvb-frontends/horus3a.c b/drivers/media/dvb-frontends/horus3a.c
index 24bf5cbcc184..0330b78a5b3f 100644
--- a/drivers/media/dvb-frontends/horus3a.c
+++ b/drivers/media/dvb-frontends/horus3a.c
@@ -395,7 +395,7 @@ struct dvb_frontend *horus3a_attach(struct dvb_frontend *fe,
 		priv->i2c_address, priv->i2c);
 	return fe;
 }
-EXPORT_SYMBOL(horus3a_attach);
+EXPORT_SYMBOL_GPL(horus3a_attach);
 
 MODULE_DESCRIPTION("Sony HORUS3A satellite tuner driver");
 MODULE_AUTHOR("Sergey Kozlov <serjk@netup.ru>");
diff --git a/drivers/media/dvb-frontends/isl6405.c b/drivers/media/dvb-frontends/isl6405.c
index 2cd69b4ff82c..7d28a743f97e 100644
--- a/drivers/media/dvb-frontends/isl6405.c
+++ b/drivers/media/dvb-frontends/isl6405.c
@@ -141,7 +141,7 @@ struct dvb_frontend *isl6405_attach(struct dvb_frontend *fe, struct i2c_adapter
 
 	return fe;
 }
-EXPORT_SYMBOL(isl6405_attach);
+EXPORT_SYMBOL_GPL(isl6405_attach);
 
 MODULE_DESCRIPTION("Driver for lnb supply and control ic isl6405");
 MODULE_AUTHOR("Hartmut Hackmann & Oliver Endriss");
diff --git a/drivers/media/dvb-frontends/isl6421.c b/drivers/media/dvb-frontends/isl6421.c
index 43b0dfc6f453..2e9f6f12f849 100644
--- a/drivers/media/dvb-frontends/isl6421.c
+++ b/drivers/media/dvb-frontends/isl6421.c
@@ -213,7 +213,7 @@ struct dvb_frontend *isl6421_attach(struct dvb_frontend *fe, struct i2c_adapter
 
 	return fe;
 }
-EXPORT_SYMBOL(isl6421_attach);
+EXPORT_SYMBOL_GPL(isl6421_attach);
 
 MODULE_DESCRIPTION("Driver for lnb supply and control ic isl6421");
 MODULE_AUTHOR("Andrew de Quincey & Oliver Endriss");
diff --git a/drivers/media/dvb-frontends/isl6423.c b/drivers/media/dvb-frontends/isl6423.c
index 8cd1bb88ce6e..a0d0a3834057 100644
--- a/drivers/media/dvb-frontends/isl6423.c
+++ b/drivers/media/dvb-frontends/isl6423.c
@@ -289,7 +289,7 @@ struct dvb_frontend *isl6423_attach(struct dvb_frontend *fe,
 	fe->sec_priv = NULL;
 	return NULL;
 }
-EXPORT_SYMBOL(isl6423_attach);
+EXPORT_SYMBOL_GPL(isl6423_attach);
 
 MODULE_DESCRIPTION("ISL6423 SEC");
 MODULE_AUTHOR("Manu Abraham");
diff --git a/drivers/media/dvb-frontends/itd1000.c b/drivers/media/dvb-frontends/itd1000.c
index 1b33478653d1..f8f362f50e78 100644
--- a/drivers/media/dvb-frontends/itd1000.c
+++ b/drivers/media/dvb-frontends/itd1000.c
@@ -389,7 +389,7 @@ struct dvb_frontend *itd1000_attach(struct dvb_frontend *fe, struct i2c_adapter
 
 	return fe;
 }
-EXPORT_SYMBOL(itd1000_attach);
+EXPORT_SYMBOL_GPL(itd1000_attach);
 
 MODULE_AUTHOR("Patrick Boettcher <pb@linuxtv.org>");
 MODULE_DESCRIPTION("Integrant ITD1000 driver");
diff --git a/drivers/media/dvb-frontends/ix2505v.c b/drivers/media/dvb-frontends/ix2505v.c
index 73f27105c139..3212e333d472 100644
--- a/drivers/media/dvb-frontends/ix2505v.c
+++ b/drivers/media/dvb-frontends/ix2505v.c
@@ -302,7 +302,7 @@ struct dvb_frontend *ix2505v_attach(struct dvb_frontend *fe,
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(ix2505v_attach);
+EXPORT_SYMBOL_GPL(ix2505v_attach);
 
 module_param_named(debug, ix2505v_debug, int, 0644);
 MODULE_PARM_DESC(debug, "Turn on/off frontend debugging (default:off).");
diff --git a/drivers/media/dvb-frontends/l64781.c b/drivers/media/dvb-frontends/l64781.c
index c5106a1ea1cd..fe5af2453d55 100644
--- a/drivers/media/dvb-frontends/l64781.c
+++ b/drivers/media/dvb-frontends/l64781.c
@@ -593,4 +593,4 @@ MODULE_DESCRIPTION("LSI L64781 DVB-T Demodulator driver");
 MODULE_AUTHOR("Holger Waechtler, Marko Kohtala");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(l64781_attach);
+EXPORT_SYMBOL_GPL(l64781_attach);
diff --git a/drivers/media/dvb-frontends/lg2160.c b/drivers/media/dvb-frontends/lg2160.c
index f343066c297e..fe700aa56bff 100644
--- a/drivers/media/dvb-frontends/lg2160.c
+++ b/drivers/media/dvb-frontends/lg2160.c
@@ -1426,7 +1426,7 @@ struct dvb_frontend *lg2160_attach(const struct lg2160_config *config,
 
 	return &state->frontend;
 }
-EXPORT_SYMBOL(lg2160_attach);
+EXPORT_SYMBOL_GPL(lg2160_attach);
 
 MODULE_DESCRIPTION("LG Electronics LG216x ATSC/MH Demodulator Driver");
 MODULE_AUTHOR("Michael Krufky <mkrufky@linuxtv.org>");
diff --git a/drivers/media/dvb-frontends/lgdt3305.c b/drivers/media/dvb-frontends/lgdt3305.c
index c15d3735d34c..bdc8311e1c0b 100644
--- a/drivers/media/dvb-frontends/lgdt3305.c
+++ b/drivers/media/dvb-frontends/lgdt3305.c
@@ -1148,7 +1148,7 @@ struct dvb_frontend *lgdt3305_attach(const struct lgdt3305_config *config,
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(lgdt3305_attach);
+EXPORT_SYMBOL_GPL(lgdt3305_attach);
 
 static const struct dvb_frontend_ops lgdt3304_ops = {
 	.delsys = { SYS_ATSC, SYS_DVBC_ANNEX_B },
diff --git a/drivers/media/dvb-frontends/lgdt3306a.c b/drivers/media/dvb-frontends/lgdt3306a.c
index 3c6650f6e9a3..263887592415 100644
--- a/drivers/media/dvb-frontends/lgdt3306a.c
+++ b/drivers/media/dvb-frontends/lgdt3306a.c
@@ -1859,7 +1859,7 @@ struct dvb_frontend *lgdt3306a_attach(const struct lgdt3306a_config *config,
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(lgdt3306a_attach);
+EXPORT_SYMBOL_GPL(lgdt3306a_attach);
 
 #ifdef DBG_DUMP
 
diff --git a/drivers/media/dvb-frontends/lgdt330x.c b/drivers/media/dvb-frontends/lgdt330x.c
index 97a10996c7fa..081d6ad3ce72 100644
--- a/drivers/media/dvb-frontends/lgdt330x.c
+++ b/drivers/media/dvb-frontends/lgdt330x.c
@@ -927,7 +927,7 @@ struct dvb_frontend *lgdt330x_attach(const struct lgdt330x_config *_config,
 
 	return lgdt330x_get_dvb_frontend(client);
 }
-EXPORT_SYMBOL(lgdt330x_attach);
+EXPORT_SYMBOL_GPL(lgdt330x_attach);
 
 static const struct dvb_frontend_ops lgdt3302_ops = {
 	.delsys = { SYS_ATSC, SYS_DVBC_ANNEX_B },
diff --git a/drivers/media/dvb-frontends/lgs8gxx.c b/drivers/media/dvb-frontends/lgs8gxx.c
index 30014979b985..ffaf60e16ecd 100644
--- a/drivers/media/dvb-frontends/lgs8gxx.c
+++ b/drivers/media/dvb-frontends/lgs8gxx.c
@@ -1043,7 +1043,7 @@ struct dvb_frontend *lgs8gxx_attach(const struct lgs8gxx_config *config,
 	return NULL;
 
 }
-EXPORT_SYMBOL(lgs8gxx_attach);
+EXPORT_SYMBOL_GPL(lgs8gxx_attach);
 
 MODULE_DESCRIPTION("Legend Silicon LGS8913/LGS8GXX DMB-TH demodulator driver");
 MODULE_AUTHOR("David T. L. Wong <davidtlwong@gmail.com>");
diff --git a/drivers/media/dvb-frontends/lnbh25.c b/drivers/media/dvb-frontends/lnbh25.c
index 9ffe06cd787d..41bec050642b 100644
--- a/drivers/media/dvb-frontends/lnbh25.c
+++ b/drivers/media/dvb-frontends/lnbh25.c
@@ -173,7 +173,7 @@ struct dvb_frontend *lnbh25_attach(struct dvb_frontend *fe,
 		__func__, priv->i2c_address);
 	return fe;
 }
-EXPORT_SYMBOL(lnbh25_attach);
+EXPORT_SYMBOL_GPL(lnbh25_attach);
 
 MODULE_DESCRIPTION("ST LNBH25 driver");
 MODULE_AUTHOR("info@netup.ru");
diff --git a/drivers/media/dvb-frontends/lnbp21.c b/drivers/media/dvb-frontends/lnbp21.c
index e564974162d6..32593b1f75a3 100644
--- a/drivers/media/dvb-frontends/lnbp21.c
+++ b/drivers/media/dvb-frontends/lnbp21.c
@@ -155,7 +155,7 @@ struct dvb_frontend *lnbh24_attach(struct dvb_frontend *fe,
 	return lnbx2x_attach(fe, i2c, override_set, override_clear,
 							i2c_addr, LNBH24_TTX);
 }
-EXPORT_SYMBOL(lnbh24_attach);
+EXPORT_SYMBOL_GPL(lnbh24_attach);
 
 struct dvb_frontend *lnbp21_attach(struct dvb_frontend *fe,
 				struct i2c_adapter *i2c, u8 override_set,
@@ -164,7 +164,7 @@ struct dvb_frontend *lnbp21_attach(struct dvb_frontend *fe,
 	return lnbx2x_attach(fe, i2c, override_set, override_clear,
 							0x08, LNBP21_ISEL);
 }
-EXPORT_SYMBOL(lnbp21_attach);
+EXPORT_SYMBOL_GPL(lnbp21_attach);
 
 MODULE_DESCRIPTION("Driver for lnb supply and control ic lnbp21, lnbh24");
 MODULE_AUTHOR("Oliver Endriss, Igor M. Liplianin");
diff --git a/drivers/media/dvb-frontends/lnbp22.c b/drivers/media/dvb-frontends/lnbp22.c
index b8c7145d4cef..cb4ea5d3fad4 100644
--- a/drivers/media/dvb-frontends/lnbp22.c
+++ b/drivers/media/dvb-frontends/lnbp22.c
@@ -125,7 +125,7 @@ struct dvb_frontend *lnbp22_attach(struct dvb_frontend *fe,
 
 	return fe;
 }
-EXPORT_SYMBOL(lnbp22_attach);
+EXPORT_SYMBOL_GPL(lnbp22_attach);
 
 MODULE_DESCRIPTION("Driver for lnb supply and control ic lnbp22");
 MODULE_AUTHOR("Dominik Kuhlen");
diff --git a/drivers/media/dvb-frontends/m88ds3103.c b/drivers/media/dvb-frontends/m88ds3103.c
index cf49ac56a37e..cf037b61b226 100644
--- a/drivers/media/dvb-frontends/m88ds3103.c
+++ b/drivers/media/dvb-frontends/m88ds3103.c
@@ -1695,7 +1695,7 @@ struct dvb_frontend *m88ds3103_attach(const struct m88ds3103_config *cfg,
 	*tuner_i2c_adapter = pdata.get_i2c_adapter(client);
 	return pdata.get_dvb_frontend(client);
 }
-EXPORT_SYMBOL(m88ds3103_attach);
+EXPORT_SYMBOL_GPL(m88ds3103_attach);
 
 static const struct dvb_frontend_ops m88ds3103_ops = {
 	.delsys = {SYS_DVBS, SYS_DVBS2},
diff --git a/drivers/media/dvb-frontends/m88rs2000.c b/drivers/media/dvb-frontends/m88rs2000.c
index b294ba87e934..2aa98203cd65 100644
--- a/drivers/media/dvb-frontends/m88rs2000.c
+++ b/drivers/media/dvb-frontends/m88rs2000.c
@@ -808,7 +808,7 @@ struct dvb_frontend *m88rs2000_attach(const struct m88rs2000_config *config,
 
 	return NULL;
 }
-EXPORT_SYMBOL(m88rs2000_attach);
+EXPORT_SYMBOL_GPL(m88rs2000_attach);
 
 MODULE_DESCRIPTION("M88RS2000 DVB-S Demodulator driver");
 MODULE_AUTHOR("Malcolm Priestley tvboxspy@gmail.com");
diff --git a/drivers/media/dvb-frontends/mb86a16.c b/drivers/media/dvb-frontends/mb86a16.c
index 3ec2cb4fa504..0fc45896e7b8 100644
--- a/drivers/media/dvb-frontends/mb86a16.c
+++ b/drivers/media/dvb-frontends/mb86a16.c
@@ -1853,6 +1853,6 @@ struct dvb_frontend *mb86a16_attach(const struct mb86a16_config *config,
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(mb86a16_attach);
+EXPORT_SYMBOL_GPL(mb86a16_attach);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Manu Abraham");
diff --git a/drivers/media/dvb-frontends/mb86a20s.c b/drivers/media/dvb-frontends/mb86a20s.c
index 125fed4891ba..f8e4bbee5bd5 100644
--- a/drivers/media/dvb-frontends/mb86a20s.c
+++ b/drivers/media/dvb-frontends/mb86a20s.c
@@ -2078,7 +2078,7 @@ struct dvb_frontend *mb86a20s_attach(const struct mb86a20s_config *config,
 	dev_info(&i2c->dev, "Detected a Fujitsu mb86a20s frontend\n");
 	return &state->frontend;
 }
-EXPORT_SYMBOL(mb86a20s_attach);
+EXPORT_SYMBOL_GPL(mb86a20s_attach);
 
 static const struct dvb_frontend_ops mb86a20s_ops = {
 	.delsys = { SYS_ISDBT },
diff --git a/drivers/media/dvb-frontends/mt312.c b/drivers/media/dvb-frontends/mt312.c
index d43a67045dbe..fb867dd8a26b 100644
--- a/drivers/media/dvb-frontends/mt312.c
+++ b/drivers/media/dvb-frontends/mt312.c
@@ -827,7 +827,7 @@ struct dvb_frontend *mt312_attach(const struct mt312_config *config,
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(mt312_attach);
+EXPORT_SYMBOL_GPL(mt312_attach);
 
 module_param(debug, int, 0644);
 MODULE_PARM_DESC(debug, "Turn on/off frontend debugging (default:off).");
diff --git a/drivers/media/dvb-frontends/mt352.c b/drivers/media/dvb-frontends/mt352.c
index 399d5c519027..1b2889f5cf67 100644
--- a/drivers/media/dvb-frontends/mt352.c
+++ b/drivers/media/dvb-frontends/mt352.c
@@ -593,4 +593,4 @@ MODULE_DESCRIPTION("Zarlink MT352 DVB-T Demodulator driver");
 MODULE_AUTHOR("Holger Waechtler, Daniel Mack, Antonio Mancuso");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(mt352_attach);
+EXPORT_SYMBOL_GPL(mt352_attach);
diff --git a/drivers/media/dvb-frontends/nxt200x.c b/drivers/media/dvb-frontends/nxt200x.c
index 200b6dbc75f8..1c549ada6ebf 100644
--- a/drivers/media/dvb-frontends/nxt200x.c
+++ b/drivers/media/dvb-frontends/nxt200x.c
@@ -1216,5 +1216,5 @@ MODULE_DESCRIPTION("NXT200X (ATSC 8VSB & ITU-T J.83 AnnexB 64/256 QAM) Demodulat
 MODULE_AUTHOR("Kirk Lapray, Michael Krufky, Jean-Francois Thibert, and Taylor Jacob");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(nxt200x_attach);
+EXPORT_SYMBOL_GPL(nxt200x_attach);
 
diff --git a/drivers/media/dvb-frontends/nxt6000.c b/drivers/media/dvb-frontends/nxt6000.c
index 136918f82dda..e8d4940370dd 100644
--- a/drivers/media/dvb-frontends/nxt6000.c
+++ b/drivers/media/dvb-frontends/nxt6000.c
@@ -621,4 +621,4 @@ MODULE_DESCRIPTION("NxtWave NXT6000 DVB-T demodulator driver");
 MODULE_AUTHOR("Florian Schirmer");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(nxt6000_attach);
+EXPORT_SYMBOL_GPL(nxt6000_attach);
diff --git a/drivers/media/dvb-frontends/or51132.c b/drivers/media/dvb-frontends/or51132.c
index 355f3598627b..74e04c7cca1e 100644
--- a/drivers/media/dvb-frontends/or51132.c
+++ b/drivers/media/dvb-frontends/or51132.c
@@ -605,4 +605,4 @@ MODULE_AUTHOR("Kirk Lapray");
 MODULE_AUTHOR("Trent Piepho");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(or51132_attach);
+EXPORT_SYMBOL_GPL(or51132_attach);
diff --git a/drivers/media/dvb-frontends/or51211.c b/drivers/media/dvb-frontends/or51211.c
index ae732dc5116e..2e8e7071a67a 100644
--- a/drivers/media/dvb-frontends/or51211.c
+++ b/drivers/media/dvb-frontends/or51211.c
@@ -551,5 +551,5 @@ MODULE_DESCRIPTION("Oren OR51211 VSB [pcHDTV HD-2000] Demodulator Driver");
 MODULE_AUTHOR("Kirk Lapray");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(or51211_attach);
+EXPORT_SYMBOL_GPL(or51211_attach);
 
diff --git a/drivers/media/dvb-frontends/s5h1409.c b/drivers/media/dvb-frontends/s5h1409.c
index 3089cc174a6f..28b1dca077ea 100644
--- a/drivers/media/dvb-frontends/s5h1409.c
+++ b/drivers/media/dvb-frontends/s5h1409.c
@@ -981,7 +981,7 @@ struct dvb_frontend *s5h1409_attach(const struct s5h1409_config *config,
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(s5h1409_attach);
+EXPORT_SYMBOL_GPL(s5h1409_attach);
 
 static const struct dvb_frontend_ops s5h1409_ops = {
 	.delsys = { SYS_ATSC, SYS_DVBC_ANNEX_B },
diff --git a/drivers/media/dvb-frontends/s5h1411.c b/drivers/media/dvb-frontends/s5h1411.c
index 2563a72e98b7..fc48e659c2d8 100644
--- a/drivers/media/dvb-frontends/s5h1411.c
+++ b/drivers/media/dvb-frontends/s5h1411.c
@@ -900,7 +900,7 @@ struct dvb_frontend *s5h1411_attach(const struct s5h1411_config *config,
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(s5h1411_attach);
+EXPORT_SYMBOL_GPL(s5h1411_attach);
 
 static const struct dvb_frontend_ops s5h1411_ops = {
 	.delsys = { SYS_ATSC, SYS_DVBC_ANNEX_B },
diff --git a/drivers/media/dvb-frontends/s5h1420.c b/drivers/media/dvb-frontends/s5h1420.c
index 6bdec2898bc8..d700de1ea6c2 100644
--- a/drivers/media/dvb-frontends/s5h1420.c
+++ b/drivers/media/dvb-frontends/s5h1420.c
@@ -918,7 +918,7 @@ struct dvb_frontend *s5h1420_attach(const struct s5h1420_config *config,
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(s5h1420_attach);
+EXPORT_SYMBOL_GPL(s5h1420_attach);
 
 static const struct dvb_frontend_ops s5h1420_ops = {
 	.delsys = { SYS_DVBS },
diff --git a/drivers/media/dvb-frontends/s5h1432.c b/drivers/media/dvb-frontends/s5h1432.c
index 956e8ee4b388..ff5d3bdf3bc6 100644
--- a/drivers/media/dvb-frontends/s5h1432.c
+++ b/drivers/media/dvb-frontends/s5h1432.c
@@ -355,7 +355,7 @@ struct dvb_frontend *s5h1432_attach(const struct s5h1432_config *config,
 
 	return &state->frontend;
 }
-EXPORT_SYMBOL(s5h1432_attach);
+EXPORT_SYMBOL_GPL(s5h1432_attach);
 
 static const struct dvb_frontend_ops s5h1432_ops = {
 	.delsys = { SYS_DVBT },
diff --git a/drivers/media/dvb-frontends/s921.c b/drivers/media/dvb-frontends/s921.c
index f118d8e64103..7e461ac159fc 100644
--- a/drivers/media/dvb-frontends/s921.c
+++ b/drivers/media/dvb-frontends/s921.c
@@ -495,7 +495,7 @@ struct dvb_frontend *s921_attach(const struct s921_config *config,
 
 	return &state->frontend;
 }
-EXPORT_SYMBOL(s921_attach);
+EXPORT_SYMBOL_GPL(s921_attach);
 
 static const struct dvb_frontend_ops s921_ops = {
 	.delsys = { SYS_ISDBT },
diff --git a/drivers/media/dvb-frontends/si21xx.c b/drivers/media/dvb-frontends/si21xx.c
index 2d29d2c4d434..210ccd356e2b 100644
--- a/drivers/media/dvb-frontends/si21xx.c
+++ b/drivers/media/dvb-frontends/si21xx.c
@@ -937,7 +937,7 @@ struct dvb_frontend *si21xx_attach(const struct si21xx_config *config,
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(si21xx_attach);
+EXPORT_SYMBOL_GPL(si21xx_attach);
 
 module_param(debug, int, 0644);
 MODULE_PARM_DESC(debug, "Turn on/off frontend debugging (default:off).");
diff --git a/drivers/media/dvb-frontends/sp887x.c b/drivers/media/dvb-frontends/sp887x.c
index 146e7f2dd3c5..f59c0f96416b 100644
--- a/drivers/media/dvb-frontends/sp887x.c
+++ b/drivers/media/dvb-frontends/sp887x.c
@@ -624,4 +624,4 @@ MODULE_PARM_DESC(debug, "Turn on/off frontend debugging (default:off).");
 MODULE_DESCRIPTION("Spase sp887x DVB-T demodulator driver");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(sp887x_attach);
+EXPORT_SYMBOL_GPL(sp887x_attach);
diff --git a/drivers/media/dvb-frontends/stb0899_drv.c b/drivers/media/dvb-frontends/stb0899_drv.c
index 4ee6c1e1e9f7..2f4d8fb400cd 100644
--- a/drivers/media/dvb-frontends/stb0899_drv.c
+++ b/drivers/media/dvb-frontends/stb0899_drv.c
@@ -1638,7 +1638,7 @@ struct dvb_frontend *stb0899_attach(struct stb0899_config *config, struct i2c_ad
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(stb0899_attach);
+EXPORT_SYMBOL_GPL(stb0899_attach);
 MODULE_PARM_DESC(verbose, "Set Verbosity level");
 MODULE_AUTHOR("Manu Abraham");
 MODULE_DESCRIPTION("STB0899 Multi-Std frontend");
diff --git a/drivers/media/dvb-frontends/stb6000.c b/drivers/media/dvb-frontends/stb6000.c
index 8c9800d577e0..d74e34677b92 100644
--- a/drivers/media/dvb-frontends/stb6000.c
+++ b/drivers/media/dvb-frontends/stb6000.c
@@ -232,7 +232,7 @@ struct dvb_frontend *stb6000_attach(struct dvb_frontend *fe, int addr,
 
 	return fe;
 }
-EXPORT_SYMBOL(stb6000_attach);
+EXPORT_SYMBOL_GPL(stb6000_attach);
 
 module_param(debug, int, 0644);
 MODULE_PARM_DESC(debug, "Turn on/off frontend debugging (default:off).");
diff --git a/drivers/media/dvb-frontends/stb6100.c b/drivers/media/dvb-frontends/stb6100.c
index 698866c4f15a..c5818a15a0d7 100644
--- a/drivers/media/dvb-frontends/stb6100.c
+++ b/drivers/media/dvb-frontends/stb6100.c
@@ -557,7 +557,7 @@ static void stb6100_release(struct dvb_frontend *fe)
 	kfree(state);
 }
 
-EXPORT_SYMBOL(stb6100_attach);
+EXPORT_SYMBOL_GPL(stb6100_attach);
 MODULE_PARM_DESC(verbose, "Set Verbosity level");
 
 MODULE_AUTHOR("Manu Abraham");
diff --git a/drivers/media/dvb-frontends/stv0288.c b/drivers/media/dvb-frontends/stv0288.c
index 3ae1f3a2f142..a5581bd60f9e 100644
--- a/drivers/media/dvb-frontends/stv0288.c
+++ b/drivers/media/dvb-frontends/stv0288.c
@@ -590,7 +590,7 @@ struct dvb_frontend *stv0288_attach(const struct stv0288_config *config,
 
 	return NULL;
 }
-EXPORT_SYMBOL(stv0288_attach);
+EXPORT_SYMBOL_GPL(stv0288_attach);
 
 module_param(debug_legacy_dish_switch, int, 0444);
 MODULE_PARM_DESC(debug_legacy_dish_switch,
diff --git a/drivers/media/dvb-frontends/stv0297.c b/drivers/media/dvb-frontends/stv0297.c
index 6d5962d5697a..9d4dbd99a5a7 100644
--- a/drivers/media/dvb-frontends/stv0297.c
+++ b/drivers/media/dvb-frontends/stv0297.c
@@ -710,4 +710,4 @@ MODULE_DESCRIPTION("ST STV0297 DVB-C Demodulator driver");
 MODULE_AUTHOR("Dennis Noermann and Andrew de Quincey");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(stv0297_attach);
+EXPORT_SYMBOL_GPL(stv0297_attach);
diff --git a/drivers/media/dvb-frontends/stv0299.c b/drivers/media/dvb-frontends/stv0299.c
index b5263a0ee5aa..da7ff2c2e8e5 100644
--- a/drivers/media/dvb-frontends/stv0299.c
+++ b/drivers/media/dvb-frontends/stv0299.c
@@ -752,4 +752,4 @@ MODULE_DESCRIPTION("ST STV0299 DVB Demodulator driver");
 MODULE_AUTHOR("Ralph Metzler, Holger Waechtler, Peter Schildmann, Felix Domke, Andreas Oberritter, Andrew de Quincey, Kenneth Aafly");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(stv0299_attach);
+EXPORT_SYMBOL_GPL(stv0299_attach);
diff --git a/drivers/media/dvb-frontends/stv0367.c b/drivers/media/dvb-frontends/stv0367.c
index a93f40617469..48326434488c 100644
--- a/drivers/media/dvb-frontends/stv0367.c
+++ b/drivers/media/dvb-frontends/stv0367.c
@@ -1750,7 +1750,7 @@ struct dvb_frontend *stv0367ter_attach(const struct stv0367_config *config,
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(stv0367ter_attach);
+EXPORT_SYMBOL_GPL(stv0367ter_attach);
 
 static int stv0367cab_gate_ctrl(struct dvb_frontend *fe, int enable)
 {
@@ -2919,7 +2919,7 @@ struct dvb_frontend *stv0367cab_attach(const struct stv0367_config *config,
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(stv0367cab_attach);
+EXPORT_SYMBOL_GPL(stv0367cab_attach);
 
 /*
  * Functions for operation on Digital Devices hardware
@@ -3340,7 +3340,7 @@ struct dvb_frontend *stv0367ddb_attach(const struct stv0367_config *config,
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(stv0367ddb_attach);
+EXPORT_SYMBOL_GPL(stv0367ddb_attach);
 
 MODULE_PARM_DESC(debug, "Set debug");
 MODULE_PARM_DESC(i2c_debug, "Set i2c debug");
diff --git a/drivers/media/dvb-frontends/stv0900_core.c b/drivers/media/dvb-frontends/stv0900_core.c
index 212312d20ff6..e7b9b9b11d7d 100644
--- a/drivers/media/dvb-frontends/stv0900_core.c
+++ b/drivers/media/dvb-frontends/stv0900_core.c
@@ -1957,7 +1957,7 @@ struct dvb_frontend *stv0900_attach(const struct stv0900_config *config,
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(stv0900_attach);
+EXPORT_SYMBOL_GPL(stv0900_attach);
 
 MODULE_PARM_DESC(debug, "Set debug");
 
diff --git a/drivers/media/dvb-frontends/stv090x.c b/drivers/media/dvb-frontends/stv090x.c
index a07dc5fdeb3d..cc45139057ba 100644
--- a/drivers/media/dvb-frontends/stv090x.c
+++ b/drivers/media/dvb-frontends/stv090x.c
@@ -5071,7 +5071,7 @@ struct dvb_frontend *stv090x_attach(struct stv090x_config *config,
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(stv090x_attach);
+EXPORT_SYMBOL_GPL(stv090x_attach);
 
 static const struct i2c_device_id stv090x_id_table[] = {
 	{"stv090x", 0},
diff --git a/drivers/media/dvb-frontends/stv6110.c b/drivers/media/dvb-frontends/stv6110.c
index 963f6a896102..1cf9c095dbff 100644
--- a/drivers/media/dvb-frontends/stv6110.c
+++ b/drivers/media/dvb-frontends/stv6110.c
@@ -427,7 +427,7 @@ struct dvb_frontend *stv6110_attach(struct dvb_frontend *fe,
 
 	return fe;
 }
-EXPORT_SYMBOL(stv6110_attach);
+EXPORT_SYMBOL_GPL(stv6110_attach);
 
 module_param(debug, int, 0644);
 MODULE_PARM_DESC(debug, "Turn on/off frontend debugging (default:off).");
diff --git a/drivers/media/dvb-frontends/stv6110x.c b/drivers/media/dvb-frontends/stv6110x.c
index 11653f846c12..c678f47d2449 100644
--- a/drivers/media/dvb-frontends/stv6110x.c
+++ b/drivers/media/dvb-frontends/stv6110x.c
@@ -467,7 +467,7 @@ const struct stv6110x_devctl *stv6110x_attach(struct dvb_frontend *fe,
 	dev_info(&stv6110x->i2c->dev, "Attaching STV6110x\n");
 	return stv6110x->devctl;
 }
-EXPORT_SYMBOL(stv6110x_attach);
+EXPORT_SYMBOL_GPL(stv6110x_attach);
 
 static const struct i2c_device_id stv6110x_id_table[] = {
 	{"stv6110x", 0},
diff --git a/drivers/media/dvb-frontends/tda10021.c b/drivers/media/dvb-frontends/tda10021.c
index faa6e54b3372..462e12ab6bd1 100644
--- a/drivers/media/dvb-frontends/tda10021.c
+++ b/drivers/media/dvb-frontends/tda10021.c
@@ -523,4 +523,4 @@ MODULE_DESCRIPTION("Philips TDA10021 DVB-C demodulator driver");
 MODULE_AUTHOR("Ralph Metzler, Holger Waechtler, Markus Schulz");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(tda10021_attach);
+EXPORT_SYMBOL_GPL(tda10021_attach);
diff --git a/drivers/media/dvb-frontends/tda10023.c b/drivers/media/dvb-frontends/tda10023.c
index 8f32edf6b700..4c2541ecd743 100644
--- a/drivers/media/dvb-frontends/tda10023.c
+++ b/drivers/media/dvb-frontends/tda10023.c
@@ -594,4 +594,4 @@ MODULE_DESCRIPTION("Philips TDA10023 DVB-C demodulator driver");
 MODULE_AUTHOR("Georg Acher, Hartmut Birr");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(tda10023_attach);
+EXPORT_SYMBOL_GPL(tda10023_attach);
diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/media/dvb-frontends/tda10048.c
index 3cb4e5270e4f..5d5e4e9e4422 100644
--- a/drivers/media/dvb-frontends/tda10048.c
+++ b/drivers/media/dvb-frontends/tda10048.c
@@ -1138,7 +1138,7 @@ struct dvb_frontend *tda10048_attach(const struct tda10048_config *config,
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(tda10048_attach);
+EXPORT_SYMBOL_GPL(tda10048_attach);
 
 static const struct dvb_frontend_ops tda10048_ops = {
 	.delsys = { SYS_DVBT },
diff --git a/drivers/media/dvb-frontends/tda1004x.c b/drivers/media/dvb-frontends/tda1004x.c
index 83a798ca9b00..6f306db6c615 100644
--- a/drivers/media/dvb-frontends/tda1004x.c
+++ b/drivers/media/dvb-frontends/tda1004x.c
@@ -1378,5 +1378,5 @@ MODULE_DESCRIPTION("Philips TDA10045H & TDA10046H DVB-T Demodulator");
 MODULE_AUTHOR("Andrew de Quincey & Robert Schlabbach");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(tda10045_attach);
-EXPORT_SYMBOL(tda10046_attach);
+EXPORT_SYMBOL_GPL(tda10045_attach);
+EXPORT_SYMBOL_GPL(tda10046_attach);
diff --git a/drivers/media/dvb-frontends/tda10086.c b/drivers/media/dvb-frontends/tda10086.c
index cdcf97664bba..b449514ae585 100644
--- a/drivers/media/dvb-frontends/tda10086.c
+++ b/drivers/media/dvb-frontends/tda10086.c
@@ -764,4 +764,4 @@ MODULE_DESCRIPTION("Philips TDA10086 DVB-S Demodulator");
 MODULE_AUTHOR("Andrew de Quincey");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(tda10086_attach);
+EXPORT_SYMBOL_GPL(tda10086_attach);
diff --git a/drivers/media/dvb-frontends/tda665x.c b/drivers/media/dvb-frontends/tda665x.c
index 13e8969da7f8..346be5011fb7 100644
--- a/drivers/media/dvb-frontends/tda665x.c
+++ b/drivers/media/dvb-frontends/tda665x.c
@@ -227,7 +227,7 @@ struct dvb_frontend *tda665x_attach(struct dvb_frontend *fe,
 
 	return fe;
 }
-EXPORT_SYMBOL(tda665x_attach);
+EXPORT_SYMBOL_GPL(tda665x_attach);
 
 MODULE_DESCRIPTION("TDA665x driver");
 MODULE_AUTHOR("Manu Abraham");
diff --git a/drivers/media/dvb-frontends/tda8083.c b/drivers/media/dvb-frontends/tda8083.c
index e3e1c3db2c85..44f53624557b 100644
--- a/drivers/media/dvb-frontends/tda8083.c
+++ b/drivers/media/dvb-frontends/tda8083.c
@@ -481,4 +481,4 @@ MODULE_DESCRIPTION("Philips TDA8083 DVB-S Demodulator");
 MODULE_AUTHOR("Ralph Metzler, Holger Waechtler");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(tda8083_attach);
+EXPORT_SYMBOL_GPL(tda8083_attach);
diff --git a/drivers/media/dvb-frontends/tda8261.c b/drivers/media/dvb-frontends/tda8261.c
index 0d576d41c67d..8b06f92745dc 100644
--- a/drivers/media/dvb-frontends/tda8261.c
+++ b/drivers/media/dvb-frontends/tda8261.c
@@ -188,7 +188,7 @@ struct dvb_frontend *tda8261_attach(struct dvb_frontend *fe,
 	return NULL;
 }
 
-EXPORT_SYMBOL(tda8261_attach);
+EXPORT_SYMBOL_GPL(tda8261_attach);
 
 MODULE_AUTHOR("Manu Abraham");
 MODULE_DESCRIPTION("TDA8261 8PSK/QPSK Tuner");
diff --git a/drivers/media/dvb-frontends/tda826x.c b/drivers/media/dvb-frontends/tda826x.c
index f9703a1dd758..eafcf5f7da3d 100644
--- a/drivers/media/dvb-frontends/tda826x.c
+++ b/drivers/media/dvb-frontends/tda826x.c
@@ -164,7 +164,7 @@ struct dvb_frontend *tda826x_attach(struct dvb_frontend *fe, int addr, struct i2
 
 	return fe;
 }
-EXPORT_SYMBOL(tda826x_attach);
+EXPORT_SYMBOL_GPL(tda826x_attach);
 
 module_param(debug, int, 0644);
 MODULE_PARM_DESC(debug, "Turn on/off frontend debugging (default:off).");
diff --git a/drivers/media/dvb-frontends/ts2020.c b/drivers/media/dvb-frontends/ts2020.c
index f5b60f827697..a5ebce57f35e 100644
--- a/drivers/media/dvb-frontends/ts2020.c
+++ b/drivers/media/dvb-frontends/ts2020.c
@@ -525,7 +525,7 @@ struct dvb_frontend *ts2020_attach(struct dvb_frontend *fe,
 
 	return fe;
 }
-EXPORT_SYMBOL(ts2020_attach);
+EXPORT_SYMBOL_GPL(ts2020_attach);
 
 /*
  * We implement own regmap locking due to legacy DVB attach which uses frontend
diff --git a/drivers/media/dvb-frontends/tua6100.c b/drivers/media/dvb-frontends/tua6100.c
index 2483f614d0e7..41dd9b6d3190 100644
--- a/drivers/media/dvb-frontends/tua6100.c
+++ b/drivers/media/dvb-frontends/tua6100.c
@@ -186,7 +186,7 @@ struct dvb_frontend *tua6100_attach(struct dvb_frontend *fe, int addr, struct i2
 	fe->tuner_priv = priv;
 	return fe;
 }
-EXPORT_SYMBOL(tua6100_attach);
+EXPORT_SYMBOL_GPL(tua6100_attach);
 
 MODULE_DESCRIPTION("DVB tua6100 driver");
 MODULE_AUTHOR("Andrew de Quincey");
diff --git a/drivers/media/dvb-frontends/ves1820.c b/drivers/media/dvb-frontends/ves1820.c
index 9df14d0be1c1..ee5620e731e9 100644
--- a/drivers/media/dvb-frontends/ves1820.c
+++ b/drivers/media/dvb-frontends/ves1820.c
@@ -434,4 +434,4 @@ MODULE_DESCRIPTION("VLSI VES1820 DVB-C Demodulator driver");
 MODULE_AUTHOR("Ralph Metzler, Holger Waechtler");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(ves1820_attach);
+EXPORT_SYMBOL_GPL(ves1820_attach);
diff --git a/drivers/media/dvb-frontends/ves1x93.c b/drivers/media/dvb-frontends/ves1x93.c
index b74727286302..c60e21d26b88 100644
--- a/drivers/media/dvb-frontends/ves1x93.c
+++ b/drivers/media/dvb-frontends/ves1x93.c
@@ -540,4 +540,4 @@ MODULE_DESCRIPTION("VLSI VES1x93 DVB-S Demodulator driver");
 MODULE_AUTHOR("Ralph Metzler");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(ves1x93_attach);
+EXPORT_SYMBOL_GPL(ves1x93_attach);
diff --git a/drivers/media/dvb-frontends/zl10036.c b/drivers/media/dvb-frontends/zl10036.c
index d392c7cce2ce..7ba575e9c55f 100644
--- a/drivers/media/dvb-frontends/zl10036.c
+++ b/drivers/media/dvb-frontends/zl10036.c
@@ -496,7 +496,7 @@ struct dvb_frontend *zl10036_attach(struct dvb_frontend *fe,
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(zl10036_attach);
+EXPORT_SYMBOL_GPL(zl10036_attach);
 
 module_param_named(debug, zl10036_debug, int, 0644);
 MODULE_PARM_DESC(debug, "Turn on/off frontend debugging (default:off).");
diff --git a/drivers/media/dvb-frontends/zl10039.c b/drivers/media/dvb-frontends/zl10039.c
index 1335bf78d5b7..a3e4d219400c 100644
--- a/drivers/media/dvb-frontends/zl10039.c
+++ b/drivers/media/dvb-frontends/zl10039.c
@@ -295,7 +295,7 @@ struct dvb_frontend *zl10039_attach(struct dvb_frontend *fe,
 	kfree(state);
 	return NULL;
 }
-EXPORT_SYMBOL(zl10039_attach);
+EXPORT_SYMBOL_GPL(zl10039_attach);
 
 module_param(debug, int, 0644);
 MODULE_PARM_DESC(debug, "Turn on/off frontend debugging (default:off).");
diff --git a/drivers/media/dvb-frontends/zl10353.c b/drivers/media/dvb-frontends/zl10353.c
index 2a2cf20a73d6..8849d05475c2 100644
--- a/drivers/media/dvb-frontends/zl10353.c
+++ b/drivers/media/dvb-frontends/zl10353.c
@@ -665,4 +665,4 @@ MODULE_DESCRIPTION("Zarlink ZL10353 DVB-T demodulator driver");
 MODULE_AUTHOR("Chris Pascoe");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(zl10353_attach);
+EXPORT_SYMBOL_GPL(zl10353_attach);
diff --git a/drivers/media/pci/bt8xx/dst.c b/drivers/media/pci/bt8xx/dst.c
index 3e52a51982d7..110651e47831 100644
--- a/drivers/media/pci/bt8xx/dst.c
+++ b/drivers/media/pci/bt8xx/dst.c
@@ -1722,7 +1722,7 @@ struct dst_state *dst_attach(struct dst_state *state, struct dvb_adapter *dvb_ad
 	return state;				/*	Manu (DST is a card not a frontend)	*/
 }
 
-EXPORT_SYMBOL(dst_attach);
+EXPORT_SYMBOL_GPL(dst_attach);
 
 static const struct dvb_frontend_ops dst_dvbt_ops = {
 	.delsys = { SYS_DVBT },
diff --git a/drivers/media/pci/bt8xx/dst_ca.c b/drivers/media/pci/bt8xx/dst_ca.c
index d234a0f404d6..a9cc6e7a57f9 100644
--- a/drivers/media/pci/bt8xx/dst_ca.c
+++ b/drivers/media/pci/bt8xx/dst_ca.c
@@ -668,7 +668,7 @@ struct dvb_device *dst_ca_attach(struct dst_state *dst, struct dvb_adapter *dvb_
 	return NULL;
 }
 
-EXPORT_SYMBOL(dst_ca_attach);
+EXPORT_SYMBOL_GPL(dst_ca_attach);
 
 MODULE_DESCRIPTION("DST DVB-S/T/C Combo CA driver");
 MODULE_AUTHOR("Manu Abraham");
diff --git a/drivers/media/pci/ddbridge/ddbridge-dummy-fe.c b/drivers/media/pci/ddbridge/ddbridge-dummy-fe.c
index 6868a0c4fc82..520ebd16b0c4 100644
--- a/drivers/media/pci/ddbridge/ddbridge-dummy-fe.c
+++ b/drivers/media/pci/ddbridge/ddbridge-dummy-fe.c
@@ -112,7 +112,7 @@ struct dvb_frontend *ddbridge_dummy_fe_qam_attach(void)
 	state->frontend.demodulator_priv = state;
 	return &state->frontend;
 }
-EXPORT_SYMBOL(ddbridge_dummy_fe_qam_attach);
+EXPORT_SYMBOL_GPL(ddbridge_dummy_fe_qam_attach);
 
 static const struct dvb_frontend_ops ddbridge_dummy_fe_qam_ops = {
 	.delsys = { SYS_DVBC_ANNEX_A },
diff --git a/drivers/media/tuners/fc0011.c b/drivers/media/tuners/fc0011.c
index eaa3bbc903d7..3d3b54be2955 100644
--- a/drivers/media/tuners/fc0011.c
+++ b/drivers/media/tuners/fc0011.c
@@ -499,7 +499,7 @@ struct dvb_frontend *fc0011_attach(struct dvb_frontend *fe,
 
 	return fe;
 }
-EXPORT_SYMBOL(fc0011_attach);
+EXPORT_SYMBOL_GPL(fc0011_attach);
 
 MODULE_DESCRIPTION("Fitipower FC0011 silicon tuner driver");
 MODULE_AUTHOR("Michael Buesch <m@bues.ch>");
diff --git a/drivers/media/tuners/fc0012.c b/drivers/media/tuners/fc0012.c
index 4429d5e8c579..81e65acbdb17 100644
--- a/drivers/media/tuners/fc0012.c
+++ b/drivers/media/tuners/fc0012.c
@@ -495,7 +495,7 @@ struct dvb_frontend *fc0012_attach(struct dvb_frontend *fe,
 
 	return fe;
 }
-EXPORT_SYMBOL(fc0012_attach);
+EXPORT_SYMBOL_GPL(fc0012_attach);
 
 MODULE_DESCRIPTION("Fitipower FC0012 silicon tuner driver");
 MODULE_AUTHOR("Hans-Frieder Vogt <hfvogt@gmx.net>");
diff --git a/drivers/media/tuners/fc0013.c b/drivers/media/tuners/fc0013.c
index 29dd9b55ff33..1006a2798eef 100644
--- a/drivers/media/tuners/fc0013.c
+++ b/drivers/media/tuners/fc0013.c
@@ -608,7 +608,7 @@ struct dvb_frontend *fc0013_attach(struct dvb_frontend *fe,
 
 	return fe;
 }
-EXPORT_SYMBOL(fc0013_attach);
+EXPORT_SYMBOL_GPL(fc0013_attach);
 
 MODULE_DESCRIPTION("Fitipower FC0013 silicon tuner driver");
 MODULE_AUTHOR("Hans-Frieder Vogt <hfvogt@gmx.net>");
diff --git a/drivers/media/tuners/max2165.c b/drivers/media/tuners/max2165.c
index 1c746bed51fe..1575ab94e1c8 100644
--- a/drivers/media/tuners/max2165.c
+++ b/drivers/media/tuners/max2165.c
@@ -410,7 +410,7 @@ struct dvb_frontend *max2165_attach(struct dvb_frontend *fe,
 
 	return fe;
 }
-EXPORT_SYMBOL(max2165_attach);
+EXPORT_SYMBOL_GPL(max2165_attach);
 
 MODULE_AUTHOR("David T. L. Wong <davidtlwong@gmail.com>");
 MODULE_DESCRIPTION("Maxim MAX2165 silicon tuner driver");
diff --git a/drivers/media/tuners/mc44s803.c b/drivers/media/tuners/mc44s803.c
index 0c9161516abd..ed8bdf7ebd99 100644
--- a/drivers/media/tuners/mc44s803.c
+++ b/drivers/media/tuners/mc44s803.c
@@ -356,7 +356,7 @@ struct dvb_frontend *mc44s803_attach(struct dvb_frontend *fe,
 	kfree(priv);
 	return NULL;
 }
-EXPORT_SYMBOL(mc44s803_attach);
+EXPORT_SYMBOL_GPL(mc44s803_attach);
 
 MODULE_AUTHOR("Jochen Friedrich");
 MODULE_DESCRIPTION("Freescale MC44S803 silicon tuner driver");
diff --git a/drivers/media/tuners/mt2060.c b/drivers/media/tuners/mt2060.c
index 0278a9f0aeef..4205ed4cf467 100644
--- a/drivers/media/tuners/mt2060.c
+++ b/drivers/media/tuners/mt2060.c
@@ -440,7 +440,7 @@ struct dvb_frontend * mt2060_attach(struct dvb_frontend *fe, struct i2c_adapter
 
 	return fe;
 }
-EXPORT_SYMBOL(mt2060_attach);
+EXPORT_SYMBOL_GPL(mt2060_attach);
 
 static int mt2060_probe(struct i2c_client *client)
 {
diff --git a/drivers/media/tuners/mt2131.c b/drivers/media/tuners/mt2131.c
index 37f50ff6c0bd..eebc06088341 100644
--- a/drivers/media/tuners/mt2131.c
+++ b/drivers/media/tuners/mt2131.c
@@ -274,7 +274,7 @@ struct dvb_frontend * mt2131_attach(struct dvb_frontend *fe,
 	fe->tuner_priv = priv;
 	return fe;
 }
-EXPORT_SYMBOL(mt2131_attach);
+EXPORT_SYMBOL_GPL(mt2131_attach);
 
 MODULE_AUTHOR("Steven Toth");
 MODULE_DESCRIPTION("Microtune MT2131 silicon tuner driver");
diff --git a/drivers/media/tuners/mt2266.c b/drivers/media/tuners/mt2266.c
index 6136f20fa9b7..2e92885a6bcb 100644
--- a/drivers/media/tuners/mt2266.c
+++ b/drivers/media/tuners/mt2266.c
@@ -336,7 +336,7 @@ struct dvb_frontend * mt2266_attach(struct dvb_frontend *fe, struct i2c_adapter
 	mt2266_calibrate(priv);
 	return fe;
 }
-EXPORT_SYMBOL(mt2266_attach);
+EXPORT_SYMBOL_GPL(mt2266_attach);
 
 MODULE_AUTHOR("Olivier DANET");
 MODULE_DESCRIPTION("Microtune MT2266 silicon tuner driver");
diff --git a/drivers/media/tuners/mxl5005s.c b/drivers/media/tuners/mxl5005s.c
index 06dfab9fb8cb..d9bfa257a005 100644
--- a/drivers/media/tuners/mxl5005s.c
+++ b/drivers/media/tuners/mxl5005s.c
@@ -4120,7 +4120,7 @@ struct dvb_frontend *mxl5005s_attach(struct dvb_frontend *fe,
 	fe->tuner_priv = state;
 	return fe;
 }
-EXPORT_SYMBOL(mxl5005s_attach);
+EXPORT_SYMBOL_GPL(mxl5005s_attach);
 
 MODULE_DESCRIPTION("MaxLinear MXL5005S silicon tuner driver");
 MODULE_AUTHOR("Steven Toth");
diff --git a/drivers/media/tuners/qt1010.c b/drivers/media/tuners/qt1010.c
index a7b19863f489..48fc79cd4027 100644
--- a/drivers/media/tuners/qt1010.c
+++ b/drivers/media/tuners/qt1010.c
@@ -441,7 +441,7 @@ struct dvb_frontend * qt1010_attach(struct dvb_frontend *fe,
 	fe->tuner_priv = priv;
 	return fe;
 }
-EXPORT_SYMBOL(qt1010_attach);
+EXPORT_SYMBOL_GPL(qt1010_attach);
 
 MODULE_DESCRIPTION("Quantek QT1010 silicon tuner driver");
 MODULE_AUTHOR("Antti Palosaari <crope@iki.fi>");
diff --git a/drivers/media/tuners/tda18218.c b/drivers/media/tuners/tda18218.c
index 4ed94646116f..7d8d84dcb245 100644
--- a/drivers/media/tuners/tda18218.c
+++ b/drivers/media/tuners/tda18218.c
@@ -336,7 +336,7 @@ struct dvb_frontend *tda18218_attach(struct dvb_frontend *fe,
 
 	return fe;
 }
-EXPORT_SYMBOL(tda18218_attach);
+EXPORT_SYMBOL_GPL(tda18218_attach);
 
 MODULE_DESCRIPTION("NXP TDA18218HN silicon tuner driver");
 MODULE_AUTHOR("Antti Palosaari <crope@iki.fi>");
diff --git a/drivers/media/tuners/xc2028.c b/drivers/media/tuners/xc2028.c
index 69c2e1b99bf1..5a967edceca9 100644
--- a/drivers/media/tuners/xc2028.c
+++ b/drivers/media/tuners/xc2028.c
@@ -1512,7 +1512,7 @@ struct dvb_frontend *xc2028_attach(struct dvb_frontend *fe,
 	return NULL;
 }
 
-EXPORT_SYMBOL(xc2028_attach);
+EXPORT_SYMBOL_GPL(xc2028_attach);
 
 MODULE_DESCRIPTION("Xceive xc2028/xc3028 tuner driver");
 MODULE_AUTHOR("Michel Ludwig <michel.ludwig@gmail.com>");
diff --git a/drivers/media/tuners/xc4000.c b/drivers/media/tuners/xc4000.c
index d59b4ab77430..57ded9ff3f04 100644
--- a/drivers/media/tuners/xc4000.c
+++ b/drivers/media/tuners/xc4000.c
@@ -1742,7 +1742,7 @@ struct dvb_frontend *xc4000_attach(struct dvb_frontend *fe,
 	xc4000_release(fe);
 	return NULL;
 }
-EXPORT_SYMBOL(xc4000_attach);
+EXPORT_SYMBOL_GPL(xc4000_attach);
 
 MODULE_AUTHOR("Steven Toth, Davide Ferri");
 MODULE_DESCRIPTION("Xceive xc4000 silicon tuner driver");
diff --git a/drivers/media/tuners/xc5000.c b/drivers/media/tuners/xc5000.c
index 7b7d9fe4f945..2182e5b7b606 100644
--- a/drivers/media/tuners/xc5000.c
+++ b/drivers/media/tuners/xc5000.c
@@ -1460,7 +1460,7 @@ struct dvb_frontend *xc5000_attach(struct dvb_frontend *fe,
 	xc5000_release(fe);
 	return NULL;
 }
-EXPORT_SYMBOL(xc5000_attach);
+EXPORT_SYMBOL_GPL(xc5000_attach);
 
 MODULE_AUTHOR("Steven Toth");
 MODULE_DESCRIPTION("Xceive xc5000 silicon tuner driver");
diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/media/av7110/sp8870.c
index 9767159aeb9b..abf5c72607b6 100644
--- a/drivers/staging/media/av7110/sp8870.c
+++ b/drivers/staging/media/av7110/sp8870.c
@@ -606,4 +606,4 @@ MODULE_DESCRIPTION("Spase SP8870 DVB-T Demodulator driver");
 MODULE_AUTHOR("Juergen Peitz");
 MODULE_LICENSE("GPL");
 
-EXPORT_SYMBOL(sp8870_attach);
+EXPORT_SYMBOL_GPL(sp8870_attach);
-- 
2.42.0

