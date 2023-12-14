//
//  ViewController.swift
//  KisilerUygulamasi
//
//  Created by Talha Gergin on 22.10.2023.
//

import UIKit

class AnaSayfa: UIViewController {
    
    @IBOutlet weak var kisilerTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var kisilerListesi = [Kisiler]()
    var viewModel = AnasayfaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        _ = viewModel.kisilerListesi.subscribe(onNext: {liste in
            self.kisilerListesi = liste
            self.kisilerTableView.reloadData()
        })
        
    }
    override func viewWillAppear(_ animated: Bool) {
        viewModel.kisileriYukle()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{
            if let kisi = sender as? Kisiler{
                let gidilecekVC = segue.destination as! KisiDetay
                gidilecekVC.kisi = kisi
            }
        }
    }
    
}
extension AnaSayfa : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.viewModel.arama(kisi_ad: searchText )
    }
}

extension AnaSayfa : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisilerListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kisi = kisilerListesi[indexPath.row]
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "kisilerHucre") as! KisilerHucre
        
        hucre.labelKisiAd.text = kisi.kisi_ad
        hucre.labelKisiTel.text = kisi.kisi_tel
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let kisi = kisilerListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: kisi)
        tableView.deselectRow(at: indexPath, animated: true)//geri geldiğinde seçili row olma özelliğini kaldırır
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction (style: .destructive, title: "Sil"){contextualAction,view,bool in
            let kisi = self.kisilerListesi[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(kisi.kisi_ad! ) kişisi silinsin mi ?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            let kabulAction = UIAlertAction(title: "Onayla", style: .destructive){action in
                self.viewModel.sil(kisi_id: kisi.kisi_id!)
            }
            alert.addAction(kabulAction)
            self.present(alert, animated: true)
            
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}
