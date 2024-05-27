class ApiConstant {
  static String baseUrl = 'http://123.100.226.123:2904/api';
  static String authentication = '$baseUrl/login';
  static String dashboardKlien = '$baseUrl/dashboard_pelabuhan';
  static String programLingkungan = '$baseUrl/program_lingkungan';
  static String programSampah = '$baseUrl/get_evidence_sampah';
  static String programKualitasUdara = '$baseUrl/get_evidence_kualitasUdara';
  static String programKualitasAir = '$baseUrl/get_evidence_kualitasAir';
  static String programKebersihan = '$baseUrl/get_evidence_kebersihan';
  static String addProgramKebersihan = '$baseUrl/add_evidence_kebersihan';
}