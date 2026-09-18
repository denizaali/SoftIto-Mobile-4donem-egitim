class Banka {
    bakiyeXML() {
        return "<bakiye>5000</bakiye>";
    }
    kullaniciXML() {
        return "<kullanici><ad>Ahmet</ad><soyad>Yıldız</soyad></kullanici>";
    }
}

class BankaAdaptoru {
    constructor() {
        this.banka = new Banka();
    }

    kullaniciVeBakiyeObje() {
       
        const bakiyeXml = this.banka.bakiyeXML();
        const kullaniciXml = this.banka.kullaniciXML();

       
        const bakiye = bakiyeXml.replace("<bakiye>", "").replace("</bakiye>", "");
        const ad = kullaniciXml.match(/<ad>(.*?)<\/ad>/)[1];
        const soyad = kullaniciXml.match(/<soyad>(.*?)<\/soyad>/)[1];

        
        return {
            ad: ad,
            soyad: soyad,
            fullName: `${ad} ${soyad}`,
            balance: Number(bakiye)
        };
    }
}

const adaptor = new BankaAdaptoru();
const veri = adaptor.kullaniciVeBakiyeObje();

console.log(veri.fullName); 
console.log(veri.balance);  
console.log(veri);          