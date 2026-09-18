class MailServisi {
  void gonder(String email, String mesaj) {
    print("Mail gönderildi: $email");
    print("Mesaj: $mesaj");
  }
}

class SmsServisi {
  void gonder(String telefon, String mesaj) {
    print("SMS gönderildi: $telefon");
    print("Mesaj: $mesaj");
  }
}