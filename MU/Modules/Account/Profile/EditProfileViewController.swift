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
