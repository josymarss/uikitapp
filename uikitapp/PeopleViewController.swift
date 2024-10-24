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
    
    
    private lazy var personContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Josemar Silva"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "josymarss@mail.com"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var personStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        return stackView
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
        self.view.addSubview(personContainerView)
        personContainerView.addSubview(personStackView)
        
        // MARK: Add to Stack
        personStackView.addArrangedSubview(nameLabel)
        personStackView.addArrangedSubview(emailLabel)
        personStackView.addArrangedSubview(subscribeButton)
        
        // MARK: Position in the screen
        NSLayoutConstraint.activate([
            personContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            personContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            personContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
            personStackView.topAnchor.constraint(equalTo: personContainerView.topAnchor, constant: 8),
            personStackView.leadingAnchor.constraint(equalTo: personContainerView.leadingAnchor, constant: 8),
            personStackView.trailingAnchor.constraint(equalTo: personContainerView.trailingAnchor, constant: -8),
            personStackView.bottomAnchor.constraint(equalTo: personContainerView.bottomAnchor, constant: -8)

        ])
    }
    
    // MARK: Events
    @objc func didTapSubscribe(sender: UIButton) {
        print("You're subscribed now!")
    }
}

