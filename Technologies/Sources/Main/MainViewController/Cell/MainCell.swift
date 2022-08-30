import UIKit
import Combine

final class MainCell: CommonTableViewCell {
    typealias ViewModelType = MainCellViewModel
    
    // MARK: - var
    
    var viewModel: MainCellViewModel? {
        didSet {
            bindViewModel()
        }
    }
    
    // MARK: - let
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - Lifecycle function
    
    override func configure() {
        setup()
        addLabel()
        addIconImageView()
    }
    
    // MARK: - Flow function
    
    private func setup() {
        backgroundColor = .systemBackground
    }
    
    private func bindViewModel() {
        viewModel?.title
            .assign(to: \.text, on: label)
            .store(in: &cancellable)
        DynamicImage.arrowRight
            .publisher(with: .mainImage)
            .assign(to: \.image, on: iconImageView)
            .store(in: &cancellable)
    }
    
    private func addLabel() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    private func addIconImageView() {
        addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: topAnchor),
            iconImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            iconImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
