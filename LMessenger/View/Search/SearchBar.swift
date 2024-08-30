//
//  SearchBar.swift
//  LMessenger
//
//  Created by yujaehong on 8/28/24.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {
    
    @Binding var text: String
    @Binding var shouldBecomeFirstResponder: Bool
    var onClickedSearchButton: (() -> Void)?
    
    init(text: Binding<String>,
         shouldBecomeFirstResponder: Binding<Bool>,
         onClickedSearchButton: (() -> Void)?) {
        self._text = text
        self._shouldBecomeFirstResponder = shouldBecomeFirstResponder
        self.onClickedSearchButton = onClickedSearchButton
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text, shouldBecomeFirstResponder: $shouldBecomeFirstResponder, onClickedSearchButton: onClickedSearchButton)
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.searchBarStyle = .minimal
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
    func updateUIView(_ searchBar: UISearchBar, context: Context) {
        updateSearchText(searchBar, context: context)
        updateBecomeFirstResponder(searchBar, context: context)
    }
    
    private func updateSearchText(_ searchBar: UISearchBar, context: Context) {
        context.coordinator.setSearchText(searchBar, text: text)
    }
    
    private func updateBecomeFirstResponder(_ searchBar: UISearchBar, context: Context) {
        guard searchBar.canBecomeFirstResponder else { return }
        
        DispatchQueue.main.async {
            if shouldBecomeFirstResponder {
                guard  !searchBar.isFirstResponder else { return }
                searchBar.becomeFirstResponder()
            } else {
                guard searchBar.isFirstResponder else { return }
                searchBar.resignFirstResponder()
            }
        }
        
    }
    
}

// SearchBar에서 텍스트가 변경이 될때 바인딩 텍스트 값이 업데이트가 되어야함
// 텍스트가 변경이 될때는 UISearchBar에 delegate로 정보를 얻어올수 있음
// delegate를 사용하기 위해서 Coordinator를 정의

extension SearchBar {
    
    class Coordinator: NSObject, UISearchBarDelegate {
        
        @Binding var text: String
        @Binding var shouldBecomeFirstResponder: Bool
        var onClickedSearchButton: (() -> Void)?
        
        init(text: Binding<String>,
             shouldBecomeFirstResponder: Binding<Bool>,
             onClickedSearchButton: (() -> Void)?) {
            self._text = text
            self._shouldBecomeFirstResponder = shouldBecomeFirstResponder
            self.onClickedSearchButton = onClickedSearchButton
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            self.text = searchText
        }
        
        func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            self.shouldBecomeFirstResponder = true
        }
        
        func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
            self.shouldBecomeFirstResponder = false
        }
        
        func setSearchText(_ searchBar: UISearchBar, text: String) {
            searchBar.text = text
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            onClickedSearchButton?()
        }
    }
    
}
