class MainModel {
  final String? id; //해당 도큐먼트의 ID를 담기위함.
  // final String content;
  final String? name;
  final String? image;
  final String? price;
  final String? option;
  final String? size;


  MainModel({
    this.id = '',
    // this.content = '',
    this.name = '',
    this.image = '',
    this.price = '',
    this.option = '',
    this.size = '',
  });
  //서버로부터 map형태의 자료를 MessageModel형태의 자료로 변환해주는 역할을 수행함.
  factory MainModel.fromMap({required String? id,required Map<String?,dynamic> map  }){
    return MainModel(
      id: id,
      // content: map['content']??'',
      name: map['name']??'',
      image: map['image']??'',
      price: map['price']??'',
      option: map['option']??'',
      size: map['size']??'',
    );
  }

  Map<String?,dynamic> toMap(){
    Map<String?,dynamic> data = {};
    // data['content']=content;
    data['name']=name;
    data['image']=image;
    data['price']=price;
    data['option']=option;
    data['size']=size;
    return data;
  }
}
