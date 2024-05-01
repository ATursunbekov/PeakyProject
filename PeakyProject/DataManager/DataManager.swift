//
//  DataManager.swift
//  PeakyProject
//
//  Created by Alikhan Tursunbekov on 1/5/24.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    private let idsKey = "savedIDs"
    
    private var ids: [String] {
        didSet {
            save(ids: ids)
        }
    }
    
    private init() {
        ids = UserDefaults.standard.array(forKey: idsKey) as? [String] ?? []
    }
    
    private func save(ids: [String]) {
        UserDefaults.standard.set(ids, forKey: idsKey)
        UserDefaults.standard.synchronize()
    }
    
    func fetchIds() -> [String] {
        return ids
    }
    
    func addId(newId: String) {
        if !ids.contains(newId) {
            ids.append(newId)
        }
    }
    
    func removeId(idToRemove: String) {
        ids.removeAll { $0 == idToRemove }
    }
    
    func isIdPresent(_ id: String) -> Bool {
        return ids.contains(id)
    }
}

