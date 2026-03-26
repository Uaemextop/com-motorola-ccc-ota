.class public Lcom/google/android/gms/internal/ap;
.super Ljava/lang/Object;


# instance fields
.field private final nJ:I

.field private final nK:I

.field private final nL:Lcom/google/android/gms/internal/ao;

.field private nM:Landroid/util/Base64OutputStream;

.field private nN:Ljava/io/ByteArrayOutputStream;


# direct methods
.method public constructor <init>(I)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/android/gms/internal/ar;

    invoke-direct {v0}, Lcom/google/android/gms/internal/ar;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/ap;->nL:Lcom/google/android/gms/internal/ao;

    iput p1, p0, Lcom/google/android/gms/internal/ap;->nK:I

    const/4 p1, 0x6

    iput p1, p0, Lcom/google/android/gms/internal/ap;->nJ:I

    return-void
.end method

.method private m(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    const-string v0, "\n"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    const-string v0, ""

    if-eqz p1, :cond_3

    array-length v1, p1

    if-nez v1, :cond_0

    goto :goto_2

    :cond_0
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    iput-object v1, p0, Lcom/google/android/gms/internal/ap;->nN:Ljava/io/ByteArrayOutputStream;

    new-instance v1, Landroid/util/Base64OutputStream;

    iget-object v2, p0, Lcom/google/android/gms/internal/ap;->nN:Ljava/io/ByteArrayOutputStream;

    const/16 v3, 0xa

    invoke-direct {v1, v2, v3}, Landroid/util/Base64OutputStream;-><init>(Ljava/io/OutputStream;I)V

    iput-object v1, p0, Lcom/google/android/gms/internal/ap;->nM:Landroid/util/Base64OutputStream;

    new-instance v1, Lcom/google/android/gms/internal/ap$1;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/ap$1;-><init>(Lcom/google/android/gms/internal/ap;)V

    invoke-static {p1, v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    const/4 v1, 0x0

    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_2

    iget v2, p0, Lcom/google/android/gms/internal/ap;->nK:I

    if-ge v1, v2, :cond_2

    aget-object v2, p1, v1

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1

    goto :goto_1

    :cond_1
    :try_start_0
    iget-object v2, p0, Lcom/google/android/gms/internal/ap;->nM:Landroid/util/Base64OutputStream;

    iget-object v3, p0, Lcom/google/android/gms/internal/ap;->nL:Lcom/google/android/gms/internal/ao;

    aget-object v4, p1, v1

    invoke-virtual {v3, v4}, Lcom/google/android/gms/internal/ao;->l(Ljava/lang/String;)[B

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/util/Base64OutputStream;->write([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v2

    const-string v3, "Error while writing hash to byteStream"

    invoke-static {v3, v2}, Lcom/google/android/gms/internal/gs;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    :try_start_1
    iget-object p1, p0, Lcom/google/android/gms/internal/ap;->nM:Landroid/util/Base64OutputStream;

    invoke-virtual {p1}, Landroid/util/Base64OutputStream;->flush()V

    iget-object p1, p0, Lcom/google/android/gms/internal/ap;->nM:Landroid/util/Base64OutputStream;

    invoke-virtual {p1}, Landroid/util/Base64OutputStream;->close()V

    iget-object p0, p0, Lcom/google/android/gms/internal/ap;->nN:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    return-object p0

    :catch_1
    move-exception p0

    const-string p1, "HashManager: Unable to convert to base 64"

    invoke-static {p1, p0}, Lcom/google/android/gms/internal/gs;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_3
    :goto_2
    return-object v0
.end method


# virtual methods
.method public a(Ljava/util/ArrayList;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ap;->n(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method n(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    const-string v0, "\n"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    const-string v0, ""

    if-eqz p1, :cond_4

    array-length v1, p1

    if-nez v1, :cond_0

    goto/16 :goto_3

    :cond_0
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    iput-object v1, p0, Lcom/google/android/gms/internal/ap;->nN:Ljava/io/ByteArrayOutputStream;

    new-instance v1, Landroid/util/Base64OutputStream;

    iget-object v2, p0, Lcom/google/android/gms/internal/ap;->nN:Ljava/io/ByteArrayOutputStream;

    const/16 v3, 0xa

    invoke-direct {v1, v2, v3}, Landroid/util/Base64OutputStream;-><init>(Ljava/io/OutputStream;I)V

    iput-object v1, p0, Lcom/google/android/gms/internal/ap;->nM:Landroid/util/Base64OutputStream;

    new-instance v1, Ljava/util/PriorityQueue;

    iget v2, p0, Lcom/google/android/gms/internal/ap;->nK:I

    new-instance v3, Lcom/google/android/gms/internal/ap$2;

    invoke-direct {v3, p0}, Lcom/google/android/gms/internal/ap$2;-><init>(Lcom/google/android/gms/internal/ap;)V

    invoke-direct {v1, v2, v3}, Ljava/util/PriorityQueue;-><init>(ILjava/util/Comparator;)V

    const/4 v2, 0x0

    :goto_0
    array-length v3, p1

    if-ge v2, v3, :cond_2

    aget-object v3, p1, v2

    invoke-static {v3}, Lcom/google/android/gms/internal/aq;->p(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    array-length v4, v3

    iget v5, p0, Lcom/google/android/gms/internal/ap;->nJ:I

    if-ge v4, v5, :cond_1

    goto :goto_1

    :cond_1
    iget v4, p0, Lcom/google/android/gms/internal/ap;->nK:I

    invoke-static {v3, v4, v5, v1}, Lcom/google/android/gms/internal/as;->a([Ljava/lang/String;IILjava/util/PriorityQueue;)V

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    invoke-virtual {v1}, Ljava/util/PriorityQueue;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/as$a;

    :try_start_0
    iget-object v2, p0, Lcom/google/android/gms/internal/ap;->nM:Landroid/util/Base64OutputStream;

    iget-object v3, p0, Lcom/google/android/gms/internal/ap;->nL:Lcom/google/android/gms/internal/ao;

    iget-object v1, v1, Lcom/google/android/gms/internal/as$a;->nQ:Ljava/lang/String;

    invoke-virtual {v3, v1}, Lcom/google/android/gms/internal/ao;->l(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/util/Base64OutputStream;->write([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v1

    const-string v2, "Error while writing hash to byteStream"

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/gs;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    :cond_3
    :try_start_1
    iget-object p1, p0, Lcom/google/android/gms/internal/ap;->nM:Landroid/util/Base64OutputStream;

    invoke-virtual {p1}, Landroid/util/Base64OutputStream;->flush()V

    iget-object p1, p0, Lcom/google/android/gms/internal/ap;->nM:Landroid/util/Base64OutputStream;

    invoke-virtual {p1}, Landroid/util/Base64OutputStream;->close()V

    iget-object p0, p0, Lcom/google/android/gms/internal/ap;->nN:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    return-object p0

    :catch_1
    move-exception p0

    const-string p1, "HashManager: unable to convert to base 64"

    invoke-static {p1, p0}, Lcom/google/android/gms/internal/gs;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_4
    :goto_3
    return-object v0
.end method
