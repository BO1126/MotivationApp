//
//  ViewController.swift
//  MotivationApp
//
//  Created by 이정우 on 2021/05/01.
//

import UIKit

class ViewController: UIViewController {
    
    let Motivations = [
        "마크 트웨인","좋은 칭찬 한마디면\n두달을 견뎌낼 수 있다.",
        "로웰 토머스","자신이 할 수 있다고 생각하는 것보다\n매일 조금씩 더 하라",
        "만레이","꿈을 기록하는 것이 목표였던 적은 없다,\n꿈을 실현하는 것이 나의 목표다.",
        "잭 웰치","최고의 경쟁력은 열정이다.",
        "조지 버나드 쇼","나는 10번 시도하면 9번 실패했다.\n그래서 10번씩 시도했다.",
        "발타사르 그라시안","우리가 진정으로 소유하는 것은 시간 뿐이다.\n가진 것이 달리 아무 것도 없는 이에게도\n시간은 있다.",
        "존 웨인","내일은 우리가 어제로부터\n무엇인가 배웠기를 바란다.",
        "피터 드러커","10분 뒤와 10년 후를 동시에 생각하라."
        
    ]
    
    var motivationPersonName : String = String()
    var motivationText : String = String()
    var randomMotivationNumber : Int = 0
    var checkNumberForbackButton : Int = Int()
    
    @IBOutlet weak var nextButton : UIButton!
    @IBOutlet weak var backButton : UIButton!
    @IBOutlet weak var motivationTextLabel : UILabel!
    @IBOutlet weak var motivationPersonNameLabel : UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //backButton 비활성화
        backButton.isEnabled = false
        
        motivationPersonName = Motivations[0]
        motivationText = Motivations[1]
        
        motivationPersonNameLabel.text = "\(motivationPersonName)"
        motivationTextLabel.text = "\(motivationText)"
        
    }
    
    
    // 첫줄의 길이에따라 폰트 크기 변경해주는 함수
    func checkFontSize(motivationText : String){
        let motivationTextFirstLine = motivationText.firstIndex(of: "\n") ?? motivationText.endIndex
        
        if motivationText[..<motivationTextFirstLine].count > 15{
            motivationTextLabel.font = UIFont.systemFont(ofSize: 23)
            if motivationText[..<motivationTextFirstLine].count > 20{
                motivationTextLabel.font = UIFont.systemFont(ofSize: 21)
            }
        }
        else{
            motivationTextLabel.font = UIFont.systemFont(ofSize: 27)
        }
    }
    
    // 랜덤으로 rgb값을 생성하여 애니메이션이 작동하며 배경색을 바꿔주는 함수
    func changeRandomBackgroundColor(){
        let r : CGFloat = CGFloat.random(in: 0.7...1)
        let g : CGFloat = CGFloat.random(in: 0.7...1)
        let b : CGFloat = CGFloat.random(in: 0.7...1)
        
        
        self.view.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
    }
    
    // nextButton 터치 시 발생하는 액션
    @IBAction func touchUpInsidenextButton(){
        checkNumberForbackButton = randomMotivationNumber
        
        UIView.transition(with: view, duration: 0.7, options: .transitionFlipFromRight, animations: nil, completion: nil)
        
        changeRandomBackgroundColor()
        
        // 랜덤으로 처음 나왔던 text를 제외한 text를 적용
        randomMotivationNumber = Int.random(in: 2...(Motivations.count-1))
        
        if randomMotivationNumber % 2 == 0 {
            motivationPersonName = Motivations[self.randomMotivationNumber]
            motivationText = Motivations[self.randomMotivationNumber+1]
        }else{
            motivationPersonName = Motivations[self.randomMotivationNumber-1]
            motivationText = Motivations[self.randomMotivationNumber]
        }
        
        checkFontSize(motivationText: motivationText)
        
        motivationPersonNameLabel.text = "\(motivationPersonName)"
        motivationTextLabel.text = "\(motivationText)"
        
        backButton.isEnabled = true
        
        
    }
    
    
    // backButton 터치 시 발생하는 액션
    @IBAction func touchUpInsidebackButton(){
        
        UIView.transition(with: view, duration: 0.7, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        
        
        changeRandomBackgroundColor()
        
        if checkNumberForbackButton % 2 == 0 {
            motivationPersonName = Motivations[self.checkNumberForbackButton]
            motivationText = Motivations[self.checkNumberForbackButton+1]
        }else{
            motivationPersonName = Motivations[self.checkNumberForbackButton-1]
            motivationText = Motivations[self.checkNumberForbackButton]
        }
        
        checkFontSize(motivationText: motivationText)
        
        motivationPersonNameLabel.text = "\(motivationPersonName)"
        motivationTextLabel.text = "\(motivationText)"
        
        backButton.isEnabled = false
        
    }
    
    

}

