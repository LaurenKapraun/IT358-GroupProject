//
//  ViewController.swift
//  Prospective_Job_App
//
//  Created by Lauren Kapraun on 3/27/20.
//  Copyright © 2020 ilstu.edu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

// UI Button Styles
@IBDesignable class RoundButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    func sharedInit() {
        refreshCorners(value: cornerRadius)
        refreshColor(color: customBGColor)
        
        //Border Styles
        refreshBorderColor(_colorBorder: customBorderColor)
        refreshBorder(_borderWidth: borderWidth)
        self.tintColor = UIColor.white
    }
    
    // Border Radius
    func refreshCorners(value: CGFloat) {
        layer.cornerRadius = value
    }
    
    // Border Radius
    @IBInspectable var cornerRadius: CGFloat = 15 {
        didSet {
            refreshCorners(value: cornerRadius)
        }
    }
    
    // Create a Colored UIImage
    func createImage(color: UIColor) -> UIImage {
        //creates a blank 1x1 pixel graphics buffer in memory
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 1), true, 0.0)
        
        //sets the color for any draw
        color.setFill()
        UIRectFill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        return image
    }
    
    // Update the color of the UIButton's background image
    func refreshColor(color: UIColor) {
        let image = createImage(color: color)
        setBackgroundImage(image, for: UIControl.State.normal)
        clipsToBounds = true
    }
    
    // Change the background color of button
    @IBInspectable var customBGColor: UIColor = UIColor.init(red: 0, green: 122/255.0, blue: 255/255.0, alpha: 1) {
        didSet {
            refreshColor(color: customBGColor)
        }
    }
    
    // Button Border Styles
    @IBInspectable var borderWidth: CGFloat = 2 {
        didSet {
            refreshBorder(_borderWidth: borderWidth)
        }
    }

    func refreshBorder(_borderWidth: CGFloat) {
        layer.borderWidth = _borderWidth
    }

    @IBInspectable var customBorderColor: UIColor = UIColor.init (red: 0, green: 122/255, blue: 255/255, alpha: 1){
        didSet {
            refreshBorderColor(_colorBorder: customBorderColor)
        }
    }

    func refreshBorderColor(_colorBorder: UIColor) {
        layer.borderColor = _colorBorder.cgColor
    }
}




