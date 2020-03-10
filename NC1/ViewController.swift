//
//  ViewController.swift
//  NC1
//
//  Created by Amos Ebenhaezer on 03/03/20.
//  Copyright © 2020 Amos Ebenhaezer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionImage: UIImageView!
    @IBOutlet weak var roundImage: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerBtn: UIButton!
 
    @IBOutlet var customAlert: CustomAlert!
    
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    @IBOutlet weak var option5: UIButton!
    @IBOutlet weak var option6: UIButton!
    
    @IBOutlet weak var submitButton: RoundButton!
    
    @IBOutlet weak var question2: UIView!
    @IBOutlet weak var question2Label: UILabel!
    @IBOutlet weak var option1Ques2Btn: UIImageView!
    @IBOutlet weak var option2Ques2Btn: UIImageView!
    
    var answer = 0
    var position = -1
    var ans = [1, 3, 4, 7, 8, 13]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        question2.alpha = 0
        questionImage.image = #imageLiteral(resourceName: "animaux-enigme-e1540481637378")
        roundImage.layer.masksToBounds = true
        roundImage.layer.cornerRadius = roundImage.bounds.height / 2
        customAlert.contentView.isHidden = true
        customAlert.vc = self
        submitButton.setTitle("Next", for: .normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func answerButton(_ sender: UIButton) {
        
        resetButton()
        
        if(sender == option1) {
            option1.setImage(UIImage(named: "checked.png"), for: .normal)
            answer = 1
            position = 0
            print(answer)
        } else if(sender == option2) {
            option2.setImage(UIImage(named: "checked.png"), for: .normal)
            answer = 3
            position = 1
            print(answer)
        } else if(sender == option3) {
            option3.setImage(UIImage(named: "checked.png"), for: .normal)
            answer = 4
            position = 2
            print(answer)
        } else if(sender == option4) {
            option4.setImage(UIImage(named: "checked.png"), for: .normal)
            answer = 7
            position = 3
            print(answer)
        } else if(sender == option5) {
            option5.setImage(UIImage(named: "checked.png"), for: .normal)
            answer = 8
            position = 4
            print(answer)
        } else if(sender == option6) {
            option6.setImage(UIImage(named: "checked.png"), for: .normal)
            answer = 13
            position = 5
            print(answer)
        }
        
    }
    
    @IBAction func submitBtn(_ sender: Any) {
        
        resetButton()
        customAlert.alpha = 1
        customAlert.contentView.isHidden = false
        
        if(answer == 0) {
            customAlert.trophyImg.image = #imageLiteral(resourceName: "exclamation-mark")
            customAlert.titleLabel.text = "Not done!"
            customAlert.messageLabel.text = "Please choose your answer!"
            customAlert.closeButton.setTitle("Close", for: .normal)
            print(ans)
            
        } else {
            customAlert.trophyImg.image = #imageLiteral(resourceName: "trophy")
            ans.remove(at: position)
            customAlert.titleLabel.text = "All done!"
            customAlert.messageLabel.text = "Your answer is \(answer)."
            customAlert.closeButton.setTitle("Next", for: .normal)
            print(ans)
            
            var temp = ""
            var count = ans.count-1
            
            for i in 0...count {
                if(i == 0) {
                    temp = String(ans[i])
                } else if(i == 4) {
                  temp = temp + " or " + String(ans[i])
                } else {
                    temp = temp + ", " + String(ans[i])
                }
                
                print(i)
            }
            customAlert.messageLabel.text = "Your answer is \(answer)." + " Other people can choose " + temp + ". So is programming. There are many ways to achieve a goal."
            ans = [1, 3, 4, 7, 8, 13]
            
        }
    }
    
    func changeImage() {
        question2.alpha = 1
        questionImage.image = #imageLiteral(resourceName: "enigmes-illusions-doptique2")
    }
    
    func resetButton() {
        option1.setImage(UIImage(named: "uncheck.png"), for: .normal)
        option2.setImage(UIImage(named: "uncheck.png"), for: .normal)
        option3.setImage(UIImage(named: "uncheck.png"), for: .normal)
        option4.setImage(UIImage(named: "uncheck.png"), for: .normal)
        option5.setImage(UIImage(named: "uncheck.png"), for: .normal)
        option6.setImage(UIImage(named: "uncheck.png"), for: .normal)
    }
}
