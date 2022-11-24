class AddToCartProductData {
    bool? status;
    String? message;
    Data? data;

    AddToCartProductData({this.status, this.message, this.data});

    AddToCartProductData.fromJson(Map<String, dynamic> json) {
        status = json["status"];
        message = json["message"];
        data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["status"] = status;
        _data["message"] = message;
        if(data != null) {
            _data["data"] = data?.toJson();
        }
        return _data;
    }
}

class Data {
    int? id;
    int? quantity;
    Product? product;

    Data({this.id, this.quantity, this.product});

    Data.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        quantity = json["quantity"];
        product = json["product"] == null ? null : Product.fromJson(json["product"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["quantity"] = quantity;
        if(product != null) {
            _data["product"] = product?.toJson();
        }
        return _data;
    }
}

class Product {
    int? id;
    int? price;
    int? oldPrice;
    int? discount;
    String? image;
    String? name;
    String? description;

    Product({this.id, this.price, this.oldPrice, this.discount, this.image, this.name, this.description});

    Product.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        price = json["price"];
        oldPrice = json["old_price"];
        discount = json["discount"];
        image = json["image"];
        name = json["name"];
        description = json["description"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["price"] = price;
        _data["old_price"] = oldPrice;
        _data["discount"] = discount;
        _data["image"] = image;
        _data["name"] = name;
        _data["description"] = description;
        return _data;
    }
}