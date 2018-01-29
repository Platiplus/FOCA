//
//  contadorPromodoroViewController.swift
//  FOCA_App
//
//  Created by Platiplus on 28/11/17.
//  Copyright © 2017 Platiplus. All rights reserved.
//

import UIKit

class contadorPromodoroViewController: UIViewController {
    
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var minuteLabel: UILabel!
    
    @IBOutlet weak var hourLabel: UILabel!
    
    var count = 0
    
    var minute = 0
    
    var hour = 0
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func counter() {
        
        count += 1
        if count > 9 {
            secondLabel.text = "\(count)"
            if count == 60 {
                count = 0
                secondLabel.text = "00"
                minute += 1
                if minute > 9 {
                    minuteLabel.text = "\(minute)"
                    if minute == 60 {
                        minute = 0
                        minuteLabel.text = "00"
                        hour += 1
                        if hour > 9 {
                            hourLabel.text = "\(hour)"
                        }
                        else {
                            hourLabel.text = "0\(hour)"
                        }
                    }
                }
                else{
                    minuteLabel.text = "0\(minute)"
                }
                
                
            }
        }
        else {
            secondLabel.text = "0\(count)"
        }
    }
    
    @IBAction func pauseTapped(_ sender: Any) {
        
        timer.invalidate()
    }
    @IBAction func startTapped(_ sender: Any) {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(contadorPromodoroViewController.counter), userInfo: nil, repeats: true)
    }
    
    @IBAction func resetTapped(sender: UIButton) {
        timer.invalidate()
        count = 0
        minute = 0
        hour = 0
        secondLabel.text = "00"
        minuteLabel.text = "00"
        hourLabel.text = "00"
    }

}
