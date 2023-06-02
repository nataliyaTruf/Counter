//
//  ViewController.swift
//  Counter
//
//  Created by Nataliya MASSOL on 01/06/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var minusButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var historyOfChangesText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyOfChangesText.isEditable = false
        
        // Do any additional setup after loading the view.
    }
    
    var count = 0
    func getCurrentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let dateString = formatter.string(from: Date())
       return dateString
    }
    @IBAction private func plusButtonDidTap(_ sender: Any) {
        let currentDate = getCurrentDate()
        count += 1
        countLabel.text = "\(count)"
        historyOfChangesText.text += "\n \(currentDate) : значение изменено на +1"
    }
    @IBAction private func minusButtonDidTap(_ sender: Any) {
        let currentDate = getCurrentDate()
        if count > 0 {
            count -= 1
            historyOfChangesText.text += "\n \(currentDate): значение изменено на -1"
        } else {
            count = 0
            historyOfChangesText.text += "\n \(currentDate): попытка уменьшить значение счётчика ниже 0"
        }
        countLabel.text = "\(count)"
        
    }
    
    @IBAction private func resetButtonDidTap(_ sender: Any) {
        let currentDate = getCurrentDate()
        countLabel.text = "\(0)"
        count = 0
        historyOfChangesText.text = "\n \(currentDate) значение сброшено"
    }

}

