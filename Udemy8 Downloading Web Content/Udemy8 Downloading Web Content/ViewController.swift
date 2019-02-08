//
//  ViewController.swift
//  Udemy8 Downloading Web Content
//
//  Created by Brian Sakhuja on 8/29/18.
//  Copyright © 2018 Brian Sakhuja. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if let url = URL(string: "https://www.stackoverflow.com/")
//        {
//            let request = URLRequest(url: url)
//            webView.load(request)
//
////            webView.loadHTMLString("<h1>Hello</h1>", baseURL: nil)
//        }
        
        if let url = URL(string: "https://www.stackoverflow.com")
        {
            let request = NSMutableURLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request as URLRequest)
            {
                data, response, error in
                if let error = error
                {
                    print(error)
                }
                else
                {
                    if let unwrappedData = data
                    {
                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                        print(dataString)
                        
                        DispatchQueue.main.sync(execute:
                        {
                            //update UI
                        })
                    }
                }
            }
            task.resume()
        }

    }


}

