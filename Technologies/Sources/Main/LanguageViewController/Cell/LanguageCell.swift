import Foundation
import UIKit
import Swinject

final class LanguageCell: CommonTableViewCell {
    typealias ViewModelType = LanguageCellViewModel
    
    // MARK: - var
    
    var viewModel: LanguageCellViewModel? {
        didSet {
            bindViewModel()
        }
    }
    
    // MARK: - let
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
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
        addIconImageView()
        addLabel()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()

        iconImageView.image = nil
    }
    
    private func setup() {
        backgroundColor = .systemBackground
    }
    
    private func bindViewModel() {
        viewModel?.title
            .assign(to: \.text, on: label)
            .store(in: &cancellable)
        
        viewModel?.image?.publisher(with: .themeImage)
            .assign(to: \.image, on: iconImageView)
            .store(in: &cancellable)
    }
    
    private func addLabel() {
        contentView.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    private func addIconImageView() {
        contentView.addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            iconImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            iconImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
