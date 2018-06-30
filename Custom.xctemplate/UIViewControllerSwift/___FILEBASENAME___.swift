//___FILEHEADER___

import UIKit

class ___FILEBASENAMEASIDENTIFIER___: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        initNavBarTitle("<#Title#>",
                        rightButton: .title("<#右上角按钮#>",#selector(pushAction(sender:))))
        setupUI()
    }
    
//    lazy var <#TextField#>: LimitTextFieldView = {
//        let view = LimitTextFieldView()
//        view.hiddenLimitLabel = true
//        view.limitMax = 0
//        view.placeholder = ""
//        view.layer.masksToBounds = true
//        view.layer.cornerRadius = 3
//        view.layer.borderColor = UIColor(hex: 0xE5E5E5).cgColor
//        view.layer.borderWidth = 1
//        return view
//    }()
    
//    lazy var <#TextView#>: LimitTextView = {
//        let view = LimitTextView()
//        view.limitMax = 0
//        view.placeholder = ""
//        view.font = UIFont.defaultFont(size: 14)
//        view.backgroundColor = UIColor.clear
//        view.layer.masksToBounds = true
//        view.layer.cornerRadius = 3
//        view.layer.borderColor = UIColor(hex: 0xE5E5E5).cgColor
//        view.layer.borderWidth = 1
//        return view
//    }()

//    lazy var <#Label#>: UILabel = {
//        let view = UILabel("", fontSize: 18, color: UIColor.white, textAlignment: .center, isBold: false)
//        return view
//    }()
    
//    lazy var <#Button#>: UIButton = {
//        let view = UIButton(text: "", textColor: UIColor.white, fontSize: 15)
//        view.setImage(R.image.设置(), for: .normal)
//        return view
//    }()
}

// MARK: - UI init
extension ___FILEBASENAMEASIDENTIFIER___ {
    
    func setupUI() {
        
        view.sv()
        
        view.layout(
            
        )
    }
}
