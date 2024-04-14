String getSubString(String string, int start, int end) {
  // Ensure end index is within bounds
  if (end > string.length) {
    end = string.length;
    return string.substring(start, end);
  }

  // Return the slice of the string
  final slicedString = string.substring(start, end);
  return "$slicedString...";
}