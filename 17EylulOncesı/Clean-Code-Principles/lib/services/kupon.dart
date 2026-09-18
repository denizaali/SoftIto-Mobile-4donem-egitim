class KuponServisi {
  double indirimUygula(double tutar, String kuponKodu) {
    if (kuponKodu == "INDIRIM10") {
      return tutar * 0.90;
    }

    if (kuponKodu == "YAZ20") {
      return tutar * 0.80;
    }

    if (kuponKodu == "SEPETTE50") {
      return tutar - 50;
    }

    return tutar;
  }
}