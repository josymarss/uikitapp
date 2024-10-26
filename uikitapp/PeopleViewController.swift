//
//  PeopleViewController.swift
//  uikitapp
//
//  Created by Josymarss on 24/10/24.
//

import UIKit

class PeopleViewController: UIViewController{
    
    private var peopleViewModel = PeopleViewModel()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width:UIScreen.main.bounds.width, height:139)
        
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.translatesAutoresizingMaskIntoConstraints = false
        collView.register(PersonCollectionViewCell.self, forCellWithReuseIdentifier: "PersonCollectionViewCell")
        collView.dataSource = self
        
        return collView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: SetUp and constraint
        setUp()
        peopleViewModel.delegate = self
        peopleViewModel.getUsers()
    }
    
    
}


private extension PeopleViewController {
    
    func setUp(){
        
        self.navigationItem.title = "People"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = .white
        self.view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
    
}

extension PeopleViewController:PeopleViewModelDelegate {
    
    func didFinish() {
        collectionView.reloadData()
    }
    
    func didFail(error: Error) {
        print(error)
    }
}

extension PeopleViewController: PeopleViewCellDelegate {
    func didSubscribe() {
        let url = URL(string: "https://www.youtube.com/@pointer-bz9mx")!
        //let viewController = SFSafariViewControler(url:url)
        //viewController.modalPresentationStyle = .formSheet
        
        //self.present(viewController, animated: true)
    }
    
    
}

extension PeopleViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        peopleViewModel.people.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = peopleViewModel.people[indexPath.item]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonCollectionViewCell", for: indexPath) as! PersonCollectionViewCell
        
        cell.delegate = self
        cell.item = item
        
        return cell
    }
    
}
