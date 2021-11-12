import 'dart:convert';

FavoriteProduct favoriteProductFromJson(String str) => FavoriteProduct.fromJson(json.decode(str));

String favoriteProductToJson(FavoriteProduct data) => json.encode(data.toJson());

class FavoriteProduct {

    bool resp;
    String msj;
    List<Favorite> favorites;

    FavoriteProduct({
       required this.resp,
       required this.msj,
       required this.favorites,
    });

    factory FavoriteProduct.fromJson(Map<String, dynamic> json) => FavoriteProduct(
        resp: json["resp"],
        msj: json["msj"],
        favorites: List<Favorite>.from(json["favorites"].map((x) => Favorite.fromJson(x))).toList(),
    );

    Map<String, dynamic> toJson() => {
        "resp": resp,
        "msj": msj,
        "favorites": List<dynamic>.from(favorites.map((x) => x.toJson())),
    };
}

class Favorite {

    int uidProduct;
    String nameProduct;
    String description;
    String codeProduct;
    int stock;
    int price;
    String status;
    String picture;
    int categoryId;
    int favoriteId;

    Favorite({
       required this.uidProduct,
       required this.nameProduct,
       required this.description,
       required this.codeProduct,
       required this.stock,
       required this.price,
       required this.status,
       required this.picture,
       required this.categoryId,
       required this.favoriteId,
    });

    factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
        uidProduct: json["uidProduct"],
        nameProduct: json["nameProduct"],
        description: json["description"],
        codeProduct: json["codeProduct"],
        stock: json["stock"],
        price: json["price"],
        status: json["status"],
        picture: json["picture"],
        categoryId: json["category_id"],
        favoriteId: json["favorite_id"],
    );

    Map<String, dynamic> toJson() => {
        "uidProduct": uidProduct,
        "nameProduct": nameProduct,
        "description": description,
        "codeProduct": codeProduct,
        "stock": stock,
        "price": price,
        "status": status,
        "picture": picture,
        "category_id": categoryId,
        "favorite_id": favoriteId,
    };
}
