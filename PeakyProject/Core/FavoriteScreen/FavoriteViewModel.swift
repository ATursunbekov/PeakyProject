//
//  FavoriteViewModel.swift
//  PeakyProject
//
//  Created by Alikhan Tursunbekov on 1/5/24.
//

import Foundation

protocol FavoriteViewDelegate: AnyObject {
    func updateData()
}

protocol FavoriteViewModelProtocol {
    var allNews: [ResultsModel] {get set}
    var nextPageID: String? {get set}
    var delegate: FavoriteViewDelegate? {get set}
    
    func getNews()
}

class FavoriteViewModel: FavoriteViewModelProtocol {
    var allNews: [ResultsModel] = []
    var nextPageID: String?
    var delegate: FavoriteViewDelegate?
    
    func getNews() {
        NetworkService.shared.sendRequest(successModelType: NewsModel.self, endpoint: MultiTarget(NewsAPI.getSpecificNews(ids: DataManager.shared.fetchIds()))) { [weak self] result in
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
