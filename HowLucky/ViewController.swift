//
//  ViewController.swift
//  HowLucky
//
//  Created by Nebojsa Brankovic on 26/02/2017.
//  Copyright © 2017 Nebojsa Brankovic. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    
    var audioPlayer:AVAudioPlayer!
    var mClickConter:Int = 0, mRandomNumber = Int(arc4random_uniform(7));
    let TOTAL_BUTTONS :Float = 8.0;
    let mMessagesGood: [String] = ["You're infected by a virus of good luck!","Your 6th sense is working!",                        "Impossible, you must be a clairvoyant!"]
    let mMessagesMiddle: [String]  = ["Feeling lucky?", "Almost perfect!",    "The goddess of fortune guides your hand!"];
    let mMessagesBad: [String]  = ["Don't play lottery today!", "Better luck next time.",    "Sometimes life is rough, don't despair!"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Action
    
    @IBAction func onClickButton1(_ sender: UIButton) {
        processButtonClick(button: sender, number: 0);
    }
    
    @IBAction func onClickButton2(_ sender: UIButton) {
        processButtonClick(button: sender, number: 1);
    }
    
    @IBAction func onClickButton3(_ sender: UIButton) {
        processButtonClick(button: sender, number: 2);
    }
    
    @IBAction func onClickButton4(_ sender: UIButton) {
        processButtonClick(button: sender, number: 3);
    }
    
    @IBAction func onClickButton5(_ sender: UIButton) {
        processButtonClick(button: sender, number: 4);
    }
    
    @IBAction func onClickButton6(_ sender: UIButton) {
        processButtonClick(button: sender, number: 5);
    }
    
    @IBAction func onClickButton7(_ sender: UIButton) {
        processButtonClick(button: sender, number: 6);
    }
    
    @IBAction func onClickButton8(_ sender: UIButton) {
        processButtonClick(button: sender, number: 7);
    }
    
    func processButtonClick(button:UIButton,number:Int){
        let path = Bundle.main.path(forResource: "win.wav", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        playSound(url: url)
        mClickConter += 1;
        print("Button clicked!!!!!", number, "   " , mRandomNumber, " mClickConter= ", mClickConter)
        button.isUserInteractionEnabled = false
        if(mRandomNumber==number){
            //show wining screen
            getLuck()
            reset()
        }else{
            //set that button is pressed and play "smoke from the hat sound"
            button.setImage(UIImage(named:"hat_pressed.png"),for: UIControlState.normal)
            let path = Bundle.main.path(forResource: "bad.mp3", ofType:nil)!
            let url = URL(fileURLWithPath: path)
            playSound(url: url)
        }
    }
    
    func getLuck(){
        var outLuck :Float, message:String, avgLuck:Float , mRandomIndex = mRandomNumber/3;
        
        if (mClickConter == 1){
            outLuck = 100;
            print("getLuck 1000000",outLuck );
        }
        else {
            avgLuck = Float(mClickConter) / TOTAL_BUTTONS;
            outLuck = (100.00 - (avgLuck * 100));
            print("getLuck ",outLuck, "avgLuck = ",avgLuck,"mClickConter", mClickConter);
        }
        
        
        if (mClickConter < 2) {
            message = mMessagesGood[mRandomIndex];
            showDialog(type:1, message:message, outLuck:outLuck);
        } else if (mClickConter < 4) {
            message = mMessagesMiddle[mRandomIndex];
            showDialog(type:2, message:message, outLuck:outLuck);
        } else {
            message = mMessagesBad[mRandomIndex];
            showDialog(type:3, message:message, outLuck:outLuck);
        }
        
        let tempNumber = Int(arc4random_uniform(3))
        switch tempNumber {
        case 0:
            let path = Bundle.main.path(forResource: "win.wav", ofType:nil)!
            let url = URL(fileURLWithPath: path)
            playSound(url: url)
            
        case 1:
            let path = Bundle.main.path(forResource: "woohoo.mp3", ofType:nil)!
            let url = URL(fileURLWithPath: path)
            playSound(url: url)
            
        case 2:
            let path = Bundle.main.path(forResource: "hooraay.mp3", ofType:nil)!
            let url = URL(fileURLWithPath: path)
            playSound(url: url)
            
        case 3:
            let path = Bundle.main.path(forResource: "yoohoo.wav", ofType:nil)!
            let url = URL(fileURLWithPath: path)
            playSound(url: url)
            
        default:
            let path = Bundle.main.path(forResource: "win.wav", ofType:nil)!
            let url = URL(fileURLWithPath: path)
            playSound(url: url)
            
        }
    }
    
    func showDialog(type:Int,message:String, outLuck:Float)   {
        let popUp = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUpStoryBoardID") as!PopUpViewController
        popUp.labelText = message
        self.addChildViewController(popUp)
        popUp.view.frame = self.view.frame
        self.view.addSubview(popUp.view)
        popUp.didMove(toParentViewController:self)
    }
    
    func applicationWillResignActive(notification: NSNotification) {
        print("I'm out of focus!")
    }
    
    func reset() {
        button1.isUserInteractionEnabled = true
        button1.setImage(UIImage(named:"hat.png"),for: UIControlState.normal)
        button2.isUserInteractionEnabled = true
        button2.setImage(UIImage(named:"hat.png"),for: UIControlState.normal)
        button3.isUserInteractionEnabled = true
        button3.setImage(UIImage(named:"hat.png"),for: UIControlState.normal)
        button4.isUserInteractionEnabled = true
        button4.setImage(UIImage(named:"hat.png"),for: UIControlState.normal)
        button5.isUserInteractionEnabled = true
        button5.setImage(UIImage(named:"hat.png"),for: UIControlState.normal)
        button6.isUserInteractionEnabled = true
        button6.setImage(UIImage(named:"hat.png"),for: UIControlState.normal)
        button7.isUserInteractionEnabled = true
        button7.setImage(UIImage(named:"hat.png"),for: UIControlState.normal)
        button8.isUserInteractionEnabled = true
        button8.setImage(UIImage(named:"hat.png"),for: UIControlState.normal)
        mClickConter = 0
        mRandomNumber = Int(arc4random_uniform(7))
    }
    
    
    
    func playSound(url:URL) {
        do {
            let sound = try AVAudioPlayer(contentsOf: url)
            audioPlayer = sound
            sound.play()
        } catch {
            // couldn't load file :(
        }
    }
}

