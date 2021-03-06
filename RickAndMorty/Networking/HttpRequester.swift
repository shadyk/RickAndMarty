//
//  Created by Shady
//  All rights reserved.
//  

import Foundation

enum APIError: Error {
    case httpError(_ response: String)
}
typealias RemoteCompeltion<T: Decodable> = (T) -> Void
typealias ErrorHandler = (String) -> Void

class HttpRequester {
    var urlSession =  URLSession.shared
    private let PROTOCOL = "https"
    private let DOMAIN = "api"
    private let HOST = Bundle.main.infoDictionary!["APP_HOST"] as! String
    private var MAIN_URL: String {
        return PROTOCOL + "://" + HOST + "/" +  DOMAIN + "/"
    }
    
    func get<T: Decodable>(endPoint: String, queryItems: [URLQueryItem]? = nil, remoteObject: T.Type, success: @escaping RemoteCompeltion<T>, fail: @escaping ErrorHandler) {
        var components = URLComponents()
        components.scheme = PROTOCOL
        components.host = HOST
        components.path = endPoint
        if let items = queryItems{
            components.queryItems = items
        }
        guard let url = components.url else {
            fatalError("URL not defined correcly: \(components.url!.path)")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        urlSession.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if error != nil {
                    fail(String(describing: error))
                }
                else if (response as! HTTPURLResponse).statusCode != 200 {
                    fail("Status code : \((response as! HTTPURLResponse).statusCode)")
                }
                else if let data = data {
                    do {
                        let decoded = try JSONDecoder().decode(remoteObject, from: data)
                        success(decoded)
                    } catch {
                        fail("Unable to Decode Response \(error)")
                    }
                }
            }
        }.resume()
    }
}
