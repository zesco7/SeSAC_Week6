//
//  EndPoint.swift
//  SeSAC_Week6
//
//  Created by Mac Pro 15 on 2022/08/08.
//

import Foundation

enum EndPoint {
    
    //타입프로퍼티로 구현
    //static let blog = "\(URL.baseURL)" + "blog"
    //static let cafe = "https://dapi.kakao.com/v2/search/cafe"
    
    //열거형으로 구현
    case blog
    case cafe
    
    var requestURL: String {
        switch self {
        case .blog:
            return URL.makeEndPointString("blog?query=")
            
        case .cafe:
            return URL.makeEndPointString("cafe?query=")
        }
    }
    
}
