//
//  Timer2viewController .swift
//  MyFirstApp1
//
//  Created by Abdulrahman Althobaiti on 8/11/17.
//  Copyright © 2017 Abdulrahman Althobaiti. All rights reserved.
//

import Foundation
import UIKit
class TimeController2: UIViewController

{
    @IBOutlet weak var minutesLabel: UILabel!
    var taskBox : Task?
    @IBOutlet weak var distractedLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    var timeInMinutes = 60
    var timeInSeconds = 0
    var timerIsRunning = false
    var timer = Timer()
    @IBOutlet weak var StopOutlet: UIButton!
    
    @IBOutlet weak var SliderOutlet: UISlider!
    @IBAction func Slider(_ sender: UISlider) {
        
        
        timeInSeconds = Int(sender.value * 60 * 60)
        if timeInSeconds % 60 < 10{
            secondsLabel.text = "0" + String(timeInSeconds % 60)
        }
        else{
            secondsLabel.text = String(timeInSeconds % 60)
        }
        minutesLabel.text = String(timeInSeconds / 60)
        
    }
    
    
    @IBAction func Stop(_ sender: UIButton) {
        timer.invalidate()
        timeInMinutes = 60
        timerIsRunning = false
        
        SliderOutlet.setValue(60, animated: true)
        
        let displaySeconds = timeInSeconds / 60
        let displayMinutes = timeInSeconds % 60
        secondsLabel.text = String(displayMinutes)
        minutesLabel.text = String(displaySeconds)
        
        
        
    }
    
    
    @IBAction func Start(_ sender: UIButton) {
        if timerIsRunning == false{
            timerIsRunning = true
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimeController.action), userInfo: nil, repeats:true)
        }
        
        
    }
    
    @IBAction func Distracted(_ sender: UIButton) {
        
        taskBox?.distractedCount += 1
        if let taskBoxCantBeEmpty = taskBox{
            distractedLabel.text = String(taskBoxCantBeEmpty.distractedCount)
            
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        taskBox?.distractedCount += 1
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        if let taskBoxCantBeEmpty = taskBox{
            
            self.distractedLabel.text = String(taskBoxCantBeEmpty.distractedCount)
            
        }
        print(taskBox?.distractedCount ?? 0)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeInSeconds = timeInMinutes * 60
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func action(){
        
        timeInSeconds -= 1
        
        if timeInSeconds == 0
        {
            //timer.invalidate()
            timerIsRunning = false
            
            timeInSeconds = timeInMinutes * 60
        }
        
        let displaySeconds = timeInSeconds / 60
        let displayMinutes = timeInSeconds % 60
        
        secondsLabel.text = String(displayMinutes)
        minutesLabel.text = String(displaySeconds)
        //distractedLabel.text = String(taskBox?.distractedCount)
        if let taskBoxCantBeEmpty = taskBox {
            distractedLabel.text = String(taskBoxCantBeEmpty.distractedCount)
        }
    }
    
}
