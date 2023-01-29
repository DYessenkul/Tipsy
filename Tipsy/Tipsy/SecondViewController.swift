//
//  SecondViewController.swift
//  Tipsy
//
//  Created by Дархан Есенкул on 07.11.2022.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var total: UILabel!
    
    
    @IBOutlet weak var messageLabel: UILabel!
    
    
    var myObj: MyStruct?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let result: Double = myObj?.total ?? 1
        total.text = String(result)
        messageLabel.text = myObj?.text
        
        
        
    }
    
    @IBAction func closeResultPage(_ sender: UIButton){
        dismiss(animated: true)
    }

  

}
