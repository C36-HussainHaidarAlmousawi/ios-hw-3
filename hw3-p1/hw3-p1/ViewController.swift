//
//  ViewController.swift
//  hw3-p1
//
//  Created by hussain haidar almousawi on 9/24/20.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var height: UITextField!
    
    @IBOutlet weak var weight: UITextField!
    
    
    @IBOutlet weak var BMI: UILabel!
    
    
    @IBOutlet weak var status: UILabel!
    
    
    @IBOutlet var BG: UIImageView!
    
    @IBOutlet weak var calculateDesign: UIButton!
    
    @IBOutlet weak var calculateDesign2: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        calculateDesign.layer.cornerRadius = calculateDesign.frame.height / 2
        calculateDesign2.layer.cornerRadius = calculateDesign.frame.height / 2
    }


    @IBAction func calculate(_ sender: Any) {
        let h = Double(height.text!)
        let w = Double(weight.text!)
        let bmiM = BMIModel(height: h!, weight: w!)
        BMI.text = String( format : "%0.2f" ,  bmiM.bmi())
        
        
        if bmiM.bmi() <= 20 {
            status.text = "thin🥢"
            BG.image = UIImage(named: "BG4")
            status.textColor = UIColor.green
            BMI.textColor = UIColor.green
            
       }
        else if  bmiM.bmi() <= 25 {
            status.text = "normal🐵"
            BG.image = UIImage(named: "BG3")
            status.textColor = UIColor.orange
            BMI.textColor = UIColor.orange
       }
        else if  bmiM.bmi() >= 25 {
            status.text =  "fat🦦"
            BG.image = UIImage(named: "BG2")
            status.textColor = UIColor.red
            BMI.textColor = UIColor.red
       }
       else {
        status.text = "wrong"
        status.textColor = UIColor.white
        BMI.textColor = UIColor.white
       }

       
}
   
    
    
}

