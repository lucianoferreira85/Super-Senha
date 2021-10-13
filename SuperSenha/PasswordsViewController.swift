//
//  PasswordsViewController.swift
//  SuperSenha
//
//  Created by Luciano Ferreira on 06/10/21.
//

import UIKit

class PasswordsViewController: UIViewController {
    
    
    @IBOutlet weak var tvPasswords: UITextView!
    
    var numberOfCharacters: Int = 10
    var numberOfPasswords: Int = 1
    var useLetters: Bool!
    var useNumbers: Bool!
    var useCapitalLetters: Bool!
    var useSpecialCharacters: Bool!
    
    var passwordsGenerator: PasswordGenerator!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Total de senhas: \(numberOfPasswords)"
        passwordsGenerator = PasswordGenerator(numberOfCharacters: numberOfCharacters, useLetters: useLetters, useNumbers: useNumbers, useCapitalLetters: useCapitalLetters, useSpecialCharacters: useSpecialCharacters)
        
        generatePasswords()
        
    }
    
    @IBAction func generate(_ sender: UIButton) {
        generatePasswords()
    }
    
    func generatePasswords() {
        tvPasswords.scrollRangeToVisible(_NSRange(location: 0, length: 0))
        tvPasswords.text = ""
        let passwords = passwordsGenerator.generate(total: numberOfPasswords)
        for password in passwords {
            tvPasswords.text.append(password + "\n\n")
        }
    }
    


}
