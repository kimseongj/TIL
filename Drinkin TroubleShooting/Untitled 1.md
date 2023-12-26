```swift

//    func fetchData<T: Decodable>(endpoint: EndpointMakeable, parser: Parser<T>, completion: @escaping (T) -> Void) {
//        guard var request = endpoint.makeURLRequest() else { return }
//        if endpoint.method == "POST" {
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        }
//
//        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard error == nil else { return }
//
//            guard let httpURLResponse = response as? HTTPURLResponse, (200...299).contains(httpURLResponse.statusCode) else {
//                print(response)
//                return }
//
//            print(httpURLResponse.statusCode)
//
//            guard let validData = data, let parsedData = parser.parse(data: validData) else { return }
//            completion(parsedData)
//        }
//        dataTask.resume()
//    }

```

Login Provider



트라이드 칵테일 셀 폰트

리커멘드 칵테일 버튼 폰트