//
//  cadastroViewController.swift
//  FOCA_App
//
//  Created by Platiplus on 24/11/17.
//  Copyright © 2017 Platiplus. All rights reserved.
//

import UIKit

class cadastroViewController: UIViewController {
    
    
    @IBOutlet weak var fotoCadastro: UIImageView!
    @IBOutlet weak var usuarioTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var salvarButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        usuarioTextField.layer.cornerRadius = 15
        senhaTextField.layer.cornerRadius = 15
        salvarButton.layer.cornerRadius = 15
        
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
