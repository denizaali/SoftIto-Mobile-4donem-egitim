const sarjHesapla = (
    mevcutYuzde,
    hedefYuzde,
    aracKw,
    istasyonKw,
    tarife
) => {
    const gerekenEnerji = hedefYuzde - mevcutYuzde;

    // Araba ve istasyon arasındaki düşük olan değeri kullan
    const alinanKw = Math.min(aracKw, istasyonKw);

    const sure = gerekenEnerji / alinanKw;

    const fiyat = tarife === "gece" ? 3 : 5;

    const maliyet = gerekenEnerji * fiyat;

    return {
        alinanKw,
        sure: Math.round(sure * 100) / 100,
        maliyet
    };
};

console.log(sarjHesapla(30, 80, 11, 50, "gece"));