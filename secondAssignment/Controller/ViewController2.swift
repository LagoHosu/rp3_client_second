//
//  ViewController2.swift
//  secondAssignment
//
//  Created by Lago on 2021/07/16.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet var timeLabel: UILabel!
    
    var now = String(Date().timeIntervalSince1970)
    
    var date: String = {
        let date = Date()
        let df = DateFormatter()
        df.locale = Locale(identifier: "AU") //ko_KR
        df.timeZone = TimeZone(abbreviation: "KST")
        df.dateFormat = "dd, MMM yyyy"
        
        var result = df.string(from: date)
        return result
    }()
    
    var date2: String = {
        let date = Date()
        let df2 = DateFormatter()
        df2.locale = Locale(identifier: "ko_KR")
        df2.timeZone = TimeZone(abbreviation: "KST")
        df2.dateFormat = "HH:mm:ss"
        
        var result = df2.string(from: date)
        return result
    }()
    
    
    
    
    //    let date = DateFormatter()
    //                date.locale = Locale(identifier: "ko_KR")
    //                date.timeZone = timeZone
    //                date.dateFormat = "HH:mm"
    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> String {
//        var cell = timeLabel.text!
//
//        let today = Int(now) + (indexPath.row * 86400)
//        let timeInterval = TimeInterval(today)
//        let cellTxt = Date(timeIntervalSince1970: timeInterval)
//
//
//        cell = "\(date.string(from: cellTxt))"
//
//        return cell
//    }
    
    func timeNow() {
        timeLabel.text = "It's \(date2) on \(date)"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("vc2 viewDidLoad")
        print("")
        timeNow()
        
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

