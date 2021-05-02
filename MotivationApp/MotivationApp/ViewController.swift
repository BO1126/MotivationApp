//
//  ViewController.swift
//  MotivationApp
//
//  Created by 이정우 on 2021/05/01.
//

import UIKit

class ViewController: UIViewController {
    
    let Motivations = ["마크 트웨인","좋은 칭찬 한마디면 두달을 견뎌낼 수 있다.","로웰 토머스","자신이 할 수 있다고 생각하는 것보다 매일 조금씩 더 하라"]
    var motivationPersonName : String = String()
    var motivationText : String = String()
    var randomMotivationNumber : Int = Int()
    
    @IBOutlet weak var nextButton : UIButton!
    @IBOutlet weak var motivationTextLabel : UILabel!
    @IBOutlet weak var motivationPersonNameLabel : UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        motivationPersonName = Motivations[0]
        motivationText = Motivations[1]
        motivationPersonNameLabel.text = "\(motivationPersonName)"
        motivationTextLabel.text = "\(motivationText)"
        
    }
    
    @IBAction func touchUpInsidenextButton(){
        randomMotivationNumber = Int.random(in: 2...Motivations.count)
        if randomMotivationNumber % 2 == 0 {
            motivationPersonName = Motivations[self.randomMotivationNumber]
            motivationText = Motivations[self.randomMotivationNumber+1]
        }else{
            motivationPersonName = Motivations[self.randomMotivationNumber-1]
            motivationText = Motivations[self.randomMotivationNumber]
        }
        motivationPersonNameLabel.text = "\(motivationPersonName)"
        motivationTextLabel.text = "\(motivationText)"
    }


}

