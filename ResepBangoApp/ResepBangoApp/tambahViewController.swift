//
//  tambahViewController.swift
//  ResepBangoApp
//
//  Created by Haidar Rais on 11/17/17.
//  Copyright © 2017 Haidar Rais. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class tambahViewController: UIViewController {
    @IBOutlet weak var etResep: UITextField!
    @IBOutlet weak var etcara: UITextField!
    @IBOutlet weak var etbahan: UITextField!
    @IBOutlet weak var etharga: UITextField!
    @IBOutlet weak var etporsi: UITextField!
    @IBOutlet weak var etlama: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnTambah(_ sender: Any) {

        //deklarasi variable untuk mengambil nilai dari  masing2 widget
        let nilairesep = etResep.text!
        let nilaicara = etcara.text!
        let nilaibahan = etbahan.text!
        let nilaiharga = etharga.text!
        let nilaiporsi = etporsi.text!
        let nilailama = etlama.text!
        
        //cek apakah nilai widget nya kosong
        if ((nilairesep.isEmpty) || (nilaicara.isEmpty) || (nilaibahan.isEmpty) || (nilaiharga.isEmpty) || (nilaiporsi.isEmpty) || (nilailama.isEmpty)){
            
            //muncul alert dialog
            let alertWarning = UIAlertController(title: "Warning", message: "this is required", preferredStyle: .alert)
            let aksi = UIAlertAction(title: "OK", style: .default, handler:nil)
            alertWarning.addAction(aksi)
            present(alertWarning, animated: true, completion:  nil)
        }else{
            //apabila widget kosong
            //membuat parameter untuk di simpan ke database
            let params = ["nama_resep" : nilairesep, "lama_pengerjaan" : nilailama, "jumlah_porsi" : nilaiporsi, "harga" : nilaiharga , "bahan" : nilaibahan , "cara" : nilaicara]
            //mencetak nilai params yang dikirim
            print(params)
            
            let url = "http://localhost/ProjectResep/index.php/api/gettambahresep"
            
            Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: { (responseserver) in
                
                //            Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding, headers: nil).responseJSON(completionHandler: {
                //                (responseserver) in
                
                print(responseserver.result.isSuccess)
                
                if responseserver.result.isSuccess{
                    let json = JSON(responseserver.result.value as Any)
                    let alertWarning = UIAlertController(title: "Warning", message: "this is required", preferredStyle: .alert)
                    let aksi = UIAlertAction(title: "OK", style: .default, handler:nil)
                    alertWarning.addAction(aksi)
                    self.present(alertWarning, animated: true, completion:  nil)
                }
            })
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

