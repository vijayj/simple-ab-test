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
    var dataObject: (message:String,index:Int) =  (message: "", index: -1)
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.messageLbl!.text = dataObject


    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let lbl  = self.messageLbl!
        lbl.text = dataObject.message
    }

}
