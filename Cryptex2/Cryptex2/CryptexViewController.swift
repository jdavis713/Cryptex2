//
//  CryptexViewController.swift
//  Cryptex2
//
//  Created by Jordan Davis on 5/16/19.
//  Copyright © 2019 Jordan Davis. All rights reserved.
//

import UIKit

class CryptexViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: -Actions
    
    @IBAction func unlock(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: -Properties
    
    @IBOutlet var hintLabel: UILabel!
    @IBOutlet var cryptexPickerView: UIPickerView!
    @IBOutlet var unlockButton: UIButton!
    
    

}
