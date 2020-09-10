use_frameworks!
platform :ios, '11.0'

target 'Githuber' do
    pod 'Moya/RxSwift'
    pod 'Kingfisher'
    pod 'R.swift'
    pod 'RxAlertViewable'
    pod 'RxBinding'
    pod 'RxCocoa'
    pod 'RxController'
    pod 'RxDataSourcesSingleSection'
    pod 'RxFlow'
    pod 'RxKeyboard'
    pod 'RxSwift'
    pod 'SnapKit'

    target 'GithuberTests' do
        inherit! :search_paths

        pod 'RxBlocking'
    end

end



post_install do |installer|
    system("bash #{Pathname(installer.sandbox.root)}/RxController/rxtree/build_for_xcode.sh")
end
