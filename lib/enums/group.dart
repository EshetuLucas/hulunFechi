enum Group {
  All,
  Belief,
  Technology,
  Knowledge,
  Health,
  Competition,
  Law_Regulation,
  Finance_Business
}

extension ParseToString on Group {
  String toShortString() {
    String text = this.toString().split('.').last;
    return text.replaceAll('_', ' & ');
  }
}
