.class public final enum Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;
.super Ljava/lang/Enum;
.source "UpgradeStatusConstents.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

.field public static final enum Download_Failed_Due_To_WiFi_Timeout:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

.field public static final enum Error_None:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

.field public static final enum Internal_Error_Aborting_The_Query:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

.field public static final enum Internal_Error_Aborting_The_Upgrade:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

.field public static final enum Package_Verification_failed:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

.field public static final enum Resources_Error_Aborting_The_Installation:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

.field public static final enum Resources_Error_Aborting_The_Query:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

.field public static final enum Successfully_Launched_The_Upgrade:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

.field public static final enum System_Update_Policy_Enabled:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

.field public static final enum Unsuccessfully_Launched_The_Upgrade:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

.field public static final enum User_Canceled_The_Update:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

.field public static final enum User_Declined_Launching_The_Upgrade:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

.field public static final enum User_Declined_The_Request_Notification:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;


# direct methods
.method private static synthetic $values()[Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;
    .locals 13

    sget-object v0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->User_Declined_The_Request_Notification:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    sget-object v1, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->User_Canceled_The_Update:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    sget-object v2, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Package_Verification_failed:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    sget-object v3, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Internal_Error_Aborting_The_Query:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    sget-object v4, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Internal_Error_Aborting_The_Upgrade:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    sget-object v5, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->User_Declined_Launching_The_Upgrade:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    sget-object v6, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Successfully_Launched_The_Upgrade:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    sget-object v7, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Unsuccessfully_Launched_The_Upgrade:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    sget-object v8, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Resources_Error_Aborting_The_Query:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    sget-object v9, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Download_Failed_Due_To_WiFi_Timeout:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    sget-object v10, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Resources_Error_Aborting_The_Installation:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    sget-object v11, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->System_Update_Policy_Enabled:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    sget-object v12, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Error_None:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    filled-new-array/range {v0 .. v12}, [Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    const-string v1, "User_Declined_The_Request_Notification"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->User_Declined_The_Request_Notification:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    new-instance v0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    const-string v1, "User_Canceled_The_Update"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->User_Canceled_The_Update:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    new-instance v0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    const-string v1, "Package_Verification_failed"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Package_Verification_failed:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    new-instance v0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    const-string v1, "Internal_Error_Aborting_The_Query"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Internal_Error_Aborting_The_Query:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    new-instance v0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    const-string v1, "Internal_Error_Aborting_The_Upgrade"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Internal_Error_Aborting_The_Upgrade:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    new-instance v0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    const-string v1, "User_Declined_Launching_The_Upgrade"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->User_Declined_Launching_The_Upgrade:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    new-instance v0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    const-string v1, "Successfully_Launched_The_Upgrade"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Successfully_Launched_The_Upgrade:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    new-instance v0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    const-string v1, "Unsuccessfully_Launched_The_Upgrade"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Unsuccessfully_Launched_The_Upgrade:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    new-instance v0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    const-string v1, "Resources_Error_Aborting_The_Query"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Resources_Error_Aborting_The_Query:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    new-instance v0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    const-string v1, "Download_Failed_Due_To_WiFi_Timeout"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Download_Failed_Due_To_WiFi_Timeout:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    new-instance v0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    const-string v1, "Resources_Error_Aborting_The_Installation"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Resources_Error_Aborting_The_Installation:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    new-instance v0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    const-string v1, "System_Update_Policy_Enabled"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->System_Update_Policy_Enabled:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    new-instance v0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    const-string v1, "Error_None"

    const/16 v2, 0xc

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Error_None:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    invoke-static {}, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->$values()[Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->$VALUES:[Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static getUpgradeStatusConstants(Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;)Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;
    .locals 1

    if-nez p0, :cond_0

    sget-object p0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Error_None:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    return-object p0

    :cond_0
    sget-object v0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents$1;->$SwitchMap$com$motorola$otalib$common$utils$UpgradeUtils$DownloadStatus:[I

    invoke-virtual {p0}, Lcom/motorola/otalib/common/utils/UpgradeUtils$DownloadStatus;->ordinal()I

    move-result p0

    aget p0, v0, p0

    packed-switch p0, :pswitch_data_0

    sget-object p0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Error_None:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    goto :goto_0

    :pswitch_0
    sget-object p0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Download_Failed_Due_To_WiFi_Timeout:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    goto :goto_0

    :pswitch_1
    sget-object p0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->System_Update_Policy_Enabled:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    goto :goto_0

    :pswitch_2
    sget-object p0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Resources_Error_Aborting_The_Installation:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    goto :goto_0

    :pswitch_3
    sget-object p0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Unsuccessfully_Launched_The_Upgrade:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    goto :goto_0

    :pswitch_4
    sget-object p0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Internal_Error_Aborting_The_Query:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    goto :goto_0

    :pswitch_5
    sget-object p0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Package_Verification_failed:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    goto :goto_0

    :pswitch_6
    sget-object p0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->Resources_Error_Aborting_The_Query:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    goto :goto_0

    :pswitch_7
    sget-object p0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->User_Canceled_The_Update:Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    :goto_0
    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;
    .locals 1

    const-class v0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    return-object p0
.end method

.method public static values()[Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->$VALUES:[Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    invoke-virtual {v0}, [Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;

    return-object v0
.end method
