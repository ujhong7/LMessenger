# LMessenger

### 프로젝트 개요

- 인원: 1명
- 기간: 2024.08.11 ~ 2024.08.30

### 한 줄 소개

- Firebase 네트워크 통신을 기반으로 
Line앱의 메세지 기능을 클론한 앱

### 앱 미리보기

<p align="center" witdh="100%">
<img src="https://imgur.com/mUBnFXN.gif" width="19%">
<img src="https://imgur.com/tD6DPGp.gif" width="20%">
<img src="https://imgur.com/YRVrFt8.gif" width="20%">
<img src="https://imgur.com/ynX4ndN.gif" width="40%">
</p>


### 개발 환경

- Deployment Target: 16.4
- Localizations: English, Korean
- App Appearances: Light, Dark

### 기술

- Architecture: `MVVM`
- Firebase: `Firebase Auth`, `Firebase Realtime Database`, `Firebase Cloud Messaging`, `Firebase Cloud Storage`
- UI: `UIKit`, `SwiftUI`
- Reactive: `Combine`
- Database: `CoreData`
- 
### 기능

- 구글 로그인
- 채팅
- 친구목록 검색
- 라이트/다크모드 변경 

---

### 주요 성과

- **프로토콜 기반의 의존성 역전 원칙 적용**:  
  `UserService`, `AuthService`와 같은 비즈니스 로직을 다루는 서비스 레이어에서 프로토콜을 사용해 모듈 간의 결합도를 낮추고 테스트 가능성을 높임  
  각 서비스는 DI Container를 통해 주입되어, 모듈 간의 의존성을 효과적으로 관리함.  
  이로 인해 새로운 기능 추가 시 유지보수가 용이해졌고, 단위 테스트 구현이 쉬워짐
  <br><br>
- **네비게이션 라우터를 활용한 모듈화된 화면 전환 구조**:  
  화면 전환 및 네비게이션 흐름을 담당하는 라우터를 도입하여 앱의 화면 전환을 모듈화하고 유연성을 높임.  
  각 화면 간의 네비게이션을 독립적인 라우터가 관리함으로써 코드의 재사용성을 증가시키고, 네비게이션 로직을 중앙에서 관리하여 유지보수를 용이하게 만듦.  
  새로운 화면 추가 시에도 최소한의 코드 수정으로 통합 가능.
  <br><br>
- **접근성(Accessibility) 기능 강화**:  
  VoiceOver 사용자를 위한 사용자 인터페이스 최적화, 특히 메시징 기능에서의 접근성 문제를 해결하여 시각 장애인 사용자도 원활하게 앱을 이용할 수 있도록 함.  
  메시지 리스트에서 VoiceOver로 읽기 기능을 추가하고, 중요한 상호작용 요소에 대해 적절한 라벨링을 적용함으로써 접근성을 개선함.
  <br><br>
- **Core Data를 활용한 검색 결과 저장 기능 구현**:  
  Core Data를 사용하여 사용자의 검색 결과를 로컬 데이터베이스에 저장하고, 네트워크 요청을 최소화하여 앱의 성능을 개선함.  
  검색 결과가 저장되며, 네트워크 연결 상태와 상관없이 저장된 결과를 다시 불러올 수 있음.  
  또한, 저장된 데이터는 정렬 및 필터링 기능을 제공하여 사용자 경험을 향상시킴.
  <br><br>
- **Firebase Auth를 통한 사용자 인증**:  
  Firebase Auth를 사용하여 Google 로그인 및 사용자 인증 기능을 구현했습니다.  
  이를 통해 사용자 관리가 용이해지고 보안성이 강화되었습니다.  
  Google 로그인을 통해 사용자의 신원을 확인하고, 인증된 사용자만 접근할 수 있는 기능을 제공하여 앱의 보안을 강화했습니다.  
  이로 인해 사용자는 안전하게 앱에 로그인하고, 인증된 사용자만이 특정 기능을 이용할 수 있게 되었습니다.
  <br><br>
- **Firebase Realtime Database를 활용한 실시간 데이터 처리**:  
  Firebase Realtime Database를 사용하여 실시간으로 채팅 메시지를 전송하고 채팅방의 데이터 동기화를 구현했습니다.  
  이를 통해 사용자 간의 원활한 실시간 커뮤니케이션을 지원했습니다.  
  채팅방에서 메시지를 보내거나 받을 때 데이터가 즉시 업데이트되어 사용자 간의 실시간 상호작용을 가능하게 했습니다.  
  데이터 동기화 문제를 최소화하여 사용자 경험을 개선하였으며, 채팅 데이터의 신속한 전송과 수신을 통해 실시간 커뮤니케이션의 효율성을 높였습니다.
  <br><br>
