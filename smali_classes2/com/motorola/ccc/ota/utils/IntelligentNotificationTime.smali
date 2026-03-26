.class public Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;
.super Ljava/lang/Object;
.source "IntelligentNotificationTime.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;
    }
.end annotation


# instance fields
.field private final TIME_SEVENTEEN_HOURS:J

.field private final TIME_SEVEN_HOURS:J

.field private cal:Landroid/icu/util/Calendar;

.field private context:Landroid/content/Context;

.field private s1:Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

.field private s2:Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

.field private s3:Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

.field private s4:Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

.field private slots:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide v0, 0x125e780ddc0L

    iput-wide v0, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->TIME_SEVEN_HOURS:J

    const-wide v0, 0x125e9a62ec0L

    iput-wide v0, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->TIME_SEVENTEEN_HOURS:J

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->context:Landroid/content/Context;

    invoke-static {}, Landroid/icu/util/Calendar;->getInstance()Landroid/icu/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->cal:Landroid/icu/util/Calendar;

    new-instance v9, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

    const/4 v6, 0x0

    const-wide/16 v7, 0x0

    const-wide/16 v2, 0x3

    const-wide/16 v4, 0x9

    move-object v0, v9

    move-object v1, p0

    invoke-direct/range {v0 .. v8}, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;-><init>(Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;JJIJ)V

    iput-object v9, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->s1:Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

    new-instance v9, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

    const-wide/16 v2, 0x9

    const-wide/16 v4, 0xf

    move-object v0, v9

    invoke-direct/range {v0 .. v8}, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;-><init>(Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;JJIJ)V

    iput-object v9, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->s2:Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

    new-instance v9, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

    const-wide/16 v2, 0xf

    const-wide/16 v4, 0x15

    move-object v0, v9

    invoke-direct/range {v0 .. v8}, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;-><init>(Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;JJIJ)V

    iput-object v9, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->s3:Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

    new-instance v9, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

    const-wide/16 v2, 0x15

    const-wide/16 v4, 0x3

    move-object v0, v9

    invoke-direct/range {v0 .. v8}, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;-><init>(Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;JJIJ)V

    iput-object v9, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->s4:Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->slots:Ljava/util/List;

    return-void
.end method

.method private getHour(J)I
    .locals 1

    iget-object v0, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->cal:Landroid/icu/util/Calendar;

    invoke-virtual {v0, p1, p2}, Landroid/icu/util/Calendar;->setTimeInMillis(J)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->cal:Landroid/icu/util/Calendar;

    const/16 p1, 0xb

    invoke-virtual {p0, p1}, Landroid/icu/util/Calendar;->get(I)I

    move-result p0

    return p0
.end method

