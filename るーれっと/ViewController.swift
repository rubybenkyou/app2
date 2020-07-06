//
//  ViewController.swift
//  るーれっと
//
//  Created by a on 2020/07/06.
//  Copyright © 2020 a. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    
    var timer = Timer()
    
    var count = Int()
    
    var imageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        count = 0
        stopButton.isEnabled = true
        for i in 0..<5{
            let image = UIImage(named: "\(i)")
            imageArray.append(image!)
        }
        imageView.image=imageArray[0]
    }
    
    func startTimer(){
        //0.2秒毎まわす
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
    }
    
    @objc func timerUpdate(){
        count = count + 1
        if count > 4{
            count = 0
        }
    
        
        imageView.image = imageArray[count]

    }
    
    @IBAction func start(_ sender: Any) {

        //スタートを押せなくする
        startButton.isEnabled = false
        stopButton.isEnabled = true
        
        startTimer()
    }
    

    @IBAction func stop(_ sender: Any) {
        //スタートを押せるようにする
        //ストップボタンを押せないようにする
        stopButton.isEnabled = false
        startButton.isEnabled = true
        timer.invalidate()
    }
    
}

