class StringUtils{
  static bool equalsIgnoreCase(String ? a, String ? b) =>
      a != null && b != null && a.toLowerCase() == b.toLowerCase();


  static bool isEmpty(String ? value){
    if(value == null || value == "") {
      return true;
    }
    return false;
  }

  static bool isNotEmpty(String ? value){
    return !isEmpty(value);
  }
}