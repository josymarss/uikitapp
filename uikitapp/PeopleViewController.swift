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

        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }


}


private extension PeopleViewController {
    func setUp(){
        self.view.backgroundColor = .white
        
        // MARK: button configuration
        self.view.addSubview(subscribeButton)
        
        NSLayoutConstraint.activate([
            subscribeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subscribeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)

        ])
    }
}

