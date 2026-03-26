.class public Lcom/motorola/ccc/ota/utils/PMUtils$PMErrorCodes;
.super Ljava/lang/Object;
.source "PMUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/utils/PMUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PMErrorCodes"
.end annotation


# static fields
.field public static final ERR_ALREADY:I = -0x1

.field public static final ERR_BADPARAM:I = -0x2

.field public static final ERR_INVALIDPARAM:I = -0x5

.field public static final ERR_NONE:I = 0x0

.field public static final ERR_NOTFOUND:I = -0x4

.field public static final ERR_NULLPARAM:I = -0x3

.field public static final ERR_OUTOFMEMORY:I = -0x6

.field public static final ERR_SERVICEDIED:I = -0x7


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
