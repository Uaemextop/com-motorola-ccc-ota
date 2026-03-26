.class public interface abstract Lcom/motorola/ccc/ota/ui/UpdaterUtils$OnDialogInteractionListener;
.super Ljava/lang/Object;
.source "UpdaterUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/ui/UpdaterUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "OnDialogInteractionListener"
.end annotation


# virtual methods
.method public abstract onDismiss(IZ)V
.end method

.method public onNegativeClick(I)V
    .locals 0

    return-void
.end method

.method public abstract onPositiveClick(ILorg/json/JSONObject;)V
.end method
