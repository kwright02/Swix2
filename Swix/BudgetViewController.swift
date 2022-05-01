//
//  BudgetViewController.swift
//  Swix
//
//  Created by Kyle Wright on 4/16/22.
//

import UIKit

class BudgetViewController: UIViewController {
    
    @IBOutlet weak var averageWeeklyPaycheck: UITextField!
    
    @IBOutlet weak var foodImportanceSlider: UISlider!
    @IBOutlet weak var spendingMoneySlider: UISlider!
    @IBOutlet weak var savingsSlider: UISlider!
    @IBOutlet weak var fixedExpensesInput: UITextField!
    
    static var averageWeeklyIncome: Float = 0.00;
    static var foodImportance: Float = 0.00;
    static var spendingMoneyImportance: Float = 0.00;
    static var savingsImportance: Float = 0.00;
    static var fixedExpenses: Float = 0.00;
    
    override func viewWillAppear(_ animated: Bool) {
        overrideUserInterfaceStyle = .light
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func toPreferences(_ sender: Any) {
        
        BudgetViewController.averageWeeklyIncome = Float (averageWeeklyPaycheck.text!) ?? 0;
        
        if averageWeeklyPaycheck.text?.isEmpty == true {
            showError("You must enter a number to continue");
        } else {
            moveToStepByID(id: "PreferenceSliders")
        }
        
    }
    
    @IBAction func toFixedExpenses(_ sender: Any) {
    
        BudgetViewController.foodImportance = foodImportanceSlider.value;
        BudgetViewController.spendingMoneyImportance = spendingMoneySlider.value;
        BudgetViewController.savingsImportance = savingsSlider.value;
        
        moveToStepByID(id: "FixedExpenses")
        
    }
    
    
    @IBAction func returnToHome(_ sender: Any) {
        
        BudgetViewController.fixedExpenses = Float(fixedExpensesInput.text!) ?? 0;
        
        calculateBudget()
        moveToViewByID(id: "HomeView")
        
    }
    
    func moveToViewByID(id: String) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: id) as! ViewController
        self.present(nextViewController, animated:true, completion:nil)
        
    }
    
    func moveToStepByID(id: String) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: id) as! BudgetViewController
        self.present(nextViewController, animated:true, completion:nil)
        
    }
    
    func showError(_ message: String){
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in }))
        self.present(alert, animated: true, completion: nil);
    }
    
    func calculateBudget() {
        let averageMonthlyIncome: Float = BudgetViewController.averageWeeklyIncome*4;
        
        let residualIncome: Float = averageMonthlyIncome - BudgetViewController.fixedExpenses;
        
        var savingsFactor: Float = 0.00;
        
        if BudgetViewController.savingsImportance < 50.0 {
            savingsFactor = 0.2
        } else if BudgetViewController.savingsImportance > 50.0 {
            savingsFactor = 0.4
        }
        
        let amountToSave = (residualIncome * savingsFactor)
        let amountToSpend = residualIncome - amountToSave;
        
        var foodFactor: Float = 0.00;
        
        if BudgetViewController.foodImportance < 50.0 {
            foodFactor = 0.2
        } else if BudgetViewController.foodImportance > 50.0 {
            foodFactor = 0.4
        }
        
        let foodBudget = (amountToSpend * foodFactor);
        let spendingMoney = amountToSpend - foodBudget;
        
        ViewController.foodBudget = foodBudget;
        ViewController.spendingMoney = spendingMoney;
        ViewController.fixedExpenses = BudgetViewController.fixedExpenses;
        
        
        
//        BudgetViewController.foodImportance
//        BudgetViewController.spendingMoneyImportance
//        BudgetViewController.savingsImportance
    }
    
    
}
