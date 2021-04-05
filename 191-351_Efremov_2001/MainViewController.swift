//
//  MainViewController.swift


import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var myApp: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var slider: UISlider! {
        didSet {
            slider.maximumValue = 100
            slider.minimumValue = 0
            slider.value = 10
        }
    }
    
    @IBOutlet weak var kgLabel: UILabel!
    @IBOutlet weak var fLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView! {
        didSet {
            progressView.progress = 0.1
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func changeTitle(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            myApp.text = "Первое приложение"
            myApp.textColor = .orange
        case 1:
            myApp.text = "Второе приложение"
            myApp.textColor = .green
        default:
            return
        }
    }
    
    @IBAction func convertMassDrag(_ sender: UISlider) {
        let kg = Int(round(sender.value))
        kgLabel.text = "\(kg) кг."
        
        let f = sender.value * 2.205;
        fLabel.text = "\(f) Ф."

    }
    
    @IBAction func progressButton(_ sender: UIButton) {
        progressView.progress += 0.1
    }
}
