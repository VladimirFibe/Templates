import SwiftUI

class HelloViewController: UIViewController {
    private lazy var rootView: BridgedView = {
            ContentView().bridge()
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addBridgedViewAsRoot(rootView)
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello")
            .padding()
            .background(Color.white)
    }
}
