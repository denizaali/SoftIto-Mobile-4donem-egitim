abstract class OdemeYontemi {
  void ode(double tutar);
}

class KrediKartiOdeme implements OdemeYontemi {
  @override
  void ode(double tutar) {
    print("$tutar TL kredi kartından POS ile çekildi.");
  }
}

class HavaleOdeme implements OdemeYontemi {
  @override
  void ode(double tutar) {
    print("$tutar TL havale kontrol edildi.");
  }
}

class KapidaOdeme implements OdemeYontemi {
  @override
  void ode(double tutar) {
    print("$tutar TL kapıda ödeme tahsil edilecek.");
  }
}

class CryptoOdeme implements OdemeYontemi {
  @override
  void ode(double tutar) {
    print("$tutar TL USDT transferi onaylandı.");
  }
}