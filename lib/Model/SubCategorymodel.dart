// To parse this JSON data, do
//
//     final getSubproduct = getSubproductFromJson(jsonString);

import 'dart:convert';

GetSubproduct getSubproductFromJson(String str) => GetSubproduct.fromJson(json.decode(str));

String getSubproductToJson(GetSubproduct data) => json.encode(data.toJson());

class GetSubproduct {
    String status;
    Categorys category;
    Products products;

    GetSubproduct({
        required this.status,
        required this.category,
        required this.products,
    });

    factory GetSubproduct.fromJson(Map<String, dynamic> json) => GetSubproduct(
        status: json["status"],
        category: Categorys.fromJson(json["category"]),
        products: Products.fromJson(json["products"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "category": category.toJson(),
        "products": products.toJson(),
    };
}

class Categorys {
    int id;
    String name;
    String image;

    Categorys({
        required this.id,
        required this.name,
        required this.image,
    });

    factory Categorys.fromJson(Map<String, dynamic> json) => Categorys(
        id: json["id"],
        name: json["name"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
    };
}

class Products {
    int currentPage;
    List<SubCat> data;
    String firstPageUrl;
    int from;
    int lastPage;
    String lastPageUrl;
    List<Link> links;
    String nextPageUrl;
    String path;
    int perPage;
    dynamic prevPageUrl;
    int to;
    int total;

    Products({
        required this.currentPage,
        required this.data,
        required this.firstPageUrl,
        required this.from,
        required this.lastPage,
        required this.lastPageUrl,
        required this.links,
        required this.nextPageUrl,
        required this.path,
        required this.perPage,
        required this.prevPageUrl,
        required this.to,
        required this.total,
    });

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        currentPage: json["current_page"],
        data: List<SubCat>.from(json["data"].map((x) => SubCat.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
    };
}

class SubCat {
    int id;
    String name;
    String details;
    String image;
    int isTrendy;
    int isAvailable;
    String price;
    String discount;
    int amount;
    int categoryId;

    SubCat({
        required this.id,
        required this.name,
        required this.details,
        required this.image,
        required this.isTrendy,
        required this.isAvailable,
        required this.price,
        required this.discount,
        required this.amount,
        required this.categoryId,
    });

    factory SubCat.fromJson(Map<String, dynamic> json) => SubCat(
        id: json["id"],
        name: json["name"],
        details: json["details"],
        image: json["image"],
        isTrendy: json["is_trendy"],
        isAvailable: json["is_available"],
        price: json["price"],
        discount: json["discount"],
        amount: json["amount"],
        categoryId: json["category_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "details": details,
        "image": image,
        "is_trendy": isTrendy,
        "is_available": isAvailable,
        "price": price,
        "discount": discount,
        "amount": amount,
        "category_id": categoryId,
    };
}

class Link {
    String? url;
    String label;
    bool active;

    Link({
        required this.url,
        required this.label,
        required this.active,
    });

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
    };
}
