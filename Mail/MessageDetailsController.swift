//
//  MessageDetailsController.swift
//  Mail
//
//  Created by Justin on 3/28/20.
//  Copyright © 2020 justncode LLC. All rights reserved.
//

import UIKit

class MessageDetailsController: UIViewController {
    
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    var viewModel: MessageDetailsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        setNavigationBarTitle(viewModel.navigationBarTitle)
        
        subjectLabel.text = viewModel.displayableSubject
        timeLabel.text = viewModel.displayableTime
        bodyLabel.text = viewModel.displayableBody
    }
    
    private func setNavigationBarTitle(_ title: String) {
        navigationItem.title = title
    }
}
