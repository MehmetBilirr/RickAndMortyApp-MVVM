//
//  String+Extension.swift
//  RickAndMortyApp-MVVM
//
//  Created by Mehmet Bilir on 15.06.2022.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
