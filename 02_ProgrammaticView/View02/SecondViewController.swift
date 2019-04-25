//
//  SecondViewController.swift
//  View02
//
//  Created by QuetzalAndOrca on 06/04/2019.
//  Copyright © 2019 QuetzalAndOrca. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let myLabel = UILabel()
        myLabel.frame = CGRect(x: 50, y: 300, width: 300, height: 30)
        myLabel.text = "SecondView"
        view.addSubview(myLabel)
        
        self.view.backgroundColor = UIColor.lightGray
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
