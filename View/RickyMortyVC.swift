//
//  ViewController.swift
//  RickAndMortyApp-MVVM
//
//  Created by Mehmet Bilir on 15.06.2022.
//

import UIKit
import SnapKit

final class RickyMortyVC: UIViewController {
    private let labelTitle:UILabel = UILabel()
    private let box:UIView = UIView()
    private let indicator : UIActivityIndicatorView = UIActivityIndicatorView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Configure()
        
    }
    private func drawDesign() {
        DispatchQueue.main.async {
            self.labelTitle.text = "Mehmet Bilir"
            self.labelTitle.textColor = .black
            self.view.backgroundColor = .white
            self.box.backgroundColor = .red
            self.indicator.startAnimating()
        }
        
    }
    
    private func Configure() {
        
        view.addSubview(labelTitle)
        view.addSubview(box)
        view.addSubview(indicator)
        makeLabel()
        makeBox()
        makeIndicator()
        drawDesign()
        
    }
    

}

extension RickyMortyVC {
    
    
    private func makeLabel() {
        
        labelTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.greaterThanOrEqualTo(10)
            
        }
    }
        
        
        
    func makeIndicator() {
        indicator.snp.makeConstraints { make in
            make.height.equalTo(labelTitle)
            make.right.equalTo(labelTitle).offset(-5)
            make.top.equalTo(labelTitle)
        }
    }
                
            
        
    func makeBox() {
        box.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
    }
    
}
        
    


