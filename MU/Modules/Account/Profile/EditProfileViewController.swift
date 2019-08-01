//
//  EditProfileViewController.swift
//  MU
//
//  Created by NDS on 15/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit

extension SegueConstants {
    enum EditProfile {
        // TODO: Add segue ids
    }
}

class EditProfileViewController: BaseViewController {
    
    // MARK: Properties
    @IBOutlet weak var textFieldDateOfBirth: UITextField!
    @IBOutlet weak var textFieldGender: UITextField!
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldPlayerFavorite: UITextField!
    @IBOutlet weak var imageProfilePhoto: UIImageView!
    @IBOutlet weak var imageCoverPhoto: UIImageView!
    @IBOutlet weak var btnEditCoverPhoto: UIButton!
    @IBOutlet weak var btnEditProfilePhoto: UIButton!
    
    @IBOutlet weak var btnSaveProfile: UIButton!
    private var datePicker: UIDatePicker?
    private var genderPicker: UIPickerView?
    private var playerFavoritePicker: UIPickerView?
    
    var listGender: [String] = []
    
    var presenter: EditProfilePresenter!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        EditProfilePresenter.config(withEditProfileViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDateOfBirth()
        setupTapGestureOnSuperView()
        setupGenderPicker()
        setupPlayerFavoritePicker()
    }
    
    func setupDateOfBirth() {
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(self.dateChanged(datePicker:)), for: .valueChanged)
        
        textFieldDateOfBirth.inputView = datePicker
    
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY"
        textFieldDateOfBirth.text = dateFormatter.string(from: datePicker.date)
    }
    
    func setupTapGestureOnSuperView() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func viewTapped(gestureRecognizer: UIGestureRecognizer) {
        view.endEditing(true)
    }
    
    // IB Action
    @IBAction func btnEditCoverPhoto(_ sender: Any) {
        presenter.btnImageTapped = "cover"
        showActionSheet()
        
    }
    
    @IBAction func btnEditProfilePhoto(_ sender: Any) {
        presenter.btnImageTapped = "profile"
        showActionSheet()
        
    }
    
    @IBAction func btnSaveProfileTapped(_ sender: Any) {
        presenter.name = textFieldName.text
        presenter.gender = textFieldGender.text
        presenter.birthday = textFieldDateOfBirth.text
        presenter.favoritePlayer = textFieldPlayerFavorite.text
        presenter.saveProfile()
//        presenter.viewProfile()
    }
    
    func setupGenderPicker() {
        listGender = presenter.getListGender()
        genderPicker = UIPickerView()
        textFieldGender.inputView = genderPicker
        genderPicker?.dataSource = self
        genderPicker?.delegate = self
    }
    
    func setupPlayerFavoritePicker() {
        presenter.loadListPlayerFavorite()
        playerFavoritePicker = UIPickerView()
        textFieldPlayerFavorite.inputView = playerFavoritePicker
        playerFavoritePicker?.dataSource = self
        playerFavoritePicker?.delegate = self
    }
    
    func showActionSheet() {
        
        let btnImageTapped = presenter.getBtnImageTapped()
        let isCoverPhoto = presenter.getIsCoverPhoto()
        let isProfilePhoto = presenter.getIsProfilePhoto()
        
        let sheet = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        
        let camera = UIAlertAction(title: "Kamera", style: UIAlertAction.Style.default) { (_) in
            
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
                self.showImagePicker(with: UIImagePickerController.SourceType.camera)
            }
            
        }
        
        let photoLibrary = UIAlertAction(title: "Galeri Foto", style: UIAlertAction.Style.default) { (_) in
            
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
                self.showImagePicker(with: UIImagePickerController.SourceType.photoLibrary)
            }
           
        }
        
        let cancel = UIAlertAction(title: "Batal", style: UIAlertAction.Style.cancel, handler: nil)
        
        let deletePhoto = UIAlertAction(title: "Hapus", style: UIAlertAction.Style.destructive) { (_) in
            
            if btnImageTapped == "cover" {
                let imageCoverPlaceHoder = self.presenter.getImageCoverPlaceHolder()
                self.imageCoverPhoto.image = imageCoverPlaceHoder
                self.presenter.isCoverPhoto = false
            } else if btnImageTapped == "profile" {
                let imageProfilePlaceHolder = self.presenter.getImageProfilePlaceHolder()
                self.imageProfilePhoto.image = imageProfilePlaceHolder
                self.presenter.isProfilePhoto = false
            }
        }
        
        if btnImageTapped == "cover" && isCoverPhoto == false {
            deletePhoto.isEnabled = false
        } else if btnImageTapped == "profile" && isProfilePhoto == false {
            deletePhoto.isEnabled = false
        }
        
        sheet.addAction(camera)
        sheet.addAction(photoLibrary)
        sheet.addAction(cancel)
        sheet.addAction(deletePhoto)
        
        self.present(sheet, animated: true, completion: nil)
    
    }
}

extension EditProfileViewController: EditProfileView {
    func getListPlayerFavoriteSuccess() {
        print("success")
    }
    
    func getListPlayerFavoriteFailed(withErrorException error: ErrorExceptionAPI) {
        print("error")
    }
}

extension EditProfileViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        var numComponent: Int = 0
        if pickerView == genderPicker {
            numComponent = presenter.getCountListGender()
        } else if pickerView == playerFavoritePicker {
            numComponent = presenter.getCountListPlayerFavorite()
        }
        
        return numComponent
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == genderPicker {
            return listGender[row]
        } else if pickerView == playerFavoritePicker {
            let listPlayerFavorite = presenter.getPlayerFavoriteItems()
            if listPlayerFavorite.indices.contains(row) {
                return listPlayerFavorite[row].strPlayer
            }
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == genderPicker {
            textFieldGender.text = listGender[row]
        } else if pickerView == playerFavoritePicker {
            let listPlayerFavorite = presenter.getPlayerFavoriteItems()
            textFieldPlayerFavorite.text = listPlayerFavorite[row].strPlayer
        }
    }
}

extension EditProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func showImagePicker(with source: UIImagePickerController.SourceType) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = source
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        let btnImageTapped = presenter.getBtnImageTapped()
        
        if btnImageTapped == "cover" {
            presenter.imageCoverProfile = image
            imageCoverPhoto.image = presenter.imageCoverProfile
        } else if btnImageTapped == "profile" {
            presenter.imageProfile = image
            imageProfilePhoto.image = presenter.imageProfile
        }
        
        self.dismiss(animated: true) {
            if btnImageTapped == "cover" {
                self.presenter.isCoverPhoto = true
            } else if btnImageTapped == "profile" {
                self.presenter.isProfilePhoto = true
            }
        }
    }
}
