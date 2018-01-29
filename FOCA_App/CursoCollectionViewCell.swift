//
//  CursoCollectionViewCell.swift
//  FOCA_App
//
//  Created by Platiplus on 20/11/17.
//  Copyright © 2017 Platiplus. All rights reserved.
//

import UIKit

class CursoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var cursoTitleLabel: UILabel!
    @IBOutlet weak var backgroundColorView: UIView!
    
    
    var curso: Curso?{
        didSet{
            self.updateUI()
        }
    }

    private func updateUI(){
        
        if let curso = curso {
            
            featuredImageView.image = curso.featuredImage
            cursoTitleLabel.text = curso.title
            backgroundColorView.backgroundColor = curso.color
            colorFix()
        
        }
        
        else{
            
            featuredImageView.image = nil
            cursoTitleLabel.text = nil
            backgroundColorView = nil
        
        }
        
    }
    
    func colorFix(){
        
        cursoTitleLabel.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 0.6)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 15
        layer.shadowRadius = 15
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 5, height: 10)
        
        self.clipsToBounds = false
    }
    
}
