//
//  AmiiboAPI.swift
//  amiiboListVC
//
//  Created by Natthida Kritveeranant on 1/5/2565 BE.
//

import UIKit

final class AmiiboAPI {
    static let shared = AmiiboAPI()

    func fetchAmiiboList(onCompletion: @escaping ([AmiiboEntity]) -> ()) {
        let urlString = "https://www.amiiboapi.com/api/amiibo"
        let url = URL(string: urlString)!

        let task = URLSession.shared.dataTask(with: url) { (data, resp, error) in
            guard let data = data else {
                print("data was nil")
                return
            }

            guard let amiiboList = try? JSONDecoder().decode(AmiiboList.self, from: data) else {
                print("couldn't decode json")
                return
            }

            onCompletion(amiiboList.amiibo)
        }

        task.resume()
    }
}
