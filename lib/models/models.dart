// To parse this JSON data, do
//
//     final mobileModel = mobileModelFromMap(jsonString);

import 'dart:convert';

MobileModel mobileModelFromMap(String str) =>
    MobileModel.fromMap(json.decode(str));

String mobileModelToMap(MobileModel data) => json.encode(data.toMap());

class MobileModel {
  Data? data;

  MobileModel({
    this.data,
  });

  factory MobileModel.fromMap(Map<String, dynamic> json) => MobileModel(
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
      };
}

class Data {
  String? id;
  String? slug;
  String? name;
  int? price;
  int? strikePrice;
  int? minOrder;
  int? maxOrder;
  bool? variantStatus;
  String? category;
  String? categoryName;
  String? categorySlug;
  bool? status;
  List<DataVariant>? variants;
  dynamic stock;
  dynamic initialStock;
  String? description;
  List<Specification>? specification;
  List<VariantDetail>? variantDetails;
  List<Image>? image;
  VendorDetail? vendorDetail;
  int? viewCount;
  bool? isFavourite;
  bool? commissionStatus;
  String? commissionType;
  String? commissionAmount;
  int? averageRating;
  bool? isApproved;
  bool? isFeatured;
  bool? isPublished;
  dynamic unapprovedMessage;

  Data({
    this.id,
    this.slug,
    this.name,
    this.price,
    this.strikePrice,
    this.minOrder,
    this.maxOrder,
    this.variantStatus,
    this.category,
    this.categoryName,
    this.categorySlug,
    this.status,
    this.variants,
    this.stock,
    this.initialStock,
    this.description,
    this.specification,
    this.variantDetails,
    this.image,
    this.vendorDetail,
    this.viewCount,
    this.isFavourite,
    this.commissionStatus,
    this.commissionType,
    this.commissionAmount,
    this.averageRating,
    this.isApproved,
    this.isFeatured,
    this.isPublished,
    this.unapprovedMessage,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        price: json["price"],
        strikePrice: json["strike_price"],
        minOrder: json["min_order"],
        maxOrder: json["max_order"],
        variantStatus: json["variant_status"],
        category: json["category"],
        categoryName: json["category_name"],
        categorySlug: json["category_slug"],
        status: json["status"],
        variants: json["variants"] == null
            ? []
            : List<DataVariant>.from(
                json["variants"]!.map((x) => DataVariant.fromMap(x))),
        stock: json["stock"],
        initialStock: json["initial_stock"],
        description: json["description"],
        specification: json["specification"] == null
            ? []
            : List<Specification>.from(
                json["specification"]!.map((x) => Specification.fromMap(x))),
        variantDetails: json["variant_details"] == null
            ? []
            : List<VariantDetail>.from(
                json["variant_details"]!.map((x) => VariantDetail.fromMap(x))),
        image: json["image"] == null
            ? []
            : List<Image>.from(json["image"]!.map((x) => Image.fromMap(x))),
        vendorDetail: json["vendor_detail"] == null
            ? null
            : VendorDetail.fromMap(json["vendor_detail"]),
        viewCount: json["view_count"],
        isFavourite: json["is_favourite"],
        commissionStatus: json["commission_status"],
        commissionType: json["commission_type"],
        commissionAmount: json["commission_amount"],
        averageRating: json["average_rating"],
        isApproved: json["is_approved"],
        isFeatured: json["is_featured"],
        isPublished: json["is_published"],
        unapprovedMessage: json["unapproved_message"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "slug": slug,
        "name": name,
        "price": price,
        "strike_price": strikePrice,
        "min_order": minOrder,
        "max_order": maxOrder,
        "variant_status": variantStatus,
        "category": category,
        "category_name": categoryName,
        "category_slug": categorySlug,
        "status": status,
        "variants": variants == null
            ? []
            : List<dynamic>.from(variants!.map((x) => x.toMap())),
        "stock": stock,
        "initial_stock": initialStock,
        "description": description,
        "specification": specification == null
            ? []
            : List<dynamic>.from(specification!.map((x) => x.toMap())),
        "variant_details": variantDetails == null
            ? []
            : List<dynamic>.from(variantDetails!.map((x) => x.toMap())),
        "image": image == null
            ? []
            : List<dynamic>.from(image!.map((x) => x.toMap())),
        "vendor_detail": vendorDetail?.toMap(),
        "view_count": viewCount,
        "is_favourite": isFavourite,
        "commission_status": commissionStatus,
        "commission_type": commissionType,
        "commission_amount": commissionAmount,
        "average_rating": averageRating,
        "is_approved": isApproved,
        "is_featured": isFeatured,
        "is_published": isPublished,
        "unapproved_message": unapprovedMessage,
      };
}

class Image {
  String? id;
  dynamic title;
  String? path;

  Image({
    this.id,
    this.title,
    this.path,
  });

  factory Image.fromMap(Map<String, dynamic> json) => Image(
        id: json["id"],
        title: json["title"],
        path: json["path"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "path": path,
      };
}

class Specification {
  String? type;
  String? value;

  Specification({
    this.type,
    this.value,
  });

  factory Specification.fromMap(Map<String, dynamic> json) => Specification(
        type: json["type"],
        value: json["value"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "value": value,
      };
}

class VariantDetail {
  String? id;
  int? price;
  int? strikePrice;
  int? minOrder;
  int? maxOrder;
  bool? status;
  int? stock;
  int? initialStock;
  List<VariantDetailVariant>? variants;
  List<Image>? image;

  VariantDetail({
    this.id,
    this.price,
    this.strikePrice,
    this.minOrder,
    this.maxOrder,
    this.status,
    this.stock,
    this.initialStock,
    this.variants,
    this.image,
  });

  factory VariantDetail.fromMap(Map<String, dynamic> json) => VariantDetail(
        id: json["id"],
        price: json["price"],
        strikePrice: json["strike_price"],
        minOrder: json["min_order"],
        maxOrder: json["max_order"],
        status: json["status"],
        stock: json["stock"],
        initialStock: json["initial_stock"],
        variants: json["variants"] == null
            ? []
            : List<VariantDetailVariant>.from(
                json["variants"]!.map((x) => VariantDetailVariant.fromMap(x))),
        image: json["image"] == null
            ? []
            : List<Image>.from(json["image"]!.map((x) => Image.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "price": price,
        "strike_price": strikePrice,
        "min_order": minOrder,
        "max_order": maxOrder,
        "status": status,
        "stock": stock,
        "initial_stock": initialStock,
        "variants": variants == null
            ? []
            : List<dynamic>.from(variants!.map((x) => x.toMap())),
        "image": image == null
            ? []
            : List<dynamic>.from(image!.map((x) => x.toMap())),
      };
}

class VariantDetailVariant {
  String? id;
  String? type;
  String? value;
  TypeData? typeData;
  Type? valueData;

  VariantDetailVariant({
    this.id,
    this.type,
    this.value,
    this.typeData,
    this.valueData,
  });

  factory VariantDetailVariant.fromMap(Map<String, dynamic> json) =>
      VariantDetailVariant(
        id: json["id"],
        type: json["type"],
        value: json["value"],
        typeData: json["type_data"] == null
            ? null
            : TypeData.fromMap(json["type_data"]),
        valueData: json["value_data"] == null
            ? null
            : Type.fromMap(json["value_data"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "type": type,
        "value": value,
        "type_data": typeData?.toMap(),
        "value_data": valueData?.toMap(),
      };
}

class TypeData {
  String? name;

  TypeData({
    this.name,
  });

  factory TypeData.fromMap(Map<String, dynamic> json) => TypeData(
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
      };
}

class Type {
  String? id;
  String? name;

  Type({
    this.id,
    this.name,
  });

  factory Type.fromMap(Map<String, dynamic> json) => Type(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}

class DataVariant {
  Type? type;
  List<Value>? values;

  DataVariant({
    this.type,
    this.values,
  });

  factory DataVariant.fromMap(Map<String, dynamic> json) => DataVariant(
        type: json["type"] == null ? null : Type.fromMap(json["type"]),
        values: json["values"] == null
            ? []
            : List<Value>.from(json["values"]!.map((x) => Value.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "type": type?.toMap(),
        "values": values == null
            ? []
            : List<dynamic>.from(values!.map((x) => x.toMap())),
      };
}

class Value {
  String? id;
  String? value;

  Value({
    this.id,
    this.value,
  });

  factory Value.fromMap(Map<String, dynamic> json) => Value(
        id: json["id"],
        value: json["value"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "value": value,
      };
}

class VendorDetail {
  String? id;
  String? user;
  String? slug;
  String? isAdmin;
  String? isVendor;
  String? companyName;
  String? companyAddress;
  String? companyPhone;
  dynamic vatRegisterNo;
  String? businessEmail;
  DateTime? companyRegistrationDate;
  String? category;
  dynamic subCategory;
  String? description;
  dynamic otherDocument;

  VendorDetail({
    this.id,
    this.user,
    this.slug,
    this.isAdmin,
    this.isVendor,
    this.companyName,
    this.companyAddress,
    this.companyPhone,
    this.vatRegisterNo,
    this.businessEmail,
    this.companyRegistrationDate,
    this.category,
    this.subCategory,
    this.description,
    this.otherDocument,
  });

  factory VendorDetail.fromMap(Map<String, dynamic> json) => VendorDetail(
        id: json["id"],
        user: json["user"],
        slug: json["slug"],
        isAdmin: json["is_admin"],
        isVendor: json["is_vendor"],
        companyName: json["company_name"],
        companyAddress: json["company_address"],
        companyPhone: json["company_phone"],
        vatRegisterNo: json["vat_register_no"],
        businessEmail: json["business_email"],
        companyRegistrationDate: json["company_registration_date"] == null
            ? null
            : DateTime.parse(json["company_registration_date"]),
        category: json["category"],
        subCategory: json["sub_category"],
        description: json["description"],
        otherDocument: json["other_document"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user": user,
        "slug": slug,
        "is_admin": isAdmin,
        "is_vendor": isVendor,
        "company_name": companyName,
        "company_address": companyAddress,
        "company_phone": companyPhone,
        "vat_register_no": vatRegisterNo,
        "business_email": businessEmail,
        "company_registration_date":
            "${companyRegistrationDate!.year.toString().padLeft(4, '0')}-${companyRegistrationDate!.month.toString().padLeft(2, '0')}-${companyRegistrationDate!.day.toString().padLeft(2, '0')}",
        "category": category,
        "sub_category": subCategory,
        "description": description,
        "other_document": otherDocument,
      };
}
