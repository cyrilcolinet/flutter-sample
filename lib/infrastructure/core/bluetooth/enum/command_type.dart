enum CommandType {
  // System
  ERROR,
  VERSION,
  MESSAGE,
  SET_DATE,
  SET_USAGE,

  // Protocol
  READ,
  WRITE,
  READ_TIME,
  READ_EVENT,
}

extension CommandTypeExtension on CommandType {
  /// Get the byte from the command enum
  int toByte() => this.index <= CommandType.SET_USAGE.index
      ? this.index
      : this.index + 127 - CommandType.READ.index;
}
