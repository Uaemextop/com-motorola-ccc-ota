.class public final Lcom/google/android/gms/drive/MetadataChangeSet;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/drive/MetadataChangeSet$Builder;
    }
.end annotation


# static fields
.field public static final Nt:Lcom/google/android/gms/drive/MetadataChangeSet;


# instance fields
.field private final Nu:Lcom/google/android/gms/drive/metadata/internal/MetadataBundle;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/google/android/gms/drive/MetadataChangeSet;

    invoke-static {}, Lcom/google/android/gms/drive/metadata/internal/MetadataBundle;->io()Lcom/google/android/gms/drive/metadata/internal/MetadataBundle;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/drive/MetadataChangeSet;-><init>(Lcom/google/android/gms/drive/metadata/internal/MetadataBundle;)V

    sput-object v0, Lcom/google/android/gms/drive/MetadataChangeSet;->Nt:Lcom/google/android/gms/drive/MetadataChangeSet;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/drive/metadata/internal/MetadataBundle;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/google/android/gms/drive/metadata/internal/MetadataBundle;->a(Lcom/google/android/gms/drive/metadata/internal/MetadataBundle;)Lcom/google/android/gms/drive/metadata/internal/MetadataBundle;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/drive/MetadataChangeSet;->Nu:Lcom/google/android/gms/drive/metadata/internal/MetadataBundle;

    return-void
.end method


# virtual methods
.method public getDescription()Ljava/lang/String;
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/drive/MetadataChangeSet;->Nu:Lcom/google/android/gms/drive/metadata/internal/MetadataBundle;

    sget-object v0, Lcom/google/android/gms/internal/kd;->PP:Lcom/google/android/gms/drive/metadata/MetadataField;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/drive/metadata/internal/MetadataBundle;->a(Lcom/google/android/gms/drive/metadata/MetadataField;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public getIndexableText()Ljava/lang/String;
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/drive/MetadataChangeSet;->Nu:Lcom/google/android/gms/drive/metadata/internal/MetadataBundle;

    sget-object v0, Lcom/google/android/gms/internal/kd;->PU:Lcom/google/android/gms/drive/metadata/MetadataField;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/drive/metadata/internal/MetadataBundle;->a(Lcom/google/android/gms/drive/metadata/MetadataField;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public getLastViewedByMeDate()Ljava/util/Date;
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/drive/MetadataChangeSet;->Nu:Lcom/google/android/gms/drive/metadata/internal/MetadataBundle;

    sget-object v0, Lcom/google/android/gms/internal/kf;->Qu:Lcom/google/android/gms/internal/kf$b;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/drive/metadata/internal/MetadataBundle;->a(Lcom/google/android/gms/drive/metadata/MetadataField;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Date;

    return-object p0
.end method

.method public getMimeType()Ljava/lang/String;
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/drive/MetadataChangeSet;->Nu:Lcom/google/android/gms/drive/metadata/internal/MetadataBundle;

    sget-object v0, Lcom/google/android/gms/internal/kd;->Qd:Lcom/google/android/gms/internal/kd$c;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/drive/metadata/internal/MetadataBundle;->a(Lcom/google/android/gms/drive/metadata/MetadataField;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/drive/MetadataChangeSet;->Nu:Lcom/google/android/gms/drive/metadata/internal/MetadataBundle;

    sget-object v0, Lcom/google/android/gms/internal/kd;->Qm:Lcom/google/android/gms/internal/kd$g;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/drive/metadata/internal/MetadataBundle;->a(Lcom/google/android/gms/drive/metadata/MetadataField;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public hS()Lcom/google/android/gms/drive/metadata/internal/MetadataBundle;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/drive/MetadataChangeSet;->Nu:Lcom/google/android/gms/drive/metadata/internal/MetadataBundle;

    return-object p0
.end method

.method public isPinned()Ljava/lang/Boolean;
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/drive/MetadataChangeSet;->Nu:Lcom/google/android/gms/drive/metadata/internal/MetadataBundle;

    sget-object v0, Lcom/google/android/gms/internal/kd;->PY:Lcom/google/android/gms/internal/kd$b;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/drive/metadata/internal/MetadataBundle;->a(Lcom/google/android/gms/drive/metadata/MetadataField;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    return-object p0
.end method

.method public isStarred()Ljava/lang/Boolean;
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/drive/MetadataChangeSet;->Nu:Lcom/google/android/gms/drive/metadata/internal/MetadataBundle;

    sget-object v0, Lcom/google/android/gms/internal/kd;->Qk:Lcom/google/android/gms/internal/kd$f;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/drive/metadata/internal/MetadataBundle;->a(Lcom/google/android/gms/drive/metadata/MetadataField;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    return-object p0
.end method

.method public isViewed()Ljava/lang/Boolean;
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/drive/MetadataChangeSet;->Nu:Lcom/google/android/gms/drive/metadata/internal/MetadataBundle;

    sget-object v0, Lcom/google/android/gms/internal/kd;->Qc:Lcom/google/android/gms/drive/metadata/MetadataField;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/drive/metadata/internal/MetadataBundle;->a(Lcom/google/android/gms/drive/metadata/MetadataField;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    return-object p0
.end method
