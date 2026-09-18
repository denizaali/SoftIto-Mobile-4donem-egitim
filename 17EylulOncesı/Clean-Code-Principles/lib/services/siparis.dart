import '../models/urun.dart';
import '../repository/siparis_repository.dart';
import 'bildirim.dart';
import 'fatura.dart';
import 'kargo.dart';
import 'kupon.dart';
import 'odeme.dart';

class SiparisServisi {
  final SiparisRepository siparisRepository;
  final OdemeYontemi odemeYontemi;
  final KargoServisi kargoServisi;
  final MailServisi mailServisi;
  final SmsServisi smsServisi;
  final FaturaServisi faturaServisi;
  final KuponServisi kuponServisi;

  SiparisServisi({
    required this.siparisRepository,
    required this.odemeYontemi,
    required this.kargoServisi,
    required this.mailServisi,
    required this.smsServisi,
    required this.faturaServisi,
    required this.kuponServisi,
  });

  void siparisiTamamla({
    required String orderId,
    required List<Urun> sepet,
    required String musteriAdi,
    required String email,
    required String telefon,
    required String adres,
    required String kuponKodu,
  }) {
    double toplam = 0;

    for (var urun in sepet) {
      if (urun.stok <= 0) {
        print("Hata: ${urun.ad} tükenmiş!");
        return;
      }

      toplam += urun.toplamFiyat();
      urun.stok--;
    }

    toplam = kuponServisi.indirimUygula(
      toplam,
      kuponKodu,
    );

    double kdv = toplam * 0.20;
    double sonTutar = toplam + kdv;

    odemeYontemi.ode(sonTutar);

    siparisRepository.kaydet(
      orderId,
      sonTutar,
    );

    faturaServisi.yazdir(orderId);

    mailServisi.gonder(
      email,
      "Sayın $musteriAdi, siparişiniz alındı. "
      "Tutar: $sonTutar TL",
    );

    smsServisi.gonder(
      telefon,
      "Siparişiniz onaylandı: $orderId",
    );

    kargoServisi.gonder(
      orderId,
      adres,
    );
  }
}