class SqliteVeritabani {
  void kaydet(String sql) {
    print("DB çalıştırıldı: $sql");
  }
}

class SiparisRepository {
  final SqliteVeritabani veritabani;

  SiparisRepository(this.veritabani);

  void kaydet(String orderId, double tutar) {
    veritabani.kaydet(
      "INSERT INTO siparisler VALUES ('$orderId', $tutar)",
    );
  }
}