- **Firebase Cloud Storage를 통한 파일 업로드**:  
  Firebase Cloud Storage를 사용하여 사용자 파일 및 이미지를 클라우드에 업로드하고 저장했습니다.  
  이를 통해 파일 관리와 저장이 용이해졌습니다.  
  사용자 프로필 사진, 채팅 파일 등 다양한 유형의 파일을 클라우드에 저장하고 필요 시 쉽게 접근할 수 있도록 하여 앱의 파일 관리 기능을 강화했습니다.
  이로 인해 사용자는 클라우드에 저장된 파일을 언제든지 접근할 수 있으며, 파일 업로드 및 다운로드가 효율적으로 이루어졌습니다.
  <br><br>
-  **라이트/다크 모드 설정 기능 구현**:  
   사용자 설정에 따라 앱의 테마를 라이트, 다크, 또는 시스템 모드로 변경할 수 있는 기능을 구현함.  
   @AppStorage와 AppearanceController를 활용해 테마 설정을 저장하고, 앱 전반에서 실시간으로 반영되도록 함.  
   사용자들은 설정 화면에서 원하는 모드를 선택하여 개인화된 UI 경험을 제공받음.

---

## 트러블 슈팅

### 1️⃣ 커스텀 키보드 툴바 구현  
#### 🤔 **상황**  
키보드가 활성화될 때 메시지 입력 필드 위에 툴바(Toolbar)를 표시해야 했습니다.  
처음에는 SwiftUI의 `.toolbar`와 `ToolbarItemGroup`을 사용하여 키보드가 활성화되었을 때 툴바를 표시했습니다.  
<img width="300" alt="툴바스샷" src="https://github.com/user-attachments/assets/5ce256d9-c073-4cde-b8c2-d3af5916136c">  
하지만 이 방법은 키보드가 활성화된 후에만 툴바가 나타났습니다.  
구현하고자 하는 것은 키보드가 활성화되기 전에도 툴바가 보이도록 하는 것이었습니다.   
이를 위해 커스텀하게 키보드 툴바를 구현할 필요가 있었습니다.

#### 🚨 **문제**

- 기본적으로 제공되는 `.toolbar`와 `ToolbarItemGroup`을 사용하면 키보드가 활성화된 후에만 툴바가 나타납니다.  
- 툴바가 항상 화면에 보이도록 하는 방법이 필요했습니다.  

#### 🛠️ **해결 과정**

키보드가 활성화되기 전에도 툴바가 보이도록 하기 위해 커스텀 뷰(View Modifier)를 구현했습니다.  
이 ViewModifier는 툴바를 항상 하단에 배치하며, 키보드가 활성화되었을 때도 그 자리를 유지합니다.  
<img width="700" alt="키보드스샷" src="https://github.com/user-attachments/assets/0f458ab4-dd59-4f0e-9f7f-e492886089ae">  
이 ViewModifier를 사용하여, 툴바가 항상 화면의 하단에 위치하며, 키보드가 올라와도 동일한 위치를 유지합니다.  


#### 📝 **결과**

이 커스텀 뷰 수정자를 통해 키보드가 활성화되기 전에도 툴바를 항상 화면 하단에 표시할 수 있었습니다.  
또한, 키보드가 활성화되더라도 툴바는 그 자리를 유지하며 사용자 경험을 향상시킬 수 있었습니다.  

<br>

### 2️⃣ NavigationRouter를 이용한 화면 전환 관리

#### 🤔 **상황**

메신저 앱에서 다양한 화면 전환이 필요한 상황이 있었습니다.  
예를 들어, 홈 화면에서 채팅 화면으로 이동하거나, 유저 프로필을 조회하는 등의 복잡한 화면 전환을 관리해야 했습니다.  
기존의 SwiftUI에서 제공하는 `NavigationLink`와 `NavigationStack`을 사용할 때,  
화면 전환 간 경로를 제어하거나 특정 화면으로 돌아가는 동작을 구현하는 데 어려움이 있었습니다.  

