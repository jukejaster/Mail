//
//  MailController.swift
//  Mail
//
//  Created by Justin on 3/28/20.
//  Copyright © 2020 justncode LLC. All rights reserved.
//

import UIKit



class MailController: UITableViewController {
    
    private let viewModel = MailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewModel.fetchMailMessages { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifiers.Mail.showMessageDetails.rawValue {
            guard let viewController = segue.destination as? MessageDetailsController, let message = sender as? Mail.Message else { return }
            
            viewController.viewModel = MessageDetailsViewModel(message: message)
        }
    }
}

// MARK: - UITableViewDataSource
extension MailController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.messages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as? MessageCell else {
            fatalError("Unable to dequeue reusable cell with identifier \"messageCell.\"")
        }
        
        cell.message = viewModel.messages[indexPath.row]
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MailController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: SegueIdentifiers.Mail.showMessageDetails.rawValue, sender: viewModel.messages[indexPath.row])
    }
}
