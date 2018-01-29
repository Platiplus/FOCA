//
//  PerfilViewController.swift
//  FOCA_App
//
//  Created by Platiplus on 24/11/17.
//  Copyright © 2017 Platiplus. All rights reserved.
//

import UIKit

class PerfilViewController: UIViewController {
    
    @IBOutlet weak var fotoPerfil: UIImageView!
    @IBOutlet weak var horasTextField: UITextField!
    
    
    @IBAction func horasStepper(_ sender: UIStepper) {
        
        horasTextField.text = String(Int(sender.value))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.fotoPerfil.layer.cornerRadius = self.fotoPerfil.frame.size.width / 2;
        self.fotoPerfil.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
