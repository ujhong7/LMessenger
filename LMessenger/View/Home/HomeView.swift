//
//  HomeView.swift
//  LMessenger
//
//  Created by yujaehong on 8/12/24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var container: DIContainer
    @EnvironmentObject var navigationRouter: NavigationRouter
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationStack(path: $navigationRouter.destination) {
            contentView
                .fullScreenCover(item: $viewModel.modalDestination) {
                    switch $0 {
                    case .myProfile:
                        MyProfileView(viewModel: .init(container: container, userId: viewModel.userId))
                    case let .otherProfile(userId):
                        OtherProfileView(viewModel: .init(container: container, userId: userId)) { otherUserInfo in
                            viewModel.send(action: .goToChat(otherUserInfo))
                        }
                    case .setting:
                        SettingView(viewModel: .init())
                    }
                }
                .navigationDestination(for: NavigationDestination.self) {
                    NavigationRoutingView(destination: $0)
                }
        }
    }
    
    @ViewBuilder
    var contentView: some View {
        switch viewModel.phase {
        case .notRequested:
            PlaceholderView()
                .onAppear {
                    viewModel.send(action: .load)
                }
        case .loading:
            LoadingView()
        case .success:
            loadedView
                .toolbar {
                    Image(decorative: "bookmark")
                    Image(decorative: "notifications")
                    Image(decorative: "person_add")
                    Button {
                        // TODO:
                    } label: {
                        Image("settings", label: Text("설정"))
                    }
                }
        case .fail:
            ErrorView()
        }
    }
    
    var loadedView: some View {
        ScrollView{
            profileView
                .padding(.bottom, 30)
            
            NavigationLink(value: NavigationDestination.search(userId: viewModel.userId)) {
                SearchButton()
            }
            .padding(.bottom, 24)
            
            HStack {
                Text("친구")
                    .font(.system(size: 14))
                    .foregroundColor(.bkText)
                Spacer()
            }
            .padding(.horizontal, 30)
            
            // TODO: 친구 목록
            if viewModel.users.isEmpty {
                Spacer(minLength: 89)
                emptyView
            } else {
                // LazyVStack 무한정으로 늘어날수있기 때문에...
                LazyVStack {
                    ForEach(viewModel.users, id: \.id) { user in
                        Button {
                            viewModel.send(action: .presentOtherProfileView(user.id))
                        } label: {
                            HStack(spacing: 8) {
                                Image("person")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                Text(user.name)
                                    .font(.system(size: 12))
                                    .foregroundColor(.bkText)
                                Spacer()
                            }
                            .accessibilityElement(children: .ignore)
                            .accessibilityLabel(user.name)
                            .accessibilityAddTraits(.isButton)
                        }
                        .padding(.horizontal, 30)
                    }
                }
            }
        }
        
    }
    
    var profileView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 7) {
                Text(viewModel.myUser?.name ?? "이름")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.bkText)
                Text(viewModel.myUser?.description ?? "상태 메시지 입력")
                    .font(.system(size: 12))
                    .foregroundColor(.greyDeep)
            }
            
            Spacer()
            
            Image("person")
                .resizable()
                .frame(width: 52, height: 52)
                .clipShape(Circle())
        }
        .padding(.horizontal, 30)
        .onTapGesture {
            viewModel.send(action: .presentMyProfileView)
        }
        .accessibilityElement(children: .combine)
        .accessibilityHint(Text("내 프로필을 보려면 이중탭하십시오."))
        .accessibilityAction {
            viewModel.send(action: .presentView(.myProfile))
        }
    }
    
    var emptyView: some View {
        VStack {
            VStack(spacing: 3) {
                Text("친구를 추가해보세요.")
                    .foregroundColor(.bkText)
                Text("큐알코드나 검색을 이용해서 친구를 추가해보세요.")
                    .foregroundColor(.greyDeep)
            }
            .font(.system(size: 14))
            .padding(.bottom, 30)
            
            Button {
                viewModel.send(action: .requestContacts)
            } label: {
                Text("친구추가")
                    .font(.system(size: 14))
                    .foregroundColor(.bkText)
                    .padding(.vertical, 9)
                    .padding(.horizontal, 24)
            }
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.greyLight)
            }
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static let container: DIContainer = .init(services: StubService())
    static let navigationRouter: NavigationRouter = .init()
    
    static var previews: some View {
        HomeView(viewModel: .init(container: Self.container, navigationRouter: Self.navigationRouter, userId: "user1_id"))
            .environmentObject(navigationRouter)
            .environmentObject(Self.container)
    }
}
