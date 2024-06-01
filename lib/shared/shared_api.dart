class ApiConstant {
  static String baseUrl = 'http://123.100.226.123:2904/api';
  static String authentication = '$baseUrl/login';
  static String dashboardKlien = '$baseUrl/dashboard_pelabuhan';
  static String dashboardUPT = '$baseUrl/dashboard_per_pelabuhan';

  ///DETAIL PROGRAM
  static String allProgram = '$baseUrl/program_lingkungan';
  static String programSampah = '$baseUrl/get_evidence_sampah';
  static String programKualitasUdara = '$baseUrl/get_evidence_kualitasUdara';
  static String programKualitasAir = '$baseUrl/get_evidence_kualitasAir';
  static String programKebersihan = '$baseUrl/get_evidence_kebersihan';
  
  static String baseUrlFile = 'http://123.100.226.123:2904/file_uploads';

  ///ADD EVIDENCE
  static String addProgramKebersihan = '$baseUrl/add_evidence_kebersihan';
  static String addSampahDarat = '$baseUrl/add_evidence_sampah_darat';
  static String fileKebersihanPelabuhan = '$baseUrlFile/program_lingkungan';
  static String fileSampah = '$baseUrlFile/penanganan_sampah';
  static String fileKualitasUdara = '$baseUrlFile/kualitas_udara';
  static String fileRTH = '$baseUrlFile/rth';
  static String fileKualitasAir = '$baseUrlFile/kualitas_air';
  static String fileIPAL = '$baseUrlFile/ipal';
  static String fileHematEnergi = '$baseUrlFile/lampu_energi';
  static String filePatroliEnergi = '$baseUrlFile/patroli_energi';
  static String filePatroliK3 = '$baseUrlFile/patroli_keselamatan';
  static String fileDrone = '$baseUrlFile/drone';
  static String fileB3 = '$baseUrlFile/limbah';
  static String fileTenant = '$baseUrlFile/kepatuhan_regulasi';
  static String fileIso = '$baseUrlFile/iso';
}