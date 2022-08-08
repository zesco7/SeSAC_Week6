//
//  KakaoAPIManager.swift
//  SeSAC_Week6
//
//  Created by Mac Pro 15 on 2022/08/08.
//

import Foundation

import Alamofire
import SwiftyJSON

class KakaoAPIManager {
    static let shared = KakaoAPIManager()
    
    private init() {}
    
    let header: HTTPHeaders = ["Authorization": "KakaoAK \(APIKey.kakao)"]
    
    
    func callRequest(query: String) {
       
        //쿼리가 한글일 때도 인식하게 만드는 구문 추가(addingPercentEncoding)
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        let url = EndPoint.blog.requestURL + query
        let header: HTTPHeaders = ["Authorization": "KakaoAK \(APIKey.kakao)"]

        AF.request(url, method: .get, headers: header).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
            case .failure(let error):
                print(error)
                
            }
        
    }
}
}
