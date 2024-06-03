//
//  UniversitiesCell.swift
//  TaskXische
//
//  Created by Eman Gaber on 31/05/2024.
//

import UIKit

 class UniversitiesCell: UITableViewCell {
    @IBOutlet weak var nameLBL: UILabel!
    @IBOutlet weak var stateLBL: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
     
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension UniversitiesCell: UniversityCellDelegate {
    
    func configureCell(_ universityItem: UniversitiesModel?) {
        nameLBL.text = universityItem?.name ?? ""
        stateLBL.text = universityItem?.stateProvince ?? ""
       
    }
    
}
