//
//  URLManger.swift
//  URLSessionTraining
//
//  Created by kimseongjun on 2023/03/25.
//

import UIKit

struct URLManager {
    func loadAPI() {
        guard let url = URL(string: "https://openmarket.yagom-academy.kr/api/products?page_no=1&items_per_page=100") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("error")
                return }
            
            guard let httpURLResponse = response as? HTTPURLResponse, (200...299).contains(httpURLResponse.statusCode) else {
                print("resonse")
                return }
            print(data)
            
        }.resume()
    }
    
    func sendAPI() {
        
        let parameters = [
          [
            "key": "params",
            "value": "{ \"name\": \"ttt\", \"description\": \"t1t1t1\", \"price\": 10000, \"currency\":  \"KRW\", \"discounted_price\":  500, \"stock\":  1234567, \"secret\": \"soobak1234\" }",
            "type": "text",
            "contentType": "application/json"
          ],
          [
            "key": "images",
            "src": "image.png",
            "type": "file"
          ]] as [[String : Any]]
        
        let boundary = "Boundary-\(UUID().uuidString)"
        var body = ""
        var error: Error? = nil
        
        for param in parameters {
          if param["disabled"] == nil {
            let paramName = param["key"]!
            body += "--\(boundary)\r\n"
            body += "Content-Disposition:form-data; name=\"\(paramName)\""
            if param["contentType"] != nil {
              body += "\r\nContent-Type: \(param["contentType"] as! String)"
            }
            let paramType = param["type"] as! String
            if paramType == "text" {
              let paramValue = param["value"] as! String
              body += "\r\n\r\n\(paramValue)\r\n"
            } else {
                let fileData = try! NSData(contentsOfFile: URL(fileURLWithPath: "https://user-images.githubusercontent.com/88870642/227688946-e50847f4-723a-4ae3-badf-6cdbfebd7268.png"))
              let fileContent = String(data: fileData, encoding: .utf8)!
              body += "; filename=\"imagep\"\r\n"
                + "Content-Type: \"content-type header\"\r\n\r\n\(fileContent)\r\n"
            }
          }
        }
        body += "--\(boundary)--\r\n";
        let postData = body.data(using: .utf8)

        var request = URLRequest(url: URL(string: "https://{{host}}/api/products")!,timeoutInterval: Double.infinity)
        request.addValue("c5b13912-43b9-11ed-8b9b-0956155ef06a", forHTTPHeaderField: "identifier")
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()
    }
}
