//
//  FontLiterals.swift
//  SOPKATHON-iOS
//
//  Created by 변상우 on 11/25/23.
//

import UIKit

struct FontName {
    static let Chab = "LOTTERIACHAB"
    static let PretendardBold = "Pretendard-Bold"
    static let PretendardSemiBold = "Pretendard-SemiBold"
    static let PretendardRegular = "Pretendard-Regular"
}

extension UIFont {
    @nonobjc class func chab(size: CGFloat) -> UIFont {
        return UIFont(name: FontName.Chab, size: size)!
    }
    
    @nonobjc class func pretendardBold(size: CGFloat) -> UIFont {
        return UIFont(name: FontName.PretendardBold, size: size)!
    }
    
    @nonobjc class func pretendardSemiBold(size: CGFloat) -> UIFont {
        return UIFont(name: FontName.PretendardSemiBold, size: size)!
    }
    
    @nonobjc class func pretendardRegular(size: CGFloat) -> UIFont {
        return UIFont(name: FontName.PretendardRegular, size: size)!
    }
}
