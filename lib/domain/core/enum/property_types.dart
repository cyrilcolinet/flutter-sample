/// List of all available types custom
enum PropertyType {
  nil,
  boolean,
  int8,
  int16,
  int32,
  uint8,
  uint16,
  uint32,
  string2,
  string4,
  string6,
  string8,
  string16,
  string24,
  string32,
}

extension PropertyTypeExtension on PropertyType {
  /// Get bytes length by type
  int bytesLength() {
    if (this == PropertyType.int8 || this == PropertyType.uint8 || this == PropertyType.boolean) {
      return 1;
    } else if (this == PropertyType.int32 ||
        this == PropertyType.uint32 ||
        this == PropertyType.string4) {
      return 4;
    } else if (this == PropertyType.string6) {
      return 6;
    } else if (this == PropertyType.string8) {
      return 8;
    } else if (this == PropertyType.string16) {
      return 16;
    } else if (this == PropertyType.string24) {
      return 24;
    } else if (this == PropertyType.string32) {
      return 32;
    }

    // two bytes by default
    return 2;
  }
}
