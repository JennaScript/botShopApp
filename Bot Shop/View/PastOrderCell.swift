//
//  PastOrderCell.swift
//  Bot Shop
//
//  Created by Jennalyn Kabiling on 7/13/21.
//
import Foundation
import UIKit

class PastOrderCell: UITableViewCell {
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        return stackView
    }()
    
    let title: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "AvenirNext-Bold", size: 20)
        title.textColor = UIColor(red: 0.29, green: 0.29, blue: 0.29, alpha: 1.0)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let itemImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    func setup() {
        
        contentView.addSubview(stackView)
        
        // All the stackView constraints at once because we're fancy
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.85),
            stackView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.75),
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        stackView.addArrangedSubview(itemImage)
        itemImage.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.25).isActive = true
        
        stackView.addArrangedSubview(title)
        title.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.55).isActive = true
    }
    
    func setCellContents(item: Item) {
        itemImage.image = item.image
        title.text = item.title
    }
    
    func setBoxContents(box: Order) {
        textLabel?.text = box.title
        imageView?.image = box.image
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
