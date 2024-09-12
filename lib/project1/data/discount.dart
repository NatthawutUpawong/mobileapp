class Discount {
  final String urlimage;
  final String discount;
  final String textDetail;


  const Discount({
    required this.urlimage,
    required this.discount,
    required this.textDetail,
  });
} 
List<Discount> coupon = [
    const Discount(
      urlimage:
          'assets/images/10per.png',
      discount: '10%',
      textDetail: '',
    ),
    const Discount(
      urlimage:
          'assets/images/20per.png',
      discount: '20%',
      textDetail: '',
    ),
    const Discount(
      urlimage:
          'assets/images/30per.png',
      discount: '30%',
      textDetail: '',
    ),
    const Discount(
      urlimage:
          'assets/images/40per.png',
      discount: '40%',
      textDetail: '',
    ),
    const Discount(
      urlimage:
          'assets/images/50per.png',
      discount: '50%',
      textDetail: '',
    ),
    
  ];