//
//  SecondScreenViewController.swift
//  UIKit-ColorSlider
//
//  Created by Kalabishka Ivan on 09.07.2021.
//
// MARK: - IB Outlets
// MARK: - Public Properties
// MARK: - Private Properties
// MARK: - Initializers
// MARK: - Override Methods
// MARK: - IB Action
// MARK: - Public Methods
// MARK: - Private Methods


import UIKit

class SecondScreenViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var viewDisplay: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redSliderTF: UITextField!
    @IBOutlet weak var greenSliderTF: UITextField!
    @IBOutlet weak var blueSliderTF: UITextField!
    
    // MARK: - Public Properties
    var delegate: SecondScreenViewControllerDelegate!
    var viewColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        redSlider.tintColor = .red
        greenSlider.tintColor = .green
        
        viewDisplay.backgroundColor = viewColor
        
        setSliders()
        setValue(for: redLabel, greenLabel, blueLabel)
        setValue(for: redSliderTF, greenSliderTF, blueSliderTF)
    }
    
    // MARK: - IB Actions
    @IBAction func rgbSlider(_ sender: UISlider) {
        
        switch sender {
        case redSlider:
            setValue(for: redLabel)
            setValue(for: redSliderTF)
        case greenSlider:
            setValue(for: greenLabel)
            setValue(for: greenSliderTF)
        default:
            setValue(for: blueLabel)
            setValue(for: blueSliderTF)
        }
        
        setColor()
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setColor(viewDisplay.backgroundColor ?? .white)
        dismiss(animated: true)
    }
}

// MARK: - Private Methods
extension SecondScreenViewController {
    
    private func setColor() {
        viewDisplay.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel: label.text = string(from: redSlider)
            case greenLabel: label.text = string(from: greenSlider)
            default: label.text = string(from: blueSlider)
            }
        }
    }
    
    private func setValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redSliderTF: textField.text = string(from: redSlider)
            case greenSliderTF: textField.text = string(from: greenSlider)
            default: textField.text = string(from: blueSlider)
            }
        }
    }
    
    // дробим цвет на компоненты
    private func setSliders() {
        let ciColor = CIColor(color: viewColor)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}






