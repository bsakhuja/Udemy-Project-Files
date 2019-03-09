//
//  ViewController.swift
//  What Flower
//
//  Created by Brian Sakhuja on 3/7/19.
//  Copyright © 2019 Brian Sakhuja. All rights reserved.
//

import UIKit
import CoreML
import Vision
import Alamofire
import SwiftyJSON
import SDWebImage

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    let baseURL = "https://en.wikipedia.org/w/api.php"
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        
    }

    @IBAction func cameraButtonTapped(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    // Tells the delegate (this view controller) that the user picked an image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let userPickedImage = info[.editedImage] as? UIImage {
            
            guard let userPickedCIImage = CIImage(image: userPickedImage) else {
                fatalError("error converting to ci image")
            }
            
            imageView.image = userPickedImage
            imagePicker.dismiss(animated: true, completion: nil)
            detect(image: userPickedCIImage)
        }
    }
    
    func detect(image: CIImage) {
        guard let model = try? VNCoreMLModel(for: FlowerClassifier().model) else {
            fatalError("can't load ML model")
        }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let classification = request.results?.first as? VNClassificationObservation
                else {
                    fatalError("unexpected result type from VNCoreMLRequest")
            }
            
            DispatchQueue.main.async {
                self.navigationItem.title = classification.identifier.capitalized
            }
            
            let params: [String : String] = ["format" : "json",
                                             "action" : "query",
                                             "prop" : "extracts|pageimages",
                                             "exintro" : "",
                                             "explainText" : "",
                                             "titles" : classification.identifier,
                                             "indexpageids" : "",
                                             "redirects" : "1",
                                             "pithumbsize" : "500"]
            
            self.getFlowerData(url: self.baseURL, parameters: params)
        }
        
        // Handler to process the request
        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
            try handler.perform([request])
        } catch {
            print(error)
        }
    
    }
    
    
    // MARK: - Networking
    
    func getFlowerData(url: String, parameters: [String : String]) {
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON { (response) in
            if response.result.isSuccess {
                print("Got the flower data")
                
                let flowerData: JSON = JSON(response.result.value!)
                
                let pageid = flowerData["query"]["pageids"][0].string!
                let extract = flowerData["query"]["pages"][pageid]["extract"].string!
                let flowerImageURL = flowerData["query"]["pages"][pageid]["thumbnail"]["source"].string!
                self.imageView.sd_setImage(with: URL(fileURLWithPath: flowerImageURL))
                self.label.text = extract
                
            } else {
                print("Failed to get the flower data")
            }
        }
    }

}



