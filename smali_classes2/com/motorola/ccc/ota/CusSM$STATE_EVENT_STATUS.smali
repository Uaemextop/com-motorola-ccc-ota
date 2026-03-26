.class public Lcom/motorola/ccc/ota/CusSM$STATE_EVENT_STATUS;
.super Ljava/lang/Object;
.source "CusSM.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/CusSM;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "STATE_EVENT_STATUS"
.end annotation


# static fields
.field public static IDLE:I = 0x0

.field public static SENDING:I = 0x1

.field public static WAITING_FOR_NETWORK:I = 0x2


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
