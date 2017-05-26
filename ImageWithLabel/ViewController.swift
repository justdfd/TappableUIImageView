//
//  ViewController.swift
//  ImageWithLabel
//
//  Created by Dave Dombrowski on 10/23/16.
//  Copyright © 2016 justDFD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: ImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

class ImageView: UIImageView {
    
    let tapGesture = UITapGestureRecognizer()
    
    let redLayer = CATextLayer()
    var redHitCounter:Int = 0
    let greenLayer = CATextLayer()
    var greenHitCounter:Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpClickableLayers()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpClickableLayers()
    }
    
    private func setUpClickableLayers() {
        
        self.isUserInteractionEnabled = true
        
        tapGesture.numberOfTapsRequired = 1
        tapGesture.addTarget(self, action: #selector(changeText))
        self.addGestureRecognizer(tapGesture)
        
        redLayer.frame = CGRect(x: 40, y: 40, width: 100, height: 40)
        redLayer.backgroundColor = UIColor.red.cgColor
        redLayer.string = String(redHitCounter)
        redLayer.alignmentMode = kCAAlignmentCenter
        self.layer.addSublayer(redLayer)
        
        greenLayer.frame = CGRect(x: 40, y: 140, width: 100, height: 40)
        greenLayer.backgroundColor = UIColor.green.cgColor
        greenLayer.string = String(redHitCounter)
        greenLayer.alignmentMode = kCAAlignmentCenter
        self.layer.addSublayer(greenLayer)
    }
    
    internal func changeText(_ recognizer:UITapGestureRecognizer) {
        let p = recognizer.location(in: self)
        if redLayer.hitTest(p) != nil {
            redHitCounter += 1
            redLayer.string = String(redHitCounter)
        } else if greenLayer.hitTest(p) != nil {
            greenHitCounter += 1
            greenLayer.string = String(greenHitCounter)
        }
        //self.setNeedsDisplay()
    }
}
