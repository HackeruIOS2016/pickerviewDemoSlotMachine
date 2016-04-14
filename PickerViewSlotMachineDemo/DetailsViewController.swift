//
//  DetailsViewController.swift
//  PickerViewSlotMachineDemo
//
//  Created by HackerU on 14/04/2016.
//  Copyright © 2016 HackerU. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    
    //Declare a data field for the image
    var data:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //load the data to the imageView
        detailImageView.image = data
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
