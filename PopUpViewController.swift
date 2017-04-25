//
//  PopUpViewController.swift
//  HowLucky
//
//  Created by Nebojsa Brankovic on 24/04/2017.
//  Copyright © 2017 Nebojsa Brankovic. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

   
    @IBOutlet weak var textView: UITextView!
    var labelText:String = "";
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        textView.text = labelText
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func closePopUp(_ sender: Any) {
        self.view.removeFromSuperview()
    }
}
