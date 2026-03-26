.class public Lcom/motorola/ccc/ota/ui/HtmlUtils;
.super Ljava/lang/Object;
.source "HtmlUtils.java"

# interfaces
.implements Landroid/text/Html$TagHandler;


# static fields
.field private static final END_TAG_LENGTH:I = 0x5

.field private static final END_TAG_OL:Ljava/lang/String; = "</ol>"

.field private static final END_TAG_UL:Ljava/lang/String; = "</ul>"

.field private static final HTML_BULLET:Ljava/lang/String; = "\u2022  "

.field private static final LI:Ljava/lang/String; = "li"

.field private static final OL:Ljava/lang/String; = "ol"

.field private static final START_TAG_OL:Ljava/lang/String; = "<ol>"

.field private static final START_TAG_UL:Ljava/lang/String; = "<ul>"

.field private static final UL:Ljava/lang/String; = "ul"


# instance fields
.field private mIndex:I

.field private mOlcount:I

.field private mOloccurence:I

.field private mParent:Ljava/lang/String;

.field private mUlcount:I

.field private mUloccurence:I

.field private mUpgrageNotes:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/motorola/ccc/ota/ui/HtmlUtils;->mParent:Ljava/lang/String;

    const/4 v0, 0x0

    iput v0, p0, Lcom/motorola/ccc/ota/ui/HtmlUtils;->mIndex:I

    iput v0, p0, Lcom/motorola/ccc/ota/ui/HtmlUtils;->mOlcount:I

    iput v0, p0, Lcom/motorola/ccc/ota/ui/HtmlUtils;->mUlcount:I

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/HtmlUtils;->mUpgrageNotes:Ljava/lang/String;

    const-string p1, "</ol>"

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/HtmlUtils;->getOccurence(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/motorola/ccc/ota/ui/HtmlUtils;->mOloccurence:I

    const-string p1, "</ul>"

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/ui/HtmlUtils;->getOccurence(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/motorola/ccc/ota/ui/HtmlUtils;->mUloccurence:I

    return-void
.end method

.method private getOccurence(Ljava/lang/String;)I
    .locals 1

    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object p1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/HtmlUtils;->mUpgrageNotes:Ljava/lang/String;

    invoke-virtual {p1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    const/4 p1, 0x0

    :goto_0
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_0

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    return p1
.end method

.method private handleList(ZLandroid/text/Editable;)V
    .locals 2

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/HtmlUtils;->mParent:Ljava/lang/String;

    const-string v1, "ul"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "\n\t\u2022  "

    invoke-interface {p2, v0}, Landroid/text/Editable;->append(Ljava/lang/CharSequence;)Landroid/text/Editable;

    :cond_0
    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/HtmlUtils;->mParent:Ljava/lang/String;

    const-string v0, "ol"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget p1, p0, Lcom/motorola/ccc/ota/ui/HtmlUtils;->mIndex:I

    if-lez p1, :cond_1

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "\n\t"

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v0, p0, Lcom/motorola/ccc/ota/ui/HtmlUtils;->mIndex:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, ". "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, p1}, Landroid/text/Editable;->append(Ljava/lang/CharSequence;)Landroid/text/Editable;

    iget p1, p0, Lcom/motorola/ccc/ota/ui/HtmlUtils;->mIndex:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/motorola/ccc/ota/ui/HtmlUtils;->mIndex:I

    :cond_1
    return-void
.end method

.method private handleOrederdList(ZLandroid/text/Editable;)V
    .locals 2

    const/4 v0, 0x1

    if-eqz p1, :cond_0

    const-string p1, "ol"

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/HtmlUtils;->mParent:Ljava/lang/String;

    iput v0, p0, Lcom/motorola/ccc/ota/ui/HtmlUtils;->mIndex:I

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    iput p1, p0, Lcom/motorola/ccc/ota/ui/HtmlUtils;->mIndex:I

    iget p1, p0, Lcom/motorola/ccc/ota/ui/HtmlUtils;->mOlcount:I

    add-int/2addr p1, v0

    iput p1, p0, Lcom/motorola/ccc/ota/ui/HtmlUtils;->mOlcount:I

    const-string v0, "</ol>"

    iget v1, p0, Lcom/motorola/ccc/ota/ui/HtmlUtils;->mOloccurence:I

    invoke-direct {p0, v0, p1, v1, p2}, Lcom/motorola/ccc/ota/ui/HtmlUtils;->mangaeSpace(Ljava/lang/String;IILandroid/text/Editable;)V

    :goto_0
    return-void
.end method

.method private handleUnOrderedList(ZLandroid/text/Editable;)V
    .locals 2

    if-eqz p1, :cond_0

    const-string p1, "ul"

    iput-object p1, p0, Lcom/motorola/ccc/ota/ui/HtmlUtils;->mParent:Ljava/lang/String;

    goto :goto_0

    :cond_0
    iget p1, p0, Lcom/motorola/ccc/ota/ui/HtmlUtils;->mUlcount:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/motorola/ccc/ota/ui/HtmlUtils;->mUlcount:I

    const-string v0, "</ul>"

    iget v1, p0, Lcom/motorola/ccc/ota/ui/HtmlUtils;->mUloccurence:I

    invoke-direct {p0, v0, p1, v1, p2}, Lcom/motorola/ccc/ota/ui/HtmlUtils;->mangaeSpace(Ljava/lang/String;IILandroid/text/Editable;)V

    :goto_0
    return-void
.end method

.method private mangaeSpace(Ljava/lang/String;IILandroid/text/Editable;)V
    .locals 3

    iget-object v0, p0, Lcom/motorola/ccc/ota/ui/HtmlUtils;->mUpgrageNotes:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    const-string v1, "\n"

    const-string v2, "\n\n"

    if-eqz v0, :cond_1

    if-ge p2, p3, :cond_3

    invoke-direct {p0, p1, p2}, Lcom/motorola/ccc/ota/ui/HtmlUtils;->nextTag(Ljava/lang/String;I)Z

    move-result p0

    if-eqz p0, :cond_0

    invoke-interface {p4, v1}, Landroid/text/Editable;->append(Ljava/lang/CharSequence;)Landroid/text/Editable;

    goto :goto_0

    :cond_0
    invoke-interface {p4, v2}, Landroid/text/Editable;->append(Ljava/lang/CharSequence;)Landroid/text/Editable;

    goto :goto_0

    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/motorola/ccc/ota/ui/HtmlUtils;->nextTag(Ljava/lang/String;I)Z

    move-result p0

    if-eqz p0, :cond_2

    invoke-interface {p4, v1}, Landroid/text/Editable;->append(Ljava/lang/CharSequence;)Landroid/text/Editable;

    goto :goto_0

    :cond_2
    invoke-interface {p4, v2}, Landroid/text/Editable;->append(Ljava/lang/CharSequence;)Landroid/text/Editable;

    :cond_3
    :goto_0
    return-void
.end method

.method private nextTag(Ljava/lang/String;I)Z
    .locals 4

    const/4 v0, 0x0

    move v1, v0

    move v2, v1

    :goto_0
    if-eq v1, p2, :cond_0

    iget-object v3, p0, Lcom/motorola/ccc/ota/ui/HtmlUtils;->mUpgrageNotes:Ljava/lang/String;

    invoke-virtual {v3, p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    add-int/lit8 v1, v1, 0x1

    add-int/lit8 v2, v2, 0x5

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/motorola/ccc/ota/ui/HtmlUtils;->mUpgrageNotes:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    const-string p2, "<ul>"

    invoke-virtual {p1, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p0, p0, Lcom/motorola/ccc/ota/ui/HtmlUtils;->mUpgrageNotes:Ljava/lang/String;

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    const-string p1, "<ol>"

    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_2

    :cond_1
    const/4 v0, 0x1

    :cond_2
    return v0
.end method


# virtual methods
.method public handleTag(ZLjava/lang/String;Landroid/text/Editable;Lorg/xml/sax/XMLReader;)V
    .locals 0

    const-string p4, "ul"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_0

    invoke-direct {p0, p1, p3}, Lcom/motorola/ccc/ota/ui/HtmlUtils;->handleUnOrderedList(ZLandroid/text/Editable;)V

    goto :goto_0

    :cond_0
    const-string p4, "ol"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_1

    invoke-direct {p0, p1, p3}, Lcom/motorola/ccc/ota/ui/HtmlUtils;->handleOrederdList(ZLandroid/text/Editable;)V

    goto :goto_0

    :cond_1
    const-string p4, "li"

    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-direct {p0, p1, p3}, Lcom/motorola/ccc/ota/ui/HtmlUtils;->handleList(ZLandroid/text/Editable;)V

    :cond_2
    :goto_0
    return-void
.end method
