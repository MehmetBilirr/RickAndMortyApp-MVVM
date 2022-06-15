//
//  ViewController.swift
//  RickAndMortyApp-MVVM
//
//  Created by Mehmet Bilir on 15.06.2022.
//

import UIKit
import SnapKit

protocol RickyMortyViewControlProtocol {
    func changeLoading(isLoad:Bool)
    func saveData(values: [Result])
}

final class RickyMortyVC: UIViewController {
    private let labelTitle:UILabel = UILabel()
    private let tableView:UITableView = UITableView()
    private let indicator : UIActivityIndicatorView = UIActivityIndicatorView()
    private var results: [Result] = []
    lazy var viewModel:RickyMortyViewModel = RickyMortyViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Configure()
        viewModel.fetchCharacters()
        viewModel.setDelegate(self)
        
    }
    private func drawDesign() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(RickyMortyTableViewCell.self, forCellReuseIdentifier: RickyMortyTableViewCell.Identifier.id.rawValue)
        tableView.rowHeight = self.view.frame.size.height * 0.25
        DispatchQueue.main.async {
            
            self.labelTitle.text = "Ricky and Morty"
            self.labelTitle.font = .boldSystemFont(ofSize: 20)
            self.labelTitle.textColor = .black
            self.view.backgroundColor = .white
            self.tableView.backgroundColor = .red
            self.indicator.startAnimating()
        }
        
    }
    
    private func Configure() {
        
        view.addSubview(labelTitle)
        view.addSubview(tableView)
        view.addSubview(indicator)
        makeLabel()
        makeBox()
        makeIndicator()
        drawDesign()
        
    }
    

}

extension RickyMortyVC:RickyMortyViewControlProtocol {
    func changeLoading(isLoad: Bool) {
        isLoad ? indicator.startAnimating() : indicator.stopAnimating()
    }
    
    func saveData(values: [Result]) {
        results = values
        tableView.reloadData()
    }
    
    
}

extension RickyMortyVC:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RickyMortyTableViewCell.Identifier.id.rawValue) as? RickyMortyTableViewCell else {
            return UITableViewCell()
        }
        cell.saveModel(model: results[indexPath.row])
        
        
        return cell
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
        tableView.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
    }
    
}
        
    


