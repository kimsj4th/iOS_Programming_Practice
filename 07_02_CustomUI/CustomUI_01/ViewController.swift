//
//  ViewController.swift
//  CustomUI_01
//
//  Created by QuetzalAndOrca on 27/04/2019.
//  Copyright © 2019 Kim_Sung-jin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    let stepper = CustomStepper()

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()

        // Stepper
        stepper.frame = CGRect(x: 50, y: 100, width: 200, height: 50)
        stepper.center.x = self.view.frame.width / 2
        self.view.addSubview(stepper)
        
        // ImageView Alert Button
        let imageAlertButton = UIButton(type: .system)
        imageAlertButton.frame = CGRect(x: 0, y: 400, width: 100, height: 50)
        imageAlertButton.center.x = self.view.frame.width / 2
        imageAlertButton.setTitle("Image Alert", for: .normal)
        imageAlertButton.addTarget(self, action: #selector(imageAlert(_:)), for: .touchUpInside)
        self.view.addSubview(imageAlertButton)
        
        
    }
    
    @objc func imageAlert(_ sender: UIButton) {
        
        let alert = UIAlertController(title: nil, message: "이번 영화의 평점은 다음과 같습니다.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        let contentVC = CustomAlertViewController()
        contentVC.preferredContentSize.height = 150
        alert.addAction(okAction)
        alert.setValue(contentVC, forKey: "contentViewController")
        self.present(alert, animated: true, completion: nil)
    }

    
    func setNavigationBar() {
        // 텍스트필드 설정
        let textField = UITextField()
        textField.frame = CGRect(x: 0, y: 0, width: 300, height: 35)
        textField.backgroundColor = UIColor.white
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.keyboardType = .URL
        textField.keyboardAppearance = .default
        textField.layer.borderWidth = 0.3
        textField.layer.borderColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0).cgColor
        self.navigationItem.titleView = textField
        textField.delegate = self

        // Left Bar Button Item 설정
        let backImage = UIImage(named: "arrow-back")
        let leftItem = UIBarButtonItem(image: backImage, style: UIBarButtonItem.Style.plain, target: self, action: nil)
        self.navigationItem.leftBarButtonItem = leftItem
        
        // Rigt Bar Button Item 설정
        // 1.컨텐츠 뷰 설정
        let rightCustomView = UIView()
        rightCustomView.frame = CGRect(x: 0, y: 0, width: 70, height: 37)
        let rightItem = UIBarButtonItem(customView: rightCustomView)
        self.navigationItem.rightBarButtonItem = rightItem
        
        // 2. Label
        let countLabel = UILabel()
        countLabel.frame = CGRect(x: 0, y: 0, width: 37, height: 37)
        countLabel.font = UIFont.systemFont(ofSize: 15)
        countLabel.textColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0)
        countLabel.text = "12"
        countLabel.textAlignment = .center
        countLabel.layer.cornerRadius = 3
        countLabel.layer.borderWidth = 2
        countLabel.layer.borderColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0).cgColor
        rightCustomView.addSubview(countLabel)
        
        // 3. 버튼
        let moreButton = UIButton(type: .system)
        moreButton.frame = CGRect(x: 50, y: 10, width: 16, height: 16)
        moreButton.setImage(UIImage(named: "more"), for: .normal)
        rightCustomView.addSubview(moreButton)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let navigationBar = self.navigationController?.navigationBar
        
        UIView.animate(withDuration: TimeInterval(0.15)) {
            navigationBar?.alpha = (navigationBar?.alpha == 1 ? 0 : 1)
        }
    }
    
        
}


// MARK: - 텍스트필드 관련 메서드 추가 & 키보드 내리기
extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        navigationController?.view.endEditing(true)
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        navigationController?.view.endEditing(true)
        
    }
}

