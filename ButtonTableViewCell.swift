//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by micasasucasa on 1/31/19.
//  Copyright © 2019 Jacob Rosevear. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {

    var delegate: ButtonTableViewCellDelegate?
    
    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    
    

    @IBAction func buttonTapped(_ sender: UIButton) {
        delegate?.buttonCellButtonTapped(self)
    }
    
    fileprivate func updateButton(_ isComplete: Bool) {
        let imageName = isComplete ? "complete" : "incomplete"
        completeButton.setImage(UIImage(named: imageName), for: .normal)
    }
}
extension ButtonTableViewCell {
    func update(withTask task: Task) {
        
        primaryLabel.text = task.name
        updateButton(task.isComplete)
    }
}

protocol ButtonTableViewCellDelegate {
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell)
}
