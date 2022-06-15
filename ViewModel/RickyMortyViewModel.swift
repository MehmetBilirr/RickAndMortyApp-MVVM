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
    func fetchCharacters()
    func changeLoading()
    
    
}

class RickyMortyViewModel:RickyMortyViewModelProtocol {
    var rickyMortyCharacters: [Result] = []
    
    let rickyMortyService: RickyMortyService
    init() {
        rickyMortyService = RickyMortyService()
    }
    
    func fetchCharacters() {
        changeLoading()
        rickyMortyService.fetchCharacters { result in
            changeLoading()
            self.rickyMortyCharacters = result ?? []
        }
    }
    
    func changeLoading() {
        
    }
    

    
    
}
