//
//  HobbiesView.swift
//  Homework3
//
//  Created by Евгений Борисов on 27.04.2024.
//

import UIKit

protocol HobbiesViewDelegate: AnyObject, UIScrollViewDelegate { }

class HobbiesView: UIView {

    weak var delegate: HobbiesViewDelegate?

    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.delegate = delegate
        return scrollView
    }()

    private lazy var scrollContentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.backgroundColor = .cyan
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .black
        return pageControl
    }()

    init(delegate: HobbiesViewDelegate) {
        super.init(frame: CGRect.zero)
        self.delegate = delegate
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: Setup UI
private extension HobbiesView {
    func setupView() {
        backgroundColor = .white
        addSubviews()
        setupLayout()
    }

    func addSubviews() {
        addSubview(scrollView)
        addSubview(pageControl)
        scrollView.addSubview(scrollContentStackView)
    }

    func setupLayout() {
        let contentLayoutGuide = scrollView.contentLayoutGuide

        NSLayoutConstraint.activate([
            pageControl.heightAnchor.constraint(equalToConstant: 30),
            pageControl.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            pageControl.centerXAnchor.constraint(equalTo: centerXAnchor),

            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -10),

            scrollContentStackView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
            scrollContentStackView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor),
            scrollContentStackView.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor),
            scrollContentStackView.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor),

            scrollContentStackView.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor)
        ])
    }
}


// MARK: Setup Data
extension HobbiesView {
    func setupData(with hobbies: [Hobby]) {
        for hobby in hobbies {
            scrollContentStackView.addArrangedSubview(HobbyContentView(hobby: hobby))
        }

        pageControl.numberOfPages = hobbies.count
    }
}
