import UIKit

final class ViewController: UIViewController, JokeFactoryDelegate {
    
    // MARK: - Outlets
    @IBOutlet private weak var IDView: UIStackView!
    @IBOutlet private weak var jokeID: UILabel!
    @IBOutlet private weak var typeView: UIStackView!
    @IBOutlet private weak var jokeType: UILabel!
    @IBOutlet private weak var setupView: UIStackView!
    @IBOutlet private weak var showPunchButton: UIButton!
    @IBOutlet private weak var refreshButton: UIButton!
    @IBOutlet private weak var jokeLabel: UILabel!
    
    // MARK: - Proprities
    private var jokeFactory: JokeFactoryProtocol? // фабрика шуток
    private var currentJoke: Joke?
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterface()
        hideJoke()
        
        jokeFactory = JokeFactory(delegate: self, jokeLoader: JokeLoader())
        jokeFactory?.loadData()
    }
    
    // MARK: - JokeFactoryDelegate
    // метод делегата JokeFactoryDelegate
    func didReceiveNextJoke(joke: Joke?) {
        guard let joke = joke else { return }
        currentJoke = joke
        showJoke(joke: joke)
    }
    
    // метод делегата в случае успешной загрузки данных с сервера
    func didLoadDataFromServer() {
        jokeFactory?.requestNextJoke()
    }
    
    // метод делегата в случае ошибки загрузки данных с сервера
    func didFailToLoadData(with error: Error) {
        showNetworkError(message: error.localizedDescription)
    }
    
    // MARK: - Private methods
    // формируем интерфейс форм согласно макету
    private func loadInterface() {
        // задаем значения для IDView
        IDView.layer.masksToBounds = true // разрешаем рисовать рамку
        IDView.layer.borderColor = UIColor.black.cgColor // красим рамку
        
        // задаем значения для typeGeneralView
        typeView.layer.masksToBounds = true // разрешаем рисовать рамку
        typeView.layer.borderColor = UIColor.black.cgColor // красим рамку
        
        // задаем значения для setupView
        setupView.layer.masksToBounds = true // разрешаем рисовать рамку
        setupView.layer.borderColor = UIColor.black.cgColor // красим рамку
        
        // задаем значения для showPuchButton
        showPunchButton.layer.masksToBounds = true // разрешаем рисовать рамку
        showPunchButton.layer.borderColor = UIColor.black.cgColor // красим рамку
        
        // задаем значения для refreshButton
        refreshButton.layer.masksToBounds = true // разрешаем рисовать рамку
        refreshButton.layer.borderColor = UIColor.black.cgColor // красим рамку
        
        // задаем значения для jokeLabel
        jokeLabel.layer.masksToBounds = true // разрешаем рисовать рамку
        jokeLabel.layer.borderColor = UIColor.black.cgColor // красим рамку
        
        // добавляем линию снизу лэйбла
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.jokeLabel.frame.height - 2, width: self.jokeLabel.frame.width, height: 2.0)
        bottomLine.backgroundColor = UIColor.black.cgColor
        jokeLabel.layer.addSublayer(bottomLine)
        
        // добавляем линию сверху лэйбла
        let topLine = CALayer()
        topLine.frame = CGRect(x: 0.0, y: 0.0, width: self.jokeLabel.frame.width, height: 2.0)
        topLine.backgroundColor = UIColor.black.cgColor
        jokeLabel.layer.addSublayer(topLine)
    }
    
    // отображаем данные шутки
    private func showJoke(joke: Joke) {
        jokeID.text = String(joke.id)
        jokeType.text = joke.type
        jokeLabel.text = joke.jokeText
    }
    
    // скрываем данные шутки
    private func hideJoke() {
        jokeID.text = ""
        jokeType.text = ""
        jokeLabel.text = "Downloading a joke"
    }
    
    // показываем алерт с панчлайном
    private func showAlert(message: String) {
        let alert = UIAlertController(
            title: "Punchline",
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default) { [weak self] _ in
            guard let self = self else { return }
            self.viewDidLoad()
        }
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    // показываем алерт в случае ошибки получения данных с сервера
    private func showNetworkError(message: String) {
        
        let alert = UIAlertController(
            title: "Произошла ошибка",
            message: "Не получилось загрузить данные с сервера",
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Попрбовать еще раз", style: .default) { [weak self] _ in
            guard let self = self else { return }
            self.viewDidLoad()
        }
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Actions
    @IBAction private func showButtonDidTape(_ sender: Any) {
        showAlert(message: currentJoke?.jokePunchline ?? "Ошибка загрузки данных")
    }
    
    @IBAction private func refreshButtonDidTape(_ sender: Any) {
        self.viewDidLoad()
    }
    
}
