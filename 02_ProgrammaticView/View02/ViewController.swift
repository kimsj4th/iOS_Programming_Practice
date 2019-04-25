//
//  ViewController.swift
//  View02
//
//  Created by QuetzalAndOrca on 06/04/2019.
//  Copyright © 2019 QuetzalAndOrca. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "첫 화면"
        
        let firstFrame = CGRect(x: 160, y: 240, width: 100, height: 150)
        let firstView = UIView(frame: firstFrame)
        firstView.backgroundColor = UIColor.blue
        view.addSubview(firstView)
        
        let secondFrame = CGRect(x: 20, y: 30, width: 50, height: 50)
        let secondView = UIView(frame: secondFrame)
        secondView.backgroundColor = UIColor.green
        firstView.addSubview(secondView)
        
        
        let myLabel = UILabel()
        myLabel.text = "CGRect: \(firstView.frame)"
        myLabel.frame = CGRect(x: 50, y: 150, width: 300, height: 40)
        myLabel.textColor = UIColor.black
        myLabel.backgroundColor = UIColor.lightGray
        view.addSubview(myLabel)
        
        
        let okButton = UIButton()
        okButton.frame = CGRect(x: 100, y: 500, width: 250, height: 30)
        okButton.setTitle("배경색 변경 click", for: .normal)
        okButton.setTitleColor(UIColor.brown, for: .normal)
        okButton.layer.borderColor = UIColor.purple.cgColor
        okButton.layer.borderWidth = 3.0
        view.addSubview(okButton)
        okButton.addTarget(self,
                           action: #selector(self.changeViewColor),
                           for: .touchUpInside)
        
        //LocateCenter
//        okButton.locateCenter(view: self.view)
        
        
        let submitButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done,
                                           target: self,
                                           action: #selector(submit(_:)))
        self.navigationItem.rightBarButtonItem = submitButton
    }
    
    @objc func submit(_ sender: Any) {
        
        let secondView = SecondViewController()
        self.navigationController?.pushViewController(secondView, animated: true)
    }
    
    
    @objc func changeViewColor() {
        
        print("It's working")
        if view.backgroundColor == UIColor.gray {
            view.backgroundColor = UIColor.white
        } else {
            view.backgroundColor = UIColor.gray
        }
    }
    
    

}

