.class Lcom/motorola/ccc/ota/ui/FileUploadService$1;
.super Landroid/os/Handler;
.source "FileUploadService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/FileUploadService;->uploadUEFailureFiles()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/FileUploadService;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/FileUploadService;Landroid/os/Looper;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/FileUploadService$1;->this$0:Lcom/motorola/ccc/ota/ui/FileUploadService;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/FileUploadService$1;->this$0:Lcom/motorola/ccc/ota/ui/FileUploadService;

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/ui/FileUploadService;->-$$Nest$mdeleteZipFilePostUpload(Lcom/motorola/ccc/ota/ui/FileUploadService;Z)V

    return-void
.end method
