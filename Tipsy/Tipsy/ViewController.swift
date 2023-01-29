//
//  ViewController.swift
//  Tipsy
//
//  Created by Дархан Есенкул on 06.11.2022.
//

import UIKit

class ViewController: UIViewController {
    

    
    var percentage: Double = 0
    var amountFromTF: String = ""
    
    
    
    @IBOutlet weak var countLable: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult"{
            if let secVC = segue.destination as? SecondViewController{
                if (amountFromTF.isEmpty){
                    amountFromTF = "0"
                }
               let amount = Int(amountFromTF)
                let count = countLable.text
                let countInt = (count! as NSString).integerValue
                    let percentage = Int(percentage)
                let total: Double = (Double(amount!) + Double(amount! * percentage / 100))/Double(countInt)
                let rounderTotal = round(total*10)/10
                    let myObj = MyStruct(total: rounderTotal, text: "Split between \(countInt) people, with \(percentage)% trip")
                    secVC.myObj = myObj
                
            }
            
        }
    }

    @IBAction func amountTF(_ sender: UITextField) {
        amountFromTF = sender.text ?? "0"
    }
    
    
    @IBAction func percentSC(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            return percentage = 0
        case 1:
            return percentage = 10
        case 2:
            return percentage = 20
        default:
            break
        }
    }
    
    
    @IBAction func stepper(_ sender: UIStepper) {
        countLable.text = String(Int(sender.value))
    }
    
    
    @IBAction func showResult(_ sender: UIButton){
        performSegue(withIdentifier: "showResult", sender:self)
    }

}

