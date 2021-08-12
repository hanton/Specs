Pod::Spec.new do |s|
    s.name             = 'LibTorch-Lite-Nightly'
    s.version          = '1.11.2-nightly.20210813'
    s.authors          = 'PyTorch Team'
    s.license          = { :type => 'BSD' }
    s.homepage         = 'https://github.com/pytorch/pytorch'
    s.source           = { :http => "https://ossci-ios-build.s3.amazonaws.com/libtorch_lite_ios_nightly_1.10.0.dev20210812.zip" }
    s.summary          = 'The nightly build version of PyTorch C++ library for iOS'
    s.description      = <<-DESC
        The nightly build version of PyTorch C++ library for iOS.
    DESC
    s.ios.deployment_target = '12.0'
    s.default_subspec = 'Core'
    s.subspec 'Core' do |ss|
        ss.dependency 'LibTorch-Lite-Nightly/Torch'
        ss.source_files = 'src/*.{h,cpp,c,cc}'
        ss.public_header_files = ['src/LibTorch-Lite.h']
    end
    s.subspec 'Torch' do |ss|
        ss.header_mappings_dir = 'install/include/'
        ss.preserve_paths = 'install/include/**/*.{h,cpp,cc,c}'
        ss.vendored_libraries = 'install/lib/*.a'
        ss.libraries = ['c++', 'stdc++']
    end
    s.user_target_xcconfig = {
        'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/LibTorch-Lite-Nightly/install/include/"',
        'OTHER_LDFLAGS' => '-force_load "$(PODS_ROOT)/LibTorch-Lite-Nightly/install/lib/libtorch.a" -force_load "$(PODS_ROOT)/LibTorch-Lite-Nightly/install/lib/libtorch_cpu.a"',
        'CLANG_CXX_LANGUAGE_STANDARD' => 'c++14',
        'CLANG_CXX_LIBRARY' => 'libc++'
    }
    s.pod_target_xcconfig = {
        'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/LibTorch-Lite-Nightly/install/include/"',
        'VALID_ARCHS' => 'x86_64 arm64'
    }
    s.library = ['c++', 'stdc++']
    s.frameworks = 'Accelerate', 'MetalPerformanceShaders'
end