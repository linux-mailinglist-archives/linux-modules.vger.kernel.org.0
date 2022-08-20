Return-Path: <linux-modules-owner@vger.kernel.org>
X-Original-To: lists+linux-modules@lfdr.de
Delivered-To: lists+linux-modules@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8B8459AADA
	for <lists+linux-modules@lfdr.de>; Sat, 20 Aug 2022 05:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233564AbiHTDLq (ORCPT <rfc822;lists+linux-modules@lfdr.de>);
        Fri, 19 Aug 2022 23:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239003AbiHTDLm (ORCPT
        <rfc822;linux-modules@vger.kernel.org>);
        Fri, 19 Aug 2022 23:11:42 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA4DD12AE9
        for <linux-modules@vger.kernel.org>; Fri, 19 Aug 2022 20:11:40 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id v125so6715509oie.0
        for <linux-modules@vger.kernel.org>; Fri, 19 Aug 2022 20:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc;
        bh=xIFJwNuKiorxPxXA1Gv0CiyCxhqWzw+mgI0moUs8Zv0=;
        b=H2IypzF+DCEaJYbUrjPAnWyblhOte1ndd5U9yRNj3se8uJvyqGoz0VA57yBEyYXiSZ
         bOwqRKJkB30d2zg4TGw9TugzLtfgzMHNc0jwDl1yCuXHSzTLChIlL8kfpLcNqLM1I7oT
         1gO9JYmOyGN6LI695/pgY1Fsxtyqd5niksPjM2FSN79qecME8qromSADeXvSqKv3fAMd
         6Yyodp11AZdo9eprcwHj9Fk+srDclVRKnZ+bwjqHF5GW5wYAqJVpV7TnmMStb1hsy1bz
         lxNslaRZhvoZH1kQgrSk81kngC/LuQNO3gI8Xuwu+gVlmEkJrHqAqMpx5xmrggK2B7x9
         XfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc;
        bh=xIFJwNuKiorxPxXA1Gv0CiyCxhqWzw+mgI0moUs8Zv0=;
        b=AZNHLl1+rFENPnwFgIVSpBTqhdrPM5MVxgvXwhmdn0yM150XzOdEFXJgSRUTSHT4/C
         +0L7WEQvwPMFxjLaXTASx29UY1JtC1JtqHvM4Q2+ISJwt1i9VZ3xthxZzp/Oi8dgfRjv
         7QVzCoTi8JpURqgeHq2RNM4298mAA1tL1HN/EEMRAOm8F+Ldg9RG3B4FYuqqjvw12S55
         XbNmOCi7P7EuV71os4RhZSfs3Oofwc6p7P2M588lBOjmmOSkAIUr396btXjVRpHeClzB
         m5NgSzrzXDN2zhWei64Pqq9R2HmSg9z7Zo7+o8LACco7GNugQFAkjos3fKwBwTPSn90l
         XX1w==
X-Gm-Message-State: ACgBeo3zCZKTBZmLaLR27tvHN8ZSncE/AxxIEqQ2Sizr1wN96d7ozxKd
        UQKLT2n3Ia+sozU3lbIjrRcswYYIazI85NIHvbQl/Z03toY=
X-Google-Smtp-Source: AA6agR77wbrVy7TVWBnt/VJT7PROS1eYdxbBhW0Yh0Xd0o3W2f3hn2i40EDrPDUnxNkBEKm7REpbiAfbJa/M+HfaZ6M=
X-Received: by 2002:a05:6808:209:b0:342:ed43:2f97 with SMTP id
 l9-20020a056808020900b00342ed432f97mr6862400oie.255.1660965099781; Fri, 19
 Aug 2022 20:11:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAGRSmLt46=1JRahn-yDVz-kDeywOhHx1zQS6TXM3kfKQTWv0Kg@mail.gmail.com>
In-Reply-To: <CAGRSmLt46=1JRahn-yDVz-kDeywOhHx1zQS6TXM3kfKQTWv0Kg@mail.gmail.com>
From:   "David F." <df7729@gmail.com>
Date:   Fri, 19 Aug 2022 20:11:28 -0700
Message-ID: <CAGRSmLsYwJZzDUvSFzFVLpMLt7Xa=inZrnhpMMX9iwQb9HD2jA@mail.gmail.com>
Subject: Re: Block module crash loading on 5.15.x kernel?
To:     linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-modules.vger.kernel.org>

