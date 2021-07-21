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
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    var selectedCity : String = ""
    var standardLocation : String = "Asia/Seoul"
    var timeInLocation : String = ""
    
    
    
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
    
    var cities = TimeZone.knownTimeZoneIdentifiers
    
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
        self.cities[row] = cities[row]
        print("row: \(row)")
        print("value: \(cities[row])")
        selectedCity = cities[row]
    }
    
    //MARK: - datapass to VC2
    
    @IBAction func goToVC2(_ sender: UIButton) {
        //        let ViewController2 = self.storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        //
        //        ViewController2.resultCity = selectedCity
        //        print(selectedCity)
        //        print(ViewController2.resultCity)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is ViewController2 {
            let vc = segue.destination as? ViewController2
            vc?.resultCity = selectedCity
            vc?.timeInMyLocation = date2
            
            
        }
    }
    
    
    //MARK: - dapatass from VC3
    
    
    var delegate: ViewController3?
    
    
    
    @IBAction func unwindToViewController(_ unwindSegue: UIStoryboardSegue) {
        //        let sourceViewController = unwindSegue.source
        //        // Use data from the view controller which initiated the unwind segue
        //        performSegue(withIdentifier: "unwindToViewController", sender: self)
        //        sourceViewController.selected
        
        if let changedLocation = unwindSegue.source as? ViewController3 {
            locationLabel.text = "in \(changedLocation.selectedCity)"
            standardLocation = changedLocation.selectedCity
            
        }
        
    }
    
    
    
    //MARK: - timezone setting
    
    var date: String {
        get{
            let date = Date()
            let df = DateFormatter()
            df.locale = Locale(identifier: "AU") //ko_KR
            
            df.timeZone = TimeZone(identifier: self.standardLocation)
            //df.timeZone = TimeZone(abbreviation: "KST")
            df.dateFormat = "dd, MMM yyyy"
            
            return df.string(from: date)
        }
    }
    
    //for time setting
    var date2: String {
        get {
            let date = Date()
            let df2 = DateFormatter()
            df2.locale = Locale(identifier: "ko_KR")
            df2.timeZone = TimeZone(identifier: self.standardLocation)
            df2.dateFormat = "HH:mm"
            
            return df2.string(from: date)
        }
        
    }
    
    func timeNow() {
        timeLabel.text = "\(date2) on \(date)"
        //        locationLabel.text = currentLocation
    }
    
    //MARK: - life cycle functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("vc1 viewDidLoad")
        
        self.view.addSubview(self.pickerView)
        timeNow()
        locationLabel.text = "in \(standardLocation)"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("vc1 viewWillAppear")
        timeNow()
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

