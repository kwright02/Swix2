//
//  ViewController.swift
//  Swix
//
//  Created by Kyle Wright on 4/1/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var foodBudgetLabel: UILabel!
    @IBOutlet weak var fixedExpensesLabel: UILabel!
    @IBOutlet weak var spendingMoneyLabel: UILabel!
    @IBOutlet weak var savingsGoal1Name: UILabel!
    @IBOutlet weak var savingsGoal2Name: UILabel!
    @IBOutlet weak var savingsGoal1Top: UILabel!
    @IBOutlet weak var savingsGoal2Top: UILabel!
    
    
    static var foodBudget: Float = 0.00,
        fixedExpenses: Float = 0.00,
        spendingMoney: Float = 0.00,
        savingsGoal1: String = "Savings Goal 1",
        savingsGoal2: String = "Savings Goal 2",
        savingsGoal1Amount: Float = 0.00,
        savingsGoal2Amount: Float = 0.00;
    
    override func viewWillAppear(_ animated: Bool) {
        overrideUserInterfaceStyle = .light
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodBudgetLabel.text = "\(ViewController.foodBudget)"
        fixedExpensesLabel.text = "\(ViewController.fixedExpenses)"
        spendingMoneyLabel.text = "\(ViewController.spendingMoney)"
        savingsGoal1Name.text = "\(ViewController.savingsGoal1)"
        savingsGoal2Name.text = "\(ViewController.savingsGoal2)"
        savingsGoal1Top.text = "\(ViewController.savingsGoal1Amount)"
        savingsGoal2Top.text = "\(ViewController.savingsGoal2Amount)"
    }
    
    
    
}