#### 🚨 **문제**

- 단순히 `NavigationLink`만으로는 각 화면 간 이동 상태를 효율적으로 관리하기 어려웠고,  
특히 여러 화면을 스택 형태로 쌓아 올리는 복잡한 네비게이션 로직에서  
`pop`이나 `popToRoot` 같은 동작을 쉽게 처리할 수 있는 방법이 필요했습니다.  

#### 🛠️ **해결 과정**

이를 해결하기 위해, **NavigationRouter** 클래스를 구현하여 화면 전환을 더욱 유연하고 직관적으로 관리할 수 있도록 했습니다.  
`NavigationRouter`는 **ObservableObject**로 구현되어, 화면 간 전환을 제어할 수 있게 하였습니다.  

1. **NavigationRouter 클래스 구현**  
`NavigationRouter`는 화면 전환 상태를 관리하며, 네비게이션 스택을 직접 제어할 수 있습니다.  
<img width="400" alt="naviRouter" src="https://github.com/user-attachments/assets/77901a10-7f78-4305-a256-86babdd12516">

`push`, `pop`, `popToRoot` 같은 메소드를 통해 화면 이동을 간편하게 관리할 수 있습니다.  
`NavigationDestination` 열거형을 사용하여 여러 화면을 목적지로 지정할 수 있습니다.  

2. **화면 전환 로직**
`NavigationRouter`를 사용해 화면을 전환할 때, `NavigationDestination` 열거형을 활용하여 전환할 화면을 구분합니다.
이를 통해 각각의 화면 전환을 명확하게 관리할 수 있습니다.  
<img width="515" alt="NavigationDestination" src="https://github.com/user-attachments/assets/fe80e515-613f-4803-b84c-25db9c958a1f">

`NavigationDestination`은 다양한 화면을 구분하며, 해당 화면에 필요한 데이터를 전달할 수 있습니다.  
예를 들어, `chatRoomId`, `myUserId`, `otherUserId`를 사용해 특정 채팅방으로 전환합니다.  

3. **View에서 NavigationRouter 사용**
`NavigationStack`과 `$navigationRouter.destination`을 연결하여, `NavigationRouter`를 통해 화면을 전환할 수 있도록 했습니다.  
`navigationDestination`을 통해 각각의 목적지에 맞는 뷰를 렌더링합니다.  

<img width="700" alt="naviRoutingEx" src="https://github.com/user-attachments/assets/640f5f46-0edf-41aa-89e5-e62c6f149214">


#### 📝 **결과**

이 커스텀 네비게이션 라우터를 구현한 덕분에, 화면 전환을 좀 더 유연하고 직관적으로 관리할 수 있었습니다.  
특히, 다양한 경로 간에 이동하는 메신저 앱에서 여러 화면을 오가며 네비게이션 스택을 제어하는 작업이 훨씬 간단해졌습니다.  

<br>

### 3️⃣ SwiftUI와 UIKit 통합: UISearchBar의 SwiftUI 적용

#### 🤔 **상황**
UISearchBar를 활용하여 사용자 입력과 검색 버튼 이벤트를 처리하고자 했습니다.  
SwiftUI는 UISearchBar와 같은 특정 UIKit 컴포넌트를 네이티브로 지원하지 않기 때문에, 검색 창 구현에 어려움이 있었습니다.

#### 🚨 **문제**
SwiftUI는 선언형 UI로, UIKit의 델리게이트 패턴을 바로 사용할 수 없기 때문에, UISearchBar를 SwiftUI에 통합하는 방법이 필요했습니다.  
또한, 검색 창의 텍스트 변경 및 검색 버튼 클릭 이벤트를 SwiftUI의 상태와 연동하는 작업이 필요했습니다.  

#### 🛠️ **해결 과정**
SwiftUI와 UIKit을 통합하기 위해 `UIViewRepresentable`과 `Coordinator` 패턴을 도입했습니다.  
`UIViewRepresentable`은 UIKit 뷰를 SwiftUI에서 사용할 수 있도록 하고,  
`Coordinator`는 UIKit의 델리게이트 패턴을 SwiftUI로 연결해주는 역할을 합니다.  

1. **UIViewRepresentable 사용**:
    - `UIViewRepresentable`을 사용해 `UISearchBar`를 SwiftUI로 가져와서 화면에 표시.  
      
    <img width="700" alt="SearchBar" src="https://github.com/user-attachments/assets/fa612f12-fa9a-42c3-8704-05004687dd2c">

