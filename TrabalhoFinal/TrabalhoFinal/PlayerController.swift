//
//  PlayerController.swift
//  TrabalhoFinal
//
//  Created by user239587 on 5/2/23.
//

import UIKit

class PlayerController : UIViewController {
    
    var parametro : Player?
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        guard let p = parametro else{
            return
        }
        
        print(p)

        view.backgroundColor = .cyan
        
        let leftBarButtonItem = UIBarButtonItem(title: "< Voltar", style: .plain, target: self, action: #selector(menuButtonTapped))
        
        leftBarButtonItem.tintColor = .red
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        
    }
    
    
    @objc func menuButtonTapped() {
        self.navigationController?.popViewController(animated: true)
        
    }
}
