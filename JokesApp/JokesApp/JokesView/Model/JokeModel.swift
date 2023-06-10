//
//  JokeModel.swift
//  JokesApp
//
//  Created by Mohit Rajpoot on 06/06/23.
//

import Foundation
struct Joke {
    let text: String
}

class JokeService {
    func fetchJoke(completion: @escaping (Result<Joke, Error>) -> Void) {
        guard let url = URL(string: "https://geek-jokes.sameerkumar.website/api") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data, let jokeText = String(data: data, encoding: .utf8) {
                let joke = Joke(text: jokeText)
                completion(.success(joke))
            } else {
                completion(.failure(NSError(domain: "Invalid response data", code: 0, userInfo: nil)))
            }
        }
        
        task.resume()
    }
}
