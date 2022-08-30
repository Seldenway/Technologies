import UIKit
import Combine

class ReactiveTableViewCell: UITableViewCell {
    var cancellable = Set<AnyCancellable>()
    var styleOfSelection: UITableViewCell.SelectionStyle { .none }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = styleOfSelection
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {}
}
