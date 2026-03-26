.class Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;
.super Ljava/lang/Object;
.source "IntelligentNotificationTime.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Slot"
.end annotation


# instance fields
.field count:I

.field end:J

.field last:J

.field start:J

.field final synthetic this$0:Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;JJIJ)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->this$0:Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p2, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->start:J

    iput-wide p4, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->end:J

    iput p6, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->count:I

    iput-wide p7, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->last:J

    return-void
.end method
