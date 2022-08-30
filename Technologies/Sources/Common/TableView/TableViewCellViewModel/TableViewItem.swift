import Foundation

class TableViewItem: NSObject {
    var cellConfigurator: TableViewCellConfigurator
    let section: TableViewSection
    let action: Closure
    
    init(
        configurator: TableViewCellConfigurator,
        section: TableViewSection = .default,
        action: @escaping Closure
    ) {
        self.cellConfigurator = configurator
        self.section = section
        self.action = action

    }
    
    init(
        configurator: TableViewCellConfigurator,
        section: TableViewSection = .default
    ) {
        self.cellConfigurator = configurator
        self.section = section
        self.action = {}
    }
}
