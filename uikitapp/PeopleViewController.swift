//
//  PeopleViewController.swift
//  uikitapp
//
//  Created by Josymarss on 24/10/24.
//

import UIKit

class PeopleViewController: UIViewController {
    
    private lazy var subscribeButton: UIButton = {
        
        var configButton = UIButton.Configuration.filled()
        configButton.title = "Subscribe".uppercased()
        configButton.baseBackgroundColor = .red
        configButton.baseForegroundColor = .white
        configButton.buttonSize = .large
        configButton.cornerStyle = .medium
        
        let button = UIButton(configuration: configButton)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: add event
        button.addTarget(self, action: #selector(didTapSubscribe), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: SetUp and constraint
        setUp()
    }


}


private extension PeopleViewController {
    
    func setUp(){
        self.view.backgroundColor = .white
        
        // MARK: Add into a view
        self.view.addSubview(subscribeButton)
        
        // MARK: Position in the screen
        NSLayoutConstraint.activate([
            subscribeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subscribeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // MARK: Events
    @objc func didTapSubscribe(sender: UIButton) {
        print("You're subscribed now!")
    }
}

