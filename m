Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C4416410D4
	for <lists+linux-modules@lfdr.de>; Fri,  2 Dec 2022 23:48:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234318AbiLBWsE (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Fri, 2 Dec 2022 17:48:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234777AbiLBWsD (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Fri, 2 Dec 2022 17:48:03 -0500
Received: from mail-io1-xd49.google.com (mail-io1-xd49.google.com [IPv6:2607:f8b0:4864:20::d49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AA31DECB
        for <linux-modules@vger.kernel.org>; Fri,  2 Dec 2022 14:48:02 -0800 (PST)
Received: by mail-io1-xd49.google.com with SMTP id k21-20020a5e8915000000b006de391b332fso5672924ioj.4
        for <linux-modules@vger.kernel.org>; Fri, 02 Dec 2022 14:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FQ0NLGuGNf2nmEf2q9NS2Egdev1pTrmorLb5o1IyVfI=;
        b=LqvilsrT0WDYFMxva3mnL4sDbBeOOycVYSCdCucnJhIhrH/n9yxuXV+02TVV2VTbYL
         C3tXr3mtGqS1uTaf2qt2nIG54dW90K6KCQWQRCIQebrSEmkRA9GH+WRYwFgUaj1/AS/U
         bP3yaiQ7keRJEf4hqI+3CJVYe1wWfEAIsGBM0lheuwdxGXoTwpDViGnXQ+z96GWZGoV3
         0ZhqWuoL3eIhZbVoc1shTY6tP3oGAi+mm6HJrnRI3ESNEs7PGrMgcO+ftYqbPXH5rX3m
         c1rk6O928RIWKg/OUXfHoVYJ5eNFrNI+FIPcekp2eGBdxv3WTsMP78mSGXgfMLOIDISH
         gF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FQ0NLGuGNf2nmEf2q9NS2Egdev1pTrmorLb5o1IyVfI=;
        b=xDBK13CgRgho/o0IbYVeSdWQ0zmRh8ClslEPznURziiZ8ptLrfplhpHzhw3IfgU/9A
         d7rHvIWq/mD58fXTAmVWMUuY0cP9IjX/+LHOciBeh4MQlWH6p09jkinoU8YKud+SbbKG
         nGTABToLnIzwfDeOeD2vtxuSIPnBA4h+PeA7kIzJX+VqxKIDriVB75MtucjrYcVZhhXz
         dQNzyRxnYurOIPBhUIAwJz/ugmin2snBXKBrTS7ELQo/+lK9lP2C4/yS8zv98v6rH0Yi
         rj7TN4+zH1IPaxEbtBogtvqlv2zLf98Sxs9ZU3YnVwQ6YTGobAhzW4l6iMsVlJ+FPzVL
         oqug==
X-Gm-Message-State: ANoB5plQIaSVEJeD1Ua/Q5OWJ0K3KBYdncOg1oKAQN0XkRt1SWw0fj91
        waozEXWg5Q1xavLvrfoTgV5Be7Y0ccNag8WcDG/no4NQMM7cg/H1OcBj9r+kqLepTftl9tqxmz9
        Lgn2/rrAgNAsf6fAApDuipyiSxfc8A9pCMl1VPtpElxkVe8zghN8rHfY9HjXbHrBCoVm8EEosie
        U1CJ4=
X-Google-Smtp-Source: AA0mqf7L8bU8vEGHPG0t4DmWSIrUy40io8GqFAppQrTU+eKacA28oUGbAXAgTHeLSmBBeYrAav3GPwiKH75v4ko=
X-Received: from allenwebb.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:12e8])
 (user=allenwebb job=sendgmr) by 2002:a05:6638:4806:b0:389:da33:5460 with SMTP
 id cp6-20020a056638480600b00389da335460mr13676291jab.109.1670021281656; Fri,
 02 Dec 2022 14:48:01 -0800 (PST)
Date:   Fri,  2 Dec 2022 16:47:41 -0600
In-Reply-To: <20221202224744.1447448-1-allenwebb@google.com>
Mime-Version: 1.0
References: <20221202224540.1446952-1-allenwebb@google.com> <20221202224744.1447448-1-allenwebb@google.com>
X-Mailer: git-send-email 2.39.0.rc0.267.gcb52ba06e7-goog
Message-ID: <20221202224744.1447448-2-allenwebb@google.com>
Subject: [PATCH v6 2/5] drivers: Add bus_for_each for iterating over the subsystems
From:   Allen Webb <allenwebb@google.com>
To:     "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Allen Webb <allenwebb@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

In order to print the match-id-based modaliases it must be possible to
reach the match id tables of each driver. With this function it becomes
possible to iterate over each subsystem which can be paired with
iterating over each driver.

Signed-off-by: Allen Webb <allenwebb@google.com>
---
 drivers/base/bus.c         | 42 ++++++++++++++++++++++++++++++++++++++
 include/linux/device/bus.h |  1 +
 2 files changed, 43 insertions(+)

diff --git a/drivers/base/bus.c b/drivers/base/bus.c
index 7ca47e5b3c1f4..4e0c5925545e5 100644
--- a/drivers/base/bus.c
+++ b/drivers/base/bus.c
@@ -178,6 +178,48 @@ static const struct kset_uevent_ops bus_uevent_ops = {
 
 static struct kset *bus_kset;
 
+/**
+ * bus_for_each - bus iterator.
+ * @start: bus to start iterating from.
+ * @data: data for the callback.
+ * @fn: function to be called for each device.
+ *
+ * Iterate over list of buses, and call @fn for each,
+ * passing it @data. If @start is not NULL, we use that bus to
+ * begin iterating from.
+ *
+ * We check the return of @fn each time. If it returns anything
+ * other than 0, we break out and return that value.
+ *
+ * NOTE: The bus that returns a non-zero value is not retained
+ * in any way, nor is its refcount incremented. If the caller needs
+ * to retain this data, it should do so, and increment the reference
+ * count in the supplied callback.
+ */
+int bus_for_each(void *data, int (*fn)(struct bus_type *, void *))
+{
+	int error = 0;
+	struct bus_type *bus;
+	struct subsys_private *bus_prv;
+	struct kset *subsys;
+	struct kobject *k;
+
+	spin_lock(&bus_kset->list_lock);
+
+	list_for_each_entry(k, &bus_kset->list, entry) {
+		subsys = container_of(k, struct kset, kobj);
+		bus_prv = container_of(subsys, struct subsys_private, subsys);
+		bus = bus_prv->bus;
+		error = fn(bus, data);
+		if (error)
+			break;
+	}
+
+	spin_unlock(&bus_kset->list_lock);
+	return error;
+}
+EXPORT_SYMBOL_GPL(bus_for_each);
+
 /* Manually detach a device from its associated driver. */
 static ssize_t unbind_store(struct device_driver *drv, const char *buf,
 			    size_t count)
diff --git a/include/linux/device/bus.h b/include/linux/device/bus.h
index d8b29ccd07e56..82a5583437099 100644
--- a/include/linux/device/bus.h
+++ b/include/linux/device/bus.h
@@ -161,6 +161,7 @@ void subsys_dev_iter_init(struct subsys_dev_iter *iter,
 struct device *subsys_dev_iter_next(struct subsys_dev_iter *iter);
 void subsys_dev_iter_exit(struct subsys_dev_iter *iter);
 
+int bus_for_each(void *data, int (*fn)(struct bus_type *, void *));
 int bus_for_each_dev(struct bus_type *bus, struct device *start, void *data,
 		     int (*fn)(struct device *dev, void *data));
 struct device *bus_find_device(struct bus_type *bus, struct device *start,
-- 
2.37.3

