import UIKit

final class CommonSection: ConfigurableView {
    
    // MARK: - let
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .footnote)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - init

    init(title: String) {
        super.init(frame: .zero)
        bindTitle(title)
        addLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Flow function
    
    private func bindTitle(_ title: String) {
        title.publisher
            .assign(to: \.text, on: label)
            .store(in: &cancellable)
        DynamicColor.section.publisher
            .assign(to: \.textColor, on: label)
            .store(in: &cancellable)
    }
    
    private func addLabel() {
        addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            label.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

