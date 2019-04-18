//
//  SaveOnBoarding.swift
//  MU
//
//  Created by NDS on 07/04/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit
import Firebase
import SwiftyJSON

class SaveOnBoarding {
    
    var judul: String?
    var description: String?
    var imageURL: String?
    
    private var image: UIImage!
    
    init(image: UIImage, judul: String, description: String) {
        self.image = image
        self.judul = judul
        self.description = description
    }
    
    init(snapshot: DataSnapshot) {
        let json = JSON(snapshot.value as Any)
        self.imageURL = json["imageURL"].stringValue
        self.judul = json["judul"].stringValue
        self.description = json["description"].stringValue
    }
    
    func save() {
        let newPostRef = Database.database().reference().child("onBoarding").childByAutoId()
        let newPostKey = newPostRef.key
        
        if let imageData = self.image.jpegData(compressionQuality: 0.6) {
            let imageStorageRef = Storage.storage().reference().child("images")
            let newImageRef = imageStorageRef.child(newPostKey!)
            let uploadMetadata = StorageMetadata()
            uploadMetadata.contentType = "image/jpeg"
            
            let uploadTask = newImageRef.putData(imageData, metadata: uploadMetadata) { (_, error) in
                if error != nil {
                    print("Error upload data! \(String(describing: error))")
                } else {
                    newImageRef.downloadURL(completion: { (url, err) in
                        if err != nil {
                            print("Error get URL ! \(String(describing: err))")
                        } else {
                            self.imageURL = url?.absoluteString
                            let newPostDictionary  = [
                                "judul": self.judul,
                                "description": self.description,
                                "imageURL": self.imageURL
                            ]
                            newPostRef.setValue(newPostDictionary)
                            print("\(String(describing: self.imageURL))")
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "notificationFinishUpload"), object: nil)
                        }
                    })
                }
            }
            uploadTask.observe(StorageTaskStatus.progress) { (snapshot) in
                guard let progress = snapshot.progress else { return }
                let valueDict: [String: Float] = ["value": Float(progress.fractionCompleted)]
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "notificationProgress"), object: nil, userInfo: valueDict)
            }
        }
    }
    
}
