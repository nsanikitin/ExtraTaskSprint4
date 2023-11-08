//
//  ViewController.swift
//  ExtraTaskSprint4
//
//  Created by Сергей Никитин on 06.11.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var IDView: UIStackView!
    @IBOutlet private weak var typeGeneralView: UIStackView!
    @IBOutlet private weak var setupView: UIStackView!
    @IBOutlet private weak var showPuchButton: UIButton!
    @IBOutlet private weak var refreshButton: UIButton!
    @IBOutlet private weak var jokeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // задаем значения для IDView
        IDView.layer.masksToBounds = true // разрешаем рисовать рамку
        IDView.layer.borderColor = UIColor.black.cgColor // красим рамку
        
        // задаем значения для typeGeneralView
        typeGeneralView.layer.masksToBounds = true // разрешаем рисовать рамку
        typeGeneralView.layer.borderColor = UIColor.black.cgColor // красим рамку
        
        // задаем значения для setupView
        setupView.layer.masksToBounds = true // разрешаем рисовать рамку
        setupView.layer.borderColor = UIColor.black.cgColor // красим рамку
        
        
        // задаем значения для showPuchButton
        showPuchButton.layer.masksToBounds = true // разрешаем рисовать рамку
        showPuchButton.layer.borderColor = UIColor.black.cgColor // красим рамку
        
        // задаем значения для refreshButton
        refreshButton.layer.masksToBounds = true // разрешаем рисовать рамку
        refreshButton.layer.borderColor = UIColor.black.cgColor // красим рамку
        
        // задаем значения для jokeLabel
        jokeLabel.layer.masksToBounds = true // разрешаем рисовать рамку
        jokeLabel.layer.borderColor = UIColor.black.cgColor // красим рамку
        // добавляем линию снизу лэйбла
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.jokeLabel.frame.height - 2, width: self.jokeLabel.frame.width, height: 2.0)
        bottomLine.backgroundColor = UIColor.black.cgColor
        jokeLabel.layer.addSublayer(bottomLine)
        // добавляем линию сверху лэйбла
        let topLine = CALayer()
        topLine.frame = CGRect(x: 0.0, y: 0.0, width: self.jokeLabel.frame.width, height: 2.0)
        topLine.backgroundColor = UIColor.black.cgColor
        jokeLabel.layer.addSublayer(topLine)
        
        // блокируем от нажатий кнопку refreshButton
        refreshButton.isEnabled = false
    }
    
    // действие по нажатию на кнопку showButton
    @IBAction private func showButtonDidTape(_ sender: Any) {
        // добавляем алерт по нажатию
        let alert = UIAlertController(
            title: "Punchline",
            message: "Four fowl play",
            preferredStyle: .alert)
        
        // настройка параметров по нажатию кнопки алерта
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            self.viewDidLoad()
        }
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
