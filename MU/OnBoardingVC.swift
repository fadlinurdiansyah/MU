//
//  OnBoardingVC.swift
//  MU
//
//  Created by NDS on 06/04/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit
import Firebase

class OnBoardingVC: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    /*-------------UI Component-------------------*/
    @IBOutlet weak var onBoardingPageControl: UIPageControl!
    @IBOutlet weak var pageCollectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    
    /*-------------Declaration Variable-----------*/
    
    var goHomeVC: Bool = false
    var dataBoarding = [SaveOnBoarding]()
    
    /*-------------Load Component-------------------*/
    
    override func viewWillAppear(_ animated: Bool) {
        fetchBoardingData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        
    }
    
    /*-------------UI Component Action-------------------*/
    
    @IBAction func nextPress(_ sender: UIButton) {
            nextPage()
    }
    
    /*-------------UI Component Method-------------------*/
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataBoarding.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = pageCollectionView.dequeueReusableCell(withReuseIdentifier: "pageCellId", for: indexPath) as? PageCell {
            
            cell.dataBoarding = dataBoarding[indexPath.row]
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        onBoardingPageControl.currentPage = pageNumber
        
        if pageNumber == 2 {
            nextButton.setTitle("Mulai", for: UIControl.State.normal)
        } else {
            nextButton.setTitle("Lanjut", for: UIControl.State.normal)
        }
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
      if goHomeVC == true {
            return true
        } else {
            return false
        }
    }
    
    /*-------------Manual Method-------------------*/
    
    func setupViews() {

        pageCollectionView.isPagingEnabled = true
        view.backgroundColor = UIColor(red: 43/255, green: 43/255, blue: 43/255, alpha: 1)
        UIApplication.shared.statusBarStyle = .lightContent

    }
    
    func nextPage() {
        let pageNumber = onBoardingPageControl.currentPage
        
        if pageNumber == 1 {
            nextButton.setTitle("Mulai", for: UIControl.State.normal)
        }

        if pageNumber == 2 {
            goHomeVC = true
        } else {
            let indexPath = IndexPath(item: pageNumber + 1, section: 0)
            pageCollectionView.scrollToItem(at: indexPath, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
            onBoardingPageControl.currentPage += 1
        }
    }
    
    func fetchBoardingData() {
        Database.database().reference().child("onBoarding").observe(DataEventType.childAdded) { (snapshot) in
            DispatchQueue.main.async {
                let data = SaveOnBoarding(snapshot: snapshot)
                self.dataBoarding.append(data)
                self.pageCollectionView.reloadData()
            }
        }
    }
    
}
