//
//  BerandaVC.swift
//  MU
//
//  Created by NDS on 13/04/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit
import Alamofire
import Nuke

class BerandaVC: UIViewController {
    @IBOutlet weak var berandaTableView: UITableView!
    
    var feeds: [Feeds] = {
        let feeds1 = Feeds(image: "foto3", desc: """
            That's a wrap! Selengkapnya #KonferensiPersOle jelang laga #ARSMUN dapat disimak di timeline MUW. Berikut ringkasannya.
            1. Eric Bailly bugar
            2. Kondisi Herrera-Matic 50/50
            3. United lolos ke QF CL bukan kejutan
            4. Sekarang fokus ke Arsenal
            5. Masa depan? Tunggu musim panas
            6. Senang bisa bekerja di United
            7. Ole positif dan optimis udah dari dulu
            8. Pemilihan skuad tidak akan mudah
            9. Scott, Fred, dan Andreas bisa diandalin
            10. Scott dan Fred mungkin diistirahatkan
            11. Manajer sukses ga harus eks pemain
            12. Semoga Rash bisa jadi legenda klub
            13. Rash masih 21 tahun, inkonsistensi wajar
            14. Rash mesti lebih tajam di kotak penalti
            """
        )
        let feeds2 = Feeds(image: "mu1", desc: """
            ALERI - PSG 1 United 3. What a night! Dwigol Lukaku di babak pertama dan gol penalti Rashford di menit-menit terakhir laga mengantarkan United ke perempat final berkat agresivitas gol tandang. #PSGMUN #UCL
            """
        )
        
        return [feeds1, feeds2]
    }()
    
    var feed: [[String: Any]] = [[String: Any]]()
    
    override func viewWillAppear(_ animated: Bool) {
//        fetchFirstFBPost()
        fetchNextFBPost()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        berandaTableView.register(BerandaTVC.nib, forCellReuseIdentifier: BerandaTVC.identifier)
        berandaTableView.separatorStyle = .none

        // Do any additional setup after loading the view.
    }
    
    func fetchFirstFBPost() {
        
        var urlString = "https://graph.facebook.com/manutd.world?fields=id,posts{id,updated_time,message,picture,full_picture}&access_token=2074204692872362|h67ziJhWqSoXdfbCb6WoTAn1AWc"
        
        urlString = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        Alamofire.request(urlString).responseJSON { (response) in
            print("Result: \(response.result)") // response serialization result
            
            if let json = response.result.value as! [String: Any]? {
                if let posts = json["posts"] as! [String: Any]? {
                    self.feed = posts["data"] as! [[String: Any]]
                    self.berandaTableView.reloadData()
                    print("JSON data : \(self.feed)")
                }
            }
            
        }
    }
    
    func fetchNextFBPost() {
        
        let urlString = "https://graph.facebook.com/v3.2/106572646099883/posts?access_token=2074204692872362%7Ch67ziJhWqSoXdfbCb6WoTAn1AWc&pretty=1&fields=id%2Cupdated_time%2Cmessage%2Cpicture%2Cfull_picture&limit=25&after=Q2c4U1pXNTBYM0YxWlhKNVgzTjBiM0o1WDJsa0R5SXhNRFkxTnpJMk5EWXdPVGs0T0RNNkxUazVOekU1TXpjMk1UZAzRNak13TXpRMkR3eGhjR2xmYzNSdmNubGZAhV1FQSURFd05qVTNNalkwTmpBNU9UZAzRNMTh5TWpBeE5ETXhOalk1T1RRM01qa3pEd1IwYVcxbEJseTJLeUVC"
    
        Alamofire.request(urlString).responseJSON { (response) in
            print("Result: \(response.result)") // response serialization result
            
            if let json = response.result.value as! [String: Any]? {
                if let posts = json["data"] as! [[String: Any]]? {
                    self.feed = posts
                    self.berandaTableView.reloadData()
                }
            }
            
        }
    }
    
}

extension BerandaVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = berandaTableView.dequeueReusableCell(withIdentifier: BerandaTVC.identifier, for: indexPath) as! BerandaTVC
        
            if self.feed.count > 0 {
                let fetchFeed = self.feed[indexPath.row]
        
                    cell.feedLabel.text = fetchFeed["message"] as? String
                
                if let picture = fetchFeed["full_picture"] as? String {
                    let urlString = URL(string: picture)
                    
                        Nuke.loadImage(
                            with: urlString!,
                            options: ImageLoadingOptions(
                                placeholder: UIImage(named: "placeholder"),
                                transition: .fadeIn(duration: 0.33)
                            ), into: cell.feedImageView
                        )
                }
            }
        
        return cell
        
    }
    
}
