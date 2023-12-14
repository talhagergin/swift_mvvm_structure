//
//  KisiDetay.swift
//  KisilerUygulamasi
//
//  Created by Talha Gergin on 22.10.2023.
//

import UIKit

class KisiDetay: UIViewController {
    var kisi:Kisiler?
    @IBOutlet weak var tfKisiTel: UITextField!
    @IBOutlet weak var tfKisiAd: UITextField!
    
    var viewModel = KisiDetayViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let k = kisi{
            tfKisiAd.text = k.kisi_ad
            tfKisiTel.text = k.kisi_tel
        }
      
    }
    

    @IBAction func btnGuncelle(_ sender: Any) {
        if let ka = tfKisiAd.text, let kt = tfKisiTel.text, let k = kisi{
            viewModel.Guncelle(kisi_id:k.kisi_id! , kisi_ad: ka, kisi_tel: kt)

        }
    }
    
}
