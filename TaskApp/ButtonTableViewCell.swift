//
//  ButtonTableViewCell.swift
//  TaskApp
//
//  Created by Nick Reichard on 6/7/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {


    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    var delegate: ButtonTableViewCellDelegate?
    
    // MARK: Actions
    
    @IBAction func completeButtonTapped(_ sender: Any) {
        delegate?.buttonCellButtonTapped(self)
    }
    
    fileprivate func updateButton(_ isComplete: Bool) {
        let imageName = isComplete ? #imageLiteral(resourceName: "complete") : #imageLiteral(resourceName: "incomplete")
        completeButton.setImage(imageName, for: .normal)
    
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
