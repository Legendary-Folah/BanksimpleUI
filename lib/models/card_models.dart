class CardModel {
  String user;
  String cardNumber;
  String cardExpired;
  String cardType;
  int cardBackground;
  String cardElementTop;
  String cardElementBottom;

  CardModel(
      {required this.user,
      required this.cardNumber,
      required this.cardExpired,
      required this.cardType,
      required this.cardBackground,
      required this.cardElementTop,
      required this.cardElementBottom});
}

List<CardModel> cards = cardData
    .map((item) => CardModel(
        user: item['user'] as String,
        cardNumber: item['cardNumber'] as String,
        cardExpired: item['cardExpired'] as String,
        cardType: item['cardType'] as String,
        cardBackground: item['cardBackground'] as int,
        cardElementTop: item['cardElementTop'] as String,
        cardElementBottom: item['cardElementBottom'] as String))
    .toList();

var cardData = [
  {
    "user": "Amanda Alex",
    "cardNumber": "**** **** **** 1425",
    "cardExpired": "03-01-2023",
    "cardType": "assets/images/mastercard_logo.png",
    "cardBackground": 0xFF1E1E99,
    "cardElementTop": "assets/svg/ellipse_top_pink.svg",
    "cardElementBottom": "assets/svg/ellipse_bottom_pink.svg"
  },
  {
    "user": "Amanda Alex",
    "cardNumber": "**** **** **** 8287",
    "cardExpired": "03-01-2025",
    "cardType": "assets/images/mastercard_logo.png",
    "cardBackground": 0xFFFF70A3,
    "cardElementTop": "assets/svg/ellipse_top_blue.svg",
    "cardElementBottom": "assets/svg/ellipse_bottom_blue.svg"
  }
];
