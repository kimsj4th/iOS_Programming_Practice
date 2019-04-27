//
//  ViewController.swift
//  OOPBasic_02
//
//  Created by QuetzalAndOrca on 12/04/2019.
//  Copyright © 2019 QuetzalAndOrca. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    // MARK: - Property
    //UI객체
    let imageView = UIImageView()
    var firstItemButton = UIButton(type: UIButton.ButtonType.system)
    var secondItemButton = UIButton(type: .system)
    var thirdItemButton = UIButton(type: .system)
    var summitButton = UIButton(type: .system)
    let label = UILabel()
    var textField = UITextField()
    
    // 아이템 클래스
    var kitchenItem: KitchenItem!
    var studyRoomItem: StudyRoomItem!
    var bathRoomItem: BathRoomItem!
    
    // 인스턴스 클래스 생성
    func makeInstancClasses(){
        kitchenItem = KitchenItem(self)
        studyRoomItem = StudyRoomItem(self)
        bathRoomItem = BathRoomItem(self)
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        makeInstancClasses()
        setInitView()
        
        textField.delegate = self
    }
    override func viewWillDisappear(_ animated: Bool) {
        textField.resignFirstResponder() // 또는     self.view.endEditing(true)



    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigationBar()

        
    }
    
    // MARK: - 화면 셋팅
    func setInitView() {
        
        setNavigationBar()
        setSegmentControl()
        addImageView()
        addTextField()
        
        summitButton.isHidden = true
        textField.isHidden = true
        
        addLable(label: label, view: self.view,
                 location: CGRect(x: 30, y: 520, width: 400, height: 30),
                 text: "아이템을 선택해 주세요.")
        addButton(firstItemButton, at: CGRect(x: 30, y: 475, width: 110, height: 30),
                  title: kitchenItem.coffeeMaker)
        addButton(secondItemButton, at: CGRect(x: 160, y: 475, width: 110, height: 30),
                  title: kitchenItem.toastMachine)
        addButton(thirdItemButton, at: CGRect(x: 290, y: 475, width: 110, height: 30),
                  title: kitchenItem.slowCooker)
        addButton(summitButton, at: CGRect(x: 290, y: 565, width: 110, height: 30), title: "전송")
        summitButton.isEnabled = false
        
        
    }
    
    func setNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "My Item"
    }
    
    func setSegmentControl(){
        let segmentedControl = UISegmentedControl(items: ["Kitchen", "StudyRoom", "BathRoom"])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self,
                                   action: #selector(itemTypeChanged(_:)),
                                   for: .valueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.tintColor = UIColor.purple
        self.view.addSubview(segmentedControl)
        
        let segmentTopConstraint = segmentedControl.topAnchor.constraint(equalTo:
            self.view.safeAreaLayoutGuide.topAnchor, constant: 8)
        let segmentLeadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        let segmentTrailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        
        segmentTopConstraint.isActive = true
        segmentLeadingConstraint.isActive = true
        segmentTrailingConstraint.isActive = true
        
    }
    
    // MARK: - 오브젝트 생성 메서드
    func addImageView() {
        imageView.frame = CGRect(x: 50, y: 100,
                                 width: self.view.frame.size.width * 3/4 - 30,
                                 height: self.view.frame.size.width * 3/4 - 30)
        imageView.center = CGPoint(x: self.view.frame.size.width / 2 ,
                                   y: self.view.frame.size.height / 2 - 50)
        imageView.backgroundColor = UIColor.white
        imageView.image = UIImage(named: "Kitchen")
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
    }
    
    func addLable(label: UILabel, view: UIView, location: CGRect, text: String) {
        label.frame = location
        label.text = text
        view.addSubview(label)
    }
    
    func addTextField() {
        textField.frame = CGRect(x: 30, y: 565, width: 250, height: 30)
        textField.placeholder = "  아이템의 한줄평을 작성해 주세요"
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        view.addSubview(textField)
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

    }
    
    func addButton(_ button: UIButton, at location: CGRect, title: String) {
        
        button.frame = location
        button.backgroundColor = UIColor.green
        button.setTitle(title, for: UIControl.State.normal)
        button.tintColor = UIColor.purple
        button.backgroundColor = UIColor(red: 0.94, green: 0.96, blue: 1.0, alpha: 1.0)
        view.addSubview(button)
        button.addTarget(self, action: #selector(workingButton(_:)), for: UIControl.Event.touchUpInside)
    }
    
    // MARK: - @objc 메서드
    
    @objc func itemTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            self.imageView.image = UIImage(named: "Kitchen")
            self.firstItemButton.setTitle(kitchenItem.coffeeMaker, for: .normal)
            self.secondItemButton.setTitle(kitchenItem.toastMachine, for: .normal)
            self.thirdItemButton.setTitle(kitchenItem.slowCooker, for: .normal)
            clearView()
        case 1:
            self.imageView.image = UIImage(named: "studyRoom")
            self.firstItemButton.setTitle(studyRoomItem.notepad, for: .normal)
            self.secondItemButton.setTitle(studyRoomItem.laptop, for: .normal)
            self.thirdItemButton.setTitle(studyRoomItem.standLight, for: .normal)
            clearView()
        case 2:
            self.imageView.image = UIImage(named: "bathRoom")
            self.firstItemButton.setTitle(bathRoomItem.soap, for: .normal)
            self.secondItemButton.setTitle(bathRoomItem.shampoo, for: .normal)
            self.thirdItemButton.setTitle(bathRoomItem.toothbrush, for: .normal)
            clearView()
            
        default:
            break
        }
    }
    
    @objc func workingButton(_ sender: UIButton) {
        
        if sender == summitButton {
            //아이템 한줄평 저장
            ItemInformation.shared.description = textField.text
            
            //화면 전환
            let secondView = SecondViewController()
            
            // 애니메이션
//            UIView.animate(withDuration: 0.4, animations: {
//                UIView.setAnimationCurve(.easeInOut)
//                self.navigationController?.pushViewController(secondView, animated: false)
//                UIView.setAnimationTransition(UIView.AnimationTransition.flipFromLeft, for: (self.navigationController?.view)!, cache: false)
//            })
//
            self.navigationController?.pushViewController(secondView, animated: true)
            
        
        } else {
            clearButton()
            selectedButtonColor(sender)
            label.isHidden = true
            textField.isHidden = false
            summitButton.isHidden = false
            
            let buttonTitle = sender.title(for: UIControl.State.normal)
            //아이템 이름 저장
            ItemInformation.shared.itemName = buttonTitle
            
            // 버튼 타이틀에 따른 메서드 호출
            switch buttonTitle {
                
            // 부엌 아이템
            case kitchenItem.coffeeMaker:
                kitchenItem.makeCoffee()
                
            case kitchenItem.toastMachine:
                kitchenItem.makeToast()
            case kitchenItem.slowCooker:
                kitchenItem.workingSlowCooker()
                
            // 스터디룸 아이템
            case studyRoomItem.notepad:
                studyRoomItem.usingNotepad()
            case studyRoomItem.laptop:
                studyRoomItem.usingLaptop()
            case studyRoomItem.standLight:
                studyRoomItem.usingStandLight()
                
            // 화장실 아이템
            case bathRoomItem.soap:
                bathRoomItem.usingSoap()
            case bathRoomItem.shampoo:
                bathRoomItem.usingShampoo()
            case bathRoomItem.toothbrush:
                bathRoomItem.usingToothbrush()
            default:
                break
            }
            
        }
    }
    
    // MARK: - etc
    
    func clearButton() {
        firstItemButton.tintColor = UIColor.purple
        firstItemButton.backgroundColor = UIColor(red: 0.94, green: 0.96, blue: 1.0, alpha: 1.0)
        secondItemButton.tintColor = UIColor.purple
        secondItemButton.backgroundColor = UIColor(red: 0.94, green: 0.96, blue: 1.0, alpha: 1.0)
        thirdItemButton.tintColor = UIColor.purple
        thirdItemButton.backgroundColor = UIColor(red: 0.94, green: 0.96, blue: 1.0, alpha: 1.0)
        textField.text = nil
    }
    func selectedButtonColor(_ selectedButton: UIButton){
        selectedButton.tintColor = UIColor(red: 0.94, green: 0.96, blue: 1.0, alpha: 1.0)
        selectedButton.backgroundColor = UIColor.purple
        
    }
    
   
    
    func clearView() {
        label.isHidden = false
        textField.isHidden = true
        summitButton.isHidden = true
        clearButton()
    }
    
    // MyItem 클래스에서 사용됨
    func changeImage(named: String) {
        imageView.image = UIImage(named: named)
    }
    
  
    
  
    
}

// MARK: - 텍스트필드 관련 메서드 추가 
extension FirstViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        validTextField()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        validTextField()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.2) {
            self.view.frame.origin.y += 150
        }
    }
  
    
    // 키보드 사용시 화면을 위로 올립니다.
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.2) {
            self.view.frame.origin.y -= 150
        }
    }
    // 화면 터치시 텍스트필드 내림
   
    @objc func textFieldDidChange(_ textField: UITextField) {
        validTextField()
    }
    func validTextField() {
        if textField.text != "" {
            summitButton.isEnabled = true
        } else {
            summitButton.isEnabled = false
        }
    }
}
