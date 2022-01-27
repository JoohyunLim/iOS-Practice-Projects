//
//  DetailController.swift
//  Movie
//
//  Created by mac13 on 2021/06/09.
//

import UIKit

class DetailController: UIViewController {

    @IBOutlet var webView: UIWebView!
    var mUrl: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.loadRequest(URLRequest(url:URL(string: "https://movie.naver.com/"+mUrl)! as URL))
    }
    

}
