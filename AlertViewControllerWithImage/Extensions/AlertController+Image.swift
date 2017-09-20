//
//  File.swift
//  AlertViewControllerWithImage
//
//  Created by prasanth.podalakur on 9/20/17.
//  Copyright © 2017 KelltontechSolutions. All rights reserved.
//

import UIKit

extension UIAlertController {
    func addImage(image:UIImage){
        let maxSize = CGSize(width: 245, height: 300)
        let imgSize = image.size
        var ratio:CGFloat!
        if (imgSize.width > imgSize.height) {
            ratio = maxSize.width/imgSize.width
        }else{
            ratio = maxSize.height/imgSize.height
        }
        let scaledSize = CGSize(width: imgSize.width*ratio, height: imgSize.height*ratio)
        var reSizedImage = image.imageWithSize(scaledSize)
        if imgSize.height > imgSize.width {
            let left = (maxSize.width - reSizedImage.size.width)/2
            reSizedImage = reSizedImage.withAlignmentRectInsets(UIEdgeInsetsMake(0, -left, 0, 0))
        }
        let imgAction = UIAlertAction(title: "", style: .default, handler: nil)
        imgAction.isEnabled = false
        imgAction.setValue(reSizedImage.withRenderingMode(.alwaysOriginal), forKey: "image")
        self.addAction(imgAction)
    }
}
