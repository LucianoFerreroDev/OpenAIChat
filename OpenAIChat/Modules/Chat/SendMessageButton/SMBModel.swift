//
//  SMBModel.swift
//  OpenAIChat
//
//  Created by Luciano Ferrero on 29/2/24.
//

import Foundation
import CoreData

class SMBModel{
    let apiResponsePersistence = ApiResponsePersistence.shared
    
    enum Header: String{
        case baseUrl = "https://api.openai.com/v1/chat/completions"
    }
    //Esta funcion recibe un Mensaje, hace el post en la api, convierte la respuesta de la api a la entidad ApiResponse y por ultimo agrega esta a un array el ucal pasamos por parametro
//    func performRequest(_ message: [Message], arrayMessage: inout [ApiResponse]){
//        //seting parameters values
//        let parameters = "model: gpt-3.5-turbo-0125 messages: role: user, content: \(message) max_tokens: 256"
//        let data = try! JSONEncoder().encode(parameters)
//        print(data)
//        //request body
//        var request = URLRequest(url: URL(string: Header.baseUrl.rawValue)!)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.setValue("Bearer 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", forHTTPHeaderField: "Authorization")
//        request.httpBody = data
//
//        let decoder = JSONDecoder()
//        decoder.dateDecodingStrategy = .iso8601
//        decoder.userInfo[CodingUserInfoKey.managedObjectContextAR] = apiResponsePersistence.container.viewContext
//
//        let task = URLSession.shared.dataTask(with: request){ data, response, error in
//            if let data = data{
//                if let decodedData = try? decoder.decode([ApiResponse].self, from: data){
//                    DispatchQueue.main.async {
//                        arrayMessage.append(contentsOf: decodedData)
//                    }
//                }
//            }
//            if let error = error{
//                print(error.localizedDescription)
//            }
//        }
//        task.resume()
//    }

}
