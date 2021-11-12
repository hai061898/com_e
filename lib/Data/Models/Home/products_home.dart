import 'dart:convert';

ProductsHome productsHomeFromJson(String str) => ProductsHome.fromJson(json.decode(str));

String productsHomeToJson(ProductsHome data) => json.encode(data.toJson());

class ProductsHome {

    bool resp;
    String msj;
    List<Product> products;

    ProductsHome({
       required this.resp,
       required this.msj,
       required this.products,
    });

    factory ProductsHome.fromJson(Map<String, dynamic> json) => ProductsHome(
        resp: json["resp"],
        msj: json["msj"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))).toList(),
    );

    Map<String, dynamic> toJson() => {
        "resp": resp,
        "msj": msj,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product {

    int uidProduct;
    String nameProduct;
    String description;
    String codeProduct;
    int stock;
    double price;
    String status;
    String picture;
    String category;

    Product({
       required this.uidProduct,
       required this.nameProduct,
       required this.description,
       required this.codeProduct,
       required this.stock,
       required this.price,
       required this.status,
       required this.picture,
       required this.category,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        uidProduct: json["uidProduct"],
        nameProduct: json["nameProduct"],
        description: json["description"],
        codeProduct: json["codeProduct"],
        stock: json["stock"],
        price: json["price"].toDouble(),
        status: json["status"],
        picture: json["picture"],
        category: json["category"],
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
        "category": category,
    };
}
