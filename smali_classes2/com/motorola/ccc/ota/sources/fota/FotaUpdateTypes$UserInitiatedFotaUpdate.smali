.class public Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$UserInitiatedFotaUpdate;
.super Lcom/motorola/ccc/ota/sources/fota/FotaUpdateType;
.source "FotaUpdateTypes.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "UserInitiatedFotaUpdate"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes;


# direct methods
.method public constructor <init>(Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$UserInitiatedFotaUpdate;->this$0:Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes;

    invoke-direct {p0}, Lcom/motorola/ccc/ota/sources/fota/FotaUpdateType;-><init>()V

    return-void
.end method


# virtual methods
.method public isDownloadVisible()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method
