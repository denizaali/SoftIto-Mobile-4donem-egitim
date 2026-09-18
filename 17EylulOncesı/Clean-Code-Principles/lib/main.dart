import 'models/urun.dart';
import 'repository/siparis_repository.dart';
import 'services/bildirim.dart';
import 'services/fatura.dart';
import 'services/kargo.dart';
import 'services/kupon.dart';
import 'services/odeme.dart';
import 'services/siparis.dart';

void main() {
  final veritabani = SqliteVeritabani();

  final siparisRepository = SiparisRepository(
    veritabani,
  );

  final siparisServisi = SiparisServisi(
    siparisRepository: siparisRepository,
    odemeYontemi: KrediKartiOdeme(),
    kargoServisi: KargoServisi(),
    mailServisi: MailServisi(),
    smsServisi: SmsServisi(),
    faturaServisi: FaturaServisi(),
    kuponServisi: KuponServisi(),
  );

  final urun1 = FizikselUrun(
    "1",
    "Kablosuz Mouse",
    450.0,
    5,
  );

  final urun2 = DijitalUrun(
    "2",
    "Flutter Kursu E-Kitap",
    150.0,
    100,
  );

  final sepet = <Urun>[
    urun1,
    urun2,
  ];

  siparisServisi.siparisiTamamla(
    orderId: "SP-9921",
    sepet: sepet,
    musteriAdi: "Selahaddin",
    email: "selahaddin@kodvance.com",
    telefon: "05551112233",
    adres: "Kadıköy / İstanbul",
    kuponKodu: "INDIRIM10",
  );
}