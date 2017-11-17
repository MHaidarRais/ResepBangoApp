
//
//  DetailViewController.swift
//  ResepBangoApp
//
//  Created by Haidar Rais on 11/17/17.
//  Copyright © 2017 Haidar Rais. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DetailViewController: UIViewController {
    @IBOutlet weak var labelresep: UILabel!
    @IBOutlet weak var labellama: UILabel!
    @IBOutlet weak var labelporsi: UILabel!
    @IBOutlet weak var labelbahan: UILabel!
    @IBOutlet weak var labelcara: UILabel!
    
    var passresep:String?
    var passlama:String?
    var passporsi:String?
    var passbahan:String?
    var passcara:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelresep.text = passresep
        labellama.text = passlama
        labelporsi.text = passporsi
        labelbahan.text = passbahan
        labelcara.text = passcara

        // Do any additional setup after loading the view.
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
