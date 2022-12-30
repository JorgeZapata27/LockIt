//
//  LengthView.swift
//  LockIt
//
//  Created by JJ Zapata on 11/26/22.
//

import UIKit

class LengthView: UIView {
    
    // MARK: - UI Components
    let lengthTitle = UILabel()
    let lengthMin = UILabel()
    let lengthMax = UILabel()
    let lengthSlider = UISlider()
    let middleLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        
        general()
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension LengthView {
    
    func general() {
        self.backgroundColor = secondaryBackgroundColor
        self.layer.cornerRadius = 8
    }
    
    func style() {
        lengthTitle.translatesAutoresizingMaskIntoConstraints = false
        lengthTitle.textAlignment = .left
        lengthTitle.text = "Length"
        lengthTitle.textColor = secondaryTextColor
        lengthTitle.font = .boldSystemFont(ofSize: 16)
        
        lengthMin.translatesAutoresizingMaskIntoConstraints = false
        lengthMin.textAlignment = .left
        lengthMin.text = "5"
        lengthMin.textColor = normalTextColor
        lengthMin.font = .boldSystemFont(ofSize: 17)
        
        lengthMax.translatesAutoresizingMaskIntoConstraints = false
        lengthMax.textAlignment = .right
        lengthMax.text = "15"
        lengthMax.textColor = normalTextColor
        lengthMax.font = .boldSystemFont(ofSize: 17)
        
        lengthSlider.translatesAutoresizingMaskIntoConstraints = false
        lengthSlider.tintColor = yellowColor
        lengthSlider.minimumValue = 5
        lengthSlider.maximumValue = 15
        lengthSlider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        
        middleLabel.translatesAutoresizingMaskIntoConstraints = false
        middleLabel.textAlignment = .center
    }
    
    @objc func sliderValueChanged(_ sender: UISlider) {
        let x = Int(round(sender.value))
        middleLabel.text = "\(x)"
        middleLabel.center = setUISliderThumbValueWithLabel(slider: sender)
    }
    
    func setUISliderThumbValueWithLabel(slider: UISlider) -> CGPoint {
        let slidertTrack : CGRect = slider.trackRect(forBounds: slider.bounds)
        let sliderFrm : CGRect = slider .thumbRect(forBounds: slider.bounds, trackRect: slidertTrack, value: slider.value)
        return CGPoint(x: sliderFrm.origin.x + slider.frame.origin.x + 16, y: slider.frame.origin.y - 30)
    }
    
    func layout() {
        addSubview(lengthTitle)
        NSLayoutConstraint.activate([
            lengthTitle.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            lengthTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 9),
            lengthTitle.rightAnchor.constraint(equalTo: rightAnchor, constant: -9),
            lengthTitle.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        addSubview(lengthMin)
        NSLayoutConstraint.activate([
            lengthMin.topAnchor.constraint(equalTo: lengthTitle.bottomAnchor, constant: 11),
            lengthMin.leftAnchor.constraint(equalTo: leftAnchor, constant: 9),
            lengthMin.rightAnchor.constraint(equalTo: rightAnchor, constant: -9),
            lengthMin.heightAnchor.constraint(equalToConstant: 29)
        ])
        
        addSubview(lengthMax)
        NSLayoutConstraint.activate([
            lengthMax.topAnchor.constraint(equalTo: lengthTitle.bottomAnchor, constant: 11),
            lengthMax.leftAnchor.constraint(equalTo: leftAnchor, constant: 9),
            lengthMax.rightAnchor.constraint(equalTo: rightAnchor, constant: -9),
            lengthMax.heightAnchor.constraint(equalToConstant: 29)
        ])
        
        addSubview(lengthSlider)
        NSLayoutConstraint.activate([
            lengthSlider.centerYAnchor.constraint(equalTo: lengthMax.centerYAnchor),
            lengthSlider.leftAnchor.constraint(equalTo: leftAnchor, constant: 42),
            lengthSlider.rightAnchor.constraint(equalTo: rightAnchor, constant: -42),
            lengthSlider.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        addSubview(middleLabel)
        NSLayoutConstraint.activate([
            middleLabel.centerYAnchor.constraint(equalTo: lengthMax.centerYAnchor, constant: -30),
            middleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 42),
            middleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -42),
            middleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
}
