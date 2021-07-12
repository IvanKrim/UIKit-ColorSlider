//
//  ViewController.swift
//  UIKit-ColorSlider
//
//  Created by Kalabishka Ivan on 09.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // 1
    @IBOutlet var viewDisplay: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .opaqueSeparator
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        slidersValueLabael()
        setColor()
    }
    
    @IBAction func redSliderActrion() {
        slidersValueLabael()
        setColor()
    }
    
    @IBAction func greenSliderAction() {
        slidersValueLabael()
        setColor()
    }
    
    @IBAction func blueSliderAction() {
        slidersValueLabael()
        setColor()
    }
    
}
extension ViewController {
    private func setColor() {
        viewDisplay.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func slidersValueLabael() {
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
    }
}

