//
//  Helper.swift
//  MU
//
//  Created by NDS on 14/04/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit

extension UIImage {
    /* Resize uiimage with params
        1. Dimension: width image you want
     Uiimage automaticly resize image with propotional size
    */
    func resizeImage(_ dimension: CGFloat, opaque: Bool, contentMode: UIView.ContentMode = .scaleAspectFit) -> UIImage {
        var width: CGFloat
        var height: CGFloat
        var newImage: UIImage
        
        let size = self.size
        let aspectRatio =  size.width/size.height
        
        switch contentMode {
        case .scaleAspectFit:
            width = dimension
            height = dimension / aspectRatio
        default:
            fatalError("UIIMage.resizeToFit(): FATAL: Unimplemented ContentMode")
        }
        
        if #available(iOS 10.0, *) {
            let renderFormat = UIGraphicsImageRendererFormat.default()
            renderFormat.opaque = opaque
            let renderer = UIGraphicsImageRenderer(size: CGSize(width: width, height: height), format: renderFormat)
            newImage = renderer.image { (_) in
                self.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
            }
        } else {
            UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: height), opaque, 0)
            self.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
            newImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
        }
        
        return newImage
    }
    
    /* Resize image with params
        1. Dimension:   width image you want,
        2. Width:       actual width from image,
        3. Height:      actual height from image
     Uiimage automaticly resize image with propotional size
    */
    func resizeImageWithHeight(_ dimension: CGFloat, width: CGFloat, height: CGFloat, opaque: Bool, contentMode: UIView.ContentMode = .scaleAspectFit) -> UIImage {
        var newWidth: CGFloat
        var newHeight: CGFloat
        var newImage: UIImage
        
        let aspectRatio =  width / height
        
        switch contentMode {
        case .scaleAspectFit:
            newWidth = dimension
            newHeight = dimension / aspectRatio
            print("New Height: \(newHeight)")
        default:
            fatalError("UIIMage.resizeToFit(): FATAL: Unimplemented ContentMode")
        }
        
        if #available(iOS 10.0, *) {
            let renderFormat = UIGraphicsImageRendererFormat.default()
            renderFormat.opaque = opaque
            let renderer = UIGraphicsImageRenderer(size: CGSize(width: newWidth, height: newHeight), format: renderFormat)
            newImage = renderer.image { (_) in
                self.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
            }
        } else {
            UIGraphicsBeginImageContextWithOptions(CGSize(width: newWidth, height: newHeight), opaque, 0)
            self.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
            newImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
        }
        
        return newImage
    }
    
}

extension UITableView {
    //Reload data with update layout for dynamic size UItableviewcell
    func reloadDataWithAutoSizingCellWorkAround() {
        self.reloadData()
        self.setNeedsLayout()
        self.layoutIfNeeded()
        self.reloadData()
    }
}
