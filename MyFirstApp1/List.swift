//
//  List.swift
//  MyFirstApp1
//
//  Created by Abdulrahman Althobaiti on 7/19/17.
//  Copyright © 2017 Abdulrahman Althobaiti. All rights reserved.
//

import Foundation
class List {
    var name : String = ""
    var text = ""

    //var tasks = [Task]() // ?
    var marked = false
    
    func toggleChecked() {
        marked = !marked
}

}
