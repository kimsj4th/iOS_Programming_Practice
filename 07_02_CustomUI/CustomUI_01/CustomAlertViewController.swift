//
//  CustomAlertViewController.swift
//  CustomUI_01
//
//  Created by QuetzalAndOrca on 27/04/2019.
//  Copyright © 2019 Kim_Sung-jin. All rights reserved.
//

import UIKit

class CustomAlertViewController: UIViewController {

    let valueLabel = UILabel()
    let slider = UISlider()
    var sliderValue: Float {
        return self.slider.value
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. 이미지 객체
        guard let icon = UIImage(named: "rating5") else { return }
        let iconView = UIImageView(image: icon)
        iconView.frame = CGRect(x: 0, y: 0, width: icon.size.width, height: icon.size.height)
        iconView.center.x = self.view.frame.width / 2 - (icon.size.width / 2 - 15)
        
        // 2. 텍스트 객체
        let label = UILabel()
        label.frame = CGRect(x: 40, y: icon.size.height + 10, width: self.view.frame.width, height: 40)
        label.text = "새로운 평점을 입력해 주세요."
        
        // 3. 슬라이더 객체
        self.slider.minimumValue = 0
        self.slider.maximumValue = 100
        self.slider.frame = CGRect(x: 50, y: icon.size.height + 40, width: icon.size.width, height: 40)
        self.slider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        self.slider.value = 50
        
        // 4. 슬라이더 선택값 텍스트 객체
        valueLabel.frame = CGRect(x: 40, y: icon.size.height + 70, width: 100, height: 40)
        valueLabel.textAlignment = .center
        
        
        self.view.addSubview(iconView)
        self.view.addSubview(label)
        self.view.addSubview(slider)
        self.view.addSubview(valueLabel)
        
     
    }
    @objc func sliderChanged(){
        self.valueLabel.text = String(Int(sliderValue)) + "점 입니다."
        
    }
}
