//
//  diasCell.swift
//  FOCA_App
//
//  Created by Platiplus on 20/11/17.
//  Copyright © 2017 Platiplus. All rights reserved.
//

import UIKit

class DiasCell: UITableViewCell {
    
    
    @IBOutlet weak var diaLabel: UILabel!

    
    func setDia(dia:TopicoFront){
        
        diaLabel.text = dia.title
    }
}
