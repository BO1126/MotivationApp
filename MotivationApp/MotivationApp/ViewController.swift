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
        "피터 드러커","10분 뒤와 10년 후를 동시에 생각하라.",
        "세상에서 가장 빠른 인디언 중","가야할 때 가지 않으면\n가려 할 때 갈 수 없다.",
        "브라이언 트레이시","오늘 당신은 평생의 목표에 도달하는데에\n도움이 되는 무슨 일을 하였는가?",
        "지코","지금 네가 편한 이유는\n내리막길을 걷고 있기 때문이다.",
        "롤리 다스칼","인생이란 자신을 찾는 것이 아니라 \n자신을 만드는 것이다.",
        "아멜리아 에어하트","다른 사람들이 할 수 있거나 할 일을 하지 말고,\n다른 이들이 할 수 없고 하지 않을 일들을 해라."
        
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
        // BackButton disable
        backButton.isEnabled = false
        
        motivationPersonName = Motivations[0]
        motivationText = Motivations[1]
        
        motivationPersonNameLabel.text = "\(motivationPersonName)"
        motivationTextLabel.text = "\(motivationText)"
        
    }
    
    
    
    // Check FistLine and change FontSize function
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
    
    
    // NextButton Action
    @IBAction func touchUpInsidenextButton(){
        checkNumberForbackButton = randomMotivationNumber
        
        //animation
        let rightPushTransition = CATransition()
        rightPushTransition.type = CATransitionType.push
        rightPushTransition.subtype = .fromRight
        rightPushTransition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        rightPushTransition.duration = 0.5
        
        motivationTextLabel.layer.add(rightPushTransition, forKey: CATransitionType.push.rawValue)
        
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
    
    
    
    // BackButton Action
    @IBAction func touchUpInsidebackButton(){
        
        //animation
        let leftPushTransition = CATransition()
        leftPushTransition.type = CATransitionType.push
        leftPushTransition.subtype = .fromLeft
        leftPushTransition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        leftPushTransition.duration = 0.5
        
        motivationTextLabel.layer.add(leftPushTransition, forKey: CATransitionType.push.rawValue)
        
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination
        guard let rvc = dest as? SecondViewController else {
            return
        }
        rvc.notificationMotivationText = self.motivationText
        rvc.notificationMotivationPersonName = self.motivationPersonName
    }
    
    
}

