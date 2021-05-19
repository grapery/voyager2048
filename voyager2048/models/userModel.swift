//
//  userModel.swift
//  voyager2048
//
//  Created by YananSuo on 2021/5/18.
//

import Foundation

struct UserModel: Hashable, Codable, Identifiable {
    var id: Int
    var thumbnail: String
    var title: String
    var description: String
}

let userData:[UserModel] = load("user.json")

func load<T:Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
