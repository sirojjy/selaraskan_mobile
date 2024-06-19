class ApiConstant {
  static String baseUrl = 'http://123.100.226.123:2904/api';
  static String authentication = '$baseUrl/login';
  static String dashboardKlien = '$baseUrl/dashboard_pelabuhan';
  static String dashboardUPT = '$baseUrl/dashboard_per_pelabuhan';

  ///DETAIL PROGRAM
  static String allProgram = '$baseUrl/program_lingkungan';

  static String programHematEnergiAir = '$baseUrl/get_evidence_himbauanHemat'; // ID 4
  static String programPatroliEnergiAir = '$baseUrl/get_evidence_patroliEnergi'; // ID 5
  static String programHimbauanK3 = '$baseUrl/get_evidence_himbauanKeselamatan'; // ID 7
  static String programPatroliK3 = '$baseUrl/get_evidence_patroliKeselamatan'; // ID 9
  static String programSumurResapan = '$baseUrl/'; // ID 15
  static String programPemeliharaanRTH = '$baseUrl/get_evidence_rth'; // ID 15
  static String programLampuHematEnergi = '$baseUrl/get_evidence_penggunaanLampu'; // ID 43
  static String programKualitasUdara = '$baseUrl/get_evidence_kualitasUdara'; // ID 47
  static String programKualitasAir = '$baseUrl/get_evidence_kualitasAir'; // ID 48
  static String programLimbahIPAL = '$baseUrl/get_evidence_airLimbah'; // ID  49
  static String programSampah = '$baseUrl/get_evidence_sampah'; // ID 51, 52, 53, 99
  static String programKebersihan = '$baseUrl/get_evidence_kebersihan'; // ID 54
  static String programLimbahB3 = '$baseUrl/get_evidence_penanganan_limbah'; // ID 58
  static String programKepatuhanTenan = '$baseUrl/get_evidence_tenan'; // ID 60
  static String programSertifikasiISO = '$baseUrl/get_evidence_iso'; // ID 64
  static String programUploadDrone = '$baseUrl/get_evidence_drone'; // ID 100

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

  ///ADD EVIDENCE ID 4
  static String addHematEnergi = '$baseUrl/add_evidence_hematEnergi';
  ///ADD EVIDENCE ID 5
  static String addPatroliEnergi = '$baseUrl/add_evidence_patroliEnergi';
  ///ADD EVIDENCE ID 7
  static String addHimbauanK3 = '$baseUrl/add_evidence_himbauanKeselamatan';
  ///ADD EVIDENCE ID 9
  static String addPatroliK3 = '$baseUrl/add_evidence_patroliKeselamatan';
  ///ADD EVIDENCE ID 15
  static String addRTH = '$baseUrl/add_evidence_rth';
  ///ADD EVIDENCE ID 43
  static String addLampu = '$baseUrl/add_evidence_lampu';
  ///ADD EVIDENCE ID 47
  static String addKualitasUdara = '$baseUrl/add_evidence_kualitasUdara';
  ///ADD EVIDENCE ID 48
  static String addKualitasAir = '$baseUrl/add_evidence_kualitasAir';
  ///ADD EVIDENCE ID 49
  static String addAirLimbah = '$baseUrl/add_evidence_airLimbah';
  ///ADD EVIDENCE ID 51
  static String addSampahDarat = '$baseUrl/add_evidence_sampah_darat';
  ///ADD EVIDENCE ID 52
  static String addSampahLaut = '$baseUrl/add_evidence_sampah_laut';
  ///ADD EVIDENCE ID 54
  static String addProgramKebersihan = '$baseUrl/add_evidence_kebersihan';
  ///ADD EVIDENCE ID 53
  static String addPemilahanSampah = '$baseUrl/add_evidence_pemilahanSampah';
  ///ADD EVIDENCE ID 58
  static String addLimbahB3 = '$baseUrl/add_evidence_limbah';
  ///ADD EVIDENCE ID 60
  static String addTenan = '$baseUrl/add_evidence_tenan';
  ///ADD EVIDENCE ID 64
  static String addIso = '$baseUrl/add_evidence_iso';
  ///ADD EVIDENCE ID 99
  static String addPengolahanSampah = '$baseUrl/add_evidence_pengolahanSampah';
  ///ADD EVIDENCE ID 100
  static String addDrone = '$baseUrl/add_drone';
  ///ADD EVIDENCE ID NONE
  static String addPenggunaanAir = '$baseUrl/add_penggunaan_air';
  ///ADD EVIDENCE ID NONE
  static String addPenggunaanListrik = '$baseUrl/add_evidence_pengolahanSampah';
// static String addPatroliEnergi = '$baseUrlFile/patroli_energi';
}