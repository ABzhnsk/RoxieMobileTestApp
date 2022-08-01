//
//  StartViewController.swift
//  RoxieMobileTestApp
//
//  Created by Anna Buzhinskaya on 01.08.2022.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = "Тестовое задание\nна позицию iOS-разработчик\nв компанию Roxie Mobile"
    }
}
