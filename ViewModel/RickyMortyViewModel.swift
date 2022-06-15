//
//  RickyMortyViewModel.swift
//  RickAndMortyApp-MVVM
//
//  Created by Mehmet Bilir on 15.06.2022.
//

import Foundation

protocol RickyMortyViewModelProtocol {
    
    var rickyMortyCharacters: [Result] {get set}
    var rickyMortyService: RickyMortyService {get}
    var rickyMortyVCDelegate:RickyMortyViewControlProtocol? {get}
    func fetchCharacters()
    func changeLoading()
    func setDelegate(output:RickyMortyViewControlProtocol)
    
    
}

final class RickyMortyViewModel:RickyMortyViewModelProtocol {
    var rickyMortyVCDelegate: RickyMortyViewControlProtocol?
    
    func setDelegate(output: RickyMortyViewControlProtocol) {
        self.rickyMortyVCDelegate = output
    }
    
    var rickyMortyCharacters: [Result] = []
    private var isLoading = false 
    let rickyMortyService: RickyMortyService
    init() {
        rickyMortyService = RickyMortyService()
    }
    
    func fetchCharacters() {
        self.changeLoading()
        rickyMortyService.fetchCharacters { [weak self] result in
            self?.changeLoading()
            self?.rickyMortyCharacters = result ?? []
            self?.rickyMortyVCDelegate?.saveData(values: self?.rickyMortyCharacters ?? [])
        }
    }
    
    func changeLoading() {
        isLoading = !isLoading
        rickyMortyVCDelegate?.changeLoading(isLoad: isLoading)
        
    }
    

    
    
}