2. **Coordinator 패턴 사용**:
    - UIKit의 델리게이트 패턴을 SwiftUI에서 사용하기 위해 `Coordinator`를 구현.
    - `UISearchBarDelegate`를 활용하여 텍스트 변경 시 SwiftUI의 상태를 업데이트하고, 검색 버튼 클릭 이벤트를 처리.  
      
    <img width="450" alt="Coordinator" src="https://github.com/user-attachments/assets/1b1a461a-c385-4ae5-87bf-fc5c3704061f">

3. **상태 관리 및 입력 이벤트 처리**:
    - `UISearchBar`의 텍스트 변경 및 검색 버튼 클릭을 SwiftUI의 `@Binding`된 상태로 연결하여 입력된 값을 실시간으로 반영했습니다.
    - 검색 버튼이 클릭되면 `onClickedSearchButton` 클로저를 실행해 검색 결과를 처리했습니다.

#### 📝 **결과**
UIViewRepresentable과 Coordinator 패턴을 통해  
SwiftUI 앱에서 UISearchBar를 사용하여 검색 기능을 추가하고, 입력된 텍스트와 이벤트를 SwiftUI의 상태와 연결하였습니다.  
SwiftUI의 선언형 스타일과 UIKit의 복잡한 델리게이트 패턴을 조화롭게 사용할 수 있는 방법을 배웠고,  
향후 다양한 UIKit 컴포넌트를 통합하는 데 유용하게 사용할 수 있을 것 같습니다.

<br>

### 4️⃣  프로토콜 기반 설계로 유연성과 테스트 용이성 확보

#### 🤔 **상황**
앱 개발 초기에 여러 서비스 간의 의존성이 강하게 결합되어 있었습니다.  
특히 인증, 사용자, 채팅과 관련된 다양한 서비스들은 서로 간에 직접적인 의존 관계가 많았으며,  
이로 인해 각 서비스의 독립적인 테스트가 어려웠습니다. 또한, 런타임 환경에 맞춰 특정 구현을 주입해야 할 필요성도 있었습니다.  

#### 🚨 **문제**  

앱의 서비스 구조가 구체적인 클래스들 간의 강한 결합으로 인해 테스트 환경에서 다음과 같은 문제들이 발생했습니다:  
- **단위 테스트의 어려움**: 네트워크 요청이나 데이터베이스 작업을 포함하는 서비스들은 독립적으로 테스트할 수 없었습니다.  
  매번 실제 데이터베이스에 연결하거나 네트워크 요청을 처리해야 했고, 이는 테스트 시간이 길어지고 안정성 문제가 생겼습니다.
- **서비스 확장의 어려움**: 서비스 로직을 변경할 때마다, 서로 의존하는 다른 서비스에도 영향을 미쳤습니다.  
  새로운 요구사항이 발생할 때 기존 코드를 변경하는 것이 까다로웠고, 이는 유지보수에 어려움을 초래했습니다.
- **테스트 시 외부 의존성**: 특정 서비스가 네트워크나 데이터베이스와 강하게 결합되어 있어, 테스트가 외부 환경에 의존적이었고,  
  이를 해결하기 위해서는 더 많은 설정이 필요했습니다.

#### 🛠️ **해결 과정**

이러한 문제를 해결하기 위해 **프로토콜 기반의 설계**를 도입했습니다.  
프로토콜을 활용하여 서비스의 인터페이스를 정의하고, 이를 통해 구체적인 구현체와 상관없이 일관된 방식으로 서비스에 접근할 수 있도록 했습니다.  

1. **서비스 분리 및 프로토콜 정의**: 각 서비스마다 프로토콜을 정의하여 구체적인 구현체와 분리했습니다.  
   이를 통해 서비스의 역할을 명확히 하고, 각 서비스는 해당 프로토콜을 통해 의존성을 가지도록 했습니다.  
   <img width="700" alt="protocol2" src="https://github.com/user-attachments/assets/bb51120d-0353-4295-af44-843b3f66092c">

    
2. **스텁(Stub) 서비스 도입**: 실제 서비스 구현체와 더불어, 테스트 용도로 스텁을 도입했습니다.  
   이를 통해 테스트 환경에서는 외부 의존성을 최소화하고, 스텁을 사용하여 네트워크나 데이터베이스 호출을 대체할 수 있었습니다.  
   <img width="700" alt="protocol3" src="https://github.com/user-attachments/assets/2a01c799-e29a-4fa4-9f57-97720c424e3a">

    
