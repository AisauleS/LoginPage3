//
//  Extensions.swift
//  LoginPage3
//
//  Created by Aisaule Sibatova on 24.02.2023.
//

import UIKit

enum TextFieldImageSide {
    case left
    case right
}

extension UITextField {
    func setUpImage(imageName: String, on side: TextFieldImageSide) {
        let imageView = UIImageView(frame: CGRect(x: 32, y: 10, width: 20, height: 20))
        if let imageWithSystemName = UIImage(systemName: imageName) {
            imageView.image = imageWithSystemName
        } else {
            imageView.image = UIImage(named: imageName)
        }
        
        let imageContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 65, height: 40))
        imageContainerView.addSubview(imageView)
        
        switch side {
        case .left:
            leftView = imageContainerView
            leftViewMode = .always
            self.tintColor = .lightGray
        case .right:
            rightView = imageContainerView
            rightViewMode = .always
            self.tintColor = .lightGray
        }
    }
}

public extension UILabel {
    func drawLineOnBothSides(labelWidth: CGFloat, color: UIColor) {

        let fontAttributes = [NSAttributedString.Key.font: self.font]
        let size = self.text?.size(withAttributes: fontAttributes as [NSAttributedString.Key : Any])
        let widthOfString = size!.width
        let leftLine = UIView(frame: CGRect(x: widthOfString/2 - 150, y: 7, width: labelWidth/2, height: 0.5))
        leftLine.backgroundColor = color
        self.addSubview(leftLine)

        let rightLine = UIView(frame: CGRect(x: widthOfString/2 + 50, y: 7, width: labelWidth/2, height: 0.5))
        rightLine.backgroundColor = color
        self.addSubview(rightLine)
    }
}

