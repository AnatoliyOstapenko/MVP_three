//
//  NetworkService.swift
//  MVP_three
//
//  Created by AnatoliiOstapenko on 20.03.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func getData(completion: @escaping (Result <[UserModel?], Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func getData(completion: @escaping (Result<[UserModel?], Error>) -> Void) {
        guard let url = URL(string: Constants.urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard error == nil, let data = data else { return }
            do {
                let decodedData = try JSONDecoder().decode([UserModel].self, from: data)
                completion(.success(decodedData))
            } catch { completion(.failure(error))}
        }
        task.resume()
    }
    
    
}
