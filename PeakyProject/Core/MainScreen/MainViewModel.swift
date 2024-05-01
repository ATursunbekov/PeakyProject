//
//  MainViewModel.swift
//  PeakyProject
//
//  Created by Alikhan Tursunbekov on 30/4/24.
//

import Foundation

protocol MainViewDelegate: AnyObject {
    func updateData()
}

protocol MainViewModelProtocol {
    var allNews: [ResultsModel] {get set}
    var nextPageID: String? {get set}
    var delegate: MainViewDelegate? {get set}
    
    func getNews()
    func goToNextPage()
}

class MainViewModel: MainViewModelProtocol {
    var allNews: [ResultsModel] = []
    var nextPageID: String?
    var delegate: MainViewDelegate?
    
    func getNews() {
        NetworkService.shared.sendRequest(successModelType: NewsModel.self, endpoint: MultiTarget(NewsAPI.getNews)) { [weak self] result in
            guard let self else { return }
            switch result {
            case let .success(response):
                allNews = response.results
                nextPageID = response.nextPage
                DispatchQueue.main.async {
                    self.delegate?.updateData()
                }
            case let .failure(error):
                print("handle error: \(error)")
            }
        }
    }
    
    func goToNextPage() {
        if let page = nextPageID {
            NetworkService.shared.sendRequest(successModelType: NewsModel.self, endpoint: MultiTarget(NewsAPI.getNextPage(page: page))) { [weak self] result in
                guard let self else { return }
                switch result {
                case let .success(response):
                    allNews = response.results
                    nextPageID = response.nextPage
                    DispatchQueue.main.async {
                        self.delegate?.updateData()
                    }
                case let .failure(error):
                    print("handle error: \(error)")
                }
            }
        }
    }
}
