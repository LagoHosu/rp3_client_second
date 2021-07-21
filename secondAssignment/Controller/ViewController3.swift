//
//  ViewController3.swift
//  secondAssignment
//
//  Created by Lago on 2021/07/18.
//

import UIKit
//to select the current city

protocol sendBackDelegate {
    func dataRecieved(data: String)
}

class ViewController3: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet var pickCity2: UIPickerView!
    
    var delegate : sendBackDelegate?
    var selectedCity = ""
    
    //MARK: - pickerView
    
    lazy var pickerView: UIPickerView = {
        // Generate UIPickerView.
        pickCity2 = UIPickerView()
        
        // Specify the size.
        pickCity2.frame = CGRect(x: 0, y: view.center.y - 20, width: self.view.bounds.width, height: 180.0)
        
        // Set the backgroundColor.
        pickCity2.backgroundColor = .white
        
        // Set the delegate.
        pickCity2.delegate = self
        
        // Set the dataSource.
        pickCity2.dataSource = self

        return pickCity2
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
        selectedCity = cities[row]

        
    }
    
    
    //MARK: - datapass to VC1 w/ delegate
    
//    delegate!.dataReceived(data: selectedCity)
    
    
    
    //MARK: - Life cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.addSubview(self.pickerView)

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("vc2 viewWillAppear")
        
        //vc1에서 선택한 city의 시간 appear되게 설정
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("vc2 viewDidAppear")
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("vc2 viewWillDisappear")
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("vc2 viewDidDisappear")
        
    }
    
}

