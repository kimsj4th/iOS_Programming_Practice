# iOS Programming Practice  


**Day01: 아울렛과 스토리보드로 오브젝트 만들기**  
**Day02: 스토리보드를 이용하지 않고 뷰 그리기**  
**Day03: 스토리보드를 이용하지 않고 화면 구성 및 조작하기**   
**Day04: 스토리보드를 이용하여 오브젝트 연습하기**  
**Day05: 테이블 뷰**  
	- Homepwner   
	- BirttdayTracker	  
**Day06: 콜렉션 뷰, 스크롤 뷰   
 Day07: 커스텀 클래스**  
	- Custom Button  
	- Custom UI  
**Day08: 코코아팟 라이브러리**  
**Day09: Firebase**  
	- 회원가입(Sign Up)  
**Day10: Draw**  
**Day11: Gesture**  
**Day12: Animation**  
**Day13: Saving Data**  
**Day14: Network**   
**Day15: 개별 기능**  
	- 햄버그 메뉴   
	- 사이즈 클래스   
	- 키보드 컨트롤   

 

--- 




  
#### Day03: Programmatic View Practice   

_MyItem_

<img width="662" alt="iOS_03_OOP_Basic" src="https://user-images.githubusercontent.com/47228549/57127261-c821f200-6dca-11e9-8dcc-490a46ce47bb.png">



#### Day07: Custom Class 

_Custom Button_


<img width="454" alt="iOS_07_01_CustomButton" src="https://user-images.githubusercontent.com/47228549/57120497-d5c87f00-6dac-11e9-8d6f-8facc2af5170.png">


참고: Swift 실전편, 이재은, 루비페이퍼  
Sean Allen(YouTube channel)


_Custom UI_

<img width="368" alt="iOS_07_02_CustomUI" src="https://user-images.githubusercontent.com/47228549/57126549-44670600-6dc8-11e9-8bb8-b3c671f4c021.png">  

	Custom Class: 
	CustomStepper, CustomButton, CustomAlertViewController, CustomTabBarController  
참고: Swift 실전편, 이재은, 루비페이퍼  


#### Day09: Firebase 
_Sing up_

```swift
@objc func signUpEvent() {
        guard
            let email = emailTextField.text,
            let password = passwordTextField.text,
            let name = nameTextField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
            
            if error == nil {
                guard let user = authDataResult?.user else { return }
                let uid = user.uid
                
                let image = self.imageView.image
                let imageData = image?.jpegData(compressionQuality: 0.1)
                
                Storage.storage().reference().child("userImages").child(uid).putData(imageData!, metadata: nil, completion: { (storageMetaData, error) in
                    
                        Storage.storage().reference().child("userImages").child(uid).downloadURL(completion: { (url, error) in
                            
                            let imageURL = url?.absoluteString
                        Database.database().reference().child("users").child(uid).setValue(["userName": name, "profileImageURL": imageURL])
                    })
                })
            } else { print(error?.localizedDescription)}
        }
    }
```