I found it - needed to add:

vhxdev->GenDisk->minors = 1;

On Fri, Aug 19, 2022 at 5:46 PM David F. <df7729@gmail.com> wrote:
>
> I have a private custom block module that has been around since the
> kernel 4.x days.   Every once in a while it wouldn't build on a kernel
> update, so I'd have to figure out what you do with the new kernel
> (luckily most of the time someone else already asked and found the
> solution).   This break happened again with the kernel 5.15.x update.
> The last kernel I built this for was and it was working was 5.10.x.  I
> found examples of what is done now, however, it's not working for me.
> I'm getting a crash / failure when calling the add_disk() function.
>
> Is there something I'm missing?    I took out the 4.x specific code
> from below, but left the other 5.x stuff in.  Here's a skeleton
> outline of the module (the failure occurs on insmod of the kernel
> which is just creating a block device that doesn't do much but look
> for ioctl requests).  Can one of the expects look at what I may be
> doing wrong?   Here's that skeleton code:
>
> #include <linux/module.h>
> #include <linux/kernel.h>
> #include <linux/version.h>
> #include <linux/fs.h>
> #include <linux/types.h>
> #include <linux/spinlock.h>
> #include <linux/genhd.h>
> #include <linux/blkdev.h>
> #include <linux/errno.h>
> #include <linux/sched.h> // for set_user_nice
> #include <linux/math64.h>
> #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,0,0))
> #include <linux/blk-mq.h>
> #endif
>
> //---------------------
> // Macro
> //---------------------
> #define MIN_NICE -20  // can't find it on this system.
>
> #define BUFFERmaxElements(s) (sizeof(s)/sizeof((s)[0]))
> #define SZBUFFERmaxStrLen(s) ((sizeof(s)/sizeof((s)[0]))-1)
>
> #define NUMdevicesDefault   10
> #define NUMdevicesMin        2
> #define NUMdevicesMax          27
>
> //---------------------
> // Types
> //----------------------
> typedef struct _sVHXMountDev {
>     spinlock_t Lock;                  // lock for device access
>     struct mutex IOCTLLock;           // mutext for handling of ioctl
>     #if (LINUX_VERSION_CODE < KERNEL_VERSION(5,15,0))
>     struct request_queue *Queue;      // request queue for device
>     #endif
>     struct gendisk *GenDisk;          // kernel disk device
>     #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,0,0))
>     struct blk_mq_tag_set tag_set;    // new blk_mq method
>     #endif
>     unsigned int OpenCount;           // keep track if device open
>
>     void *VHXMountObj;                // CVHXMount mounted object for
> vhx file (C version)
> } sVHXMountDev, *psVHXMountDev;
>
>
> //----------------------
> // Parameters
> //----------------------
> static unsigned int MajorDevNum=0;
> module_param(MajorDevNum, uint, 0444);
> static unsigned int NumDevices=NUMdevicesDefault;
> module_param(NumDevices, uint, 0444);
>
> //----------------------
> // Local Data
> //----------------------
> static const char VHXMountDevName[]="vhx";
> static const char VHXMountDevNameFmt[]="vhx%c";
>
> static sVHXMountDev *VHXMountDevArr=NULL;
>
> unsigned int VHXMountMajor=0;
> unsigned int VHXMountNumDevices=NUMdevicesDefault;
>
> //-------------------------------------------------------------------------
> // Block operations structure
> //-------------------------------------------------------------------------
>
> static struct block_device_operations VHXMountBlockOps=
> {
>     .owner = THIS_MODULE,       // required initialization
>     .open = VHXMountOpen,       // open device function
>     .release = VHXMountClose,   // close device function
>     .ioctl = VHXMountIOCTL,        // the ioctl handler
> #if defined(CONFIG_COMPAT)
>     .compat_ioctl = VHXMountIOCTL,  // no special version needed
> #endif
> };
>
> #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,0,0))
>
> static struct blk_mq_ops _mq_ops = {
>     .queue_rq = VHXMountRequest,
> };
>
> #endif
>
> //-------------------------------------------------------------------------
> // Purpose: Uninitialize device
> //
> // Input:   vhxdev  - [io] device to uninitalize
> //
> // Output:  na
> //
> // Notes:   This removes a mounted drive
> //
> static void VHXUnintializeDevice(sVHXMountDev *vhxdev)
> {
>   //printk(KERN_DEBUG "VHXUninitializeDevice(%p)", vhxdev);
>
>   int devindex=-1;
>
>   // check if gen disk setup
>   if (vhxdev->GenDisk) {
>     devindex=vhxdev->GenDisk->first_minor / VHXMOUNT_MINOR_CNT;
>     //printk(KERN_DEBUG "VHXUninitializeDevice: gendisk");
>
>     // stop new requests from arriving (okay to call del_gendisk
> without add_gendisk)
>     del_gendisk(vhxdev->GenDisk);
>     #if (LINUX_VERSION_CODE > KERNEL_VERSION(5,10,0))
>     blk_cleanup_disk(vhxdev->GenDisk);
>     #else
>     put_disk(vhxdev->GenDisk);
>     #endif
>     vhxdev->GenDisk=NULL;
>   }
>
>   #if (LINUX_VERSION_CODE < KERNEL_VERSION(5,15,0))
>   // check if queue setup
>   if (vhxdev->Queue) {
>     //printk(KERN_DEBUG "VHXUninitializeDevice: queue");
>     blk_cleanup_queue(vhxdev->Queue);
>     vhxdev->Queue=NULL;
>   }
>   #endif
>
>   #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,0,0))
>   // free blk_mq tag item
>   if (vhxdev->tag_set.tags) {
>     blk_mq_free_tag_set(&vhxdev->tag_set);
>   }
>   #endif
>
>   //printk(KERN_DEBUG "VHXUninitializeDevice: object");
>   // close down the object if it exists
>   VHXMountObjDelete(vhxdev->VHXMountObj);
>   vhxdev->VHXMountObj=NULL;
>
>   if (devindex>=0) {
>       printk(KERN_INFO "VHXMount %i: driver uninstalled.\n", devindex);
>   }
> }
>
> //-------------------------------------------------------------------------
> // Purpose: Sets up the device being mounted per the arguments
> //
> // Input:   vhxdev         - [o] device to initialize
> //          devindex       - [i] device index being initialized
> //          ioctlarg       - [i] arguments for mounting vhx file
> //
> // Output:  negative error code or zero if success
> //
> // Notes:   ioctl is used to cause mounting of image file
> //
> static int VHXMountSetupDevice(sVHXMountDev *vhxdev, unsigned int
> devindex, const sVHXMountIOCTLArg *ioctlarg)
> {
>     // ensure structure is zeroed
>     memset(vhxdev, 0, sizeof(*vhxdev));
>
>     // check if master device or actual mount
>     if (ioctlarg!=NULL) {
>         // N/A - REMOVED
>     }
>
>     // init spinlock for request queue
>     spin_lock_init(&vhxdev->Lock);
>     // init mutext
>     mutex_init(&vhxdev->IOCTLLock);
>
> #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,15,0))
>
>     memset(&vhxdev->tag_set, 0, sizeof(vhxdev->tag_set));
>     vhxdev->tag_set.ops = &_mq_ops;
>     vhxdev->tag_set.nr_hw_queues = 1;
>     vhxdev->tag_set.nr_maps = 1;
>     vhxdev->tag_set.queue_depth = 128;
>     vhxdev->tag_set.numa_node = NUMA_NO_NODE;
>     vhxdev->tag_set.flags = BLK_MQ_F_SHOULD_MERGE /*| BLK_MQ_F_SG_MERGE*/;
>     vhxdev->tag_set.driver_data = vhxdev;
>
>     {
>         int ret = blk_mq_alloc_tag_set(&vhxdev->tag_set);
>         if (ret) {
>             printk (KERN_WARNING "VHXMount: unable to allocate and
> initialize tag set. Error %i\n", ret);
>             VHXUnintializeDevice(vhxdev);
>             return ret;
>         }
>     }
>
>     vhxdev->GenDisk = blk_mq_alloc_disk(&vhxdev->tag_set, vhxdev);
>
>     if (IS_ERR(vhxdev->GenDisk)) {
>         int err=PTR_ERR(vhxdev->GenDisk);
>         printk(KERN_ERR "VHXMount %i: blk_mq_alloc_disk failure
> (%i).\n", devindex, err);
>         VHXUnintializeDevice(vhxdev);
>         return err;
>     }
> #else
>     vhxdev->tag_set.cmd_size = 0;
>     vhxdev->tag_set.driver_data = vhxdev;
>
>     vhxdev->Queue = blk_mq_init_sq_queue (&vhxdev->tag_set, &_mq_ops,
> 128, BLK_MQ_F_SHOULD_MERGE /*| BLK_MQ_F_SG_MERGE*/);
>     if (IS_ERR (vhxdev->Queue)) {
>         int ret = PTR_ERR (vhxdev->Queue);
>         printk (KERN_WARNING "VHXMount: unable to allocate and
> initialize tag set. Error %i\n", ret);
>         vhxdev->Queue=NULL;
>         VHXUnintializeDevice(vhxdev);
>         return ret;
>     }
>     vhxdev->Queue->queuedata = vhxdev;
>
>     // setup the gendisk structure
>     vhxdev->GenDisk = alloc_disk(VHXMOUNT_MINOR_CNT);
>     if (!vhxdev->GenDisk) {
>         printk(KERN_ERR "VHXMount %i: alloc_disk failure.\n", devindex);
>         VHXUnintializeDevice(vhxdev);
>         return -ENOMEM;
>     }
>
>      // setup the gendisk structure
>     vhxdev->GenDisk->queue = vhxdev->Queue;
> #endif
>
>     vhxdev->GenDisk->major = VHXMountMajor;
>     vhxdev->GenDisk->first_minor = VHXMOUNT_MINOR_CNT*devindex;
>     vhxdev->GenDisk->flags |= GENHD_FL_NO_PART_SCAN;
> //GENHD_FL_SUPPRESS_PARTITION_INFO; // use to stop from being added to
> /proc/partitions
>     vhxdev->GenDisk->fops = &VHXMountBlockOps;
>     vhxdev->GenDisk->private_data = vhxdev;
>     set_disk_ro(vhxdev->GenDisk, 1);
>
>     // add items for non master device
>     if (vhxdev->VHXMountObj) {
>         snprintf(vhxdev->GenDisk->disk_name,
> BUFFERmaxElements(vhxdev->GenDisk->disk_name), VHXMountDevNameFmt,
> devindex+'a'-1);
>         set_capacity(vhxdev->GenDisk,
> VHXMountObjGetTotalSectors(vhxdev->VHXMountObj)*(VHXMountObjGetBytesPerSector(vhxdev->VHXMountObj)/KERNEL_SECTOR_SIZE));
>         //printk(KERN_DEBUG "Set capacity to %llu sectors\n",
> (uint64_t) get_capacity(vhxdev->GenDisk));
>         // setup worker thread
>     }
>     else {
>         // master device
>         strncpy(vhxdev->GenDisk->disk_name, VHXMountDevName,
> SZBUFFERmaxStrLen(vhxdev->GenDisk->disk_name));
>     }
>
>     // do this last as several functions can be called prior to this returning
>     int err=add_disk(vhxdev->GenDisk);
>
>     /*    #######################################################################
>         #######################################################################
>         This is where there is a dump in the message log for 5.15.60 showing:
>
>         Aug 20 00:06:19 (none) user.warn kernel: ------------[ cut
> here ]------------
>         Aug 20 00:06:19 (none) user.warn kernel: WARNING: CPU: 0 PID:
> 891 at block/genhd.c:416 device_add_disk+0x37/0x336
>         Aug 20 00:06:19 (none) user.warn kernel: Modules linked in:
> vhdxmount(PO+) hid_generic sg usbhid usb_storage hid sr_mod sd_mod
> cdrom nvme i2c_i801 nvme_core i2c_smbus evdev ahci libahci i2c_core
> tulip pcspkr xhci_pci xhci_hcd ehci_pci t10_pi ehci_hcd thermal video
> butt
>         Aug 20 00:06:19 (none) user.warn kernel: CPU: 0 PID: 891 Comm:
> insmod Tainted: P        W  O      5.15.60-amd64-custom #1
>         Aug 20 00:06:19 (none) user.warn kernel: Hardware name:
> /DH77KC, BIOS KCH7710H.86A.0111.2018.0329.1405 03/29/2018
>         Aug 20 00:06:19 (none) user.warn kernel: RIP:
> 0010:device_add_disk+0x37/0x336
>         Aug 20 00:06:19 (none) user.warn kernel: Code: f6 41 55 41 54
> 53 51 48 8b 7e 50 48 8b 5e 40 48 89 55 d0 e8 26 fe fe ff 41 83 3e 00
> 4c 8d 6b 40 74 46 41 8b 46 08 85 c0 75 04 <0f> 0b eb 43 3d 00 01 00 00
> 7e 19 be 00 01 00 00 48 c7 c7 58 2b de
>         Aug 20 00:06:19 (none) user.warn kernel: RSP:
> 0018:ffffc900000cfc38 EFLAGS: 00010246
>         Aug 20 00:06:19 (none) user.warn kernel: RAX: 0000000000000000
> RBX: ffff88803dabd2c0 RCX: ffff88800df96dc0
>         Aug 20 00:06:19 (none) user.warn kernel: RDX: 0000000000000000
> RSI: 0000000000000286 RDI: ffff88800df96dd0
>         Aug 20 00:06:19 (none) user.warn kernel: RBP: ffffc900000cfc68
> R08: 0000000000000000 R09: ffffc900000cfb68
>         Aug 20 00:06:19 (none) user.warn kernel: R10: 0000000000000286
> R11: 000000000000026c R12: ffff88803d6fc000
>         Aug 20 00:06:19 (none) user.warn kernel: R13: ffff88803dabd300
> R14: ffff88800df02000 R15: 0000000000000000
>         Aug 20 00:06:19 (none) user.warn kernel: FS:
> 0000000000000000(0000) GS:ffff888100200000(0063)
> knlGS:00000000f7f45a80
>         Aug 20 00:06:19 (none) user.warn kernel: CS:  0010 DS: 002b
> ES: 002b CR0: 0000000080050033
>         Aug 20 00:06:19 (none) user.warn kernel: CR2: 00000000f7e32461
> CR3: 000000003ce86003 CR4: 00000000000606f0
>         Aug 20 00:06:19 (none) user.warn kernel: Call Trace:
>         Aug 20 00:06:19 (none) user.warn kernel:  <TASK>
>         Aug 20 00:06:19 (none) user.warn kernel:
> VHXMountSetupDevice+0x1da/0x20e [vhdxmount]
>         Aug 20 00:06:19 (none) user.warn kernel:  ? 0xffffffffa00f9000
>         Aug 20 00:06:19 (none) user.warn kernel:
> VHXMountInitC+0x117/0x1000 [vhdxmount]
>         Aug 20 00:06:19 (none) user.warn kernel:  do_one_initcall+0x64/0x144
>         Aug 20 00:06:19 (none) user.warn kernel:  ? kmem_cache_alloc+0x73/0x82
>         Aug 20 00:06:19 (none) user.warn kernel:  do_init_module+0x48/0x1e3
>         Aug 20 00:06:19 (none) user.warn kernel:  load_module+0x1c96/0x224a
>         Aug 20 00:06:19 (none) user.warn kernel:
> __do_sys_finit_module+0x9a/0xab
>         Aug 20 00:06:19 (none) user.warn kernel:
> __ia32_sys_finit_module+0x14/0x16
>         Aug 20 00:06:19 (none) user.warn kernel:  __do_fast_syscall_32+0xa4/0xcb
>         Aug 20 00:06:19 (none) user.warn kernel:  do_fast_syscall_32+0x34/0x72
>         Aug 20 00:06:19 (none) user.warn kernel:  do_SYSENTER_32+0x1f/0x21
>         Aug 20 00:06:19 (none) user.warn kernel:
> entry_SYSENTER_compat_after_hwframe+0x4d/0x5c
>         Aug 20 00:06:19 (none) user.warn kernel: RIP: 0023:0xf7f04549
>         Aug 20 00:06:19 (none) user.warn kernel: Code: 03 74 c0 01 10
> 05 03 74 b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01
> 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d
> b4 26 00 00 00 00 8d b4 26 00 00 00 00
>         Aug 20 00:06:19 (none) user.warn kernel: RSP:
> 002b:00000000ffefd3dc EFLAGS: 00000296 ORIG_RAX: 000000000000015e
>         Aug 20 00:06:19 (none) user.warn kernel: RAX: ffffffffffffffda
> RBX: 0000000000000003 RCX: 00000000f7f2446c
>         Aug 20 00:06:19 (none) user.warn kernel: RDX: 0000000000000000
> RSI: 0000000057f25220 RDI: 0000000057f242a0
>         Aug 20 00:06:19 (none) user.warn kernel: RBP: 00000000f7f227bc
> R08: 0000000000000000 R09: 0000000000000000
>         Aug 20 00:06:19 (none) user.warn kernel: R10: 0000000000000000
> R11: 0000000000000000 R12: 0000000000000000
>         Aug 20 00:06:19 (none) user.warn kernel: R13: 0000000000000000
> R14: 0000000000000000 R15: 0000000000000000
>         Aug 20 00:06:19 (none) user.warn kernel:  </TASK>
>         Aug 20 00:06:19 (none) user.warn kernel: ---[ end trace
> e02aadea0ffa66da ]---
>         Aug 20 00:06:19 (none) user.err kernel: VHXMount 0: failed to
> add disk (-22).
>         Aug 20 00:06:19 (none) user.info kernel: VHXMount 0: driver uninstalled.
>
>         #######################################################################
>         #######################################################################
> */
>
>     if (err!=0) {
>         printk(KERN_ERR "VHXMount %i: failed to add disk (%i).\n",
> devindex, err);
>         VHXUnintializeDevice(vhxdev);
>         return err;
>     }
>
>     // disk now exists
>     printk(KERN_INFO "VHXMount %i: driver installed.\n", devindex);
>     return 0;
> }
>
>
>
> //-------------------------------------------------------------------------
> // Purpose: Required registration and init for linux driver
> //
> // Input:   na
> //
> // Output:
> //
> // Notes:
> //
> static int __init VHXMountInitC(void)
> {
>     int result;
>
>     // assign parameters over to values so they don't change during run.
>     VHXMountMajor=MajorDevNum;
>     VHXMountNumDevices=NumDevices;
>
>     // validate num devices values
>     if (VHXMountNumDevices<NUMdevicesMin) {
>         VHXMountNumDevices=NUMdevicesMin;
>     }
>     else if (VHXMountNumDevices>NUMdevicesMax) {
>         VHXMountNumDevices=NUMdevicesMax;
>     }
>
>     // assign back to variables for output to /sys/module/vhxmount/parameters
>     NumDevices=VHXMountNumDevices;
>
>     // register block device
>     //  if VHXMountMajor!=0 then returns 0 on success and negative on error
>     //  if VHXMountMajor==0 then returns the new major num 1-255 or
> negative on error
>     result=register_blkdev(VHXMountMajor, VHXMountDevName);
>     if (result<=0) {
>         printk(KERN_ERR "VHXMount: register_blkdev failure.\n");
>         return -EBUSY;
>     }
>
>     // assign return device num if major was zero
>     if (VHXMountMajor==0) {
>         VHXMountMajor=result;
>         MajorDevNum=result;
>     }
>
>     // allocate array for preallocated devices
>     if ((VHXMountDevArr=(sVHXMountDev*)kmalloc(VHXMountNumDevices*sizeof(sVHXMountDev),
> GFP_KERNEL))==NULL) {
>         unregister_blkdev(VHXMountMajor, VHXMountDevName);
>         return -ENOMEM;
>     }
>     // zero memory error of array
>     memset(VHXMountDevArr, 0, VHXMountNumDevices*sizeof(sVHXMountDev));
>
>     // setup master device
>     VHXMountSetupDevice(VHXMountDevArr, 0, NULL);
>
>     return 0;
> }
>
> //-------------------------------------------------------------------------
> // Purpose: Remove linux driver
> //
> // Input:   na
> //
> // Output:
> //
> // Notes:
> //
> static void __exit VHXMountRemoveC(void)
> {
>   // handle each device
>   for (unsigned int i=0;i<VHXMountNumDevices;i++) {
>     // uninitialize device
>     VHXUnintializeDevice(VHXMountDevArr+i);
>   }
>   // handle cleanup of block device
>     unregister_blkdev(VHXMountMajor, VHXMountDevName);
>   // clean up array
>   kfree(VHXMountDevArr);
>   VHXMountDevArr=NULL;
> }
>
> //----------------------
> // Driver Information
> //----------------------
>
> module_init(VHXMountInitC);
> module_exit(VHXMountRemoveC);
>
> MODULE_LICENSE("Proprietary");
> MODULE_AUTHOR("Acme, Inc.");
> MODULE_DESCRIPTION("VHXMount Driver");
> MODULE_ALIAS_BLOCKDEV_MAJOR(MajorDevNum);
