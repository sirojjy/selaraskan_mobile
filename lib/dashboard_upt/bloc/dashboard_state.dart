part of 'dashboard_bloc.dart';

enum DashboardStateStatus { initial, loading, success, error }

class DashboardState extends Equatable {
  final DashboardStateStatus status;
  final String? nama;
  final double? score;
  final String? totalProgram;
  final String? message;
  final String? programSelesai;
  final String? programBelum;
  final String? jmlProgramMandatori;
  final String? jmlProgramVoluntary;
  final String? linkLokasi;
  final String? sampahDarat;
  final String? sampahDaratOrganik;
  final String? sampahDaratAnorganik;
  final String? sampahLaut;
  final String? sampahLautOrganik;
  final String? sampahLautAnorganik;
  final String? listrikJanuari;
  final String? listrikFebruari;
  final String? listrikMaret;
  final String? listrikApril;
  final String? listrikMei;
  final String? listrikJuni;
  final String? listrikJuli;
  final String? listrikAgustus;
  final String? listrikSeptember;
  final String? listrikOktober;
  final String? listrikNovember;
  final String? listrikDesember;
  final String? airJanuari;
  final String? airFebruari;
  final String? airMaret;
  final String? airApril;
  final String? airMei;
  final String? airJuni;
  final String? airJuli;
  final String? airAgustus;
  final String? airSeptember;
  final String? airOktober;
  final String? airNovember;
  final String? airDesember;
  int indexMenu;

  DashboardState({
    this.status = DashboardStateStatus.initial,
    this.nama,
    this.score,
    this.message,
    this.totalProgram,
    this.programSelesai,
    this.programBelum,
    this.jmlProgramMandatori,
    this.jmlProgramVoluntary,
    this.linkLokasi,
    this.sampahDarat,
    this.sampahDaratOrganik,
    this.sampahDaratAnorganik,
    this.sampahLaut,
    this.sampahLautOrganik,
    this.sampahLautAnorganik,
    this.listrikJanuari,
    this.listrikFebruari,
    this.listrikMaret,
    this.listrikApril,
    this.listrikMei,
    this.listrikJuni,
    this.listrikJuli,
    this.listrikAgustus,
    this.listrikSeptember,
    this.listrikOktober,
    this.listrikNovember,
    this.listrikDesember,
    this.airJanuari,
    this.airFebruari,
    this.airMaret,
    this.airApril,
    this.airMei,
    this.airJuni,
    this.airJuli,
    this.airAgustus,
    this.airSeptember,
    this.airOktober,
    this.airNovember,
    this.airDesember,
    this.indexMenu = 0
  });

  DashboardState copyWith({
    DashboardStateStatus? status,
    String? nama,
    double? score,
    String? message,
    String? totalProgram,
    String? programSelesai,
    String? programBelum,
    String? jmlProgramMandatori,
    String? jmlProgramVoluntary,
    String? linkLokasi,
    String? sampahDarat,
    String? sampahDaratOrganik,
    String? sampahDaratAnorganik,
    String? sampahLaut,
    String? sampahLautOrganik,
    String? sampahLautAnorganik,
    String? listrikJanuari,
    String? listrikFebruari,
    String? listrikMaret,
    String? listrikApril,
    String? listrikMei,
    String? listrikJuni,
    String? listrikJuli,
    String? listrikAgustus,
    String? listrikSeptember,
    String? listrikOktober,
    String? listrikNovember,
    String? listrikDesember,
    String? airJanuari,
    String? airFebruari,
    String? airMaret,
    String? airApril,
    String? airMei,
    String? airJuni,
    String? airJuli,
    String? airAgustus,
    String? airSeptember,
    String? airOktober,
    String? airNovember,
    String? airDesember,
    int? indexMenu,
  }) {
    return DashboardState(
      status: status ?? this.status,
      nama: nama ?? this.nama,
      score: score ?? this.score,
      totalProgram: totalProgram ?? this.totalProgram,
      message: message ?? this.message,
      programSelesai: programSelesai ?? this.programSelesai,
      programBelum: programBelum ?? this.programBelum,
      jmlProgramMandatori: jmlProgramMandatori ?? this.jmlProgramMandatori,
      jmlProgramVoluntary: jmlProgramVoluntary ?? this.jmlProgramVoluntary,
      linkLokasi: linkLokasi ?? this.linkLokasi,
      sampahDarat: sampahDarat ?? this.sampahDarat,
      sampahDaratOrganik: sampahDaratOrganik ?? this.sampahDaratOrganik,
      sampahDaratAnorganik: sampahDaratAnorganik ?? this.sampahDaratAnorganik,
      sampahLaut: sampahLaut ?? this.sampahLaut,
      sampahLautOrganik: sampahLautOrganik ?? this.sampahLautOrganik,
      sampahLautAnorganik: sampahLautAnorganik ?? this.sampahLautAnorganik,
      listrikJanuari: listrikJanuari ?? this.listrikJanuari,
      listrikFebruari: listrikFebruari ?? this.listrikFebruari,
      listrikMaret: listrikMaret ?? this.listrikMaret,
      listrikApril: listrikApril ?? this.listrikApril,
      listrikMei: listrikMei ?? this.listrikMei,
      listrikJuni: listrikJuni ?? this.listrikJuni,
      listrikJuli: listrikJuli ?? this.listrikJuli,
      listrikAgustus: listrikAgustus ?? this.listrikAgustus,
      listrikSeptember: listrikSeptember ?? this.listrikSeptember,
      listrikOktober: listrikOktober ?? this.listrikOktober,
      listrikNovember: listrikNovember ?? this.listrikNovember,
      listrikDesember: listrikDesember ?? this.listrikDesember,
      airJanuari: airJanuari ?? this.airJanuari,
      airFebruari: airFebruari ?? this.airFebruari,
      airMaret: airMaret ?? this.airMaret,
      airApril: airApril ?? this.airApril,
      airMei: airMei ?? this.airMei,
      airJuni: airJuni ?? this.airJuni,
      airJuli: airJuli ?? this.airJuli,
      airAgustus: airAgustus ?? this.airAgustus,
      airSeptember: airSeptember ?? this.airSeptember,
      airOktober: airOktober ?? this.airOktober,
      airNovember: airNovember ?? this.airNovember,
      airDesember: airDesember ?? this.airDesember,
      indexMenu: indexMenu ?? this.indexMenu
    );
  }

  @override
  List<Object?> get props => [
    status,
    nama,
    score,
    totalProgram,
    message,
    programSelesai,
    programBelum,
    jmlProgramMandatori,
    jmlProgramVoluntary,
    linkLokasi,
    sampahDarat,
    sampahDaratOrganik,
    sampahDaratAnorganik,
    sampahLaut,
    sampahLautOrganik,
    sampahLautAnorganik,
    listrikJanuari,
    listrikFebruari,
    listrikMaret,
    listrikApril,
    listrikMei,
    listrikJuni,
    listrikJuli,
    listrikAgustus,
    listrikSeptember,
    listrikOktober,
    listrikNovember,
    listrikDesember,
    airJanuari,
    airFebruari,
    airMaret,
    airApril,
    airMei,
    airJuni,
    airJuli,
    airAgustus,
    airSeptember,
    airOktober,
    airNovember,
    airDesember,
    indexMenu
  ];
}