3. **의존성 주입을 통한 유연성 확보**: 프로토콜을 사용하여 런타임 환경에 맞춰 서비스를 주입할 수 있도록 설계했습니다.  
   실제 앱에서는 실제 서비스 구현체를 주입하고, 테스트 시에는 스텁 서비스를 주입하여 외부 의존성을 제거했습니다.  
   <img width="700" alt="protocol4" src="https://github.com/user-attachments/assets/eb130b40-503e-41ea-b84d-db61678ba9b4">


#### 📝 **결과**
프로토콜을 통해 서비스의 결합도를 낮추고 테스트 환경에서 유연성을 확보할 수 있었습니다. 특히, 다음과 같은 긍정적인 결과를 얻을 수 있었습니다:
- **테스트 효율성 증가**: 네트워크나 데이터베이스에 의존하지 않는 독립적인 단위 테스트가 가능해졌습니다. 이를 통해 테스트 시간이 단축되고, 안정성이 향상되었습니다.
- **유지보수 용이성**: 서비스 간의 의존성이 낮아져, 각 서비스의 변경이 다른 서비스에 미치는 영향을 최소화할 수 있었습니다.  
  새로운 기능을 추가하거나 기존 로직을 수정할 때 발생할 수 있는 오류를 줄일 수 있었습니다.
- **코드 확장성 증가**: 프로토콜을 통해 새로운 요구사항이 생길 때 기존 코드를 크게 변경하지 않고도 유연하게 확장할 수 있었습니다.  
  이로써 앱의 구조는 훨씬 더 모듈화되고 유연한 형태로 개선되었으며, 테스트 시 발생했던 다양한 문제들도 해결되었습니다.


<br>

### 5️⃣ 의존성 주입(DI Container)를 통한 모듈화 및 유지보수성 향상   

#### 🤔 **상황**
여러 뷰(View)와 뷰모델(ViewModel) 간의 의존성을 효과적으로 관리하고, 서비스 계층(UserService, AuthService 등)을 뷰모델에서 쉽게 접근할 수 있게 할 필요가 있었습니다.  
특히 사용자 인증, 데이터베이스 연동, 프로필 관리 등 다양한 비즈니스 로직을 처리하는 서비스가 많아지면서 의존성을 중앙에서 관리할 수 있는 구조가 필요했습니다.  

#### 🚨 **문제**
- **의존성 관리의 어려움**: 각 뷰모델마다 특정 서비스나 데이터베이스 클래스에 직접 의존하게 되면서, 의존성 관리가 복잡해졌고 테스트가 어려워졌습니다.
- **중복된 코드**: 여러 뷰모델에서 동일한 서비스의 인스턴스를 각각 생성하거나 직접 접근하는 코드가 중복되는 문제가 발생했습니다.
- **유지보수의 어려움**: 서비스 계층에서 작은 변경이 발생할 때마다 이를 의존하는 뷰모델들을 일일이 수정해야 하는 문제가 생겼습니다.
  
#### 🛠️ **해결 과정**
##### 1) **DI Container 설계 및 적용**

- `DIContainer`를 도입하여 의존성을 중앙에서 관리하도록 설계했습니다. DIContainer는 서비스 계층(`ServiceType`)의 인스턴스를 생성하고, 이를 필요로 하는 뷰모델이나 다른 객체에 주입하는 역할을 담당합니다.
- 이를 통해 서비스에 대한 의존성을 뷰모델에 직접 주입하지 않고, 컨테이너를 통해 관리하게 함으로써 코드의 결합도를 낮췄습니다.
<img width="300" alt="DIContainer" src="https://github.com/user-attachments/assets/5b6f6abf-e556-418f-961d-6d3f59dcaec1">


##### 2) **의존성 주입 방식 변경**

