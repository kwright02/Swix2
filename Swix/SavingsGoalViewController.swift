//
//  SavingsGoalViewController.swift
//  Swix
//
//  Created by Kyle Wright on 4/27/22.
//

import UIKit

class SavingsGoalViewController: UIViewController {
    
    
    @IBOutlet weak var goal1Name: UITextField!
    @IBOutlet weak var goal1Amount: UITextField!
    @IBOutlet weak var goal2Name: UITextField!
    @IBOutlet weak var goal2Amount: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        overrideUserInterfaceStyle = .light
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showError(_ message: String){
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in }))
        self.present(alert, animated: true, completion: nil);
    }
    
    func moveToViewByID(id: String) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: id) as! ViewController
        self.present(nextViewController, animated:true, completion:nil)
        
    }
    
    @IBAction func finishEditingGoals(_ sender: Any) {
        
        if goal1Name.text?.isEmpty == true ||
            goal2Name.text?.isEmpty == true ||
            goal1Amount.text?.isEmpty == true ||
            goal2Amount.text?.isEmpty == true {
            showError("Make sure all 4 fields have been filled out!");
            return;
        }
        
        ViewController.savingsGoal1 = goal1Name.text!;
        ViewController.savingsGoal2 = goal2Name.text!;
        ViewController.savingsGoal1Amount = Float(goal1Amount.text!)!;
        ViewController.savingsGoal2Amount = Float(goal2Amount.text!)!;
        
        moveToViewByID(id: "HomeView")
        
    }
    
    
}
