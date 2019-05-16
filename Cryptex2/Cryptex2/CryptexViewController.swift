//
//  CryptexViewController.swift
//  Cryptex2
//
//  Created by Jordan Davis on 5/16/19.
//  Copyright © 2019 Jordan Davis. All rights reserved.
//

import UIKit

class CryptexViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cryptexPickerView.delegate = self
        cryptexPickerView.dataSource = self
        
        updateViews()

        // Do any additional setup after loading the view.
    }
    
    var letters = ["A", "B", "C", "D",
                   "E", "F", "G", "H",
                   "I", "J", "K", "L",
                   "M", "N", "O", "P",
                   "Q", "R", "S", "T",
                   "U", "V", "W", "X",
                   "Y", "Z"]
    
    //MARK: -Functions
    
    func updateViews() {
        guard let cryptexHint = cryptexController.currentCryptex?.hint else { return }
        hintLabel.text = cryptexHint
        cryptexPickerView.reloadAllComponents()
    }
    
    //MARK: -Game Functions
    
    func hasMatchingPassword() -> Bool {
        let numberOfLetters = cryptexPickerView.numberOfComponents
        
        var passwordEntered: [String] = []
        for letter in 0..<numberOfLetters {
            let currentComponent = cryptexPickerView.selectedRow(inComponent: letter)
            passwordEntered.append(letters[currentComponent])
        }
        
        let passwordEnteredString = passwordEntered.joined(separator: "").lowercased()
        if passwordEnteredString == cryptexController.currentCryptex?.password {
            return true
        } else {
            return false
        }
    }
    
    func reset() {
        countdownTimer?.invalidate()
        _ = Timer.scheduledTimer(withTimeInterval: 60.00, repeats: false) { (countdownTimer) in
            self.presentNoTimeRemainingAlert()
        }
    }
    
    func newCryptexAndReset() {
        cryptexController.randomCryptex()
        updateViews()
        reset()
    }
    
    //MARK: -Alerts
    
    func presentCorrectPasswordAlert() {
        
        let alert = UIAlertController(title: "Correctamundo!", message: "Great Job! You figured it out!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try new cryptex?", style: .default, handler: { (alert) in self.newCryptexAndReset()}))
        present(alert, animated: true, completion: nil)
    }
    
    func presentIncorrectPasswordAlert() {
        
        let alert = UIAlertController(title: "Wrong!", message: "If I made choice like you, then I'd try again.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue guessing!", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func presentNoTimeRemainingAlert() {
        
        let alert = UIAlertController(title: "No Time", message: "You ran out of time! Would you like to reset the timer?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Reset Timer", style: .default, handler: { (alert) in self.reset()}))
        alert.addAction(UIAlertAction(title: "Try new cryptex", style: .default, handler: {(alert) in self.newCryptexAndReset()}))
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
    //MARK: -Actions
    
    @IBAction func unlock(_ sender: Any) {
        if hasMatchingPassword() {
            presentCorrectPasswordAlert()
        } else {
            presentIncorrectPasswordAlert()
        }
    }
    
    //MARK: -Data source and Delegate functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        guard let cryptex = cryptexController.currentCryptex else { return 0 }
        return cryptex.password.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return letters.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         return letters[row]
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
    
    var cryptexController = CryptexController()
    
    var countdownTimer: Timer?

}
