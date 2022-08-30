import UIKit

final class LocalizationViewController: DynamicViewController<LocalizationViewModel> {
    
    // MARK: - let
    
    private let stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        return stepper
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Lifecycle function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        addStepper()
        bindStepper()
        addLabel()
    }
    
    // MARK: - Flow function
    
    private func bindViewModel() {
        viewModel.title
            .assign(to: \.title, on: self)
            .store(in: &cancellable)
        viewModel.text
            .assign(to: \.text, on: label)
            .store(in: &cancellable)
    }
    
    private func bindStepper() {
        let action = UIAction { [unowned self] action in
            let stepper = action.stepper
            viewModel.setNewValue(stepper.value)
        }
        stepper.addAction(action, for: .valueChanged)
    }
    
    private func addStepper() {
        view.addSubview(stepper)
        NSLayoutConstraint.activate([
            stepper.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stepper.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])
    }
    
    private func addLabel() {
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            label.bottomAnchor.constraint(equalTo: stepper.topAnchor, constant: -20)
        ])
    }
}
