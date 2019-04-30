//
//  CustomStepper.swift
//  CustomUI_01
//
//  Created by QuetzalAndOrca on 27/04/2019.
//  Copyright © 2019 Kim_Sung-jin. All rights reserved.
//

import UIKit

public class CustomStepper: UIView {
    
    // MARK: - Property
    
    // UI 부분
    var leftButton = UIButton(type: .system)
    var rightButton = UIButton(type: .system)
    var centerLabel = UILabel()
    
    // 초기값 설정
    public var maximumValue: Int = 100
    public var minimumValue: Int = -100
    public var stepValue: Int = 1
    
    // 커스터마이징을 위한 프로퍼티 설정
    var value: Int = 0 {
        didSet {
            self.centerLabel.text = String(value) //value 값이 바뀌면 자동으로 호출됨
        }
    }
    
    public var leftTitle: String = "⬇︎" {
        didSet {
            self.leftButton.setTitle(leftTitle, for: .normal)
        }
    }
    
    public var rightTitle: String = "⬆︎" {
        didSet {
            self.rightButton.setTitle(rightTitle, for: .normal)
        }
    }
    
    public var labelBackgorundColor = UIColor.cyan {
        didSet {
            self.centerLabel.backgroundColor = backgroundColor
        }
    }
    
    // MARK: - Initialize
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    private func setup() {
        let borderWidth: CGFloat = 0.5
        let borderColor = UIColor.blue.cgColor
        
        leftButton.tag = -1
        leftButton.setTitle(leftTitle, for: .normal)
        leftButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        leftButton.layer.borderWidth = borderWidth
        leftButton.layer.borderColor = borderColor
        
        rightButton.tag = 1
        rightButton.setTitle(rightTitle, for: .normal)
        rightButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        rightButton.layer.borderWidth = borderWidth
        rightButton.layer.borderColor = borderColor
        
        centerLabel.text = String(value)
        centerLabel.font = UIFont.systemFont(ofSize: 16)
        centerLabel.textAlignment = .center
        centerLabel.backgroundColor = labelBackgorundColor
        centerLabel.layer.borderWidth = borderWidth
        centerLabel.layer.borderColor = borderColor
        
        self.addSubview(leftButton)
        self.addSubview(rightButton)
        self.addSubview(centerLabel)
        
        leftButton.addTarget(self, action: #selector(valueChange(_:)), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(valueChange(_:)), for: .touchUpInside)
        
    }
    // MARK: - 뷰 레이아웃 설정
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        let buttonWidth = self.frame.height
        let labelWidth = self.frame.width - (buttonWidth * 2)
        
        self.leftButton.frame = CGRect(x: 0, y: 0, width: buttonWidth, height: buttonWidth)
        self.centerLabel.frame = CGRect(x: buttonWidth, y: 0, width: labelWidth, height: buttonWidth)
        self.rightButton.frame = CGRect(x: buttonWidth + labelWidth, y: 0, width: buttonWidth, height: buttonWidth)
    }
    
    // MARK: - 스테퍼 기능 구현
    @objc func valueChange(_ sender: UIButton) {
        
        let sum = self.value + sender.tag * stepValue
        
        if sum > self.maximumValue {
            return
        }
        
        if sum < self.minimumValue {
            return
        }
        
        self.value += sender.tag * self.stepValue
        
    }
    
    
}
