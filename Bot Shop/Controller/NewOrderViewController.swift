//
//  ViewController.swift
//  Bot Shop
//
//  Created by Jennalyn Kabiling on 7/11/21.
//

import UIKit

class NewOrderViewController: UIViewController {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 30
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.0)
        
        collectionView.register(NewItemCell.self, forCellWithReuseIdentifier: "cell")
        
        return collectionView
    }()
    
    let data = [
        Item(title: "Respiratory", image: UIImage(named: "robot1")!),
        Item(title: "Muscular", image: UIImage(named: "robot2")!),
        Item(title: "Endocrine", image: UIImage(named: "robot3")!),
        Item(title: "Excretory", image: UIImage(named: "robot4")!),
        Item(title: "Lymphatic", image: UIImage(named: "robot5")!),
        Item(title: "NervousAF", image: UIImage(named: "robot6")!),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        setViews()
        
        view.backgroundColor = UIColor(red:0.5, green:0.8, blue:0.8, alpha:1.0)
    }
    
    func setViews(){
        self.view.addSubview(collectionView)
        collectionView.widthAnchor.constraint(equalTo: self.view.layoutMarginsGuide.widthAnchor, multiplier: 1.0).isActive = true
        collectionView.heightAnchor.constraint(equalTo: self.view.layoutMarginsGuide.heightAnchor, multiplier: 1.0).isActive = true
        collectionView.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor).isActive = true
        collectionView.centerYAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerYAnchor).isActive = true

    }


}

extension NewOrderViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NewItemCell
        cell.backgroundColor = UIColor(red: 0.3, green: 0.8, blue: 0.5, alpha: 1.0)
        cell.data = self.data[indexPath.row]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.2, height: collectionView.frame.height/3)
    }
    
//    func collectionView

}
