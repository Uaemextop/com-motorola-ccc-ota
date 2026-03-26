.class public final Lcom/google/android/gms/internal/nu;
.super Lcom/google/android/gms/internal/jj;

# interfaces
.implements Lcom/google/android/gms/plus/model/moments/ItemScope;


# static fields
.field public static final CREATOR:Lcom/google/android/gms/internal/nv;

.field private static final amb:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/ji$a<",
            "**>;>;"
        }
    .end annotation
.end field


# instance fields
.field BL:Ljava/lang/String;

.field final BR:I

.field Tr:Ljava/lang/String;

.field aek:D

.field ael:D

.field amA:Ljava/lang/String;

.field amB:Ljava/lang/String;

.field amC:Lcom/google/android/gms/internal/nu;

.field amD:Ljava/lang/String;

.field amE:Ljava/lang/String;

.field amF:Ljava/lang/String;

.field amG:Lcom/google/android/gms/internal/nu;

.field amH:Lcom/google/android/gms/internal/nu;

.field amI:Lcom/google/android/gms/internal/nu;

.field amJ:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/nu;",
            ">;"
        }
    .end annotation
.end field

.field amK:Ljava/lang/String;

.field amL:Ljava/lang/String;

.field amM:Ljava/lang/String;

.field amN:Ljava/lang/String;

.field amO:Lcom/google/android/gms/internal/nu;

.field amP:Ljava/lang/String;

.field amQ:Ljava/lang/String;

.field amR:Ljava/lang/String;

.field amS:Lcom/google/android/gms/internal/nu;

.field amT:Ljava/lang/String;

.field amU:Ljava/lang/String;

.field amV:Ljava/lang/String;

.field amW:Ljava/lang/String;

.field final amc:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field amd:Lcom/google/android/gms/internal/nu;

.field ame:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field amf:Lcom/google/android/gms/internal/nu;

.field amg:Ljava/lang/String;

.field amh:Ljava/lang/String;

.field ami:Ljava/lang/String;

.field amj:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/nu;",
            ">;"
        }
    .end annotation
.end field

.field amk:I

.field aml:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/nu;",
            ">;"
        }
    .end annotation
.end field

.field amm:Lcom/google/android/gms/internal/nu;

.field amn:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/nu;",
            ">;"
        }
    .end annotation
.end field

.field amo:Ljava/lang/String;

.field amp:Ljava/lang/String;

.field amq:Lcom/google/android/gms/internal/nu;

.field amr:Ljava/lang/String;

.field ams:Ljava/lang/String;

.field amt:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/nu;",
            ">;"
        }
    .end annotation
.end field

.field amu:Ljava/lang/String;

.field amv:Ljava/lang/String;

.field amw:Ljava/lang/String;

.field amx:Ljava/lang/String;

.field amy:Ljava/lang/String;

.field amz:Ljava/lang/String;

.field mName:Ljava/lang/String;

.field ol:Ljava/lang/String;

.field uO:Ljava/lang/String;

