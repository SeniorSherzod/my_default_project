class DigitModel{
  DigitModel({
    required this.pin,
    required this.digit
});
  final String digit;
 final String pin;

  DigitModel copyWith({
      String? digit,
      String? pin
  })=> DigitModel(
      digit: digit ?? this.digit,
       pin: pin?? this.pin,
  );

}