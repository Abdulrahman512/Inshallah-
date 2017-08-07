//
//  TaskCell.swift
//  MyFirstApp1
//
//  Created by Abdulrahman Althobaiti on 8/1/17.
//  Copyright © 2017 Abdulrahman Althobaiti. All rights reserved.


import UIKit

class TaskCell: UITableViewCell {
    
    @IBOutlet weak var lbl: UILabel! 
    
    @IBAction func timer(_ sender: UIButton) {
        //
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
