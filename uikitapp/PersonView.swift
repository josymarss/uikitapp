//
//  PersonView.swift
//  uikitapp
//
//  Created by Josymarss on 24/10/24.
//

import UIKit

class PersonView: UIView {
    
    private var action: () -> ()
    
    init(action: @escaping () -> ()) {
        self.action = action
        super.init(frame: .zero)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setNameAndEmail(name: String, lastName: String, email: String){
        nameLabel.text = name
        emailLabel.text = email
    }
    // MARK: Components
    
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
    
    private lazy var personStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        return stackView
    }()
    
}

private extension PersonView{
    
    func setUp(){
        
        self.layer.cornerRadius = 10
        self.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(personStackView)
        
        //MARK: Add to the stack
        personStackView.addArrangedSubview(nameLabel)
        personStackView.addArrangedSubview(emailLabel)
        personStackView.addArrangedSubview(subscribeButton)
        
        NSLayoutConstraint.activate([
            
            personStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            personStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            personStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            personStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
            
        ])
        
    }
    
    @objc func didTapSubscribe(sender: UIButton) {
        print("You're subscribed now!")
    }
    
}