- `HomeViewModel`, `AuthenticationViewModel`, `MyProfileViewModel` 등 각 뷰모델은 이제 필요한 서비스를 DIContainer를 통해 주입받습니다.  
- 예를 들어, `HomeViewModel`은 사용자 정보를 가져오기 위해 `userService`에 의존하며, 이 서비스는 DIContainer를 통해 주입됩니다.  
- `HomeViewModel`은 홈 화면에서 필요한 사용자 정보를 가져오고 표시하는 작업만을 담당하며, 이를 위해 DIContainer에서 주입된 `userService`에 의존합니다.  
<img width="700" alt="HomeViewModel" src="https://github.com/user-attachments/assets/29aa0c12-b925-4b08-b599-d00427f7bbd1">



##### 3) **단일 책임 원칙(SRP) 준수 및 모듈화**

- 각 뷰모델은 DIContainer로부터 필요한 서비스만을 주입받아, 뷰모델의 책임을 명확히 분리했습니다.
- `AuthenticationViewModel`은 사용자 인증과 관련된 작업만, `HomeViewModel`은 홈 화면에서 사용자와 관련된 데이터만 처리하도록 하여 뷰모델 간의 역할을 명확히 구분했습니다.
<img width="700" alt="AuthenticationViewModel" src="https://github.com/user-attachments/assets/9c5d0461-cbe0-4601-95c6-eff91be4eedb">



#### 📝 **결과**
의존성을 DIContainer를 통해 주입함으로써 각 서비스의 Mock 구현체를 쉽게 대체할 수 있게 되어, 뷰모델 단위 테스트를 보다 쉽게 작성할 수 있게 되었습니다.  
예를 들어, `StubService`를 사용해 테스트 환경에서 실제 데이터베이스나 네트워크 요청 없이도 뷰모델이 정상적으로 동작하는지 확인할 수 있습니다.  
<img width="700" alt="HomeView_Previews" src="https://github.com/user-attachments/assets/84c65ccf-9c02-4bf3-938f-5ed11662de22">

<br>

### 6️⃣ 접근성 

#### 🤔 **상황**
접근성을 추가하기 전에는 VoiceOver 사용자가 애플리케이션을 탐색하거나 메시지를 보내는 과정에서 불편함이 있었습니다.  

#### 🚨 **문제**
1. **메시지 탐색의 불편함**
    - 기존 코드에서는 각 메시지에 접근성 요소가 설정되지 않아 VoiceOver가 텍스트, 날짜, 이미지 메시지 등을 명확하게 읽지 못했습니다.  
      사용자는 메시지가 언제 도착했는지, 메시지가 이미지인지 텍스트인지 구분하기 어려웠습니다.
    - 예를 들어, `ChatView`에서 텍스트와 이미지 메시지가 표시될 때 VoiceOver는 단순히 UI 요소들을 읽을 뿐, 메시지의 중요한 세부 정보(보낸 날짜, 메시지 내용 등)를 인식하지 못했습니다.
2. **프로필 접근성 부족**
    - 프로필 화면에서 **VoiceOver**는 단순히 사용자의 사진과 이름을 개별 요소로 읽어주었으나, 사용자가 프로필 사진을 눌렀을 때 어떤 동작이 발생하는지 명확하게 전달되지 않았습니다.
    - VoiceOver 사용자들이 프로필 사진을 클릭했을 때 나타나는 상호작용에 대한 힌트가 제공되지 않았습니다.
3. **탭 탐색의 어려움**
    - 상단의 도구 모음에 있는 버튼들(검색, 북마크, 설정 등)에 접근성 요소가 제대로 추가되지 않아 **VoiceOver** 사용자는 어떤 버튼이 어떤 기능을 하는지 이해하기 어려웠습니다.

#### 🛠️ **해결 과정**
##### VoiceOver 기능을 고려한 접근성 추가

1. **프로필 화면 접근성 추가**
    - 사용자가 자신의 프로필을 쉽게 확인하고 상호작용할 수 있도록 프로필 사진 및 정보에 접근성 요소를 추가했습니다.
    - `accessibilityElement(children: .combine)`을 적용하여 VoiceOver가 프로필 정보를 하나의 요소로 읽도록 했으며, "내 프로필 보기"라는 라벨을 설정하여 사용자가 이중탭으로 자신의 프로필을 열 수 있게 했습니다.  
    <img width="400" alt="접근성1" src="https://github.com/user-attachments/assets/3b76d68d-81f0-4085-8123-e81682a950bd">


2. **친구 목록 접근성 개선**
    - 친구 목록에서 각 친구 이름을 VoiceOver가 명확하게 읽을 수 있도록 설정했습니다.
    - 각 친구 항목을 버튼처럼 동작하도록 만들어, 사용자들이 탭으로 친구 프로필을 열 수 있도록 하였으며, VoiceOver를 사용한 탐색이 원활해졌습니다.
    