.field uR:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Lcom/google/android/gms/internal/nv;

    invoke-direct {v0}, Lcom/google/android/gms/internal/nv;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/nu;->CREATOR:Lcom/google/android/gms/internal/nv;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/nu;->amb:Ljava/util/HashMap;

    const-string v1, "about"

    const/4 v2, 0x2

    const-class v3, Lcom/google/android/gms/internal/nu;

    invoke-static {v1, v2, v3}, Lcom/google/android/gms/internal/ji$a;->a(Ljava/lang/String;ILjava/lang/Class;)Lcom/google/android/gms/internal/ji$a;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x3

    const-string v2, "additionalName"

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/ji$a;->m(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x4

    const-string v2, "address"

    invoke-static {v2, v1, v3}, Lcom/google/android/gms/internal/ji$a;->a(Ljava/lang/String;ILjava/lang/Class;)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x5

    const-string v2, "addressCountry"

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x6

    const-string v2, "addressLocality"

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x7

    const-string v2, "addressRegion"

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0x8

    const-string v2, "associated_media"

    invoke-static {v2, v1, v3}, Lcom/google/android/gms/internal/ji$a;->b(Ljava/lang/String;ILjava/lang/Class;)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0x9

    const-string v2, "attendeeCount"

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/ji$a;->i(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0xa

    const-string v2, "attendees"

    invoke-static {v2, v1, v3}, Lcom/google/android/gms/internal/ji$a;->b(Ljava/lang/String;ILjava/lang/Class;)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0xb

    const-string v2, "audio"

    invoke-static {v2, v1, v3}, Lcom/google/android/gms/internal/ji$a;->a(Ljava/lang/String;ILjava/lang/Class;)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0xc

    const-string v2, "author"

    invoke-static {v2, v1, v3}, Lcom/google/android/gms/internal/ji$a;->b(Ljava/lang/String;ILjava/lang/Class;)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0xd

    const-string v2, "bestRating"

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0xe

    const-string v2, "birthDate"

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0xf

    const-string v2, "byArtist"

    invoke-static {v2, v1, v3}, Lcom/google/android/gms/internal/ji$a;->a(Ljava/lang/String;ILjava/lang/Class;)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0x10

    const-string v2, "caption"

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0x11

    const-string v2, "contentSize"

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0x12

    const-string v2, "contentUrl"

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0x13

    const-string v2, "contributor"

    invoke-static {v2, v1, v3}, Lcom/google/android/gms/internal/ji$a;->b(Ljava/lang/String;ILjava/lang/Class;)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0x14

    const-string v2, "dateCreated"

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0x15

    const-string v2, "dateModified"

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0x16

    const-string v2, "datePublished"

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "description"

    const/16 v2, 0x17

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "description"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "duration"

    const/16 v2, 0x18

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "duration"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "embedUrl"

    const/16 v2, 0x19

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "embedUrl"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "endDate"

    const/16 v2, 0x1a

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "endDate"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "familyName"

    const/16 v2, 0x1b

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "familyName"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "gender"

    const/16 v2, 0x1c

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "gender"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "geo"

    const/16 v2, 0x1d

    invoke-static {v1, v2, v3}, Lcom/google/android/gms/internal/ji$a;->a(Ljava/lang/String;ILjava/lang/Class;)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "geo"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "givenName"

    const/16 v2, 0x1e

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "givenName"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "height"

    const/16 v2, 0x1f

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "height"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "id"

    const/16 v2, 0x20

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "id"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "image"

    const/16 v2, 0x21

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "image"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "inAlbum"

    const/16 v2, 0x22

    invoke-static {v1, v2, v3}, Lcom/google/android/gms/internal/ji$a;->a(Ljava/lang/String;ILjava/lang/Class;)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "inAlbum"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "latitude"

    const/16 v2, 0x24

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ji$a;->j(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "latitude"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "location"

    const/16 v2, 0x25

    invoke-static {v1, v2, v3}, Lcom/google/android/gms/internal/ji$a;->a(Ljava/lang/String;ILjava/lang/Class;)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "location"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "longitude"

    const/16 v2, 0x26

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ji$a;->j(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "longitude"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "name"

    const/16 v2, 0x27

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "name"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "partOfTVSeries"

    const/16 v2, 0x28

    invoke-static {v1, v2, v3}, Lcom/google/android/gms/internal/ji$a;->a(Ljava/lang/String;ILjava/lang/Class;)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "partOfTVSeries"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "performers"

    const/16 v2, 0x29

    invoke-static {v1, v2, v3}, Lcom/google/android/gms/internal/ji$a;->b(Ljava/lang/String;ILjava/lang/Class;)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "performers"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "playerType"

    const/16 v2, 0x2a

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "playerType"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "postOfficeBoxNumber"

    const/16 v2, 0x2b

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "postOfficeBoxNumber"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "postalCode"

    const/16 v2, 0x2c

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "postalCode"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "ratingValue"

    const/16 v2, 0x2d

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "ratingValue"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "reviewRating"

    const/16 v2, 0x2e

    invoke-static {v1, v2, v3}, Lcom/google/android/gms/internal/ji$a;->a(Ljava/lang/String;ILjava/lang/Class;)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "reviewRating"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "startDate"

    const/16 v2, 0x2f

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "startDate"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "streetAddress"

    const/16 v2, 0x30

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "streetAddress"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "text"

    const/16 v2, 0x31

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "text"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "thumbnail"

    const/16 v2, 0x32

    invoke-static {v1, v2, v3}, Lcom/google/android/gms/internal/ji$a;->a(Ljava/lang/String;ILjava/lang/Class;)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "thumbnail"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "thumbnailUrl"

    const/16 v2, 0x33

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "thumbnailUrl"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "tickerSymbol"

    const/16 v2, 0x34

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "tickerSymbol"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "type"

    const/16 v2, 0x35

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "type"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "url"

    const/16 v2, 0x36

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "url"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "width"

    const/16 v2, 0x37

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "width"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "worstRating"

    const/16 v2, 0x38

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/ji$a;->l(Ljava/lang/String;I)Lcom/google/android/gms/internal/ji$a;

    move-result-object v1

    const-string v2, "worstRating"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/jj;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/nu;->BR:I

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    return-void
.end method

.method constructor <init>(Ljava/util/Set;ILcom/google/android/gms/internal/nu;Ljava/util/List;Lcom/google/android/gms/internal/nu;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;ILjava/util/List;Lcom/google/android/gms/internal/nu;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/nu;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/nu;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/nu;DLcom/google/android/gms/internal/nu;DLjava/lang/String;Lcom/google/android/gms/internal/nu;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/nu;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/nu;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;I",
            "Lcom/google/android/gms/internal/nu;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/android/gms/internal/nu;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/nu;",
            ">;I",
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/nu;",
            ">;",
            "Lcom/google/android/gms/internal/nu;",
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/nu;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/nu;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/nu;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/nu;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/nu;",
            "D",
            "Lcom/google/android/gms/internal/nu;",
            "D",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/nu;",
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/nu;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/nu;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/nu;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    move-object v0, p0

    invoke-direct {p0}, Lcom/google/android/gms/internal/jj;-><init>()V

    move-object v1, p1

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    move v1, p2

    iput v1, v0, Lcom/google/android/gms/internal/nu;->BR:I

    move-object v1, p3

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amd:Lcom/google/android/gms/internal/nu;

    move-object v1, p4

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->ame:Ljava/util/List;

    move-object v1, p5

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amf:Lcom/google/android/gms/internal/nu;

    move-object v1, p6

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amg:Ljava/lang/String;

    move-object v1, p7

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amh:Ljava/lang/String;

    move-object v1, p8

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->ami:Ljava/lang/String;

    move-object v1, p9

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amj:Ljava/util/List;

    move v1, p10

    iput v1, v0, Lcom/google/android/gms/internal/nu;->amk:I

    move-object v1, p11

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->aml:Ljava/util/List;

    move-object v1, p12

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amm:Lcom/google/android/gms/internal/nu;

    move-object/from16 v1, p13

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amn:Ljava/util/List;

    move-object/from16 v1, p14

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amo:Ljava/lang/String;

    move-object/from16 v1, p15

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amp:Ljava/lang/String;

    move-object/from16 v1, p16

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amq:Lcom/google/android/gms/internal/nu;

    move-object/from16 v1, p17

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amr:Ljava/lang/String;

    move-object/from16 v1, p18

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->ams:Ljava/lang/String;

    move-object/from16 v1, p19

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->ol:Ljava/lang/String;

    move-object/from16 v1, p20

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amt:Ljava/util/List;

    move-object/from16 v1, p21

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amu:Ljava/lang/String;

    move-object/from16 v1, p22

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amv:Ljava/lang/String;

    move-object/from16 v1, p23

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amw:Ljava/lang/String;

    move-object/from16 v1, p24

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->Tr:Ljava/lang/String;

    move-object/from16 v1, p25

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amx:Ljava/lang/String;

    move-object/from16 v1, p26

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amy:Ljava/lang/String;

    move-object/from16 v1, p27

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amz:Ljava/lang/String;

    move-object/from16 v1, p28

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amA:Ljava/lang/String;

    move-object/from16 v1, p29

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amB:Ljava/lang/String;

    move-object/from16 v1, p30

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amC:Lcom/google/android/gms/internal/nu;

    move-object/from16 v1, p31

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amD:Ljava/lang/String;

    move-object/from16 v1, p32

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amE:Ljava/lang/String;

    move-object/from16 v1, p33

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->BL:Ljava/lang/String;

    move-object/from16 v1, p34

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amF:Ljava/lang/String;

    move-object/from16 v1, p35

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amG:Lcom/google/android/gms/internal/nu;

    move-wide/from16 v1, p36

    iput-wide v1, v0, Lcom/google/android/gms/internal/nu;->aek:D

    move-object/from16 v1, p38

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amH:Lcom/google/android/gms/internal/nu;

    move-wide/from16 v1, p39

    iput-wide v1, v0, Lcom/google/android/gms/internal/nu;->ael:D

    move-object/from16 v1, p41

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->mName:Ljava/lang/String;

    move-object/from16 v1, p42

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amI:Lcom/google/android/gms/internal/nu;

    move-object/from16 v1, p43

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amJ:Ljava/util/List;

    move-object/from16 v1, p44

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amK:Ljava/lang/String;

    move-object/from16 v1, p45

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amL:Ljava/lang/String;

    move-object/from16 v1, p46

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amM:Ljava/lang/String;

    move-object/from16 v1, p47

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amN:Ljava/lang/String;

    move-object/from16 v1, p48

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amO:Lcom/google/android/gms/internal/nu;

    move-object/from16 v1, p49

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amP:Ljava/lang/String;

    move-object/from16 v1, p50

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amQ:Ljava/lang/String;

    move-object/from16 v1, p51

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amR:Ljava/lang/String;

    move-object/from16 v1, p52

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amS:Lcom/google/android/gms/internal/nu;

    move-object/from16 v1, p53

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amT:Ljava/lang/String;

    move-object/from16 v1, p54

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amU:Ljava/lang/String;

    move-object/from16 v1, p55

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->uO:Ljava/lang/String;

    move-object/from16 v1, p56

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->uR:Ljava/lang/String;

    move-object/from16 v1, p57

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amV:Ljava/lang/String;

    move-object/from16 v1, p58

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amW:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/util/Set;Lcom/google/android/gms/internal/nu;Ljava/util/List;Lcom/google/android/gms/internal/nu;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;ILjava/util/List;Lcom/google/android/gms/internal/nu;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/nu;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/nu;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/nu;DLcom/google/android/gms/internal/nu;DLjava/lang/String;Lcom/google/android/gms/internal/nu;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/nu;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/nu;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/google/android/gms/internal/nu;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/android/gms/internal/nu;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/nu;",
            ">;I",
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/nu;",
            ">;",
            "Lcom/google/android/gms/internal/nu;",
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/nu;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/nu;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/nu;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/nu;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/nu;",
            "D",
            "Lcom/google/android/gms/internal/nu;",
            "D",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/nu;",
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/nu;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/nu;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/nu;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    move-object v0, p0

    invoke-direct {p0}, Lcom/google/android/gms/internal/jj;-><init>()V

    move-object v1, p1

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/4 v1, 0x1

    iput v1, v0, Lcom/google/android/gms/internal/nu;->BR:I

    move-object v1, p2

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amd:Lcom/google/android/gms/internal/nu;

    move-object v1, p3

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->ame:Ljava/util/List;

    move-object v1, p4

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amf:Lcom/google/android/gms/internal/nu;

    move-object v1, p5

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amg:Ljava/lang/String;

    move-object v1, p6

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amh:Ljava/lang/String;

    move-object v1, p7

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->ami:Ljava/lang/String;

    move-object v1, p8

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amj:Ljava/util/List;

    move v1, p9

    iput v1, v0, Lcom/google/android/gms/internal/nu;->amk:I

    move-object v1, p10

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->aml:Ljava/util/List;

    move-object v1, p11

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amm:Lcom/google/android/gms/internal/nu;

    move-object v1, p12

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amn:Ljava/util/List;

    move-object/from16 v1, p13

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amo:Ljava/lang/String;

    move-object/from16 v1, p14

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amp:Ljava/lang/String;

    move-object/from16 v1, p15

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amq:Lcom/google/android/gms/internal/nu;

    move-object/from16 v1, p16

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amr:Ljava/lang/String;

    move-object/from16 v1, p17

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->ams:Ljava/lang/String;

    move-object/from16 v1, p18

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->ol:Ljava/lang/String;

    move-object/from16 v1, p19

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amt:Ljava/util/List;

    move-object/from16 v1, p20

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amu:Ljava/lang/String;

    move-object/from16 v1, p21

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amv:Ljava/lang/String;

    move-object/from16 v1, p22

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amw:Ljava/lang/String;

    move-object/from16 v1, p23

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->Tr:Ljava/lang/String;

    move-object/from16 v1, p24

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amx:Ljava/lang/String;

    move-object/from16 v1, p25

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amy:Ljava/lang/String;

    move-object/from16 v1, p26

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amz:Ljava/lang/String;

    move-object/from16 v1, p27

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amA:Ljava/lang/String;

    move-object/from16 v1, p28

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amB:Ljava/lang/String;

    move-object/from16 v1, p29

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amC:Lcom/google/android/gms/internal/nu;

    move-object/from16 v1, p30

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amD:Ljava/lang/String;

    move-object/from16 v1, p31

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amE:Ljava/lang/String;

    move-object/from16 v1, p32

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->BL:Ljava/lang/String;

    move-object/from16 v1, p33

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amF:Ljava/lang/String;

    move-object/from16 v1, p34

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amG:Lcom/google/android/gms/internal/nu;

    move-wide/from16 v1, p35

    iput-wide v1, v0, Lcom/google/android/gms/internal/nu;->aek:D

    move-object/from16 v1, p37

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amH:Lcom/google/android/gms/internal/nu;

    move-wide/from16 v1, p38

    iput-wide v1, v0, Lcom/google/android/gms/internal/nu;->ael:D

    move-object/from16 v1, p40

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->mName:Ljava/lang/String;

    move-object/from16 v1, p41

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amI:Lcom/google/android/gms/internal/nu;

    move-object/from16 v1, p42

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amJ:Ljava/util/List;

    move-object/from16 v1, p43

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amK:Ljava/lang/String;

    move-object/from16 v1, p44

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amL:Ljava/lang/String;

    move-object/from16 v1, p45

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amM:Ljava/lang/String;

    move-object/from16 v1, p46

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amN:Ljava/lang/String;

    move-object/from16 v1, p47

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amO:Lcom/google/android/gms/internal/nu;

    move-object/from16 v1, p48

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amP:Ljava/lang/String;

    move-object/from16 v1, p49

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amQ:Ljava/lang/String;

    move-object/from16 v1, p50

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amR:Ljava/lang/String;

    move-object/from16 v1, p51

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amS:Lcom/google/android/gms/internal/nu;

    move-object/from16 v1, p52

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amT:Ljava/lang/String;

    move-object/from16 v1, p53

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amU:Ljava/lang/String;

    move-object/from16 v1, p54

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->uO:Ljava/lang/String;

    move-object/from16 v1, p55

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->uR:Ljava/lang/String;

    move-object/from16 v1, p56

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amV:Ljava/lang/String;

    move-object/from16 v1, p57

    iput-object v1, v0, Lcom/google/android/gms/internal/nu;->amW:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected a(Lcom/google/android/gms/internal/ji$a;)Z
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/ji$a;->hm()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method protected b(Lcom/google/android/gms/internal/ji$a;)Ljava/lang/Object;
    .locals 2

    invoke-virtual {p1}, Lcom/google/android/gms/internal/ji$a;->hm()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    new-instance p0, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unknown safe parcelable id="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/ji$a;->hm()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :pswitch_1
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amW:Ljava/lang/String;

    return-object p0

    :pswitch_2
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amV:Ljava/lang/String;

    return-object p0

    :pswitch_3
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->uR:Ljava/lang/String;

    return-object p0

    :pswitch_4
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->uO:Ljava/lang/String;

    return-object p0

    :pswitch_5
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amU:Ljava/lang/String;

    return-object p0

    :pswitch_6
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amT:Ljava/lang/String;

    return-object p0

    :pswitch_7
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amS:Lcom/google/android/gms/internal/nu;

    return-object p0

    :pswitch_8
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amR:Ljava/lang/String;

    return-object p0

    :pswitch_9
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amQ:Ljava/lang/String;

    return-object p0

    :pswitch_a
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amP:Ljava/lang/String;

    return-object p0

    :pswitch_b
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amO:Lcom/google/android/gms/internal/nu;

    return-object p0

    :pswitch_c
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amN:Ljava/lang/String;

    return-object p0

    :pswitch_d
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amM:Ljava/lang/String;

    return-object p0

    :pswitch_e
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amL:Ljava/lang/String;

    return-object p0

    :pswitch_f
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amK:Ljava/lang/String;

    return-object p0

    :pswitch_10
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amJ:Ljava/util/List;

    return-object p0

    :pswitch_11
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amI:Lcom/google/android/gms/internal/nu;

    return-object p0

    :pswitch_12
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->mName:Ljava/lang/String;

    return-object p0

    :pswitch_13
    iget-wide p0, p0, Lcom/google/android/gms/internal/nu;->ael:D

    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    return-object p0

    :pswitch_14
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amH:Lcom/google/android/gms/internal/nu;

    return-object p0

    :pswitch_15
    iget-wide p0, p0, Lcom/google/android/gms/internal/nu;->aek:D

    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    return-object p0

    :pswitch_16
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amG:Lcom/google/android/gms/internal/nu;

    return-object p0

    :pswitch_17
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amF:Ljava/lang/String;

    return-object p0

    :pswitch_18
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->BL:Ljava/lang/String;

    return-object p0

    :pswitch_19
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amE:Ljava/lang/String;

    return-object p0

    :pswitch_1a
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amD:Ljava/lang/String;

    return-object p0

    :pswitch_1b
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amC:Lcom/google/android/gms/internal/nu;

    return-object p0

    :pswitch_1c
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amB:Ljava/lang/String;

    return-object p0

    :pswitch_1d
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amA:Ljava/lang/String;

    return-object p0

    :pswitch_1e
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amz:Ljava/lang/String;

    return-object p0

    :pswitch_1f
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amy:Ljava/lang/String;

    return-object p0

    :pswitch_20
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amx:Ljava/lang/String;

    return-object p0

    :pswitch_21
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->Tr:Ljava/lang/String;

    return-object p0

    :pswitch_22
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amw:Ljava/lang/String;

    return-object p0

    :pswitch_23
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amv:Ljava/lang/String;

    return-object p0

    :pswitch_24
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amu:Ljava/lang/String;

    return-object p0

    :pswitch_25
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amt:Ljava/util/List;

    return-object p0

    :pswitch_26
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->ol:Ljava/lang/String;

    return-object p0

    :pswitch_27
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->ams:Ljava/lang/String;

    return-object p0

    :pswitch_28
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amr:Ljava/lang/String;

    return-object p0

    :pswitch_29
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amq:Lcom/google/android/gms/internal/nu;

    return-object p0

    :pswitch_2a
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amp:Ljava/lang/String;

    return-object p0

    :pswitch_2b
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amo:Ljava/lang/String;

    return-object p0

    :pswitch_2c
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amn:Ljava/util/List;

    return-object p0

    :pswitch_2d
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amm:Lcom/google/android/gms/internal/nu;

    return-object p0

    :pswitch_2e
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->aml:Ljava/util/List;

    return-object p0

    :pswitch_2f
    iget p0, p0, Lcom/google/android/gms/internal/nu;->amk:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_30
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amj:Ljava/util/List;

    return-object p0

    :pswitch_31
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->ami:Ljava/lang/String;

    return-object p0

    :pswitch_32
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amh:Ljava/lang/String;

    return-object p0

    :pswitch_33
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amg:Ljava/lang/String;

    return-object p0

    :pswitch_34
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amf:Lcom/google/android/gms/internal/nu;

    return-object p0

    :pswitch_35
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->ame:Ljava/util/List;

    return-object p0

    :pswitch_36
    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amd:Lcom/google/android/gms/internal/nu;

    return-object p0

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_0
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5

    instance-of v0, p1, Lcom/google/android/gms/internal/nu;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x1

    if-ne p0, p1, :cond_1

    return v0

    :cond_1
    check-cast p1, Lcom/google/android/gms/internal/nu;

    sget-object v2, Lcom/google/android/gms/internal/nu;->amb:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/internal/ji$a;

    invoke-virtual {p0, v3}, Lcom/google/android/gms/internal/nu;->a(Lcom/google/android/gms/internal/ji$a;)Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-virtual {p1, v3}, Lcom/google/android/gms/internal/nu;->a(Lcom/google/android/gms/internal/ji$a;)Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-virtual {p0, v3}, Lcom/google/android/gms/internal/nu;->b(Lcom/google/android/gms/internal/ji$a;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p1, v3}, Lcom/google/android/gms/internal/nu;->b(Lcom/google/android/gms/internal/ji$a;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    :cond_3
    return v1

    :cond_4
    invoke-virtual {p1, v3}, Lcom/google/android/gms/internal/nu;->a(Lcom/google/android/gms/internal/ji$a;)Z

    move-result v3

    if-eqz v3, :cond_2

    return v1

    :cond_5
    return v0
.end method

.method public synthetic freeze()Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/nu;->nr()Lcom/google/android/gms/internal/nu;

    move-result-object p0

    return-object p0
.end method

.method public getAbout()Lcom/google/android/gms/plus/model/moments/ItemScope;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amd:Lcom/google/android/gms/internal/nu;

    return-object p0
.end method

.method public getAdditionalName()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->ame:Ljava/util/List;

    return-object p0
.end method

.method public getAddress()Lcom/google/android/gms/plus/model/moments/ItemScope;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amf:Lcom/google/android/gms/internal/nu;

    return-object p0
.end method

.method public getAddressCountry()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amg:Ljava/lang/String;

    return-object p0
.end method

.method public getAddressLocality()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amh:Ljava/lang/String;

    return-object p0
.end method

.method public getAddressRegion()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->ami:Ljava/lang/String;

    return-object p0
.end method

.method public getAssociated_media()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/android/gms/plus/model/moments/ItemScope;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amj:Ljava/util/List;

    check-cast p0, Ljava/util/ArrayList;

    return-object p0
.end method

.method public getAttendeeCount()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/internal/nu;->amk:I

    return p0
.end method

.method public getAttendees()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/android/gms/plus/model/moments/ItemScope;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->aml:Ljava/util/List;

    check-cast p0, Ljava/util/ArrayList;

    return-object p0
.end method

.method public getAudio()Lcom/google/android/gms/plus/model/moments/ItemScope;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amm:Lcom/google/android/gms/internal/nu;

    return-object p0
.end method

.method public getAuthor()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/android/gms/plus/model/moments/ItemScope;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amn:Ljava/util/List;

    check-cast p0, Ljava/util/ArrayList;

    return-object p0
.end method

.method public getBestRating()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amo:Ljava/lang/String;

    return-object p0
.end method

.method public getBirthDate()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amp:Ljava/lang/String;

    return-object p0
.end method

.method public getByArtist()Lcom/google/android/gms/plus/model/moments/ItemScope;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amq:Lcom/google/android/gms/internal/nu;

    return-object p0
.end method

.method public getCaption()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amr:Ljava/lang/String;

    return-object p0
.end method

.method public getContentSize()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->ams:Ljava/lang/String;

    return-object p0
.end method

.method public getContentUrl()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->ol:Ljava/lang/String;

    return-object p0
.end method

.method public getContributor()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/android/gms/plus/model/moments/ItemScope;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amt:Ljava/util/List;

    check-cast p0, Ljava/util/ArrayList;

    return-object p0
.end method

.method public getDateCreated()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amu:Ljava/lang/String;

    return-object p0
.end method

.method public getDateModified()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amv:Ljava/lang/String;

    return-object p0
.end method

.method public getDatePublished()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amw:Ljava/lang/String;

    return-object p0
.end method

.method public getDescription()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->Tr:Ljava/lang/String;

    return-object p0
.end method

.method public getDuration()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amx:Ljava/lang/String;

    return-object p0
.end method

.method public getEmbedUrl()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amy:Ljava/lang/String;

    return-object p0
.end method

.method public getEndDate()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amz:Ljava/lang/String;

    return-object p0
.end method

.method public getFamilyName()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amA:Ljava/lang/String;

    return-object p0
.end method

.method public getGender()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amB:Ljava/lang/String;

    return-object p0
.end method

.method public getGeo()Lcom/google/android/gms/plus/model/moments/ItemScope;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amC:Lcom/google/android/gms/internal/nu;

    return-object p0
.end method

.method public getGivenName()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amD:Ljava/lang/String;

    return-object p0
.end method

.method public getHeight()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amE:Ljava/lang/String;

    return-object p0
.end method

.method public getId()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->BL:Ljava/lang/String;

    return-object p0
.end method

.method public getImage()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amF:Ljava/lang/String;

    return-object p0
.end method

.method public getInAlbum()Lcom/google/android/gms/plus/model/moments/ItemScope;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amG:Lcom/google/android/gms/internal/nu;

    return-object p0
.end method

.method public getLatitude()D
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/internal/nu;->aek:D

    return-wide v0
.end method

.method public getLocation()Lcom/google/android/gms/plus/model/moments/ItemScope;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amH:Lcom/google/android/gms/internal/nu;

    return-object p0
.end method

.method public getLongitude()D
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/internal/nu;->ael:D

    return-wide v0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->mName:Ljava/lang/String;

    return-object p0
.end method

.method public getPartOfTVSeries()Lcom/google/android/gms/plus/model/moments/ItemScope;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amI:Lcom/google/android/gms/internal/nu;

    return-object p0
.end method

.method public getPerformers()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/android/gms/plus/model/moments/ItemScope;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amJ:Ljava/util/List;

    check-cast p0, Ljava/util/ArrayList;

    return-object p0
.end method

.method public getPlayerType()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amK:Ljava/lang/String;

    return-object p0
.end method

.method public getPostOfficeBoxNumber()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amL:Ljava/lang/String;

    return-object p0
.end method

.method public getPostalCode()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amM:Ljava/lang/String;

    return-object p0
.end method

.method public getRatingValue()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amN:Ljava/lang/String;

    return-object p0
.end method

.method public getReviewRating()Lcom/google/android/gms/plus/model/moments/ItemScope;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amO:Lcom/google/android/gms/internal/nu;

    return-object p0
.end method

.method public getStartDate()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amP:Ljava/lang/String;

    return-object p0
.end method

.method public getStreetAddress()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amQ:Ljava/lang/String;

    return-object p0
.end method

.method public getText()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amR:Ljava/lang/String;

    return-object p0
.end method

.method public getThumbnail()Lcom/google/android/gms/plus/model/moments/ItemScope;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amS:Lcom/google/android/gms/internal/nu;

    return-object p0
.end method

.method public getThumbnailUrl()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amT:Ljava/lang/String;

    return-object p0
.end method

.method public getTickerSymbol()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amU:Ljava/lang/String;

    return-object p0
.end method

.method public getType()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->uO:Ljava/lang/String;

    return-object p0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->uR:Ljava/lang/String;

    return-object p0
.end method

.method public getWidth()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amV:Ljava/lang/String;

    return-object p0
.end method

.method public getWorstRating()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amW:Ljava/lang/String;

    return-object p0
.end method

.method public hasAbout()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/4 v0, 0x2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasAdditionalName()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/4 v0, 0x3

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasAddress()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/4 v0, 0x4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasAddressCountry()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/4 v0, 0x5

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasAddressLocality()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/4 v0, 0x6

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasAddressRegion()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/4 v0, 0x7

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasAssociated_media()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x8

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasAttendeeCount()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x9

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasAttendees()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0xa

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasAudio()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0xb

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasAuthor()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0xc

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasBestRating()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0xd

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasBirthDate()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0xe

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasByArtist()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0xf

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasCaption()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x10

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasContentSize()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x11

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasContentUrl()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x12

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasContributor()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x13

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasDateCreated()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x14

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasDateModified()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x15

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasDatePublished()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x16

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasDescription()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x17

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasDuration()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x18

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasEmbedUrl()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x19

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasEndDate()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x1a

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasFamilyName()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x1b

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasGender()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x1c

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasGeo()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x1d

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasGivenName()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x1e

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasHeight()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x1f

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasId()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x20

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasImage()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x21

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasInAlbum()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x22

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasLatitude()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x24

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasLocation()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x25

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasLongitude()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x26

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasName()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x27

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasPartOfTVSeries()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x28

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasPerformers()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x29

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasPlayerType()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x2a

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasPostOfficeBoxNumber()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x2b

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasPostalCode()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x2c

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasRatingValue()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x2d

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasReviewRating()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x2e

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasStartDate()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x2f

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasStreetAddress()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x30

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasText()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x31

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasThumbnail()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x32

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasThumbnailUrl()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x33

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasTickerSymbol()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x34

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasType()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x35

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasUrl()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x36

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasWidth()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x37

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasWorstRating()Z
    .locals 1

    iget-object p0, p0, Lcom/google/android/gms/internal/nu;->amc:Ljava/util/Set;

    const/16 v0, 0x38

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hashCode()I
    .locals 4

    sget-object v0, Lcom/google/android/gms/internal/nu;->amb:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/ji$a;

    invoke-virtual {p0, v2}, Lcom/google/android/gms/internal/nu;->a(Lcom/google/android/gms/internal/ji$a;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v2}, Lcom/google/android/gms/internal/ji$a;->hm()I

    move-result v3

    add-int/2addr v1, v3

    invoke-virtual {p0, v2}, Lcom/google/android/gms/internal/nu;->b(Lcom/google/android/gms/internal/ji$a;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    goto :goto_0

    :cond_1
    return v1
.end method

.method public hf()Ljava/util/HashMap;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/ji$a<",
            "**>;>;"
        }
    .end annotation

    sget-object p0, Lcom/google/android/gms/internal/nu;->amb:Ljava/util/HashMap;

    return-object p0
.end method

.method public isDataValid()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public nr()Lcom/google/android/gms/internal/nu;
    .locals 0

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/internal/nv;->a(Lcom/google/android/gms/internal/nu;Landroid/os/Parcel;I)V

    return-void
.end method
