//
//  KisiDetayViewModel.swift
//  KisilerUygulamasi
//
//  Created by Talha Gergin on 29.10.2023.
//

import Foundation

class KisiDetayViewModel {
    
    var krepo = KisilerDaoRepository()
    
    func Guncelle(kisi_id:Int?,kisi_ad:String?,kisi_tel:String?){
        krepo.Guncelle(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
    }
}
