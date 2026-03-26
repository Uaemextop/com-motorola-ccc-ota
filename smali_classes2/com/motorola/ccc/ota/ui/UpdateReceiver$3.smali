.class synthetic Lcom/motorola/ccc/ota/ui/UpdateReceiver$3;
.super Ljava/lang/Object;
.source "UpdateReceiver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/ui/UpdateReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$motorola$ccc$ota$ui$UpdateReceiver$PendingIntentType:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;->values()[Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$3;->$SwitchMap$com$motorola$ccc$ota$ui$UpdateReceiver$PendingIntentType:[I

    :try_start_0
    sget-object v1, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;->ACTIVITY:Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$3;->$SwitchMap$com$motorola$ccc$ota$ui$UpdateReceiver$PendingIntentType:[I

    sget-object v1, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;->SERVICE:Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :try_start_2
    sget-object v0, Lcom/motorola/ccc/ota/ui/UpdateReceiver$3;->$SwitchMap$com$motorola$ccc$ota$ui$UpdateReceiver$PendingIntentType:[I

    sget-object v1, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;->BROADCAST:Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/ui/UpdateReceiver$PendingIntentType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    return-void
.end method
