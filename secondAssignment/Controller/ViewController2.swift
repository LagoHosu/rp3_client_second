//
//  ViewController2.swift
//  secondAssignment
//
//  Created by Lago on 2021/07/16.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var timeDifference: UILabel!
    
    var resultCity : String = "default"
    var calculatedTime :String = "default"
    var differenceHour = ""
    var differenceMinute = ""
    
    
    
    var timeInThatLocation : String = "" //= String(Date().timeIntervalSince1970)
    var timeInMyLocation : String = ""//= String(Date().timeIntervalSince1970)
    
    //lazy를 설정해서 timezone(identifier: _)에 resultCity를 넣을 수 있다 ~> 왜지?
    //lazy는 한번만 초기화?를 해버리니 get을 사용하면 바뀐 값에 맞춰 쓸 수 있다(아래)
    
    /*
     lazy var date: String = {
     let date = Date()
     let df = DateFormatter()
     df.locale = Locale(identifier: "AU") //ko_KR
     
     df.timeZone = TimeZone(identifier: self.resultCity)
     //df.timeZone = TimeZone(abbreviation: "KST")
     df.dateFormat = "dd, MMM yyyy"
     
     var result = df.string(from: date)
     return result
     }()
     
     */
    
    //for day setting
    var date: String {
        get{
            let date = Date()
            let df = DateFormatter()
            df.locale = Locale(identifier: "AU") //ko_KR
            
            df.timeZone = TimeZone(identifier: self.resultCity)
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
            df2.timeZone = TimeZone(identifier: self.resultCity)
            df2.dateFormat = "HH:mm"
            
            
            return df2.string(from: date)
        }
        
    }
    
    
    
    func timeNow() {
        timeLabel.text = "It's \(date2) on \(date)"
    }
    
    //MARK: - time difference calculating
    
    func calculateTime() -> (String, String) {
        timeInThatLocation = date2
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        guard let startTime = format.date(from: self.timeInThatLocation) else {
            return ("?", "?")
        }
        guard let endTime = format.date(from: self.timeInMyLocation) else {
            return ("?", "?")
        }
        print("startTime is \(startTime)")
        print("endTime is \(endTime)")
        var useTime = Int(endTime.timeIntervalSince(startTime))
        calculatedTime = String(useTime)
        
        //MARK: - changing the difference(seconds) into hour/minute
        if useTime < 0 {
            useTime = useTime * -1
        }
        differenceHour = String(useTime/3600)
        differenceMinute = String(format: "%02d", useTime%3600)
        
        

        return (differenceHour, differenceMinute)
    }
    
    //MARK: - life cycle functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //         Do any additional setup after loading the view.

        
        print("vc2 viewDidLoad")
        print("selected city is \(resultCity)")
        locationLabel.text = "in \(resultCity)"
        timeNow()
        calculateTime()
        print(calculatedTime)
        timeDifference.text = "Time difference between two cities is \(differenceHour):\(differenceMinute)"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("vc2 viewWillAppear")
        timeNow()
        
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


/*
 
 //calculating time difference
 let time1 = Date(timeIntervalSince1970: startTime)
 let time2 = Date(timeIntervalSince1970: endTime)
 let difference = Calendar.current.dateComponents([.second], from: time1, to: time2)
 let duration = difference.second
 */
