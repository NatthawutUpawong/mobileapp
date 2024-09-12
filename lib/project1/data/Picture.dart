class HousePic {
  final String urlimage;
  final String textDetail;

  const HousePic({
    required this.urlimage,
    required this.textDetail,
  });
} 
List<HousePic> item = [
    const HousePic(
      urlimage:
          'https://cdn.icon-icons.com/icons2/2469/PNG/512/magnifier_magnifying_glass_icon_149435.png',
      textDetail: 'ค้นหา',
    ),
    const HousePic(
      urlimage: 'https://cdn-icons-png.flaticon.com/512/6676/6676508.png',
      textDetail: 'เปิดบ้านให้เช่า',
    ),
  ];