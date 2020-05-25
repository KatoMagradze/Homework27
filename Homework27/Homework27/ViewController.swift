//
//  ViewController.swift
//  Homework27
//
//  Created by Kato on 5/25/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func primeChecker(n : Int)->Bool{
     
        for i in 2 ..< n {
            if n % i == 0 {
                return false
            }
        }
       return true
    }
    
    func primeGenerator(n : Int) {

        var primeNumbers = [Int]()
        
        for i in 2...n {
            if primeChecker(n: i) {
                primeNumbers.append(i)
            }
        }
        print(primeNumbers)
        
    }

    @IBAction func onCalculateTapped(_ sender: UIButton) {
        
        self.calculateButton.setTitleColor(.gray, for: .normal)
        self.calculateButton.setTitle("Calculating...", for: .normal)
        self.calculateButton.isUserInteractionEnabled = false
        
        DispatchQueue.global(qos: .background).async {
            self.primeGenerator(n: 100000)
        
        
            DispatchQueue.main.async {
                self.calculateButton.setTitleColor(.blue, for: .normal)
                self.calculateButton.setTitle("Calculate Prime Numbers", for: .normal)
                self.calculateButton.isUserInteractionEnabled = true
            }
        }
        
    }
    
}


