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
    
    private var redSliderValue: CGFloat = 0.50
    private var greenSliderValue: CGFloat = 0.50
    private var blueSliderValue: CGFloat = 0.50
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .opaqueSeparator
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        slidersValueLabael()
        setColor()
    }
    
    @IBAction func redSliderActrion() {
        redSliderValue = CGFloat(redSlider.value)
        slidersValueLabael()
        setColor()
    }
    
    @IBAction func greenSliderAction() {
        greenSliderValue = CGFloat(greenSlider.value)
        slidersValueLabael()
        setColor()
    }
    
    @IBAction func blueSliderAction() {
        blueSliderValue = CGFloat(blueSlider.value)
        slidersValueLabael()
        setColor()
    }
    
    
    
}
extension ViewController {
    private func setColor() {
        viewDisplay.backgroundColor = UIColor(
            red: redSliderValue,
            green: greenSliderValue,
            blue: blueSliderValue,
            alpha: 1
        )
    }
    
    private func slidersValueLabael() {
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
    }
}

