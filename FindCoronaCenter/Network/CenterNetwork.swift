//
//  CenterNetwork.swift
//  FindCoronaCenter
//
//  Created by seosh on 4/25/22.
//

import Foundation
import Combine

class CenterNetwork {
    private let session: URLSession
    let api = CenterAPI()
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    
    //publisher
    //RxSwift 에서 옵저버블에 해당함
    func getCenterList() -> AnyPublisher<[Center], URLError> {
        guard let url = api.getCenterListComponents().url else { return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.setValue("API Key 를 입력하세요.",
                                 forHTTPHeaderField: "Authorization"
                )
        
        return session.dataTaskPublisher(for: request)
            .tryMap {
                data, response in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw URLError(.unknown)
                }
                
                switch httpResponse.statusCode {
                case 200..<300:
                    return data
                case 400..<500:
                    throw URLError(.clientCertificateRejected)
                case 500..<599:
                    throw URLError(.badServerResponse)
                default:
                    throw URLError(.unknown)
                }
            }
            .decode(type: CenterAPIResponse.self, decoder: JSONDecoder())
            .map { $0.data }
            .mapError { $0 as! URLError }
            .eraseToAnyPublisher()
    }
}
