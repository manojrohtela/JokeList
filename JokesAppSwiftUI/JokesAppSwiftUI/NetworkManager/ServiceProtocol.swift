//
//  ServiceProtocol.swift
//  JokesAppSwiftUI
//
//  Created by Manoj kumar on 09/06/23.
//

import Foundation
protocol ServiceProtocol {
    func fetchJoke(urlStr:String,completion: @escaping (String?) -> Void)
}
