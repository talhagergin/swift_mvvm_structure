//
//  KisilerDaoRepository.swift
//  KisilerUygulamasi
//
//  Created by Talha Gergin on 29.10.2023.
//

import Foundation
import RxSwift

class KisilerDaoRepository{
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    
    func Kaydet (kisi_ad:String,kisi_tel:String){
        print("\(kisi_ad) kişi \(kisi_tel) numarası ile eklendi")
    }
    
    
    func Guncelle(kisi_id:Int?,kisi_ad:String?,kisi_tel:String?){
        print("\(kisi_ad!) kişisi \(kisi_tel!) numarası ile güncellendi")
    }
    
    func Sil(kisi_id:Int){
        print("Kişi \(kisi_id) silindi")
        KisileriYukle()
    }
    
    func Arama(kisi_ad:String){
        print("\(kisi_ad) adlı kişi aranıyor")
    }
    
    func KisileriYukle(){
        var kisiler = [Kisiler]()
        let k1 = Kisiler(kisi_id: 1, kisi_ad: "Talha", kisi_tel: "1111")
        let k2 = Kisiler(kisi_id: 2, kisi_ad: "Ali", kisi_tel: "222")
        let k3 = Kisiler(kisi_id: 3, kisi_ad: "Veli", kisi_tel: "3213")
        let k4 = Kisiler(kisi_id: 4, kisi_ad: "Ayşe", kisi_tel: "123213")
        kisiler.append(k1)
        kisiler.append(k2)
        kisiler.append(k3)
        kisiler.append(k4)
        kisilerListesi.onNext(kisiler)
    }
}
