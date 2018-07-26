//
//  ViewController.swift
//  unko
//
//  Created by msatoru on 2018/06/21.
//  Copyright © 2018年 msatoru. All rights reserved.
//

import UIKit
import APIKit
import Himotoki

protocol UnkoBaseRequest: Request {
    
}

extension UnkoBaseRequest where Response: Himotoki.Decodable {
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        return try Response.decodeValue(object)
    }
}

struct UnkoRequest: UnkoBaseRequest {
    typealias Response = Unko
    
    var baseURL: URL {
        return URL(string: "https://bgxs51tize.execute-api.ap-northeast-1.amazonaws.com")!
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return "/bata"
    }

}

struct Unko: Himotoki.Decodable {
    let text: String
    
    static func decode(_ e: Extractor) throws -> Unko {
        return try Unko(
            text: e.value("text"))
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var unkoResult: UILabel!
    @IBOutlet weak var unkoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        unkoButton.layer.borderColor = UIColor.brown.cgColor
        unkoButton.layer.borderWidth = 5
        unkoButton.layer.cornerRadius = 30
        
        unkoResult.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func unkoAction(_ sender: Any) {
        let apiRequest = UnkoRequest()

        Session.send(apiRequest) { result in
            self.unkoResult.isHidden = false
            switch result {
            case .success(let unko):
                if unko.text == "full" {
                    self.unkoResult.text = "いっぱいだよ🚽"
                }else{
                    self.unkoResult.text = "空いているよ🔜"
                }
            case .failure( _):
                self.unkoResult.text = "エラーだよ"
            }
        }
    }
}

