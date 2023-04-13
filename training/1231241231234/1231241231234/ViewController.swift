//
//  ViewController.swift
//  1231241231234
//
//  Created by kimseongjun on 2023/04/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    func abc() {
        
        guard let url = URL(string: "http://www.gamefocus.co.kr/wys2/file_attach/2023/03/22/1679445327_23084.jpg") else { return }
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else { return }
            
            guard let httpURLResponse = response as? HTTPURLResponse, (200...299).contains(httpURLResponse.statusCode) else { return }
            
            guard let validData = data else { return }
            
            let image = UIImage(data: validData)!
            
            DispatchQueue.main.sync {
                self.imageView.image = image
            }
            
        }
        dataTask.resume()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        abc()
        
    }


}

