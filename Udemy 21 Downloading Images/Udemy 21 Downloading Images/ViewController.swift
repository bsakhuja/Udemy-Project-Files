//
//  ViewController.swift
//  Udemy 21 Downloading Images
//
//  Created by Brian Sakhuja on 9/24/18.
//  Copyright © 2018 Brian Sakhuja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let url = URL(string: "https://i.imgur.com/Y6SNCRM.jpg")!
        let request = NSMutableURLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request as URLRequest)
        {
            data, response, error in
            if error != nil
            {
                print(error)
            }
            else
            {
                if let data = data
                {
                    if let image = UIImage(data: data)
                    {
                        //                        self.imageView.image = image
                        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
                        if documentsPath.count > 0
                        {
                            let documentsDirectory = documentsPath[0]
                            
//                            let savePath = documentsDirectory + "/bach.jpg"
//                            do
//                            {
//                                try UIImage.jpegData(image)
//                            }
//                            catch
//                            {
//                                // process error
//                            }
                            
                        }
                    }
                }
            }
            
        }
        
        task.resume()
    }
    
    
}

