//
//  UILabel.swift
//  Dpath
//
//  Created by 송영모 on 2022/05/22.
//

import Foundation
import UIKit

extension UILabel {
    func setLineSpacing(lineSpacing: CGFloat = 0.0, lineHeightMultiple: CGFloat = 0.0) {

           guard let labelText = self.text else { return }

           let paragraphStyle = NSMutableParagraphStyle()
           paragraphStyle.lineSpacing = lineSpacing
           paragraphStyle.lineHeightMultiple = lineHeightMultiple

           let attributedString:NSMutableAttributedString
           if let labelattributedText = self.attributedText {
               attributedString = NSMutableAttributedString(attributedString: labelattributedText)
           } else {
               attributedString = NSMutableAttributedString(string: labelText)
           }

           // (Swift 4.2 and above) Line spacing attribute
           attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))


//           // (Swift 4.1 and 4.0) Line spacing attribute
//           attributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))

           self.attributedText = attributedString
       }
}
