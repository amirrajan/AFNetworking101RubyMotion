class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'AFNetworking101'
    rootViewController.view.backgroundColor = UIColor.whiteColor

    navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    get_json_request

    true
  end

  def get_json_request
    manager = AFHTTPSessionManager.manager
    manager.GET(
      "https://jsonplaceholder.typicode.com/posts",
      parameters:nil,
      progress:nil,
      success: lambda  do |task, responseObject|
        NSLog("JSON: %@", responseObject);
      end,
      failure: lambda do |operation, error|
        NSLog("Error: %@", error)
      end)
  end
end
