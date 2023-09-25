import UIKit

extension UIViewController {
    public class var identifier: String {
        String(describing: self)
    }

    public func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func addBridgedView(_ bridgedView: BridgedView) {
        addChild(bridgedView)
        view.addSubview(bridgedView.view)
        bridgedView.didMove(toParent: self)
    }

    public func add(_ child: UIViewController, to view: UIView, stickingToEdges: Bool = true) {
        addChild(child)
        if stickingToEdges {
            view.addSubviewStickingToEdges(child.view)
        } else {
            view.addSubview(child.view)
        }
        child.didMove(toParent: self)
    }

    func addIgnoringSafeArea(_ bridgedView: BridgedView) {
        add(bridgedView)
        bridgedView.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bridgedView.view.topAnchor.constraint(equalTo: self.view.topAnchor),
            bridgedView.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            bridgedView.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            bridgedView.view.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }

    func addIgnoringSafeArea(_ bridgedView: BridgedView, to view: UIView) {
        addChild(bridgedView)
        view.addSubview(bridgedView.view)
        bridgedView.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bridgedView.view.topAnchor.constraint(equalTo: view.topAnchor),
            bridgedView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bridgedView.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            bridgedView.view.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }

    func addBridgedViewAsRoot(_ bridgedView: BridgedView, topToSafeAreaLayoutGuide: Bool = true) {
        add(bridgedView)
        bridgedView.view.translatesAutoresizingMaskIntoConstraints = false
        let topAnchor = topToSafeAreaLayoutGuide ? view.safeAreaLayoutGuide.topAnchor : view.topAnchor
        NSLayoutConstraint.activate([
            bridgedView.view.topAnchor.constraint(equalTo: topAnchor),
            bridgedView.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            bridgedView.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            bridgedView.view.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }

    public func remove(childController: UIViewController) {
        childController.willMove(toParent: nil)
        childController.view.removeFromSuperview()
        childController.removeFromParent()
    }

    public func remove() {
        guard parent != nil else {
            return
        }

        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
