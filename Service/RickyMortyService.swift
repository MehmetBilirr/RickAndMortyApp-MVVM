//
//  RickyMortyService.swift
//  RickAndMortyApp-MVVM
//
//  Created by Mehmet Bilir on 15.06.2022.
//

import Foundation
import Alamofire


protocol RickyMortyServiceProtocol {
    func fetchCharacters(response:@escaping ([Result]?) -> Void)
}


class RickyMortyService:RickyMortyServiceProtocol {
    func fetchCharacters(response:@escaping ([Result]?) -> Void) {
        AF.request(Route.baseUrl + Route.description).responseDecodable(of: Welcome.self) { model in
            
            guard let data = model.value else {
                response(nil)
                return
            }
            
            response(data.results)
        }
    }
    
    
    
}
