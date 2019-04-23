//
//  BerandaVC.swift
//  MU
//
//  Created by NDS on 06/04/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit
import MobileCoreServices
import Firebase

class UploadVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    /*-------------UI Component-------------------*/
    @IBOutlet weak var uploadButton: UIBarButtonItem!
    @IBOutlet weak var berandaProgressView: UIProgressView!
    @IBOutlet weak var uploadImageView: UIImageView!
    @IBOutlet weak var judulTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    /*-------------Declaration Variable-----------*/
    var takenImage: UIImage!
    
    /*-------------Load Component-------------------*/
    override func viewDidLoad() {
        super.viewDidLoad()
         NotificationCenter.default.addObserver(self, selector: #selector(handleBar(_:)), name: NSNotification.Name(rawValue: "notificationProgress"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleFinishBar), name: NSNotification.Name(rawValue: "notificationFinishUpload"), object: nil)
        
        view.backgroundColor = .white
        firebaseLogin()
    }
    
    /*-------------UI Component Action-------------------*/
    @IBAction func uploadButtonPressed(_ sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            imagePicker.sourceType = .camera
            imagePicker.cameraCaptureMode = .photo
        } else {
            imagePicker.sourceType = .photoLibrary
        }
        imagePicker.mediaTypes = [kUTTypeImage as String, kUTTypeMovie as String]
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func buttonSavePressed(_ sender: Any) {
        
        if judulTextField.text != "" && descriptionTextField.text != "" && takenImage != nil {
            
            let newData = SaveOnBoarding(image: takenImage, judul: judulTextField.text!, description: descriptionTextField.text!)
            newData.save()
        }
    }
    
    /*-------------UI Component Method-------------------*/
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        guard let mediaType: String = info[UIImagePickerController.InfoKey.mediaType] as? String else {
            dismiss(animated: true, completion: nil)
            return
        }
        
        if mediaType == (kUTTypeImage as String) {
            if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage,
                let imageData = originalImage.jpegData(compressionQuality: 0.8) {
                self.takenImage = originalImage
                self.uploadImageView.image = self.takenImage
//                uploadImageToFireBase(data: imageData)
            }
        } else if mediaType == (kUTTypeVideo as String) {
            if let movieURL = info[UIImagePickerController.InfoKey.mediaURL] as? URL {
//                uploadMovieToFireBaseStorage(url: movieURL)
            }
        }
        dismiss(animated: true, completion: nil)
    }
  
    /*-------------Manual Method-------------------*/
    func uploadImageToFireBase(data: Data) {
        let storageRef = Storage.storage().reference(withPath: "demo/demoPic.jpg")
        let uploadMetadata = StorageMetadata()
        uploadMetadata.contentType = "image/jpeg"
        let uploadTask = storageRef.putData(data, metadata: uploadMetadata) { (metadata, error) in
            if (error != nil) {
                print("I recived an error ! \(error?.localizedDescription)")
            } else {
                storageRef.downloadURL(completion: { (url, err) in
                    if err != nil {
                        print("Error get URL \(err)")
                    } else {
                        print("\(url)")
                    }
                })
                print("Upload complete!, Here`s metadata! \(metadata)")
            }
        }
        //Update the progress bar
        uploadTask.observe(.progress) { [weak self] (snapshot) in
            guard let strongSelf = self else { return }
            guard let progress = snapshot.progress else { return }
            strongSelf.berandaProgressView.progress = Float(progress.fractionCompleted)
            print("\(progress.fractionCompleted)")
        }
    
    }
    
    func uploadMovieToFireBaseStorage(url: URL) {
        let storageRef = Storage.storage().reference(withPath: "demo/demoVideo.mov")
        let uploadMetadata = StorageMetadata()
        uploadMetadata.contentType = "video/quicktime"
        let uploadTask = storageRef.putFile(from: url, metadata: uploadMetadata) { (metadata, error) in
            if (error != nil) {
                print("Error upload video \(error)")
            } else {
                print("Upload video complete \(metadata)")
            }
        }
        
        uploadTask.observe(.progress) { (snapshot) in
            guard let progress = snapshot.progress else { return }
            self.berandaProgressView.progress = Float(progress.fractionCompleted)
        }
        
    }
    
    func firebaseLogin() {
        Auth.auth().signIn(withEmail: "nurdiansyah.fadli@yahoo.co.id", password: "fadlinurdiansyah") { (usr, err) in
    
            if err != nil {
                print("Error login \(err)")
            } else {
                print(usr)
            }
        }
    }
    
    @objc func handleBar(_ notification: NSNotification) {
    
        print(notification.userInfo)
        if let dict = notification.userInfo as NSDictionary? {
            if let value = dict["value"] as? Float {
                print("Valueee   \(value)")
                berandaProgressView.progress = value
            }
        }
    }
    
    @objc func handleFinishBar() {
        berandaProgressView.progress = 0
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "notificationProgress"), object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "notificationFinishUpload"), object: nil)
    }
    
}
