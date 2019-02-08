//
//  ViewController.swift
//  Udemy21 APIs
//
//  Created by Brian Sakhuja on 9/25/18.
//  Copyright © 2018 Brian Sakhuja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=bf87b55a7211d6fc63dd20aa44e671af")
        let task = URLSession.shared.dataTask(with: url!, completionHandler:
        { (data, response, error) in
            
            if error != nil
            {
                print(error)
            }
            else
            {
                if let urlContent = data
                {
                    do
                    {
                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers)
                        if let dict = jsonResult["weather"]
                        {
                            
                        }
                    }
                    catch
                    {
                        print("json processing failed")
                    }
                    
                    
                }
            }
            
        
        })
        
        task.resume()
    }


}

