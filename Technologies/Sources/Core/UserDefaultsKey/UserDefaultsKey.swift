import Foundation

//MARK: - UserDefaults

extension UserDefaults {
    struct Key<Value> {
        let name: String
        
        init(_ name: UserDefaultsKey) {
            self.name = name.rawValue
        }
    }
    
    
    subscript<V: Codable>(key: Key<V>) -> V? {
        get {
            guard let data = data(forKey: key.name) else { return nil }
            return try? JSONDecoder().decode(V.self, from: data)
        }
        set {
            guard let value = newValue,
                  let data = try? JSONEncoder().encode(value) else {
                set(nil, forKey: key.name)
                return
            }
            set(data, forKey: key.name)
        }
    }
    
    subscript(key: Key<URL>) -> URL? {
        get { url(forKey: key.name) }
        set { set(newValue, forKey: key.name) }
    }
    
    subscript(key: Key<String>) -> String? {
        get { string(forKey: key.name) }
        set { set(newValue, forKey: key.name) }
    }
    
    subscript(key: Key<Data>) -> Data? {
        get { data(forKey: key.name) }
        set { set(newValue, forKey: key.name) }
    }
    
    subscript(key: Key<Bool>) -> Bool {
        get { bool(forKey: key.name) }
        set { set(newValue, forKey: key.name) }
    }
    
    subscript(key: Key<Int>) -> Int {
        get { integer(forKey: key.name) }
        set { set(newValue, forKey: key.name) }
    }
    
    subscript(key: Key<Float>) -> Float {
        get { float(forKey: key.name) }
        set { set(newValue, forKey: key.name) }
    }
    
    subscript(key: Key<Double>) -> Double {
        get { double(forKey: key.name) }
        set { set(newValue, forKey: key.name) }
    }
    
    subscript(key: Key<Date>) -> Date? {
        get { object(forKey: key.name) as? Date }
        set { set(newValue, forKey: key.name) }
    }
}

//MARK: - Remove Object

extension UserDefaults {
    func removeObject(forKey defaultName: UserDefaultsKey) {
        removeObject(forKey: defaultName.rawValue)
    }
    
    func removeObjects(forKeys defaultNames: [UserDefaultsKey]) {
        defaultNames.forEach {
            removeObject(forKey: $0.rawValue)
        }
    }
}

//MARK: - UserDefaultsKey

enum UserDefaultsKey: String {
    case darkMode
    case language
}

extension UserDefaults.Key {
    typealias Key = UserDefaults.Key
    static var darkMode: Key<ThemeData> { Key<ThemeData>(.darkMode) }
    static var language: Key<Language> { Key<Language>(.language) }
}
