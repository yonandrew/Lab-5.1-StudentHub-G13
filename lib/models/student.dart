class Student {
  const Student(
    this.name,
    this.matric,
    this.programme,
    this.email,
    this.cgpa,
    this.year,
  );

  final String name;
  final String matric;
  final String programme;
  final String email;
  final double cgpa;
  final int year;

  String get initials {
    final parts = name.split(' ');
    return parts.length > 1
        ? '${parts.first[0]}${parts.last[0]}'
        : parts.first[0];
  }
}
