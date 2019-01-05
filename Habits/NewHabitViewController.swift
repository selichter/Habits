//
//  NewHabitViewController.swift
//  Habits
//
//  Created by Sarah Lichter on 12/27/18.
//  Copyright © 2018 Sarah Lichter. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func performSegueToReturnBack()  {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
}


class NewHabitViewController: UIViewController {
    @IBOutlet weak var habitNameTextField: UITextField!
    @IBOutlet weak var targetTextField: UITextField!
    @IBOutlet weak var measurementTextField: UITextField!
    @IBOutlet weak var timePeriodTextField: UITextField!
    
    @IBAction func createHabit(_ sender: Any) {
        let newHabit = HabitEntity(name: habitNameTextField.text ?? "",
                                   currentCount: 0,
                                   target: Int(targetTextField.text!) ?? 0,
                                   timePeriod: timePeriodTextField.text ?? "",
                                   measurement: measurementTextField.text ?? ""
                                   )
        HabitDataSource.sharedRealm.insert(item: newHabit)
        print("saved realm")
        performSegueToReturnBack()
    }
    
}
