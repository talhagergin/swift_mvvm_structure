//
//  AnasayfaViewModel.swift
//  KisilerUygulamasi
//
//  Created by Talha Gergin on 29.10.2023.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
    var anasayfarepo = KisilerDaoRepository()
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())

    init(){
        kisilerListesi=anasayfarepo.kisilerListesi
        kisileriYukle()
    }
    
    func sil(kisi_id:Int){
        anasayfarepo.Sil(kisi_id: kisi_id)
    }
    func arama(kisi_ad:String){
        anasayfarepo.Arama(kisi_ad: kisi_ad)
    }
    func kisileriYukle(){
        anasayfarepo.KisileriYukle()
    }
}
