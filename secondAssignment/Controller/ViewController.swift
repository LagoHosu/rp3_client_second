//
//  ViewController.swift
//  secondAssignment
//
//  Created by Lago on 2021/07/16.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    //@IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet var pickCity: UIPickerView!
    @IBOutlet weak var currentLocation: UILabel!
    
    
    //MARK: - pickerView setting
    lazy var pickerView: UIPickerView = {
        // Generate UIPickerView.
        pickCity = UIPickerView()
        
        // Specify the size.
        pickCity.frame = CGRect(x: 0, y: view.center.y + 20, width: self.view.bounds.width, height: 180.0)
        
        // Set the backgroundColor.
        pickCity.backgroundColor = .white
        
        // Set the delegate.
        pickCity.delegate = self
        
        // Set the dataSource.
        pickCity.dataSource = self

        return pickCity
    }()
    
    let cities = TimeZone.knownTimeZoneIdentifiers
        
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    
    // Delegate method that returns the value to be displayed in the picker.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
        
    }
    
    // A method called when the picker is selected.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("row: \(row)")
        print("value: \(cities[row])")
        print()
        
    }
    
        
        
        
        //MARK: - life cycle functions
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            print("vc1 viewDidLoad")
            
            self.view.addSubview(self.pickerView)
            currentLocation.text = "Seoul"
//            currentLocation.layer.borderWidth = 1
//            currentLocation.layer.borderColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
            
        }
    
    override func viewWillAppear(_ animated: Bool) {
        print("vc1 viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("vc1 viewDidAppear")
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("vc1 viewWillDisappear")
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("vc1 viewDidDisappear")
        
    }
    
}

