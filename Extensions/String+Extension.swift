//
//  String+Extension.swift
//  RickAndMortyApp-MVVM
//
//  Created by Mehmet Bilir on 15.06.2022.
//

import Foundation

extension String {
    var asURL: URL? {
        return URL(string: self)
    }
}