.method private getOldInstallationTimes()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->context:Landroid/content/Context;

    const-string v0, "IntelligentNotificationTime"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, ""

    const-string v2, "TimeString"

    invoke-interface {p0, v2, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v1, "1262309400000;"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v1, "1262345400000;"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, v2, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_0
    const-string v0, ";"

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method private printList()V
    .locals 5

    iget-object p0, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->slots:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v2, v0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->start:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v3, v0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->end:J

    invoke-virtual {v1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->count:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\t\t"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, v0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->last:J

    invoke-static {v2, v3}, Lcom/motorola/ccc/ota/utils/DateFormatUtils;->getDateTime(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OtaApp"

    invoke-static {v1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private storeBestTimes()V
    .locals 10

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->slots:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_0

    iget-wide v2, v2, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->last:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    iget-wide v1, v2, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->last:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v1, v2, :cond_3

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-direct {p0, v4, v5}, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->getHour(J)I

    move-result v1

    int-to-long v4, v1

    iget-object v1, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->s3:Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

    iget-wide v6, v1, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->start:J

    cmp-long v1, v4, v6

    if-ltz v1, :cond_2

    iget-object v1, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->s3:Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

    iget-wide v6, v1, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->end:J

    cmp-long v1, v4, v6

    if-gez v1, :cond_2

    const-wide v4, 0x125e780ddc0L

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_2
    const-wide v4, 0x125e9a62ec0L

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    :goto_1
    iget-object v1, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->cal:Landroid/icu/util/Calendar;

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Landroid/icu/util/Calendar;->setTimeInMillis(J)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->cal:Landroid/icu/util/Calendar;

    const/16 v4, 0xb

    invoke-virtual {v1, v4}, Landroid/icu/util/Calendar;->get(I)I

    move-result v1

    const/16 v5, 0x3c

    mul-int/2addr v1, v5

    iget-object v6, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->cal:Landroid/icu/util/Calendar;

    const/16 v7, 0xc

    invoke-virtual {v6, v7}, Landroid/icu/util/Calendar;->get(I)I

    move-result v6

    add-int/2addr v1, v6

    iget-object v6, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->cal:Landroid/icu/util/Calendar;

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Long;

    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    invoke-virtual {v6, v8, v9}, Landroid/icu/util/Calendar;->setTimeInMillis(J)V

    iget-object v6, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->cal:Landroid/icu/util/Calendar;

    invoke-virtual {v6, v4}, Landroid/icu/util/Calendar;->get(I)I

    move-result v6

    mul-int/2addr v6, v5

    iget-object v8, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->cal:Landroid/icu/util/Calendar;

    invoke-virtual {v8, v7}, Landroid/icu/util/Calendar;->get(I)I

    move-result v8

    add-int/2addr v6, v8

    sub-int v8, v1, v6

    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    move-result v8

    if-gt v8, v5, :cond_5

    const-wide/32 v8, 0x1b7740

    if-gt v1, v6, :cond_4

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    sub-long/2addr v5, v8

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    add-long/2addr v5, v8

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    :cond_4
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    add-long/2addr v5, v8

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    sub-long/2addr v5, v8

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    :cond_5
    :goto_2
    iget-object v1, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->context:Landroid/content/Context;

    const-string v5, "IntelligentNotificationTime"

    invoke-virtual {v1, v5, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    iget-object v5, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->cal:Landroid/icu/util/Calendar;

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    invoke-virtual {v5, v8, v9}, Landroid/icu/util/Calendar;->setTimeInMillis(J)V

    iget-object v3, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->cal:Landroid/icu/util/Calendar;

    invoke-virtual {v3, v4}, Landroid/icu/util/Calendar;->get(I)I

    move-result v3

    const-string v5, "BestTime1Hour"

    invoke-interface {v1, v5, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    iget-object v3, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->cal:Landroid/icu/util/Calendar;

    invoke-virtual {v3, v7}, Landroid/icu/util/Calendar;->get(I)I

    move-result v3

    const-string v5, "BestTime1Minute"

    invoke-interface {v1, v5, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    iget-object v3, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->cal:Landroid/icu/util/Calendar;

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    invoke-virtual {v3, v5, v6}, Landroid/icu/util/Calendar;->setTimeInMillis(J)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->cal:Landroid/icu/util/Calendar;

    invoke-virtual {v0, v4}, Landroid/icu/util/Calendar;->get(I)I

    move-result v0

    const-string v2, "BestTime2Hour"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    iget-object p0, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->cal:Landroid/icu/util/Calendar;

    invoke-virtual {p0, v7}, Landroid/icu/util/Calendar;->get(I)I

    move-result p0

    const-string v0, "BestTime2Minute"

    invoke-interface {v1, v0, p0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method


# virtual methods
.method public compute()V
    .locals 7

    invoke-direct {p0}, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->getOldInstallationTimes()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    invoke-direct {p0, v1, v2}, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->getHour(J)I

    move-result v3

    int-to-long v3, v3

    iget-object v5, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->s1:Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

    iget-wide v5, v5, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->start:J

    cmp-long v5, v3, v5

    if-ltz v5, :cond_0

    iget-object v5, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->s1:Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

    iget-wide v5, v5, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->end:J

    cmp-long v5, v3, v5

    if-gez v5, :cond_0

    iget-object v3, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->s1:Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

    iget v4, v3, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->count:I

    add-int/lit8 v4, v4, 0x1

    iput v4, v3, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->count:I

    iget-object v3, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->s1:Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

    iget-wide v4, v3, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->last:J

    invoke-static {v4, v5, v1, v2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    iput-wide v1, v3, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->last:J

    goto :goto_0

    :cond_0
    iget-object v5, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->s2:Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

    iget-wide v5, v5, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->start:J

    cmp-long v5, v3, v5

    if-ltz v5, :cond_1

    iget-object v5, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->s2:Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

    iget-wide v5, v5, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->end:J

    cmp-long v5, v3, v5

    if-gez v5, :cond_1

    iget-object v3, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->s2:Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

    iget v4, v3, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->count:I

    add-int/lit8 v4, v4, 0x1

    iput v4, v3, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->count:I

    iget-object v3, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->s2:Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

    iget-wide v4, v3, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->last:J

    invoke-static {v4, v5, v1, v2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    iput-wide v1, v3, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->last:J

    goto :goto_0

    :cond_1
    iget-object v5, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->s3:Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

    iget-wide v5, v5, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->start:J

    cmp-long v5, v3, v5

    if-ltz v5, :cond_2

    iget-object v5, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->s3:Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

    iget-wide v5, v5, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->end:J

    cmp-long v3, v3, v5

    if-gez v3, :cond_2

    iget-object v3, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->s3:Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

    iget v4, v3, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->count:I

    add-int/lit8 v4, v4, 0x1

    iput v4, v3, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->count:I

    iget-object v3, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->s3:Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

    iget-wide v4, v3, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->last:J

    invoke-static {v4, v5, v1, v2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    iput-wide v1, v3, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->last:J

    goto :goto_0

    :cond_2
    iget-object v3, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->s4:Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

    iget v4, v3, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->count:I

    add-int/lit8 v4, v4, 0x1

    iput v4, v3, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->count:I

    iget-object v3, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->s4:Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

    iget-wide v4, v3, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->last:J

    invoke-static {v4, v5, v1, v2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    iput-wide v1, v3, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;->last:J

    goto/16 :goto_0

    :cond_3
    iget-object v0, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->slots:Ljava/util/List;

    iget-object v1, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->s1:Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->slots:Ljava/util/List;

    iget-object v1, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->s2:Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->slots:Ljava/util/List;

    iget-object v1, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->s3:Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->slots:Ljava/util/List;

    iget-object v1, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->s4:Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$Slot;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->slots:Ljava/util/List;

    new-instance v1, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$1;

    invoke-direct {v1, p0}, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime$1;-><init>(Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->printList()V

    invoke-direct {p0}, Lcom/motorola/ccc/ota/utils/IntelligentNotificationTime;->storeBestTimes()V

    return-void
.end method
