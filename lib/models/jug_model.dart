/// The Jug
class Jug {
  /// The Jug Constructor
  Jug({
    required this.name,
    required this.maxVolume,
    this.currentVolume = 0,
  });

  /// Name of the Jug (used in the UI)
  final String name;

  /// Maximum volume of the Jug (used in calculations)
  final int maxVolume;

  /// Current volume of the Jug (used in calculations)
  int currentVolume;

  /// Fills the Jug from the Ocean
  void fill() => currentVolume = maxVolume;

  /// Method returns the amount of water that fits in the Jug and changes
  /// the current volume
  int transferIn(int max) {
    if (currentVolume + max > maxVolume) {
      final transferred = maxVolume - currentVolume;
      currentVolume = maxVolume;
      return transferred;
    }

    currentVolume += max;
    return max;
  }

  /// Method returns the amount of water that outs from the the Jug and changes
  /// the current volume
  int transferOut(int outcome) {
    if (outcome > currentVolume) {
      currentVolume = 0;
      return outcome;
    }

    currentVolume -= outcome;
    return outcome;
  }

  /// Returns true if Jug is full
  bool get isFull => currentVolume == maxVolume;

  /// Returns true if Jug is empty
  bool get isEmpty => currentVolume == 0;
}
