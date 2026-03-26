.class public Lcom/motorola/ccc/ota/stats/ProcFileReader;
.super Ljava/lang/Object;
.source "ProcFileReader.java"

# interfaces
.implements Ljava/io/Closeable;


# instance fields
.field private final mBuffer:[B

.field private mLineFinished:Z

.field private final mStream:Ljava/io/InputStream;

.field private mTail:I


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x1000

    invoke-direct {p0, p1, v0}, Lcom/motorola/ccc/ota/stats/ProcFileReader;-><init>(Ljava/io/InputStream;I)V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/stats/ProcFileReader;->mStream:Ljava/io/InputStream;

    new-array p1, p2, [B

    iput-object p1, p0, Lcom/motorola/ccc/ota/stats/ProcFileReader;->mBuffer:[B

    invoke-direct {p0}, Lcom/motorola/ccc/ota/stats/ProcFileReader;->fillBuf()I

    return-void
.end method

.method private consumeBuf(I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/motorola/ccc/ota/stats/ProcFileReader;->mBuffer:[B

    iget v1, p0, Lcom/motorola/ccc/ota/stats/ProcFileReader;->mTail:I

    sub-int/2addr v1, p1

    const/4 v2, 0x0

    invoke-static {v0, p1, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget v0, p0, Lcom/motorola/ccc/ota/stats/ProcFileReader;->mTail:I

    sub-int/2addr v0, p1

    iput v0, p0, Lcom/motorola/ccc/ota/stats/ProcFileReader;->mTail:I

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/motorola/ccc/ota/stats/ProcFileReader;->fillBuf()I

    :cond_0
    return-void
.end method

.method private fillBuf()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/motorola/ccc/ota/stats/ProcFileReader;->mBuffer:[B

    array-length v1, v0

    iget v2, p0, Lcom/motorola/ccc/ota/stats/ProcFileReader;->mTail:I

    sub-int/2addr v1, v2

    if-eqz v1, :cond_1

    iget-object v3, p0, Lcom/motorola/ccc/ota/stats/ProcFileReader;->mStream:Ljava/io/InputStream;

    invoke-virtual {v3, v0, v2, v1}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    iget v1, p0, Lcom/motorola/ccc/ota/stats/ProcFileReader;->mTail:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/motorola/ccc/ota/stats/ProcFileReader;->mTail:I

    :cond_0
    return v0

    :cond_1
    new-instance p0, Ljava/io/IOException;

    const-string v0, "attempting to fill already-full buffer"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private invalidLong(I)Ljava/lang/NumberFormatException;
    .locals 4

    new-instance v0, Ljava/lang/NumberFormatException;

    new-instance v1, Ljava/lang/String;

    iget-object p0, p0, Lcom/motorola/ccc/ota/stats/ProcFileReader;->mBuffer:[B

    const-string v2, "US_ASCII"

    invoke-static {v2}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3, p1, v2}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    const-string p0, "invalid long: "

    invoke-virtual {p0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private nextTokenIndex()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-boolean v0, p0, Lcom/motorola/ccc/ota/stats/ProcFileReader;->mLineFinished:Z

    if-eqz v0, :cond_0

    const/4 p0, -0x1

    return p0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget v1, p0, Lcom/motorola/ccc/ota/stats/ProcFileReader;->mTail:I

    if-ge v0, v1, :cond_3

    iget-object v1, p0, Lcom/motorola/ccc/ota/stats/ProcFileReader;->mBuffer:[B

    aget-byte v1, v1, v0

    const/16 v2, 0xa

    if-ne v1, v2, :cond_1

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/motorola/ccc/ota/stats/ProcFileReader;->mLineFinished:Z

    return v0

    :cond_1
    const/16 v2, 0x20

    if-ne v1, v2, :cond_2

    return v0

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    invoke-direct {p0}, Lcom/motorola/ccc/ota/stats/ProcFileReader;->fillBuf()I

    move-result v1

    if-lez v1, :cond_4

    goto :goto_0

    :cond_4
    new-instance p0, Ljava/net/ProtocolException;

    const-string v0, "End of stream while looking for token boundary"

    invoke-direct {p0, v0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private parseAndConsumeLong(I)J
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/motorola/ccc/ota/stats/ProcFileReader;->mBuffer:[B

    const/4 v1, 0x0

    aget-byte v0, v0, v1

    const/16 v2, 0x2d

    const/4 v3, 0x1

    if-ne v0, v2, :cond_0

    move v1, v3

    :cond_0
    const-wide/16 v4, 0x0

    move v0, v1

    :goto_0
    if-ge v0, p1, :cond_3

    iget-object v2, p0, Lcom/motorola/ccc/ota/stats/ProcFileReader;->mBuffer:[B

    aget-byte v2, v2, v0

    add-int/lit8 v2, v2, -0x30

    if-ltz v2, :cond_2

    const/16 v6, 0x9

    if-gt v2, v6, :cond_2

    const-wide/16 v6, 0xa

    mul-long/2addr v6, v4

    int-to-long v8, v2

    sub-long/2addr v6, v8

    cmp-long v2, v6, v4

    if-gtz v2, :cond_1

    add-int/lit8 v0, v0, 0x1

    move-wide v4, v6

    goto :goto_0

    :cond_1
    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/stats/ProcFileReader;->invalidLong(I)Ljava/lang/NumberFormatException;

    move-result-object p0

    throw p0

    :cond_2
    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/stats/ProcFileReader;->invalidLong(I)Ljava/lang/NumberFormatException;

    move-result-object p0

    throw p0

    :cond_3
    add-int/2addr p1, v3

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/stats/ProcFileReader;->consumeBuf(I)V

    if-eqz v1, :cond_4

    goto :goto_1

    :cond_4
    neg-long v4, v4

    :goto_1
    return-wide v4
.end method

.method private parseAndConsumeString(I)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/motorola/ccc/ota/stats/ProcFileReader;->mBuffer:[B

    const-string v2, "US_ASCII"

    invoke-static {v2}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, p1, v2}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    add-int/lit8 p1, p1, 0x1

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/stats/ProcFileReader;->consumeBuf(I)V

    return-object v0
.end method


# virtual methods
.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object p0, p0, Lcom/motorola/ccc/ota/stats/ProcFileReader;->mStream:Ljava/io/InputStream;

    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    return-void
.end method

.method public finishLine()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-boolean v0, p0, Lcom/motorola/ccc/ota/stats/ProcFileReader;->mLineFinished:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iput-boolean v1, p0, Lcom/motorola/ccc/ota/stats/ProcFileReader;->mLineFinished:Z

    return-void

    :cond_0
    :goto_0
    iget v0, p0, Lcom/motorola/ccc/ota/stats/ProcFileReader;->mTail:I

    if-ge v1, v0, :cond_2

    iget-object v0, p0, Lcom/motorola/ccc/ota/stats/ProcFileReader;->mBuffer:[B

    aget-byte v0, v0, v1

    const/16 v2, 0xa

    if-ne v0, v2, :cond_1

    add-int/lit8 v1, v1, 0x1

    invoke-direct {p0, v1}, Lcom/motorola/ccc/ota/stats/ProcFileReader;->consumeBuf(I)V

    return-void

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    invoke-direct {p0}, Lcom/motorola/ccc/ota/stats/ProcFileReader;->fillBuf()I

    move-result v0

    if-lez v0, :cond_3

    goto :goto_0

    :cond_3
    new-instance p0, Ljava/net/ProtocolException;

    const-string v0, "End of stream while looking for line boundary"

    invoke-direct {p0, v0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public hasMoreData()Z
    .locals 0

    iget p0, p0, Lcom/motorola/ccc/ota/stats/ProcFileReader;->mTail:I

    if-lez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public nextInt()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/stats/ProcFileReader;->nextLong()J

    move-result-wide v0

    const-wide/32 v2, 0x7fffffff

    cmp-long p0, v0, v2

    if-gtz p0, :cond_0

    const-wide/32 v2, -0x80000000

    cmp-long p0, v0, v2

    if-ltz p0, :cond_0

    long-to-int p0, v0

    return p0

    :cond_0
    new-instance p0, Ljava/lang/NumberFormatException;

    const-string v0, "parsed value larger than integer"

    invoke-direct {p0, v0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public nextLong()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/motorola/ccc/ota/stats/ProcFileReader;->nextTokenIndex()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    invoke-direct {p0, v0}, Lcom/motorola/ccc/ota/stats/ProcFileReader;->parseAndConsumeLong(I)J

    move-result-wide v0

    return-wide v0

    :cond_0
    new-instance p0, Ljava/net/ProtocolException;

    const-string v0, "Missing required long"

    invoke-direct {p0, v0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public nextOptionalLong(J)J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/motorola/ccc/ota/stats/ProcFileReader;->nextTokenIndex()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    return-wide p1

    :cond_0
    invoke-direct {p0, v0}, Lcom/motorola/ccc/ota/stats/ProcFileReader;->parseAndConsumeLong(I)J

    move-result-wide p0

    return-wide p0
.end method

.method public nextString()Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/motorola/ccc/ota/stats/ProcFileReader;->nextTokenIndex()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    invoke-direct {p0, v0}, Lcom/motorola/ccc/ota/stats/ProcFileReader;->parseAndConsumeString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    new-instance p0, Ljava/net/ProtocolException;

    const-string v0, "Missing required string"

    invoke-direct {p0, v0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
