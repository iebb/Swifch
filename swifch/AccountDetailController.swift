//
//  ViewController.swift
//  swifch
//
//  Created by Jebwiz Oscar on 2018/5/16.
//  Copyright © 2018 Jebwiz Oscar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var accountTitleEdit: UITextField!
    @IBOutlet weak var accountKeyView: UITextView!
    @IBOutlet weak var accountPasswordView: UITextView!
    @IBOutlet weak var accountQR: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accountQR.layer.magnificationFilter = kCAFilterNearest
        accountQR.layer.shouldRasterize = true
        accountQR.image = UIImage(ciImage: generateQRImage(text: "String"))
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func generateQRImage(text: String) -> CIImage {
        let data = text.data(using: String.Encoding.utf8, allowLossyConversion: false)
        let filter = CIFilter(name: "CIQRCodeGenerator")
        filter?.setValue(data, forKey: "inputMessage")
        filter?.setValue("Q", forKey: "inputCorrectionLevel")
        let qrcodeImage = filter?.outputImage
        return qrcodeImage!
    }
    
    
    @IBAction func titieEditEnd(_ sender: UITextField) {
        let editedTitle = sender.text;
        
        // create the alert
        let alert = UIAlertController(title: "My Title", message: editedTitle, preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    

}

