//
//  ViewController.swift
//  testJson
//
//  Created by kimseongjun on 2023/03/20.
//

import UIKit

//class ViewController: UIViewController {
//    let jsonDecoder = JSONDecoder()
//    var resultss = Results(boxOfficeResult: .init(boxOfficeType: "", showRange: ""))
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        print(jsonDecoding().boxOfficeResult.boxOfficeType)
//    }
//
//    func jsonDecoding() -> Results {
//        guard let jsonData: NSDataAsset = NSDataAsset(name: "test") else {
//            print("jsonData 없음")
//            return resultss
//        }
//                do {
//                    resultss = try jsonDecoder.decode(Results.self, from: jsonData.data)
//                    return resultss
//                } catch {
//                    print("decode없음")
//                    return resultss
//                }
//    }
//
//}
//
//struct Results: Decodable {
//    let boxOfficeResult: Resultss
//}
//
//struct Resultss: Decodable {
//    let boxOfficeType: String
//    let showRange: String
//}


class ViewController: UIViewController {
    let jsonDecoder = JSONDecoder()
    var resultss = BoxOffice(boxOfficeResult: .init(boxofficeType: "", showRange: "", dailyBoxOfficeList: []))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(jsonDecoding().boxOfficeResult.showRange)
    }

    func jsonDecoding() -> BoxOffice {
        guard let jsonData: NSDataAsset = NSDataAsset(name: "box_office_sample") else {
            print("jsonData 없음")
            return resultss
        }
                do {
                    resultss = try jsonDecoder.decode(BoxOffice.self, from: jsonData.data)
                    return resultss
                } catch {
                    print("decode없음")
                    return resultss
                }
    }

}

struct BoxOffice: Decodable {
    let boxOfficeResult: BoxOfficeResult
}
   
struct BoxOfficeResult: Decodable {
    let boxofficeType: String
    let showRange: String
    let dailyBoxOfficeList: [DailyBoxOfficeList]
    
//    private enum CodingKeys: String, CodingKey {
//        case boxOfficeType = "boxofficeType"
//        case showRange
//        case dailyBoxOfficeList
//    }
}

struct DailyBoxOfficeList: Decodable {
    let rnum: String
    let rank: String
    let rankInten: String
    let rankOldAndNew: String
    let movieCd: String
    let movieNm: String
    let openDt: String
    let salesAmt: String
    let salesShare: String
    let salesInten: String
    let salesChange: String
    let salesAcc: String
    let audiCnt: String
    let audiInten: String
    let audiChange: String
    let audiAcc: String
    let scrnCnt: String
    let showCnt: String
}
