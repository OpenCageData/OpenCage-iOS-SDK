# OpenCageSDK

## Requirements

`OpenCageSDK` works on iOS 9+ and requires ARC to build. It depends on the following Apple frameworks, which should already be included with most Xcode templates:

* Foundation.framework

You will need the latest developer tools in order to build `OpenCageSDK`. Old Xcode versions might work, but compatibility will not be explicitly maintained.

You will also need an API key from OpenCage to initialise this SDK. The API key is retrieved from here: https://geocoder.opencagedata.com/

## Adding OpenCageSDK to your project

### CocoaPods

[CocoaPods](http://cocoapods.org) is the recommended way to add OpenCageSDK to your project.

1. Add a pod entry for OpenCageSDK to your Podfile `pod 'OpenCageSDK'`
2. Install the pod(s) by running `pod install`
3. Include OpenCageSDK wherever you need it with `@import OpenCageSDK`

### Source files

Alternatively you can directly add the source files to your project, they are found under OpenCageSDK/Classes.

1. Download the [latest code version](https://github.com/OpenCageData/OpenCage-iOS-SDK) or add the repository as a git submodule to your git-tracked project.
2. Open your project in Xcode, then drag and drop the classes onto your project (use the "Product Navigator view"). Make sure to select Copy items when asked if you extracted the code archive outside of your project.

### Static library

You can also add OpenCageSDK as a static library to your project or workspace.

1. Download the [latest code version](https://github.com/OpenCageData/OpenCage-iOS-SDK) or add the repository as a git submodule to your git-tracked project.
2. Open your project in Xcode, then drag and drop `OpenCageSDK.xcodeproj` onto your project or workspace (use the "Product Navigator view").
3. Select your target and go to the Build phases tab. In the Link Binary With Libraries section select the add button. On the sheet find and add `OpenCageSDK`. You might also need to add `OpenCageSDK` to the Target Dependencies list.
4. In Objective-C you may need to include OpenCageSDK with `#import [yourprojectname]-swift.h`.

## Usage

OpenCageSDK is built on top of NSURLSession with a completionBlock so the network requests happen on a background thread, for setting up the SDK there is a convenience initialiser. 

```Swift
let ocSDK :OCSDK = OCSDK(apiKey: "YOUR-API-KEY")
```

```Objective-C
OCSDK *sdk = [[OCSDK alloc] initWithApiKey:@"YOUR-API-KEY"];
```

Reverse Geocoding is done through the method below, any errors with the request are on the completionBlock 'error'. The response  from the server is parsed into objects for ease of access.

```Swift
let ocSDK :OCSDK = OCSDK(apiKey: "YOUR-API-KEY")
ocSDK.reverseGeocode(latitude: NSNumber(value: 51.5159), longitude: NSNumber(value: 0.1297), withAnnotations: true) { (response, success, error) in
    if success {
		//Successful payload response
    }
}
```

```Objective-C
OCSDK *sdk = [[OCSDK alloc] initWithApiKey:@"YOUR-API-KEY"];
[sdk reverseGeocodeWithLatitude:@(51.5159) longitude:@(0.1297) withAnnotations:YES completionBlock:^(OCGeoResponse * _Nonnull response, BOOL success, NSError * _Nullable error) {
    if (success) {
        // Successful payload response
    }
}];
```

Forward Geocoding is done through the method below, any errors with the request are on the completionBlock 'error'. The response  from the server is parsed into objects for ease of access.

```Swift
let ocSDK :OCSDK = OCSDK(apiKey: "YOUR-API-KEY")
ocSDK.forwardGeocode(address: "3 Walls Court, Tewkesbury, England", withAnnotations: true) { (response, success, error) in
	if success {
		//Successful payload response
	}
}
```

```Objective-C
OCSDK *sdk = [[OCSDK alloc] initWithApiKey:@"YOUR-API-KEY"];
[sdk forwardGeocodeWithAddress:@"3 Walls Court, Tewkesbury, England" withAnnotations:YES completionBlock:^(OCGeoResponse * _Nonnull response, BOOL success, NSError * _Nullable error) {
    if (success) {
        // Successful payload response
    }
}];
```

Documentation is provided in the OCSDK.swift file as well.

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).
