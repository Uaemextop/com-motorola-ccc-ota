.class public Lcom/motorola/otalib/main/Settings/LibSettings;
.super Lcom/motorola/otalib/common/settings/Settings;
.source "LibSettings.java"


# static fields
.field private static final OTALib_SHARED_PREFS_NAME:Ljava/lang/String; = "otalib_prefs"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-static {p1}, Lcom/motorola/otalib/main/Settings/LibSettings;->getGlobalSharedPreference(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/motorola/otalib/common/settings/Settings;-><init>(Landroid/content/SharedPreferences;)V

    return-void
.end method

.method private static getGlobalSharedPreference(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .locals 2

    const-string v0, "otalib_prefs"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method
