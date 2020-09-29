//
//  ViewController.swift
//  x-o
//
//  Created by hussain haidar almousawi on 9/26/20.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var player:AVAudioPlayer = AVAudioPlayer()
    var player2:AVAudioPlayer = AVAudioPlayer()
    var player3:AVAudioPlayer = AVAudioPlayer()
    var player4:AVAudioPlayer = AVAudioPlayer()
    @IBOutlet weak var Owins: UILabel!
    @IBOutlet weak var Xwins: UILabel!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    @IBOutlet weak var BG: UIImageView!
       
    @IBOutlet weak var turnLabel: UILabel!
    var BGS = [String]()
    var buttons: [UIButton] = []
    var counter = 0
    var bIs: [UIImageView] = []
    var XCounter: Int = 0
    var OCounter: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
        do{
            let audioPath = Bundle.main.path(forResource: "M1", ofType: "mp3")
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        }
        catch{
           print(error)
        }
        
        do{
            let audioPath = Bundle.main.path(forResource: "FM1", ofType: "mp3")
            try player2 = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        }
        catch{
           print(error)
        }
        do{
            let audioPath = Bundle.main.path(forResource: "FM2", ofType: "mp3")
            try player3 = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        }
        catch{
           print(error)
        }
        do{
            let audioPath = Bundle.main.path(forResource: "WM1", ofType: "mp3")
            try player4 = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        }
        catch{
           print(error)
        }
        player.play()
        buttons = [b1 , b2 , b3 , b4 , b5 , b6 , b7 , b8 , b9]
        BGS = ["BG1" , "BG2" , "BG3" , "BG4" , "BG5" , "BG6" , "BG7" , "BG8"]
    }
    @IBAction func press(_ sender: UIButton) {
       
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)

        if counter % 2 == 0 {
            sender.setTitle("X", for: .normal)
            turnLabel.text = "O turn"
            sender.setTitleColor(.cyan, for: .normal)
            checkWinner(p: "X")
            player.stop()
            player3.stop()
            player2.play()
            
 
    }
        else if counter % 2 != 0 {
            sender.setTitle("O", for: .normal)
            turnLabel.text = "X turn"
            sender.setTitleColor(.magenta, for: .normal)
            checkWinner(p: "O")
            player.stop()
            player2.stop()
            player3.play()
            
        }
       
        
        counter += 1
        sender.isUserInteractionEnabled = false
        
        
    }
    
    @IBAction func resetTapped() {
        restartGame()
        
    }
    
    func checkWinner(p : String){
        
    let r1 = (b1.titleLabel?.text , b2.titleLabel?.text , b3.titleLabel?.text) == (p, p, p)
    let r2 = (b4.titleLabel?.text , b5.titleLabel?.text , b6.titleLabel?.text) == (p, p, p)
    let r3 = (b7.titleLabel?.text , b8.titleLabel?.text , b9.titleLabel?.text) == (p, p, p)
    let c1 = (b1.titleLabel?.text , b4.titleLabel?.text , b7.titleLabel?.text) == (p, p, p)
    let c2 = (b2.titleLabel?.text , b5.titleLabel?.text , b8.titleLabel?.text) == (p, p, p)
    let c3 = (b3.titleLabel?.text , b6.titleLabel?.text , b9.titleLabel?.text) == (p, p, p)
    let d1 = (b1.titleLabel?.text , b5.titleLabel?.text , b9.titleLabel?.text) == (p, p, p)
    let d2 = (b3.titleLabel?.text , b5.titleLabel?.text , b7.titleLabel?.text) == (p, p, p)
      
        
        if r1 || r2 || r3 || c1 || c2 || c3 || d1 || d2 {
            if p == "X" {
                XCounter += 1
                Xwins.text = String(XCounter)
            }
            if p == "O" {
                OCounter += 1
                Owins.text = String(OCounter)
            }
            if XCounter >= 3 || OCounter >= 3{
                player4.play()
            }
            
            let alertController = UIAlertController(title: "\(p) wins", message: "press restart to restart the game", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "restart🔄", style: .cancel) { (alert) in self.restartGame()
                
               
            }
            
            alertController.addAction(restartAction)
            present(alertController, animated: true, completion: nil)
        }

        
    }

    func restartGame(){
        
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
        for b in buttons {
            b.setTitle("", for: .normal)
            b.titleLabel?.text = ""
            b.isUserInteractionEnabled = true
        }
        
        counter = 0
        turnLabel.text = "X turn"
        BG.image = UIImage(named: BGS.randomElement()!)
        player2.stop()
        player3.stop()
    }

    
    
}
