//
//  ViewController.swift
//  IvCalc
//
//  Created by Danupat Kns. on 8/16/2559 BE.
//  Copyright © 2559 Danupat Kns.freeJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        namePicker.dataSource = self
        namePicker.delegate = self
        Name_Value.inputView = namePicker
        
        //Hide Blink Cursor
        Name_Value.tintColor = UIColor.clear
        CP_Value.tintColor = UIColor.clear
        HP_Value.tintColor = UIColor.clear
        
        //Keyboard Purpose
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override var shouldAutorotate : Bool {
        return false
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    @IBOutlet weak var Name_Value: UITextField!
    
    fileprivate var namePicker = UIPickerView()
    
    let pokemonList = ["Abra","Aerodactyl","Alakazam","Arbok","Arcanine","Articuno","Beedrill","Bellsprout","Blastoise","Bulbasaur","Butterfree","Caterpie","Chansey","Charizard","Charmander","Charmeleon","Clefable","Clefairy","Cloyster","Cubone","Dewgong","Diglett","Ditto","Dodrio","Doduo","Dragonair","Dragonite","Dratini","Drowzee","Dugtrio","Eevee","Ekans","Electabuzz","Electrode","Exeggcute","Exeggutor","Farfetch'd","Fearow","Flareon","Gastly","Gengar","Geodude","Gloom","Golbat","Goldeen","Golduck","Golem","Graveler","Grimer","Growlithe","Gyarados","Haunter","Hitmonchan","Hitmonlee","Horsea","Hypno","Ivysaur","Jigglypuff","Jolteon","Jynx","Kabuto","Kabutops","Kadabra","Kakuna","Kangaskhan","Kingler","Koffing","Krabby","Lapras","Lickitung","Machamp","Machoke","Machop","Magikarp","Magmar","Magnemite","Magneton","Mankey","Marowak","Meowth","Metapod","Mew","Mewtwo","Moltres","Mr.Mime","Muk","Nidoking","Nidoqueen","Nidoran♀","Nidoran♂","Nidorina","Nidorino","Ninetales","Oddish","Omanyte","Omastar","Onix","Paras","Parasect","Persian","Pidgeot","Pidgeotto","Pidgey","Pikachu","Pinsir","Poliwag","Poliwhirl","Poliwrath","Ponyta","Porygon","Primeape","Psyduck","Raichu","Rapidash","Raticate","Rattata","Rhydon","Rhyhorn","Sandshrew","Sandslash","Scyther","Seadra","Seaking","Seel","Shellder","Slowbro","Slowpoke","Snorlax","Spearow","Squirtle","Starmie","Staryu","Tangela","Tauros","Tentacool","Tentacruel","Vaporeon","Venomoth","Venonat","Venusaur","Victreebel","Vileplume","Voltorb","Vulpix","Wartortle","Weedle","Weepinbell","Weezing","Wigglytuff","Zapdos","Zubat"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pokemonList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pokemonList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        Name_Value.text = pokemonList[row]
    }
    
    @IBOutlet weak var CP_Value: UITextField!
    
    @IBOutlet weak var HP_Value: UITextField!
    
    @IBOutlet weak var Stardust_ValueScale: UISlider!
    
    @IBOutlet weak var Stardust_Value: UILabel!
    
    @IBAction func Stardust_ValueChanged(_ sender: UISlider) {
        dismissKeyboard()
        var roundedValue = round(sender.value / 100) * 100
        let m100 = [300,500,700,900,1100,1400,1700,2000,2300,2600,3100,3600,4100,4600,5100,6100,7100,8100,9100]
        let p100 = [1200,1500,1800,2100,2400,2900,3400,3900,4400,4900,5900,6900,7900,8900,9900]
        let m200 = [2700,3200,3700,4200,4700,5200,6200,7200,8200,9200]
        let p200 = [2800,3300,3800,4300,4800,5800,6800,7800,8800,9800]
        let m300 = [5300,6300,7300,8300,9300]
        let p300 = [5700,6700,7700,8700,9700]
        let m400 = [5400,6400,7400,8400,9400]
        let p400 = [5600,6600,7600,8600,9600]
        if m100.contains(Int(roundedValue)) {
            roundedValue -= 100.0
        } else if p100.contains(Int(roundedValue)) {
            roundedValue += 100.0
        } else if m200.contains(Int(roundedValue)) {
            roundedValue -= 200.0
        } else if p200.contains(Int(roundedValue)) {
            roundedValue += 200.0
        } else if m300.contains(Int(roundedValue)) {
            roundedValue -= 300.0
        } else if p300.contains(Int(roundedValue)) {
            roundedValue += 300.0
        } else if m400.contains(Int(roundedValue)) {
            roundedValue -= 400.0
        } else if p400.contains(Int(roundedValue)) {
            roundedValue += 400.0
        }
        sender.value = roundedValue
        Stardust_Value.text = "\(Int(roundedValue))"
    }
    
    var brain = CalculatorCore()
    
    @IBOutlet weak var maxPossible: UILabel!
    
    @IBOutlet weak var worstPossible: UILabel!
    
    @IBOutlet weak var average: UILabel!
    
    @IBOutlet weak var yourMaxCP: UILabel!
    
    @IBOutlet weak var yourMinCP: UILabel!
    
    @IBOutlet weak var result: UILabel!
    
    @IBOutlet weak var AvgLB: UILabel!
    
    @IBOutlet weak var MinLB: UILabel!
    
    @IBOutlet weak var MaxLB: UILabel!
    
    @IBOutlet weak var CPmaxLB: UILabel!
    
    @IBOutlet weak var CPminLB: UILabel!
    
    @IBAction func pressButton(_ sender: UIButton) {
        dismissKeyboard()
        if sender.currentTitle == "Reset" {
            brain = CalculatorCore()
            Name_Value.text = ""
            CP_Value.text = ""
            HP_Value.text = ""
            Stardust_Value.text = "200"
            Stardust_ValueScale.value = 200.0
            
            maxPossible.isHidden = true
            worstPossible.isHidden = true
            average.isHidden = true
            yourMaxCP.isHidden = true
            yourMinCP.isHidden = true
            result.isHidden = true
            AvgLB.isHidden = true
            MinLB.isHidden = true
            MaxLB.isHidden = true
            CPmaxLB.isHidden = true
            CPminLB.isHidden = true
        } else {
            if Name_Value.text == "" || CP_Value.text == "" {
                let alert = UIAlertController(title: "Incomplete Data",message: "Please enter more data",preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:nil))
                present(alert, animated: true, completion: nil)
                return
            }
            brain = CalculatorCore()
            let feedback = brain.findIv(Name_Value.text!, cp: Int(CP_Value.text!)!, hp: Int(HP_Value.text!)!, starDust: Int(Stardust_Value.text!)!)
            if feedback == 1 {
                let alert = UIAlertController(title: "Incorrect Stardust",message: "Please enter a correct stardust used",preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:nil))
                present(alert, animated: true, completion: nil)
                return
            } else if feedback == 2 {
                let alert = UIAlertController(title: "Don't found any combination",message: "Please make sure you enter a correct data",preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:nil))
                present(alert, animated: true, completion: nil)
                return
            }
            let yourMaxPossible = String(brain.max)
            let yourMinPossible = String(brain.min)
            let yourAverage = String(brain.mean)
            let yourBestStat = brain.yourBest
            let yourWorstStat = brain.yourWorst
            let bestPossibleStat = brain.best
            
            if brain.max >= 70 {
                maxPossible.textColor = UIColor.green
            } else if  brain.max >= 50 {
                maxPossible.textColor = UIColor.orange
            } else {
                maxPossible.textColor = UIColor.red
            }
            
            if brain.min >= 70 {
                worstPossible.textColor = UIColor.green
            } else if  brain.min >= 50 {
                worstPossible.textColor = UIColor.orange
            } else {
                worstPossible.textColor = UIColor.red
            }

            if brain.mean >= 70 {
                average.textColor = UIColor.green
            } else if  brain.mean >= 50 {
                average.textColor = UIColor.orange
            } else {
                average.textColor = UIColor.red
            }

            
            maxPossible.text = yourMaxPossible.substring(to: yourMaxPossible.characters.index(yourMaxPossible.startIndex, offsetBy: 4)) + "%"
            
            worstPossible.text = yourMinPossible.substring(to: yourMinPossible.characters.index(yourMinPossible.startIndex, offsetBy: 4)) + "%"
            
            average.text = yourAverage.substring(to: yourAverage.characters.index(yourAverage.startIndex, offsetBy: 4)) + "%"
            
             let maxPossibleCP = String(Int(Double(bestPossibleStat.atk) * sqrt(Double(bestPossibleStat.def)) * sqrt(Double(bestPossibleStat.sta)) * 0.7931164 * 0.07931164))
            
            yourMaxCP.text = String(Int(Double(yourBestStat.atk) * sqrt(Double(yourBestStat.def)) * sqrt(Double(yourBestStat.sta)) * 0.7931164 * 0.07931164))
            
            yourMaxCP.text = yourMaxCP.text! + " / " + maxPossibleCP
            
            yourMinCP.text = String(Int(Double(yourWorstStat.atk) * sqrt(Double(yourWorstStat.def)) * sqrt(Double(yourWorstStat.sta)) * 0.7931164 * 0.07931164))
            
            yourMinCP.text = yourMinCP.text! + " / " + maxPossibleCP
            
            if brain.mean >= 80 {
                result.textColor = UIColor.blue
                result.text = "EXCELLENT!"
            } else if brain.mean >= 70 {
                result.textColor = UIColor.green
                result.text = "GREAT!"
            } else if brain.mean >= 60 {
                result.textColor = UIColor.orange
                result.text = "NICE!"
            } else if brain.mean >= 50 {
                if brain.max >= 70 {
                    result.textColor = UIColor.orange
                    result.text = "MAYBE GOOD!"
                } else {
                    result.textColor = UIColor.red
                    result.text = "TRANSFER!"
                }
            } else {
                result.textColor = UIColor.red
                result.text = "TRANSFER!"
            }
            maxPossible.isHidden = false
            worstPossible.isHidden = false
            average.isHidden = false
            yourMaxCP.isHidden = false
            yourMinCP.isHidden = false
            result.isHidden = false
            AvgLB.isHidden = false
            MinLB.isHidden = false
            MaxLB.isHidden = false
            CPmaxLB.isHidden = false
            CPminLB.isHidden = false
        }
    }
}

