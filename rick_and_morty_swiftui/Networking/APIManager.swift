//
//  Networking.swift
//  rick_and_morty_swiftui
//
//  Created by Samantha Cruz on 3/10/23.
//

import Combine
import UIKit

protocol HomeListStore {
    func readLocationList() -> Future<LocationResponse, Failure>
}

protocol ResidentListStore {
    func readResidents(url: String) -> Future<CharacterInfo, Failure>
}

protocol CharacterListStore {
    func readCharacters(url: String) -> Future<CharacterInfo, Failure>
}

final class APIManager {
    
    private func request<T>(for stringURL: String) -> Future<T, Failure> where T : Codable {
        return Future { promise in
            
            guard let url = URL(string: stringURL) else {
                promise(.failure(.urlConstructError))
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
                guard let data = data, case .none = error else { promise(.failure(.urlConstructError)); return }
                do {
                    let decoder = JSONDecoder()
                    let searchResponse = try decoder.decode(T.self, from: data)
                    promise(.success(searchResponse))
                } catch {
                    promise(.failure(.APIError(error)))
                }
            }
            task.resume()
        }
    }
    
    static func fetchImage(imageURL: String) async throws -> UIImage {
        guard let url = URL(string: imageURL) else { throw Failure.urlConstructError }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode,
                  let image = UIImage(data: data), 200...299 ~= statusCode else { throw Failure.statusCode }
            return image
        } catch {
            throw error
        }
    }
}

extension APIManager: HomeListStore {
    func readLocationList() -> Future<LocationResponse, Failure> {
        let url = "https://rickandmortyapi.com/api/location"
        return request(for: url)
    }
}

extension APIManager: ResidentListStore {
    func readResidents(url: String) -> Future<CharacterInfo, Failure> {
        return request(for: url)
    }
}

extension APIManager: CharacterListStore {
    func readCharacters(url: String) -> Future<CharacterInfo, Failure> {
        return request(for: url)
    }
}
