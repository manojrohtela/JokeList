//
//  JokeViewModel.swift
//  JokesApp
//
//  Created by Manoj kumar on 09/06/23.
//

import Foundation
import Combine



class JokeViewModel:ObservableObject {
    @Published var jokes = [String]()
    @Published var loading = false
    let service: ServiceProtocol
    var dispatchSource = DispatchSource.makeTimerSource(queue: .main)
    
    
    init(service: ServiceProtocol = APIService()) {
        self.service = service
        // Check if existing data exist or not
        checkExistingData()
        // setup Time for repeat api call
        setupTimer()
    }
    
    
    // MARK: - Setup Dispatch Source
    private func setupTimer(){
        dispatchSource.schedule(deadline: .now(),repeating: .seconds(AppConstants.timeIntervalForJoke))
        dispatchSource.setEventHandler(handler: self.refresh)
        dispatchSource.activate()
    }
    
    
    // MARK: - Get Existing data
    private func checkExistingData(){
        if let data = DataBaseHandler().getData(key: AppConstants.jokeDataBaseKey) as? [String]{
            self.jokes = data
        }
    }
    
    deinit {
        dispatchSource.cancel()
    }
    
    // MARK: - Refresh Data
    private func refresh() {
        loadData()
    }
    
    
    // MARK: - Call Api and load data
    private func loadData() {
        self.loading = true
        service.fetchJoke(urlStr: Endpoints.getJoke) {[weak self] joke in
                self?.loading = false
                guard let joke = joke else {
                    return
                }
                self?.addJoke(joke)
        }
    }
    
    // MARK: - add new joke to list
    private func addJoke(_ joke: String) {
        if jokes.count >= 10 {
            jokes.removeFirst()
        }
        jokes.append(joke)
        DataBaseHandler().saveData(key: AppConstants.jokeDataBaseKey, value: jokes)
    }
    
}

