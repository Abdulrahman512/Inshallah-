
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
    
    @IBOutlet weak var distractedLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    var timeInMinutes = 1
    var timeInSeconds = 0
    var timer = Timer()
    
    @IBAction func Start(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimeController.action), userInfo: nil, repeats:true)
        
    }
    
    @IBAction func Distracted(_ sender: UIButton) {
        
        distractedCount += 1
        distractedLabel.text = String(distractedCount)
        
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        distractedCount += 1
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        print(distractedCount)
        
        distractedLabel.text = String(distractedCount)
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
            
            timeInSeconds = timeInMinutes * 60
        }
        
        let displaySeconds = timeInSeconds / 60
        let displayMinutes = timeInSeconds % 60
        
        secondsLabel.text = String(displayMinutes)
        minutesLabel.text = String(displaySeconds)
        distractedLabel.text = String(distractedCount)
    }
    
}

