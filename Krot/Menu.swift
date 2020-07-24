//
//  File.swift
//  Krot
//
//  Created by Sergio Ramos on 24/07/2020.
//  Copyright © 2020 Sergio Ramos. All rights reserved.
//

import UIKit

class Menu: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = text
    }
}
