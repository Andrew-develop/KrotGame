//
//  File.swift
//  Krot
//
//  Created by Sergio Ramos on 24/07/2020.
//  Copyright © 2020 Sergio Ramos. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = text
    }
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
}
