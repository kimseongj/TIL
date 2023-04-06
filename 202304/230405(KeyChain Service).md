# KeyChain Service 

> KeyChain은 ''열쇠고리''라는 뜻으로 열쇠고리는 열쇠를 장식하거나, 어떤 키인지 구분시켜주는 역할을 한다.   `Attribute`가 열쇠고리이고, `Data`가 열쇠로 열 수 있는 데이터라고 생각하면 된다. `Attribute`를 바탕으로 암호화된 `Data`에 접근한다.
>
> 컴퓨터 사용자들은 안전하게 저장해야되는 데이터들이 있다. 사람들은 수많은 로그인정보를 가지고 있으며, 각각 다르게 저장하고 기억하는것은 불가능하다. 또한, 어디다 적어두는것이나 여러 로그인 정보를 동일하게 하는것은 안전하지 않다.

- 위 문제를 해결할 수 있는 것이 KeyChain이다. 안전하게 저장해야되는 데이터들은 암호화된 작은 저장 공간(keyChain)에 담음으로써 해결할 수 있다. 암호를 안전하게 기억한다면 사용자가 복잡한 암호를 선택하여 사용할 수 있다.

- KeyChain은 패스워드뿐만 아니라 신용카드의 정보 등 사용자가 안전하게 보호해야 하는 정보를 담을 수 있다.

- KeyChain은 앱 종료 및 앱 삭제 후 재설치를 진행해도 동일하게 저장된 값을 사용할 수 있다.

![](https://i.imgur.com/YpedVY8.png)





# Storing Keys in the Keychain

keychain은 안전하게 보호해야하는 작은 정보들을 담기에 적합하다.(패스워드, 암호화 키 등 )



### 1. 키체인에 아이템 추가

```swift
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
        updateItem(value: password, key: account)
    } else {
        print("Error")
    }
}
```

1. `kSecClass`: 데이터의 종류를 지정해준다.
2. `kSecAttrAccount`: 데이터 저장을 위한 키를 입력해준다.
3. `kSecValueData`: 저장될 데이터를 Data Type으로 형변환하여 전달한다.
4. `secItemAdd`: 메서드로써 키체인에 값을 추가하고 결과값을 반환해준다. (OSStatus를 반환한다.)
5. `errSecDuplicateItem`: 항목이 중복된 상태를 뜻한다.



### 키체인에 아이템 조회

```swift
func searchItem(key: Any) -> Any? {
  let searchQuery: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                            kSecReturnAttributes as String: true,
                            kSecReturnData as String: true]
  
  var item: CFTypeRef?
  let status = SecItemCopyMatching(searchQuery as CFDictionary, &item)
  
  guard status == errSecSuccess else { return }
  
  guard let existingItem = item as? [String: Any],
  let passwordData = existingItem[kSecValueData as String] as? Data,
  let password = String(data: passwordData, encoding: String.Encoding.utf8)
}
```

1. **kSecClass** : 데이터의 종류를 지정해준다. 
2. **kSecAttrAccount** : 데이터 저장을 위한 키를 입력해준다.
3. **kSecReturnAttributes** : 값이 항목 속성을 반환할지 여부를 나타내는 값이다.
4. **kSecReturnData** : 값이 항목 데이터를 반환할지 여부를 나타내는 값이다.
5. **SecItemCopyMatching** 함수 호출로 키체인에서 조회하여 결과값을 받는다.



### 키체인을 갱신

```swift
func updateItem(value: Any, key: Any) -> Bool {
    let prevQuery: [CFString: Any] = [kSecClass: kSecClassGenericPassword,
                                          kSecAttrAccount: key]
  
    let updateQuery: [CFString: Any] = [kSecValueData: (value as AnyObject).data(using: String.Encoding.utf8.rawValue) as Any]
    
    let result: Bool = {
        let status = SecItemUpdate(prevQuery as CFDictionary, updateQuery as CFDictionary)
        if status == errSecSuccess { return true }
        
        print("updateItem Error : \(status.description)")
        return false
    }()
    
    return result
}

```

1. 이전 키체인 쿼리문 정보를 담아준다. (CFDictionary; prevQuery)

2. 업데이트를 위한 쿼리(CFDictionary; updateQuery)를 작성한다.

3. **kSecValueData** : 업데이트 할 값(Value)이다.

4. **SecItemUpdate** 함수 호출로 해당 키 값의 키체인을 업데이트하여 결과값을 받는다.



### 키체인 삭제

```swift
func deleteItem(key: String) -> Bool {
    let deleteQuery: [CFString: Any] = [kSecClass: kSecClassGenericPassword,
                                        kSecAttrAccount: key]
    let status = SecItemDelete(deleteQuery as CFDictionary)
    if status == errSecSuccess { return true }
    
    print("deleteItem Error : \(status.description)")
    return false
}
```

1. **kSecClass** : 데이터의 종류를 지정해준다. 
2. **kSecAttrAccount** : 키 값을 지정해준다.

3. **SecItemDelete** 함수 호출로 해당 키 값의 키체인을 업데이트하여 결과값을 받는다.





# UserDefaults

- 앱 실행 시 지속적으로 키-값 쌍을 저장하는 사용자의 기본 데이터베이스에 대한 인터페이스이다.

- 기본 시스템을 사용하면 앱이 사용자의 기본 설정에 맞게 동작을 사용자 지정할 수 있다.
- 앱은 사용자의 기본 데이터베이스에 있는 매개변수 집합에 값을 할당하여 기본설정을 저장한다.
- float, double, integer, boolean, NSData, NSString, NSNumber, NSDate, NSArray 등등 유형의 객체를 저장할 수 있다.
- [데이터, 키] 쌍으로 데이터를 저장한다.

```swift
UserDefaults.standard.setValue("kim", forKey: "name")
UserDefaults.standard.setValue(27, forKey: "old")

let name = UserDefaults.standard.string(forKey: "name") // "kim"
let old = UserDefaults.standard.integer(forKey: "old") // 27
```





## ETC

App에서 정보를 저장하는 방식

- UserDefaults
- NSCache
- CoreData
- Sever-side
- KeyChain
- FileManager



## 참고

- [Key-Chain1 AppleDocument](https://developer.apple.com/documentation/security/keychain_services/keychain_items/adding_a_password_to_the_keychain)
- [Key-Chain2 AppleDocument](https://developer.apple.com/documentation/security/keychain_services/keychain_items/searching_for_keychain_items)
- [Key-Chain3 AppleDocument](https://developer.apple.com/documentation/security/keychain_services/keychain_items/updating_and_deleting_keychain_items)

- [차니의 기술 블로그](https://dvlpr-chan.tistory.com/27)



