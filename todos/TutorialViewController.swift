//
//  TutorialViewController.swift
//  todos
//
//  Created by Vijay Jambu on 2/23/16.
//  Copyright © 2016 Vijay Jambu. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {

    @IBOutlet weak var messageLbl: UILabel!
    var dataObject: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.messageLbl!.text = dataObject
//        self.messageLbl.numberOfLines = 3
//        self.messageLbl.lineBreakMode = .ByWordWrapping
//        self.messageLbl.sizeToFit()
    }


    
    @IBAction func skipTapped(sender: AnyObject) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
