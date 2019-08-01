//
//  EditProfilePresenter.swift
//  MU
//
//  Created by NDS on 15/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

protocol EditProfileViewPresenter: class {
    init(view: EditProfileView)
    func loadListPlayerFavorite()
    func getListGender() -> [String]
    func getCountListGender() -> Int
    func getCountListPlayerFavorite() -> Int
    func getPlayerFavoriteItems() -> [PlayerFavorite]
    func getListPlayerFavorite()
    func getIsCoverPhoto() -> Bool
    func getIsProfilePhoto() -> Bool
    func getBtnImageTapped() -> String
    func getImageProfilePlaceHolder() -> UIImage?
    func getImageCoverPlaceHolder() -> UIImage?
    func getImageProfile() -> UIImage?
    func getImageCoverProfile() -> UIImage?
    func saveProfile()
}

protocol EditProfileView: class {
    func getListPlayerFavoriteSuccess()
    func getListPlayerFavoriteFailed(withErrorException error: ErrorExceptionAPI)
}

class EditProfilePresenter: EditProfileViewPresenter {
    
    static func config(withEditProfileViewController viewController: EditProfileViewController) {
        let presenter = EditProfilePresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: EditProfileView
    let listGender = ["Pria", "Wanita"]
    let team = "Man United"
    var listPlayerFavoriteItems: [PlayerFavorite] = []
    var isCoverPhoto = false
    var isProfilePhoto = false
    var btnImageTapped = ""
    let coverPhotoPlaceHolder = ""
    let imageProfilePlaceHolder = UIImage(named: "img-profile-placeholder")
    let imageCoverPlaceHolder = UIImage(named: "img-cover-placeholder")
    var imageProfile: UIImage?
    var imageCoverProfile: UIImage?
    var userId: Int = 2
    var name: String?
    var gender: String?
    var birthday: String?
    var favoritePlayer: String?
    
    required init(view: EditProfileView) {
        self.view = view
    }
    
    func loadListPlayerFavorite() {
        getListPlayerFavorite()
    }
    
    func getListPlayerFavorite() {
        let playerFavoriteRequest = PlayerFavoriteRequest()
        playerFavoriteRequest.team = team
        
        MUAPI.instance.request(ApiPlayerFavorite.getListPlayerFavorite(request: playerFavoriteRequest), success: { (json) in
            
            let listPlayerFavoriteDAO = ListPlayerFavoriteDAO(json: json)
            
            if let listPlayerFavorite = listPlayerFavoriteDAO.listPlayerFavorite {
                
                self.listPlayerFavoriteItems.append(contentsOf: listPlayerFavorite.playerFavorite)
                self.view.getListPlayerFavoriteSuccess()
                
            } else {
                
                self.view.getListPlayerFavoriteFailed(withErrorException: InternalServerErrorException())
            }
            
        }, exception: { (error) in
            self.view.getListPlayerFavoriteFailed(withErrorException: error)
            }
        )
    }
    
    func viewProfile() {
        let viewProfileRequest = ViewProfileRequest()
        viewProfileRequest.type = "muid"
        viewProfileRequest.userId = userId
        
        MUAPI.instance.request(ApiSaveProfile.viewProfile(request: viewProfileRequest), success: { (json) in
            print(json)
        }) { (error) in
            print(error)
        }
    }
    
    func saveProfile() {

        var parameters: [String: AnyObject] = [:]
        parameters["user_id"] = userId as AnyObject
        parameters["name"] = name as AnyObject
        parameters["gender"] = gender as AnyObject
        parameters["birthday"] = birthday?.sqlDateFormat() as AnyObject
        parameters["favorite_player"] = favoritePlayer as AnyObject

        if let imageProfilePhoto = imageProfile?.jpegData(compressionQuality: 0.2),
            let imageCoverPhoto = imageCoverProfile?.jpegData(compressionQuality: 0.2) {

            MUAPI.instance.uploadImage(ApiSaveProfile.saveProfile, multipartFormData: { (multipartFormData) in

                for (key, value) in parameters {
                    multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
                }
                
                multipartFormData.append(imageProfilePhoto, withName: "profilephoto", fileName: "profile.jpg", mimeType: "image/jpg")
                multipartFormData.append(imageCoverPhoto, withName: "coverphoto", fileName: "cover.jpg", mimeType: "image/jpg")

            }, success: { (json) in
                print(json)
                print("Finish Upload Image")
            }) { (error) in
                print(error)
            }
        }
    }
    
    func getCountListGender() -> Int {
        return listGender.count
    }
    
    func getListGender() -> [String] {
        return listGender
    }
    
    func getCountListPlayerFavorite() -> Int {
        return listPlayerFavoriteItems.count
    }
    
    func getPlayerFavoriteItems() -> [PlayerFavorite] {
        return listPlayerFavoriteItems
    }
    
    func getIsCoverPhoto() -> Bool {
        return isCoverPhoto
    }
    
    func getIsProfilePhoto() -> Bool {
        return isProfilePhoto
    }
    
    func getBtnImageTapped() -> String {
        return btnImageTapped
    }
    
    func getImageProfilePlaceHolder() -> UIImage? {
        return imageProfilePlaceHolder
    }
    
    func getImageCoverPlaceHolder() -> UIImage? {
        return imageCoverPlaceHolder
    }
    
    func getImageProfile() -> UIImage? {
        return imageProfile
    }
    
    func getImageCoverProfile() -> UIImage? {
        return imageCoverProfile
    }
    
}