3. **메시지 탐색 및 전송 기능**
    - 채팅 화면에서 각 메시지에 접근성을 적용해 VoiceOver가 메시지를 적절히 읽어줄 수 있도록 구성했습니다. 특히, 각 메시지에 사용된 날짜 정보와 메시지 내용을 함께 읽을 수 있도록 접근성을 설정했습니다.
    - 이미지 메시지에 대해서도 `accessibility(addTraits: .isImage)`를 적용하여 VoiceOver가 이미지가 첨부되었음을 인식하고 적절히 안내할 수 있도록 했습니다.

#### 📝 **결과**

이러한 기능들을 통해 VoiceOver 사용자가 애플리케이션 내에서 더 쉽게 탐색할 수 있게 되었으며,  
프로필 확인, 친구 목록 탐색, 메시지 읽기 및 전송과 같은 핵심 기능을 문제없이 사용할 수 있게되었습니다.


<br>


### ᐩ CoreData를 활용한 검색어 저장 
Core Data를 활용하여 사용자의 검색 결과를 영구적으로 저장하는 기능을 구현했습니다.   

#### Core Data 구성요소
Core Data를 설정하기 위해 `NSPersistentContainer`를 사용했습니다.   
이는 **Core Data 스택을 관리하는 주요 클래스**이며, **데이터 저장소를 로드하고 관리**하는 역할을 합니다.   
이 프로젝트에서는 검색 결과를 저장하기 위한 엔티티를 `SearchResult`로 정의했습니다.   

- **`NSPersistentContainer` 초기화 코드:**
<img width="450" alt="SearchDataController" src="https://github.com/user-attachments/assets/d5f622e0-1f65-4db9-a5b2-abe37aaa1b20">


여기서 `NSPersistentContainer`는 Core Data 모델 파일 `Search.xcdatamodeld`를 로드합니다.  
`loadPersistentStores`를 호출하여 데이터베이스를 설정하고, Core Data 스토어를 로드합니다.  
이 `persistentContainer`는 이후 검색 결과를 저장하고 불러오는 데 사용됩니다.  

### **검색 결과 저장 및 삭제 기능**

검색 결과를 저장하기 위해 `NSManagedObjectContext`를 사용했습니다.  
이 컨텍스트는 **Core Data의 데이터를 관리**하며, **데이터를 저장하거나 삭제하는 작업**을 처리합니다.  

- **검색 결과 저장 코드:**
<img width="450" alt="setSearchResultWithContext" src="https://github.com/user-attachments/assets/18e53edb-017b-4d70-a407-0e14874bb09f">

- 여기서 `SearchResult`는 검색 결과를 저장하는 Core Data 엔티티입니다.  
새로운 검색 결과를 생성한 후, `objectContext.save()`를 호출하여 데이터베이스에 저장합니다.  
- `id`, `name`, `date`와 같은 속성은 각각 검색 결과의 고유 ID, 검색어, 그리고 검색한 날짜를 나타냅니다.  

검색 기록 삭제는 Core Data에서 해당 항목을 삭제한 후, `objectContext.save()`를 통해 반영합니다.  

- **검색 기록 삭제 코드:**
<img width="700" alt="objectContext delete(result)" src="https://github.com/user-attachments/assets/74576242-cc57-467c-ac75-5e51b6188602">


이 코드는 사용자가 삭제 버튼을 누를 때,  
`objectContext`에서 해당 검색 결과를 삭제하고 변경 사항을 저장하는 역할을 합니다.  

### **UI에서 검색 결과 보여주기**

**SwiftUI**와 Core Data의 **FetchRequest**를 사용하여 데이터를 불러옵니다.  

- **검색 결과 표시 UI:**

<img width="700" alt="results" src="https://github.com/user-attachments/assets/e7c3d65f-2ff7-4780-86f0-e1eb2f9003f2">

- 이 코드는 `@FetchRequest`를 사용하여 Core Data에서 저장된 검색 결과를 불러옵니다.   
`SortDescriptor`를 통해 결과를 날짜순으로 정렬하여 표시하고, 저장된 결과가 없을 경우 "검색 내역이 없습니다."라는 메시지를 출력합니다.   

### 정리

