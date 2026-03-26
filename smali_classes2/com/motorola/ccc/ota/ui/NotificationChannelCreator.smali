.class public Lcom/motorola/ccc/ota/ui/NotificationChannelCreator;
.super Ljava/lang/Object;
.source "NotificationChannelCreator.java"


# static fields
.field private static sMediumNotificationChannelId:Ljava/lang/String; = "ota_notification_channel_medium_01"

.field private static sUrgentNotificationChannelId:Ljava/lang/String; = "ota_notification_channel_urgent_01"


# direct methods
.method static constructor <clinit>()V
    .locals 6

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "notification"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    sget-object v1, Lcom/motorola/ccc/ota/ui/NotificationChannelCreator;->sUrgentNotificationChannelId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->getNotificationChannel(Ljava/lang/String;)Landroid/app/NotificationChannel;

    move-result-object v1

    const-string v2, "OtaApp"

    if-nez v1, :cond_0

    const-string v1, "creating new NotificationChannel with urgent importance"

    invoke-static {v2, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v3, 0x7f0e01e5

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v3, Landroid/app/NotificationChannel;

    sget-object v4, Lcom/motorola/ccc/ota/ui/NotificationChannelCreator;->sUrgentNotificationChannelId:Ljava/lang/String;

    const/4 v5, 0x4

    invoke-direct {v3, v4, v1, v5}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    invoke-virtual {v3, v1}, Landroid/app/NotificationChannel;->setDescription(Ljava/lang/String;)V

    const/4 v1, 0x0

    invoke-virtual {v3, v1, v1}, Landroid/app/NotificationChannel;->setSound(Landroid/net/Uri;Landroid/media/AudioAttributes;)V

    invoke-virtual {v0, v3}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    :cond_0
    sget-object v1, Lcom/motorola/ccc/ota/ui/NotificationChannelCreator;->sMediumNotificationChannelId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->getNotificationChannel(Ljava/lang/String;)Landroid/app/NotificationChannel;

    move-result-object v1

    if-nez v1, :cond_1

    const-string v1, "creating new NotificationChannel with medium importance"

    invoke-static {v2, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0e0124

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Landroid/app/NotificationChannel;

    sget-object v3, Lcom/motorola/ccc/ota/ui/NotificationChannelCreator;->sMediumNotificationChannelId:Ljava/lang/String;

    const/4 v4, 0x2

    invoke-direct {v2, v3, v1, v4}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    invoke-virtual {v2, v1}, Landroid/app/NotificationChannel;->setDescription(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    :cond_1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getMediumNotificationChannelId()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/ui/NotificationChannelCreator;->sMediumNotificationChannelId:Ljava/lang/String;

    return-object v0
.end method

.method public static getUrgentNotificationChannelId()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/ui/NotificationChannelCreator;->sUrgentNotificationChannelId:Ljava/lang/String;

    return-object v0
.end method
