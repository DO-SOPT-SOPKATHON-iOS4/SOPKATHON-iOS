import UIKit

enum ImageLiterals {
    
    //MARK: Logo & Splash
    
    static var splash_character: UIImage { .load(name: "splash_character") }
    static var splash_graphic_background: UIImage { .load(name: "splash_graphic_background") }
    

    //MARK: Normal Icon
    
    static var ic_left_arrow: UIImage { .load(name: "Q1_ic_left_arrow") }
    
    
    //MARK: History
    
    static var card_level1: UIImage { .load(name: "result1") }
    static var card_level2: UIImage { .load(name: "result2") }
    static var card_level3: UIImage { .load(name: "result3") }
    static var card_level4: UIImage { .load(name: "result4") }
    static var card_level5: UIImage { .load(name: "result5") }

    //MARK: Card
    
    static var history_level1: UIImage { .load(name: "level1") }
    static var history_level2: UIImage { .load(name: "level2") }
    static var history_level3: UIImage { .load(name: "level3") }
    static var history_level4: UIImage { .load(name: "level4") }
    static var history_level5: UIImage { .load(name: "level5") }
    
    //MARK: Question
    
    static var questioin_btn_O: UIImage { .load(name: "QA_OX_btn_O") }
    static var questioin_btn_X: UIImage { .load(name: "QA_OX_btn_X") }
    
    //MARK: Main
    static var go_to_question: UIImage { .load(name: "go_to_question") }
    static var go_to_history: UIImage { .load(name: "go_to_history") }

    
    //MARK: Onboarding
    static var onboarding_character: UIImage { .load(name: "onboarding_character") }
 

}

extension UIImage {
    static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = name
        return image
    }
    
    static func load(systemName: String) -> UIImage {
        guard let image = UIImage(systemName: systemName, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = systemName
        return image
    }
}
