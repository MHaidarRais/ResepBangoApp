//
//  ResepTableViewController.swift
//  ResepBangoApp
//
//  Created by Haidar Rais on 11/17/17.
//  Copyright © 2017 Haidar Rais. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ResepTableViewController: UITableViewController {
    var selectedresep:String?
    var selectedporsi:String?
    var selectedlama:String?
    
    var nampungid : String? = nil
    //deklarasi array berita
    var arrayberita = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("id + " + nampungid!)
        
        let params = ["id_resep" : nampungid!]
        let url = "http://localhost/ProjectReseo/index.php/api/getresep"
        
        Alamofire.request(url, method: .post, parameters: params, encoding:URLEncoding.default, headers: nil).responseJSON(completionHandler:{ (response) in
            //check response
            if response.result.isSuccess {
                //kalau response succes kita ambil JSON
                let json = JSON(response.result.value as Any)
                print(json)
                //get jsonarray dari json diatas
                self.arrayberita = json["data"].arrayObject as! [[String:String]]
                //check di log
                //print (self.arrayberita)
                
                //cehck jumlah array
                if(self.arrayberita.count > 0){
                    
                    //refresh tableview
                    self.tableView.reloadData()
                }
            }
            else{
                print("error server")
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayberita.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellanggota", for: indexPath) as! resepTableViewCell
        
        var serverid = arrayberita[indexPath.row]
        
        var nama_resep = serverid["nama_resep"]
        var lama_pengerjaan = serverid["lama_pengerjaan"]
        var jumlah_porsi = serverid["jumlah_porsi"]
        
        
        //pindahkan ke label
        cell.labelresep.text = nama_resep
        cell.labelporsi.text = lama_pengerjaan
        cell.labellama.text = jumlah_porsi
        
        
        // Configure the cell...
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Row \(indexPath.row)selected")
        
        let task = arrayberita[indexPath.row]
        selectedresep = task["nama_resep"] as! String
        selectedlama = task["lama_pengerjaan"] as! String
        selectedporsi = task["jumlah_porsi"] as! String
        
        
        performSegue(withIdentifier: "passDetail", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "passDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! DetailViewController
                let value = arrayberita[indexPath.row]
                
                controller.passresep = value["nama_resep"] as! String
                controller.passporsi = value["jumlah_porsi"] as! String
                controller.passlama = value["lama_pengerjaan"] as! String
                
            }
        }
        
        
        /*
         // Override to support conditional editing of the table view.
         override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
         // Return false if you do not want the specified item to be editable.
         return true
         }
         */
        
        /*
         // Override to support editing the table view.
         override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
         if editingStyle == .delete {
         // Delete the row from the data source
         tableView.deleteRows(at: [indexPath], with: .fade)
         } else if editingStyle == .insert {
         // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
         }
         }
         */
        
        /*
         // Override to support rearranging the table view.
         override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
         
         }
         */
        
        /*
         // Override to support conditional rearranging of the table view.
         override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
         // Return false if you do not want the item to be re-orderable.
         return true
         }
         */
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destinationViewController.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}


