import UIKit
final class StateView: UIView {
    private let spinner = UIActivityIndicatorView(style: .medium)
    private let label = UILabel()
    override init(frame: CGRect) { super.init(frame: frame); configure() }
    required init?(coder: NSCoder) { super.init(coder: coder); configure() }
    private func configure() {
        let stack = UIStackView(arrangedSubviews: [spinner,label]); stack.axis = .vertical; stack.spacing = 12; stack.alignment = .center
        addSubview(stack); stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([stack.centerXAnchor.constraint(equalTo:centerXAnchor),stack.centerYAnchor.constraint(equalTo:centerYAnchor)])
        label.textColor = .secondaryLabel; label.numberOfLines = 0; label.textAlignment = .center
    }
    func showLoading() { isHidden = false; label.text = "Loading…"; spinner.startAnimating() }
    func showMessage(_ text:String) { isHidden = false; spinner.stopAnimating(); label.text = text }
    func hide() { isHidden = true; spinner.stopAnimating() }
}
