class ReportModel {
  String? date;
  String? year;
  String? localChurch;
  String? address;
  String? fplw;
  String? soulSaved;
  String? bbhs;
  String? wb;
  String? discipled;
  String? nbscg;
  String? nofworkers;
  String? avgattlm;
  String? avgtttlm;
  String? men;
  String? women;
  String? youth;
  String? couples;
  String? css;

  ReportModel(
      {this.date,
      this.year,
      this.localChurch,
      this.address,
      this.fplw,
      this.soulSaved,
      this.bbhs,
      this.wb,
      this.discipled,
      this.nbscg,
      this.nofworkers,
      this.avgattlm,
      this.avgtttlm,
      this.men,
      this.women,
      this.youth,
      this.couples,
      this.css});

  // receiving data from server
  factory ReportModel.fromMap(map) {
    return ReportModel(
        date: map['date'],
        year: map['year'],
        localChurch: map['localChurch'],
        address: map['address'],
        fplw: map['fplw'],
        soulSaved: map['soulSaved'],
        bbhs: map['bbhs'],
        wb: map['wb'],
        discipled: map['discipled'],
        nbscg: map['nbscg'],
        nofworkers: map['nofworkers'],
        avgattlm: map['avgattlm'],
        avgtttlm: map['avgtttlm'],
        men: map['men'],
        women: map['women'],
        youth: map['youth'],
        couples: map['couples'],
        css: map['css']);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'year': year,
      'localChurch': localChurch,
      'address': address,
      'fplw': fplw,
      'soulSaved': soulSaved,
      'bbhs': bbhs,
      'wb': wb,
      'discipled': discipled,
      'nbscg': nbscg,
      'nofworkers': nofworkers,
      'avgattlm': avgattlm,
      'avgtttlm': avgtttlm,
      'men': men,
      'women': women,
      'youth': youth,
      'couples': couples,
      'css': css
    };
  }
}
