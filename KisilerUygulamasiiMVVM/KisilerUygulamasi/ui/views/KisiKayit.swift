//
//  KisiKayit.swift
//  KisilerUygulamasi
//
//  Created by Talha Gergin on 22.10.2023.
//

import UIKit

class KisiKayit: UIViewController {

    @IBOutlet weak var tfKisitel: UITextField!
    @IBOutlet weak var tfKisiad: UITextField!
    
    var viewModel = KisiKayitViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

    @IBAction func btnKaydet(_ sender: Any) {
        if let ka = tfKisiad.text, let kt = tfKisitel.text{
            viewModel.Kaydet(kisi_ad: ka, kisi_tel: kt) 
        }
        
    }
    
    
}
