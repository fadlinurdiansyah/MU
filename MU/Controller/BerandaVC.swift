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
    
    /*------- UIComponent --------*/
    @IBOutlet weak var berandaTableView: UITableView!
    @IBOutlet weak var berandaLoading: UIActivityIndicatorView!
    
    /*------ Declare Variable -----*/
    var fbData: FBModel?
    var nextPost: Bool = false
    let dispatchQueue = DispatchQueue(label: "SerialQueue")
    // Token API facebook
    let tokenFB: String = "2074204692872362|h67ziJhWqSoXdfbCb6WoTAn1AWc"
    
    override func loadView() {
        super.loadView()
        berandaTableView.backgroundView = berandaLoading
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Check FBmodel if nil start UIActivtyIndicator
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
        berandaTableView.separatorStyle = .none // Set nil separator in uitabelview
        berandaTableView.estimatedRowHeight = 350 // Set estimated row height uitableview
        berandaTableView.rowHeight = UITableView.automaticDimension // Set automatic dimension uitableview

    }
    
    //MARK: Method fetch data from Facebook Graf API
    func fetchFirstFBPost() {
        
        //cURL to get feeds from group facebook
        var urlString = "https://graph.facebook.com/manutd.world?fields=posts.limit(6){id,created_time,message,full_picture,object_id}&access_token=\(self.tokenFB)"
        
        urlString = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? ""

        //Start request
        Alamofire.request(urlString).responseJSON { (response) in
            
            switch response.result {
                
            case .success(let data):
                
                //Pass json to FBModel
                let json = JSON(data)
                self.fbData = FBModel(attributes: json["posts"].dictionaryValue)
    
                //Reload tableview with delay
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    //Reload with delay
                    self.berandaTableView.reloadDataWithAutoSizingCellWorkAround()

                    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                        self.berandaTableView.reloadDataWithAutoSizingCellWorkAround()
                    })
                }
                
                //Stop UIActivityIndicator if request data finish
                self.berandaLoading.stopAnimating()
                
            case .failure(let error):
                print("Error Fetch Feeds Post : \(error)")
            }
        }
        
    }
    
    //MARK: Method fetch data from facebook API with auto generate (cURL next feeds)
    func fetchNextPost() {
        nextPost = true
        
//        berandaTableView.beginUpdates()
//        self.berandaTableView.reloadSections(IndexSet(integer: 1), with: UITableView.RowAnimation.none)
//        berandaTableView.endUpdates()
        
//        let indexPath = IndexPath(row: 0, section: 1)
//        berandaTableView.beginUpdates()
//        berandaTableView.insertRows(at: [indexPath], with: UITableView.RowAnimation.none)
//        berandaTableView.endUpdates()
        
        //Check value next cURL from FBModel, if exists request data
        if let urlString = fbData?.paging?.next {
            guard let url = URL(string: urlString) else { return }
            
            //Start request
            Alamofire.request(url).responseJSON { (response) in
                
                switch response.result {
                    
                case .success(let data):
                    
                    // Add FBModel from json
                    let json = JSON(data)
                    let newPost = FBModel.init(attributes: json.dictionaryValue)
                    let obj = self.fbData
                    obj?.paging = newPost.paging
                    newPost.posts?.forEach({ (post) in
                        obj?.posts?.append(post)
                    })
                    self.fbData = obj
                    self.nextPost = false
                    
                    //Reload tableview with delay
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        //Reload with delay
                        self.berandaTableView.reloadDataWithAutoSizingCellWorkAround()

                        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                            self.berandaTableView.reloadDataWithAutoSizingCellWorkAround()
                        })
                    }
                case .failure(let error):
                    print("Error Fetch Next Post: \(error)")
                }
            }
        }
        
    }
    
    //MARK: Method get detail Post from group facebook with params : id object (from FBModel) and completionHandler with: dictionary object
    func getDetailPost(idObject: String, completionHandler: @escaping ( [String: Any] ) -> Void) {
        
        //cURL to get detail feeds from group facebook
        var urlString = "https://graph.facebook.com/\(idObject)?fields=id,link,width,height&access_token=\(self.tokenFB)"
        
        urlString = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? ""
        
        //Start request
        Alamofire.request(urlString).responseJSON { (response) in
            
            switch response.result {
            
            case .success(let data):
                
                // Pass json to dictionary
                let json = JSON(data)
                guard let dict = json.dictionaryObject else { fatalError() }
//                let heightString = json["height"].stringValue
//                heightPic = CGFloat((heightString as NSString).floatValue)
//                print("HeightString : \(heightPic)")
//                print(dict)
                
                completionHandler(dict) // return dictionary object
                
            case .failure(let error):
                print("Error Get Detail Image : \(error)")
            }
        }
        
    }
    
    //MARK: Method load next Post after scroll on end content
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY         = scrollView.contentOffset.y // Get y position
        let contentHeight   = scrollView.contentSize.height // Get scrollview content size height
        let frameHeight     = scrollView.frame.height // Get scrollview frame height
        
//        print("Offset Y : \(offsetY) & Content Height : \(contentHeight) & Frame Height : \(frameHeight)")
        
        // Run load next post if scroll position in end content
        if offsetY > contentHeight - frameHeight {
            if !nextPost {
                fetchNextPost()
            }
        }
    }
    
}

extension BerandaVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2 // Set total section in tableview
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //Set total cell in section tableview
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
        
        // Set content of cell in section tableview
        switch (indexPath.section) {
        case 0:
            
            if let cell = berandaTableView.dequeueReusableCell(withIdentifier: BerandaTVC.identifier, for: indexPath) as? BerandaTVC {
        
                if (self.fbData?.posts?.indices.contains(indexPath.row))! {
                    if let data = self.fbData?.posts?[indexPath.row] {
//                        if let idPost = data.objectId {
//                            getDetailPost(idObject: idPost) { (dataDetailPost) in
//                                cell.data = data
//                                cell.detailPost = dataDetailPost
//                            }
//                        }
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
