import UIKit
protocol PoliciesView:AnyObject{func show(_ items:[Policy]);func showLoading(_ visible:Bool)}
protocol PoliciesPresenting{func viewDidLoad()}
protocol PoliciesInteracting{func fetch() async->[Policy]}
protocol PoliciesRouting{}
