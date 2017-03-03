//
//  SearchSettingsViewController.swift
//  GithubDemo
//
//  Created by Michelle Shu on 3/2/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class SearchSettingsViewController: UIViewController {
    weak var delegate: SettingsPresentingViewControllerDelegate?
    weak var settings = GithubRepoSearchSettings()
    @IBOutlet weak var cancelButton: UIBarButtonItem!
   
    @IBOutlet weak var minStarSlider: UISlider!
    
    @IBOutlet weak var minStarLabel: UILabel!
    
    @IBOutlet weak var minStarNum: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        minStarNum.text = String(settings!.minStars)
        minStarSlider.value = Float(settings!.minStars)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*@IBAction func saveButtonTapped(sender: UIBarButtonItem) {
        self.delegate?.didSaveSettings(settings: nil)
    }*/
    
    
 
    @IBAction func saveButtonTapped(_ sender: Any) {
        self.settings!.minStars = Int(self.minStarSlider.value)
            
        self.delegate?.didSaveSettings(settings: self.settings!)
        self.dismiss(animated: false, completion: nil)

    }
    

    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        self.delegate?.didCancelSettings()
        self.dismiss(animated: false, completion: nil)
    }
    
    
    @IBAction func useSlider(_ sender: Any) {
        let step: Float = 1
        let roundedValue = round(self.minStarSlider.value / step) * step
        minStarSlider.value = roundedValue
        self.minStarNum.text = String(Int(minStarSlider.value))
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
