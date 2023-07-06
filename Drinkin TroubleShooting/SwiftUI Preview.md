```swift
import SwiftUI

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }

    func makeUIViewController(context: Context) -> some UIViewController {
        LoginViewController()
    }
}

struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
    }
}

```

