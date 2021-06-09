//
//  ViewController.swift
//  textFieldFloating_tutorial
//
//  Created by wooyeong kam on 2021/06/09.
//

import UIKit
import TweeTextField

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.tweePlaceholder = "이메일을 입력해주세요"
        emailTextField.placeholderColor = .gray
        emailTextField.placeholderDuration = 0.1
        emailTextField.minimizationAnimationType = .smoothly
        emailTextField.infoAnimationDuration = 0.2
        
    }

    @IBOutlet weak var passwordTextField: TweeAttributedTextField!
    
    // 비밀번호 글자 입력이 시작될 떼
    @IBAction func passwordBeginEditing(_ sender: TweeAttributedTextField) {
    }
    @IBOutlet weak var emailTextField: TweeAttributedTextField!
    
    // 글자를 입력중일 떼
    @IBAction func passwordWhileEditing(_ sender: TweeAttributedTextField) {
        if let userInput = sender.text {
            if userInput.count == 0 {
                sender.hideInfo(animated: true)
            }else if userInput.count < 3 {
                sender.infoTextColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
                sender.activeLineColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
                sender.showInfo("3글자 이상 입력하세요", animated: true)
            }else{
                sender.infoTextColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
                sender.activeLineColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
                sender.showInfo("성공입니다.", animated: true)
            }
        }
    }
    
    
    @IBAction func passwordEndEditing(_ sender: TweeAttributedTextField) {
    }
    
    @IBAction func emailWhileEditing(_ sender: TweeAttributedTextField) {
        if let userInput = sender.text {
            if userInput.count == 0 {
                sender.infoTextColor = .gray
                sender.showInfo("이메일을 입력해주세요.", animated: true)
            }
            
            if userInput.isValidEmail == false {
                sender.infoTextColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
                sender.activeLineColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
                sender.showInfo("이메일 형식이 아닙니다.", animated: true)
            }else{
                sender.infoTextColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
                sender.activeLineColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
                sender.showInfo("성공입니다.", animated: true)
            }
        }
    }
    
    
}

extension String {
    var isValidEmail : Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: self)
    }
}
