//
//  KisiKayitViewModel.swift
//  KisilerUygulamasi
//
//  Created by Talha Gergin on 29.10.2023.
//

import Foundation

class KisiKayitViewModel{
    
    var krepo = KisilerDaoRepository()
    
    func Kaydet (kisi_ad:String,kisi_tel:String){
        krepo.Kaydet(kisi_ad: kisi_ad, kisi_tel: kisi_tel)
    }
}
