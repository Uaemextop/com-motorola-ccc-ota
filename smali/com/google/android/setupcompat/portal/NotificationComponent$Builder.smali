.class public Lcom/google/android/setupcompat/portal/NotificationComponent$Builder;
.super Ljava/lang/Object;
.source "NotificationComponent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/setupcompat/portal/NotificationComponent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private final component:Lcom/google/android/setupcompat/portal/NotificationComponent;


# direct methods
.method public constructor <init>(I)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/android/setupcompat/portal/NotificationComponent;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/google/android/setupcompat/portal/NotificationComponent;-><init>(ILcom/google/android/setupcompat/portal/NotificationComponent$1;)V

    iput-object v0, p0, Lcom/google/android/setupcompat/portal/NotificationComponent$Builder;->component:Lcom/google/android/setupcompat/portal/NotificationComponent;

    return-void
.end method


# virtual methods
.method public build()Lcom/google/android/setupcompat/portal/NotificationComponent;
    .locals 0

    iget-object p0, p0, Lcom/google/android/setupcompat/portal/NotificationComponent$Builder;->component:Lcom/google/android/setupcompat/portal/NotificationComponent;

    return-object p0
.end method

.method public putIntExtra(Ljava/lang/String;I)Lcom/google/android/setupcompat/portal/NotificationComponent$Builder;
    .locals 1

    iget-object v0, p0, Lcom/google/android/setupcompat/portal/NotificationComponent$Builder;->component:Lcom/google/android/setupcompat/portal/NotificationComponent;

    invoke-static {v0}, Lcom/google/android/setupcompat/portal/NotificationComponent;->access$100(Lcom/google/android/setupcompat/portal/NotificationComponent;)Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    return-object p0
.end method
