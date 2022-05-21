//
//  Extesion.swift
//  CMC_Hackathon_App
//
//  Created by do_yun on 2022/01/29.
//

import Foundation
import UIKit

extension UIColor {
    // MARK: hex code를 이용하여 정의
    // ex. UIColor(hex: 0xF5663F)
    convenience init(hex: UInt, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    
    static func random () -> UIColor {
        return UIColor(
          red: CGFloat.random(in: 0...1),
          green: CGFloat.random(in: 0...1),
          blue: CGFloat.random(in: 0...1),
          alpha: 1.0)
      }
    
    // MARK: 메인 테마 색 또는 자주 쓰는 색을 정의
    // ex. label.textColor = .mainOrange
    class var mainBackgroundColor: UIColor { UIColor(hex: 0xEEEEEE) }
    class var mainViewColor: UIColor {UIColor(hex: 0xFAF9F9)}
    class var mainLikeLabelColor: UIColor {UIColor(hex: 0x858585)}
    class var mainLikeImageColor: UIColor {UIColor(hex: 0xD7D7D7)}
    class var moreButtonColor: UIColor { UIColor(hex: 0x707070) }
    class var yearLabelColor: UIColor {UIColor(hex: 0x8C8C8C)}
    class var lineColor: UIColor {UIColor(hex: 0xC4C4C4)}
    class var mainColor: UIColor {UIColor(hex: 0x404040)}
    class var toggleColor: UIColor {UIColor(hex: 0x636363)}
    class var whiteRedColor: UIColor {UIColor(hex: 0xFF7C74)}
    
    static let white = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    static let red = UIColor(red: 255/255, green: 69/255, blue: 58/255, alpha: 1)
    static let orange = UIColor(red: 255/255, green: 159/255, blue: 10/255, alpha: 1)
    static let yellow = UIColor(red: 255/255, green: 214/255, blue: 10/255, alpha: 1)
    static let green = UIColor(red: 48/255, green: 209/255, blue: 88/255, alpha: 1)
    static let mint = UIColor(red: 102/255, green: 212/255, blue: 207/255, alpha: 1)
    static let teal = UIColor(red: 64/255, green: 200/255, blue: 224/255, alpha: 1)
    static let cyan = UIColor(red: 100/255, green: 210/255, blue: 255/255, alpha: 1)
    static let blue = UIColor(red: 10/255, green: 132/255, blue: 255/255, alpha: 1)
    static let indigo = UIColor(red: 94/255, green: 92/255, blue: 230/255, alpha: 1)
    static let purple = UIColor(red: 191/255, green: 90/255, blue: 242/255, alpha: 1)
    static let pink = UIColor(red: 255/255, green: 55/255, blue: 95/255, alpha: 1)
    static let brown = UIColor(red: 172/255, green: 142/255, blue: 104/255, alpha: 1)
    static let black = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
    static let darkGray = UIColor(white: 0.33, alpha: 1)
    static let systemGray = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1)
    static let systemGray2 = UIColor(red: 174/255, green: 174/255, blue: 178/255, alpha: 1)
    static let systemGray3 = UIColor(red: 199/255, green: 199/255, blue: 204/255, alpha: 1)
    static let systemGray4 = UIColor(red: 209/255, green: 209/255, blue: 214/255, alpha: 1)
    static let systemGray5 = UIColor(red: 229/255, green: 229/255, blue: 234/255, alpha: 1)
    static let systemGray6 = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1)
}
