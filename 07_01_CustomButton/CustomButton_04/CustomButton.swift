//
//  CustomButton.swift
//  CustomButton_04
//
//  Created by QuetzalAndOrca on 20/04/2019.
//  Copyright © 2019 Kim_Sung-jin. All rights reserved.
//

import UIKit

enum CustomButtonType {
    case rect
    case circle
}

class CustomButton: UIButton {
    
    // MARK: - 초기화
    required init?(coder aDecoder: NSCoder) {
        // 스토리보드 상에서 만들어지는 버튼 초기화
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.green
        self.layer.borderWidth = 2
        self.layer.backgroundColor = UIColor.black.cgColor
        self.setTitle("버튼", for: .normal)
    }
    
    override init(frame: CGRect) {
        // 코드 상에서 만들어지는 버튼 초기화
        super.init(frame: frame)
        setUpButton()
    }
    
    init() {
        super.init(frame: CGRect.zero)
    }
    
    convenience init(type: CustomButtonType){
        self.init()
        switch type {
        case .rect:
            self.backgroundColor = UIColor.black
            self.layer.borderColor = UIColor.black.cgColor
            self.layer.borderWidth = 2
            self.layer.cornerRadius = 0
            self.setTitleColor(UIColor.black, for: .normal)
            self.setTitle("Rect Button", for: .normal)
            self.titleLabel?.adjustsFontSizeToFitWidth = true
            
        case .circle:
            self.backgroundColor = UIColor.red
            self.layer.borderColor = UIColor.blue.cgColor
            self.layer.borderWidth = 2
            self.layer.cornerRadius = 15
            self.setTitle("Circle Button", for: .normal)
            self.setTitleColor(UIColor.black, for: .normal)
            self.titleLabel?.adjustsFontSizeToFitWidth = true
        }
        
    }
    
    // MARK: - Custom
    func setUpButton() {
        layer.cornerRadius = 25
        layer.borderColor = UIColor.darkGray.cgColor
        backgroundColor = UIColor.blue
        tintColor = UIColor.yellow
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        self.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    func setShadow() {
        layer.shadowColor = UIColor.red.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.5
        clipsToBounds = true
        layer.masksToBounds = false
    }

    func shake() {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 8, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        let toPoint = CGPoint(x: center.x + 8, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        layer.add(shake, forKey: "position")
    }
    
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.6
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 2
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        layer.add(pulse, forKey: nil)
    }
    
    func flash() {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.5
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 3
        layer.add(flash, forKey: nil)
    }
}
