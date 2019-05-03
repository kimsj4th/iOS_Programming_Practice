//
//  ViewController.swift
//  CustomButton_04
//
//  Created by QuetzalAndOrca on 20/04/2019.
//  Copyright © 2019 Kim_Sung-jin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Property
    
    var firstButton = CustomButton(type: UIButton.ButtonType.system)
    var secondButton = CustomButton(type: UIButton.ButtonType.system)
    var thirdButton = CustomButton(type: UIButton.ButtonType.system)
    
    var forthButton = CustomButton(type: CustomButtonType.circle)
    var fifthButton = CustomButton(type: CustomButtonType.rect)
    
    var randomColorButton = CustomButton(type: .system)
    var alphaValueButton = CustomButton(type: .system)
    
    var shakingButton = CustomButton(type: .system)
    var pulseButton = CustomButton(type: .system)
    var flashButton = CustomButton(type: .system)
    
    var buttonArray = [CustomButton]()
    
    // MARK: - 버튼 액션 정의
    @objc func alphaValueDecrease(_ sender: UIButton) {
        for button in buttonArray {
            button.alpha = button.alpha - 0.1
        }
    }
    
    @objc func alphaValueInit (_ sender: UIButton) {
        for button in buttonArray {
            button.alpha = 1
        }
    }
    
    @objc func setRandomColor() {
        for button in 0...5 {
            buttonArray[button].setTitleColor(UIColor.white, for: UIControl.State.normal)
            buttonArray[button].backgroundColor = generateRandomColor()
        }
    }
    
    @objc func shaking() {
        shakingButton.shake()
    }
    
    @objc func pulse() {
        pulseButton.pulsate()
    }
    
    @objc func flash() {
        flashButton.flash()
    }
    
    func setCustomActionButton() {
        for button in [shakingButton,pulseButton,flashButton] {
            button.setUpButton()
            button.setShadow()
            button.titleLabel?.font = UIFont(name: "GillSans-UltraBold",
                                             size: UIFont.systemFontSize + 10)
        }
    }
    
    // MARK: - 뷰 설정
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitView()
        setButtonAction()
    }
    
    func setInitView() {
        addButton(firstButton, at: CGRect(x: view.center.x - 100, y: 50, width: 200, height: 40), title: "First")
        addButton(secondButton, at: CGRect(x: view.center.x - 100, y: 120, width: 200, height: 40), title: "Second")
        addButton(thirdButton, at: CGRect(x: view.center.x - 100, y: 190, width: 200, height: 40), title: "Third")
        
        addButton(forthButton, at: CGRect(x: view.center.x - 100, y: 260, width: 200, height: 40), title: "Forth")
        addButton(fifthButton, at: CGRect(x: view.center.x - 100, y: 330, width: 200, height: 40), title: "Fifth")
        
        addButton(randomColorButton, at: CGRect(x: 30, y: 400, width: 150, height: 40), title: "RandomColor")
        addButton(alphaValueButton, at: CGRect(x: 230 , y: 400, width: 150, height: 40), title: "AlphaValue")
        
        addButton(shakingButton, at: CGRect(x: view.center.x - 125, y: 460, width: 250, height: 60), title: "shaking")
        addButton(pulseButton, at: CGRect(x: view.center.x - 125, y: 550, width: 250, height: 60), title: "pulse")
        addButton(flashButton, at: CGRect(x: view.center.x - 125, y: 630, width: 250, height: 60), title: "flash")
        setCustomActionButton()
    }
    
    func addButton(_ button: CustomButton, at location: CGRect, title: String) {
        button.frame = location
        button.backgroundColor = UIColor.green
        button.setTitle(title, for: UIControl.State.normal)
        button.tintColor = UIColor.purple
        button.backgroundColor = UIColor(red: 0.94, green: 0.96, blue: 1.0, alpha: 1.0)
        view.addSubview(button)
        buttonArray.append(button)
    }
    
    func setButtonAction() {
        alphaValueButton.addTarget(self, action: #selector(alphaValueDecrease(_:)), for: UIControl.Event.touchUpInside)
        alphaValueButton.addTarget(self, action: #selector(alphaValueInit(_:)), for: UIControl.Event.touchDragOutside)
        randomColorButton.addTarget(self, action: #selector(setRandomColor), for: UIControl.Event.touchUpInside)
        shakingButton.addTarget(self, action: #selector(shaking), for: .touchUpInside)
        pulseButton.addTarget(self, action: #selector(pulse), for: UIControl.Event.touchUpInside)
        flashButton.addTarget(self, action: #selector(flash), for: .touchUpInside)
    }
    
    // MARK: - 커스텀
    func generateRandomColor() -> UIColor {
        let hue : CGFloat = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
        let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from white
        let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from black
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
    
    
}

