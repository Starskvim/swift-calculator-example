//
//  ViewController.swift
//  swift-calculator-example
//
//  Created by Михаил Гайволя on 26.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numberPressed(_ sender: UIButton) {
        let number = sender.currentTitle
        print(number as Any)
    }
}

//#Preview {
//    ViewController()
//}
