class ProductContentModel {
  ProductContentResult? result;

  ProductContentModel({
    this.result,
  });

  ProductContentModel.fromJson(Map<String, dynamic> json) {
    result = ProductContentResult.fromJson(json['result']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['result'] = result?.toJson();
    return _data;
  }
}

class ProductContentResult {
  ProductContentResult({
    this.id,
    this.title,
    this.cid,
    this.price,
    this.oldPrice,
    this.isBest,
    this.isHot,
    this.isNew,
    this.status,
    this.pic,
    this.content,
    this.cname,
    this.attr,
    this.subTitle,
    this.salecount,
    this.specs,
  });
  late final String? id;
  late final String? title;
  late final String? cid;
  late final int? price;
  late final int? oldPrice;
  late final int? isBest;
  late final int? isHot;
  late final int? isNew;
  late final int? status;
  late final String? pic;
  late final String? content;
  late final String? cname;
  late final List<Attr>? attr;
  late final String? subTitle;
  late final int? salecount;
  late final String? specs;

  ProductContentResult.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    cid = json['cid'];
    price = json['price'];
    oldPrice = json['old_price'];
    isBest = json['is_best'];
    isHot = json['is_hot'];
    isNew = json['is_new'];
    status = json['status'];
    pic = json['pic'];
    content = json['content'];
    cname = json['cname'];
    attr = List.from(json['attr']).map((e) => Attr.fromJson(e)).toList();
    subTitle = json['sub_title'];
    salecount = json['salecount'];
    specs = json['specs'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['title'] = title;
    _data['cid'] = cid;
    _data['price'] = price;
    _data['old_price'] = oldPrice;
    _data['is_best'] = isBest;
    _data['is_hot'] = isHot;
    _data['is_new'] = isNew;
    _data['status'] = status;
    _data['pic'] = pic;
    _data['content'] = content;
    _data['cname'] = cname;
    _data['attr'] = attr?.map((e) => e.toJson()).toList();
    _data['sub_title'] = subTitle;
    _data['salecount'] = salecount;
    _data['specs'] = specs;
    return _data;
  }
}

class Attr {
  Attr({
    required this.cate,
    required this.list,
    List<Map>? attrList,
  });
  late final String cate;
  late final List<String> list;
  late final List<Map<String, dynamic>> attrList;

  Attr.fromJson(Map<String, dynamic> json) {
    cate = json['cate'];
    list = List.castFrom<dynamic, String>(json['list']);
    attrList = [];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cate'] = cate;
    _data['list'] = list;
    return _data;
  }
}
