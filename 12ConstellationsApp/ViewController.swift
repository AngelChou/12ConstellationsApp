//
//  ViewController.swift
//  12ConstellationsApp
//
//  Created by Shun-Ching, Chou on 2019/4/17.
//  Copyright © 2019 Shun-Ching, Chou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var weekSegment: UISegmentedControl!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var yearSwitch: UISwitch!
    @IBOutlet weak var constellationPicker: UIPickerView!
    
    var constellations = [Constellation(name: "♈️牡羊座 Aries", startDate: "3/21", stopDate: "4/19"), Constellation(name: "♉️金牛座 Taurus", startDate: "04/20", stopDate: "05/20"), Constellation(name: "♊️雙子座 Gemini", startDate: "05/21", stopDate: "06/20"), Constellation(name: "♋️巨蟹座 Cancer", startDate: "06/21", stopDate: "07/22"), Constellation(name: "♌️獅子座 Leo", startDate: "07/23", stopDate: "08/22"), Constellation(name: "♍️處女座 Virgo", startDate: "08/23", stopDate: "09/22"), Constellation(name: "♎️天秤座 Libra", startDate: "09/23", stopDate: "10/22"), Constellation(name: "♏️天蠍座 Scorpio", startDate: "10/23", stopDate: "11/21"), Constellation(name: "♐️射手座 Sagittarius", startDate: "11/22", stopDate: "12/21"), Constellation(name: "♑️摩羯座 Capricorn", startDate: "12/22", stopDate: "01/19"), Constellation(name: "♒️水瓶座 Aquarius", startDate: "01/20", stopDate: "02/18"), Constellation(name: "♓️雙魚座 Pisces", startDate: "02/19", stopDate: "03/20")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    func isLeapYear(year: Int) -> Bool {
        if (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0 && year % 3200 != 0) {
            return true
        } else {
            return false
        }
    }
    
    func updateUI() {
        
        // 判斷星期幾
        let dateComponent = Calendar.current.dateComponents(in: TimeZone.current, from: datePicker.date)
        weekSegment.selectedSegmentIndex = dateComponent.weekday! - 1
        
        // 判斷閏年
        if let year = dateComponent.year {
            yearLabel.text = "\(year)"
            yearSwitch.isOn = isLeapYear(year: year)
        }
        
        // 判斷星座
        for (i, constellation) in constellations.enumerated() {
            if constellation.checkInterval(dateComponent: dateComponent) {
                constellationPicker.selectRow(i, inComponent: 0, animated: true)
                break
            }
        }
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        // 根據日期調整顯示的星期、閏年和星座
        updateUI()
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return constellations.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return constellations[row].name
    }
    
}

