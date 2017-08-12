
//
//  File.swift
//  MyFirstApp1
//
//  Created by Abdulrahman Althobaiti on 7/20/17.
//  Copyright © 2017 Abdulrahman Althobaiti. All rights reserved.
//

import UIKit

class TimeController: UIViewController   {
    @IBOutlet weak var minutesLabel: UILabel!
    var taskBox : Task?
    @IBOutlet weak var distractedLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    var timeInSeconds = 0
    var timerIsRunning = false
    var timer = Timer()
    @IBOutlet weak var StopOutlet: UIButton!

    @IBOutlet weak var SliderOutlet: UISlider!
    @IBAction func Slider(_ sender: UISlider) {

        stopTimer()
        
        if sender.value < Float(1)/Float(60) {
            sender.value = Float(1)/Float(60)
        }
        
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
        
        stopTimer()
    }
    
    func stopTimer(){
        
        timer.invalidate()
        timerIsRunning = false

        
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
        timeInSeconds = 60 * 25
        SliderOutlet.value = Float(25) / Float(60)
        
        if timeInSeconds % 60 < 10{
            secondsLabel.text = "0" + String(timeInSeconds % 60)
        }
        else{
            secondsLabel.text = String(timeInSeconds % 60)
        }
        minutesLabel.text = String(timeInSeconds / 60)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func action(){
        
        if timeInSeconds < 0 {
            timeInSeconds = Int(SliderOutlet.value * 60 * 60)
        }
        
        timeInSeconds -= 1
        
        if timeInSeconds == 0
        {
            stopTimer()
            print("we're done, name button restart")
            
            
        }
        
        if timeInSeconds % 60 < 10{
            secondsLabel.text = "0" + String(timeInSeconds % 60)
        }
        else{
            secondsLabel.text = String(timeInSeconds % 60)
        }
        minutesLabel.text = String(timeInSeconds / 60)
        
        //distractedLabel.text = String(taskBox?.distractedCount)
        if let taskBoxCantBeEmpty = taskBox {
            distractedLabel.text = String(taskBoxCantBeEmpty.distractedCount)
        }
        
    }
    
}

