class ApiConstant {
  static String baseUrl = 'http://123.100.226.123:2904/api';
  static String authentication = '$baseUrl/login';
  static String dashboardKlien = '$baseUrl/dashboard_pelabuhan';
  static String dashboardUPT = '$baseUrl/dashboard_per_pelabuhan';

  ///DETAIL PROGRAM
  static String allProgram = '$baseUrl/program_lingkungan';

  static String programHematEnergiAir = '$baseUrl/'; // ID 4
  static String programPatroliEnergiAir = '$baseUrl/'; // ID 5
  static String programHimbauanK3 = '$baseUrl/'; // ID 7
  static String programPatroliK3 = '$baseUrl/'; // ID 9
  static String programPemeliharaanRTH = '$baseUrl/get_evidence_pemeliharaanRTH'; // ID 15
  static String programLampuHematEnergi = '$baseUrl/'; // ID 43
  static String programKualitasUdara = '$baseUrl/get_evidence_kualitasUdara'; // ID 47
  static String programKualitasAir = '$baseUrl/get_evidence_kualitasAir'; // ID 48
  static String programLimbahIPAL = '$baseUrl/get_evidence_airLimbah'; // ID  49
  static String programSampah = '$baseUrl/get_evidence_sampah'; // ID 51, 52, 53, 99
  static String programKebersihan = '$baseUrl/get_evidence_kebersihan'; // ID 54
  static String programLimbahB3 = '$baseUrl/'; // ID 58
  static String programKepatuhanTenan = '$baseUrl/'; // ID 60
  static String programSertifikasiISO = '$baseUrl/'; // ID 64
  static String programUploadDrone = '$baseUrl/'; // ID 100

  static String programPenampunganAirHujan = '$baseUrl/'; // ID 8
  static String programEnergiBaruTerbarukan = '$baseUrl/'; // ID 45
  static String programPemeliharaanDrainase = '$baseUrl/'; // ID 78
  static String programSumurResapanBiopori = '$baseUrl/'; // ID 90
  static String programPemeliharaanJalan = '$baseUrl/'; // ID 102
  static String programPenyemprotanDrainaseTPI = '$baseUrl/'; // ID 103
  static String programPemeliharaanDermaga = '$baseUrl/'; // ID 104
  static String programPemeliharaanKolamPelabuhan = '$baseUrl/'; // ID 105
  static String programJumatBersih = '$baseUrl/'; // ID 106
  static String programBankSampah = '$baseUrl/'; // ID 107
  static String programUjiEmisiKendaraan = '$baseUrl/'; // ID 108
  static String programIPALPelabuhanPerikanan = '$baseUrl/'; // ID 109
  static String programIPALPenyewa = '$baseUrl/'; // ID 110
  static String programPenguranganPlastik = '$baseUrl/'; // ID 111
  static String programPupukOrganik = '$baseUrl/'; // ID 112
  static String programPelatihanLingkungan = '$baseUrl/'; // ID 113
  static String programKoordinasiPengendalianLingkungan = '$baseUrl/'; // ID 114



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