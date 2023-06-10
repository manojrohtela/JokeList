//
//  JokeViewModel.swift
//  JokesApp
//
//  Created by Mohit Rajpoot on 06/06/23.
//

import Foundation
import Combine
class JokeViewModel {
    private let jokeService = JokeService()
    private var jokes: [Joke] = []
    
    func fetchJokes(completion: @escaping (Result<[Joke], Error>) -> Void) {
        jokeService.fetchJoke { [weak self] result in
            switch result {
            case .success(let joke):
                self?.addJoke(joke)
                completion(.success(self?.jokes ?? []))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func addJoke(_ joke: Joke) {
        if jokes.count >= 10 {
            jokes.removeFirst()
        }
        jokes.append(joke)
    }
}
