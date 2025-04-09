//
//  CityTableViewCell.swift
//  Fetch Cities
//
//  Created by Soumya Mishra on 09/04/25.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cityVal: UILabel!
    @IBOutlet weak var populationVal: UILabel!
    @IBOutlet weak var industriesLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cityVal.text = "Unknown"
        populationVal.text = "Unknown"
        industriesLbl.text = "Unknown"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configrue(with city: City){
        cityVal.text = city.cityName
        populationVal.text = "Population: \(city.population)"
        industriesLbl.text = "Industries: \(city.economy.majorIndustries.joined(separator: ", "))"
    }
}
