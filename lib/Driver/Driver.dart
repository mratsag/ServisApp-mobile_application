class Driver {
  final String name;
  final List<String> students;
  final Map<String, bool> boardingStatus;
  final List<String> routeHistory;

  Driver({
    required this.name,
    required this.students,
    this.boardingStatus = const {},
    this.routeHistory = const [],
  });
}