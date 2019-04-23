//
//  BerandaVC.swift
//  MU
//
//  Created by NDS on 13/04/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView

class BerandaVC: UIViewController {
    
    @IBOutlet weak var berandaTableView: UITableView!
    @IBOutlet weak var berandaLoading: UIActivityIndicatorView!
    
    var fbData: FBModel?
    var nextPost: Bool = false
    let dispatchQueue = DispatchQueue(label: "SerialQueue")
    let tokenFB: String = "2074204692872362|h67ziJhWqSoXdfbCb6WoTAn1AWc"
    
    override func loadView() {
        super.loadView()
        berandaTableView.backgroundView = berandaLoading
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if fbData?.posts == nil {
            berandaLoading.startAnimating()
            
            DispatchQueue.main.async {
                self.fetchFirstFBPost()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        berandaTableView.register(BerandaTVC.nib, forCellReuseIdentifier: BerandaTVC.identifier)
        berandaTableView.register(LoadingTVC.nib, forCellReuseIdentifier: LoadingTVC.identifier)
        berandaTableView.separatorStyle = .none
        
        berandaTableView.estimatedRowHeight = 350
        berandaTableView.rowHeight = UITableView.automaticDimension

    }
    
    func fetchFirstFBPost() {
        
        var urlString = "https://graph.facebook.com/manutd.world?fields=posts.limit(3){id,created_time,message,full_picture,object_id}&access_token=\(self.tokenFB)"
        
        urlString = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? ""

        Alamofire.request(urlString).responseJSON { (response) in
            
            switch response.result {
                
            case .success(let data):
                
                let json = JSON(data)
                self.fbData = FBModel(attributes: json["posts"].dictionaryValue)
                
//                DispatchQueue.main.async {
//                    self.berandaTableView.reloadDataWithAutoSizingCellWorkAround()
//                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    //Reload with delay
                    self.berandaTableView.reloadDataWithAutoSizingCellWorkAround()

                    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                        self.berandaTableView.reloadDataWithAutoSizingCellWorkAround()
                    })
                }
                
                self.berandaLoading.stopAnimating()
                
            case .failure(let error):
                print("Error Fetch Feeds Post : \(error)")
            }
        }
        
    }
    
    func fetchNextPost() {
        
        nextPost = true
        
//        berandaTableView.beginUpdates()
//        self.berandaTableView.reloadSections(IndexSet(integer: 1), with: UITableView.RowAnimation.none)
//        berandaTableView.endUpdates()
        
//        let indexPath = IndexPath(row: 0, section: 1)
//        berandaTableView.beginUpdates()
//        berandaTableView.insertRows(at: [indexPath], with: UITableView.RowAnimation.none)
//        berandaTableView.endUpdates()
        
        if let urlString = fbData?.paging?.next {
            guard let url = URL(string: urlString) else { return }
            
            Alamofire.request(url).responseJSON { (response) in
                
                switch response.result {
                    
                case .success(let data):
                    
                    let json = JSON(data)
                    let newPost = FBModel.init(attributes: json.dictionaryValue)
                    let obj = self.fbData
                    obj?.paging = newPost.paging
                    newPost.posts?.forEach({ (post) in
                        obj?.posts?.append(post)
                    })
                    self.fbData = obj
                    self.nextPost = false
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        //Reload with delay
                        self.berandaTableView.reloadDataWithAutoSizingCellWorkAround()

                        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                            self.berandaTableView.reloadDataWithAutoSizingCellWorkAround()
                        })
                    }
                    
//                    DispatchQueue.main.async {
//                        self.berandaTableView.reloadDataWithAutoSizingCellWorkAround()
//                    }
                    
                case .failure(let error):
                    print("Error Fetch Next Post: \(error)")
                }
            }
        }
        
    }
    
    func getDetailPost(idObject: String, completionHandler: @escaping ( [String: Any] ) -> Void) {
        var urlString = "https://graph.facebook.com/\(idObject)?fields=id,link,width,height&access_token=\(self.tokenFB)"
        
        urlString = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? ""
        
        Alamofire.request(urlString).responseJSON { (response) in
            
            switch response.result {
            
            case .success(let data):
                
                let json = JSON(data)
                guard let dict = json.dictionaryObject else { fatalError() }
//                let heightString = json["height"].stringValue
//                heightPic = CGFloat((heightString as NSString).floatValue)
//                print("HeightString : \(heightPic)")
                print(dict)
                
                completionHandler(dict)
                
            case .failure(let error):
                print("Error Get Detail Image : \(error)")
            }
        }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY         = scrollView.contentOffset.y
        let contentHeight   = scrollView.contentSize.height
        let frameHeight     = scrollView.frame.height
        
//        print("Offset Y : \(offsetY) & Content Height : \(contentHeight) & Frame Height : \(frameHeight)")
        
        if offsetY > contentHeight - frameHeight {
            if !nextPost {
                fetchNextPost()
            }
        }
    }
    
}
extension BerandaVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            if let count = fbData?.posts?.count {
                return count
            } else {
                return 0
            }
        } else if section == 1 && nextPost {
                return 1
        }
        
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch (indexPath.section) {
        case 0:
            
            if let cell = berandaTableView.dequeueReusableCell(withIdentifier: BerandaTVC.identifier, for: indexPath) as? BerandaTVC {
        
                if (self.fbData?.posts?.indices.contains(indexPath.row))! {
                    if let data = self.fbData?.posts?[indexPath.row] {
                        if let idPost = data.objectId {
                            getDetailPost(idObject: idPost) { (dataDetailPost) in
                                cell.detailPost = dataDetailPost
                            }
                        }
                            
                        cell.data = data
                    }
                }
                cell.layoutIfNeeded()
                return cell
            }
        case 1:
            
            if let cell = berandaTableView.dequeueReusableCell(withIdentifier: LoadingTVC.identifier, for: indexPath) as? LoadingTVC {
                
                return cell
            }
        default:
            return UITableViewCell()
        }
        
        return UITableViewCell()
    }
    
}
