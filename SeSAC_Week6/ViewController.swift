//
//  ViewController.swift
//  SeSAC_Week6
//
//  Created by Mac Pro 15 on 2022/08/08.
//

import UIKit

import Alamofire
import Kingfisher
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        /*어떤 함수가 먼저 호출될지 알 수 없다.
        //만약 순서대로 네트워크에 요청하고 싶다면?
        
        print(#function, "START")
        requestBlog(query: "고래밥")
        requestBlog(query: "과자")
        print(#function, "END")
         */
    }

    
    //Alamofire+swiftyJSON
    //검색 키워드
    //인증키
    func requestBlog(query: String) {
       
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
