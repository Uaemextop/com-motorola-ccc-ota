.class Lcom/motorola/ccc/ota/ui/HistoryDialog$1;
.super Ljava/lang/Object;
.source "HistoryDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/ccc/ota/ui/HistoryDialog;->handleButtons()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/ccc/ota/ui/HistoryDialog;


# direct methods
.method constructor <init>(Lcom/motorola/ccc/ota/ui/HistoryDialog;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog$1;->this$0:Lcom/motorola/ccc/ota/ui/HistoryDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/HistoryDialog$1;->this$0:Lcom/motorola/ccc/ota/ui/HistoryDialog;

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/ui/HistoryDialog;->dismiss()V

    return-void
.end method
