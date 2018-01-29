    //
    //  TopicoCell.swift
    //  FOCA_App
    //
    //  Created by Platiplus on 18/11/17.
    //  Copyright © 2017 Platiplus. All rights reserved.
    //
    
    import UIKit
    
    class TopicoCell: UITableViewCell {
        
        @IBOutlet weak var estrelas: CosmosView!
        
        @IBOutlet weak var topicoTitleLabel: UILabel!
        
        func setTopico(nome:String){
            
            topicoTitleLabel.text = nome
            //estrelas.rating = estrelas
        }
        
        func setEstrela(dificuldade:Double){
            
            estrelas.rating = dificuldade
            //estrelas.rating = estrelas
        }
        
        
    }
