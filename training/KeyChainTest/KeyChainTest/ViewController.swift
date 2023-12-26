//
//  ViewController.swift
//  KeyChainTest
//
//  Created by kimseongjun on 2023/08/18.
//

import UIKit

class ViewController: UIViewController {
    let keyChainManager = KeychainManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        add()
        read()
        delete()
    }

    func add() {
        do {
            try keyChainManager.saveToken(tokenType: TokenType.accessToken, token: "zxczxczxc")
            print("add 성공")
        } catch {
            print("add실패")
        }
        
    }

    func read() {
        var token: String? = ""
        do {
            try token = keyChainManager.readToken(tokenType: TokenType.accessToken)
        } catch {
            print("read 실패")
        }
        print(token)
    }
    
    func update() {
        
    }
    
    func delete() {
        do {
            try keyChainManager.deleteToken(tokenType: TokenType.accessToken)
            print("delete 성공")
        } catch {
            print("delete 실패")
        }
    }
}

