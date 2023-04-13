import UIKit

func abc() {
    
    guard let url = URL(string: "http://www.gamefocus.co.kr/wys2/file_attach/2023/03/22/1679445327_23084.jpg") else { return }
    
    var urlRequest = URLRequest(url: url)
    
    urlRequest.httpMethod = "GET"
    
    let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
        guard error == nil else { return }
        
        guard let httpURLResponse = response as? HTTPURLResponse, (200...299).contains(httpURLResponse.statusCode) else { return }
        
        guard let validData = data else { return }
        
        let image = UIImage(data: validData)!
        print(image)
    }
    dataTask.resume()
}

abc()
