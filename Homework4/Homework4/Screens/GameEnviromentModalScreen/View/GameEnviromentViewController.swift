import UIKit

class GameEnviromentViewController: UIViewController {
    private lazy var enviromentTitleLabel: UILabel = {
        let enviromentTitleLabel = UILabel()
        enviromentTitleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        enviromentTitleLabel.textColor = .black
        enviromentTitleLabel.translatesAutoresizingMaskIntoConstraints = false

        return enviromentTitleLabel
    }()

    private lazy var availibilityTitleLabel: UILabel = {
        let availibilityTitleLabel = UILabel()
        availibilityTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        availibilityTitleLabel.font = Constants.labelFont
        availibilityTitleLabel.text = "Availibility: "

        return availibilityTitleLabel
    }()

    private lazy var availibilityLabel: UILabel = {
        let availibilityLabel = UILabel()
        availibilityLabel.translatesAutoresizingMaskIntoConstraints = false
        availibilityLabel.font = Constants.labelFont
        
        return availibilityLabel
    }()

    private let viewModel: GameEnviromentViewModel

    init(viewModel: GameEnviromentViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPresentation()
        setupUI()
        bindViewModel()
        setupData()
        viewModel.changeAvailibity()
    }

    func setupData() {
        enviromentTitleLabel.text = viewModel.enviromentName

        guard let availibility = viewModel.gameAvailibility.value else { return }
        availibilityLabel.text = availibility.rawValue
        availibilityLabel.textColor = availibility.color
    }

    func bindViewModel() {
        viewModel.gameAvailibility.bind {[weak self] availibility in
            guard let self, let availibility else { return }
            self.availibilityLabel.textColor = availibility.color
            self.availibilityLabel.text = availibility.rawValue
        }
    }
}

// MARK: Navigation
private extension GameEnviromentViewController {
    func setupPresentation() {
        if let sheet = presentationController as? UISheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersEdgeAttachedInCompactHeight = true
        }
    }
}

// MARK: Setup UI
private extension GameEnviromentViewController {
    func setupUI() {
        view.backgroundColor = .white
        addSubviews()
        setupLayout()
    }

    func addSubviews() {
        view.addSubview(enviromentTitleLabel)
        view.addSubview(availibilityTitleLabel)
        view.addSubview(availibilityLabel)
    }

    func setupLayout() {

        NSLayoutConstraint.activate([
            enviromentTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            enviromentTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            availibilityTitleLabel.topAnchor.constraint(equalTo: enviromentTitleLabel.bottomAnchor, constant: 10),
            availibilityTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),

            availibilityLabel.leadingAnchor.constraint(equalTo: availibilityTitleLabel.trailingAnchor, constant: 5),
            availibilityLabel.centerYAnchor.constraint(equalTo: availibilityTitleLabel.centerYAnchor)
        ])

    }
}




