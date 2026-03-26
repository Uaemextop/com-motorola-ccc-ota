.class Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$1;
.super Ljava/lang/Object;
.source "IntelligentNotificationTime.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->compute()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$1;->this$0:Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;)I
    .locals 5

    iget p0, p1, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->count:I

    iget v0, p2, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->count:I

    const/4 v1, 0x1

    if-ge p0, v0, :cond_0

    return v1

    :cond_0
    iget p0, p1, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->count:I

    iget v0, p2, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->count:I

    const/4 v2, -0x1

    if-le p0, v0, :cond_1

    return v2

    :cond_1
    iget-wide p0, p1, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->last:J

    iget-wide v3, p2, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->last:J

    cmp-long p0, p0, v3

    if-gez p0, :cond_2

    return v1

    :cond_2
    return v2
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

    check-cast p2, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

    invoke-virtual {p0, p1, p2}, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$1;->compare(Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;)I

    move-result p0

    return p0
.end method
