//
//  ViewController.swift
//  PickerViewSlotMachineDemo
//
//  Created by HackerU on 14/04/2016.
//  Copyright © 2016 HackerU. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
 
    var s1 = 0
    var s2 = 0
    var s3 = 0
    
    
    @IBAction func spinTapped(sender: UIButton) {
        let n = Int.nextRandom(slotMachineForCheaters.count)
        slotMachinePicker.selectRow(n, inComponent: 0, animated: true)
        
        s1 = n
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "comp2", userInfo: nil, repeats: false)
        
        NSTimer.scheduledTimerWithTimeInterval(0.15, target: self, selector: "comp3", userInfo: nil, repeats: false)
        
        let url = NSBundle.mainBundle().URLForResource("slot", withExtension: "wav")!
        let player = try? AVAudioPlayer(contentsOfURL: url)
        
        if let player = player{
            player.play()
        }
        
    }
    
    dynamic func comp2(){
        let n = Int.nextRandom(slotMachineForCheaters.count)
        slotMachinePicker.selectRow(n, inComponent: 1, animated: true)
        s2 = n
    }
    
    dynamic func comp3(){
        let n = Int.nextRandom(slotMachineForCheaters.count)
        slotMachinePicker.selectRow(n, inComponent: 2, animated: true)
        s3 = n
        
        if s1 == s2 && s2 == s3{
            print("Win")
        }
    }
    
    
    
    @IBOutlet weak var slotMachinePicker: UIPickerView!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let image = sender as? UIImage
        
        if let dest = segue.destinationViewController as? DetailsViewController{
            dest.data = image
        }
        /*
        let dest = segue.destinationViewController as! DetailsViewController
        dest.data = image
        */
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}



extension ViewController:UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return slotMachineForCheaters.count
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        //
        let image = UIImage(named: slotMachineForCheaters[row])
        let imageView = UIImageView(image: image)
        return imageView
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
       
        return 100
    }
}




 
extension Int{
    static func nextRandom(max:Int)->Int{
        var rand = 0
        arc4random_buf(&rand, sizeof(Int))
        return abs(rand) % max
    }
}




