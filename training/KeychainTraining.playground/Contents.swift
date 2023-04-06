import UIKit
import Security

struct Credentials {
    var userName: String
    var password: String
}

func addItem() {
    let credentials = Credentials(userName: "songjun", password: "ksj123")
    let account = credentials.userName
    let password = credentials.password.data(using: String.Encoding.utf8)!
    let query: [CFString: Any] = [kSecClass: kSecClassGenericPassword,
                            kSecAttrAccount: account,
                              kSecValueData: password]
    let status = SecItemAdd(query as CFDictionary, nil)
    if status == errSecSuccess {
        
    } else if status == errSecDuplicateItem {
        
    } else {
        print("Error")
    }
}

func readItem() {
    let account = "songjun"
    let query: [CFString: Any] = [kSecClass: kSecClassGenericPassword,
                            kSecAttrAccount: account,
                       kSecReturnAttributes: true,
                             kSecReturnData: true]
    var item: CFTypeRef?
    if SecItemCopyMatching(query as CFDictionary, &item) != errSecSuccess {
        
    }
}


func updateItem(value: Any, key: Any) {

    let previousQuery: [CFString: Any] = [kSecClass: kSecClassGenericPassword,
                                    kSecAttrAccount: key]
    let updateQuery: [CFString: Any] = [kSecValueData: value]
    let status = SecItemUpdate(previousQuery as CFDictionary, updateQuery as CFDictionary)
    
    if status == errSecSuccess {
        print("complete")
    } else {
        print("not finish")
    }
}

func deleteItemOnKeyChain(key: String) {
    let deleteQuery: [CFString: Any] = [kSecClass: kSecClassGenericPassword,
                                        kSecAttrAccount: key]
    let status = SecItemDelete(deleteQuery as CFDictionary)
    if status == errSecSuccess {
        print("remove")
    } else {
        print("remove fail ")
    }
}
