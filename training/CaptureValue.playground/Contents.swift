//import Foundation
//
//// MARK: - Welcome
//struct Welcome: Codable {
//    let movieInfoResult: MovieInfoResult
//}
//
//// MARK: - MovieInfoResult
//struct MovieInfoResult: Codable {
//    let movieInfo: MovieInfo
//    let source: String
//}
//
//// MARK: - MovieInfo
//struct MovieInfo: Codable {
//    let movieCD, movieNm, movieNmEn, movieNmOg: String
//    let showTm, prdtYear, openDt, prdtStatNm: String
//    let typeNm: String
//    let nations: [Nation]
//    let genres: [Genre]
//    let directors: [Director]
//    let actors: [Actor]
//    let showTypes: [ShowType]
//    let companys: [Company]
//    let audits: [Audit]
//    let staffs: [Staff]
//
//    enum CodingKeys: String, CodingKey {
//        case movieCD = "movieCd"
//        case movieNm, movieNmEn, movieNmOg, showTm, prdtYear, openDt, prdtStatNm, typeNm, nations, genres, directors, actors, showTypes, companys, audits, staffs
//    }
//}
//
//// MARK: - Actor
//struct Actor: Codable {
//    let peopleNm, peopleNmEn, cast, castEn: String
//}
//
//// MARK: - Audit
//struct Audit: Codable {
//    let auditNo, watchGradeNm: String
//}
//
//// MARK: - Company
//struct Company: Codable {
//    let companyCD, companyNm, companyNmEn, companyPartNm: String
//
//    enum CodingKeys: String, CodingKey {
//        case companyCD = "companyCd"
//        case companyNm, companyNmEn, companyPartNm
//    }
//}
//
//// MARK: - Director
//struct Director: Codable {
//    let peopleNm, peopleNmEn: String
//}
//
//// MARK: - Genre
//struct Genre: Codable {
//    let genreNm: String
//}
//
//// MARK: - Nation
//struct Nation: Codable {
//    let nationNm: String
//}
//
//// MARK: - ShowType
//struct ShowType: Codable {
//    let showTypeGroupNm, showTypeNm: String
//}
//
//// MARK: - Staff
//struct Staff: Codable {
//    let peopleNm, peopleNmEn, staffRoleNm: String
//}
// enum
import Foundation

struct MovieDetail: Decodable {
    let movieInformationResult: MovieInformationResult
    
    private enum CodingKeys: String, CodingKey {
        case movieInformationResult = "movieInfoResult"
    }
}

struct MovieInformationResult: Decodable {
    let movieInformation: MovieInformation
    let source: String
    
    private enum CodingKeys: String, CodingKey {
        case movieInformation = "movieInfo"
        case source
    }
}

struct MovieInformation: Decodable {
    let movieCode: String
    let movieName: String
    let movieNameEnglish: String
    let originalMovieName: String
    let showTime: String
    let productYear: String
    let openDate: String
    let productStateName: String
    let movieTypeName: String
    let nations: [Nation]
    let genres: [Genre]
    let directors: [Director]
    let actors: [Actor]
    let showTypes: [ShowType]
    let companys: [Company]
    let audits: [Audit]
    let staffs: [Staff]
    
    
    private enum CodingKeys: String, CodingKey {
        case movieCode = "movieCd"
        case movieName = "movieNm"
        case movieNameEnglish = "movieNmEn"
        case originalMovieName = "movieNmOg"
        case showTime = "showTm"
        case productYear = "prdtYear"
        case openDate = "openDt"
        case productStateName = "prdtStatNm"
        case movieTypeName = "typeNm"
        case nations
        case genres
        case directors
        case actors
        case showTypes
        case companys
        case audits
        case staffs
    }
}

struct Nation: Decodable {
    let nationName: String
    
    private enum CodingKeys: String, CodingKey {
        case nationName = "nationNm"
    }
}

struct Genre: Decodable {
    let genreName: String
    
    private enum CodingKeys: String, CodingKey {
        case genreName = "genreNm"
    }
}

struct Director: Decodable {
    let peopleName: String
    let peopleNameEnglish: String
    
    private enum CodingKeys: String, CodingKey {
        case peopleName = "peopleNm"
        case peopleNameEnglish = "peopleNmEn"
    }
}

struct Actor: Decodable {
    let peopleName: String
    let peopleNameEnglish: String
    let cast: String
    let castEnglish: String
    
    private enum CodingKeys: String, CodingKey {
        case peopleName = "peopleNm"
        case peopleNameEnglish = "peopleNmEn"
        case cast
        case castEnglish = "castEn"
    }
    
}

struct ShowType: Decodable {
    let showTypeGroupName: String
    let showTypeName: String
    
    private enum CodingKeys: String, CodingKey {
        case showTypeGroupName = "showTypeGroupNm"
        case showTypeName = "showTypeNm"
    }
}

struct Company: Decodable {
    let companyCode: String
    let companyName: String
    let companyNameEnglish: String
    let companyPartName: String
    
    private enum CodingKeys: String, CodingKey {
        case companyCode = "companyCd"
        case companyName = "companyNm"
        case companyNameEnglish = "companyNmEn"
        case companyPartName = "companyPartNm"
    }
}

struct Audit: Decodable {
    let auditNumber: String
    let watchGradeName: String
    
    private enum CodingKeys: String, CodingKey {
        case auditNumber = "auditNo"
        case watchGradeName = "watchGradeNm"
        
    }
}

struct Staff: Decodable {
    let peopleName: String
    let peopleNameEnglish: String
    let staffRoleName: String
    
    private enum CodingKeys: String, CodingKey {
        case peopleName = "peopleNm"
        case peopleNameEnglish = "peopleNmEn"
        case staffRoleName = "staffRoleNm"
    }
}






//API

import Foundation

struct DailyBoxOfficeAPI {
    
    var delegate: BoxOfficeDelegate?
    
    func loadDailyBoxOffice<T: Decodable>(parserType: Parser<T>) { // MovieDetail, DailyBoxOffice
        
        
        guard let url = URL(string: "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=f5eef3421c602c6cb7ea224104795888&movieCd=20124079") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let validData = data else { return }
            
            let parsedData = parserType.parse(data: validData)
            
            guard let httpURLResponse = response as? HTTPURLResponse, (200...299).contains(httpURLResponse.statusCode) else {
                print("response")
                return
            }
        }.resume()
    }
}

// 일별 박스오피스 : http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=20120101
// 영화 상세 : "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=f5eef3421c602c6cb7ea224104795888&movieCd=20124079"

//viewcontroller


import Foundation
protocol ArticleModelProtocol {
    func articlesRetrieved(articles:[Article])
}
class ArticleModel {
    
    var delegate:ArticleModelProtocol?
    
    func getArticles() {
        
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=bb8e4fcfd4bc4ea4a1ba2b1b105a592f"
        
        let url = URL(string: urlString)
        
        guard url != nil else {
            print("Couldn't create url object")
            return
        }
        
        let session = URLSession.shared
        
        let datatask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                let decoder = JSONDecoder()
                
                do{
                    
                    let articleService = try decoder.decode(ArticleService.self, from: data!)
                    
                    DispatchQueue.main.async {
                        self.delegate?.articlesRetrieved(articles: articleService.articles!)
                    }
                    
                }
                catch {
                    print("Error parsing the json")
                }
                
            }
        }
        // 11. datatask 준비가 완료되었다면 datatask를 실행시켜줍니다.
        datatask.resume()
    }
}

df
