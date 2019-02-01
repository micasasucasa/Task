//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by micasasucasa on 1/30/19.
//  Copyright © 2019 Jacob Rosevear. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    var task: Task? {
        didSet {
            loadViewIfNeeded()
            updateViews()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        taskDueTextField.inputView = dueDatePicker
        updateViews()
        //        guard let task = task else { return }
        //        if task.isComplete {
        //
        //
    }
    
    var dueDateValue: Date?
    
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskDueTextField: UITableViewCell!
    @IBOutlet weak var taskNotesTextView: UITextView!
    @IBAction func dueDatePicker(_ sender: UIDatePicker) {
    }
    
    
    //MARK:- Actions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        dueDateValue = sender.date
        guard let due = dueDateValue else { return }
        taskDueTextField.text = due.stringValue()
        
    }
    private func updateViews() {
        guard let task = task,
            let due = task.due else { return }
        taskNameTextField.text = task.name
        taskNotesTextView.text = task.notes
        taskDueTextField.text = due.stringValue()
    }
    
    @IBAction func userTappedView(_ sender: Any) {
        self.taskNameTextField.resignFirstResponder()
        self.taskDueTextField.resignFirstResponder()
        self.taskNotesTextView.resignFirstResponder()
        
    }
    
    
    
    
    
    
    
    
    
}



