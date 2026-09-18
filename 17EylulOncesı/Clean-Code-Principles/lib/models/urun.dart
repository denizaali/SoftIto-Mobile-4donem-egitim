abstract class Urun {
  final String id;
  final String ad;
  final double fiyat;
  int stok;

  Urun(
    this.id,
    this.ad,
    this.fiyat,
    this.stok,
  );

  double toplamFiyat();
}

class FizikselUrun extends Urun {
  static const double kargoUcreti = 29.90;

  FizikselUrun(
    String id,
    String ad,
    double fiyat,
    int stok,
  ) : super(id, ad, fiyat, stok);

  @override
  double toplamFiyat() {
    return fiyat + kargoUcreti;
  }
}

class DijitalUrun extends Urun {
  DijitalUrun(
    String id,
    String ad,
    double fiyat,
    int stok,
  ) : super(id, ad, fiyat, stok);

  @override
  double toplamFiyat() {
    return fiyat;
  }
}