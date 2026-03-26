.class Lcom/google/android/gms/fitness/service/FitnessSensorService$a;
.super Lcom/google/android/gms/internal/lk$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/fitness/service/FitnessSensorService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation


# instance fields
.field private final Vb:Lcom/google/android/gms/fitness/service/FitnessSensorService;


# direct methods
.method private constructor <init>(Lcom/google/android/gms/fitness/service/FitnessSensorService;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/lk$a;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/fitness/service/FitnessSensorService$a;->Vb:Lcom/google/android/gms/fitness/service/FitnessSensorService;

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/fitness/service/FitnessSensorService;Lcom/google/android/gms/fitness/service/FitnessSensorService$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/fitness/service/FitnessSensorService$a;-><init>(Lcom/google/android/gms/fitness/service/FitnessSensorService;)V

    return-void
.end method

.method private jM()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;
        }
    .end annotation

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v0

    invoke-static {}, Lcom/google/android/gms/internal/kc;->hI()Z

    move-result v1

    const-string v2, "com.google.android.gms"

    iget-object p0, p0, Lcom/google/android/gms/fitness/service/FitnessSensorService$a;->Vb:Lcom/google/android/gms/fitness/service/FitnessSensorService;

    if-eqz v1, :cond_0

    const-string v1, "appops"

    invoke-virtual {p0, v1}, Lcom/google/android/gms/fitness/service/FitnessSensorService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/AppOpsManager;

    invoke-virtual {p0, v0, v2}, Landroid/app/AppOpsManager;->checkPackage(ILjava/lang/String;)V

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/fitness/service/FitnessSensorService;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/pm/PackageManager;->getPackagesForUid(I)[Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_2

    array-length v0, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    aget-object v3, p0, v1

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    return-void

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    new-instance p0, Ljava/lang/SecurityException;

    const-string v0, "Unauthorized caller"

    invoke-direct {p0, v0}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public a(Lcom/google/android/gms/fitness/service/FitnessSensorServiceRequest;Lcom/google/android/gms/internal/kt;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/fitness/service/FitnessSensorService$a;->jM()V

    iget-object p0, p0, Lcom/google/android/gms/fitness/service/FitnessSensorService$a;->Vb:Lcom/google/android/gms/fitness/service/FitnessSensorService;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/fitness/service/FitnessSensorService;->onRegister(Lcom/google/android/gms/fitness/service/FitnessSensorServiceRequest;)Z

    move-result p0

    if-eqz p0, :cond_0

    sget-object p0, Lcom/google/android/gms/common/api/Status;->Jv:Lcom/google/android/gms/common/api/Status;

    goto :goto_0

    :cond_0
    new-instance p0, Lcom/google/android/gms/common/api/Status;

    const/16 p1, 0xd

    invoke-direct {p0, p1}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    :goto_0
    invoke-interface {p2, p0}, Lcom/google/android/gms/internal/kt;->k(Lcom/google/android/gms/common/api/Status;)V

    return-void
.end method

.method public a(Lcom/google/android/gms/internal/lg;Lcom/google/android/gms/internal/kn;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/fitness/service/FitnessSensorService$a;->jM()V

    iget-object p0, p0, Lcom/google/android/gms/fitness/service/FitnessSensorService$a;->Vb:Lcom/google/android/gms/fitness/service/FitnessSensorService;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/lg;->getDataTypes()Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/fitness/service/FitnessSensorService;->onFindDataSources(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    new-instance p1, Lcom/google/android/gms/fitness/result/DataSourcesResult;

    sget-object v0, Lcom/google/android/gms/common/api/Status;->Jv:Lcom/google/android/gms/common/api/Status;

    invoke-direct {p1, p0, v0}, Lcom/google/android/gms/fitness/result/DataSourcesResult;-><init>(Ljava/util/List;Lcom/google/android/gms/common/api/Status;)V

    invoke-interface {p2, p1}, Lcom/google/android/gms/internal/kn;->a(Lcom/google/android/gms/fitness/result/DataSourcesResult;)V

    return-void
.end method

.method public a(Lcom/google/android/gms/internal/li;Lcom/google/android/gms/internal/kt;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/fitness/service/FitnessSensorService$a;->jM()V

    iget-object p0, p0, Lcom/google/android/gms/fitness/service/FitnessSensorService$a;->Vb:Lcom/google/android/gms/fitness/service/FitnessSensorService;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/li;->getDataSource()Lcom/google/android/gms/fitness/data/DataSource;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/fitness/service/FitnessSensorService;->onUnregister(Lcom/google/android/gms/fitness/data/DataSource;)Z

    move-result p0

    if-eqz p0, :cond_0

    sget-object p0, Lcom/google/android/gms/common/api/Status;->Jv:Lcom/google/android/gms/common/api/Status;

    goto :goto_0

    :cond_0
    new-instance p0, Lcom/google/android/gms/common/api/Status;

    const/16 p1, 0xd

    invoke-direct {p0, p1}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    :goto_0
    invoke-interface {p2, p0}, Lcom/google/android/gms/internal/kt;->k(Lcom/google/android/gms/common/api/Status;)V

    return-void
.end method
