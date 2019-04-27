//
//  SecondViewController.swift
//  OOPBasic_02
//
//  Created by QuetzalAndOrca on 12/04/2019.
//  Copyright © 2019 QuetzalAndOrca. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
   
    // MARK: - 프로퍼티
    let making = FirstViewController()
    var viewControllerTitle: String = ItemInformation.shared.itemName!
    let descriptionLabel = UILabel()
    let myLabel = UILabel()


    // MARK: - 뷰 라이플 사이클
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        setNavigationBar()
        setLabel()
        
    }
    
    // MARK: - 화면 셋팅
    func setNavigationBar(){
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = viewControllerTitle
    }
    
    func setLabel(){
        making.addLable(label: myLabel,
                        view: self.view,
                        location: CGRect(x: 50, y: 200, width: 500, height: 30),
                        text: "아이템의 한줄평:")
        myLabel.font = UIFont.boldSystemFont(ofSize: 20)
        myLabel.textColor = UIColor.purple
        
        descriptionLabel.frame = CGRect(x: 50, y: 300, width: 500, height: 30)
        descriptionLabel.text = ItemInformation.shared.description
        view.addSubview(descriptionLabel)
    }
    
    
    
    
}
