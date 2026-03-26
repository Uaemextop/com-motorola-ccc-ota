.class public final enum Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;
.super Ljava/lang/Enum;
.source "SmartUpdateUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/utils/SmartUpdateUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SmartUpdateLaunchMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

.field public static final enum SETTINGS_MENU_FRAGMENT:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

.field public static final enum SMART_UPDATE_SUGGESTIONS:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

.field public static final enum TRY_SMART_UPDATES_POPUP_DOWNLOAD:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

.field public static final enum TRY_SMART_UPDATES_POPUP_INSTALL:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

.field public static final enum TRY_SMART_UPDATES_POPUP_RESTART:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

.field public static final enum TRY_SMART_UPDATES_POPUP_UPDATE_COMPLETE:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

.field public static final enum UPGRADE_PREFERENCE_FRAGMENT:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

.field public static final enum UP_TO_DATE_FRAGMENT:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;


# direct methods
.method private static synthetic $values()[Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;
    .locals 8

    sget-object v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->SMART_UPDATE_SUGGESTIONS:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    sget-object v1, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->UP_TO_DATE_FRAGMENT:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    sget-object v2, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->TRY_SMART_UPDATES_POPUP_DOWNLOAD:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    sget-object v3, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->TRY_SMART_UPDATES_POPUP_INSTALL:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    sget-object v4, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->TRY_SMART_UPDATES_POPUP_RESTART:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    sget-object v5, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->TRY_SMART_UPDATES_POPUP_UPDATE_COMPLETE:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    sget-object v6, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->UPGRADE_PREFERENCE_FRAGMENT:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    sget-object v7, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->SETTINGS_MENU_FRAGMENT:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    filled-new-array/range {v0 .. v7}, [Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    const-string v1, "SMART_UPDATE_SUGGESTIONS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->SMART_UPDATE_SUGGESTIONS:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    new-instance v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    const-string v1, "UP_TO_DATE_FRAGMENT"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->UP_TO_DATE_FRAGMENT:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    new-instance v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    const-string v1, "TRY_SMART_UPDATES_POPUP_DOWNLOAD"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->TRY_SMART_UPDATES_POPUP_DOWNLOAD:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    new-instance v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    const-string v1, "TRY_SMART_UPDATES_POPUP_INSTALL"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->TRY_SMART_UPDATES_POPUP_INSTALL:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    new-instance v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    const-string v1, "TRY_SMART_UPDATES_POPUP_RESTART"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->TRY_SMART_UPDATES_POPUP_RESTART:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    new-instance v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    const-string v1, "TRY_SMART_UPDATES_POPUP_UPDATE_COMPLETE"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->TRY_SMART_UPDATES_POPUP_UPDATE_COMPLETE:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    new-instance v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    const-string v1, "UPGRADE_PREFERENCE_FRAGMENT"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->UPGRADE_PREFERENCE_FRAGMENT:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    new-instance v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    const-string v1, "SETTINGS_MENU_FRAGMENT"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->SETTINGS_MENU_FRAGMENT:Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    invoke-static {}, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->$values()[Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    move-result-object v0

    sput-object v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->$VALUES:[Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

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

.method public static valueOf(Ljava/lang/String;)Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;
    .locals 1

    const-class v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    return-object p0
.end method

.method public static values()[Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->$VALUES:[Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    invoke-virtual {v0}, [Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/motorola/ccc/ota/utils/SmartUpdateUtils$SmartUpdateLaunchMode;

    return-object v0
.end method
