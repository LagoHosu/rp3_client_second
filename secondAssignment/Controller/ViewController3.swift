//
//  ViewController3.swift
//  secondAssignment
//
//  Created by Lago on 2021/07/18.
//

import UIKit
//to select the current city


class ViewController3: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
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

