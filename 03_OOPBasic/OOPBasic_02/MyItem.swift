//
//  MyItem.swift
//  OOPBasic_02
//
//  Created by QuetzalAndOrca on 12/04/2019.
//  Copyright © 2019 QuetzalAndOrca. All rights reserved.
//

import UIKit

enum ItemCategory {
    case kitchen
    case studyRoom
    case bathRoom
}

class MyItem {
    var name: String?
    var price: Int?
}

class KitchenItem: MyItem {
    
    var coffeeMaker = "Coffee Maker"
    var toastMachine = "Toast Machine"
    var slowCooker = "Slow Cooker"
    var controller: FirstViewController!

    init(_ controller: UIViewController) {
        self.controller = controller as? FirstViewController
    }
    
    func makeCoffee() {
        controller.changeImage(named: "CoffeeMaker")
        print("커피를만듭니다")
    }
    func makeToast() {
        controller.changeImage(named: "ToastMachine")
        print("토스트를 굽습니다")
    }
    func workingSlowCooker() {
        controller.changeImage(named: "SlowCooker")
        print("슬로우쿠킹을 합니다.")
    }
}

class StudyRoomItem: MyItem {
    var notepad = "Notepad"
    var laptop = "Labtop"
    var standLight = "Stand Light"
    var controller: FirstViewController!
    
    init(_ controller: UIViewController) {
        self.controller = controller as? FirstViewController
    }
    
    func usingNotepad() {
        controller.changeImage(named: "notepad")
    }
    
    func usingLaptop() {
        controller.changeImage(named: "laptop")
    }
    
    func usingStandLight() {
        controller.changeImage(named: "standLight")
    }
}

class BathRoomItem: MyItem {
    var soap = "Soap"
    var shampoo = "Shampoo"
    var toothbrush = "Toothbrush"
    
    var controller: FirstViewController!
    
    init(_ controller: UIViewController) {
        self.controller = controller as? FirstViewController
    }
    
    func usingSoap(){
        controller.changeImage(named: "soap")
    }
    
    func usingShampoo() {
        controller.changeImage(named: "shampoo")
    }
    
    func usingToothbrush() {
        controller.changeImage(named: "toothbrush")
    }
}
