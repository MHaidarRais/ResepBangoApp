//
//  Login.swift
//  ResepBangoApp
//
//  Created by Haidar Rais on 11/17/17.
//  Copyright © 2017 Haidar Rais. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Login: UIViewController {
    @IBOutlet weak var etUsername: UITextField!
    @IBOutlet weak var etPassword: UITextField!
    
    var userDefaults = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
        var userDefaults = UserDefaults()
    }
    @IBAction func btnLogin(_ sender: Any) {
        let nilaiuser = etUsername.text!
        let nilaipass = etPassword.text!
        
        if((nilaiuser.isEmpty || (nilaipass.isEmpty))){
            let alertWarning = UIAlertController(title: "Warning", message: "this is required", preferredStyle: .alert)
            let aksi = UIAlertAction(title: "OK", style: .default, handler:nil)
            alertWarning.addAction(aksi)
            present(alertWarning, animated: true, completion:  nil)
        }else{
            //apabila widget kosong
            //membuat parameter untuk di simpan ke database
            let params = ["email" : nilaiuser, "password" : nilaipass, ]
            //mencetak nilai params yang dikirim
            
            
            let url = "http://localhost/ProjectResep/index.php/api/getlogin"
            
            Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: { (responseserver) in
                
                //            Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding, headers: nil).responseJSON(completionHandler: {
                //                (responseserver) in
                
                print(responseserver.result.isSuccess)
                
                if responseserver.result.isSuccess{
                    let json = JSON(responseserver.result.value as Any)
                    
                    print(json)
                    let data = json["data"].dictionaryValue
                    let nUsername = json["username"].stringValue
                    let nEmail = json["email"].stringValue
                    
                    //menyimpan data ke sesi lokal
                    
                    self.userDefaults.setValue(nUsername, forKey: "USERNAME")
                    self.userDefaults.setValue(nEmail, forKey: "PASSWORD")
                    
                    //untuk sinkronisasi data
                    self.userDefaults.synchronize()
                    
                    //pindah ke layout welcome
                    let story = UIStoryboard.init(name: "Main",bundle: Bundle.main)
                    let id =
                        story.instantiateViewController(withIdentifier: "resep")
                    self.show(id, sender: self)
                    
                    
                }
            })
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

