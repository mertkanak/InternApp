////
////  OpenAIServic.swift
////  InternApp
////
////  Created by mert Kanak on 17.08.2023.
////
//
//import Foundation
//import Alamofire
//import Combine
//
//class OpenAIService {
//    let baseUrl = "https://api.openai.com/v1/"
//    
//    func sendMessage(message: String) -> AnyPublisher<OpenAICompletionsResponse, Error> {
//        let body = OpenAICompletionsBody(model: "gpt-3.5-turbo", prompt: message, temperature: 0.7)
//        
//        let headers: HTTPHeaders = [
//            "Authorization" : "Bearer \(Constants.apiKey)"
//        ]
//        
//        return Future { [weak self] promise in
//            guard let self = self else { return }
//            AF.request(self.baseUrl + "completions", method: .post, parameters: body, encoder: .json, headers: headers).responseDecodable(of: OpenAICompletionsResponse.self) { response in
//                switch response.result {
//                    case .success(let result):
//                        promise(.success(result))
//                    case .failure(let error):
//                        promise(.failure(error))
//                }
//            }
//        }
//        .eraseToAnyPublisher()
//    }
//}
