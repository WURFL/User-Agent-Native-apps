//
//  ViewController.swift
//  NonWVApp-SWIFT
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userAgent = UAString()
        if let url = NSURL(string: "https://www.scientiamobile.com/page/wp-content/uploads/2017/02/HomePage-Demo-Woman-iPad-Redov3.png") {
            let request = NSMutableURLRequest(url: url as URL)
            request.setValue(userAgent, forHTTPHeaderField: "User-Agent")
            let session = URLSession.shared
            session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
                if let imageData = data {
                    let image = UIImage(data: imageData)
                    var imageViewObject :UIImageView
                    imageViewObject = UIImageView()
                    imageViewObject.frame = UIScreen.main.bounds
                    imageViewObject.contentMode = UIViewContentMode.scaleAspectFit
                    imageViewObject.image = image
                    self.view.addSubview(imageViewObject)
                }
            }.resume()
            print(UAString())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

