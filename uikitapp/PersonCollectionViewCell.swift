//
//  PersonCollectionViewCell.swift
//  uikitapp
//
//  Created by Josymarss on 26/10/24.
//

import UIKit

protocol PeopleViewCellDelegate : AnyObject {
    func didSubscribe()
}

class PersonCollectionViewCell: UICollectionViewCell {
    
    private var personView: PersonView?
    weak var delegate: PeopleViewCellDelegate?
    
    var item: PersonResponse? {
        didSet{
            guard let firstName = item?.firstName, let lastName = item?.lastName, let letEmail = item?.email else { return }
            
            personView?.setNameAndEmail(name: "\(firstName)", lastName: "\(lastName)", email: "\(letEmail)")
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PersonCollectionViewCell {
    
    func setUp(){
        guard personView == nil else { return }
        
        personView = PersonView{ [weak self] in
            self?.delegate?.didSubscribe()
        }
        
        self.contentView.addSubview(personView!)
        
        NSLayoutConstraint.activate([
            personView!.topAnchor.constraint(equalTo: contentView.topAnchor),
            personView!.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            personView!.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            personView!.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
