.class Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader$HttpHeader;
.super Ljava/lang/Object;
.source "AdvancedFileDownloader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HttpHeader"
.end annotation


# instance fields
.field private final key:Ljava/lang/String;

.field final synthetic this$0:Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;

.field private final value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader$HttpHeader;->this$0:Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader$HttpHeader;->key:Ljava/lang/String;

    iput-object p3, p0, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader$HttpHeader;->value:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader$HttpHeader;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader$HttpHeader;->key:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader$HttpHeader;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/otalib/downloadservice/download/AdvancedFileDownloader$HttpHeader;->value:Ljava/lang/String;

    return-object p0
.end method
