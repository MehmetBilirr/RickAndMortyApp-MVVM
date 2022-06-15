//
//  RickyMortyTableViewCell.swift
//  RickAndMortyApp-MVVM
//
//  Created by Mehmet Bilir on 16.06.2022.
//

import UIKit
import SnapKit
import AlamofireImage

class RickyMortyTableViewCell: UITableViewCell {
    private let customImage : UIImageView = UIImageView()
    private let title : UILabel = UILabel()
    private let customDescription: UILabel = UILabel()
    
    enum Identifier: String {
        case id = "RickyMortyTableViewCell"
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure () {
        addSubview(customImage)
        addSubview(title)
        addSubview(customDescription)
        title.font = .boldSystemFont(ofSize: 18)
        customDescription.font = .italicSystemFont(ofSize: 10)
        
        
        
        customImage.snp.makeConstraints { make in
            make.height.equalTo(175)
            make.top.equalTo(contentView)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        title.snp.makeConstraints { make in
            make.top.equalTo(customImage.snp.bottom)
            make.right.left.equalTo(contentView)
            
        }
        
        customDescription.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom)
            make.right.left.equalTo(title)
            make.bottom.equalToSuperview()
        }
        
    }
    
    
    func saveModel(model:Result) {
        title.text = model.name
        customDescription.text = model.status.rawValue
        
        customImage.af.setImage(withURL: model.image.asUrl!)
        
    }
    

}
