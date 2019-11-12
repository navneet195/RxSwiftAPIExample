//
//  APIClient.swift
//  RxSwiftAPIExample
//
//  Created by Navnit Baldha on 18/10/19.
//  Copyright © 2019 Navneet. All rights reserved.
//

import Foundation
import RxSwift

class APIClient {
    
    // RxSWift API Callback
    private let baseURL = URL(string: Constants.apiUrl + Constants.versionApi + appSecretKey)!
    
    func send<ArticleModel: Decodable>(apiRequest: APIRequest) -> Observable<[ArticleModel]> {
        return Observable<[ArticleModel]>.create { [unowned self] observer in
            let request = apiRequest.request(with: self.baseURL)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                guard let dataResponse = data,
                    error == nil else {
                        print(error?.localizedDescription ?? "Response Error")
                        return }
                do {
                    let decoder = JSONDecoder()
                    let model:[ArticleModel] = try decoder.decode(ResponseModel.self, from:
                        dataResponse).results as! [ArticleModel] //Decode JSON Response Data
                    observer.onNext(model)
                } catch let error {
                    observer.onError(error)
                }
                observer.onCompleted()
                
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}

